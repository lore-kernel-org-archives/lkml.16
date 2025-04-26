Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8694414
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 23:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745709644; cv=none; b=BEdCxLPJk0Cr4NuBmNz24HEF3W1fqT4aoJFXMowI/Pq2ayzt8wdwks6YSRGMjQ1A6LrKl7hbofbsoRGYsOGA0/esfIKr5zgkQFphwZGM/DcJIMAHioil+kG/lk/q97tFN8NbbFcn0iPgXSEWDCry/k66gOg3dOOVcNrWtorGQs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745709644; c=relaxed/simple;
	bh=3gRALo5hT/CQuOs/HVYLYiUzpAZy1ZLS30xFzsRdhsc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bBjmEuqqWcu+eOkhHK8WE1ulItcKA6/A1k5P22lApVPFm3wHHIEd/+U9qqYORJTtjvFxsBVFTZHqz36o4o51JmBiPXyAfnP4Cgqnfu1J5/lr5EpCviSLlxxkEU5yU87il9uxva454Aswf9VwoalYj+DDzzhV8Vz01DX8WLyAsPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=simulevski.at; spf=pass smtp.mailfrom=simulevski.at; dkim=pass (2048-bit key) header.d=simulevski.at header.i=@simulevski.at header.b=ZMkDMOk7; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=simulevski.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=simulevski.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=simulevski.at header.i=@simulevski.at header.b="ZMkDMOk7"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so4519948a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 16:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=simulevski.at; s=google; t=1745709636; x=1746314436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QrfXQupoeFQDRu7+cqYPYXl2MsmV/47CMK3eB1isE2E=;
        b=ZMkDMOk7sc++zBFnf8rUYyhLtH4BGrpGuRycvKsD1u7tfxVqI2eQDM2HgE+OiDQTRW
         N0C0hNTwuFK2GNIbaRmsbR5hbIXfxC8H0YfxmyJq5GimJG8IqowiWUjOaBXqHreDkmr6
         PBnnaHa172MBFbCaDXjl2aclHX/kwmdfqg03bsuA4q+GNGR7BLWjn7G1IiEn84HrmOUm
         u4lUo+3dTJgsknUQzxkC4T6UO23aTxLm7ecHMasmt8AInjL78XnqghqCktEtQgqLi9lg
         FvakuWDdDV9T3gR0fwpspDnmCJ0ijpS6TIgZUuknJ0XnE/ixs78k3xEztwS56jYD1PAk
         kP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745709636; x=1746314436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QrfXQupoeFQDRu7+cqYPYXl2MsmV/47CMK3eB1isE2E=;
        b=a+iAf545rno05fLknhBCS3Rv2HaMOd1sU3XV8r+bJAVJGslM3ic5hgGQzLiFlHhXV6
         dKxt1r5Cqyu3fI7ppurtSr9sPUUcH38kK2r0s6Ddc9ID9b28XkrRPk8O07wImc+WqbvM
         yUTpPoNLx/xI+rpvAqdG/wAMA957TaohrVos5zyr1KSXcI/05tceomrBuA18/Le3P5V5
         FL5rIwvGnuWk057g/b0Lz4v0uGJDqLyf9y7dUjIHBuNZ9ImvlbPZmgEf9nAn+YTx8IT6
         raL0NGQCT/oRVuZiPRoxegDdV39+uM2wLVAV4xViI9WCMZn2uG7vNT3mfUE47TwJ7IJ+
         9PkA==
X-Forwarded-Encrypted: i=1; AJvYcCUvpFctHSfYdksc09peQmhTEkpQiLxIw4YOFkDhD9zTPfKsHNYmLab+HfutK6yNS8/C2DbpCkmRL+hNX8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeD7bLcrPjUNjmaTy84w+BneIvUVgF0MUlUKnxYDe4o/fj8NeI
	qXZf4AfHS9kPmaH0EZD4Nb+q4ntQnFd/V/ltW5FQFVdNb2ENqnWgstv44EEl5ns=
X-Gm-Gg: ASbGncvnetWhYE5e7iXtq+GcH3otSTCI8rau2hQnKcuT5Un173z3q4WWx0UvBIXc/qq
	1485r9rrPxfsDRyGO0blnoHQBshbCya7VgrLGvgAwl2AgT9cpqS7lEWVBc1SVXChPrbxpMJUe68
	PKqGGoe1LOhp4snAb5IHzJvb0NTQ0VT3LawAEuwrABZk2fg/CrBvyKriraEj0z91P04jjzQU8OB
	CiYd1YEZXuHpAvT+/YxdH8W6TZuZay1DJbGsYyG1Qn6yShe4VhTyxhpMx9eXjoRiMQL6Bn6L9Qm
	IsU/x29YkQMYkUm4VHGhwEa42ybfu8gPQ2lt6PH7v67TIcWPApMw2Wt9LmNL45cGxnU=
X-Google-Smtp-Source: AGHT+IE1rCqPEcLlcfAyl8pRC+v+wxEcHkQH68V7flK1DEr9r1VMaNTL9UPdFohPC6KqsC5RaHD/BA==
X-Received: by 2002:a05:6402:5186:b0:5ed:89f0:27fd with SMTP id 4fb4d7f45d1cf-5f722b6e466mr6000669a12.19.1745709635301;
        Sat, 26 Apr 2025 16:20:35 -0700 (PDT)
Received: from fedora.home.simulevski.at ([91.65.134.65])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f6811sm3346091a12.47.2025.04.26.16.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 16:20:34 -0700 (PDT)
From: Ariel Simulevski <ariel@simulevski.at>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ariel Simulevski <ariel@simulevski.at>
Subject: [PATCH] staging: rtl8723bs: Fix CamelCase and coding style issues across driver
Date: Sun, 27 Apr 2025 01:20:01 +0200
Message-ID: <20250426232032.193306-1-ariel@simulevski.at>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a resend of the patch with the correct CC to linux-staging@lists.linux.dev.
No changes to the patch itself.

This patch renames several functions and variables from CamelCase
to snake_case across the rtl8723bs driver, in accordance with the
Linux kernel coding style guidelines.

It also addresses various minor coding style warnings reported
by checkpatch.pl, including line length violations, missing spaces,
and other formatting cleanups.

No functional changes were made.

Signed-off-by: Ariel Simulevski <ariel@simulevski.at>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c       | 391 +++++++-----------
 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |   2 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  22 +-
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  12 +-
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  14 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  32 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  70 ++--
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |   2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  12 +-
 drivers/staging/rtl8723bs/core/rtw_security.c |  22 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  16 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  30 +-
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |   2 +-
 drivers/staging/rtl8723bs/hal/hal_com.c       |   2 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c      |   2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |   2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |   2 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  10 +-
 drivers/staging/rtl8723bs/include/ieee80211.h |   6 +-
 .../staging/rtl8723bs/include/rtw_btcoex.h    |   2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |  12 +-
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  10 +-
 .../staging/rtl8723bs/include/rtw_security.h  |  30 +-
 drivers/staging/rtl8723bs/include/rtw_xmit.h  |   2 +-
 drivers/staging/rtl8723bs/include/sta_info.h  |   4 +-
 .../staging/rtl8723bs/include/wlan_bssdef.h   |  16 +-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 136 +++---
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c |  16 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  10 +-
 29 files changed, 392 insertions(+), 497 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 50022bb5911e..4d0a40200564 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -258,12 +258,11 @@ void expire_timeout_chk(struct adapter *padapter)
 		} else {
 			/* TODO: Aging mechanism to digest frames in sleep_q to */
 			/* avoid running out of xmitframe */
-			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt)
-				&& padapter->xmitpriv.free_xmitframe_cnt < ((
-					NR_XMITFRAME / pstapriv->asoc_list_cnt
-				) / 2)
-			)
+			if (psta->sleepq_len > (NR_XMITFRAME / pstapriv->asoc_list_cnt) &&
+			    padapter->xmitpriv.free_xmitframe_cnt <
+			    ((NR_XMITFRAME / pstapriv->asoc_list_cnt) / 2)) {
 				wakeup_sta_to_xmit(padapter, psta);
+			}
 		}
 	}
 
@@ -320,9 +319,9 @@ void expire_timeout_chk(struct adapter *padapter)
 	associated_clients_update(padapter, updated);
 }
 
-void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
+void add_ratid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 {
-	unsigned char sta_band = 0, shortGIrate = false;
+	unsigned char sta_band = 0, short_gi_rate = false;
 	unsigned int tx_ra_bitmap = 0;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_bssid_ex
@@ -337,7 +336,7 @@ void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 	rtw_hal_update_sta_rate_mask(padapter, psta);
 	tx_ra_bitmap = psta->ra_mask;
 
-	shortGIrate = query_ra_short_GI(psta);
+	short_gi_rate = query_ra_short_GI(psta);
 
 	if (pcur_network->configuration.ds_config > 14) {
 		sta_band |= WIRELESS_INVALID;
@@ -360,7 +359,7 @@ void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 
 		arg[0] = psta->mac_id;
 		arg[1] = psta->raid;
-		arg[2] = shortGIrate;
+		arg[2] = short_gi_rate;
 		arg[3] = psta->init_rate;
 
 		rtw_hal_add_ra_tid(padapter, tx_ra_bitmap, arg, rssi_level);
@@ -370,7 +369,7 @@ void add_RATid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 void update_bmc_sta(struct adapter *padapter)
 {
 	unsigned char network_type;
-	int supportRateNum = 0;
+	int support_rate_num = 0;
 	unsigned int tx_ra_bitmap = 0;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
@@ -393,12 +392,14 @@ void update_bmc_sta(struct adapter *padapter)
 
 		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
-		/* psta->dot118021XPrivacy = _NO_PRIVACY_;//!!! remove it, because it has been set before this. */
+		/* psta->dot11_802_1x_privacy = _NO_PRIVACY_;
+		 * !!! remove it, because it has been set before this.
+		 * /
 
-		/* prepare for add_RATid */
-		supportRateNum = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
+		/* prepare for add_ratid */
+		support_rate_num = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
 		network_type = rtw_check_network_type((u8 *)&pcur_network->supported_rates,
-						      supportRateNum,
+						      support_rate_num,
 						      pcur_network->configuration.ds_config
 		);
 		if (is_supported_tx_cck(network_type)) {
@@ -438,7 +439,6 @@ void update_bmc_sta(struct adapter *padapter)
 		spin_lock_bh(&psta->lock);
 		psta->state = _FW_LINKED;
 		spin_unlock_bh(&psta->lock);
-
 	}
 }
 
@@ -467,7 +467,7 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 	/* ap mode */
 	rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
 
-	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
+	if (psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_8021X)
 		psta->ieee8021x_blocked = true;
 	else
 		psta->ieee8021x_blocked = false;
@@ -482,14 +482,12 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 		/* check if sta supports rx ampdu */
 		phtpriv_sta->ampdu_enable = phtpriv_ap->ampdu_enable;
 
-		phtpriv_sta->rx_ampdu_min_spacing = (
-			phtpriv_sta->ht_cap.ampdu_params_info & IEEE80211_HT_CAP_AMPDU_DENSITY
-		) >> 2;
+		phtpriv_sta->rx_ampdu_min_spacing = (phtpriv_sta->ht_cap.ampdu_params_info &
+			IEEE80211_HT_CAP_AMPDU_DENSITY) >> 2;
 
 		/*  bwmode */
-		if ((
-			phtpriv_sta->ht_cap.cap_info & phtpriv_ap->ht_cap.cap_info
-		) & cpu_to_le16(IEEE80211_HT_CAP_SUP_WIDTH))
+		if ((phtpriv_sta->ht_cap.cap_info & phtpriv_ap->ht_cap.cap_info) &
+			cpu_to_le16(IEEE80211_HT_CAP_SUP_WIDTH))
 			psta->bw_mode = CHANNEL_WIDTH_40;
 		else
 			psta->bw_mode = CHANNEL_WIDTH_20;
@@ -500,15 +498,13 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 		phtpriv_sta->ch_offset = pmlmeext->cur_ch_offset;
 
 		/* check if sta support s Short GI 20M */
-		if ((
-			phtpriv_sta->ht_cap.cap_info & phtpriv_ap->ht_cap.cap_info
-		) & cpu_to_le16(IEEE80211_HT_CAP_SGI_20))
+		if ((phtpriv_sta->ht_cap.cap_info & phtpriv_ap->ht_cap.cap_info) &
+			cpu_to_le16(IEEE80211_HT_CAP_SGI_20))
 			phtpriv_sta->sgi_20m = true;
 
 		/* check if sta support s Short GI 40M */
-		if ((
-			phtpriv_sta->ht_cap.cap_info & phtpriv_ap->ht_cap.cap_info
-		) & cpu_to_le16(IEEE80211_HT_CAP_SGI_40)) {
+		if ((phtpriv_sta->ht_cap.cap_info & phtpriv_ap->ht_cap.cap_info) &
+			cpu_to_le16(IEEE80211_HT_CAP_SGI_40)) {
 			if (psta->bw_mode == CHANNEL_WIDTH_40) /* according to psta->bw_mode */
 				phtpriv_sta->sgi_40m = true;
 			else
@@ -627,9 +623,8 @@ static void update_hw_ht_param(struct adapter *padapter)
 	/*  */
 	/*  Config SM Power Save setting */
 	/*  */
-	pmlmeinfo->SM_PS = (le16_to_cpu(
-		pmlmeinfo->HT_caps.u.HT_cap_element.HT_caps_info
-	) & 0x0C) >> 2;
+	pmlmeinfo->SM_PS = (le16_to_cpu(pmlmeinfo->HT_caps.u.HT_cap_element.HT_caps_info) &
+		0x0C) >> 2;
 
 	/*  */
 	/*  Config current HT Protection mode. */
@@ -660,9 +655,10 @@ void start_bss_network(struct adapter *padapter)
 	cur_bwmode = CHANNEL_WIDTH_20;
 	cur_ch_offset = HAL_PRIME_CHNL_OFFSET_DONT_CARE;
 
-	/* check if there is wps ie, */
-	/* if there is wpsie in beacon, the hostapd will update beacon twice when stating hostapd, */
-	/* and at first time the security ie (RSN/WPA IE) will not include in beacon. */
+	/* check if there is wps ie,
+	 * if there is wpsie in beacon, the hostapd will update beacon twice when stating hostapd,
+	 * and at first time the security ie (RSN/WPA IE) will not include in beacon.
+	 */
 	if (!rtw_get_wps_ie(pnetwork->ies + _FIXED_IE_LENGTH_,
 			    pnetwork->ie_length - _FIXED_IE_LENGTH_, NULL, NULL))
 		pmlmeext->bstart_bss = true;
@@ -684,13 +680,13 @@ void start_bss_network(struct adapter *padapter)
 	if (!pmlmepriv->cur_network.join_res) { /* setting only at  first time */
 
 		/* WEP Key will be set before this function, do not clear CAM. */
-		if ((psecuritypriv->dot11PrivacyAlgrthm != _WEP40_) &&
-		    (psecuritypriv->dot11PrivacyAlgrthm != _WEP104_))
+		if ((psecuritypriv->dot11_privacy_algrthm != WEP_40) &&
+		    (psecuritypriv->dot11_privacy_algrthm != _WEP104_))
 			flush_all_cam_entry(padapter);	/* clear CAM */
 	}
 
 	/* set MSR to AP_Mode */
-	Set_MSR(padapter, _HW_STATE_AP_);
+	set_msr(padapter, _HW_STATE_AP_);
 
 	/* Set BSSID REG */
 	rtw_hal_set_hwreg(padapter, HW_VAR_BSSID, pnetwork->mac_address);
@@ -707,9 +703,7 @@ void start_bss_network(struct adapter *padapter)
 	rtw_hal_set_hwreg(padapter, HW_VAR_AC_PARAM_BK, (u8 *)(&acparm));
 
 	/* Set Security */
-	val8 = (
-		psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X
-	) ? 0xcc : 0xcf;
+	val8 = (psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_8021X) ? 0xcc : 0xcf;
 	rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
 
 	/* Beacon Control related register */
@@ -724,10 +718,10 @@ void start_bss_network(struct adapter *padapter)
 
 		/* disable dynamic functions, such as high power, DIG */
 		/* Save_DM_Func_Flag(padapter); */
-		/* Switch_DM_Func(padapter, DYNAMIC_FUNC_DISABLE, false); */
+		/* switch_dm_func(padapter, DYNAMIC_FUNC_DISABLE, false); */
 
 		/* turn on all dynamic functions */
-		Switch_DM_Func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true);
+		switch_dm_func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true);
 
 		/* rtw_hal_set_hwreg(padapter, HW_VAR_INITIAL_GAIN, (u8 *)(&initialgain)); */
 	}
@@ -785,14 +779,11 @@ void start_bss_network(struct adapter *padapter)
 	update_wireless_mode(padapter);
 
 	/* update RRSR after set channel and bandwidth */
-	UpdateBrateTbl(padapter, pnetwork->supported_rates);
+	update_brate_tbl(padapter, pnetwork->supported_rates);
 	rtw_hal_set_hwreg(padapter, HW_VAR_BASIC_RATE, pnetwork->supported_rates);
 
 	/* update capability after cur_wireless_mode updated */
-	update_capinfo(
-		padapter,
-		rtw_get_capability((struct wlan_bssid_ex *)pnetwork)
-	);
+	update_capinfo(padapter, rtw_get_capability((struct wlan_bssid_ex *)pnetwork));
 
 	if (pmlmeext->bstart_bss) {
 		update_beacon(padapter, WLAN_EID_TIM, NULL, true);
@@ -811,14 +802,14 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 {
 	int ret = _SUCCESS;
 	u8 *p;
-	u8 *pHT_caps_ie = NULL;
-	u8 *pHT_info_ie = NULL;
+	u8 *pht_caps_ie = NULL;
+	u8 *pht_info_ie = NULL;
 	struct sta_info *psta = NULL;
 	u16 cap, ht_cap = false;
 	uint ie_len = 0;
 	int group_cipher, pairwise_cipher;
-	u8 channel, network_type, supportRate[NDIS_802_11_LENGTH_RATES_EX];
-	int supportRateNum = 0;
+	u8 channel, network_type, support_rate[NDIS_802_11_LENGTH_RATES_EX];
+	int support_rate_num = 0;
 	u8 OUI1[] = {0x00, 0x50, 0xf2, 0x01};
 	u8 WMM_PARA_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x01, 0x01};
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
@@ -840,7 +831,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 	memcpy(ie, pbuf, pbss_network->ie_length);
 
-	if (pbss_network->infrastructure_mode != Ndis802_11APMode)
+	if (pbss_network->infrastructure_mode != ndis_802_11_ap_mode)
 		return _FAIL;
 
 	pbss_network->rssi = 0;
@@ -848,7 +839,9 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	memcpy(pbss_network->mac_address, myid(&padapter->eeprompriv), ETH_ALEN);
 
 	/* beacon interval */
-	p = rtw_get_beacon_interval_from_ie(ie);/* ie + 8;	8: TimeStamp, 2: Beacon Interval 2:Capability */
+	p = rtw_get_beacon_interval_from_ie(ie);
+	/* ie + 8;	8: TimeStamp, 2: Beacon Interval 2: Capability */
+
 	/* pbss_network->configuration.beacon_period = le16_to_cpu(*(unsigned short*)p); */
 	pbss_network->configuration.beacon_period = get_unaligned_le16(p);
 
@@ -858,12 +851,8 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	cap = get_unaligned_le16(ie);
 
 	/* SSID */
-	p = rtw_get_ie(
-		ie + _BEACON_IE_OFFSET_,
-		WLAN_EID_SSID,
-		&ie_len,
-		(pbss_network->ie_length - _BEACON_IE_OFFSET_)
-	);
+	p = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_SSID, &ie_len,
+		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
 	if (p && ie_len > 0) {
 		memset(&pbss_network->ssid, 0, sizeof(struct ndis_802_11_ssid));
 		memcpy(pbss_network->ssid.ssid, (p + 2), ie_len);
@@ -873,52 +862,37 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	/* channel */
 	channel = 0;
 	pbss_network->configuration.length = 0;
-	p = rtw_get_ie(
-		ie + _BEACON_IE_OFFSET_,
-		WLAN_EID_DS_PARAMS, &ie_len,
-		(pbss_network->ie_length - _BEACON_IE_OFFSET_)
-	);
+	p = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_DS_PARAMS, &ie_len,
+		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
 	if (p && ie_len > 0)
 		channel = *(p + 2);
 
 	pbss_network->configuration.ds_config = channel;
 
-	memset(supportRate, 0, NDIS_802_11_LENGTH_RATES_EX);
+	memset(support_rate, 0, NDIS_802_11_LENGTH_RATES_EX);
 	/*  get supported rates */
-	p = rtw_get_ie(
-		ie + _BEACON_IE_OFFSET_,
-		WLAN_EID_SUPP_RATES,
-		&ie_len,
-		(pbss_network->ie_length - _BEACON_IE_OFFSET_)
-	);
+	p = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_SUPP_RATES, &ie_len,
+		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
 	if (p) {
-		memcpy(supportRate, p + 2, ie_len);
-		supportRateNum = ie_len;
+		memcpy(support_rate, p + 2, ie_len);
+		support_rate_num = ie_len;
 	}
 
 	/* get ext_supported rates */
-	p = rtw_get_ie(
-		ie + _BEACON_IE_OFFSET_,
-		WLAN_EID_EXT_SUPP_RATES,
-		&ie_len,
-		pbss_network->ie_length - _BEACON_IE_OFFSET_
-	);
+	p = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_EXT_SUPP_RATES, &ie_len,
+		       pbss_network->ie_length - _BEACON_IE_OFFSET_);
 	if (p) {
-		memcpy(supportRate + supportRateNum, p + 2, ie_len);
-		supportRateNum += ie_len;
+		memcpy(support_rate + support_rate_num, p + 2, ie_len);
+		support_rate_num += ie_len;
 	}
 
-	network_type = rtw_check_network_type(supportRate, supportRateNum, channel);
+	network_type = rtw_check_network_type(support_rate, support_rate_num, channel);
 
 	rtw_set_supported_rate(pbss_network->supported_rates, network_type);
 
 	/* parsing ERP_IE */
-	p = rtw_get_ie(
-		ie + _BEACON_IE_OFFSET_,
-		WLAN_EID_ERP_INFO,
-		&ie_len,
-		(pbss_network->ie_length - _BEACON_IE_OFFSET_)
-	);
+	p = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_ERP_INFO, &ie_len,
+		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
 	if (p && ie_len > 0)
 		ERP_IE_handler(padapter, (struct ndis_80211_var_ie *)p);
 
@@ -934,21 +908,12 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	group_cipher = 0; pairwise_cipher = 0;
 	psecuritypriv->wpa2_group_cipher = _NO_PRIVACY_;
 	psecuritypriv->wpa2_pairwise_cipher = _NO_PRIVACY_;
-	p = rtw_get_ie(
-		ie + _BEACON_IE_OFFSET_,
-		WLAN_EID_RSN,
-		&ie_len,
-		(pbss_network->ie_length - _BEACON_IE_OFFSET_)
-	);
+	p = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_RSN, &ie_len,
+		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
 	if (p && ie_len > 0) {
-		if (rtw_parse_wpa2_ie(
-			p,
-			ie_len + 2,
-			&group_cipher,
-			&pairwise_cipher,
-			NULL
-		) == _SUCCESS) {
-			psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+		if (rtw_parse_wpa2_ie(p, ie_len + 2, &group_cipher, &pairwise_cipher, NULL) ==
+			_SUCCESS) {
+			psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021X;
 
 			psecuritypriv->dot8021xalg = 1;/* psk,  todo:802.1x */
 			psecuritypriv->wpa_psk |= BIT(1);
@@ -964,21 +929,12 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	psecuritypriv->wpa_group_cipher = _NO_PRIVACY_;
 	psecuritypriv->wpa_pairwise_cipher = _NO_PRIVACY_;
 	for (p = ie + _BEACON_IE_OFFSET_; ; p += (ie_len + 2)) {
-		p = rtw_get_ie(
-			p,
-			WLAN_EID_VENDOR_SPECIFIC,
-			&ie_len,
-			(pbss_network->ie_length - _BEACON_IE_OFFSET_ - (ie_len + 2))
-		);
+		p = rtw_get_ie(p, WLAN_EID_VENDOR_SPECIFIC, &ie_len,
+			       (pbss_network->ie_length - _BEACON_IE_OFFSET_ - (ie_len + 2)));
 		if ((p) && (!memcmp(p + 2, OUI1, 4))) {
-			if (rtw_parse_wpa_ie(
-				p,
-				ie_len + 2,
-				&group_cipher,
-				&pairwise_cipher,
-				NULL
-			) == _SUCCESS) {
-				psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			if (rtw_parse_wpa_ie(p, ie_len + 2, &group_cipher, &pairwise_cipher, NULL)
+				== _SUCCESS) {
+				psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021X;
 
 				psecuritypriv->dot8021xalg = 1;/* psk,  todo:802.1x */
 
@@ -1000,12 +956,9 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	pmlmepriv->qospriv.qos_option = 0;
 	if (pregistrypriv->wmm_enable) {
 		for (p = ie + _BEACON_IE_OFFSET_; ; p += (ie_len + 2)) {
-			p = rtw_get_ie(
-				p,
-				WLAN_EID_VENDOR_SPECIFIC,
-				&ie_len,
-				(pbss_network->ie_length - _BEACON_IE_OFFSET_ - (ie_len + 2))
-			);
+			p = rtw_get_ie(p, WLAN_EID_VENDOR_SPECIFIC, &ie_len,
+				       (pbss_network->ie_length -
+				       _BEACON_IE_OFFSET_ - (ie_len + 2)));
 			if ((p) && !memcmp(p + 2, WMM_PARA_IE, 6)) {
 				pmlmepriv->qospriv.qos_option = 1;
 
@@ -1027,27 +980,23 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	}
 
 	/* parsing HT_CAP_IE */
-	p = rtw_get_ie(
-		ie + _BEACON_IE_OFFSET_,
-		WLAN_EID_HT_CAPABILITY,
-		&ie_len,
-		(pbss_network->ie_length - _BEACON_IE_OFFSET_)
-	);
+	p = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_HT_CAPABILITY, &ie_len,
+		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
 	if (p && ie_len > 0) {
 		u8 max_rx_ampdu_factor = 0;
 		struct ieee80211_ht_cap *pht_cap = (struct ieee80211_ht_cap *)(p + 2);
 
-		pHT_caps_ie = p;
+		pht_caps_ie = p;
 
 		ht_cap = true;
 		network_type |= WIRELESS_11_24N;
 
 		rtw_ht_use_default_setting(padapter);
 
-		if (pmlmepriv->htpriv.sgi_20m == false)
+		if (!pmlmepriv->htpriv.sgi_20m)
 			pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_SGI_20));
 
-		if (pmlmepriv->htpriv.sgi_40m == false)
+		if (!pmlmepriv->htpriv.sgi_40m)
 			pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_SGI_40));
 
 		if (!TEST_FLAG(pmlmepriv->htpriv.ldpc_cap, LDPC_HT_ENABLE_RX))
@@ -1059,9 +1008,8 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		if (!TEST_FLAG(pmlmepriv->htpriv.stbc_cap, STBC_HT_ENABLE_RX))
 			pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_RX_STBC_3R));
 
-		pht_cap->ampdu_params_info &= ~(
-			IEEE80211_HT_CAP_AMPDU_FACTOR | IEEE80211_HT_CAP_AMPDU_DENSITY
-		);
+		pht_cap->ampdu_params_info &= ~(IEEE80211_HT_CAP_AMPDU_FACTOR |
+			IEEE80211_HT_CAP_AMPDU_DENSITY);
 
 		if ((psecuritypriv->wpa_pairwise_cipher & WPA_CIPHER_CCMP) ||
 		    (psecuritypriv->wpa2_pairwise_cipher & WPA_CIPHER_CCMP)) {
@@ -1072,14 +1020,9 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 						       0x00);
 		}
 
-		rtw_hal_get_def_var(
-			padapter,
-			HW_VAR_MAX_RX_AMPDU_FACTOR,
-			&max_rx_ampdu_factor
-		);
-		pht_cap->ampdu_params_info |= (
-			IEEE80211_HT_CAP_AMPDU_FACTOR & max_rx_ampdu_factor
-		); /* set  Max Rx AMPDU size  to 64K */
+		rtw_hal_get_def_var(padapter, HW_VAR_MAX_RX_AMPDU_FACTOR, &max_rx_ampdu_factor);
+		pht_cap->ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_FACTOR &
+			max_rx_ampdu_factor); /* set  Max Rx AMPDU size  to 64K */
 
 		pht_cap->mcs.rx_mask[0] = 0xff;
 		pht_cap->mcs.rx_mask[1] = 0x0;
@@ -1088,27 +1031,23 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	}
 
 	/* parsing HT_INFO_IE */
-	p = rtw_get_ie(
-		ie + _BEACON_IE_OFFSET_,
-		WLAN_EID_HT_OPERATION,
-		&ie_len,
-		(pbss_network->ie_length - _BEACON_IE_OFFSET_)
-	);
+	p = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_HT_OPERATION, &ie_len,
+		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
 	if (p && ie_len > 0)
-		pHT_info_ie = p;
+		pht_info_ie = p;
 
 	switch (network_type) {
 	case WIRELESS_11B:
-		pbss_network->network_type_in_use = Ndis802_11DS;
+		pbss_network->network_type_in_use = ndis_802_11_ds;
 		break;
 	case WIRELESS_11G:
 	case WIRELESS_11BG:
 	case WIRELESS_11G_24N:
 	case WIRELESS_11BG_24N:
-		pbss_network->network_type_in_use = Ndis802_11OFDM24;
+		pbss_network->network_type_in_use = ndis_802_11_ofdm_24;
 		break;
 	default:
-		pbss_network->network_type_in_use = Ndis802_11OFDM24;
+		pbss_network->network_type_in_use = ndis_802_11_ofdm_24;
 		break;
 	}
 
@@ -1130,14 +1069,12 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		if (pregistrypriv->ampdu_enable == 1)
 			pmlmepriv->htpriv.ampdu_enable = true;
 
-		HT_caps_handler(padapter, (struct ndis_80211_var_ie *)pHT_caps_ie);
+		HT_caps_handler(padapter, (struct ndis_80211_var_ie *)pht_caps_ie);
 
-		HT_info_handler(padapter, (struct ndis_80211_var_ie *)pHT_info_ie);
+		HT_info_handler(padapter, (struct ndis_80211_var_ie *)pht_info_ie);
 	}
 
-	pbss_network->length = get_wlan_bssid_ex_sz(
-		(struct wlan_bssid_ex  *)pbss_network
-	);
+	pbss_network->length = get_wlan_bssid_ex_sz((struct wlan_bssid_ex  *)pbss_network);
 
 	/* issue beacon to start bss network */
 	/* start_bss_network(padapter, (u8 *)pbss_network); */
@@ -1154,7 +1091,8 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	/*  update AP's sta info */
 	update_ap_info(padapter, psta);
 
-	psta->state |= WIFI_AP_STATE;		/* Aries, add, fix bug of flush_cam_entry at STOP AP mode , 0724 */
+	psta->state |= WIFI_AP_STATE;
+	/* Aries, add, fix bug of flush_cam_entry at STOP AP mode , 0724 */
 	rtw_indicate_connect(padapter);
 
 	pmlmepriv->cur_network.join_res = true;/* for check if already set beacon */
@@ -1193,7 +1131,7 @@ int rtw_acl_add_sta(struct adapter *padapter, u8 *addr)
 		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
 
 		if (!memcmp(paclnode->addr, addr, ETH_ALEN)) {
-			if (paclnode->valid == true) {
+			if (paclnode->valid) {
 				added = true;
 				break;
 			}
@@ -1244,10 +1182,7 @@ void rtw_acl_remove_sta(struct adapter *padapter, u8 *addr)
 	list_for_each_safe(plist, tmp, phead) {
 		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
 
-		if (
-			!memcmp(paclnode->addr, addr, ETH_ALEN) ||
-			is_broadcast_ether_addr(addr)
-		) {
+		if (!memcmp(paclnode->addr, addr, ETH_ALEN) || is_broadcast_ether_addr(addr)) {
 			if (paclnode->valid) {
 				paclnode->valid = false;
 
@@ -1259,7 +1194,6 @@ void rtw_acl_remove_sta(struct adapter *padapter, u8 *addr)
 	}
 
 	spin_unlock_bh(&pacl_node_q->lock);
-
 }
 
 u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta)
@@ -1282,13 +1216,13 @@ u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta)
 		goto exit;
 	}
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, _SetStaKey_CMD_);
+	init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, set_sta_key_cmd);
 
-	psetstakey_para->algorithm = (u8)psta->dot118021XPrivacy;
+	psetstakey_para->algorithm = (u8)psta->dot11_802_1x_privacy;
 
 	memcpy(psetstakey_para->addr, psta->hwaddr, ETH_ALEN);
 
-	memcpy(psetstakey_para->key, &psta->dot118021x_UncstKey, 16);
+	memcpy(psetstakey_para->key, &psta->dot11_802_1x_uncst_key, 16);
 
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
@@ -1297,13 +1231,7 @@ u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta)
 	return res;
 }
 
-static int rtw_ap_set_key(
-	struct adapter *padapter,
-	u8 *key,
-	u8 alg,
-	int keyid,
-	u8 set_tx
-)
+static int rtw_ap_set_key(struct adapter *padapter, u8 *key, u8 alg, int keyid, u8 set_tx)
 {
 	u8 keylen;
 	struct cmd_obj *pcmd;
@@ -1332,7 +1260,7 @@ static int rtw_ap_set_key(
 	psetkeyparm->set_tx = set_tx;
 
 	switch (alg) {
-	case _WEP40_:
+	case WEP_40:
 		keylen = 5;
 		break;
 	case _WEP104_:
@@ -1347,7 +1275,7 @@ static int rtw_ap_set_key(
 
 	memcpy(&psetkeyparm->key[0], key, keylen);
 
-	pcmd->cmdcode = _SetKey_CMD_;
+	pcmd->cmdcode = set_key_cmd;
 	pcmd->parmbuf = (u8 *)psetkeyparm;
 	pcmd->cmdsz =  (sizeof(struct setkey_parm));
 	pcmd->rsp = NULL;
@@ -1367,19 +1295,13 @@ int rtw_ap_set_group_key(struct adapter *padapter, u8 *key, u8 alg, int keyid)
 	return rtw_ap_set_key(padapter, key, alg, keyid, 1);
 }
 
-int rtw_ap_set_wep_key(
-	struct adapter *padapter,
-	u8 *key,
-	u8 keylen,
-	int keyid,
-	u8 set_tx
-)
+int rtw_ap_set_wep_key(struct adapter *padapter, u8 *key, u8 keylen, int keyid, u8 set_tx)
 {
 	u8 alg;
 
 	switch (keylen) {
 	case 5:
-		alg = _WEP40_;
+		alg = WEP_40;
 		break;
 	case 13:
 		alg = _WEP104_;
@@ -1408,28 +1330,23 @@ static void update_bcn_erpinfo_ie(struct adapter *padapter)
 		return;
 
 	/* parsing ERP_IE */
-	p = rtw_get_ie(
-		ie + _BEACON_IE_OFFSET_,
-		WLAN_EID_ERP_INFO,
-		&len,
-		(pnetwork->ie_length - _BEACON_IE_OFFSET_)
-	);
+	p = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_ERP_INFO, &len,
+		       (pnetwork->ie_length - _BEACON_IE_OFFSET_));
 	if (p && len > 0) {
-		struct ndis_80211_var_ie *pIE = (struct ndis_80211_var_ie *)p;
+		struct ndis_80211_var_ie *pie = (struct ndis_80211_var_ie *)p;
 
 		if (pmlmepriv->num_sta_non_erp == 1)
-			pIE->data[0] |= RTW_ERP_INFO_NON_ERP_PRESENT | RTW_ERP_INFO_USE_PROTECTION;
+			pie->data[0] |= RTW_ERP_INFO_NON_ERP_PRESENT | RTW_ERP_INFO_USE_PROTECTION;
 		else
-			pIE->data[0] &= ~(
-				RTW_ERP_INFO_NON_ERP_PRESENT | RTW_ERP_INFO_USE_PROTECTION
-			);
+			pie->data[0] &= ~(RTW_ERP_INFO_NON_ERP_PRESENT |
+				RTW_ERP_INFO_USE_PROTECTION);
 
 		if (pmlmepriv->num_sta_no_short_preamble > 0)
-			pIE->data[0] |= RTW_ERP_INFO_BARKER_PREAMBLE_MODE;
+			pie->data[0] |= RTW_ERP_INFO_BARKER_PREAMBLE_MODE;
 		else
-			pIE->data[0] &= ~(RTW_ERP_INFO_BARKER_PREAMBLE_MODE);
+			pie->data[0] &= ~(RTW_ERP_INFO_BARKER_PREAMBLE_MODE);
 
-		ERP_IE_handler(padapter, pIE);
+		ERP_IE_handler(padapter, pie);
 	}
 }
 
@@ -1468,12 +1385,8 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 	unsigned char *ie = pnetwork->ies;
 	u32 ielen = pnetwork->ie_length;
 
-	pwps_ie = rtw_get_wps_ie(
-		ie + _FIXED_IE_LENGTH_,
-		ielen - _FIXED_IE_LENGTH_,
-		NULL,
-		&wps_ielen
-	);
+	pwps_ie = rtw_get_wps_ie(ie + _FIXED_IE_LENGTH_, ielen - _FIXED_IE_LENGTH_,
+				 NULL, &wps_ielen);
 
 	if (!pwps_ie || wps_ielen == 0)
 		return;
@@ -1497,7 +1410,7 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 	wps_ielen = (uint)pwps_ie_src[1];/* to get ie data len */
 	if ((wps_offset + wps_ielen + 2 + remainder_ielen) <= MAX_IE_SZ) {
 		memcpy(pwps_ie, pwps_ie_src, wps_ielen + 2);
-		pwps_ie += (wps_ielen+2);
+		pwps_ie += (wps_ielen + 2);
 
 		if (pbackup_remainder_ie)
 			memcpy(pwps_ie, pbackup_remainder_ie, remainder_ielen);
@@ -1625,8 +1538,8 @@ static int rtw_ht_operation_update(struct adapter *padapter)
 	if (pmlmepriv->htpriv.ht_option)
 		return 0;
 
-	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT)
-	    && pmlmepriv->num_sta_ht_no_gf) {
+	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT) &&
+	    pmlmepriv->num_sta_ht_no_gf) {
 		pmlmepriv->ht_op_mode |=
 			IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT;
 		op_mode_changes++;
@@ -1658,9 +1571,8 @@ static int rtw_ht_operation_update(struct adapter *padapter)
 	if (pmlmepriv->num_sta_no_ht ||
 	    (pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT))
 		new_op_mode = IEEE80211_HT_OP_MODE_PROTECTION_NONHT_MIXED;
-	else if (
-		(le16_to_cpu(phtpriv_ap->ht_cap.cap_info) & IEEE80211_HT_CAP_SUP_WIDTH)
-		&& pmlmepriv->num_sta_ht_20mhz)
+	else if ((le16_to_cpu(phtpriv_ap->ht_cap.cap_info) & IEEE80211_HT_CAP_SUP_WIDTH) &&
+		 pmlmepriv->num_sta_ht_20mhz)
 		new_op_mode = IEEE80211_HT_OP_MODE_PROTECTION_20MHZ;
 	else if (pmlmepriv->olbc_ht)
 		new_op_mode = IEEE80211_HT_OP_MODE_PROTECTION_NONMEMBER;
@@ -1832,8 +1744,8 @@ u8 bss_cap_update_on_sta_leave(struct adapter *padapter, struct sta_info *psta)
 	if (psta->no_short_preamble_set) {
 		psta->no_short_preamble_set = 0;
 		pmlmepriv->num_sta_no_short_preamble--;
-		if (pmlmeext->cur_wireless_mode > WIRELESS_11B
-		    && pmlmepriv->num_sta_no_short_preamble == 0){
+		if (pmlmeext->cur_wireless_mode > WIRELESS_11B &&
+		    pmlmepriv->num_sta_no_short_preamble == 0){
 			beacon_updated = true;
 			update_beacon(padapter, 0xFF, NULL, true);
 		}
@@ -1851,8 +1763,8 @@ u8 bss_cap_update_on_sta_leave(struct adapter *padapter, struct sta_info *psta)
 	if (psta->no_short_slot_time_set) {
 		psta->no_short_slot_time_set = 0;
 		pmlmepriv->num_sta_no_short_slot_time--;
-		if (pmlmeext->cur_wireless_mode > WIRELESS_11B
-		    && pmlmepriv->num_sta_no_short_slot_time == 0){
+		if (pmlmeext->cur_wireless_mode > WIRELESS_11B &&
+		    pmlmepriv->num_sta_no_short_slot_time == 0){
 			beacon_updated = true;
 			update_beacon(padapter, 0xFF, NULL, true);
 		}
@@ -1881,12 +1793,7 @@ u8 bss_cap_update_on_sta_leave(struct adapter *padapter, struct sta_info *psta)
 	return beacon_updated;
 }
 
-u8 ap_free_sta(
-	struct adapter *padapter,
-	struct sta_info *psta,
-	bool active,
-	u16 reason
-)
+u8 ap_free_sta(struct adapter *padapter, struct sta_info *psta, bool active, u16 reason)
 {
 	u8 beacon_updated = false;
 
@@ -1997,9 +1904,10 @@ void ap_sta_info_defer_update(struct adapter *padapter, struct sta_info *psta)
 		pmlmeinfo->FW_sta_info[psta->mac_id].psta = psta;
 
 		/* add ratid */
-		add_RATid(padapter, psta, 0);/* DM_RATR_STA_INIT */
+		add_ratid(padapter, psta, 0);/* DM_RATR_STA_INIT */
 	}
 }
+
 /* restore hw setting from sw data structures */
 void rtw_ap_restore_network(struct adapter *padapter)
 {
@@ -2012,27 +1920,18 @@ void rtw_ap_restore_network(struct adapter *padapter)
 	char chk_alive_list[NUM_STA];
 	int i;
 
-	rtw_setopmode_cmd(padapter, Ndis802_11APMode, false);
+	rtw_setopmode_cmd(padapter, ndis_802_11_ap_mode, false);
 
-	set_channel_bwmode(
-		padapter,
-		pmlmeext->cur_channel,
-		pmlmeext->cur_ch_offset,
-		pmlmeext->cur_bwmode
-	);
+	set_channel_bwmode(padapter, pmlmeext->cur_channel, pmlmeext->cur_ch_offset,
+			   pmlmeext->cur_bwmode);
 
 	start_bss_network(padapter);
 
-	if ((padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_) ||
-	    (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
+	if ((padapter->securitypriv.dot11_privacy_algrthm == _TKIP_) ||
+	    (padapter->securitypriv.dot11_privacy_algrthm == _AES_)) {
 		/* restore group key, WEP keys is restored in ips_leave() */
-		rtw_set_key(
-			padapter,
-			psecuritypriv,
-			psecuritypriv->dot118021XGrpKeyid,
-			0,
-			false
-		);
+		rtw_set_key(padapter, psecuritypriv, psecuritypriv->dot11_802_1x_grp_key_id,
+			    0, false);
 	}
 
 	spin_lock_bh(&pstapriv->asoc_list_lock);
@@ -2058,11 +1957,11 @@ void rtw_ap_restore_network(struct adapter *padapter)
 
 		if (psta->state & _FW_LINKED) {
 			rtw_sta_media_status_rpt(padapter, psta, 1);
-			Update_RA_Entry(padapter, psta);
+			update_ra_entry(padapter, psta);
 			/* pairwise key */
 			/* per sta pairwise key and settings */
-			if ((psecuritypriv->dot11PrivacyAlgrthm == _TKIP_) ||
-			    (psecuritypriv->dot11PrivacyAlgrthm == _AES_)) {
+			if ((psecuritypriv->dot11_privacy_algrthm == _TKIP_) ||
+			    (psecuritypriv->dot11_privacy_algrthm == _AES_)) {
 				rtw_setstakey_cmd(padapter, psta, true, false);
 			}
 		}
@@ -2133,13 +2032,9 @@ void stop_ap_mode(struct adapter *padapter)
 	pmlmeext->bstart_bss = false;
 
 	/* reset and init security priv , this can refine with rtw_reset_securitypriv */
-	memset(
-		(unsigned char *)&padapter->securitypriv,
-		0,
-		sizeof(struct security_priv)
-	);
-	padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeOpen;
-	padapter->securitypriv.ndisencryptstatus = Ndis802_11WEPDisabled;
+	memset((unsigned char *)&padapter->securitypriv, 0, sizeof(struct security_priv));
+	padapter->securitypriv.ndisauthtype = ndis_802_11_auth_mode_open;
+	padapter->securitypriv.ndisencryptstatus = ndis_802_11_wep_disabled;
 
 	/* for ACL */
 	spin_lock_bh(&pacl_node_q->lock);
@@ -2169,5 +2064,5 @@ void stop_ap_mode(struct adapter *padapter)
 
 	rtw_free_mlme_priv_ie_data(pmlmepriv);
 
-	rtw_btcoex_MediaStatusNotify(padapter, 0); /* disconnect */
+	rtw_btcoex_media_status_notify(padapter, 0); /* disconnect */
 }
diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index d54095f50113..235fab907080 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -8,7 +8,7 @@
 #include <rtw_btcoex.h>
 #include <hal_btcoex.h>
 
-void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 mediaStatus)
+void rtw_btcoex_media_status_notify(struct adapter *padapter, u8 mediaStatus)
 {
 	if ((mediaStatus == RT_MEDIA_CONNECT)
 		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 1c9e8b01d9d8..9f52f5d177ec 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -707,7 +707,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 			set_fwstate(pmlmepriv, WIFI_STATION_STATE);
 			break;
 
-		case Ndis802_11APMode:
+		case ndis_802_11_ap_mode:
 		case Ndis802_11AutoUnknown:
 		case Ndis802_11InfrastructureMax:
 			break;
@@ -758,9 +758,9 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 		/* Added by Albert 2010/06/23 */
 		/* For the WEP mode, we will use the bg mode to do the connection to avoid some IOT issue. */
 		/* Especially for Realtek 8192u SoftAP. */
-		if ((padapter->securitypriv.dot11PrivacyAlgrthm != _WEP40_) &&
-			(padapter->securitypriv.dot11PrivacyAlgrthm != _WEP104_) &&
-			(padapter->securitypriv.dot11PrivacyAlgrthm != _TKIP_)) {
+		if ((padapter->securitypriv.dot11_privacy_algrthm != WEP_40) &&
+			(padapter->securitypriv.dot11_privacy_algrthm != _WEP104_) &&
+			(padapter->securitypriv.dot11_privacy_algrthm != _TKIP_)) {
 			rtw_ht_use_default_setting(padapter);
 
 			rtw_build_wmm_ie_ht(padapter, &psecnetwork->ies[12], &psecnetwork->ie_length);
@@ -879,14 +879,14 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 	memcpy(psetstakey_para->addr, sta->hwaddr, ETH_ALEN);
 
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE))
-		psetstakey_para->algorithm = (unsigned char)psecuritypriv->dot11PrivacyAlgrthm;
+		psetstakey_para->algorithm = (unsigned char)psecuritypriv->dot11_privacy_algrthm;
 	else
 		GET_ENCRY_ALGO(psecuritypriv, sta, psetstakey_para->algorithm, false);
 
 	if (unicast_key)
-		memcpy(&psetstakey_para->key, &sta->dot118021x_UncstKey, 16);
+		memcpy(&psetstakey_para->key, &sta->dot11_802_1x_uncst_key, 16);
 	else
-		memcpy(&psetstakey_para->key, &psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey, 16);
+		memcpy(&psetstakey_para->key, &psecuritypriv->dot118021XGrpKey[psecuritypriv->dot11_802_1x_grp_key_id].skey, 16);
 
 	/* jeff: set this because at least sw key is ready */
 	padapter->securitypriv.busetkipkey = true;
@@ -907,7 +907,7 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 			goto exit;
 		}
 
-		init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, _SetStaKey_CMD_);
+		init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, set_sta_key_cmd);
 		ph2c->rsp = (u8 *)psetstakey_rsp;
 		ph2c->rspsz = sizeof(struct set_stakey_rsp);
 		res = rtw_enqueue_cmd(pcmdpriv, ph2c);
@@ -958,7 +958,7 @@ u8 rtw_clearstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 enqueu
 			goto exit;
 		}
 
-		init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, _SetStaKey_CMD_);
+		init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, set_sta_key_cmd);
 		ph2c->rsp = (u8 *)psetstakey_rsp;
 		ph2c->rspsz = sizeof(struct set_stakey_rsp);
 
@@ -1290,11 +1290,11 @@ void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type)
 		/*  Reset LPS Setting */
 		pwrpriv->LpsIdleCount = 0;
 		rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_JOINBSSRPT, (u8 *)(&mstatus));
-		rtw_btcoex_MediaStatusNotify(padapter, mstatus);
+		rtw_btcoex_media_status_notify(padapter, mstatus);
 		break;
 	case LPS_CTRL_DISCONNECT:
 		mstatus = 0;/* disconnect */
-		rtw_btcoex_MediaStatusNotify(padapter, mstatus);
+		rtw_btcoex_media_status_notify(padapter, mstatus);
 		LPS_Leave(padapter, "LPS_CTRL_DISCONNECT");
 		rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_JOINBSSRPT, (u8 *)(&mstatus));
 		break;
diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 0ed420f3d096..485d6f8f5d62 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -15,7 +15,7 @@ u8 WPA_AUTH_KEY_MGMT_NONE[] = { 0x00, 0x50, 0xf2, 0 };
 u8 WPA_AUTH_KEY_MGMT_UNSPEC_802_1X[] = { 0x00, 0x50, 0xf2, 1 };
 u8 WPA_AUTH_KEY_MGMT_PSK_OVER_802_1X[] = { 0x00, 0x50, 0xf2, 2 };
 u8 WPA_CIPHER_SUITE_NONE[] = { 0x00, 0x50, 0xf2, 0 };
-u8 WPA_CIPHER_SUITE_WEP40[] = { 0x00, 0x50, 0xf2, 1 };
+u8 WPA_CIPHER_SUITE__WEP40_[] = { 0x00, 0x50, 0xf2, 1 };
 u8 WPA_CIPHER_SUITE_TKIP[] = { 0x00, 0x50, 0xf2, 2 };
 u8 WPA_CIPHER_SUITE_WRAP[] = { 0x00, 0x50, 0xf2, 3 };
 u8 WPA_CIPHER_SUITE_CCMP[] = { 0x00, 0x50, 0xf2, 4 };
@@ -25,7 +25,7 @@ u16 RSN_VERSION_BSD = 1;
 u8 RSN_AUTH_KEY_MGMT_UNSPEC_802_1X[] = { 0x00, 0x0f, 0xac, 1 };
 u8 RSN_AUTH_KEY_MGMT_PSK_OVER_802_1X[] = { 0x00, 0x0f, 0xac, 2 };
 u8 RSN_CIPHER_SUITE_NONE[] = { 0x00, 0x0f, 0xac, 0 };
-u8 RSN_CIPHER_SUITE_WEP40[] = { 0x00, 0x0f, 0xac, 1 };
+u8 RSN_CIPHER_SUITE__WEP40_[] = { 0x00, 0x0f, 0xac, 1 };
 u8 RSN_CIPHER_SUITE_TKIP[] = { 0x00, 0x0f, 0xac, 2 };
 u8 RSN_CIPHER_SUITE_WRAP[] = { 0x00, 0x0f, 0xac, 3 };
 u8 RSN_CIPHER_SUITE_CCMP[] = { 0x00, 0x0f, 0xac, 4 };
@@ -409,8 +409,8 @@ int rtw_get_wpa_cipher_suite(u8 *s)
 {
 	if (!memcmp(s, WPA_CIPHER_SUITE_NONE, WPA_SELECTOR_LEN))
 		return WPA_CIPHER_NONE;
-	if (!memcmp(s, WPA_CIPHER_SUITE_WEP40, WPA_SELECTOR_LEN))
-		return WPA_CIPHER_WEP40;
+	if (!memcmp(s, WPA_CIPHER_SUITE__WEP40_, WPA_SELECTOR_LEN))
+		return WPA_CIPHER__WEP40_;
 	if (!memcmp(s, WPA_CIPHER_SUITE_TKIP, WPA_SELECTOR_LEN))
 		return WPA_CIPHER_TKIP;
 	if (!memcmp(s, WPA_CIPHER_SUITE_CCMP, WPA_SELECTOR_LEN))
@@ -425,8 +425,8 @@ int rtw_get_wpa2_cipher_suite(u8 *s)
 {
 	if (!memcmp(s, RSN_CIPHER_SUITE_NONE, RSN_SELECTOR_LEN))
 		return WPA_CIPHER_NONE;
-	if (!memcmp(s, RSN_CIPHER_SUITE_WEP40, RSN_SELECTOR_LEN))
-		return WPA_CIPHER_WEP40;
+	if (!memcmp(s, RSN_CIPHER_SUITE__WEP40_, RSN_SELECTOR_LEN))
+		return WPA_CIPHER__WEP40_;
 	if (!memcmp(s, RSN_CIPHER_SUITE_TKIP, RSN_SELECTOR_LEN))
 		return WPA_CIPHER_TKIP;
 	if (!memcmp(s, RSN_CIPHER_SUITE_CCMP, RSN_SELECTOR_LEN))
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 587a87fbffeb..21ebef9cc460 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -292,8 +292,8 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 	enum ndis_802_11_network_infrastructure *pold_state = &(cur_network->network.infrastructure_mode);
 
 	if (*pold_state != networktype) {
-		if (*pold_state == Ndis802_11APMode) {
-			/* change to other mode from Ndis802_11APMode */
+		if (*pold_state == ndis_802_11_ap_mode) {
+			/* change to other mode from ndis_802_11_ap_mode */
 			cur_network->join_res = -1;
 
 			stop_ap_mode(padapter);
@@ -326,7 +326,7 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 			set_fwstate(pmlmepriv, WIFI_STATION_STATE);
 			break;
 
-		case Ndis802_11APMode:
+		case ndis_802_11_ap_mode:
 			set_fwstate(pmlmepriv, WIFI_AP_STATE);
 			start_ap_mode(padapter);
 			/* rtw_indicate_connect(padapter); */
@@ -408,7 +408,7 @@ u8 rtw_set_802_11_authentication_mode(struct adapter *padapter, enum ndis_802_11
 	psecuritypriv->ndisauthtype = authmode;
 
 	if (psecuritypriv->ndisauthtype > 3)
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021X;
 
 	res = rtw_set_auth(padapter, psecuritypriv);
 
@@ -436,13 +436,13 @@ u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep)
 
 	switch (wep->key_length) {
 	case 5:
-		psecuritypriv->dot11PrivacyAlgrthm = _WEP40_;
+		psecuritypriv->dot11_privacy_algrthm = WEP_40;
 		break;
 	case 13:
-		psecuritypriv->dot11PrivacyAlgrthm = _WEP104_;
+		psecuritypriv->dot11_privacy_algrthm = _WEP104_;
 		break;
 	default:
-		psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
+		psecuritypriv->dot11_privacy_algrthm = _NO_PRIVACY_;
 		break;
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 58de0c2fdd68..f97970e6c628 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -308,10 +308,10 @@ int rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
 	int ret = true;
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 
-	if ((psecuritypriv->dot11PrivacyAlgrthm != _NO_PRIVACY_) &&
+	if ((psecuritypriv->dot11_privacy_algrthm != _NO_PRIVACY_) &&
 		    (pnetwork->network.privacy == 0))
 		ret = false;
-	else if ((psecuritypriv->dot11PrivacyAlgrthm == _NO_PRIVACY_) &&
+	else if ((psecuritypriv->dot11_privacy_algrthm == _NO_PRIVACY_) &&
 		 (pnetwork->network.privacy == 1))
 		ret = false;
 	else
@@ -972,15 +972,15 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 		rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
 
 		/* security related */
-		if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) {
+		if (padapter->securitypriv.dot11_auth_algrthm ==.dot11_auth_algrthm_8021X) {
 			padapter->securitypriv.binstallGrpkey = false;
 			padapter->securitypriv.busetkipkey = false;
 			padapter->securitypriv.bgrpkey_handshake = false;
 
 			psta->ieee8021x_blocked = true;
-			psta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
+			psta->dot11_802_1x_privacy = padapter->securitypriv.dot11_privacy_algrthm;
 
-			memset((u8 *)&psta->dot118021x_UncstKey, 0, sizeof(union Keytype));
+			memset((u8 *)&psta->dot11_802_1x_uncst_key, 0, sizeof(union Keytype));
 
 			memset((u8 *)&psta->dot11tkiprxmickey, 0, sizeof(union Keytype));
 			memset((u8 *)&psta->dot11tkiptxmickey, 0, sizeof(union Keytype));
@@ -1296,8 +1296,8 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 
 	rtw_sta_media_status_rpt(adapter, psta, 1);
 
-	if (adapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
-		psta->dot118021XPrivacy = adapter->securitypriv.dot11PrivacyAlgrthm;
+	if (adapter->securitypriv.dot11_auth_algrthm ==.dot11_auth_algrthm_8021X)
+		psta->dot11_802_1x_privacy = adapter->securitypriv.dot11_privacy_algrthm;
 
 	psta->ieee8021x_blocked = false;
 
@@ -1824,7 +1824,7 @@ signed int rtw_set_auth(struct adapter *adapter, struct security_priv *psecurity
 		goto exit;
 	}
 
-	psetauthparm->mode = (unsigned char)psecuritypriv->dot11AuthAlgrthm;
+	psetauthparm->mode = (unsigned char)psecuritypriv->dot11_auth_algrthm;
 
 	pcmd->cmdcode = _SetAuth_CMD_;
 	pcmd->parmbuf = (unsigned char *)psetauthparm;
@@ -1854,10 +1854,10 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 		goto exit;
 	}
 
-	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
+	if (psecuritypriv->dot11_auth_algrthm ==.dot11_auth_algrthm_8021X)
 		psetkeyparm->algorithm = (unsigned char)psecuritypriv->dot118021XGrpPrivacy;
 	else
-		psetkeyparm->algorithm = (u8)psecuritypriv->dot11PrivacyAlgrthm;
+		psetkeyparm->algorithm = (u8)psecuritypriv->dot11_privacy_algrthm;
 
 	psetkeyparm->keyid = (u8)keyid;/* 0~3 */
 	psetkeyparm->set_tx = set_tx;
@@ -1866,7 +1866,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 
 	switch (psetkeyparm->algorithm) {
 
-	case _WEP40_:
+	case WEP_40:
 		keylen = 5;
 		memcpy(&(psetkeyparm->key[0]), &(psecuritypriv->dot11DefKey[keyid].skey[0]), keylen);
 		break;
@@ -1898,7 +1898,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 			goto exit;
 		}
 
-		pcmd->cmdcode = _SetKey_CMD_;
+		pcmd->cmdcode = set_key_cmd;
 		pcmd->parmbuf = (u8 *)psetkeyparm;
 		pcmd->cmdsz =  (sizeof(struct setkey_parm));
 		pcmd->rsp = NULL;
@@ -2054,20 +2054,20 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 	struct	security_priv *psecuritypriv = &adapter->securitypriv;
 	struct	wlan_network	*cur_network = &adapter->mlmepriv.cur_network;
 
-	pdev_network->privacy = (psecuritypriv->dot11PrivacyAlgrthm > 0 ? 1 : 0) ; /*  adhoc no 802.1x */
+	pdev_network->privacy = (psecuritypriv->dot11_privacy_algrthm > 0 ? 1 : 0) ; /*  adhoc no 802.1x */
 
 	pdev_network->rssi = 0;
 
 	switch (pregistrypriv->wireless_mode) {
 	case WIRELESS_11B:
-		pdev_network->network_type_in_use = (Ndis802_11DS);
+		pdev_network->network_type_in_use = (ndis_802_11_ds);
 		break;
 	case WIRELESS_11G:
 	case WIRELESS_11BG:
 	case WIRELESS_11_24N:
 	case WIRELESS_11G_24N:
 	case WIRELESS_11BG_24N:
-		pdev_network->network_type_in_use = (Ndis802_11OFDM24);
+		pdev_network->network_type_in_use = (ndis_802_11_ofdm_24);
 		break;
 	default:
 		/*  TODO */
@@ -2303,7 +2303,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 
 	ht_capie.ampdu_params_info = (max_rx_ampdu_factor&0x03);
 
-	if (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)
+	if (padapter->securitypriv.dot11_privacy_algrthm == _AES_)
 		ht_capie.ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY&(0x07<<2));
 	else
 		ht_capie.ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY&0x00);
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 3d36b6f005e0..f651edcc2709 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -246,7 +246,7 @@ static void init_mlme_ext_priv_value(struct adapter *padapter)
 	pmlmeinfo->reassoc_count = 0;
 	pmlmeinfo->link_count = 0;
 	pmlmeinfo->auth_seq = 0;
-	pmlmeinfo->auth_algo = dot11AuthAlgrthm_Open;
+	pmlmeinfo->auth_algo = dot11_auth_algrthm_Open;
 	pmlmeinfo->key_index = 0;
 	pmlmeinfo->iv = 0;
 
@@ -694,14 +694,14 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 
 	sa = GetAddr2Ptr(pframe);
 
-	auth_mode = psecuritypriv->dot11AuthAlgrthm;
+	auth_mode = psecuritypriv->dot11_auth_algrthm;
 
 	if (GetPrivacy(pframe)) {
 		u8 *iv;
 		struct rx_pkt_attrib	 *prxattrib = &(precv_frame->u.hdr.attrib);
 
 		prxattrib->hdrlen = WLAN_HDR_A3_LEN;
-		prxattrib->encrypt = _WEP40_;
+		prxattrib->encrypt = WEP_40;
 
 		iv = pframe+prxattrib->hdrlen;
 		prxattrib->key_index = ((iv[3]>>6)&0x3);
@@ -718,8 +718,8 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	seq	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
 
 	if (auth_mode == 2 &&
-			psecuritypriv->dot11PrivacyAlgrthm != _WEP40_ &&
-			psecuritypriv->dot11PrivacyAlgrthm != _WEP104_)
+			psecuritypriv->dot11_privacy_algrthm != WEP_40 &&
+			psecuritypriv->dot11_privacy_algrthm != _WEP104_)
 		auth_mode = 0;
 
 	if ((algorithm > 0 && auth_mode == 0) ||	/*  rx a shared-key auth but shared not enabled */
@@ -878,11 +878,11 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	status	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 4));
 
 	if (status != 0) {
-		if (status == 13) { /*  pmlmeinfo->auth_algo == dot11AuthAlgrthm_Auto) */
-			if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
-				pmlmeinfo->auth_algo = dot11AuthAlgrthm_Open;
+		if (status == 13) { /*  pmlmeinfo->auth_algo == dot11_auth_algrthm_Auto) */
+			if (pmlmeinfo->auth_algo == dot11_auth_algrthm_Shared)
+				pmlmeinfo->auth_algo = dot11_auth_algrthm_Open;
 			else
-				pmlmeinfo->auth_algo = dot11AuthAlgrthm_Shared;
+				pmlmeinfo->auth_algo = dot11_auth_algrthm_Shared;
 			/* pmlmeinfo->reauth_count = 0; */
 		}
 
@@ -891,7 +891,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	}
 
 	if (seq == 2) {
-		if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) {
+		if (pmlmeinfo->auth_algo == dot11_auth_algrthm_Shared) {
 			 /*  legendary shared system */
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&len,
 				pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
@@ -909,7 +909,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 		/* open system */
 		go2asoc = 1;
 	} else if (seq == 4) {
-		if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
+		if (pmlmeinfo->auth_algo == dot11_auth_algrthm_Shared)
 			go2asoc = 1;
 		else
 			goto authclnt_fail;
@@ -1053,7 +1053,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	/* update station supportRate */
 	pstat->bssratelen = supportRateNum;
 	memcpy(pstat->bssrateset, supportRate, supportRateNum);
-	UpdateBrateTblForSoftAP(pstat->bssrateset, pstat->bssratelen);
+	update_brate_tblForSoftAP(pstat->bssrateset, pstat->bssratelen);
 
 	/* check RSN/WPA/WPS */
 	pstat->dot8021xalg = 0;
@@ -1444,7 +1444,7 @@ unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 	pmlmeinfo->state |= WIFI_FW_ASSOC_SUCCESS;
 
 	/* Update Basic Rate Table for spec, 2010-12-28 , by thomas */
-	UpdateBrateTbl(padapter, pmlmeinfo->network.supported_rates);
+	update_brate_tbl(padapter, pmlmeinfo->network.supported_rates);
 
 report_assoc_result:
 	if (res > 0)
@@ -2657,7 +2657,7 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 		memcpy(pwlanhdr->addr3, get_my_bssid(&pmlmeinfo->network), ETH_ALEN);
 
 		/*  setting auth algo number */
-		val16 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) ? 1 : 0;/*  0:OPEN System, 1:Shared key */
+		val16 = (pmlmeinfo->auth_algo == dot11_auth_algrthm_Shared) ? 1 : 0;/*  0:OPEN System, 1:Shared key */
 		if (val16)
 			use_shared_key = 1;
 		le_tmp = cpu_to_le16(val16);
@@ -2692,7 +2692,7 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 
 			pattrib->hdrlen = sizeof(struct ieee80211_hdr_3addr);
 
-			pattrib->encrypt = _WEP40_;
+			pattrib->encrypt = WEP_40;
 
 			pattrib->icv_len = 4;
 
@@ -3882,13 +3882,13 @@ void site_survey(struct adapter *padapter)
 			/* rtw_hal_set_hwreg(padapter, HW_VAR_TXPAUSE, (u8 *)(&val8)); */
 
 			/* config MSR */
-			Set_MSR(padapter, (pmlmeinfo->state & 0x3));
+			set_msr(padapter, (pmlmeinfo->state & 0x3));
 
 			initialgain = 0xff; /* restore RX GAIN */
 			rtw_hal_set_hwreg(padapter, HW_VAR_INITIAL_GAIN, (u8 *)(&initialgain));
 			/* turn on dynamic functions */
 			Restore_DM_Func_Flag(padapter);
-			/* Switch_DM_Func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true); */
+			/* switch_dm_func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true); */
 
 			if (is_client_associated_to_ap(padapter))
 				issue_nulldata(padapter, NULL, 0, 3, 500);
@@ -3998,7 +3998,7 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 		memcpy(bssid->supported_rates + i, (p + 2), len);
 	}
 
-	bssid->network_type_in_use = Ndis802_11OFDM24;
+	bssid->network_type_in_use = ndis_802_11_ofdm_24;
 
 	if (bssid->ie_length < 12)
 		return _FAIL;
@@ -4099,7 +4099,7 @@ void start_create_ibss(struct adapter *padapter)
 
 		/* set msr to WIFI_FW_ADHOC_STATE */
 		pmlmeinfo->state = WIFI_FW_ADHOC_STATE;
-		Set_MSR(padapter, (pmlmeinfo->state & 0x3));
+		set_msr(padapter, (pmlmeinfo->state & 0x3));
 
 		/* issue beacon */
 		if (send_beacon(padapter) == _FAIL) {
@@ -4138,9 +4138,9 @@ void start_clnt_join(struct adapter *padapter)
 	caps = rtw_get_capability((struct wlan_bssid_ex *)pnetwork);
 	update_capinfo(padapter, caps);
 	if (caps&WLAN_CAPABILITY_ESS) {
-		Set_MSR(padapter, WIFI_FW_STATION_STATE);
+		set_msr(padapter, WIFI_FW_STATION_STATE);
 
-		val8 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_8021X) ? 0xcc : 0xcf;
+		val8 = (pmlmeinfo->auth_algo == dot11_auth_algrthm_8021X) ? 0xcc : 0xcf;
 
 		rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
 
@@ -4164,7 +4164,7 @@ void start_clnt_join(struct adapter *padapter)
 
 		pmlmeinfo->state = WIFI_FW_AUTH_NULL | WIFI_FW_STATION_STATE;
 	} else if (caps&WLAN_CAPABILITY_IBSS) { /* adhoc client */
-		Set_MSR(padapter, WIFI_FW_ADHOC_STATE);
+		set_msr(padapter, WIFI_FW_ADHOC_STATE);
 
 		val8 = 0xcf;
 		rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
@@ -4780,7 +4780,7 @@ static void rtw_mlmeext_disconnect(struct adapter *padapter)
 	rtw_hal_set_hwreg(padapter, HW_VAR_BSSID, null_addr);
 
 	/* set MSR to no link state -> infra. mode */
-	Set_MSR(padapter, _HW_STATE_STATION_);
+	set_msr(padapter, _HW_STATE_STATION_);
 
 	pmlmeinfo->state = WIFI_FW_NULL_STATE;
 
@@ -4823,7 +4823,7 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 
 
 	/* turn on dynamic functions */
-	Switch_DM_Func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true);
+	switch_dm_func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true);
 
 	/*  update IOT-related issue */
 	update_IOT_info(padapter);
@@ -4925,7 +4925,7 @@ void mlmeext_sta_add_event_callback(struct adapter *padapter, struct sta_info *p
 	psta->raid = networktype_to_raid_ex(padapter, psta);
 
 	/* rate radaptive */
-	Update_RA_Entry(padapter, psta);
+	update_ra_entry(padapter, psta);
 }
 
 void mlmeext_sta_del_event_callback(struct adapter *padapter)
@@ -5205,7 +5205,7 @@ u8 setopmode_hdl(struct adapter *padapter, u8 *pbuf)
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 	struct setopmode_parm *psetop = (struct setopmode_parm *)pbuf;
 
-	if (psetop->mode == Ndis802_11APMode) {
+	if (psetop->mode == ndis_802_11_ap_mode) {
 		pmlmeinfo->state = WIFI_FW_AP_STATE;
 		type = _HW_STATE_AP_;
 		/* start_ap_mode(padapter); */
@@ -5220,12 +5220,12 @@ u8 setopmode_hdl(struct adapter *padapter, u8 *pbuf)
 	}
 
 	rtw_hal_set_hwreg(padapter, HW_VAR_SET_OPMODE, (u8 *)(&type));
-	/* Set_MSR(padapter, type); */
+	/* set_msr(padapter, type); */
 
-	if (psetop->mode == Ndis802_11APMode) {
+	if (psetop->mode == ndis_802_11_ap_mode) {
 		/*  Do this after port switch to */
 		/*  prevent from downloading rsvd page to wrong port */
-		rtw_btcoex_MediaStatusNotify(padapter, 1); /* connect */
+		rtw_btcoex_media_status_notify(padapter, 1); /* connect */
 	}
 
 	return H2C_SUCCESS;
@@ -5261,7 +5261,7 @@ u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)
 
 		/* disable dynamic functions, such as high power, DIG */
 		Save_DM_Func_Flag(padapter);
-		Switch_DM_Func(padapter, DYNAMIC_FUNC_DISABLE, false);
+		switch_dm_func(padapter, DYNAMIC_FUNC_DISABLE, false);
 
 		/* config the initial gain under linking, need to write the BB registers */
 		/* initialgain = 0x1E; */
@@ -5315,8 +5315,8 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 		timer_delete_sync(&pmlmeext->link_timer);
 
 		/* set MSR to nolink -> infra. mode */
-		/* Set_MSR(padapter, _HW_STATE_NOLINK_); */
-		Set_MSR(padapter, _HW_STATE_STATION_);
+		/* set_msr(padapter, _HW_STATE_NOLINK_); */
+		set_msr(padapter, _HW_STATE_STATION_);
 
 
 		rtw_hal_set_hwreg(padapter, HW_VAR_MLME_DISCONNECT, NULL);
@@ -5411,7 +5411,7 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	}
 
 	/* disable dynamic functions, such as high power, DIG */
-	/* Switch_DM_Func(padapter, DYNAMIC_FUNC_DISABLE, false); */
+	/* switch_dm_func(padapter, DYNAMIC_FUNC_DISABLE, false); */
 
 	/* config the initial gain under linking, need to write the BB registers */
 	/* initialgain = 0x1E; */
@@ -5565,7 +5565,7 @@ u8 sitesurvey_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	if ((pmlmeext->sitesurvey_res.state == SCAN_START) || (pmlmeext->sitesurvey_res.state == SCAN_TXNULL)) {
 		/* disable dynamic functions, such as high power, DIG */
 		Save_DM_Func_Flag(padapter);
-		Switch_DM_Func(padapter, DYNAMIC_FUNC_DISABLE, false);
+		switch_dm_func(padapter, DYNAMIC_FUNC_DISABLE, false);
 
 		/* config the initial gain under scanning, need to write the BB
 		 * registers
@@ -5575,7 +5575,7 @@ u8 sitesurvey_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 		rtw_hal_set_hwreg(padapter, HW_VAR_INITIAL_GAIN, (u8 *)(&initialgain));
 
 		/* set MSR to no link state */
-		Set_MSR(padapter, _HW_STATE_NOLINK_);
+		set_msr(padapter, _HW_STATE_NOLINK_);
 
 		val8 = 1; /* under site survey */
 		rtw_hal_set_hwreg(padapter, HW_VAR_MLME_SITESURVEY, (u8 *)(&val8));
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index c60e179bb2e1..341c1797f92f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -327,7 +327,7 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
 	)
 		return false;
 
-	if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X &&
+	if (padapter->securitypriv.dot11_auth_algrthm ==.dot11_auth_algrthm_8021X &&
 	    !padapter->securitypriv.binstallGrpkey)
 		return false;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 895116e9f4e7..bd6e42caf71b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -322,7 +322,7 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 				/* rxdata_key_idx =(((iv[3])>>6)&0x3) ; */
 				mickey = &psecuritypriv->dot118021XGrprxmickey[prxattrib->key_index].skey[0];
 
-				/* psecuritypriv->dot118021XGrpKeyid, pmlmeinfo->key_index, rxdata_key_idx); */
+				/* psecuritypriv->dot11_802_1x_grp_key_id, pmlmeinfo->key_index, rxdata_key_idx); */
 
 				if (psecuritypriv->binstallGrpkey == false) {
 					res = _FAIL;
@@ -350,7 +350,7 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 
 			if (bmic_err == true) {
 				/*  double check key_index for some timing issue , */
-				/*  cannot compare with psecuritypriv->dot118021XGrpKeyid also cause timing issue */
+				/*  cannot compare with psecuritypriv->dot11_802_1x_grp_key_id also cause timing issue */
 				if ((is_multicast_ether_addr(prxattrib->ra) == true)  && (prxattrib->key_index != pmlmeinfo->key_index))
 					brpt_micerror = false;
 
@@ -392,14 +392,14 @@ static union recv_frame *decryptor(struct adapter *padapter, union recv_frame *p
 
 		if (prxattrib->key_index > WEP_KEYS) {
 			switch (prxattrib->encrypt) {
-			case _WEP40_:
+			case WEP_40:
 			case _WEP104_:
 				prxattrib->key_index = psecuritypriv->dot11PrivacyKeyIndex;
 				break;
 			case _TKIP_:
 			case _AES_:
 			default:
-				prxattrib->key_index = psecuritypriv->dot118021XGrpKeyid;
+				prxattrib->key_index = psecuritypriv->dot11_802_1x_grp_key_id;
 				break;
 			}
 		}
@@ -409,7 +409,7 @@ static union recv_frame *decryptor(struct adapter *padapter, union recv_frame *p
 		psecuritypriv->hw_decrypted = false;
 
 		switch (prxattrib->encrypt) {
-		case _WEP40_:
+		case WEP_40:
 		case _WEP104_:
 			rtw_wep_decrypt(padapter, (u8 *)precv_frame);
 			break;
@@ -454,7 +454,7 @@ static union recv_frame *portctrl(struct adapter *adapter, union recv_frame *pre
 
 	pstapriv = &adapter->stapriv;
 
-	auth_alg = adapter->securitypriv.dot11AuthAlgrthm;
+	auth_alg = adapter->securitypriv.dot11_auth_algrthm;
 
 	ptr = precv_frame->u.hdr.rx_data;
 	pfhdr = &precv_frame->u.hdr;
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 1e9eff01b1aa..8f748d623087 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -10,7 +10,7 @@
 
 static const char * const _security_type_str[] = {
 	"N/A",
-	"WEP40",
+	"_WEP40_",
 	"TKIP",
 	"TKIP_WM",
 	"AES",
@@ -57,7 +57,7 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	pframe = ((struct xmit_frame *)pxmitframe)->buf_addr + hw_hdr_offset;
 
 	/* start to encrypt each fragment */
-	if ((pattrib->encrypt == _WEP40_) || (pattrib->encrypt == _WEP104_)) {
+	if ((pattrib->encrypt == WEP_40) || (pattrib->encrypt == _WEP104_)) {
 		keylength = psecuritypriv->dot11DefKeylen[psecuritypriv->dot11PrivacyKeyIndex];
 
 		for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
@@ -105,7 +105,7 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 	pframe = (unsigned char *)((union recv_frame *)precvframe)->u.hdr.rx_data;
 
 	/* start to decrypt recvframe */
-	if ((prxattrib->encrypt == _WEP40_) || (prxattrib->encrypt == _WEP104_)) {
+	if ((prxattrib->encrypt == WEP_40) || (prxattrib->encrypt == _WEP104_)) {
 		iv = pframe+prxattrib->hdrlen;
 		/* keyindex =(iv[3]&0x3); */
 		keyindex = prxattrib->key_index;
@@ -486,9 +486,9 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 		{
 			if (is_multicast_ether_addr(pattrib->ra))
-				prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey;
+				prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot11_802_1x_grp_key_id].skey;
 			else
-				prwskey = pattrib->dot118021x_UncstKey.skey;
+				prwskey = pattrib->dot11_802_1x_uncst_key.skey;
 
 			for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
 				iv = pframe+pattrib->hdrlen;
@@ -597,7 +597,7 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 
 				prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index].skey;
 			} else {
-				prwskey = &stainfo->dot118021x_UncstKey.skey[0];
+				prwskey = &stainfo->dot11_802_1x_uncst_key.skey[0];
 			}
 
 			iv = pframe+prxattrib->hdrlen;
@@ -1051,9 +1051,9 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	/* 4 start to encrypt each fragment */
 	if (pattrib->encrypt == _AES_) {
 		if (is_multicast_ether_addr(pattrib->ra))
-			prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey;
+			prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot11_802_1x_grp_key_id].skey;
 		else
-			prwskey = pattrib->dot118021x_UncstKey.skey;
+			prwskey = pattrib->dot11_802_1x_uncst_key.skey;
 
 		for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
 			if ((curfragnum+1) == pattrib->nr_frags) {	/* 4 the last fragment */
@@ -1348,12 +1348,12 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 				no_gkey_mc_cnt = 0;
 
 				prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index].skey;
-				if (psecuritypriv->dot118021XGrpKeyid != prxattrib->key_index) {
+				if (psecuritypriv->dot11_802_1x_grp_key_id != prxattrib->key_index) {
 					res = _FAIL;
 					goto exit;
 				}
 			} else {
-				prwskey = &stainfo->dot118021x_UncstKey.skey[0];
+				prwskey = &stainfo->dot11_802_1x_uncst_key.skey[0];
 			}
 
 			length = ((union recv_frame *)precvframe)->u.hdr.len-prxattrib->hdrlen-prxattrib->iv_len;
@@ -1553,7 +1553,7 @@ void rtw_sec_restore_wep_key(struct adapter *adapter)
 	struct security_priv *securitypriv = &(adapter->securitypriv);
 	signed int keyid;
 
-	if ((_WEP40_ == securitypriv->dot11PrivacyAlgrthm) || (_WEP104_ == securitypriv->dot11PrivacyAlgrthm)) {
+	if ((WEP_40 == securitypriv->dot11_privacy_algrthm) || (_WEP104_ == securitypriv->dot11_privacy_algrthm)) {
 		for (keyid = 0; keyid < 4; keyid++) {
 			if (securitypriv->key_mask & BIT(keyid)) {
 				if (keyid == securitypriv->dot11PrivacyKeyIndex)
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 73c70b016f00..bb46108a865f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -181,7 +181,7 @@ void set_mcs_rate_by_mask(u8 *mcs_set, u32 mask)
 	mcs_set[3] &= mcs_rate_4r;
 }
 
-void UpdateBrateTbl(struct adapter *Adapter, u8 *mBratesOS)
+void update_brate_tbl(struct adapter *Adapter, u8 *mBratesOS)
 {
 	u8 i;
 	u8 rate;
@@ -203,7 +203,7 @@ void UpdateBrateTbl(struct adapter *Adapter, u8 *mBratesOS)
 	}
 }
 
-void UpdateBrateTblForSoftAP(u8 *bssrateset, u32 bssratelen)
+void update_brate_tblForSoftAP(u8 *bssrateset, u32 bssratelen)
 {
 	u8 i;
 	u8 rate;
@@ -235,7 +235,7 @@ void Restore_DM_Func_Flag(struct adapter *padapter)
 	rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_OP, (u8 *)(&bSaveFlag));
 }
 
-void Switch_DM_Func(struct adapter *padapter, u32 mode, u8 enable)
+void switch_dm_func(struct adapter *padapter, u32 mode, u8 enable)
 {
 	if (enable == true)
 		rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_SET, (u8 *)(&mode));
@@ -243,7 +243,7 @@ void Switch_DM_Func(struct adapter *padapter, u32 mode, u8 enable)
 		rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_CLR, (u8 *)(&mode));
 }
 
-void Set_MSR(struct adapter *padapter, u8 type)
+void set_msr(struct adapter *padapter, u8 type)
 {
 	rtw_hal_set_hwreg(padapter, HW_VAR_MEDIA_STATUS, (u8 *)(&type));
 }
@@ -1391,7 +1391,7 @@ unsigned char get_highest_rate_idx(u32 mask)
 	return rate_idx;
 }
 
-void Update_RA_Entry(struct adapter *padapter, struct sta_info *psta)
+void update_ra_entry(struct adapter *padapter, struct sta_info *psta)
 {
 	rtw_hal_update_ra_mask(psta, 0);
 }
@@ -1399,7 +1399,7 @@ void Update_RA_Entry(struct adapter *padapter, struct sta_info *psta)
 void set_sta_rate(struct adapter *padapter, struct sta_info *psta)
 {
 	/* rate adaptive */
-	Update_RA_Entry(padapter, psta);
+	update_ra_entry(padapter, psta);
 }
 
 static u32 get_realtek_assoc_AP_vender(struct ndis_80211_var_ie *pIE)
@@ -1483,13 +1483,13 @@ void update_IOT_info(struct adapter *padapter)
 		pmlmeinfo->turboMode_cts2self = 0;
 		pmlmeinfo->turboMode_rtsen = 1;
 		/* disable high power */
-		Switch_DM_Func(padapter, (~DYNAMIC_BB_DYNAMIC_TXPWR), false);
+		switch_dm_func(padapter, (~DYNAMIC_BB_DYNAMIC_TXPWR), false);
 		break;
 	case HT_IOT_PEER_REALTEK:
 		/* rtw_write16(padapter, 0x4cc, 0xffff); */
 		/* rtw_write16(padapter, 0x546, 0x01c0); */
 		/* disable high power */
-		Switch_DM_Func(padapter, (~DYNAMIC_BB_DYNAMIC_TXPWR), false);
+		switch_dm_func(padapter, (~DYNAMIC_BB_DYNAMIC_TXPWR), false);
 		break;
 	default:
 		pmlmeinfo->turboMode_cts2self = 0;
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 297c93d65315..5147401144c2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -381,7 +381,7 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 		while (true) {
 			/* IOT action */
 			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && (pattrib->ampdu_en == true) &&
-				(padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
+				(padapter->securitypriv.dot11_privacy_algrthm == _AES_)) {
 				pattrib->vcs_mode = CTS_TO_SELF;
 				break;
 			}
@@ -474,7 +474,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	signed int bmcast = is_multicast_ether_addr(pattrib->ra);
 
-	memset(pattrib->dot118021x_UncstKey.skey,  0, 16);
+	memset(pattrib->dot11_802_1x_uncst_key.skey,  0, 16);
 	memset(pattrib->dot11tkiptxmickey.skey,  0, 16);
 	pattrib->mac_id = psta->mac_id;
 
@@ -488,15 +488,15 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 	} else {
 		GET_ENCRY_ALGO(psecuritypriv, psta, pattrib->encrypt, bmcast);
 
-		switch (psecuritypriv->dot11AuthAlgrthm) {
-		case dot11AuthAlgrthm_Open:
-		case dot11AuthAlgrthm_Shared:
-		case dot11AuthAlgrthm_Auto:
+		switch (psecuritypriv->dot11_auth_algrthm) {
+		case dot11_auth_algrthm_Open:
+		case dot11_auth_algrthm_Shared:
+		case dot11_auth_algrthm_Auto:
 			pattrib->key_idx = (u8)psecuritypriv->dot11PrivacyKeyIndex;
 			break;
-		case dot11AuthAlgrthm_8021X:
+		case dot11_auth_algrthm_8021X:
 			if (bmcast)
-				pattrib->key_idx = (u8)psecuritypriv->dot118021XGrpKeyid;
+				pattrib->key_idx = (u8)psecuritypriv->dot11_802_1x_grp_key_id;
 			else
 				pattrib->key_idx = 0;
 			break;
@@ -506,12 +506,12 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		}
 
 		/* For WPS 1.0 WEP, driver should not encrypt EAPOL Packet for WPS handshake. */
-		if (((pattrib->encrypt == _WEP40_) || (pattrib->encrypt == _WEP104_)) && (pattrib->ether_type == 0x888e))
+		if (((pattrib->encrypt == WEP_40) || (pattrib->encrypt == _WEP104_)) && (pattrib->ether_type == 0x888e))
 			pattrib->encrypt = _NO_PRIVACY_;
 	}
 
 	switch (pattrib->encrypt) {
-	case _WEP40_:
+	case WEP_40:
 	case _WEP104_:
 		pattrib->iv_len = 4;
 		pattrib->icv_len = 4;
@@ -555,7 +555,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 	}
 
 	if (pattrib->encrypt > 0)
-		memcpy(pattrib->dot118021x_UncstKey.skey, psta->dot118021x_UncstKey.skey, 16);
+		memcpy(pattrib->dot11_802_1x_uncst_key.skey, psta->dot11_802_1x_uncst_key.skey, 16);
 
 	if (pattrib->encrypt &&
 		((padapter->securitypriv.sw_encrypt) || (!psecuritypriv->hw_decrypted)))
@@ -776,10 +776,10 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 			pframe = pxmitframe->buf_addr + hw_hdr_offset;
 
 			if (bmcst) {
-				if (!memcmp(psecuritypriv->dot118021XGrptxmickey[psecuritypriv->dot118021XGrpKeyid].skey, null_key, 16))
+				if (!memcmp(psecuritypriv->dot118021XGrptxmickey[psecuritypriv->dot11_802_1x_grp_key_id].skey, null_key, 16))
 					return _FAIL;
 				/* start to calculate the mic code */
-				rtw_secmicsetkey(&micdata, psecuritypriv->dot118021XGrptxmickey[psecuritypriv->dot118021XGrpKeyid].skey);
+				rtw_secmicsetkey(&micdata, psecuritypriv->dot118021XGrptxmickey[psecuritypriv->dot11_802_1x_grp_key_id].skey);
 			} else {
 				if (!memcmp(&pattrib->dot11tkiptxmickey.skey[0], null_key, 16))
 					return _FAIL;
@@ -838,7 +838,7 @@ static s32 xmitframe_swencrypt(struct adapter *padapter, struct xmit_frame *pxmi
 
 	if (pattrib->bswenc) {
 		switch (pattrib->encrypt) {
-		case _WEP40_:
+		case WEP_40:
 		case _WEP104_:
 			rtw_wep_encrypt(padapter, (u8 *)pxmitframe);
 			break;
@@ -1241,7 +1241,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 				goto xmitframe_coalesce_fail;
 			/* before encrypt dump the management packet content */
 			if (pattrib->encrypt > 0)
-				memcpy(pattrib->dot118021x_UncstKey.skey, psta->dot118021x_UncstKey.skey, 16);
+				memcpy(pattrib->dot11_802_1x_uncst_key.skey, psta->dot11_802_1x_uncst_key.skey, 16);
 			/* bakeup original management packet */
 			memcpy(tmp_buf, pframe, pattrib->pktlen);
 			/* move to data portion */
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index b72cf520d576..6451c55894c0 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -325,7 +325,7 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getType, void *pOutBuf)
 		break;
 
 	case BTC_GET_BL_WIFI_ENABLE_ENCRYPTION:
-		*pu8 = padapter->securitypriv.dot11PrivacyAlgrthm != 0;
+		*pu8 = padapter->securitypriv.dot11_privacy_algrthm != 0;
 		break;
 
 	case BTC_GET_BL_WIFI_UNDER_B_MODE:
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 1213a91cffff..896ba1446ea9 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -600,7 +600,7 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 
 		if (val) { /* Enable default key related setting */
 			reg_scr |= SCR_TXBCUSEDK;
-			if (sec->dot11AuthAlgrthm != dot11AuthAlgrthm_8021X)
+			if (sec->dot11_auth_algrthm != dot11_auth_algrthm_8021X)
 				reg_scr |= (SCR_RxUseDK|SCR_TxUseDK);
 		} else /* Disable default key related setting */
 			reg_scr &= ~(SCR_RXBCUSEDK|SCR_TXBCUSEDK|SCR_RxUseDK|SCR_TxUseDK);
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 0db8f623b805..397da39b7376 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -55,7 +55,7 @@ static void rtw_hal_init_opmode(struct adapter *padapter)
 	else if (fw_state & WIFI_STATION_STATE)
 		networkType = Ndis802_11Infrastructure;
 	else if (fw_state & WIFI_AP_STATE)
-		networkType = Ndis802_11APMode;
+		networkType = ndis_802_11_ap_mode;
 	else
 		return;
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 56526056dd1d..bc4bc36c8469 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -252,7 +252,7 @@ static void ConstructNullFunctionData(
 		memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
 		memcpy(pwlanhdr->addr3, StaAddr, ETH_ALEN);
 		break;
-	case Ndis802_11APMode:
+	case ndis_802_11_ap_mode:
 		SetFrDs(fctrl);
 		memcpy(pwlanhdr->addr1, StaAddr, ETH_ALEN);
 		memcpy(pwlanhdr->addr2, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index d1c875cf8e6d..359449761292 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -91,7 +91,7 @@ static void Update_ODM_ComInfo_8723b(struct adapter *Adapter)
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_RX_UNI, &(dvobj->traffic_stat.rx_bytes));
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_WM_MODE, &(pmlmeext->cur_wireless_mode));
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_SEC_CHNL_OFFSET, &(pHalData->nCur40MhzPrimeSC));
-	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_SEC_MODE, &(Adapter->securitypriv.dot11PrivacyAlgrthm));
+	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_SEC_MODE, &(Adapter->securitypriv.dot11_privacy_algrthm));
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_BW, &(pHalData->CurrentChannelBW));
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_CHNL, &(pHalData->CurrentChannel));
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_NET_CLOSED, &(Adapter->net_closed));
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e15ec6452fd0..c5a523f0e9ff 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -2003,7 +2003,7 @@ static u8 fill_txdesc_sectype(struct pkt_attrib *pattrib)
 	if ((pattrib->encrypt > 0) && !pattrib->bswenc) {
 		switch (pattrib->encrypt) {
 		/*  SEC_TYPE */
-		case _WEP40_:
+		case WEP_40:
 		case _WEP104_:
 		case _TKIP_:
 		case _TKIP_WTMIC_:
@@ -2275,12 +2275,12 @@ void rtl8723b_fill_fake_txdesc(
 	if (bDataFrame) {
 		u32 EncAlg;
 
-		EncAlg = padapter->securitypriv.dot11PrivacyAlgrthm;
+		EncAlg = padapter->securitypriv.dot11_privacy_algrthm;
 		switch (EncAlg) {
 		case _NO_PRIVACY_:
 			SET_TX_DESC_SEC_TYPE_8723B(pDesc, 0x0);
 			break;
-		case _WEP40_:
+		case WEP_40:
 		case _WEP104_:
 		case _TKIP_:
 			SET_TX_DESC_SEC_TYPE_8723B(pDesc, 0x1);
@@ -2314,7 +2314,7 @@ static void hw_var_set_opmode(struct adapter *padapter, u8 variable, u8 *val)
 		rtw_write8(padapter, REG_BCN_CTRL, val8);
 
 		/*  set net_type */
-		Set_MSR(padapter, mode);
+		set_msr(padapter, mode);
 
 		if ((mode == _HW_STATE_STATION_) || (mode == _HW_STATE_NOLINK_)) {
 			{
@@ -2813,7 +2813,7 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 			break;
 		case 2:
 			/*  sta add event callback */
-/* 				rtw_btcoex_MediaStatusNotify(padapter, RT_MEDIA_CONNECT); */
+/* 				rtw_btcoex_media_status_notify(padapter, RT_MEDIA_CONNECT); */
 			break;
 		}
 		break;
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 1098b0209200..080821f80ab6 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -89,7 +89,7 @@ enum {
 #define	IEEE_CRYPT_ALG_NAME_LEN			16
 
 #define WPA_CIPHER_NONE		BIT(0)
-#define WPA_CIPHER_WEP40	BIT(1)
+#define WPA_CIPHER__WEP40_	BIT(1)
 #define WPA_CIPHER_WEP104 BIT(2)
 #define WPA_CIPHER_TKIP		BIT(3)
 #define WPA_CIPHER_CCMP		BIT(4)
@@ -103,7 +103,7 @@ extern u8 WPA_AUTH_KEY_MGMT_NONE[];
 extern u8 WPA_AUTH_KEY_MGMT_UNSPEC_802_1X[];
 extern u8 WPA_AUTH_KEY_MGMT_PSK_OVER_802_1X[];
 extern u8 WPA_CIPHER_SUITE_NONE[];
-extern u8 WPA_CIPHER_SUITE_WEP40[];
+extern u8 WPA_CIPHER_SUITE__WEP40_[];
 extern u8 WPA_CIPHER_SUITE_TKIP[];
 extern u8 WPA_CIPHER_SUITE_WRAP[];
 extern u8 WPA_CIPHER_SUITE_CCMP[];
@@ -117,7 +117,7 @@ extern u16 RSN_VERSION_BSD;
 extern u8 RSN_AUTH_KEY_MGMT_UNSPEC_802_1X[];
 extern u8 RSN_AUTH_KEY_MGMT_PSK_OVER_802_1X[];
 extern u8 RSN_CIPHER_SUITE_NONE[];
-extern u8 RSN_CIPHER_SUITE_WEP40[];
+extern u8 RSN_CIPHER_SUITE__WEP40_[];
 extern u8 RSN_CIPHER_SUITE_TKIP[];
 extern u8 RSN_CIPHER_SUITE_WRAP[];
 extern u8 RSN_CIPHER_SUITE_CCMP[];
diff --git a/drivers/staging/rtl8723bs/include/rtw_btcoex.h b/drivers/staging/rtl8723bs/include/rtw_btcoex.h
index 19764c80b8ba..97622c8572c3 100644
--- a/drivers/staging/rtl8723bs/include/rtw_btcoex.h
+++ b/drivers/staging/rtl8723bs/include/rtw_btcoex.h
@@ -15,7 +15,7 @@
 #define	PACKET_ARP				2
 #define	PACKET_EAPOL			3
 
-void rtw_btcoex_MediaStatusNotify(struct adapter *, u8 mediaStatus);
+void rtw_btcoex_media_status_notify(struct adapter *, u8 mediaStatus);
 void rtw_btcoex_HaltNotify(struct adapter *);
 
 /*  ================================================== */
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index e665479babc2..1dde43be1e62 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -48,12 +48,12 @@
 
 
 enum {
- dot11AuthAlgrthm_Open = 0,
- dot11AuthAlgrthm_Shared,
- dot11AuthAlgrthm_8021X,
- dot11AuthAlgrthm_Auto,
- dot11AuthAlgrthm_WAPI,
- dot11AuthAlgrthm_MaxNum
+ dot11_auth_algrthm_Open = 0,
+ dot11_auth_algrthm_Shared,
+ dot11_auth_algrthm_8021X,
+ dot11_auth_algrthm_Auto,
+ dot11_auth_algrthm_WAPI,
+ dot11_auth_algrthm_MaxNum
 };
 
 /*  Scan type including active and passive scan. */
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 2080408743ef..b2d8fbbf4297 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -436,14 +436,14 @@ u8 networktype_to_raid_ex(struct adapter *adapter, struct sta_info *psta);
 
 void get_rate_set(struct adapter *padapter, unsigned char *pbssrate, int *bssrate_len);
 void set_mcs_rate_by_mask(u8 *mcs_set, u32 mask);
-void UpdateBrateTbl(struct adapter *padapter, u8 *mBratesOS);
-void UpdateBrateTblForSoftAP(u8 *bssrateset, u32 bssratelen);
+void update_brate_tbl(struct adapter *padapter, u8 *mBratesOS);
+void update_brate_tblForSoftAP(u8 *bssrateset, u32 bssratelen);
 
 void Save_DM_Func_Flag(struct adapter *padapter);
 void Restore_DM_Func_Flag(struct adapter *padapter);
-void Switch_DM_Func(struct adapter *padapter, u32 mode, u8 enable);
+void switch_dm_func(struct adapter *padapter, u32 mode, u8 enable);
 
-void Set_MSR(struct adapter *padapter, u8 type);
+void set_msr(struct adapter *padapter, u8 type);
 
 u8 rtw_get_oper_ch(struct adapter *adapter);
 void rtw_set_oper_ch(struct adapter *adapter, u8 ch);
@@ -509,7 +509,7 @@ int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie, uint var_ie_l
 
 /* for sta/adhoc mode */
 void update_sta_info(struct adapter *padapter, struct sta_info *psta);
-void Update_RA_Entry(struct adapter *padapter, struct sta_info *psta);
+void update_ra_entry(struct adapter *padapter, struct sta_info *psta);
 void set_sta_rate(struct adapter *padapter, struct sta_info *psta);
 
 unsigned int receive_disconnect(struct adapter *padapter, unsigned char *MacAddr, unsigned short reason);
diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 32f6d3a5e309..1f397a4e513a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -10,7 +10,7 @@
 #include <crypto/arc4.h>
 
 #define _NO_PRIVACY_		0x0
-#define _WEP40_				0x1
+#define WEP_40				0x1
 #define _TKIP_				0x2
 #define _TKIP_WTMIC_		0x3
 #define _AES_				0x4
@@ -18,7 +18,7 @@
 #define _WEP_WPA_MIXED_	0x07  /*  WEP + WPA */
 #define _SMS4_				0x06
 #define _BIP_				0x8
-#define is_wep_enc(alg) (((alg) == _WEP40_) || ((alg) == _WEP104_))
+#define is_wep_enc(alg) (((alg) == WEP_40) || ((alg) == _WEP104_))
 
 const char *security_type_str(u8 value);
 
@@ -91,8 +91,8 @@ struct rt_pmkid_list {
 
 
 struct security_priv {
-	u32   dot11AuthAlgrthm;		/*  802.11 auth, could be open, shared, 8021x and authswitch */
-	u32   dot11PrivacyAlgrthm;	/*  This specify the privacy for shared auth. algorithm. */
+	u32   dot11_auth_algrthm;		/*  802.11 auth, could be open, shared, 8021x and authswitch */
+	u32   dot11_privacy_algrthm;	/*  This specify the privacy for shared auth. algorithm. */
 
 	/* WEP */
 	u32   dot11PrivacyKeyIndex;	/*  this is only valid for legendary wep, 0~3 for key id. (tx key index) */
@@ -101,7 +101,7 @@ struct security_priv {
 	u8 key_mask; /* use to restore wep key after hal_init */
 
 	u32 dot118021XGrpPrivacy;	/*  This specify the privacy algthm. used for Grp key */
-	u32 dot118021XGrpKeyid;		/*  key id used for Grp Key (tx key index) */
+	u32 dot11_802_1x_grp_key_id;		/*  key id used for Grp Key (tx key index) */
 	union Keytype	dot118021XGrpKey[BIP_MAX_KEYID + 1];	/*  802.1x Group Key, for inx0 and inx1 */
 	union Keytype	dot118021XGrptxmickey[BIP_MAX_KEYID + 1];
 	union Keytype	dot118021XGrprxmickey[BIP_MAX_KEYID + 1];
@@ -170,20 +170,20 @@ struct security_priv {
 
 #define GET_ENCRY_ALGO(psecuritypriv, psta, encry_algo, bmcst)\
 do {\
-	switch (psecuritypriv->dot11AuthAlgrthm) {\
-	case dot11AuthAlgrthm_Open:\
-	case dot11AuthAlgrthm_Shared:\
-	case dot11AuthAlgrthm_Auto:\
-		encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
+	switch (psecuritypriv->dot11_auth_algrthm) {\
+	case dot11_auth_algrthm_Open:\
+	case dot11_auth_algrthm_Shared:\
+	case dot11_auth_algrthm_Auto:\
+		encry_algo = (u8)psecuritypriv->dot11_privacy_algrthm;\
 		break;\
-	case dot11AuthAlgrthm_8021X:\
+	case dot11_auth_algrthm_8021X:\
 		if (bmcst)\
 			encry_algo = (u8)psecuritypriv->dot118021XGrpPrivacy;\
 		else\
-			encry_algo = (u8)psta->dot118021XPrivacy;\
+			encry_algo = (u8)psta->dot11_802_1x_privacy;\
 		break;\
-	case dot11AuthAlgrthm_WAPI:\
-		encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
+	case dot11_auth_algrthm_WAPI:\
+		encry_algo = (u8)psecuritypriv->dot11_privacy_algrthm;\
 		break;\
 	} \
 } while (0)
@@ -191,7 +191,7 @@ do {\
 #define SET_ICE_IV_LEN(iv_len, icv_len, encrypt)\
 do {\
 	switch (encrypt) {\
-	case _WEP40_:\
+	case WEP_40:\
 	case _WEP104_:\
 		iv_len = 4;\
 		icv_len = 4;\
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index 544468f57692..8beac7166ea2 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -181,7 +181,7 @@ struct pkt_attrib {
 	u8 cts2self;
 	union Keytype	dot11tkiptxmickey;
 	/* union Keytype	dot11tkiprxmickey; */
-	union Keytype	dot118021x_UncstKey;
+	union Keytype	dot11_802_1x_uncst_key;
 
 	u8 icmp_pkt;
 
diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index b3535fed3de7..5955262cd177 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -87,10 +87,10 @@ struct sta_info {
 	u8 hwaddr[ETH_ALEN];
 
 	uint	ieee8021x_blocked;	/* 0: allowed, 1:blocked */
-	uint	dot118021XPrivacy; /* aes, tkip... */
+	uint	dot11_802_1x_privacy; /* aes, tkip... */
 	union Keytype	dot11tkiptxmickey;
 	union Keytype	dot11tkiprxmickey;
-	union Keytype	dot118021x_UncstKey;
+	union Keytype	dot11_802_1x_uncst_key;
 	union pn48		dot11txpn;			/*  PN48 used for Unicast xmit */
 	union pn48		dot11wtxpn;			/*  PN48 used for Unicast mgmt xmit. */
 	union pn48		dot11rxpn;			/*  PN48 used for Unicast recv. */
diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index eb38594c8f5c..e7247434f5d5 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -26,9 +26,9 @@ struct ndis_802_11_ssid {
 
 enum ndis_802_11_network_type {
 	Ndis802_11FH,
-	Ndis802_11DS,
+	ndis_802_11_ds,
 	Ndis802_11OFDM5,
-	Ndis802_11OFDM24,
+	ndis_802_11_ofdm_24,
 	Ndis802_11NetworkTypeMax    /*  not a real type, defined as an upper bound */
 };
 
@@ -48,7 +48,7 @@ enum ndis_802_11_network_infrastructure {
 	Ndis802_11Infrastructure,
 	Ndis802_11AutoUnknown,
 	Ndis802_11InfrastructureMax,     /*  Not a real value, defined as upper bound */
-	Ndis802_11APMode,
+	ndis_802_11_ap_mode,
 };
 
 struct ndis_802_11_fix_ie {
@@ -73,7 +73,7 @@ struct ndis_80211_var_ie {
  * define a macro to present the partial sum.
  */
 enum ndis_802_11_authentication_mode {
-	Ndis802_11AuthModeOpen,
+	ndis_802_11_auth_mode_open,
 	Ndis802_11AuthModeShared,
 	Ndis802_11AuthModeAutoSwitch,
 	Ndis802_11AuthModeWPA,
@@ -86,8 +86,8 @@ enum ndis_802_11_authentication_mode {
 enum {
 	Ndis802_11WEPEnabled,
 	Ndis802_11Encryption1Enabled = Ndis802_11WEPEnabled,
-	Ndis802_11WEPDisabled,
-	Ndis802_11EncryptionDisabled = Ndis802_11WEPDisabled,
+	ndis_802_11_wep_disabled,
+	Ndis802_11EncryptionDisabled = ndis_802_11_wep_disabled,
 	Ndis802_11WEPKeyAbsent,
 	Ndis802_11Encryption1KeyAbsent = Ndis802_11WEPKeyAbsent,
 	Ndis802_11WEPNotSupported,
@@ -126,8 +126,8 @@ struct ndis_802_11_wep {
 /*  MIC check time, 60 seconds. */
 #define MIC_CHECK_TIME	60000000
 
-#ifndef Ndis802_11APMode
-#define Ndis802_11APMode (Ndis802_11InfrastructureMax + 1)
+#ifndef ndis_802_11_ap_mode
+#define ndis_802_11_ap_mode (Ndis802_11InfrastructureMax + 1)
 #endif
 
 struct wlan_phy_info {
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 7fcc46a0bb48..4ccc6fed9e36 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -18,7 +18,7 @@
 #define RTW_MAX_NUM_PMKIDS 4
 
 static const u32 rtw_cipher_suites[] = {
-	WLAN_CIPHER_SUITE_WEP40,
+	WLAN_CIPHER_SUITE__WEP40_,
 	WLAN_CIPHER_SUITE_WEP104,
 	WLAN_CIPHER_SUITE_TKIP,
 	WLAN_CIPHER_SUITE_CCMP,
@@ -543,13 +543,13 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 		if (psecuritypriv->bWepDefaultKeyIdxSet == 0) {
 			/* wep default key has not been set, so use this key index as default key. */
 
-			psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Auto;
+			psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_Auto;
 			psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
-			psecuritypriv->dot11PrivacyAlgrthm = _WEP40_;
-			psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
+			psecuritypriv->dot11_privacy_algrthm = WEP_40;
+			psecuritypriv->dot118021XGrpPrivacy = WEP_40;
 
 			if (wep_key_len == 13) {
-				psecuritypriv->dot11PrivacyAlgrthm = _WEP104_;
+				psecuritypriv->dot11_privacy_algrthm = _WEP104_;
 				psecuritypriv->dot118021XGrpPrivacy = _WEP104_;
 			}
 
@@ -572,7 +572,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 			if (strcmp(param->u.crypt.alg, "WEP") == 0) {
 				memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
 
-				psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
+				psecuritypriv->dot118021XGrpPrivacy = WEP_40;
 				if (param->u.crypt.key_len == 13)
 					psecuritypriv->dot118021XGrpPrivacy = _WEP104_;
 
@@ -595,35 +595,35 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 				psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
 			}
 
-			psecuritypriv->dot118021XGrpKeyid = param->u.crypt.idx;
+			psecuritypriv->dot11_802_1x_grp_key_id = param->u.crypt.idx;
 
 			psecuritypriv->binstallGrpkey = true;
 
-			psecuritypriv->dot11PrivacyAlgrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
+			psecuritypriv->dot11_privacy_algrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
 
 			rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot118021XGrpPrivacy, param->u.crypt.idx);
 
 			pbcmc_sta = rtw_get_bcmc_stainfo(padapter);
 			if (pbcmc_sta) {
 				pbcmc_sta->ieee8021x_blocked = false;
-				pbcmc_sta->dot118021XPrivacy = psecuritypriv->dot118021XGrpPrivacy;/* rx will use bmc_sta's dot118021XPrivacy */
+				pbcmc_sta->dot11_802_1x_privacy = psecuritypriv->dot118021XGrpPrivacy;/* rx will use bmc_sta's dot11_802_1x_privacy */
 			}
 		}
 
 		goto exit;
 	}
 
-	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X && psta) { /*  psk/802_1x */
+	if (psecuritypriv->dot11_auth_algrthm ==.dot11_auth_algrthm_8021X && psta) { /*  psk/802_1x */
 		if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 			if (param->u.crypt.set_tx == 1) { /* pairwise key */
-				memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+				memcpy(psta->dot11_802_1x_uncst_key.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
 
 				if (strcmp(param->u.crypt.alg, "WEP") == 0) {
-					psta->dot118021XPrivacy = _WEP40_;
+					psta->dot11_802_1x_privacy = WEP_40;
 					if (param->u.crypt.key_len == 13)
-						psta->dot118021XPrivacy = _WEP104_;
+						psta->dot11_802_1x_privacy = _WEP104_;
 				} else if (strcmp(param->u.crypt.alg, "TKIP") == 0) {
-					psta->dot118021XPrivacy = _TKIP_;
+					psta->dot11_802_1x_privacy = _TKIP_;
 
 					/* set mic key */
 					memcpy(psta->dot11tkiptxmickey.skey, &(param->u.crypt.key[16]), 8);
@@ -632,9 +632,9 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 					psecuritypriv->busetkipkey = true;
 
 				} else if (strcmp(param->u.crypt.alg, "CCMP") == 0) {
-					psta->dot118021XPrivacy = _AES_;
+					psta->dot11_802_1x_privacy = _AES_;
 				} else {
-					psta->dot118021XPrivacy = _NO_PRIVACY_;
+					psta->dot11_802_1x_privacy = _NO_PRIVACY_;
 				}
 
 				rtw_ap_set_pairwise_key(padapter, psta);
@@ -647,7 +647,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 				if (strcmp(param->u.crypt.alg, "WEP") == 0) {
 					memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
 
-					psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
+					psecuritypriv->dot118021XGrpPrivacy = WEP_40;
 					if (param->u.crypt.key_len == 13)
 						psecuritypriv->dot118021XGrpPrivacy = _WEP104_;
 				} else if (strcmp(param->u.crypt.alg, "TKIP") == 0) {
@@ -669,18 +669,18 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 					psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
 				}
 
-				psecuritypriv->dot118021XGrpKeyid = param->u.crypt.idx;
+				psecuritypriv->dot11_802_1x_grp_key_id = param->u.crypt.idx;
 
 				psecuritypriv->binstallGrpkey = true;
 
-				psecuritypriv->dot11PrivacyAlgrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
+				psecuritypriv->dot11_privacy_algrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
 
 				rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot118021XGrpPrivacy, param->u.crypt.idx);
 
 				pbcmc_sta = rtw_get_bcmc_stainfo(padapter);
 				if (pbcmc_sta) {
 					pbcmc_sta->ieee8021x_blocked = false;
-					pbcmc_sta->dot118021XPrivacy = psecuritypriv->dot118021XGrpPrivacy;/* rx will use bmc_sta's dot118021XPrivacy */
+					pbcmc_sta->dot11_802_1x_privacy = psecuritypriv->dot118021XGrpPrivacy;/* rx will use bmc_sta's dot11_802_1x_privacy */
 				}
 			}
 		}
@@ -741,11 +741,11 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 			wep_key_len = wep_key_len <= 5 ? 5 : 13;
 
 			psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
-			psecuritypriv->dot11PrivacyAlgrthm = _WEP40_;
-			psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
+			psecuritypriv->dot11_privacy_algrthm = WEP_40;
+			psecuritypriv->dot118021XGrpPrivacy = WEP_40;
 
 			if (wep_key_len == 13) {
-				psecuritypriv->dot11PrivacyAlgrthm = _WEP104_;
+				psecuritypriv->dot11_privacy_algrthm = _WEP104_;
 				psecuritypriv->dot118021XGrpPrivacy = _WEP104_;
 			}
 
@@ -761,7 +761,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 		goto exit;
 	}
 
-	if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) { /*  802_1x */
+	if (padapter->securitypriv.dot11_auth_algrthm ==.dot11_auth_algrthm_8021X) { /*  802_1x */
 		struct sta_info *psta, *pbcmc_sta;
 		struct sta_priv *pstapriv = &padapter->stapriv;
 
@@ -774,12 +774,12 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 
 				if ((padapter->securitypriv.ndisencryptstatus == Ndis802_11Encryption2Enabled) ||
 				    (padapter->securitypriv.ndisencryptstatus ==  Ndis802_11Encryption3Enabled)) {
-					psta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
+					psta->dot11_802_1x_privacy = padapter->securitypriv.dot11_privacy_algrthm;
 				}
 
 				if (param->u.crypt.set_tx == 1) { /* pairwise key */
 
-					memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
+					memcpy(psta->dot11_802_1x_uncst_key.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
 
 					if (strcmp(param->u.crypt.alg, "TKIP") == 0) { /* set mic key */
 						memcpy(psta->dot11tkiptxmickey.skey, &(param->u.crypt.key[16]), 8);
@@ -797,7 +797,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 						memcpy(padapter->securitypriv.dot118021XGrprxmickey[param->u.crypt.idx].skey, &(param->u.crypt.key[24]), 8);
 						padapter->securitypriv.binstallGrpkey = true;
 
-						padapter->securitypriv.dot118021XGrpKeyid = param->u.crypt.idx;
+						padapter->securitypriv.dot11_802_1x_grp_key_id = param->u.crypt.idx;
 						rtw_set_key(padapter, &padapter->securitypriv, param->u.crypt.idx, 1, true);
 					} else if (strcmp(param->u.crypt.alg, "BIP") == 0) {
 						/* save the IGTK key, length 16 bytes */
@@ -816,7 +816,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 
 				if ((padapter->securitypriv.ndisencryptstatus == Ndis802_11Encryption2Enabled) ||
 				    (padapter->securitypriv.ndisencryptstatus ==  Ndis802_11Encryption3Enabled)) {
-					pbcmc_sta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
+					pbcmc_sta->dot11_802_1x_privacy = padapter->securitypriv.dot11_privacy_algrthm;
 				}
 			}
 		} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) { /* adhoc mode */
@@ -855,7 +855,7 @@ static int cfg80211_rtw_add_key(struct wiphy *wiphy, struct net_device *ndev,
 		/* remove = 1; */
 		alg_name = "none";
 		break;
-	case WLAN_CIPHER_SUITE_WEP40:
+	case WLAN_CIPHER_SUITE__WEP40_:
 	case WLAN_CIPHER_SUITE_WEP104:
 		alg_name = "WEP";
 		break;
@@ -940,15 +940,15 @@ static int cfg80211_rtw_set_default_key(struct wiphy *wiphy,
 	struct adapter *padapter = rtw_netdev_priv(ndev);
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 
-	if ((key_index < WEP_KEYS) && ((psecuritypriv->dot11PrivacyAlgrthm == _WEP40_) || (psecuritypriv->dot11PrivacyAlgrthm == _WEP104_))) { /* set wep default key */
+	if ((key_index < WEP_KEYS) && ((psecuritypriv->dot11_privacy_algrthm == WEP_40) || (psecuritypriv->dot11_privacy_algrthm == _WEP104_))) { /* set wep default key */
 		psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
 
 		psecuritypriv->dot11PrivacyKeyIndex = key_index;
 
-		psecuritypriv->dot11PrivacyAlgrthm = _WEP40_;
-		psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
+		psecuritypriv->dot11_privacy_algrthm = WEP_40;
+		psecuritypriv->dot118021XGrpPrivacy = WEP_40;
 		if (psecuritypriv->dot11DefKeylen[key_index] == 13) {
-			psecuritypriv->dot11PrivacyAlgrthm = _WEP104_;
+			psecuritypriv->dot11_privacy_algrthm = _WEP104_;
 			psecuritypriv->dot118021XGrpPrivacy = _WEP104_;
 		}
 
@@ -1062,7 +1062,7 @@ static int cfg80211_rtw_change_iface(struct wiphy *wiphy,
 		networkType = Ndis802_11Infrastructure;
 		break;
 	case NL80211_IFTYPE_AP:
-		networkType = Ndis802_11APMode;
+		networkType = ndis_802_11_ap_mode;
 		break;
 	default:
 		ret = -EOPNOTSUPP;
@@ -1306,7 +1306,7 @@ static int cfg80211_rtw_set_wiphy_params(struct wiphy *wiphy, u32 changed)
 static int rtw_cfg80211_set_wpa_version(struct security_priv *psecuritypriv, u32 wpa_version)
 {
 	if (!wpa_version) {
-		psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
+		psecuritypriv->ndisauthtype = ndis_802_11_auth_mode_open;
 		return 0;
 	}
 
@@ -1322,26 +1322,26 @@ static int rtw_cfg80211_set_auth_type(struct security_priv *psecuritypriv,
 	switch (sme_auth_type) {
 	case NL80211_AUTHTYPE_AUTOMATIC:
 
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Auto;
+		psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_Auto;
 
 		break;
 	case NL80211_AUTHTYPE_OPEN_SYSTEM:
 
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;
+		psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_Open;
 
 		if (psecuritypriv->ndisauthtype > Ndis802_11AuthModeWPA)
-			psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_8021X;
 
 		break;
 	case NL80211_AUTHTYPE_SHARED_KEY:
 
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Shared;
+		psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_Shared;
 
 		psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
 
 		break;
 	default:
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;
+		psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_Open;
 		/* return -ENOTSUPP; */
 	}
 
@@ -1352,7 +1352,7 @@ static int rtw_cfg80211_set_cipher(struct security_priv *psecuritypriv, u32 ciph
 {
 	u32 ndisencryptstatus = Ndis802_11EncryptionDisabled;
 
-	u32 *profile_cipher = ucast ? &psecuritypriv->dot11PrivacyAlgrthm :
+	u32 *profile_cipher = ucast ? &psecuritypriv->dot11_privacy_algrthm :
 		&psecuritypriv->dot118021XGrpPrivacy;
 
 	if (!cipher) {
@@ -1366,8 +1366,8 @@ static int rtw_cfg80211_set_cipher(struct security_priv *psecuritypriv, u32 ciph
 		*profile_cipher = _NO_PRIVACY_;
 		ndisencryptstatus = Ndis802_11EncryptionDisabled;
 		break;
-	case WLAN_CIPHER_SUITE_WEP40:
-		*profile_cipher = _WEP40_;
+	case WLAN_CIPHER_SUITE__WEP40_:
+		*profile_cipher = WEP_40;
 		ndisencryptstatus = Ndis802_11Encryption1Enabled;
 		break;
 	case WLAN_CIPHER_SUITE_WEP104:
@@ -1389,7 +1389,7 @@ static int rtw_cfg80211_set_cipher(struct security_priv *psecuritypriv, u32 ciph
 	if (ucast) {
 		psecuritypriv->ndisencryptstatus = ndisencryptstatus;
 
-		/* if (psecuritypriv->dot11PrivacyAlgrthm >= _AES_) */
+		/* if (psecuritypriv->dot11_privacy_algrthm >= _AES_) */
 		/*	psecuritypriv->ndisauthtype = Ndis802_11AuthModeWPA2PSK; */
 	}
 
@@ -1400,9 +1400,9 @@ static int rtw_cfg80211_set_key_mgt(struct security_priv *psecuritypriv, u32 key
 {
 	if (key_mgt == WLAN_AKM_SUITE_8021X)
 		/* auth_type = UMAC_AUTH_TYPE_8021X; */
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+		psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_8021X;
 	else if (key_mgt == WLAN_AKM_SUITE_PSK) {
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+		psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_8021X;
 	}
 
 	return 0;
@@ -1445,7 +1445,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	pwpa = rtw_get_wpa_ie(buf, &wpa_ielen, ielen);
 	if (pwpa && wpa_ielen > 0) {
 		if (rtw_parse_wpa_ie(pwpa, wpa_ielen + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
-			padapter->securitypriv.dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			padapter->securitypriv.dot11_auth_algrthm =.dot11_auth_algrthm_8021X;
 			padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeWPAPSK;
 			memcpy(padapter->securitypriv.supplicant_ie, &pwpa[0], wpa_ielen + 2);
 		}
@@ -1454,7 +1454,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	pwpa2 = rtw_get_wpa2_ie(buf, &wpa2_ielen, ielen);
 	if (pwpa2 && wpa2_ielen > 0) {
 		if (rtw_parse_wpa2_ie(pwpa2, wpa2_ielen + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
-			padapter->securitypriv.dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			padapter->securitypriv.dot11_auth_algrthm =.dot11_auth_algrthm_8021X;
 			padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeWPA2PSK;
 			memcpy(padapter->securitypriv.supplicant_ie, &pwpa2[0], wpa2_ielen + 2);
 		}
@@ -1471,8 +1471,8 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 		padapter->securitypriv.dot118021XGrpPrivacy = _NO_PRIVACY_;
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11EncryptionDisabled;
 		break;
-	case WPA_CIPHER_WEP40:
-		padapter->securitypriv.dot118021XGrpPrivacy = _WEP40_;
+	case WPA_CIPHER__WEP40_:
+		padapter->securitypriv.dot118021XGrpPrivacy = WEP_40;
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption1Enabled;
 		break;
 	case WPA_CIPHER_TKIP:
@@ -1491,23 +1491,23 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 
 	switch (pairwise_cipher) {
 	case WPA_CIPHER_NONE:
-		padapter->securitypriv.dot11PrivacyAlgrthm = _NO_PRIVACY_;
+		padapter->securitypriv.dot11_privacy_algrthm = _NO_PRIVACY_;
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11EncryptionDisabled;
 		break;
-	case WPA_CIPHER_WEP40:
-		padapter->securitypriv.dot11PrivacyAlgrthm = _WEP40_;
+	case WPA_CIPHER__WEP40_:
+		padapter->securitypriv.dot11_privacy_algrthm = WEP_40;
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption1Enabled;
 		break;
 	case WPA_CIPHER_TKIP:
-		padapter->securitypriv.dot11PrivacyAlgrthm = _TKIP_;
+		padapter->securitypriv.dot11_privacy_algrthm = _TKIP_;
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption2Enabled;
 		break;
 	case WPA_CIPHER_CCMP:
-		padapter->securitypriv.dot11PrivacyAlgrthm = _AES_;
+		padapter->securitypriv.dot11_privacy_algrthm = _AES_;
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption3Enabled;
 		break;
 	case WPA_CIPHER_WEP104:
-		padapter->securitypriv.dot11PrivacyAlgrthm = _WEP104_;
+		padapter->securitypriv.dot11_privacy_algrthm = _WEP104_;
 		padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption1Enabled;
 		break;
 	}
@@ -1527,9 +1527,9 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	}
 
 	/* TKIP and AES disallow multicast packets until installing group key */
-	if (padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_
-		|| padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_WTMIC_
-		|| padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)
+	if (padapter->securitypriv.dot11_privacy_algrthm == _TKIP_
+		|| padapter->securitypriv.dot11_privacy_algrthm == _TKIP_WTMIC_
+		|| padapter->securitypriv.dot11_privacy_algrthm == _AES_)
 		/* WPS open need to enable multicast */
 		/*  check_fwstate(&padapter->mlmepriv, WIFI_UNDER_WPS) == true) */
 		rtw_hal_set_hwreg(padapter, HW_VAR_OFF_RCR_AM, null_addr);
@@ -1575,10 +1575,10 @@ static int cfg80211_rtw_join_ibss(struct wiphy *wiphy, struct net_device *ndev,
 	memcpy(ndis_ssid.ssid, (u8 *)params->ssid, params->ssid_len);
 
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
-	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
+	psecuritypriv->dot11_privacy_algrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
-	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
-	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
+	psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_Open; /* open system */
+	psecuritypriv->ndisauthtype = ndis_802_11_auth_mode_open;
 
 	ret = rtw_cfg80211_set_auth_type(psecuritypriv, NL80211_AUTHTYPE_OPEN_SYSTEM);
 	rtw_set_802_11_authentication_mode(padapter, psecuritypriv->ndisauthtype);
@@ -1671,10 +1671,10 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 		rtw_scan_abort(padapter);
 
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
-	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
+	psecuritypriv->dot11_privacy_algrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
-	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
-	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
+	psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_Open; /* open system */
+	psecuritypriv->ndisauthtype = ndis_802_11_auth_mode_open;
 
 	ret = rtw_cfg80211_set_wpa_version(psecuritypriv, sme->crypto.wpa_versions);
 	if (ret < 0)
@@ -1696,8 +1696,8 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 	}
 
 	/* For WEP Shared auth */
-	if ((psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_Shared ||
-	     psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_Auto) && sme->key) {
+	if ((psecuritypriv->dot11_auth_algrthm ==.dot11_auth_algrthm_Shared ||
+	     psecuritypriv->dot11_auth_algrthm ==.dot11_auth_algrthm_Auto) && sme->key) {
 		u32 wep_key_idx, wep_key_len, wep_total_len;
 		struct ndis_802_11_wep	 *pwep = NULL;
 
@@ -1724,7 +1724,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 			pwep->length = wep_total_len;
 
 			if (wep_key_len == 13) {
-				padapter->securitypriv.dot11PrivacyAlgrthm = _WEP104_;
+				padapter->securitypriv.dot11_privacy_algrthm = _WEP104_;
 				padapter->securitypriv.dot118021XGrpPrivacy = _WEP104_;
 			}
 		} else {
diff --git a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
index 1904e82a24b5..8b822aaaf008 100644
--- a/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/mlme_linux.c
@@ -69,7 +69,7 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 
 	spin_lock_bh(&adapter->security_key_mutex);
 
-	if (adapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) {
+	if (adapter->securitypriv.dot11_auth_algrthm ==.dot11_auth_algrthm_8021X) {
 		/* 802.1x */
 		/*  Added by Albert 2009/02/18 */
 		/*  We have to backup the PMK information for WiFi PMK Caching test item. */
@@ -94,8 +94,8 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		adapter->securitypriv.btkip_countermeasure = backupTKIPCountermeasure;
 		adapter->securitypriv.btkip_countermeasure_time = backupTKIPcountermeasure_time;
 
-		adapter->securitypriv.ndisauthtype = Ndis802_11AuthModeOpen;
-		adapter->securitypriv.ndisencryptstatus = Ndis802_11WEPDisabled;
+		adapter->securitypriv.ndisauthtype = ndis_802_11_auth_mode_open;
+		adapter->securitypriv.ndisencryptstatus = ndis_802_11_wep_disabled;
 
 	} else {
 		/* reset values in securitypriv */
@@ -103,15 +103,15 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		/*  */
 		struct security_priv *psec_priv = &adapter->securitypriv;
 
-		psec_priv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;  /* open system */
-		psec_priv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
+		psec_priv->dot11_auth_algrthm =.dot11_auth_algrthm_Open;  /* open system */
+		psec_priv->dot11_privacy_algrthm = _NO_PRIVACY_;
 		psec_priv->dot11PrivacyKeyIndex = 0;
 
 		psec_priv->dot118021XGrpPrivacy = _NO_PRIVACY_;
-		psec_priv->dot118021XGrpKeyid = 1;
+		psec_priv->dot11_802_1x_grp_key_id = 1;
 
-		psec_priv->ndisauthtype = Ndis802_11AuthModeOpen;
-		psec_priv->ndisencryptstatus = Ndis802_11WEPDisabled;
+		psec_priv->ndisauthtype = ndis_802_11_auth_mode_open;
+		psec_priv->ndisencryptstatus = ndis_802_11_wep_disabled;
 		/*  */
 	}
 	/*  add for CONFIG_IEEE80211W, none 11w also can use */
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 0248dff8f2aa..0938b63331d4 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -528,16 +528,16 @@ static void rtw_init_default_value(struct adapter *padapter)
 	psecuritypriv->sw_encrypt = pregistrypriv->software_encrypt;
 	psecuritypriv->sw_decrypt = pregistrypriv->software_decrypt;
 
-	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
-	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
+	psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_Open; /* open system */
+	psecuritypriv->dot11_privacy_algrthm = _NO_PRIVACY_;
 
 	psecuritypriv->dot11PrivacyKeyIndex = 0;
 
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
-	psecuritypriv->dot118021XGrpKeyid = 1;
+	psecuritypriv->dot11_802_1x_grp_key_id = 1;
 
-	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
-	psecuritypriv->ndisencryptstatus = Ndis802_11WEPDisabled;
+	psecuritypriv->ndisauthtype = ndis_802_11_auth_mode_open;
+	psecuritypriv->ndisencryptstatus = ndis_802_11_wep_disabled;
 
 	/* registry_priv */
 	rtw_init_registrypriv_dev_network(padapter);
-- 
2.49.0

