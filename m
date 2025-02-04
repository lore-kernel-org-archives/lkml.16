Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FA72040A8
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 06:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738652308; cv=none; b=IbcJp8nRDFf8aOB4//RJhEuMUhXH4whRsci9Tr4rJxPrOrR2HO+ritWopjZ8dhqPz7dVrb4s6RuV+gunD5B3eXyD8u8n3gfvwiZRedPfqYAQESWpzm2xXHZJQzbsaS+TeRtZPY37w9lBVGpp40tEtFcxHB4f1gvbzmB5WpG2DxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738652308; c=relaxed/simple;
	bh=b3lijSXyE6x9SgjhtgDsqZA2uYCgMh+ewY1B6W4ithw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vogt4LLEaeoBCh52VpmZB5BklhV0VVOiXSOq3/vOJPZ4YI1x6cVDF+Z3GwkwHZzGDBtzVBRSkBTNQMfl3JQIIQDDvSOiZRX2SQFhprqYSkCapqp8QMqgDOc2iW3GBPKECE8wmFpTJWBDvEOYUs+xuKx3F50NMKXYICj5jLr0EnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+8kkXMp; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+8kkXMp"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3eba583fbe8so1257889b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 22:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738652304; x=1739257104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4762hkLrmSiaKdmQk784TxrThn/ycMKykakCzUArJk=;
        b=Q+8kkXMpWVORmD3im+mvlUgTT+l/zUBm6sm+WLYsvLg5p7MjcFaA0xr82r9BLm5hrC
         ldSbUyXkfbrh37cWn2QXFBCPc1N/vtKnGpJWiostO5AnfqaGTdILg4wIlO7mqr5Imfcx
         RieqIB5okkURMO7QZQgbl51pmNTOZ/AELPmMBMprNaa++w+Oe3kIV6IJ7efIGYnJDZoL
         Bo+u63cqvk6y1y/MtRssPbgWcFfnOthYwhg4Pa4vb5NxPrsV39WsFt+SpMWLOVboDzO2
         qBS+weEVzdYV5xJjg0Mubm067EotDEYpnWh/WqtjlH9oUt97mL3jjbsXpKQCdVbIfPva
         BpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738652304; x=1739257104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4762hkLrmSiaKdmQk784TxrThn/ycMKykakCzUArJk=;
        b=Yu/ySRMo7i+471DussfMsZwAouMA8vlbxkSgGyCVXdTabQrZOCKvycBnX6xE7eNOq0
         Kc/0yRjJLoX323HA3WauVrPTtScUcOwJKMGP3WXnHnxq0UjMzbPHcAh4bY1aO6ie9Q6A
         ZZGNtsUNgxTusnivhdLI2nrW0o32J/vK/ETPvW4Z2rs3HFyrAhJZRuVLcNhlqgViUKK3
         EjBYFLHI+lnBfVt41BQueX3VNDpG10mymZH15wc61VhYhK6K7KDQZaOfADrlipn+2x/p
         JOe+xJQcH7mv64V6S2R52fX5r9OBfbwQ9TMIJG9/YupQwS5XRZbjyUf2/aQyHzoVYNw7
         1b+A==
X-Forwarded-Encrypted: i=1; AJvYcCVsMLZ1ePQiusbZw/X36pBb6jvq510aO4Ja9ZCeozPqWBbzsgDeTHgeKimjZnmxOJ0Tf2oRVZZA9w5Gl5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpGV7uVi9ee49iOdUBwSm+OuoqxAeuoT9Kc9udnV0qW8i4VLJq
	cgLYnI+K8YIn3wzxcd087krkHlGPch0RyQ9cSP8jFtt9yiT/oFkA
X-Gm-Gg: ASbGnctbUAwuvF7TlFGYZ0tM4f1tVwbVGHVovk6LIT6augHOkufrQIlaKZb9xDA5dky
	yMG8DBrFkL+1ujmiqEUxp7dMgzb4rHrTjmlkza2c2tZjKl6bHG5Zh4GnlUIJmtae1vOBjZeFOUM
	Kh0F23zroDJMvbVPsWzuPd4wPeFXsetoCaF/t/eb5xuwsuMvPLEpc9XCh7O0Eof7rHryIJU6UCc
	o3YdTDk1OKkQvRYV+kwgUm3ATdDjPX3U1lBfNszsyjFkParxFdXEXfnjis/Xn9UbV3dZ3fXdAfl
	R9C0y5PHx161VdKoE68NGI3buePwc0zy8heP2Pd7v+QAlrnpwkM48FxktMgkDR+aWjCijTEnzY5
	s
X-Google-Smtp-Source: AGHT+IFx7DNMU57U7g4/HUYZJ5bg9VweGyCmrkUIq81hlCJJ3ZMs79YG8u1S5Pw8uhNvInKMoMkVdQ==
X-Received: by 2002:a05:6808:4491:b0:3f0:8e41:a7a7 with SMTP id 5614622812f47-3f323820aa2mr18252090b6e.0.1738652303935;
        Mon, 03 Feb 2025 22:58:23 -0800 (PST)
Received: from DESKTOP-GL3U3CJ (162-207-94-177.lightspeed.irvnca.sbcglobal.net. [162.207.94.177])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc104b3c1dsm2984812eaf.8.2025.02.03.22.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 22:58:23 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 2/4] staging: rtl8723bs: Split up long lines
Date: Mon,  3 Feb 2025 22:57:20 -0800
Message-ID: <d63d1cc70895976f4864740b82e40d0dbd6e6ccf.1738651582.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <cover.1738651582.git.onlyian4981@gmail.com>
References: <cover.1738651582.git.onlyian4981@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Long lines were present and split up.

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 38 ++++++++++++-------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index f73bde9ee4d3..7929e93c23ac 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -336,13 +336,13 @@ void r8723bs_select_channel(struct adapter *padapter, unsigned char channel)
 	mutex_unlock(&(adapter_to_dvobj(padapter)->setch_mutex));
 }
 
-void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigned char channel_offset, unsigned short bwmode)
+void set_channel_bwmode(struct adapter *padapter, unsigned char channel,
+			unsigned char channel_offset, unsigned short bwmode)
 {
 	u8 center_ch, chnl_offset80 = HAL_PRIME_CHNL_OFFSET_DONT_CARE;
 
 	center_ch = rtw_get_center_ch(channel, bwmode, channel_offset);
 
-
 	/* set Channel */
 	if (mutex_lock_interruptible(&(adapter_to_dvobj(padapter)->setch_mutex)))
 		return;
@@ -352,7 +352,8 @@ void set_channel_bwmode(struct adapter *padapter, unsigned char channel, unsigne
 	rtw_set_oper_bw(padapter, bwmode);
 	rtw_set_oper_choffset(padapter, channel_offset);
 
-	rtw_hal_set_chnl_bw(padapter, center_ch, bwmode, channel_offset, chnl_offset80); /*  set center channel */
+	/* set center channel */
+	rtw_hal_set_chnl_bw(padapter, center_ch, bwmode, channel_offset, chnl_offset80);
 
 	mutex_unlock(&(adapter_to_dvobj(padapter)->setch_mutex));
 }
@@ -382,7 +383,8 @@ int is_client_associated_to_ap(struct adapter *padapter)
 	pmlmeext = &padapter->mlmeextpriv;
 	pmlmeinfo = &(pmlmeext->mlmext_info);
 
-	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE))
+	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) &&
+	    ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE))
 		return true;
 	else
 		return _FAIL;
@@ -393,7 +395,8 @@ int is_client_associated_to_ibss(struct adapter *padapter)
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 
-	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE))
+	if ((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) &&
+	    ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE))
 		return true;
 	else
 		return _FAIL;
@@ -468,7 +471,8 @@ void _write_cam(struct adapter *padapter, u8 entry, u16 ctrl, u8 *mac, u8 *key)
 void _clear_cam_entry(struct adapter *padapter, u8 entry)
 {
 	unsigned char null_sta[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
-	unsigned char null_key[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
+	unsigned char null_key[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+		0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
 
 	_write_cam(padapter, entry, 0, null_sta, null_key);
 }
@@ -572,8 +576,8 @@ s16 rtw_camid_alloc(struct adapter *adapter, struct sta_info *sta, u8 kid)
 
 	mlmeinfo = &adapter->mlmeextpriv.mlmext_info;
 
-	if ((((mlmeinfo->state&0x03) == WIFI_FW_AP_STATE) || ((mlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE))
-		&& !sta) {
+	if ((((mlmeinfo->state & 0x03) == WIFI_FW_AP_STATE) ||
+	     ((mlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE)) && !sta) {
 		/* AP/Ad-hoc mode group key: static alloction to default key by key ID */
 		if (kid > 3) {
 			netdev_dbg(adapter->pnetdev,
@@ -1142,7 +1146,9 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	if (!bssid)
 		return true;
 
-	if ((pmlmepriv->timeBcnInfoChkStart != 0) && (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) > DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)) {
+	if ((pmlmepriv->timeBcnInfoChkStart != 0) &&
+	    (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) >
+	     DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)) {
 		pmlmepriv->timeBcnInfoChkStart = 0;
 		pmlmepriv->NumOfBcnInfoChkFail = 0;
 	}
@@ -1214,7 +1220,7 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	bssid->ssid.ssid_length = ssid_len;
 
 	if (memcmp(bssid->ssid.ssid, cur_network->network.ssid.ssid, 32) ||
-			bssid->ssid.ssid_length != cur_network->network.ssid.ssid_length)
+	    bssid->ssid.ssid_length != cur_network->network.ssid.ssid_length)
 		if (bssid->ssid.ssid[0] != '\0' &&
 		    bssid->ssid.ssid_length != 0) /* not hidden ssid */
 			goto _mismatch;
@@ -1275,8 +1281,10 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 
 	pmlmepriv->NumOfBcnInfoChkFail++;
 
-	if ((pmlmepriv->timeBcnInfoChkStart != 0) && (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) <= DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)
-		&& (pmlmepriv->NumOfBcnInfoChkFail >= DISCONNECT_BY_CHK_BCN_FAIL_THRESHOLD)) {
+	if ((pmlmepriv->timeBcnInfoChkStart != 0) &&
+	    (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) <=
+	     DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS) &&
+	    (pmlmepriv->NumOfBcnInfoChkFail >= DISCONNECT_BY_CHK_BCN_FAIL_THRESHOLD)) {
 		pmlmepriv->timeBcnInfoChkStart = 0;
 		pmlmepriv->NumOfBcnInfoChkFail = 0;
 		return _FAIL;
@@ -1337,7 +1345,8 @@ unsigned int is_ap_in_tkip(struct adapter *padapter)
 
 			switch (pIE->element_id) {
 			case WLAN_EID_VENDOR_SPECIFIC:
-				if ((!memcmp(pIE->data, RTW_WPA_OUI, 4)) && (!memcmp((pIE->data + 12), WPA_TKIP_CIPHER, 4)))
+				if ((!memcmp(pIE->data, RTW_WPA_OUI, 4)) &&
+				    (!memcmp((pIE->data + 12), WPA_TKIP_CIPHER, 4)))
 					return true;
 
 				break;
@@ -1440,7 +1449,8 @@ unsigned char check_assoc_AP(u8 *pframe, uint len)
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
-			if ((!memcmp(pIE->data, ARTHEROS_OUI1, 3)) || (!memcmp(pIE->data, ARTHEROS_OUI2, 3)))
+			if ((!memcmp(pIE->data, ARTHEROS_OUI1, 3)) ||
+			    (!memcmp(pIE->data, ARTHEROS_OUI2, 3)))
 				return HT_IOT_PEER_ATHEROS;
 			else if ((!memcmp(pIE->data, BROADCOM_OUI1, 3)) ||
 				 (!memcmp(pIE->data, BROADCOM_OUI2, 3)) ||
-- 
2.45.3

