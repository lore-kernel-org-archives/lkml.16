Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193132940B
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 05:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748064282; cv=none; b=lrodOiO0BaS5zhL1ZGhq52HUJFc8kawdrg0NA4DzhPfl5UfvOjI3CqxDe7K3ubIfekDzoHydEHoPYZJsBI35qU21/m2noyBQr2HiVXtMAR0Rb4EhtfM3yLViPLUfjh1x3q4zWVCXdJabHoWV4g34GrYKLsskUepE5Cu05Qar3Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748064282; c=relaxed/simple;
	bh=GiaLSpO69si5cY+HnmouRhCWSgnl5QXjVkwFa+gH73A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JLgjvAlHHQPxbqNXcoaFj6Iaw7NRkcnjHoPFepqPSLJ1vvWIP2E/PzjiN+e39TNCs//hE+nU9WUZ3NurY8JEi6AagbxDOgpSIuNT/UVmApHdgiLYM/av/gWnM/n3RF3DcuraAM8mi29Ao8Q6OVty3vtmw3DsHyQMy/se2LlBhoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+W6bXbZ; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+W6bXbZ"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e740a09eb00so446395276.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 22:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748064280; x=1748669080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bfdLlZW9vW98y4u4S7T97dVouVxcWz8Fq/nuepj4wa8=;
        b=W+W6bXbZaQHEQbitMcs81U7wX9P2qCwA0Cu59PNOw8LKlYHVSc9uh/f5VCK6tyxhE9
         riFqs/DL1xBQJB7hK1wwg1hbTPLUrO5dhMcjcSz6sVKo9VwdO4xPST+gef4Uch/KGoT9
         dlAkl6nXj7PwC/geZpQq9T7pGZzkSj7ialJPmHyxUTIuTX72AKDW4UHPm3Vi4CmYeUu2
         26XDcXmjQXgPK8WWBT/ug8sW29uqrA1bsEx3oAExmBZCKihF+XSVdzIS/yzSgTfVInJz
         CfXqH6Pk23bAxrszbzhIYppleZBxazJNpjLxV2EBZoznMK1Zs4WgUFdsv/E9B5hf4Y+M
         BrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748064280; x=1748669080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfdLlZW9vW98y4u4S7T97dVouVxcWz8Fq/nuepj4wa8=;
        b=uJAPMbrl8U43L621XpMSWRelV66hKIyujYrGWEeHRg79HnkZKhvWIYhDpug8sSIQey
         0+t9VwO8QTVFv8Zamv6dVyj/08A2Z83Q5fVQEm3Rd4kJoH9C033jH6Sdwe+YvoJaVbVo
         oGc8mKdMHFCGIzagnvMtTJSxjXpm6VCKrvO6U74oguqbf9PPzH4P7E4uc/vctnfW3w0l
         nM6IVMQCfmvKvCXCxzY9SHb5K1ug91DtUfzgsL7hE63n4ymJ8VTmlCJ4vnOhPtqpzrfi
         kRB4LPPfzjjTdvIfUhxRDLsJbxfPT+1qsdt7v+HXmtmLIZmP7IHqG5nw8rGfWq6qT5zT
         bl5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwlTB7On7kKS4wnBdEfLQ6e6Kop6p7IEQs95yJSAz8s7R1on9U57eHlD1XBuoFudQWbqFxVNTbTqMD8g0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvBGDZKwAl1PaMdVvoz9bxc7ugzzP9tqYcWnaZb1TrWdLTQVpV
	keUqbE9vyNHD3JtuFkvc4VLaUpY912j0qdEIrcfKFfNPDAJXBQDOpQUh
X-Gm-Gg: ASbGncvyH+/43b81wiunkYcXpCLl1zLh5ZevOEfZt3rUI1/B1NJqXNhXj93Fi6dl/Sx
	LgTuUtN2TM0c6xGyYaodNe5jtGDTzW1StNd7Q1028/lkD2ebs69c0wNL49lViRG4ksczj6BR+ZY
	eYtpULr/1HxewvoIGTmiAeL39MxmszAkYRg5xEuw/bMYWAarhEQSNEngyH/uVfMjQOvhImdxI3A
	O+PvAVk5ZPJQ0q2fI3bjZcuUl5ZK/MTHVsMkLIhd4ZX0NIVny6vJ5YDIApQnmWT1ZJvR/BCcNf+
	FvOpBZuKL2KLtZQ91yo9AzzcV6C8DYYKdGNC2CcGlhxvb85wjvV8UoslBBtYNk5Z55D+uF1Xh+T
	OqVgU
X-Google-Smtp-Source: AGHT+IHIlIVKc+RK333O87ahPa6hVP3F8/RzrvVmknd8RsaXqksMeGR+0xcL2eRmqxTuaWVuOqcxsQ==
X-Received: by 2002:a05:6902:270a:b0:e71:2a10:8fd with SMTP id 3f1490d57ef6-e7d919d9b0amr2194807276.26.1748064279911;
        Fri, 23 May 2025 22:24:39 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.249.162])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7d9233f7absm334970276.34.2025.05.23.22.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 22:24:38 -0700 (PDT)
From: Donny Turizo <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny Turizo <donnyturizo13@gmail.com>
Subject: [PATCH v5] staging: rtl8723bs: rename _Read_EEPROM and other functions to snake_case
Date: Sat, 24 May 2025 05:24:32 +0000
Message-ID: <20250524052432.19125-1-donnyturizo13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renamed _Read_EEPROM and several other functions in rtw_cmd.c to follow
the kernel coding style (snake_case). This fixes checkpatch warnings
related to naming conventions.

Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>

---
v2: Initial patch rejected by the robot due to naming issues.

v3: Rebased the patch onto GregKH's staging branch for better integration.

v4: Changed the commit author to my name and renamed all remaining functions
    to snake_case following kernel coding style.

v5: Renamed command _set_h2c_Lbk to _set_h2c_lbk to fix CamelCase issue.
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 140 +++++++++---------
 drivers/staging/rtl8723bs/include/rtw_cmd.h   |   2 +-
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |   2 +-
 3 files changed, 72 insertions(+), 72 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 49bcefb5e8d2..1049d83ca4db 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -11,76 +11,76 @@
 static struct _cmd_callback rtw_cmd_callback[] = {
 	{GEN_CMD_CODE(_read_macreg), NULL}, /*0*/
 	{GEN_CMD_CODE(_write_macreg), NULL},
-	{GEN_CMD_CODE(_Read_BBREG), &rtw_getbbrfreg_cmdrsp_callback},
-	{GEN_CMD_CODE(_Write_BBREG), NULL},
-	{GEN_CMD_CODE(_Read_RFREG), &rtw_getbbrfreg_cmdrsp_callback},
-	{GEN_CMD_CODE(_Write_RFREG), NULL}, /*5*/
-	{GEN_CMD_CODE(_Read_EEPROM), NULL},
-	{GEN_CMD_CODE(_Write_EEPROM), NULL},
-	{GEN_CMD_CODE(_Read_EFUSE), NULL},
-	{GEN_CMD_CODE(_Write_EFUSE), NULL},
-
-	{GEN_CMD_CODE(_Read_CAM),	NULL},	/*10*/
-	{GEN_CMD_CODE(_Write_CAM),	 NULL},
-	{GEN_CMD_CODE(_setBCNITV), NULL},
-	{GEN_CMD_CODE(_setMBIDCFG), NULL},
-	{GEN_CMD_CODE(_JoinBss), &rtw_joinbss_cmd_callback},  /*14*/
-	{GEN_CMD_CODE(_DisConnect), &rtw_disassoc_cmd_callback}, /*15*/
-	{GEN_CMD_CODE(_CreateBss), &rtw_createbss_cmd_callback},
-	{GEN_CMD_CODE(_SetOpMode), NULL},
-	{GEN_CMD_CODE(_SiteSurvey), &rtw_survey_cmd_callback}, /*18*/
-	{GEN_CMD_CODE(_SetAuth), NULL},
-
-	{GEN_CMD_CODE(_SetKey), NULL},	/*20*/
-	{GEN_CMD_CODE(_SetStaKey), &rtw_setstaKey_cmdrsp_callback},
-	{GEN_CMD_CODE(_SetAssocSta), &rtw_setassocsta_cmdrsp_callback},
-	{GEN_CMD_CODE(_DelAssocSta), NULL},
-	{GEN_CMD_CODE(_SetStaPwrState), NULL},
-	{GEN_CMD_CODE(_SetBasicRate), NULL}, /*25*/
-	{GEN_CMD_CODE(_GetBasicRate), NULL},
-	{GEN_CMD_CODE(_SetDataRate), NULL},
-	{GEN_CMD_CODE(_GetDataRate), NULL},
-	{GEN_CMD_CODE(_SetPhyInfo), NULL},
-
-	{GEN_CMD_CODE(_GetPhyInfo), NULL}, /*30*/
-	{GEN_CMD_CODE(_SetPhy), NULL},
-	{GEN_CMD_CODE(_GetPhy), NULL},
-	{GEN_CMD_CODE(_readRssi), NULL},
-	{GEN_CMD_CODE(_readGain), NULL},
-	{GEN_CMD_CODE(_SetAtim), NULL}, /*35*/
-	{GEN_CMD_CODE(_SetPwrMode), NULL},
-	{GEN_CMD_CODE(_JoinbssRpt), NULL},
-	{GEN_CMD_CODE(_SetRaTable), NULL},
-	{GEN_CMD_CODE(_GetRaTable), NULL},
-
-	{GEN_CMD_CODE(_GetCCXReport), NULL}, /*40*/
-	{GEN_CMD_CODE(_GetDTMReport),	NULL},
-	{GEN_CMD_CODE(_GetTXRateStatistics), NULL},
-	{GEN_CMD_CODE(_SetUsbSuspend), NULL},
-	{GEN_CMD_CODE(_SetH2cLbk), NULL},
-	{GEN_CMD_CODE(_AddBAReq), NULL}, /*45*/
-	{GEN_CMD_CODE(_SetChannel), NULL},		/*46*/
-	{GEN_CMD_CODE(_SetTxPower), NULL},
-	{GEN_CMD_CODE(_SwitchAntenna), NULL},
-	{GEN_CMD_CODE(_SetCrystalCap), NULL},
-	{GEN_CMD_CODE(_SetSingleCarrierTx), NULL},	/*50*/
-
-	{GEN_CMD_CODE(_SetSingleToneTx), NULL}, /*51*/
-	{GEN_CMD_CODE(_SetCarrierSuppressionTx), NULL},
-	{GEN_CMD_CODE(_SetContinuousTx), NULL},
-	{GEN_CMD_CODE(_SwitchBandwidth), NULL},		/*54*/
-	{GEN_CMD_CODE(_TX_Beacon), NULL},/*55*/
-
-	{GEN_CMD_CODE(_Set_MLME_EVT), NULL},/*56*/
-	{GEN_CMD_CODE(_Set_Drv_Extra), NULL},/*57*/
-	{GEN_CMD_CODE(_Set_H2C_MSG), NULL},/*58*/
-	{GEN_CMD_CODE(_SetChannelPlan), NULL},/*59*/
-
-	{GEN_CMD_CODE(_SetChannelSwitch), NULL},/*60*/
-	{GEN_CMD_CODE(_TDLS), NULL},/*61*/
-	{GEN_CMD_CODE(_ChkBMCSleepq), NULL}, /*62*/
-
-	{GEN_CMD_CODE(_RunInThreadCMD), NULL},/*63*/
+	{GEN_CMD_CODE(_read_bbreg), &rtw_getbbrfreg_cmdrsp_callback},
+	{GEN_CMD_CODE(_write_bbreg), NULL},
+	{GEN_CMD_CODE(_read_rfreg), &rtw_getbbrfreg_cmdrsp_callback},
+	{GEN_CMD_CODE(_write_rfreg), NULL}, /*5*/
+	{GEN_CMD_CODE(_read_eeprom), NULL},
+	{GEN_CMD_CODE(_write_eeprom), NULL},
+	{GEN_CMD_CODE(_read_efuse), NULL},
+	{GEN_CMD_CODE(_write_efuse), NULL},
+
+	{GEN_CMD_CODE(_read_cam),	NULL},	/*10*/
+	{GEN_CMD_CODE(_write_cam),	 NULL},
+	{GEN_CMD_CODE(_set_bcnitv), NULL},
+	{GEN_CMD_CODE(_set_mbidcfg), NULL},
+	{GEN_CMD_CODE(_join_bss), &rtw_joinbss_cmd_callback},  /*14*/
+	{GEN_CMD_CODE(_disconnect), &rtw_disassoc_cmd_callback}, /*15*/
+	{GEN_CMD_CODE(_create_bss), &rtw_createbss_cmd_callback},
+	{GEN_CMD_CODE(_set_op_mode), NULL},
+	{GEN_CMD_CODE(_site_survey), &rtw_survey_cmd_callback}, /*18*/
+	{GEN_CMD_CODE(_set_auth), NULL},
+
+	{GEN_CMD_CODE(_set_key), NULL},	/*20*/
+	{GEN_CMD_CODE(_set_sta_key), &rtw_setstaKey_cmdrsp_callback},
+	{GEN_CMD_CODE(_set_assoc_sta), &rtw_setassocsta_cmdrsp_callback},
+	{GEN_CMD_CODE(_del_assoc_sta), NULL},
+	{GEN_CMD_CODE(_set_sta_pwr_state), NULL},
+	{GEN_CMD_CODE(_set_basic_rate), NULL}, /*25*/
+	{GEN_CMD_CODE(_get_basic_rate), NULL},
+	{GEN_CMD_CODE(_set_data_rate), NULL},
+	{GEN_CMD_CODE(_get_data_rate), NULL},
+	{GEN_CMD_CODE(_set_phy_info), NULL},
+
+	{GEN_CMD_CODE(_get_phy_info), NULL}, /*30*/
+	{GEN_CMD_CODE(_set_phy), NULL},
+	{GEN_CMD_CODE(_get_phy), NULL},
+	{GEN_CMD_CODE(_read_rssi), NULL},
+	{GEN_CMD_CODE(_read_gain), NULL},
+	{GEN_CMD_CODE(_set_atim), NULL}, /*35*/
+	{GEN_CMD_CODE(_set_pwr_mode), NULL},
+	{GEN_CMD_CODE(_joinbss_rpt), NULL},
+	{GEN_CMD_CODE(_set_ra_table), NULL},
+	{GEN_CMD_CODE(_get_ra_table), NULL},
+
+	{GEN_CMD_CODE(_get_ccx_report), NULL}, /*40*/
+	{GEN_CMD_CODE(_get_dtm_report),	NULL},
+	{GEN_CMD_CODE(_get_tx_rate_statistics), NULL},
+	{GEN_CMD_CODE(_set_usb_suspend), NULL},
+	{GEN_CMD_CODE(_set_h2c_Lbk), NULL},
+	{GEN_CMD_CODE(_add_ba_req), NULL}, /*45*/
+	{GEN_CMD_CODE(_set_channel), NULL},		/*46*/
+	{GEN_CMD_CODE(_set_tx_power), NULL},
+	{GEN_CMD_CODE(_switch_antenna), NULL},
+	{GEN_CMD_CODE(_set_crystal_cap), NULL},
+	{GEN_CMD_CODE(_set_single_carrier_tx), NULL},	/*50*/
+
+	{GEN_CMD_CODE(_set_single_tone_tx), NULL}, /*51*/
+	{GEN_CMD_CODE(_set_carrier_suppression_tx), NULL},
+	{GEN_CMD_CODE(_set_continuous_tx), NULL},
+	{GEN_CMD_CODE(_switch_bandwidth), NULL},		/*54*/
+	{GEN_CMD_CODE(_tx_beacon), NULL},/*55*/
+
+	{GEN_CMD_CODE(_set_mlme_evt), NULL},/*56*/
+	{GEN_CMD_CODE(_set_drv_extra), NULL},/*57*/
+	{GEN_CMD_CODE(_set_h2c_msg), NULL},/*58*/
+	{GEN_CMD_CODE(_set_channel_plan), NULL},/*59*/
+
+	{GEN_CMD_CODE(_set_channel_switch), NULL},/*60*/
+	{GEN_CMD_CODE(_tdls), NULL},/*61*/
+	{GEN_CMD_CODE(_chk_bmc_sleepq), NULL}, /*62*/
+
+	{GEN_CMD_CODE(_run_in_thread_cmd), NULL},/*63*/
 };
 
 static struct cmd_hdl wlancmds[] = {
diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index cb44119ce9a9..e4e7e350d0fc 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -636,7 +636,7 @@ enum {
 	GEN_CMD_CODE(_Write_BBREG),
 	GEN_CMD_CODE(_Read_RFREG),
 	GEN_CMD_CODE(_Write_RFREG), /*5*/
-	GEN_CMD_CODE(_Read_EEPROM),
+	GEN_CMD_CODE(_read_eeprom),
 	GEN_CMD_CODE(_Write_EEPROM),
 	GEN_CMD_CODE(_Read_EFUSE),
 	GEN_CMD_CODE(_Write_EFUSE),
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 2080408743ef..63373d665d4f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -684,7 +684,7 @@ enum {
 	GEN_EVT_CODE(_Read_MACREG) = 0, /*0*/
 	GEN_EVT_CODE(_Read_BBREG),
 	GEN_EVT_CODE(_Read_RFREG),
-	GEN_EVT_CODE(_Read_EEPROM),
+	GEN_EVT_CODE(_read_eeprom),
 	GEN_EVT_CODE(_Read_EFUSE),
 	GEN_EVT_CODE(_Read_CAM),			/*5*/
 	GEN_EVT_CODE(_Get_BasicRate),
-- 
2.43.0

