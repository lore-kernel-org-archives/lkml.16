Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA15120E014
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 01:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738720228; cv=none; b=a69am4j+kaQ6vip3hvSBGQPkzpIMd1logeU8INyn3BQ9xcv7gC4nNupoCe1O9EdeEiGGZgNeD94pXa+ddZ8ayHuxoFmEhcShbkvGBWLzL0LGPtw9ZGXV0uiaj898PEj1+LqjqB7QY8hz9iH7AI75Z8Qp/gISwK8gDtM/CeKtmLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738720228; c=relaxed/simple;
	bh=U7EjI4mmZ1iOFRRE6EMeYiJgbg/RfoLqZiujeP9G7Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LMtsAkKLbjldmFmd0wCCJCUFpJLkTGimf7dNj4xHIPoR9ayqhOkXvhqp8ASMuJ6pY8a7B4bndp5RjsR0fxqAcIgHvJ3JEcMsrEWNjA1rb4tuu94oEafHSGUmwd/bt3XXNqCYYIB3EiRi4quulvD+0uVk0grWxjrvzsF6KZotJ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfaPOjeB; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfaPOjeB"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21c2f1b610dso148205315ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 17:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738720226; x=1739325026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XyNMfxY5YoMNmSd3BdK4HA6mtOMD2456Zcbxpy+7YM=;
        b=EfaPOjeBauS30va0kXYtqZ5MxLk0hb8to+DbZ88STpe3PJ8IUUSa+c/UF/8S0Jv9BQ
         nDxZiBlDY5DPlJ13IM6fiYeSBivUzSyqm6R5I8jdif4iY0Czy7d5VQRN1IlLOAZ2TgUt
         /wS1Mbf11bD9WolyQV0F/zphrFUW1ZOIfXfrlPEOc/R14MOJ4BTwgZVkkAsoUdP5Kf+u
         2qp32ZbQMabkbhXRhsJbJlzr0kcbvcvNLs/iVBlX3V1U6KLG0710DjJy7DNpi3yqrDLS
         JrfKE7Vbn1KU8SWFK3Z/ubqKLr5dGWv48J/14NtmFezVZYEoMFsw+64DTATSCZJRNMDd
         qxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738720226; x=1739325026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XyNMfxY5YoMNmSd3BdK4HA6mtOMD2456Zcbxpy+7YM=;
        b=jjUODpytTZanZ/ttuzv2gwi+wziJmo4WW2uxwEpIO+YIU62FRioYHruJHnzm2jaNq+
         9i5MZ3v+mAJgTEmrua4vDGAGKiW/iGL1PjgOFLa48T8vzPNhRlH+Ei/yZ/j58Sa0E1rn
         XgmVto4ypVvfgIT1s4HYGb/p7QPaBQFcEDyFsvIGTf4gep8Gj0ghYwwGP9qX4/gPFsl2
         6X7oA3t5LWt+Yc54mwdU5p9eeAlVBgwrglDXBjzO0UaWeqSt1Kml912ru6H5VxvZnGDn
         zUn9uW/abaSi2ROXxrYRVXSDXw0KLhRHErEhMgrXXP2bzYsc+gXZ5CLxBZg+sL3H8qaa
         l6Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUBgjHRqsC7AH4307MOgzsvcElTFgti1nJNFNFvYqfbifXc59ZxLwDSz6YriByw9ECcJYV2UxKMLVMvHM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZD95pzzuqh/TkwxTVq+EsR9+RC4T5+IGLuOe2Pq7AK3FXhPoE
	PbA/QWZwwuzpfE+IZeusiFnatITvl6kk25kIXamAhiaTgiqif64W
X-Gm-Gg: ASbGncufJoniudxaRVnbmyJUV3b4F4WBcKPcRm9/F8+cs53gUOQDccaLQZNwNfwUhm9
	dYUUTiZzOI2qzmISy1QKZw+Ub5bu8uDT6LkbDWG1XgLQ/NM9dj8+f5xPgIim1rTGUNcFkbLQIDI
	TNMGyPJ1rvOPAsfFcMhDFTmKTSQ7YaL484cD3kGThMosWnednS4XuW1sWQMy4KPBHumUEeBMc6N
	iKpgK0PI7jJIKvWkzxX3fH6vtlblKIzZghPXMZh/ChvIhx8pBkoRfqhStcdWrq4XRSlM6gmC1Gh
	qWxO8cWSINvjb4OodF+Olbg=
X-Google-Smtp-Source: AGHT+IE/qLeJ8FQFICj88GuBYdjWkkVl43CPEpFozLtnuR1zrVDN5MnzN6OeAvgw2X6055gFO0kyBw==
X-Received: by 2002:a17:903:2383:b0:21f:baa:80c1 with SMTP id d9443c01a7336-21f17eee758mr21208345ad.53.1738720226113;
        Tue, 04 Feb 2025 17:50:26 -0800 (PST)
Received: from DESKTOP-GL3U3CJ ([146.70.174.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f01d19457sm23585635ad.153.2025.02.04.17.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:50:25 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 2/4] staging: rtl8723bs: break up long lines
Date: Tue,  4 Feb 2025 17:50:17 -0800
Message-ID: <ffcbf36f8542bd47e781a823e8cd63ae8b4e897c.1738720049.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <cover.1738720049.git.onlyian4981@gmail.com>
References: <cover.1738720049.git.onlyian4981@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Long lines were broken up into smaller ones to comply with coding style.

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 135 +++++++++++++---------
 1 file changed, 82 insertions(+), 53 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 5fbae82ddc72..e33f37f71d92 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -95,7 +95,8 @@ void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv)
 	rtw_free_mlme_ie_data(&pmlmepriv->p2p_beacon_ie, &pmlmepriv->p2p_beacon_ie_len);
 	rtw_free_mlme_ie_data(&pmlmepriv->p2p_probe_req_ie, &pmlmepriv->p2p_probe_req_ie_len);
 	rtw_free_mlme_ie_data(&pmlmepriv->p2p_probe_resp_ie, &pmlmepriv->p2p_probe_resp_ie_len);
-	rtw_free_mlme_ie_data(&pmlmepriv->p2p_go_probe_resp_ie, &pmlmepriv->p2p_go_probe_resp_ie_len);
+	rtw_free_mlme_ie_data(&pmlmepriv->p2p_go_probe_resp_ie,
+			      &pmlmepriv->p2p_go_probe_resp_ie_len);
 	rtw_free_mlme_ie_data(&pmlmepriv->p2p_assoc_req_ie, &pmlmepriv->p2p_assoc_req_ie_len);
 }
 
@@ -178,9 +179,9 @@ void _rtw_free_network_nolock(struct	mlme_priv *pmlmepriv, struct wlan_network *
 	if (pnetwork->fixed)
 		return;
 
-	list_del_init(&(pnetwork->list));
+	list_del_init(&pnetwork->list);
 
-	list_add_tail(&(pnetwork->list), get_list_head(free_queue));
+	list_add_tail(&pnetwork->list, get_list_head(free_queue));
 }
 
 /*
@@ -286,7 +287,7 @@ void rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
 void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnetwork);
 void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnetwork)
 {
-	_rtw_free_network_nolock(&(padapter->mlmepriv), pnetwork);
+	_rtw_free_network_nolock(&padapter->mlmepriv, pnetwork);
 	rtw_cfg80211_unlink_bss(padapter, pnetwork);
 }
 
@@ -347,10 +348,10 @@ int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 fea
 			(d_cap & WLAN_CAPABILITY_IBSS)) &&
 			((s_cap & WLAN_CAPABILITY_ESS) ==
 			(d_cap & WLAN_CAPABILITY_ESS));
-
 }
 
-struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue, struct wlan_network *network)
+struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue,
+					    struct wlan_network *network)
 {
 	struct list_head *phead, *plist;
 	struct wlan_network *found = NULL;
@@ -588,11 +589,12 @@ int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwor
 	privacy = pnetwork->network.privacy;
 
 	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
-		if (rtw_get_wps_ie(pnetwork->network.ies+_FIXED_IE_LENGTH_, pnetwork->network.ie_length-_FIXED_IE_LENGTH_, NULL, &wps_ielen))
+		if (rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_,
+				   pnetwork->network.ie_length - _FIXED_IE_LENGTH_,
+				   NULL, &wps_ielen))
 			return true;
 		else
 			return false;
-
 	}
 	if (adapter->registrypriv.wifi_spec == 1) { /* for  correct flow of 8021X  to do.... */
 		u8 *p = NULL;
@@ -602,7 +604,8 @@ int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwor
 			bselected = false;
 
 		if (psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPA2PSK) {
-			p = rtw_get_ie(pnetwork->network.ies + _BEACON_IE_OFFSET_, WLAN_EID_RSN, &ie_len, (pnetwork->network.ie_length - _BEACON_IE_OFFSET_));
+			p = rtw_get_ie(pnetwork->network.ies + _BEACON_IE_OFFSET_, WLAN_EID_RSN,
+				       &ie_len, (pnetwork->network.ie_length - _BEACON_IE_OFFSET_));
 			if (p && ie_len > 0)
 				bselected = true;
 			else
@@ -614,7 +617,8 @@ int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwor
 		bselected = false;
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) {
-		if (pnetwork->network.infrastructure_mode != pmlmepriv->cur_network.network.infrastructure_mode)
+		if (pnetwork->network.infrastructure_mode !=
+		    pmlmepriv->cur_network.network.infrastructure_mode)
 			bselected = false;
 	}
 
@@ -642,7 +646,8 @@ void rtw_survey_event_callback(struct adapter	*adapter, u8 *pbuf)
 
 	/*  update IBSS_network 's timestamp */
 	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) == true) {
-		if (!memcmp(&(pmlmepriv->cur_network.network.mac_address), pnetwork->mac_address, ETH_ALEN)) {
+		if (!memcmp(&pmlmepriv->cur_network.network.mac_address,
+			    pnetwork->mac_address, ETH_ALEN)) {
 			struct wlan_network *ibss_wlan = NULL;
 
 			memcpy(pmlmepriv->cur_network.network.ies, pnetwork->ies, 8);
@@ -705,7 +710,8 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 					/* pmlmepriv->fw_state ^= _FW_UNDER_SURVEY;because don't set assoc_timer */
 					_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);
 
-					memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid, sizeof(struct ndis_802_11_ssid));
+					memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid,
+					       sizeof(struct ndis_802_11_ssid));
 
 					rtw_update_registrypriv_dev_network(adapter);
 					rtw_generate_random_ibss(pibss);
@@ -732,8 +738,9 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 				rtw_indicate_connect(adapter);
 			} else {
 				if (rtw_to_roam(adapter) != 0) {
-					if (rtw_dec_to_roam(adapter) == 0
-						|| _SUCCESS != rtw_sitesurvey_cmd(adapter, &pmlmepriv->assoc_ssid, 1, NULL, 0)
+					if (rtw_dec_to_roam(adapter) == 0 ||
+					    _SUCCESS != rtw_sitesurvey_cmd(adapter,
+									   &pmlmepriv->assoc_ssid, 1, NULL, 0)
 					) {
 						rtw_set_to_roam(adapter, 0);
 						rtw_free_assoc_resources(adapter, 1);
@@ -749,10 +756,11 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 		}
 	} else {
 		if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
-			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)
-				&& check_fwstate(pmlmepriv, _FW_LINKED)) {
+			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) &&
+			    check_fwstate(pmlmepriv, _FW_LINKED)) {
 				if (rtw_select_roaming_candidate(pmlmepriv) == _SUCCESS) {
-					receive_disconnect(adapter, pmlmepriv->cur_network.network.mac_address
+					receive_disconnect(adapter,
+							   pmlmepriv->cur_network.network.mac_address
 						, WLAN_REASON_ACTIVE_ROAM);
 				}
 			}
@@ -893,8 +901,8 @@ void rtw_indicate_disconnect(struct adapter *padapter)
 	if (rtw_to_roam(padapter) > 0)
 		_clr_fwstate_(pmlmepriv, _FW_LINKED);
 
-	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED)
-		|| (rtw_to_roam(padapter) <= 0)
+	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) ||
+	    (rtw_to_roam(padapter) <= 0)
 	) {
 		rtw_os_indicate_disconnect(padapter);
 
@@ -929,9 +937,8 @@ void rtw_scan_abort(struct adapter *adapter)
 
 	start = jiffies;
 	pmlmeext->scan_abort = true;
-	while (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)
-		&& jiffies_to_msecs(start) <= 200) {
-
+	while (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) &&
+	       jiffies_to_msecs(start) <= 200) {
 		if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
 			break;
 
@@ -944,7 +951,8 @@ void rtw_scan_abort(struct adapter *adapter)
 	pmlmeext->scan_abort = false;
 }
 
-static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, struct wlan_network *pnetwork)
+static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter,
+						   struct wlan_network *pnetwork)
 {
 	int i;
 	struct sta_info *bmc_sta, *psta = NULL;
@@ -1029,7 +1037,8 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 
 /* pnetwork : returns from rtw_joinbss_event_callback */
 /* ptarget_wlan: found from scanned_queue */
-static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_network *ptarget_wlan, struct wlan_network  *pnetwork)
+static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_network *ptarget_wlan,
+				       struct wlan_network  *pnetwork)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_network  *cur_network = &pmlmepriv->cur_network;
@@ -1069,10 +1078,12 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 			break;
 	}
 
-	rtw_update_protection(padapter, (cur_network->network.ies) + sizeof(struct ndis_802_11_fix_ie),
-									(cur_network->network.ie_length));
+	rtw_update_protection(padapter,
+			      (cur_network->network.ies) + sizeof(struct ndis_802_11_fix_ie),
+			      (cur_network->network.ie_length));
 
-	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8) cur_network->network.configuration.ds_config);
+	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length,
+			  (u8)cur_network->network.configuration.ds_config);
 }
 
 /* Notes: the function could be > passive_level (the same context as Rx tasklet) */
@@ -1096,7 +1107,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 
 	rtw_get_encrypt_decrypt_from_registrypriv(adapter);
 
-	the_same_macaddr = !memcmp(pnetwork->network.mac_address, cur_network->network.mac_address, ETH_ALEN);
+	the_same_macaddr = !memcmp(pnetwork->network.mac_address,
+				   cur_network->network.mac_address, ETH_ALEN);
 
 	pnetwork->network.length = get_wlan_bssid_ex_sz(&pnetwork->network);
 	if (pnetwork->network.length > sizeof(struct wlan_bssid_ex))
@@ -1114,9 +1126,11 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 			/* s1. find ptarget_wlan */
 			if (check_fwstate(pmlmepriv, _FW_LINKED)) {
 				if (the_same_macaddr) {
-					ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
+					ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue,
+									cur_network->network.mac_address);
 				} else {
-					pcur_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
+					pcur_wlan = rtw_find_network(&pmlmepriv->scanned_queue,
+								     cur_network->network.mac_address);
 					if (pcur_wlan)
 						pcur_wlan->fixed = false;
 
@@ -1366,9 +1380,11 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 
 		if (adapter->registrypriv.wifi_spec == 1) {
 			roam = false;
-		} else if (reason == WLAN_REASON_EXPIRATION_CHK && rtw_chk_roam_flags(adapter, RTW_ROAM_ON_EXPIRED)) {
+		} else if (reason == WLAN_REASON_EXPIRATION_CHK &&
+			   rtw_chk_roam_flags(adapter, RTW_ROAM_ON_EXPIRED)) {
 			roam = true;
-		} else if (reason == WLAN_REASON_ACTIVE_ROAM && rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
+		} else if (reason == WLAN_REASON_ACTIVE_ROAM &&
+			   rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
 			roam = true;
 			roam_target = pmlmepriv->roam_network;
 		}
@@ -1409,7 +1425,8 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 
 			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 			/* free old ibss network */
-			pwlan = rtw_find_network(&pmlmepriv->scanned_queue, tgt_network->network.mac_address);
+			pwlan = rtw_find_network(&pmlmepriv->scanned_queue,
+						 tgt_network->network.mac_address);
 			if (pwlan) {
 				pwlan->fixed = false;
 				rtw_free_network_nolock(adapter, pwlan);
@@ -1419,9 +1436,11 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 			pdev_network = &adapter->registrypriv.dev_network;
 			pibss = adapter->registrypriv.dev_network.mac_address;
 
-			memcpy(pdev_network, &tgt_network->network, get_wlan_bssid_ex_sz(&tgt_network->network));
+			memcpy(pdev_network, &tgt_network->network,
+			       get_wlan_bssid_ex_sz(&tgt_network->network));
 
-			memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid, sizeof(struct ndis_802_11_ssid));
+			memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid,
+			       sizeof(struct ndis_802_11_ssid));
 
 			rtw_update_registrypriv_dev_network(adapter);
 
@@ -1543,9 +1562,8 @@ static void rtw_auto_scan_handler(struct adapter *padapter)
 
 	rtw_mlme_reset_auto_scan_int(padapter);
 
-	if (pmlmepriv->auto_scan_int_ms != 0
-		&& jiffies_to_msecs(jiffies - pmlmepriv->scan_start_time) > pmlmepriv->auto_scan_int_ms) {
-
+	if (pmlmepriv->auto_scan_int_ms != 0 &&
+	    jiffies_to_msecs(jiffies - pmlmepriv->scan_start_time) > pmlmepriv->auto_scan_int_ms) {
 		if (!padapter->registrypriv.wifi_spec) {
 			if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING) == true)
 				goto exit;
@@ -1575,8 +1593,8 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
 	if (adapter->net_closed)
 		return;
 
-	if ((adapter_to_pwrctl(adapter)->fw_current_in_ps_mode)
-		&& !(hal_btcoex_IsBtControlLps(adapter))
+	if ((adapter_to_pwrctl(adapter)->fw_current_in_ps_mode) &&
+	    !(hal_btcoex_IsBtControlLps(adapter))
 		) {
 		u8 bEnterPS;
 
@@ -1647,7 +1665,8 @@ static int rtw_check_roaming_candidate(struct mlme_priv *mlme
 	if (jiffies_to_msecs(jiffies - competitor->last_scanned) >= mlme->roam_scanr_exp_ms)
 		goto exit;
 
-	if (competitor->network.rssi - mlme->cur_network_scanned->network.rssi < mlme->roam_rssi_diff_th)
+	if (competitor->network.rssi - mlme->cur_network_scanned->network.rssi <
+	    mlme->roam_rssi_diff_th)
 		goto exit;
 
 	if (*candidate && (*candidate)->network.rssi >= competitor->network.rssi)
@@ -1720,8 +1739,9 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 
 	/* check ssid, if needed */
 	if (mlme->assoc_ssid.ssid[0] && mlme->assoc_ssid.ssid_length) {
-		if (competitor->network.ssid.ssid_length != mlme->assoc_ssid.ssid_length
-			|| memcmp(competitor->network.ssid.ssid, mlme->assoc_ssid.ssid, mlme->assoc_ssid.ssid_length)
+		if (competitor->network.ssid.ssid_length != mlme->assoc_ssid.ssid_length ||
+		    memcmp(competitor->network.ssid.ssid, mlme->assoc_ssid.ssid,
+			   mlme->assoc_ssid.ssid_length)
 		)
 			goto exit;
 	}
@@ -1730,8 +1750,9 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 		goto exit;
 
 	if (rtw_to_roam(adapter) > 0) {
-		if (jiffies_to_msecs(jiffies - competitor->last_scanned) >= mlme->roam_scanr_exp_ms
-			|| is_same_ess(&competitor->network, &mlme->cur_network.network) == false
+		if (jiffies_to_msecs(jiffies - competitor->last_scanned) >=
+		    mlme->roam_scanr_exp_ms ||
+		    is_same_ess(&competitor->network, &mlme->cur_network.network) == false
 		)
 			goto exit;
 	}
@@ -1917,7 +1938,8 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 }
 
 /* adjust ies for rtw_joinbss_cmd in WMM */
-int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len, uint initial_out_len)
+int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len,
+			uint initial_out_len)
 {
 	unsigned	int ielength = 0;
 	unsigned int i, j;
@@ -1926,7 +1948,8 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	while (i < in_len) {
 		ielength = initial_out_len;
 
-		if (in_ie[i] == 0xDD && in_ie[i+2] == 0x00 && in_ie[i+3] == 0x50  && in_ie[i+4] == 0xF2 && in_ie[i+5] == 0x02 && i+5 < in_len) { /* WMM element ID and OUI */
+		if (in_ie[i] == 0xDD && in_ie[i + 2] == 0x00 && in_ie[i + 3] == 0x50  &&
+		    in_ie[i + 4] == 0xF2 && in_ie[i + 5] == 0x02 && i + 5 < in_len) { /* WMM element ID and OUI */
 			for (j = i; j < i + 9; j++) {
 				out_ie[ielength] = in_ie[j];
 				ielength++;
@@ -2017,8 +2040,9 @@ signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, u
 		ielength += psecuritypriv->wps_ie_len;
 	} else if ((authmode == WLAN_EID_VENDOR_SPECIFIC) || (authmode == WLAN_EID_RSN)) {
 		/* copy RSN or SSN */
-		memcpy(&out_ie[ielength], &psecuritypriv->supplicant_ie[0], psecuritypriv->supplicant_ie[1]+2);
-		ielength += psecuritypriv->supplicant_ie[1]+2;
+		memcpy(&out_ie[ielength], &psecuritypriv->supplicant_ie[0],
+		       psecuritypriv->supplicant_ie[1] + 2);
+		ielength += psecuritypriv->supplicant_ie[1] + 2;
 		rtw_report_sec_ie(adapter, authmode, psecuritypriv->supplicant_ie);
 	}
 
@@ -2198,7 +2222,8 @@ void rtw_build_wmm_ie_ht(struct adapter *padapter, u8 *out_ie, uint *pout_len)
 }
 
 /* the function is >= passive_level */
-unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_ie, uint in_len, uint *pout_len, u8 channel)
+unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_ie,
+				   uint in_len, uint *pout_len, u8 channel)
 {
 	u32 ielen, out_len;
 	enum ieee80211_max_ampdu_length_exp max_rx_ampdu_factor;
@@ -2351,7 +2376,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 
 	/* check Max Rx A-MPDU Size */
 	len = 0;
-	p = rtw_get_ie(pie+sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_CAPABILITY, &len, ie_len-sizeof(struct ndis_802_11_fix_ie));
+	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_CAPABILITY, &len,
+		       ie_len - sizeof(struct ndis_802_11_fix_ie));
 	if (p && len > 0) {
 		pht_capie = (struct ieee80211_ht_cap *)(p+2);
 		max_ampdu_sz = (pht_capie->ampdu_params_info & IEEE80211_HT_CAP_AMPDU_FACTOR);
@@ -2362,7 +2388,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 	}
 
 	len = 0;
-	p = rtw_get_ie(pie+sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_OPERATION, &len, ie_len-sizeof(struct ndis_802_11_fix_ie));
+	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_OPERATION, &len,
+		       ie_len - sizeof(struct ndis_802_11_fix_ie));
 	if (p && len > 0) {
 		/* todo: */
 	}
@@ -2495,13 +2522,15 @@ void rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 	_rtw_roaming(padapter, tgt_network);
 	spin_unlock_bh(&pmlmepriv->lock);
 }
+
 void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_network *cur_network = &pmlmepriv->cur_network;
 
 	if (rtw_to_roam(padapter) > 0) {
-		memcpy(&pmlmepriv->assoc_ssid, &cur_network->network.ssid, sizeof(struct ndis_802_11_ssid));
+		memcpy(&pmlmepriv->assoc_ssid, &cur_network->network.ssid,
+		       sizeof(struct ndis_802_11_ssid));
 
 		pmlmepriv->assoc_by_bssid = false;
 
-- 
2.45.3

