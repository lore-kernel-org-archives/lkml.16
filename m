Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20762128819
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743165819; cv=none; b=eVRtoyBm3yjb+dcAAFOJ/IhBOKT4FvNBIGbnZ+HSE8bL80JrchZuf6RabsQRF4/wgs3UcKmBUbfbf4ZJWLoaxPW58VKvc+DRB+LOM9ZFAnqTodAvyPvtrb4U6r4+QkAazZAeKXUklj9cgCM7GFr9MEkTcRd1ayyGcncC/Pu0yEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743165819; c=relaxed/simple;
	bh=5JWWhaDjJmZh9jcwWFMCU2PsqB8vL1OWaq+z1t3POko=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BsiLG5EQViJCh+UGFWRR77+IOqWU1qZMOmBe2dJZquGtJv4bloBJBJWTCMDn01/R1BZhgJu9l66ULWEKehGAsQEOnMa0/eQO04iYb+fLu2JLs2WAo5qIO8Cw3x7Llx0xKxx7WjTk8ERJsH4+3PxGoPfQuOkDncvSRLcpIX9D+hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPH5vv5l; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPH5vv5l"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so14999485e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 05:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743165814; x=1743770614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UoK5ZaFG3AdEfvPEtEtCSmQLIy9nBc5f2EyzMHrNkOg=;
        b=aPH5vv5lpn1FPbxSexRGFLz4EjoByagbDHxnNKqQlM64Ieaua/W9XsoBDd+7aKypG+
         b73JxGYvb94eewKVPmP4ZjiCpXLLECq0QdD48N7f2SWCZD8qsw6rgvJ6HJpNY2825aQi
         q1b957BWET8ItYulHkgQyDCifMars7K5yzRXD3Yq6/Zru2kh6JKA/rjlOJg1i1bKxXhy
         KSgR43klrm41ixZRdnfeLfKW1+GsiAzrkfFXlx+YLpG2YvNR5uPEncAlO9BgFVLP8Uo8
         naVJYcejkA8iOdfJWhw++SMqanNllw9R//vBLH9sVVesaHLuMGpuzVyH28mz0H3O1cWN
         N0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743165814; x=1743770614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UoK5ZaFG3AdEfvPEtEtCSmQLIy9nBc5f2EyzMHrNkOg=;
        b=GBx9l9XJUCZoOTwmqSn5hio3mPpTtoi6aBQ9T3zzW6R77Du8EXX0sr6D/oLMgZwYUo
         ZGYX2IEu4g/UU8/3WczYjNrFIvUXtGPWlATgCfndKO1HyvM8rMlqltnt/Us75181xbPK
         9LUqwNPWuURMG57BTdWTNKP37b0caJeBL0REHkj0ACAOhHK1aLY+2JPENZieSB0qlg2i
         +TwJwHDRFWp87bF08UvunUR7wVhE5RMVth/NEfU83OBULC2EGSZMHWQtlvX1ZevajQ5j
         pMFJL7lWV52iMb6zA9MmcbFBwrrX5umUPMW7Vs4ePSdiTy8WpE0HT00zpGhpiJgR/STB
         ND3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCM5WeS0PZ/sXge6bT0zuGH4yT9XJfQ7d6OtM4ZJrt51jJoxYbyPPSz83IfQHZqzIgzZtrrGQ18MfbCvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIhT/Ik4wLyDtcrVTYGRMTngZg/QVDXXNTW6h+96AUnZfFsn4s
	k8MK7yXfSWdxJLQJGN2f81moZRjVDdXaTg1dQxNlg2gjZ6vTOMFK
X-Gm-Gg: ASbGncuZ76PgT/duPGiF2kZLQGmIjxyFjNOoewQA8ChTgMU/KgaN4r9sizLBV+0qW9I
	HBpfyRbRvqcljMmHV2Z8VOa6tNKs2x4XCauc5UKaLRuNhG8/OKNm9+QBmqO7Wbxy4Kl/DAOfAGz
	w3BCebJcW+rCFA/Av1wvMGqBfG1ZfbkfxlwCgl+EpGIUZXlKBA04nu5G3t+hDXqUaA/VLM2n9B3
	n5iej4CI4AOYiDUQ224O1xoKwtQoTqLn4Ef+tLufJRnqbI8pA/U1UbTVcOFsKaDyTz7X8gsGKja
	UFnBgQcsoqdQaYgb5JlcZqGloie64Ql54LZKbhmYzKLEu6Oh
X-Google-Smtp-Source: AGHT+IEd0H/lfRaXsUKEUcYcOhx6OL7D4e/yKzKKoR1M5FW/XhRNKP+JqgfEtA8XdzQwdVa8deQerg==
X-Received: by 2002:a5d:6488:0:b0:391:2192:ccd6 with SMTP id ffacd0b85a97d-39ad177aed2mr7411145f8f.39.1743165813975;
        Fri, 28 Mar 2025 05:43:33 -0700 (PDT)
Received: from HP-650 ([105.112.193.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e37bsm2544765f8f.61.2025.03.28.05.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 05:43:33 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	julia.lawall@inria.fr,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH 3/5] staging: rtl8723bs: add spaces around binary and ternary operators
Date: Fri, 28 Mar 2025 13:39:40 +0100
Message-Id: <43f9d974cc801ca27ddd0bc8684e066c84376151.1743163801.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743163800.git.abrahamadekunle50@gmail.com>
References: <cover.1743163800.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update expressions to ensure proper spacing around binary and ternary
operators, following Linux kernel coding style guidelines.

This improves readability and consistency across the codebase

Reported by checkpatch:

CHECK: spaces needed around 'operator'

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c       |   2 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  16 +--
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  68 ++++-----
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |   6 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  54 +++----
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 134 +++++++++---------
 6 files changed, 140 insertions(+), 140 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 640381c55fe3..ed6942e289a5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1407,7 +1407,7 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 	wps_ielen = (uint)pwps_ie_src[1];/* to get ie data len */
 	if ((wps_offset + wps_ielen + 2 + remainder_ielen) <= MAX_IE_SZ) {
 		memcpy(pwps_ie, pwps_ie_src, wps_ielen + 2);
-		pwps_ie += (wps_ielen+2);
+		pwps_ie += (wps_ielen + 2);
 
 		if (pbackup_remainder_ie)
 			memcpy(pwps_ie, pbackup_remainder_ie, remainder_ielen);
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 64ce33c6fba1..7820cb17eecc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -204,7 +204,7 @@ int rtw_init_evt_priv(struct evt_priv *pevtpriv)
 
 	_init_workitem(&pevtpriv->c2h_wk, c2h_wk_callback, NULL);
 	pevtpriv->c2h_wk_alive = false;
-	pevtpriv->c2h_queue = rtw_cbuf_alloc(C2H_QUEUE_MAX_LEN+1);
+	pevtpriv->c2h_queue = rtw_cbuf_alloc(C2H_QUEUE_MAX_LEN + 1);
 	if (!pevtpriv->c2h_queue)
 		return -ENOMEM;
 
@@ -697,7 +697,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 
 
 	/* for hidden ap to set fw_state here */
-	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE|WIFI_ADHOC_STATE) != true) {
+	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_ADHOC_STATE) != true) {
 		switch (ndis_network_mode) {
 		case Ndis802_11IBSS:
 			set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
@@ -722,10 +722,10 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 
 	psecuritypriv->authenticator_ie[0] = (unsigned char)psecnetwork->ie_length;
 
-	if ((psecnetwork->ie_length-12) < (256-1))
+	if ((psecnetwork->ie_length - 12) < (256 - 1))
 		memcpy(&psecuritypriv->authenticator_ie[1], &psecnetwork->ies[12], psecnetwork->ie_length-12);
 	else
-		memcpy(&psecuritypriv->authenticator_ie[1], &psecnetwork->ies[12], (256-1));
+		memcpy(&psecuritypriv->authenticator_ie[1], &psecnetwork->ies[12], (256 - 1));
 
 	psecnetwork->ie_length = 0;
 	/*  Added by Albert 2009/02/18 */
@@ -1607,9 +1607,9 @@ static void rtw_btinfo_hdl(struct adapter *adapter, u8 *buf, u16 buf_len)
 
 	cmd_idx = info->cid;
 
-	if (info->len > buf_len-2) {
+	if (info->len > buf_len - 2) {
 		rtw_warn_on(1);
-		len = buf_len-2;
+		len = buf_len - 2;
 	} else {
 		len = info->len;
 	}
@@ -1619,7 +1619,7 @@ static void rtw_btinfo_hdl(struct adapter *adapter, u8 *buf, u16 buf_len)
 		buf[1] = 0;
 	else if (cmd_idx == BTINFO_BT_AUTO_RPT)
 		buf[1] = 2;
-	hal_btcoex_BtInfoNotify(adapter, len+1, &buf[1]);
+	hal_btcoex_BtInfoNotify(adapter, len + 1, &buf[1]);
 }
 
 u8 rtw_c2h_packet_wk_cmd(struct adapter *padapter, u8 *pbuf, u16 length)
@@ -1679,7 +1679,7 @@ u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_evt)
 
 	pdrvextra_cmd_parm->ec_id = C2H_WK_CID;
 	pdrvextra_cmd_parm->type = 0;
-	pdrvextra_cmd_parm->size =  c2h_evt?16:0;
+	pdrvextra_cmd_parm->size =  c2h_evt ? 16 : 0;
 	pdrvextra_cmd_parm->pbuf = c2h_evt;
 
 	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 53d4c113b19c..e0b1c1a1311b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -187,18 +187,18 @@ u8 *rtw_get_ie_ex(u8 *in_ie, uint in_len, u8 eid, u8 *oui, u8 oui_len, u8 *ie, u
 
 	while (cnt < in_len) {
 		if (eid == in_ie[cnt]
-			&& (!oui || !memcmp(&in_ie[cnt+2], oui, oui_len))) {
+			&& (!oui || !memcmp(&in_ie[cnt + 2], oui, oui_len))) {
 			target_ie = &in_ie[cnt];
 
 			if (ie)
-				memcpy(ie, &in_ie[cnt], in_ie[cnt+1]+2);
+				memcpy(ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
 
 			if (ielen)
-				*ielen = in_ie[cnt+1]+2;
+				*ielen = in_ie[cnt + 1] + 2;
 
 			break;
 		}
-		cnt += in_ie[cnt+1]+2; /* goto next */
+		cnt += in_ie[cnt + 1] + 2; /* goto next */
 	}
 
 	return target_ie;
@@ -449,8 +449,8 @@ int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwis
 		return _FAIL;
 	}
 
-	if ((*wpa_ie != WLAN_EID_VENDOR_SPECIFIC) || (*(wpa_ie+1) != (u8)(wpa_ie_len - 2)) ||
-	   (memcmp(wpa_ie+2, RTW_WPA_OUI_TYPE, WPA_SELECTOR_LEN))) {
+	if ((*wpa_ie != WLAN_EID_VENDOR_SPECIFIC) || (*(wpa_ie + 1) != (u8)(wpa_ie_len - 2)) ||
+	   (memcmp(wpa_ie + 2, RTW_WPA_OUI_TYPE, WPA_SELECTOR_LEN))) {
 		return _FAIL;
 	}
 
@@ -512,7 +512,7 @@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwi
 		return _FAIL;
 	}
 
-	if ((*rsn_ie != WLAN_EID_RSN) || (*(rsn_ie+1) != (u8)(rsn_ie_len - 2)))
+	if ((*rsn_ie != WLAN_EID_RSN) || (*(rsn_ie + 1) != (u8)(rsn_ie_len - 2)))
 		return _FAIL;
 
 	pos = rsn_ie;
@@ -582,16 +582,16 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 
 		/* if (authmode == WLAN_EID_BSS_AC_ACCESS_DELAY) */
 		if (authmode == WLAN_EID_BSS_AC_ACCESS_DELAY && (!memcmp(&in_ie[cnt+6], wapi_oui1, 4) ||
-					!memcmp(&in_ie[cnt+6], wapi_oui2, 4))) {
+					!memcmp(&in_ie[cnt + 6], wapi_oui2, 4))) {
 			if (wapi_ie)
-				memcpy(wapi_ie, &in_ie[cnt], in_ie[cnt+1]+2);
+				memcpy(wapi_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
 
 			if (wapi_len)
-				*wapi_len = in_ie[cnt+1]+2;
+				*wapi_len = in_ie[cnt + 1] + 2;
 
-			cnt += in_ie[cnt+1]+2;  /* get next */
+			cnt += in_ie[cnt + 1] + 2;  /* get next */
 		} else {
-			cnt += in_ie[cnt+1]+2;   /* get next */
+			cnt += in_ie[cnt + 1] + 2;   /* get next */
 		}
 	}
 
@@ -617,7 +617,7 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
 
 		if ((authmode == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt+2], &wpa_oui[0], 4))) {
 			if (wpa_ie)
-				memcpy(wpa_ie, &in_ie[cnt], in_ie[cnt+1]+2);
+				memcpy(wpa_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
 
 			*wpa_len = in_ie[cnt + 1] + 2;
 			cnt += in_ie[cnt + 1] + 2;  /* get next */
@@ -626,10 +626,10 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
 				if (rsn_ie)
 					memcpy(rsn_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
 
-				*rsn_len = in_ie[cnt+1]+2;
-				cnt += in_ie[cnt+1]+2;  /* get next */
+				*rsn_len = in_ie[cnt + 1] + 2;
+				cnt += in_ie[cnt + 1] + 2;  /* get next */
 			} else {
-				cnt += in_ie[cnt+1]+2;   /* get next */
+				cnt += in_ie[cnt + 1] + 2;   /* get next */
 			}
 		}
 	}
@@ -661,20 +661,20 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
 	while (cnt < in_len) {
 		eid = in_ie[cnt];
 
-		if ((eid == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt+2], wps_oui, 4))) {
+		if ((eid == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt + 2], wps_oui, 4))) {
 			wpsie_ptr = &in_ie[cnt];
 
 			if (wps_ie)
-				memcpy(wps_ie, &in_ie[cnt], in_ie[cnt+1]+2);
+				memcpy(wps_ie, &in_ie[cnt], in_ie[cnt + 1] + 2);
 
 			if (wps_ielen)
-				*wps_ielen = in_ie[cnt+1]+2;
+				*wps_ielen = in_ie[cnt + 1] + 2;
 
-			cnt += in_ie[cnt+1]+2;
+			cnt += in_ie[cnt + 1] + 2;
 
 			break;
 		}
-		cnt += in_ie[cnt+1]+2; /* goto next */
+		cnt += in_ie[cnt + 1] + 2; /* goto next */
 	}
 
 	return wpsie_ptr;
@@ -752,12 +752,12 @@ u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8
 
 	if (attr_ptr && attr_len) {
 		if (buf_content)
-			memcpy(buf_content, attr_ptr+4, attr_len-4);
+			memcpy(buf_content, attr_ptr + 4, attr_len - 4);
 
 		if (len_content)
-			*len_content = attr_len-4;
+			*len_content = attr_len - 4;
 
-		return attr_ptr+4;
+		return attr_ptr + 4;
 	}
 
 	return NULL;
@@ -1084,21 +1084,21 @@ u16 rtw_mcs_rate(u8 bw_40MHz, u8 short_GI, unsigned char *MCS_rate)
 	u16 max_rate = 0;
 
 	if (MCS_rate[0] & BIT(7))
-		max_rate = (bw_40MHz) ? ((short_GI)?1500:1350):((short_GI)?722:650);
+		max_rate = (bw_40MHz) ? ((short_GI) ? 1500 : 1350) : ((short_GI) ? 722 : 650);
 	else if (MCS_rate[0] & BIT(6))
-		max_rate = (bw_40MHz) ? ((short_GI)?1350:1215):((short_GI)?650:585);
+		max_rate = (bw_40MHz) ? ((short_GI) ? 1350 : 1215) : ((short_GI) ? 650 : 585);
 	else if (MCS_rate[0] & BIT(5))
-		max_rate = (bw_40MHz) ? ((short_GI)?1200:1080):((short_GI)?578:520);
+		max_rate = (bw_40MHz) ? ((short_GI) ? 1200 : 1080) : ((short_GI) ? 578 : 520);
 	else if (MCS_rate[0] & BIT(4))
-		max_rate = (bw_40MHz) ? ((short_GI)?900:810):((short_GI)?433:390);
+		max_rate = (bw_40MHz) ? ((short_GI) ? 900 : 810) : ((short_GI) ? 433 : 390);
 	else if (MCS_rate[0] & BIT(3))
-		max_rate = (bw_40MHz) ? ((short_GI)?600:540):((short_GI)?289:260);
+		max_rate = (bw_40MHz) ? ((short_GI) ? 600 : 540) : ((short_GI) ? 289 : 260);
 	else if (MCS_rate[0] & BIT(2))
-		max_rate = (bw_40MHz) ? ((short_GI)?450:405):((short_GI)?217:195);
+		max_rate = (bw_40MHz) ? ((short_GI) ? 450 : 405) : ((short_GI) ? 217 : 195);
 	else if (MCS_rate[0] & BIT(1))
-		max_rate = (bw_40MHz) ? ((short_GI)?300:270):((short_GI)?144:130);
+		max_rate = (bw_40MHz) ? ((short_GI) ? 300 : 270) : ((short_GI) ? 144 : 130);
 	else if (MCS_rate[0] & BIT(0))
-		max_rate = (bw_40MHz) ? ((short_GI)?150:135):((short_GI)?72:65);
+		max_rate = (bw_40MHz) ? ((short_GI) ? 150 : 135) : ((short_GI) ? 72 : 65);
 
 	return max_rate;
 }
@@ -1112,8 +1112,8 @@ int rtw_action_frame_parse(const u8 *frame, u32 frame_len, u8 *category, u8 *act
 
 	fc = le16_to_cpu(((struct ieee80211_hdr_3addr *)frame)->frame_control);
 
-	if ((fc & (IEEE80211_FCTL_FTYPE|IEEE80211_FCTL_STYPE))
-		!= (IEEE80211_FTYPE_MGMT|IEEE80211_STYPE_ACTION)
+	if ((fc & (IEEE80211_FCTL_FTYPE | IEEE80211_FCTL_STYPE))
+		!= (IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_ACTION)
 	) {
 		return false;
 	}
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 587a87fbffeb..365b2218b45b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -156,7 +156,7 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true)
 		goto release_mlme_lock;
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE) == true) {
+	if (check_fwstate(pmlmepriv, _FW_LINKED | WIFI_ADHOC_MASTER_STATE) == true) {
 		if ((pmlmepriv->assoc_ssid.ssid_length == ssid->ssid_length) &&
 		    (!memcmp(&pmlmepriv->assoc_ssid.ssid, ssid->ssid, ssid->ssid_length))) {
 			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == false) {
@@ -379,7 +379,7 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_s
 		goto exit;
 	}
 
-	if ((check_fwstate(pmlmepriv, _FW_UNDER_SURVEY|_FW_UNDER_LINKING) == true) ||
+	if ((check_fwstate(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING) == true) ||
 		(pmlmepriv->LinkDetectInfo.bBusyTraffic == true)) {
 		/*  Scan or linking is in progress, do nothing. */
 		res = true;
@@ -492,7 +492,7 @@ u16 rtw_get_cur_max_rate(struct adapter *adapter)
 					psta->htpriv.ht_cap.mcs.rx_mask);
 	} else {
 		while ((pcur_bss->supported_rates[i] != 0) && (pcur_bss->supported_rates[i] != 0xFF)) {
-			rate = pcur_bss->supported_rates[i]&0x7F;
+			rate = pcur_bss->supported_rates[i] & 0x7F;
 			if (rate > max_rate)
 				max_rate = rate;
 			i++;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 91c6a962f7e8..a0cadb1d8a49 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -256,8 +256,8 @@ void rtw_generate_random_ibss(u8 *pibss)
 	pibss[1] = 0x11;
 	pibss[2] = 0x87;
 	pibss[3] = (u8)(curtime & 0xff) ;/* p[0]; */
-	pibss[4] = (u8)((curtime>>8) & 0xff) ;/* p[1]; */
-	pibss[5] = (u8)((curtime>>16) & 0xff) ;/* p[2]; */
+	pibss[4] = (u8)((curtime >> 8) & 0xff) ;/* p[1]; */
+	pibss[5] = (u8)((curtime >> 16) & 0xff) ;/* p[2]; */
 }
 
 u8 *rtw_get_capability_from_ie(u8 *ie)
@@ -410,14 +410,14 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 		sq_final = padapter->recvpriv.signal_qual;
 		/* the rssi value here is undecorated, and will be used for antenna diversity */
 		if (sq_smp != 101) /* from the right channel */
-			rssi_final = (src->rssi+dst->rssi*4)/5;
+			rssi_final = (src->rssi + dst->rssi * 4) / 5;
 		else
 			rssi_final = rssi_ori;
 	} else {
 		if (sq_smp != 101) { /* from the right channel */
 			ss_final = ((u32)(src->phy_info.signal_strength)+(u32)(dst->phy_info.signal_strength)*4)/5;
 			sq_final = ((u32)(src->phy_info.signal_quality)+(u32)(dst->phy_info.signal_quality)*4)/5;
-			rssi_final = (src->rssi+dst->rssi*4)/5;
+			rssi_final = (src->rssi + dst->rssi * 4) / 5;
 		} else {
 			/* bss info not receiving from the right channel, use the original RX signal infos */
 			ss_final = dst->phy_info.signal_strength;
@@ -832,14 +832,14 @@ void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
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
@@ -886,7 +886,7 @@ void rtw_indicate_disconnect(struct adapter *padapter)
 {
 	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-	_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING|WIFI_UNDER_WPS);
+	_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING | WIFI_UNDER_WPS);
 
 	if (rtw_to_roam(padapter) > 0)
 		_clr_fwstate_(pmlmepriv, _FW_LINKED);
@@ -1053,8 +1053,8 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	switch (pnetwork->network.infrastructure_mode) {
 	case Ndis802_11Infrastructure:
 
-			if (pmlmepriv->fw_state&WIFI_UNDER_WPS)
-				pmlmepriv->fw_state = WIFI_STATION_STATE|WIFI_UNDER_WPS;
+			if (pmlmepriv->fw_state & WIFI_UNDER_WPS)
+				pmlmepriv->fw_state = WIFI_STATION_STATE | WIFI_UNDER_WPS;
 			else
 				pmlmepriv->fw_state = WIFI_STATION_STATE;
 
@@ -1226,7 +1226,7 @@ void rtw_sta_media_status_rpt(struct adapter *adapter, struct sta_info *psta, u3
 	if (!psta)
 		return;
 
-	media_status_rpt = (u16)((psta->mac_id<<8)|mstatus); /*   MACID|OPMODE:1 connect */
+	media_status_rpt = (u16)((psta->mac_id << 8) | mstatus); /*   MACID|OPMODE:1 connect */
 	rtw_hal_set_hwreg(adapter, HW_VAR_H2C_MEDIA_STATUS_RPT, (u8 *)&media_status_rpt);
 }
 
@@ -1344,13 +1344,13 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
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
@@ -1526,7 +1526,7 @@ void rtw_mlme_reset_auto_scan_int(struct adapter *adapter)
 	if (pmlmeinfo->VHT_enable) /* disable auto scan when connect to 11AC AP */
 		mlme->auto_scan_int_ms = 0;
 	else if (adapter->registrypriv.wifi_spec && is_client_associated_to_ap(adapter) == true)
-		mlme->auto_scan_int_ms = 60*1000;
+		mlme->auto_scan_int_ms = 60 * 1000;
 	else if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
 		if (check_fwstate(mlme, WIFI_STATION_STATE) && check_fwstate(mlme, _FW_LINKED))
 			mlme->auto_scan_int_ms = mlme->roam_scan_int_ms;
@@ -1937,7 +1937,7 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 			break;
 		}
 
-		i += (in_ie[i+1]+2); /*  to the next IE element */
+		i += (in_ie[i + 1] + 2); /*  to the next IE element */
 	}
 
 	return ielength;
@@ -2011,13 +2011,13 @@ signed int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, u
 		authmode = WLAN_EID_RSN;
 
 	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
-		memcpy(out_ie+ielength, psecuritypriv->wps_ie, psecuritypriv->wps_ie_len);
+		memcpy(out_ie + ielength, psecuritypriv->wps_ie, psecuritypriv->wps_ie_len);
 
 		ielength += psecuritypriv->wps_ie_len;
 	} else if ((authmode == WLAN_EID_VENDOR_SPECIFIC) || (authmode == WLAN_EID_RSN)) {
 		/* copy RSN or SSN */
 		memcpy(&out_ie[ielength], &psecuritypriv->supplicant_ie[0], psecuritypriv->supplicant_ie[1]+2);
-		ielength += psecuritypriv->supplicant_ie[1]+2;
+		ielength += psecuritypriv->supplicant_ie[1] + 2;
 		rtw_report_sec_ie(adapter, authmode, psecuritypriv->supplicant_ie);
 	}
 
@@ -2189,7 +2189,7 @@ void rtw_build_wmm_ie_ht(struct adapter *padapter, u8 *out_ie, uint *pout_len)
 
 	if (padapter->mlmepriv.qospriv.qos_option == 0) {
 		out_len = *pout_len;
-		rtw_set_ie(out_ie+out_len, WLAN_EID_VENDOR_SPECIFIC,
+		rtw_set_ie(out_ie + out_len, WLAN_EID_VENDOR_SPECIFIC,
 			   _WMM_IE_Length_, WMM_IE, pout_len);
 
 		padapter->mlmepriv.qospriv.qos_option = 1;
@@ -2233,7 +2233,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 	} else {
 		p = rtw_get_ie(in_ie, WLAN_EID_HT_OPERATION, &ielen, in_len);
 		if (p && (ielen == sizeof(struct ieee80211_ht_addt_info))) {
-			struct HT_info_element *pht_info = (struct HT_info_element *)(p+2);
+			struct HT_info_element *pht_info = (struct HT_info_element *)(p + 2);
 
 			if (pht_info->infos[0] & BIT(2)) {
 				switch (pht_info->infos[0] & 0x3) {
@@ -2301,14 +2301,14 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
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
@@ -2317,7 +2317,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 		p = rtw_get_ie(in_ie, WLAN_EID_HT_OPERATION, &ielen, in_len);
 		if (p && (ielen == sizeof(struct ieee80211_ht_addt_info))) {
 			out_len = *pout_len;
-			rtw_set_ie(out_ie+out_len, WLAN_EID_HT_OPERATION, ielen, p+2, pout_len);
+			rtw_set_ie(out_ie + out_len, WLAN_EID_HT_OPERATION, ielen, p + 2, pout_len);
 		}
 	}
 
@@ -2352,9 +2352,9 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 	len = 0;
 	p = rtw_get_ie(pie+sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_CAPABILITY, &len, ie_len-sizeof(struct ndis_802_11_fix_ie));
 	if (p && len > 0) {
-		pht_capie = (struct ieee80211_ht_cap *)(p+2);
+		pht_capie = (struct ieee80211_ht_cap *)(p + 2);
 		max_ampdu_sz = (pht_capie->ampdu_params_info & IEEE80211_HT_CAP_AMPDU_FACTOR);
-		max_ampdu_sz = 1 << (max_ampdu_sz+3); /*  max_ampdu_sz (kbytes); */
+		max_ampdu_sz = 1 << (max_ampdu_sz + 3); /*  max_ampdu_sz (kbytes); */
 
 		phtpriv->rx_ampdu_maxlen = max_ampdu_sz;
 
@@ -2445,8 +2445,8 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 	phtpriv = &psta->htpriv;
 
 	if (phtpriv->ht_option && phtpriv->ampdu_enable) {
-		issued = (phtpriv->agg_enable_bitmap>>priority)&0x1;
-		issued |= (phtpriv->candidate_tid_bitmap>>priority)&0x1;
+		issued = (phtpriv->agg_enable_bitmap >> priority) & 0x1;
+		issued |= (phtpriv->candidate_tid_bitmap >> priority) & 0x1;
 
 		if (issued == 0) {
 			psta->htpriv.candidate_tid_bitmap |= BIT((u8)priority);
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 952ce6dd5af9..667337793385 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -335,7 +335,7 @@ static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_c
 	u8 b2_4GBand = false;
 	u8 Index2G = 0;
 
-	memset(channel_set, 0, sizeof(struct rt_channel_info)*MAX_CHANNEL_NUM);
+	memset(channel_set, 0, sizeof(struct rt_channel_info) * MAX_CHANNEL_NUM);
 
 	if (ChannelPlan >= RT_CHANNEL_DOMAIN_MAX && ChannelPlan != RT_CHANNEL_DOMAIN_REALTEK_DEFINE)
 		return chanset_size;
@@ -520,7 +520,7 @@ unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 		return _SUCCESS;
 
 	if (check_fwstate(pmlmepriv, _FW_LINKED) == false &&
-		check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE|WIFI_AP_STATE) == false) {
+		check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE) == false) {
 		return _SUCCESS;
 	}
 
@@ -639,7 +639,7 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 
 				adaptive_early_32k(pmlmeext, pframe, len);
 			}
-		} else if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) {
+		} else if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) {
 			psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
 			if (psta) {
 				/* update WMM, ERP in the beacon */
@@ -689,7 +689,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	uint len = precv_frame->u.hdr.len;
 	u8 offset = 0;
 
-	if ((pmlmeinfo->state&0x03) != WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
 		return _FAIL;
 
 	sa = GetAddr2Ptr(pframe);
@@ -703,8 +703,8 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 		prxattrib->hdrlen = WLAN_HDR_A3_LEN;
 		prxattrib->encrypt = _WEP40_;
 
-		iv = pframe+prxattrib->hdrlen;
-		prxattrib->key_index = ((iv[3]>>6)&0x3);
+		iv = pframe + prxattrib->hdrlen;
+		prxattrib->key_index = ((iv[3] >> 6) & 0x3);
 
 		prxattrib->iv_len = 4;
 		prxattrib->icv_len = 4;
@@ -953,7 +953,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	uint pkt_len = precv_frame->u.hdr.len;
 
-	if ((pmlmeinfo->state&0x03) != WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
 		return _FAIL;
 
 	frame_type = GetFrameSubType(pframe);
@@ -1013,7 +1013,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		goto OnAssocReqFail;
 	} else {
 		/*  check if ssid match */
-		if (memcmp((void *)(p+2), cur->ssid.ssid, cur->ssid.ssid_length))
+		if (memcmp((void *)(p + 2), cur->ssid.ssid, cur->ssid.ssid_length))
 			status = WLAN_STATUS_CHALLENGE_FAIL;
 
 		if (ie_len != cur->ssid.ssid_length)
@@ -1033,7 +1033,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		status = WLAN_STATUS_CHALLENGE_FAIL;
 		goto OnAssocReqFail;
 	} else {
-		memcpy(supportRate, p+2, ie_len);
+		memcpy(supportRate, p + 2, ie_len);
 		supportRateNum = ie_len;
 
 		p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset, WLAN_EID_EXT_SUPP_RATES, &ie_len,
@@ -1041,7 +1041,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		if (p) {
 
 			if (supportRateNum <= sizeof(supportRate)) {
-				memcpy(supportRate+supportRateNum, p+2, ie_len);
+				memcpy(supportRate + supportRateNum, p + 2, ie_len);
 				supportRateNum += ie_len;
 			}
 		}
@@ -1097,7 +1097,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 			pstat->dot8021xalg = 1;/* psk,  todo:802.1x */
 			pstat->wpa_psk |= BIT(0);
 
-			pstat->wpa_group_cipher = group_cipher&psecuritypriv->wpa_group_cipher;
+			pstat->wpa_group_cipher = group_cipher & psecuritypriv->wpa_group_cipher;
 			pstat->wpa_pairwise_cipher = pairwise_cipher&psecuritypriv->wpa_pairwise_cipher;
 
 			if (!pstat->wpa_group_cipher)
@@ -1133,7 +1133,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		/*  AP support WPA/RSN, and sta is going to do WPS, but AP is not ready */
 		/*  that the selected registrar of AP is _FLASE */
 		if ((psecuritypriv->wpa_psk > 0)
-			&& (pstat->flags & (WLAN_STA_WPS|WLAN_STA_MAYBE_WPS))) {
+			&& (pstat->flags & (WLAN_STA_WPS | WLAN_STA_MAYBE_WPS))) {
 			if (pmlmepriv->wps_beacon_ie) {
 				u8 selected_registrar = 0;
 
@@ -1166,7 +1166,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 
 		if (copy_len > 0)
-			memcpy(pstat->wpa_ie, wpa_ie-2, copy_len);
+			memcpy(pstat->wpa_ie, wpa_ie - 2, copy_len);
 
 	}
 
@@ -1185,38 +1185,38 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		for (;;) {
 			p = rtw_get_ie(p, WLAN_EID_VENDOR_SPECIFIC, &ie_len, pkt_len - WLAN_HDR_A3_LEN - ie_offset);
 			if (p) {
-				if (!memcmp(p+2, WMM_IE, 6)) {
+				if (!memcmp(p + 2, WMM_IE, 6)) {
 
 					pstat->flags |= WLAN_STA_WME;
 
 					pstat->qos_option = 1;
-					pstat->qos_info = *(p+8);
+					pstat->qos_info = *(p + 8);
 
-					pstat->max_sp_len = (pstat->qos_info>>5)&0x3;
+					pstat->max_sp_len = (pstat->qos_info >> 5) & 0x3;
 
-					if ((pstat->qos_info&0xf) != 0xf)
+					if ((pstat->qos_info & 0xf) != 0xf)
 						pstat->has_legacy_ac = true;
 					else
 						pstat->has_legacy_ac = false;
 
-					if (pstat->qos_info&0xf) {
+					if (pstat->qos_info & 0xf) {
 						if (pstat->qos_info&BIT(0))
-							pstat->uapsd_vo = BIT(0)|BIT(1);
+							pstat->uapsd_vo = BIT(0) | BIT(1);
 						else
 							pstat->uapsd_vo = 0;
 
 						if (pstat->qos_info&BIT(1))
-							pstat->uapsd_vi = BIT(0)|BIT(1);
+							pstat->uapsd_vi = BIT(0) | BIT(1);
 						else
 							pstat->uapsd_vi = 0;
 
 						if (pstat->qos_info&BIT(2))
-							pstat->uapsd_bk = BIT(0)|BIT(1);
+							pstat->uapsd_bk = BIT(0) | BIT(1);
 						else
 							pstat->uapsd_bk = 0;
 
 						if (pstat->qos_info&BIT(3))
-							pstat->uapsd_be = BIT(0)|BIT(1);
+							pstat->uapsd_be = BIT(0) | BIT(1);
 						else
 							pstat->uapsd_be = 0;
 
@@ -1244,15 +1244,15 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		pstat->flags &= ~WLAN_STA_HT;
 
 
-	if ((pmlmepriv->htpriv.ht_option == false) && (pstat->flags&WLAN_STA_HT)) {
+	if ((pmlmepriv->htpriv.ht_option == false) && (pstat->flags & WLAN_STA_HT)) {
 		status = WLAN_STATUS_CHALLENGE_FAIL;
 		goto OnAssocReqFail;
 	}
 
 
 	if ((pstat->flags & WLAN_STA_HT) &&
-		    ((pstat->wpa2_pairwise_cipher&WPA_CIPHER_TKIP) ||
-		      (pstat->wpa_pairwise_cipher&WPA_CIPHER_TKIP))) {
+		    ((pstat->wpa2_pairwise_cipher & WPA_CIPHER_TKIP) ||
+		      (pstat->wpa_pairwise_cipher & WPA_CIPHER_TKIP))) {
 		/* status = WLAN_STATUS_CIPHER_SUITE_REJECTED; */
 		/* goto OnAssocReqFail; */
 	}
@@ -1638,7 +1638,7 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
 	if (memcmp(myid(&(padapter->eeprompriv)), GetAddr1Ptr(pframe), ETH_ALEN))/* for if1, sta/ap mode */
 		return _SUCCESS;
 
-	if ((pmlmeinfo->state&0x03) != WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
 		if (!(pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS))
 			return _SUCCESS;
 
@@ -1718,7 +1718,7 @@ static s32 rtw_action_public_decache(union recv_frame *recv_frame, s32 token)
 	struct adapter *adapter = recv_frame->u.hdr.adapter;
 	struct mlme_ext_priv *mlmeext = &(adapter->mlmeextpriv);
 	u8 *frame = recv_frame->u.hdr.rx_data;
-	u16 seq_ctrl = ((recv_frame->u.hdr.attrib.seq_num&0xffff) << 4) |
+	u16 seq_ctrl = ((recv_frame->u.hdr.attrib.seq_num & 0xffff) << 4) |
 		(recv_frame->u.hdr.attrib.frag_num & 0xf);
 
 	if (GetRetry(frame)) {
@@ -1855,9 +1855,9 @@ unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	unsigned short tid;
 
-	switch (pframe[WLAN_HDR_A3_LEN+1]) {
+	switch (pframe[WLAN_HDR_A3_LEN + 1]) {
 	case 0: /* SA Query req */
-		memcpy(&tid, &pframe[WLAN_HDR_A3_LEN+2], sizeof(unsigned short));
+		memcpy(&tid, &pframe[WLAN_HDR_A3_LEN + 2], sizeof(unsigned short));
 		issue_action_SA_Query(padapter, GetAddr2Ptr(pframe), 1, tid);
 		break;
 
@@ -2091,10 +2091,10 @@ static int update_hidden_ssid(u8 *ies, u32 ies_len, u8 hidden_ssid_mode)
 			u8 *next_ie = ssid_ie + 2 + ssid_len_ori;
 			u32 remain_len = 0;
 
-			remain_len = ies_len - (next_ie-ies);
+			remain_len = ies_len - (next_ie - ies);
 
 			ssid_ie[1] = 0;
-			memcpy(ssid_ie+2, next_ie, remain_len);
+			memcpy(ssid_ie + 2, next_ie, remain_len);
 			len_diff -= ssid_len_ori;
 
 			break;
@@ -2160,11 +2160,11 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 			int len_diff;
 
 			memcpy(pframe, cur_network->ies, cur_network->ie_length);
-			len_diff = update_hidden_ssid(pframe+_BEACON_IE_OFFSET_,
-						      cur_network->ie_length-_BEACON_IE_OFFSET_,
+			len_diff = update_hidden_ssid(pframe + _BEACON_IE_OFFSET_,
+						      cur_network->ie_length - _BEACON_IE_OFFSET_,
 						      pmlmeinfo->hidden_ssid_mode);
-			pframe += (cur_network->ie_length+len_diff);
-			pattrib->pktlen += (cur_network->ie_length+len_diff);
+			pframe += (cur_network->ie_length + len_diff);
+			pattrib->pktlen += (cur_network->ie_length + len_diff);
 		}
 
 		{
@@ -2310,7 +2310,7 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 	if (cur_network->ie_length > MAX_IE_SZ)
 		return;
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE) {
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE) {
 		pwps_ie = rtw_get_wps_ie(cur_network->ies+_FIXED_IE_LENGTH_, cur_network->ie_length-_FIXED_IE_LENGTH_, NULL, &wps_ielen);
 
 		/* inerset & update wps_probe_resp_ie */
@@ -2329,13 +2329,13 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 			pattrib->pktlen += wps_offset;
 
 			wps_ielen = (uint)pmlmepriv->wps_probe_resp_ie[1];/* to get ie data len */
-			if ((wps_offset+wps_ielen+2) <= MAX_IE_SZ) {
-				memcpy(pframe, pmlmepriv->wps_probe_resp_ie, wps_ielen+2);
-				pframe += wps_ielen+2;
-				pattrib->pktlen += wps_ielen+2;
+			if ((wps_offset + wps_ielen + 2)  <= MAX_IE_SZ) {
+				memcpy(pframe, pmlmepriv->wps_probe_resp_ie, wps_ielen + 2);
+				pframe += wps_ielen + 2;
+				pattrib->pktlen += wps_ielen + 2;
 			}
 
-			if ((wps_offset+wps_ielen+2+remainder_ielen) <= MAX_IE_SZ) {
+			if ((wps_offset + wps_ielen + 2 + remainder_ielen) <= MAX_IE_SZ) {
 				memcpy(pframe, premainder_ie, remainder_ielen);
 				pframe += remainder_ielen;
 				pattrib->pktlen += remainder_ielen;
@@ -2358,8 +2358,8 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 			if (!buf)
 				return;
 
-			ssid_ie = rtw_get_ie(ies+_FIXED_IE_LENGTH_, WLAN_EID_SSID, &ssid_ielen,
-				(pframe-ies)-_FIXED_IE_LENGTH_);
+			ssid_ie = rtw_get_ie(ies + _FIXED_IE_LENGTH_, WLAN_EID_SSID, &ssid_ielen,
+				(pframe - ies) - _FIXED_IE_LENGTH_);
 
 			ssid_ielen_diff = cur_network->ssid.ssid_length - ssid_ielen;
 
@@ -2367,8 +2367,8 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 				uint remainder_ielen;
 				u8 *remainder_ie;
 
-				remainder_ie = ssid_ie+2;
-				remainder_ielen = (pframe-remainder_ie);
+				remainder_ie = ssid_ie + 2;
+				remainder_ielen = (pframe - remainder_ie);
 
 				if (remainder_ielen > MAX_IE_SZ) {
 					netdev_warn(padapter->pnetdev,
@@ -2378,8 +2378,8 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 				}
 
 				memcpy(buf, remainder_ie, remainder_ielen);
-				memcpy(remainder_ie+ssid_ielen_diff, buf, remainder_ielen);
-				*(ssid_ie+1) = cur_network->ssid.ssid_length;
+				memcpy(remainder_ie + ssid_ielen_diff, buf, remainder_ielen);
+				*(ssid_ie + 1) = cur_network->ssid.ssid_length;
 				memcpy(ssid_ie+2, cur_network->ssid.ssid, cur_network->ssid.ssid_length);
 
 				pframe += ssid_ielen_diff;
@@ -2783,18 +2783,18 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 		/* p = hostapd_eid_ht_capabilities_info(hapd, p); */
 		pbuf = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_HT_CAPABILITY, &ie_len, (pnetwork->ie_length - _BEACON_IE_OFFSET_));
 		if (pbuf && ie_len > 0) {
-			memcpy(pframe, pbuf, ie_len+2);
-			pframe += (ie_len+2);
-			pattrib->pktlen += (ie_len+2);
+			memcpy(pframe, pbuf, ie_len + 2);
+			pframe += (ie_len + 2);
+			pattrib->pktlen += (ie_len + 2);
 		}
 
 		/* FILL HT ADD INFO IE */
 		/* p = hostapd_eid_ht_operation(hapd, p); */
 		pbuf = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_HT_OPERATION, &ie_len, (pnetwork->ie_length - _BEACON_IE_OFFSET_));
 		if (pbuf && ie_len > 0) {
-			memcpy(pframe, pbuf, ie_len+2);
-			pframe += (ie_len+2);
-			pattrib->pktlen += (ie_len+2);
+			memcpy(pframe, pbuf, ie_len + 2);
+			pframe += (ie_len + 2);
+			pattrib->pktlen += (ie_len + 2);
 		}
 
 	}
@@ -2806,10 +2806,10 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 
 		for (pbuf = ie + _BEACON_IE_OFFSET_; ; pbuf += (ie_len + 2)) {
 			pbuf = rtw_get_ie(pbuf, WLAN_EID_VENDOR_SPECIFIC, &ie_len, (pnetwork->ie_length - _BEACON_IE_OFFSET_ - (ie_len + 2)));
-			if (pbuf && !memcmp(pbuf+2, WMM_PARA_IE, 6)) {
-				memcpy(pframe, pbuf, ie_len+2);
-				pframe += (ie_len+2);
-				pattrib->pktlen += (ie_len+2);
+			if (pbuf && !memcmp(pbuf + 2, WMM_PARA_IE, 6)) {
+				memcpy(pframe, pbuf, ie_len + 2);
+				pframe += (ie_len + 2);
+				pattrib->pktlen += (ie_len + 2);
 
 				break;
 			}
@@ -3049,9 +3049,9 @@ static int _issue_nulldata(struct adapter *padapter, unsigned char *da,
 	fctrl = &(pwlanhdr->frame_control);
 	*(fctrl) = 0;
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)
 		SetFrDs(fctrl);
-	else if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE)
+	else if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE)
 		SetToDs(fctrl);
 
 	if (power_mode)
@@ -3193,9 +3193,9 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da,
 	fctrl = &(pwlanhdr->frame_control);
 	*(fctrl) = 0;
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)
 		SetFrDs(fctrl);
-	else if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE)
+	else if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE)
 		SetToDs(fctrl);
 
 	qc = (unsigned short *)(pframe + pattrib->hdrlen - 2);
@@ -4085,7 +4085,7 @@ void start_create_ibss(struct adapter *padapter)
 	/* update capability */
 	caps = rtw_get_capability((struct wlan_bssid_ex *)pnetwork);
 	update_capinfo(padapter, caps);
-	if (caps&WLAN_CAPABILITY_IBSS) {/* adhoc master */
+	if (caps & WLAN_CAPABILITY_IBSS) {/* adhoc master */
 		val8 = 0xcf;
 		rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
 
@@ -4137,7 +4137,7 @@ void start_clnt_join(struct adapter *padapter)
 	/* update capability */
 	caps = rtw_get_capability((struct wlan_bssid_ex *)pnetwork);
 	update_capinfo(padapter, caps);
-	if (caps&WLAN_CAPABILITY_ESS) {
+	if (caps & WLAN_CAPABILITY_ESS) {
 		Set_MSR(padapter, WIFI_FW_STATION_STATE);
 
 		val8 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_8021X) ? 0xcc : 0xcf;
@@ -4160,10 +4160,10 @@ void start_clnt_join(struct adapter *padapter)
 		beacon_timeout = decide_wait_for_beacon_timeout(pmlmeinfo->bcn_interval);
 		set_link_timer(pmlmeext, beacon_timeout);
 		_set_timer(&padapter->mlmepriv.assoc_timer,
-			(REAUTH_TO * REAUTH_LIMIT) + (REASSOC_TO*REASSOC_LIMIT) + beacon_timeout);
+			(REAUTH_TO * REAUTH_LIMIT) + (REASSOC_TO * REASSOC_LIMIT) + beacon_timeout);
 
 		pmlmeinfo->state = WIFI_FW_AUTH_NULL | WIFI_FW_STATION_STATE;
-	} else if (caps&WLAN_CAPABILITY_IBSS) { /* adhoc client */
+	} else if (caps & WLAN_CAPABILITY_IBSS) { /* adhoc client */
 		Set_MSR(padapter, WIFI_FW_ADHOC_STATE);
 
 		val8 = 0xcf;
@@ -4291,7 +4291,7 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 				if (fcn <= 14)
 					channel = fcn + j; /*  2.4 GHz */
 				else
-					channel = fcn + j*4; /*  5 GHz */
+					channel = fcn + j * 4; /*  5 GHz */
 
 				chplan_ap.Channel[i++] = channel;
 			}
@@ -4817,7 +4817,7 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 		return;
 	}
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE)
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE)
 		/* update bc/mc sta_info */
 		update_bmc_sta(padapter);
 
-- 
2.34.1

