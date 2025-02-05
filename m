Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3AB21128F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 01:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738720230; cv=none; b=X1AtyfCFnyHTbBEDCPjte/Hb78Fo33AAXvZpv8DIqcBp8KtTys4R3oyCB5dHYdujSuJ7ODvOTV36iHrOfmWW4Og0eFzw1BCiiXosD2Y8dCzSB39Efxp34Q6kxxLlycPkXHAtEQyaAbQCb7GpW8mR5AW7e+KE1xqffwh8iUOhkb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738720230; c=relaxed/simple;
	bh=c2VTN2W1nRF0pZZq+dlOuESRn5VnZB/1yQJjq13S4s4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hp+QrZsro5nRo2tWAdTj2ZWz/oKNZ+qnur2JqYeub5hvQrL47rCsmvQu0S9njp4FnaAlHdrlg4VuYgDSUcpJKD4DjN2bV3l2NINQrBKmxHeWrFb99ofhJDH4enaz+CMooArk9v1mU5pc826rZHr5dn18F1cR+0DmvgPvpHLDNO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGwlqzRE; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGwlqzRE"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21f0bc811dbso5286595ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 17:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738720228; x=1739325028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSX8ryuK3S8lNUicFwqniT9eS96hC7AK+sPyMLhyXhU=;
        b=TGwlqzREAARrmvjfVHjOXTOpkgYJ/XRkNQ+sSZuzcge8N+KlMeSmSmtrvhNwuVOLHm
         ZJT9ZfCONSQk2ZTr3UfcDvnZuCNc9OrSkNa5Bdbw5getBroNDQjcptzh7HhE74IRw5UR
         8aIZe+eaBDlGeqlsUn38FCpeM6/YTVpB6XxTGxqEL20+vga60AbcIpCQyKDZ61BfEtp2
         +ahgMgP1g/VsBoveMo73qg8NSyHpirCVs9DXOjN7CWoXBjZQ8ZsyvGkbDuSn7gFXiQkt
         Q6q5dteyn3el76vVNNtecintaIzdCz33qsjM1dSyAqbQYpUHVE05Zn9yf3nkn/5sfq0G
         If7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738720228; x=1739325028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZSX8ryuK3S8lNUicFwqniT9eS96hC7AK+sPyMLhyXhU=;
        b=ifyQ6Ji6fl7g+DEo3ASu0ckLqzlMexyJlceHlJ4MxAicfDass7Jc55RtvKil80eYPn
         pPP3b0W/aLaQRmFku/NHc0VrDGIax38J/ZrXdhydg0YEt+f7RrfMgdoGV7bnDNpnK+iT
         qUgJPTpRtaI7gmIu7jWeM4zQrHOqZezVsf6kkLVEQZAdO5FRXESImi9ci9Xr/xoPFAsj
         v8sU4dztNEIO2u5yfyKmRSQ/7v0AwtllK/DJmAVHDhuvzMZREbzdA0Uu1u/Wy/F7sHgO
         ObXnr2JNvQJ1vsrGNE/nl2IrIvvk95pti3CO0BLwhEEZrLdv9IdtkF7HgYY1mtM3RYvk
         LyMg==
X-Forwarded-Encrypted: i=1; AJvYcCU5sbR0OErFnRzGPP9AgKZYPrzVCp542LLU9PGapyBwUyEAKrmUpN2noWrK2x/kQs85PKhf20pbfcM8O4I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9qJh8q4A+m3lKVIvEAaYXRhg7qVno2INyMbn5StJv8uiPhdZr
	2KnrecsRWS9RHxpiqsdH4snD4IcJ4PnHhWZahNTpe5W9Y9HQyBMW
X-Gm-Gg: ASbGncs+isDGkLY6+o+QQpcOMcMIGhsOUomQonxnJatg9j+m0dnszw2bf468mLefYgy
	dAX8amboTbugaYtKzkxE5CdA+/QA/6C1P8zNlqlwjWWenr3Ide0tP5AKtvcNTk30scgxB2qLXuj
	KswOc6qJoaMuj6JjctTsHZDsOEhNGgBgvXnsW96ckk2jqv7nQcqS+IMPXeGdi7Nw8gI18F0se+H
	8PiE9G2zsoZ2qb+AlPsMpER2vEv1pknTq9Kr7ZshH8dP0tWrZhEvEnEuF4HzqP7un4GNbY4yLQd
	lRvfE9JRtU3B9604/CIk0mM=
X-Google-Smtp-Source: AGHT+IFiFvSYxcg0SM88lbp3FidV8ium9N04sA3SYMiW6rmtm7x9jnQ1lUa40c1gsBsqlzVSaHfKFw==
X-Received: by 2002:a05:6a20:3d81:b0:1e1:b0e8:11dc with SMTP id adf61e73a8af0-1ede8344fe0mr1691167637.21.1738720227625;
        Tue, 04 Feb 2025 17:50:27 -0800 (PST)
Received: from DESKTOP-GL3U3CJ ([146.70.174.231])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebe94af26sm9118495a12.45.2025.02.04.17.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:50:27 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 3/4] staging: rtl8723bs: fix spacing issues
Date: Tue,  4 Feb 2025 17:50:18 -0800
Message-ID: <31e556ebf3b356e604b9c72122b031c1a91e20dd.1738720049.git.onlyian4981@gmail.com>
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

Spacing was not compliant with the coding style.

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 110 +++++++++-------------
 1 file changed, 47 insertions(+), 63 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index e33f37f71d92..4d8dc7646867 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -151,7 +151,7 @@ void _rtw_free_network(struct	mlme_priv *pmlmepriv, struct wlan_network *pnetwor
 		return;
 
 	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true))
+	    (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true))
 		lifetime = 1;
 
 	if (!isfreeall) {
@@ -225,11 +225,9 @@ void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
 
 	phead = get_list_head(scanned_queue);
 	list_for_each_safe(plist, tmp, phead) {
-
 		pnetwork = list_entry(plist, struct wlan_network, list);
 
 		_rtw_free_network(pmlmepriv, pnetwork, isfreeall);
-
 	}
 
 	spin_unlock_bh(&scanned_queue->lock);
@@ -240,7 +238,7 @@ signed int rtw_if_up(struct adapter *padapter)
 	signed int res;
 
 	if (padapter->bDriverStopped || padapter->bSurpriseRemoved ||
-		(check_fwstate(&padapter->mlmepriv, _FW_LINKED) == false))
+	    (check_fwstate(&padapter->mlmepriv, _FW_LINKED) == false))
 		res = false;
 	else
 		res =  true;
@@ -256,8 +254,8 @@ void rtw_generate_random_ibss(u8 *pibss)
 	pibss[1] = 0x11;
 	pibss[2] = 0x87;
 	pibss[3] = (u8)(curtime & 0xff) ;/* p[0]; */
-	pibss[4] = (u8)((curtime>>8) & 0xff) ;/* p[1]; */
-	pibss[5] = (u8)((curtime>>16) & 0xff) ;/* p[2]; */
+	pibss[4] = (u8)((curtime >> 8) & 0xff) ;/* p[1]; */
+	pibss[5] = (u8)((curtime >> 16) & 0xff) ;/* p[2]; */
 }
 
 u8 *rtw_get_capability_from_ie(u8 *ie)
@@ -309,7 +307,7 @@ int rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
 	struct security_priv *psecuritypriv = &adapter->securitypriv;
 
 	if ((psecuritypriv->dot11PrivacyAlgrthm != _NO_PRIVACY_) &&
-		    (pnetwork->network.privacy == 0))
+	    (pnetwork->network.privacy == 0))
 		ret = false;
 	else if ((psecuritypriv->dot11PrivacyAlgrthm == _NO_PRIVACY_) &&
 		 (pnetwork->network.privacy == 1))
@@ -318,13 +316,12 @@ int rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
 		ret = true;
 
 	return ret;
-
 }
 
 inline int is_same_ess(struct wlan_bssid_ex *a, struct wlan_bssid_ex *b)
 {
-	return (a->ssid.ssid_length == b->ssid.ssid_length)
-		&&  !memcmp(a->ssid.ssid, b->ssid.ssid, a->ssid.ssid_length);
+	return (a->ssid.ssid_length == b->ssid.ssid_length) &&
+		!memcmp(a->ssid.ssid, b->ssid.ssid, a->ssid.ssid_length);
 }
 
 int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 feature)
@@ -380,7 +377,6 @@ struct	wlan_network	*rtw_get_oldest_wlan_network(struct __queue *scanned_queue)
 	phead = get_list_head(scanned_queue);
 
 	list_for_each(plist, phead) {
-
 		pwlan = list_entry(plist, struct wlan_network, list);
 
 		if (!pwlan->fixed) {
@@ -389,11 +385,10 @@ struct	wlan_network	*rtw_get_oldest_wlan_network(struct __queue *scanned_queue)
 		}
 	}
 	return oldest;
-
 }
 
 void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
-	struct adapter *padapter, bool update_ie)
+		    struct adapter *padapter, bool update_ie)
 {
 	long rssi_ori = dst->rssi;
 
@@ -411,21 +406,20 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 		sq_final = padapter->recvpriv.signal_qual;
 		/* the rssi value here is undecorated, and will be used for antenna diversity */
 		if (sq_smp != 101) /* from the right channel */
-			rssi_final = (src->rssi+dst->rssi*4)/5;
+			rssi_final = (src->rssi + dst->rssi * 4) / 5;
 		else
 			rssi_final = rssi_ori;
 	} else {
 		if (sq_smp != 101) { /* from the right channel */
-			ss_final = ((u32)(src->phy_info.signal_strength)+(u32)(dst->phy_info.signal_strength)*4)/5;
-			sq_final = ((u32)(src->phy_info.signal_quality)+(u32)(dst->phy_info.signal_quality)*4)/5;
-			rssi_final = (src->rssi+dst->rssi*4)/5;
+			ss_final = ((u32)(src->phy_info.signal_strength) + (u32)(dst->phy_info.signal_strength) * 4) / 5;
+			sq_final = ((u32)(src->phy_info.signal_quality) + (u32)(dst->phy_info.signal_quality) * 4) / 5;
+			rssi_final = (src->rssi + dst->rssi * 4) / 5;
 		} else {
 			/* bss info not receiving from the right channel, use the original RX signal infos */
 			ss_final = dst->phy_info.signal_strength;
 			sq_final = dst->phy_info.signal_quality;
 			rssi_final = dst->rssi;
 		}
-
 	}
 
 	if (update_ie) {
@@ -842,14 +836,14 @@ void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 	struct dvobj_priv *psdpriv = adapter->dvobj;
 	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 
-	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE|WIFI_AP_STATE)) {
+	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_AP_STATE)) {
 		struct sta_info *psta;
 
 		psta = rtw_get_stainfo(&adapter->stapriv, tgt_network->network.mac_address);
 		rtw_free_stainfo(adapter,  psta);
 	}
 
-	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE|WIFI_AP_STATE)) {
+	if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE)) {
 		struct sta_info *psta;
 
 		rtw_free_all_stainfo(adapter);
@@ -878,7 +872,6 @@ void rtw_indicate_connect(struct adapter *padapter)
 	pmlmepriv->to_join = false;
 
 	if (!check_fwstate(&padapter->mlmepriv, _FW_LINKED)) {
-
 		set_fwstate(pmlmepriv, _FW_LINKED);
 
 		rtw_os_indicate_connect(padapter);
@@ -886,7 +879,6 @@ void rtw_indicate_connect(struct adapter *padapter)
 
 	rtw_set_to_roam(padapter, 0);
 	rtw_set_scan_deny(padapter, 3000);
-
 }
 
 /*
@@ -896,7 +888,7 @@ void rtw_indicate_disconnect(struct adapter *padapter)
 {
 	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-	_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING|WIFI_UNDER_WPS);
+	_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING | WIFI_UNDER_WPS);
 
 	if (rtw_to_roam(padapter) > 0)
 		_clr_fwstate_(pmlmepriv, _FW_LINKED);
@@ -923,7 +915,7 @@ inline void rtw_indicate_scan_done(struct adapter *padapter, bool aborted)
 
 	if ((!adapter_to_pwrctl(padapter)->bInSuspend) &&
 	    (!check_fwstate(&padapter->mlmepriv,
-			    WIFI_ASOC_STATE|WIFI_UNDER_LINKING))) {
+			    WIFI_ASOC_STATE | WIFI_UNDER_LINKING))) {
 		rtw_set_ips_deny(padapter, 0);
 		_set_timer(&padapter->mlmepriv.dynamic_chk_timer, 1);
 	}
@@ -1032,7 +1024,6 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter,
 	}
 
 	return psta;
-
 }
 
 /* pnetwork : returns from rtw_joinbss_event_callback */
@@ -1064,8 +1055,8 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	switch (pnetwork->network.infrastructure_mode) {
 	case Ndis802_11Infrastructure:
 
-			if (pmlmepriv->fw_state&WIFI_UNDER_WPS)
-				pmlmepriv->fw_state = WIFI_STATION_STATE|WIFI_UNDER_WPS;
+			if (pmlmepriv->fw_state & WIFI_UNDER_WPS)
+				pmlmepriv->fw_state = WIFI_STATION_STATE | WIFI_UNDER_WPS;
 			else
 				pmlmepriv->fw_state = WIFI_STATION_STATE;
 
@@ -1320,7 +1311,7 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 	spin_lock_bh(&pmlmepriv->lock);
 
 	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
+	    (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
 		if (adapter->stapriv.asoc_sta_count == 2) {
 			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
@@ -1360,13 +1351,13 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 	if (mac_id >= 0) {
 		u16 media_status;
 
-		media_status = (mac_id<<8)|0; /*   MACID|OPMODE:0 means disconnect */
+		media_status = (mac_id << 8) | 0; /*   MACID|OPMODE:0 means disconnect */
 		/* for STA, AP, ADHOC mode, report disconnect stauts to FW */
 		rtw_hal_set_hwreg(adapter, HW_VAR_H2C_MEDIA_STATUS_RPT, (u8 *)&media_status);
 	}
 
 	/* if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) */
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)
 		return;
 
 	mlmeext_sta_del_event_callback(adapter);
@@ -1416,8 +1407,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 	}
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
-	      check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
-
+	    check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 		rtw_free_stainfo(adapter,  psta);
 
 		if (adapter->stapriv.asoc_sta_count == 1) {/* a sta + bc/mc_stainfo (not Ibss_stainfo) */
@@ -1455,7 +1445,6 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 			if (ret != _SUCCESS)
 				goto unlock;
 		}
-
 	}
 
 unlock:
@@ -1548,7 +1537,7 @@ void rtw_mlme_reset_auto_scan_int(struct adapter *adapter)
 	if (pmlmeinfo->VHT_enable) /* disable auto scan when connect to 11AC AP */
 		mlme->auto_scan_int_ms = 0;
 	else if (adapter->registrypriv.wifi_spec && is_client_associated_to_ap(adapter) == true)
-		mlme->auto_scan_int_ms = 60*1000;
+		mlme->auto_scan_int_ms = 60 * 1000;
 	else if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
 		if (check_fwstate(mlme, WIFI_STATION_STATE) && check_fwstate(mlme, _FW_LINKED))
 			mlme->auto_scan_int_ms = mlme->roam_scan_int_ms;
@@ -1794,12 +1783,10 @@ int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
 
 	phead = get_list_head(queue);
 	list_for_each(pmlmepriv->pscanned, phead) {
-
 		pnetwork = list_entry(pmlmepriv->pscanned,
 				      struct wlan_network, list);
 
 		rtw_check_join_candidate(pmlmepriv, &candidate, pnetwork);
-
 	}
 
 	if (!candidate) {
@@ -1961,11 +1948,10 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 			break;
 		}
 
-		i += (in_ie[i+1]+2); /*  to the next IE element */
+		i += (in_ie[i + 1] + 2); /*  to the next IE element */
 	}
 
 	return ielength;
-
 }
 
 /*  */
@@ -1986,7 +1972,7 @@ static int SecIsInPMKIDList(struct adapter *Adapter, u8 *bssid)
 
 	for (i = 0; i < NUM_PMKID_CACHE; i++)
 		if ((p->PMKIDList[i].bUsed) &&
-				(!memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN)))
+		    (!memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN)))
 			return i;
 	return -1;
 }
@@ -2035,7 +2021,7 @@ signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, u
 		authmode = WLAN_EID_RSN;
 
 	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
-		memcpy(out_ie+ielength, psecuritypriv->wps_ie, psecuritypriv->wps_ie_len);
+		memcpy(out_ie + ielength, psecuritypriv->wps_ie, psecuritypriv->wps_ie_len);
 
 		ielength += psecuritypriv->wps_ie_len;
 	} else if ((authmode == WLAN_EID_VENDOR_SPECIFIC) || (authmode == WLAN_EID_RSN)) {
@@ -2130,7 +2116,7 @@ void rtw_joinbss_reset(struct adapter *padapter)
 	u8 threshold;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-	struct ht_priv 	*phtpriv = &pmlmepriv->htpriv;
+	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
 
 	/* todo: if you want to do something io/reg/hw setting before join_bss, please add code here */
 
@@ -2156,11 +2142,11 @@ void rtw_joinbss_reset(struct adapter *padapter)
 
 void rtw_ht_use_default_setting(struct adapter *padapter)
 {
-	struct mlme_priv 	*pmlmepriv = &padapter->mlmepriv;
-	struct ht_priv 	*phtpriv = &pmlmepriv->htpriv;
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
-	bool		bHwLDPCSupport = false, bHwSTBCSupport = false;
-	bool		bHwSupportBeamformer = false, bHwSupportBeamformee = false;
+	bool bHwLDPCSupport = false, bHwSTBCSupport = false;
+	bool bHwSupportBeamformer = false, bHwSupportBeamformee = false;
 
 	if (pregistrypriv->wifi_spec)
 		phtpriv->bss_coexist = 1;
@@ -2214,7 +2200,7 @@ void rtw_build_wmm_ie_ht(struct adapter *padapter, u8 *out_ie, uint *pout_len)
 
 	if (padapter->mlmepriv.qospriv.qos_option == 0) {
 		out_len = *pout_len;
-		rtw_set_ie(out_ie+out_len, WLAN_EID_VENDOR_SPECIFIC,
+		rtw_set_ie(out_ie + out_len, WLAN_EID_VENDOR_SPECIFIC,
 			   _WMM_IE_Length_, WMM_IE, pout_len);
 
 		padapter->mlmepriv.qospriv.qos_option = 1;
@@ -2232,7 +2218,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 	u8 cbw40_enable = 0, stbc_rx_enable = 0, operation_bw = 0;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct ht_priv 	*phtpriv = &pmlmepriv->htpriv;
+	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 
 	phtpriv->ht_option = false;
@@ -2259,7 +2245,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 	} else {
 		p = rtw_get_ie(in_ie, WLAN_EID_HT_OPERATION, &ielen, in_len);
 		if (p && (ielen == sizeof(struct ieee80211_ht_addt_info))) {
-			struct HT_info_element *pht_info = (struct HT_info_element *)(p+2);
+			struct HT_info_element *pht_info = (struct HT_info_element *)(p + 2);
 
 			if (pht_info->infos[0] & BIT(2)) {
 				switch (pht_info->infos[0] & 0x3) {
@@ -2327,14 +2313,14 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 		rtw_hal_get_def_var(padapter, HW_VAR_MAX_RX_AMPDU_FACTOR,
 				    &max_rx_ampdu_factor);
 
-	ht_capie.ampdu_params_info = (max_rx_ampdu_factor&0x03);
+	ht_capie.ampdu_params_info = (max_rx_ampdu_factor & 0x03);
 
 	if (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)
-		ht_capie.ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY&(0x07<<2));
+		ht_capie.ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY & (0x07 << 2));
 	else
-		ht_capie.ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY&0x00);
+		ht_capie.ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_DENSITY & 0x00);
 
-	rtw_set_ie(out_ie+out_len, WLAN_EID_HT_CAPABILITY,
+	rtw_set_ie(out_ie + out_len, WLAN_EID_HT_CAPABILITY,
 		   sizeof(struct ieee80211_ht_cap), (unsigned char *)&ht_capie, pout_len);
 
 	phtpriv->ht_option = true;
@@ -2343,12 +2329,11 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 		p = rtw_get_ie(in_ie, WLAN_EID_HT_OPERATION, &ielen, in_len);
 		if (p && (ielen == sizeof(struct ieee80211_ht_addt_info))) {
 			out_len = *pout_len;
-			rtw_set_ie(out_ie+out_len, WLAN_EID_HT_OPERATION, ielen, p+2, pout_len);
+			rtw_set_ie(out_ie + out_len, WLAN_EID_HT_OPERATION, ielen, p + 2, pout_len);
 		}
 	}
 
 	return phtpriv->ht_option;
-
 }
 
 /* the function is > passive_level (in critical_section) */
@@ -2379,12 +2364,11 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_CAPABILITY, &len,
 		       ie_len - sizeof(struct ndis_802_11_fix_ie));
 	if (p && len > 0) {
-		pht_capie = (struct ieee80211_ht_cap *)(p+2);
+		pht_capie = (struct ieee80211_ht_cap *)(p + 2);
 		max_ampdu_sz = (pht_capie->ampdu_params_info & IEEE80211_HT_CAP_AMPDU_FACTOR);
-		max_ampdu_sz = 1 << (max_ampdu_sz+3); /*  max_ampdu_sz (kbytes); */
+		max_ampdu_sz = 1 << (max_ampdu_sz + 3); /*  max_ampdu_sz (kbytes); */
 
 		phtpriv->rx_ampdu_maxlen = max_ampdu_sz;
-
 	}
 
 	len = 0;
@@ -2473,21 +2457,20 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 	phtpriv = &psta->htpriv;
 
 	if (phtpriv->ht_option && phtpriv->ampdu_enable) {
-		issued = (phtpriv->agg_enable_bitmap>>priority)&0x1;
-		issued |= (phtpriv->candidate_tid_bitmap>>priority)&0x1;
+		issued = (phtpriv->agg_enable_bitmap >> priority) & 0x1;
+		issued |= (phtpriv->candidate_tid_bitmap >> priority) & 0x1;
 
 		if (issued == 0) {
 			psta->htpriv.candidate_tid_bitmap |= BIT((u8)priority);
-			rtw_addbareq_cmd(padapter, (u8) priority, pattrib->ra);
+			rtw_addbareq_cmd(padapter, (u8)priority, pattrib->ra);
 		}
 	}
-
 }
 
 void rtw_append_exented_cap(struct adapter *padapter, u8 *out_ie, uint *pout_len)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct ht_priv 	*phtpriv = &pmlmepriv->htpriv;
+	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
 	u8 cap_content[8] = {0};
 
 	if (phtpriv->bss_coexist)
@@ -2547,7 +2530,8 @@ void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 signed int rtw_linked_check(struct adapter *padapter)
 {
 	if ((check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true) ||
-			(check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE) == true)) {
+	    (check_fwstate(&padapter->mlmepriv,
+			   WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE) == true)) {
 		if (padapter->stapriv.asoc_sta_count > 2)
 			return true;
 	} else {	/* Station mode */
-- 
2.45.3

