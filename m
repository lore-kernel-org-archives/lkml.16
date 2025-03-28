Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1341DFFC
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743165778; cv=none; b=hHDCNDJozf2U4qrVSY/exNuFPMQmeZOKO2146JoIQpOk6bUcWzCEd2RYDf44YtZPDdQ+a98FI/Rwp6z5hhyfhxVaR/J+aKEs/CVU+HM4YjOPOSuQVZScAdUz1BzgK1pi4W2o3aM+OlzKLBYDTIxKwrEPsaRRjrs6F4EePrfjDXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743165778; c=relaxed/simple;
	bh=5UR6ayO7ahlmy1SuBRIJBCPI0tvhPR90g0rQsk4K4es=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=apZKayDkbDCURroQTE7ves9qcA9R8x3bqLhhi08mfG5ZOTiQ9XYvpj4WDSWXQB7p8eB+FBWDWy4A2mrxWSTFJnvkl2MiM961c8aBPgWl4bg/7AbfDDoz5QjV3dzfYugT70Drl6SmCVAuFy+1f1DvUYjZv7W75o8XRrFqq6dd2TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLFZDWPV; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLFZDWPV"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso322460f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 05:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743165774; x=1743770574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67PEbNDUNRL6bldQ089qFs6afLhuv9l0weohA0EjV7c=;
        b=RLFZDWPVfyuD/2Hbo2VK/NKvwdC/c29mcUXbuWgFTCOFsxKNnAQfNzKH4Pajvn0GIi
         G8wKQRgZGl67XCLbMXBz6dlAfheIQcYxKHrxIeg63b199wd3Hn20ptI2VRMubt/VYRLO
         S6w/hmE9ENaVLVaUUYyux1xZOwmfwO06oqE4YYgN3R8Ol5EaGRasc/OWYOgNQmjbAieH
         fggzNGY+EC9BY3XP0+tstr9RL1F1evt0RA6B6FM0Hv8f3c4gV1Gev20GK4z7UsVx558n
         fmHJXobSFB0DhqjpxJDLEh+RS0WPk25ikGVAyW+p3UFE+Tm0gFDk+XT8K4nZSFlv1HMm
         tUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743165774; x=1743770574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67PEbNDUNRL6bldQ089qFs6afLhuv9l0weohA0EjV7c=;
        b=AtQA8VWWYN9LrB5PbWT17cwSM13cSEmDYvWYJ6Yf5qM99d+tXtXN2osJFvoxiQXo91
         ZwZByp4MWj5juNASU7blWd1wAmH1n2fMIShipItAuo10+Rg8zIdLl1WlMhuY40psCsxU
         R4tnZrnAtKGGVkfo2rKHdoVO3NOO2tu7Ku8O8PiQngDnhbNfoHC4SbdQZtBm2U9CUEY9
         BDVkJsCCB3QaptdcRoRODrXxd0Xj9CMfLBp4vRa8bzBNTNxJcD8SOVmwZSuqLBvPq98u
         YhebCcXEVBoHQwKLC0bZils8lypvaw+d0+Fo17cLa8QQrghcAfdgTddJ3AJgWxDUecSY
         ciHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHpHMC+JYlHJ0sRvt0G1PpABmVTeuw+LdLKZCwUSiCXARW9cmzLuktERZHZ+hKsi2QmIYxWr8xe3b/6IA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw0UyEI1woghfz6xoIdG6dYepZTO2OMVucU+D8ddXNxa6trk8W
	wr1rsOg1Sj95I3/0i8XCd5bG8Eh85Hcsic/QdEsbsvIOXmaCL9IM
X-Gm-Gg: ASbGncvzijCGiXIloqKixX2DHLeM1T0vCJ7/vWYodNLTwOnoHMpvn+mwWKLARCIL3CQ
	WUds8nUSE+Rl13oXfzaDlPbW9U4DeFLjQOwqxXPJjc9UmpHvjeq/10IymrSGil4/L1p9nou/wiw
	yOlL2uhYyKpPRbRIr1hYWFPZIauHbsfxgMNR8Dq4UgRA2da3kT7Vnp8isLM21Bb+VLJDFsCsSk2
	i75AIxNAIcSInbfJuNcXbklBfs1dnP5dpwjaoK3yuF+QhBlgG3Z8hCND32qBTAWS2mni+psmTVF
	Y9MmRQe+S7ds1FSxQm969oUX5wF0sc/KIR7TbU5aeO+1lUWw
X-Google-Smtp-Source: AGHT+IENCoyK+L/I8eKgCWP4bqtCFTY7DErcApsvX/Mq/ovGNx90v/7Amk/Z7w1hB9VWy/Xmi7LKRg==
X-Received: by 2002:a5d:584e:0:b0:399:737f:4de3 with SMTP id ffacd0b85a97d-39ad174e510mr6365109f8f.29.1743165773935;
        Fri, 28 Mar 2025 05:42:53 -0700 (PDT)
Received: from HP-650 ([105.112.193.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6588d0sm2487627f8f.7.2025.03.28.05.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 05:42:53 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	julia.lawall@inria.fr,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH 1/5] staging: rtl8723bs: correct coding style by preventing lines from ending with '('
Date: Fri, 28 Mar 2025 13:39:38 +0100
Message-Id: <62af31d16fd763094f6aeda597da4d8a0b61d6a7.1743163801.git.abrahamadekunle50@gmail.com>
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

According to the Linux kernel coding style, function calls and statements
should not end with an open parenthesis '('.

Adjust such lines by moving parameters and conditions to the same line
where appropriate, ensuring better readability and adherence to the
kernel style guidelines while maintaining functionality and logic.

Reported by checkpatch:

CHECK: Lines should not end with '('

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 230 +++++++-----------------
 1 file changed, 60 insertions(+), 170 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 50022bb5911e..640381c55fe3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -482,14 +482,12 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 		/* check if sta supports rx ampdu */
 		phtpriv_sta->ampdu_enable = phtpriv_ap->ampdu_enable;
 
-		phtpriv_sta->rx_ampdu_min_spacing = (
-			phtpriv_sta->ht_cap.ampdu_params_info & IEEE80211_HT_CAP_AMPDU_DENSITY
-		) >> 2;
+		phtpriv_sta->rx_ampdu_min_spacing = (phtpriv_sta->ht_cap.ampdu_params_info &
+						     IEEE80211_HT_CAP_AMPDU_DENSITY) >> 2;
 
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
+			    0x0C) >> 2;
 
 	/*  */
 	/*  Config current HT Protection mode. */
@@ -707,9 +702,7 @@ void start_bss_network(struct adapter *padapter)
 	rtw_hal_set_hwreg(padapter, HW_VAR_AC_PARAM_BK, (u8 *)(&acparm));
 
 	/* Set Security */
-	val8 = (
-		psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X
-	) ? 0xcc : 0xcf;
+	val8 = (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) ? 0xcc : 0xcf;
 	rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
 
 	/* Beacon Control related register */
@@ -736,8 +729,7 @@ void start_bss_network(struct adapter *padapter)
 	p = rtw_get_ie((pnetwork->ies + sizeof(struct ndis_802_11_fix_ie)),
 		       WLAN_EID_HT_OPERATION,
 		       &ie_len,
-		       (pnetwork->ie_length - sizeof(struct ndis_802_11_fix_ie))
-	);
+		       (pnetwork->ie_length - sizeof(struct ndis_802_11_fix_ie)));
 	if (p && ie_len) {
 		pht_info = (struct HT_info_element *)(p + 2);
 
@@ -789,10 +781,7 @@ void start_bss_network(struct adapter *padapter)
 	rtw_hal_set_hwreg(padapter, HW_VAR_BASIC_RATE, pnetwork->supported_rates);
 
 	/* update capability after cur_wireless_mode updated */
-	update_capinfo(
-		padapter,
-		rtw_get_capability((struct wlan_bssid_ex *)pnetwork)
-	);
+	update_capinfo(padapter, rtw_get_capability((struct wlan_bssid_ex *)pnetwork));
 
 	if (pmlmeext->bstart_bss) {
 		update_beacon(padapter, WLAN_EID_TIM, NULL, true);
@@ -858,12 +847,8 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	cap = get_unaligned_le16(ie);
 
 	/* SSID */
-	p = rtw_get_ie(
-		ie + _BEACON_IE_OFFSET_,
-		WLAN_EID_SSID,
-		&ie_len,
-		(pbss_network->ie_length - _BEACON_IE_OFFSET_)
-	);
+	p = rtw_get_ie(ie + _BEACON_IE_OFFSET_,  WLAN_EID_SSID, &ie_len,
+		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
 	if (p && ie_len > 0) {
 		memset(&pbss_network->ssid, 0, sizeof(struct ndis_802_11_ssid));
 		memcpy(pbss_network->ssid.ssid, (p + 2), ie_len);
@@ -873,11 +858,8 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
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
 
@@ -885,24 +867,16 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 	memset(supportRate, 0, NDIS_802_11_LENGTH_RATES_EX);
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
 		memcpy(supportRate, p + 2, ie_len);
 		supportRateNum = ie_len;
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
 		memcpy(supportRate + supportRateNum, p + 2, ie_len);
 		supportRateNum += ie_len;
@@ -913,12 +887,8 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
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
 
@@ -934,20 +904,11 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
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
+		if (rtw_parse_wpa2_ie(p, ie_len + 2, &group_cipher, &pairwise_cipher,
+				      NULL) == _SUCCESS) {
 			psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
 
 			psecuritypriv->dot8021xalg = 1;/* psk,  todo:802.1x */
@@ -964,20 +925,11 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
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
+			if (rtw_parse_wpa_ie(p, ie_len + 2, &group_cipher, &pairwise_cipher,
+					     NULL) == _SUCCESS) {
 				psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
 
 				psecuritypriv->dot8021xalg = 1;/* psk,  todo:802.1x */
@@ -1000,11 +952,8 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	pmlmepriv->qospriv.qos_option = 0;
 	if (pregistrypriv->wmm_enable) {
 		for (p = ie + _BEACON_IE_OFFSET_; ; p += (ie_len + 2)) {
-			p = rtw_get_ie(
-				p,
-				WLAN_EID_VENDOR_SPECIFIC,
-				&ie_len,
-				(pbss_network->ie_length - _BEACON_IE_OFFSET_ - (ie_len + 2))
+			p = rtw_get_ie(p, WLAN_EID_VENDOR_SPECIFIC, &ie_len,
+				       (pbss_network->ie_length - _BEACON_IE_OFFSET_ - (ie_len + 2))
 			);
 			if ((p) && !memcmp(p + 2, WMM_PARA_IE, 6)) {
 				pmlmepriv->qospriv.qos_option = 1;
@@ -1027,12 +976,8 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
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
@@ -1059,9 +1004,8 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		if (!TEST_FLAG(pmlmepriv->htpriv.stbc_cap, STBC_HT_ENABLE_RX))
 			pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_RX_STBC_3R));
 
-		pht_cap->ampdu_params_info &= ~(
-			IEEE80211_HT_CAP_AMPDU_FACTOR | IEEE80211_HT_CAP_AMPDU_DENSITY
-		);
+		pht_cap->ampdu_params_info &= ~(IEEE80211_HT_CAP_AMPDU_FACTOR |
+						IEEE80211_HT_CAP_AMPDU_DENSITY);
 
 		if ((psecuritypriv->wpa_pairwise_cipher & WPA_CIPHER_CCMP) ||
 		    (psecuritypriv->wpa2_pairwise_cipher & WPA_CIPHER_CCMP)) {
@@ -1072,14 +1016,10 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
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
+		rtw_hal_get_def_var(padapter, HW_VAR_MAX_RX_AMPDU_FACTOR,
+				    &max_rx_ampdu_factor);
+		pht_cap->ampdu_params_info |= (IEEE80211_HT_CAP_AMPDU_FACTOR &
+					max_rx_ampdu_factor); /* set  Max Rx AMPDU size  to 64K */
 
 		pht_cap->mcs.rx_mask[0] = 0xff;
 		pht_cap->mcs.rx_mask[1] = 0x0;
@@ -1088,12 +1028,8 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
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
 		pHT_info_ie = p;
 
@@ -1135,9 +1071,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		HT_info_handler(padapter, (struct ndis_80211_var_ie *)pHT_info_ie);
 	}
 
-	pbss_network->length = get_wlan_bssid_ex_sz(
-		(struct wlan_bssid_ex  *)pbss_network
-	);
+	pbss_network->length = get_wlan_bssid_ex_sz((struct wlan_bssid_ex  *)pbss_network);
 
 	/* issue beacon to start bss network */
 	/* start_bss_network(padapter, (u8 *)pbss_network); */
@@ -1244,10 +1178,7 @@ void rtw_acl_remove_sta(struct adapter *padapter, u8 *addr)
 	list_for_each_safe(plist, tmp, phead) {
 		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
 
-		if (
-			!memcmp(paclnode->addr, addr, ETH_ALEN) ||
-			is_broadcast_ether_addr(addr)
-		) {
+		if (!memcmp(paclnode->addr, addr, ETH_ALEN) || is_broadcast_ether_addr(addr)) {
 			if (paclnode->valid) {
 				paclnode->valid = false;
 
@@ -1297,13 +1228,7 @@ u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta)
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
@@ -1367,13 +1292,7 @@ int rtw_ap_set_group_key(struct adapter *padapter, u8 *key, u8 alg, int keyid)
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
 
@@ -1408,21 +1327,16 @@ static void update_bcn_erpinfo_ie(struct adapter *padapter)
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
 		struct ndis_80211_var_ie *pIE = (struct ndis_80211_var_ie *)p;
 
 		if (pmlmepriv->num_sta_non_erp == 1)
 			pIE->data[0] |= RTW_ERP_INFO_NON_ERP_PRESENT | RTW_ERP_INFO_USE_PROTECTION;
 		else
-			pIE->data[0] &= ~(
-				RTW_ERP_INFO_NON_ERP_PRESENT | RTW_ERP_INFO_USE_PROTECTION
-			);
+			pIE->data[0] &= ~(RTW_ERP_INFO_NON_ERP_PRESENT |
+					  RTW_ERP_INFO_USE_PROTECTION);
 
 		if (pmlmepriv->num_sta_no_short_preamble > 0)
 			pIE->data[0] |= RTW_ERP_INFO_BARKER_PREAMBLE_MODE;
@@ -1468,12 +1382,8 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 	unsigned char *ie = pnetwork->ies;
 	u32 ielen = pnetwork->ie_length;
 
-	pwps_ie = rtw_get_wps_ie(
-		ie + _FIXED_IE_LENGTH_,
-		ielen - _FIXED_IE_LENGTH_,
-		NULL,
-		&wps_ielen
-	);
+	pwps_ie = rtw_get_wps_ie(ie + _FIXED_IE_LENGTH_, ielen - _FIXED_IE_LENGTH_, NULL,
+				 &wps_ielen);
 
 	if (!pwps_ie || wps_ielen == 0)
 		return;
@@ -1658,9 +1568,8 @@ static int rtw_ht_operation_update(struct adapter *padapter)
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
@@ -1881,12 +1790,7 @@ u8 bss_cap_update_on_sta_leave(struct adapter *padapter, struct sta_info *psta)
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
 
@@ -2014,25 +1918,15 @@ void rtw_ap_restore_network(struct adapter *padapter)
 
 	rtw_setopmode_cmd(padapter, Ndis802_11APMode, false);
 
-	set_channel_bwmode(
-		padapter,
-		pmlmeext->cur_channel,
-		pmlmeext->cur_ch_offset,
-		pmlmeext->cur_bwmode
-	);
+	set_channel_bwmode(padapter, pmlmeext->cur_channel, pmlmeext->cur_ch_offset,
+			   pmlmeext->cur_bwmode);
 
 	start_bss_network(padapter);
 
 	if ((padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_) ||
 	    (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
 		/* restore group key, WEP keys is restored in ips_leave() */
-		rtw_set_key(
-			padapter,
-			psecuritypriv,
-			psecuritypriv->dot118021XGrpKeyid,
-			0,
-			false
-		);
+		rtw_set_key(padapter, psecuritypriv, psecuritypriv->dot118021XGrpKeyid, 0, false);
 	}
 
 	spin_lock_bh(&pstapriv->asoc_list_lock);
@@ -2133,11 +2027,7 @@ void stop_ap_mode(struct adapter *padapter)
 	pmlmeext->bstart_bss = false;
 
 	/* reset and init security priv , this can refine with rtw_reset_securitypriv */
-	memset(
-		(unsigned char *)&padapter->securitypriv,
-		0,
-		sizeof(struct security_priv)
-	);
+	memset((unsigned char *)&padapter->securitypriv, 0, sizeof(struct security_priv));
 	padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeOpen;
 	padapter->securitypriv.ndisencryptstatus = Ndis802_11WEPDisabled;
 
-- 
2.34.1

