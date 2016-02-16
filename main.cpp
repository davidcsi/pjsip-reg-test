/* 
 * File:   main.cpp
 * Author: david
 *
 * Created on November 24, 2014, 10:40 PM
 */

#define THIS_FILE "APP"
 
#define SIP_DOMAIN "domain.com"
#define SIP_USER "1234"
#define SIP_PASSWD "password"

#include <iostream>
#include <sstream>
/*
#include "/Users/david/pjproject-2.3/pjsip/include/pjsua-lib/pjsua.h"
*/
#include "pjsua-lib/pjsua.h"

using namespace std; 

static void on_incoming_call(pjsua_acc_id acc_id, pjsua_call_id call_id, pjsip_rx_data *rdata);

/* Callback called by the library upon receiving incoming call */
static void on_incoming_call(pjsua_acc_id acc_id, pjsua_call_id call_id, pjsip_rx_data *rdata)
{
    pjsua_call_info ci;
    

    PJ_UNUSED_ARG(acc_id);
    PJ_UNUSED_ARG(rdata);

    pjsua_call_get_info(call_id, &ci);

    PJ_LOG(3,(THIS_FILE, "Incoming call from %.*s!!", (int)ci.remote_info.slen, ci.remote_info.ptr));

    /* Automatically answer incoming calls with 200/OK */
    pjsua_call_answer(call_id, 200, NULL, NULL);
}

/* Callback for registration */
static void on_reg_state(pjsua_call_id acc_id)
{
    pjsua_acc_info accinfo;
    pjsua_acc_config cfg;
    
    pjsua_acc_get_info(acc_id, &accinfo);
    PJ_LOG(3,(THIS_FILE,"Reg state changed for account %d : %d",acc_id,accinfo.status));
    if( accinfo.status == 200 )
    {
        PJ_LOG(3,(THIS_FILE,"Account %s registered properly", accinfo.acc_uri));
        cout << "account user data: " << pjsua_acc_get_user_data( 0 ) << endl;
    }

    
    /*
    if (ci.state_text == PJSUA_CALL_MEDIA_ACTIVE) {
        // When media is active, connect call to sound device.
        pjsua_conf_connect(ci.conf_slot, 0);
        pjsua_conf_connect(0, ci.conf_slot);
    } 
    */   
}

/* Callback called by the library when call's state has changed */
static void on_call_state(pjsua_call_id call_id, pjsip_event *e)
{
    pjsua_call_info ci;

    PJ_UNUSED_ARG(e);

    pjsua_call_get_info(call_id, &ci);
    PJ_LOG( 3,(THIS_FILE, "Call %d state=%.*s", call_id, (int)ci.state_text.slen, ci.state_text.ptr) );
}
 
/* Callback called by the library when call's media state has changed */
static void on_call_media_state(pjsua_call_id call_id)
{
    pjsua_call_info ci;

    pjsua_call_get_info(call_id, &ci);

    if (ci.media_status == PJSUA_CALL_MEDIA_ACTIVE) {
        // When media is active, connect call to sound device.
        pjsua_conf_connect(ci.conf_slot, 0);
        pjsua_conf_connect(0, ci.conf_slot);
    }
}
 
/* Display error and exit application */
static void error_exit(const char *title, pj_status_t status)
{
    pjsua_perror(THIS_FILE, title, status);
    pjsua_destroy();
    exit(1);
}

/*
  * main()
  *
  * argv[1] may contain URL to call.
  */
int main(int argc, char *argv[])
{
    pjsua_acc_id acc_id;
    pj_status_t status;

    /* Create pjsua first! */
    status = pjsua_create();
    if (status != PJ_SUCCESS) error_exit("Error in pjsua_create()", status);

    /* If argument is specified, it's got to be a valid SIP URL */
    if (argc > 1) {
        status = pjsua_verify_url(argv[1]);
        if (status != PJ_SUCCESS) error_exit("Invalid URL in argv", status);
    }

    /* Init pjsua */
    {
        pjsua_config cfg;
        pjsua_logging_config log_cfg;

        pjsua_config_default(&cfg);
        cfg.cb.on_incoming_call = &on_incoming_call;
        cfg.cb.on_call_media_state = &on_call_media_state;
        cfg.cb.on_call_state = &on_call_state;
        cfg.cb.on_reg_state = &on_reg_state;
        pjsua_logging_config_default(&log_cfg);
        log_cfg.console_level = 4;

        status = pjsua_init(&cfg, &log_cfg, NULL);
        if (status != PJ_SUCCESS) error_exit("Error in pjsua_init()", status);
    }

    /* Add TCP transport... Please remember to add ";transport=tcp" to the registration uri (and INVITE) */
    {
        pjsua_transport_config cfg;

        pjsua_transport_config_default(&cfg);
        cfg.port = 5060;
        status = pjsua_transport_create(PJSIP_TRANSPORT_TCP, &cfg, NULL);
        if (status != PJ_SUCCESS) error_exit("Error creating transport", status);
    }

    /* Initialization is done, now start pjsua */
    status = pjsua_start();
    if (status != PJ_SUCCESS) error_exit("Error starting pjsua", status);

    /* Register to SIP server by creating SIP account. */
    for( long int count=40983401; count <= 40983402; count++ )
    {
        stringstream strs, username_strm;
        strs << "sip:" << count << "@domain.com";
        username_strm << count;
        
        string act_id = strs.str();
        string username_tmp = username_strm.str();
        
        char* account_id = (char*) act_id.c_str();
        char* user_id = (char*) username_tmp.c_str();
        
        pjsua_acc_config cfg;

        pjsua_acc_config_default(&cfg);
        cfg.id = pj_str( account_id );
        cfg.reg_uri = pj_str("sip:" SIP_DOMAIN ";transport=tcp");
        cfg.cred_count = 1;
        cfg.cred_info[0].realm = pj_str(SIP_DOMAIN);
        cfg.cred_info[0].scheme = pj_str("digest");
        cfg.cred_info[0].username = pj_str( user_id );
        cfg.cred_info[0].data_type = PJSIP_CRED_DATA_PLAIN_PASSWD;
        cfg.cred_info[0].data = pj_str(SIP_PASSWD);

        status = pjsua_acc_add(&cfg, PJ_TRUE, &acc_id);
        if (status != PJ_SUCCESS) error_exit("Error adding account", status);



    }

    
    /* If URL is specified, make call to the URL. */
    //if (argc > 1) {
        pj_str_t uri = pj_str("1234@domain.com");
        status = pjsua_call_make_call(acc_id, &uri, 0, NULL, NULL, NULL);
        if (status != PJ_SUCCESS) error_exit("Error making call", status);
    //}

    /* Wait until user press "q" to quit. */
    for (;;) {
    char option[10];

    puts("Press 'h' to hangup all calls, 'q' to quit");
    if (fgets(option, sizeof(option), stdin) == NULL) {
        puts("EOF while reading stdin, will quit now..");
        break;
    }

    if (option[0] == 'q')
    break;

    if (option[0] == 'h')
    pjsua_call_hangup_all();
    }

    /* Destroy pjsua */
    pjsua_destroy();

    return 0;
}
