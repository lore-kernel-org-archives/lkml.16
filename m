Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EED158524
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 06:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738652304; cv=none; b=EsCHJZXVKv6POgisr9fGHoZ/5/8xPrFXELq5wh+U3MiqXLdjChH2MpcdBwMj48IQqVZKvsqBCOOF6pFvPnWGpz/OJZvjcpdqDuZW60/LSyQXrOjMARD40XmTgni6WM1/cPWamCc8R4w5lyYw6fRTf/J56Sy4ECdcRO+HuUmZ1fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738652304; c=relaxed/simple;
	bh=dY3XMv6XCS+Kgh20TNrcg77Cnv/MOiEl1Kmxsu+FxzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HE0tQ1PUfLSW6Z79E/17nMtZdiyhR3UzS90jfAI1K1SYzXVkuhcG2yAWQ4zxv1DrxwAIgtzY9Yu6BZo8Z8JvqDBB6uH/Yn6yUDIc8WXj/UvsU+WKXa+yxhOp55uZGQ/UJvzUfnMbr5r4X2W/siVaq4DObWnR6v0TXMG3XOwKYIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f6Nc5LVb; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6Nc5LVb"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2a01bcd0143so3489120fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 22:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738652301; x=1739257101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+gIbAsvAdDC8Lv0QOQf7RrQntEmNr+Q7vrClBGKTqs=;
        b=f6Nc5LVbY/NLUM4NN0Pqqw58HiRnEYdJeHgG0tJQi/6/8jwM6aHdONmSPk9waoiKAA
         FIRPtB7Hx7kQ3KPtpeL4KWd1jZ1315YS8dLtYcYNyAHYXbAtWE58zmtAw7OUPGtp9Hxk
         XyFRPocTZt4Mk19baX9H4VficcFcqWFToPDXj1WTiUB19aU2OXbW5W/+aV0/RBX3qw7u
         rTyjIRZTA5l83ZrtQljsceb1dRsHj2EMKXAW9IsttKf1NMxdqLC8GXVGFIuodwLnO4n/
         F55jzXcFWN/hKyguqtCmbUuOPEz2TFZFAxuF/R9RmmOPW8MqOGlLw0tvaLo9PZEAtBSZ
         UYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738652301; x=1739257101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+gIbAsvAdDC8Lv0QOQf7RrQntEmNr+Q7vrClBGKTqs=;
        b=YMKX6jnrTEcK9223C9d6AOVa9qpbaBpb/v7zEeu99syNj0aOHu0mkFQxFRovUHq/em
         aEqAMCAHX12wV7lwoRxc/QqM7Vi3uA6LFTMFzyyLsBzzvAaMIvQtZlmABBLkxuBs8kvR
         X+bsHdSX6ENFdiWWnliw5qAREiQyGIvR0/yQfHUXRNPWP4VuwaSspiMg5Gj8tmNXIoYT
         W+FsR2Vo8EgR21oOLJzaZjdqe+7B09VdOjY32iJhax46wO5s9QdnBOqxs6HKU/HS5iOX
         3a4wROBYBPtxHqQkLhoFxZDnklwMjcgJ2iKRHZOdDWibtM+fzzH2ojVzWtNjnmIvp/zr
         vmng==
X-Forwarded-Encrypted: i=1; AJvYcCXfEQFkkie8GyCg8aZn3Phtw6F00oUzRJAOodrRuyfmn+qJlOcrqfRZ16LI9FQSX+BrrTd3LpriK9OkPgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwSs6JbHeJhGqMqaHciiVYS0RGxniUuUfIV7CSgjisodTemwN+
	z3NI7jzKdkcTXQj/jR8GevD4pXrNm0GZn5S1ehZqlAheELdUNcnfDCI+Buv2bDA=
X-Gm-Gg: ASbGnctO+l9RbOyvimcaY7/wzQ1x6Ftth/NKezBj/3RHZ8pHJMQHzrPBTfcFf7iAA2M
	3vwbNkE5Ofe3cUH9gYIFaSAheagNJfqROt1Kxzo04UKWI/7GyxGITHl1RxIUiwkRkcrVm0dgWMx
	hQhDwem9+4PROVI998EMnmTPHQYHbulaVwUGAqu/A9rC499Gk8nLvTabMphyW3CLRrL5bEjk+0P
	2rPJ/U3faBp31fLv2fSOlGQEIOjYnWXDcbft1Sl2Fiuj099sOkFns971RZePz2jZ31ZAnmEc/lz
	KOAGdU5VY7qVg4EyJuhGL+1xWFlLyb8Pyzqyj5N/+/mq50E+HWRB89V1SKGi/Cif0JrSThJJNtA
	Y
X-Google-Smtp-Source: AGHT+IHud1Lx/e9hjLylARcdg9YwgwsL26JFB4RSMGKgaYHKocJaJ769bcyXNbc2yJwuIYn75/h4mQ==
X-Received: by 2002:a05:6871:20cb:b0:29e:526a:eeef with SMTP id 586e51a60fabf-2b32f3503e2mr15436661fac.34.1738652301328;
        Mon, 03 Feb 2025 22:58:21 -0800 (PST)
Received: from DESKTOP-GL3U3CJ (162-207-94-177.lightspeed.irvnca.sbcglobal.net. [162.207.94.177])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b3565b5946sm3887340fac.31.2025.02.03.22.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 22:58:20 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 1/4] staging: rtl8723bs: Add missing spaces
Date: Mon,  3 Feb 2025 22:57:19 -0800
Message-ID: <28655748fedb84aa4cfde307ec4d2020610b2047.1738651582.git.onlyian4981@gmail.com>
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

Add missing spaces to operators.

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 55 ++++++++++---------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 73c70b016f00..f73bde9ee4d3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -170,10 +170,10 @@ void get_rate_set(struct adapter *padapter, unsigned char *pbssrate, int *bssrat
 
 void set_mcs_rate_by_mask(u8 *mcs_set, u32 mask)
 {
-	u8 mcs_rate_1r = (u8)(mask&0xff);
-	u8 mcs_rate_2r = (u8)((mask>>8)&0xff);
-	u8 mcs_rate_3r = (u8)((mask>>16)&0xff);
-	u8 mcs_rate_4r = (u8)((mask>>24)&0xff);
+	u8 mcs_rate_1r = (u8)(mask & 0xff);
+	u8 mcs_rate_2r = (u8)((mask >> 8) & 0xff);
+	u8 mcs_rate_3r = (u8)((mask >> 16) & 0xff);
+	u8 mcs_rate_4r = (u8)((mask >> 24) & 0xff);
 
 	mcs_set[0] &= mcs_rate_1r;
 	mcs_set[1] &= mcs_rate_2r;
@@ -267,21 +267,22 @@ inline void rtw_set_oper_ch(struct adapter *adapter, u8 ch)
 		dvobj->on_oper_ch_time = jiffies;
 
 #ifdef DBG_CH_SWITCH
-		cnt += scnprintf(msg+cnt, len-cnt, "switch to ch %3u", ch);
+		cnt += scnprintf(msg + cnt, len - cnt, "switch to ch %3u", ch);
 
 		for (i = 0; i < dvobj->iface_nums; i++) {
 			struct adapter *iface = dvobj->padapters[i];
 
-			cnt += scnprintf(msg+cnt, len-cnt, " [%s:", ADPT_ARG(iface));
+			cnt += scnprintf(msg + cnt, len - cnt, " [%s:", ADPT_ARG(iface));
 			if (iface->mlmeextpriv.cur_channel == ch)
-				cnt += scnprintf(msg+cnt, len-cnt, "C");
+				cnt += scnprintf(msg + cnt, len - cnt, "C");
 			else
-				cnt += scnprintf(msg+cnt, len-cnt, "_");
-			if (iface->wdinfo.listen_channel == ch && !rtw_p2p_chk_state(&iface->wdinfo, P2P_STATE_NONE))
-				cnt += scnprintf(msg+cnt, len-cnt, "L");
+				cnt += scnprintf(msg + cnt, len - cnt, "_");
+			if (iface->wdinfo.listen_channel == ch &&
+			    !rtw_p2p_chk_state(&iface->wdinfo, P2P_STATE_NONE))
+				cnt += scnprintf(msg + cnt, len - cnt, "L");
 			else
-				cnt += scnprintf(msg+cnt, len-cnt, "_");
-			cnt += scnprintf(msg+cnt, len-cnt, "]");
+				cnt += scnprintf(msg + cnt, len - cnt, "_");
+			cnt += scnprintf(msg + cnt, len - cnt, "]");
 		}
 
 #endif /* DBG_CH_SWITCH */
@@ -431,7 +432,7 @@ void invalidate_cam_all(struct adapter *padapter)
 
 	spin_lock_bh(&cam_ctl->lock);
 	cam_ctl->bitmap = 0;
-	memset(dvobj->cam_cache, 0, sizeof(struct cam_entry_cache)*TOTAL_CAM_ENTRY);
+	memset(dvobj->cam_cache, 0, sizeof(struct cam_entry_cache) * TOTAL_CAM_ENTRY);
 	spin_unlock_bh(&cam_ctl->lock);
 }
 
@@ -522,7 +523,7 @@ static bool _rtw_camid_is_gk(struct adapter *adapter, u8 cam_id)
 	if (!(cam_ctl->bitmap & BIT(cam_id)))
 		goto exit;
 
-	ret = (dvobj->cam_cache[cam_id].ctrl&BIT6)?true:false;
+	ret = (dvobj->cam_cache[cam_id].ctrl & BIT6) ? true : false;
 
 exit:
 	return ret;
@@ -537,7 +538,7 @@ static s16 _rtw_camid_search(struct adapter *adapter, u8 *addr, s16 kid)
 	for (i = 0; i < TOTAL_CAM_ENTRY; i++) {
 		if (addr && memcmp(dvobj->cam_cache[i].mac, addr, ETH_ALEN))
 			continue;
-		if (kid >= 0 && kid != (dvobj->cam_cache[i].ctrl&0x03))
+		if (kid >= 0 && kid != (dvobj->cam_cache[i].ctrl & 0x03))
 			continue;
 
 		cam_id = i;
@@ -585,7 +586,7 @@ s16 rtw_camid_alloc(struct adapter *adapter, struct sta_info *sta, u8 kid)
 		cam_id = kid;
 	} else {
 		int i;
-		u8 *addr = sta?sta->hwaddr:NULL;
+		u8 *addr = sta ? sta->hwaddr : NULL;
 
 		if (!sta) {
 			if (!(mlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)) {
@@ -792,7 +793,7 @@ void WMMOnAssocRsp(struct adapter *padapter)
 			switch (ACI) {
 			case 0x0:
 				rtw_hal_set_hwreg(padapter, HW_VAR_AC_PARAM_BE, (u8 *)(&acParm));
-				acm_mask |= (ACM ? BIT(1):0);
+				acm_mask |= (ACM ? BIT(1) : 0);
 				edca[XMIT_BE_QUEUE] = acParm;
 				break;
 
@@ -804,13 +805,13 @@ void WMMOnAssocRsp(struct adapter *padapter)
 
 			case 0x2:
 				rtw_hal_set_hwreg(padapter, HW_VAR_AC_PARAM_VI, (u8 *)(&acParm));
-				acm_mask |= (ACM ? BIT(2):0);
+				acm_mask |= (ACM ? BIT(2) : 0);
 				edca[XMIT_VI_QUEUE] = acParm;
 				break;
 
 			case 0x3:
 				rtw_hal_set_hwreg(padapter, HW_VAR_AC_PARAM_VO, (u8 *)(&acParm));
-				acm_mask |= (ACM ? BIT(3):0);
+				acm_mask |= (ACM ? BIT(3) : 0);
 				edca[XMIT_VO_QUEUE] = acParm;
 				break;
 			}
@@ -1175,7 +1176,7 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 		ht_info_infos_0 = 0;
 	}
 	if (ht_cap_info != cur_network->bcn_info.ht_cap_info ||
-	    ((ht_info_infos_0&0x03) != (cur_network->bcn_info.ht_info_infos_0&0x03))) {
+	    ((ht_info_infos_0 & 0x03) != (cur_network->bcn_info.ht_info_infos_0 & 0x03))) {
 		{
 			/* bcn_info_update */
 			cur_network->bcn_info.ht_cap_info = ht_cap_info;
@@ -1243,12 +1244,12 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 		goto _mismatch;
 
 	if (encryp_protocol == ENCRYP_PROTOCOL_WPA || encryp_protocol == ENCRYP_PROTOCOL_WPA2) {
-		pbuf = rtw_get_wpa_ie(&bssid->ies[12], &wpa_ielen, bssid->ie_length-12);
+		pbuf = rtw_get_wpa_ie(&bssid->ies[12], &wpa_ielen, bssid->ie_length - 12);
 		if (pbuf && (wpa_ielen > 0)) {
 			rtw_parse_wpa_ie(pbuf, wpa_ielen + 2, &group_cipher,
 					 &pairwise_cipher, &is_8021x);
 		} else {
-			pbuf = rtw_get_wpa2_ie(&bssid->ies[12], &wpa_ielen, bssid->ie_length-12);
+			pbuf = rtw_get_wpa2_ie(&bssid->ies[12], &wpa_ielen, bssid->ie_length - 12);
 
 			if (pbuf && (wpa_ielen > 0))
 				rtw_parse_wpa2_ie(pbuf, wpa_ielen + 2, &group_cipher,
@@ -1635,7 +1636,7 @@ void process_addba_req(struct adapter *padapter, u8 *paddba_req, u8 *addr)
 
 	if (psta) {
 		param = le16_to_cpu(preq->BA_para_set);
-		tid = (param>>2)&0x0f;
+		tid = (param >> 2) & 0x0f;
 
 		preorder_ctrl = &psta->recvreorder_ctrl[tid];
 
@@ -1653,7 +1654,7 @@ void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 	pIE = pframe + sizeof(struct ieee80211_hdr_3addr);
 	pbuf = (__le32 *)pIE;
 
-	pmlmeext->TSFValue = le32_to_cpu(*(pbuf+1));
+	pmlmeext->TSFValue = le32_to_cpu(*(pbuf + 1));
 
 	pmlmeext->TSFValue = pmlmeext->TSFValue << 32;
 
@@ -1679,14 +1680,14 @@ void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 	pIE = pframe + sizeof(struct ieee80211_hdr_3addr);
 	pbuf = (__le32 *)pIE;
 
-	tsf = le32_to_cpu(*(pbuf+1));
+	tsf = le32_to_cpu(*(pbuf + 1));
 	tsf = tsf << 32;
 	tsf |= le32_to_cpu(*pbuf);
 
 	/* delay = (timestamp mod 1024*100)/1000 (unit: ms) */
 	/* delay_ms = do_div(tsf, (pmlmeinfo->bcn_interval*1024))/1000; */
-	delay_ms = do_div(tsf, (pmlmeinfo->bcn_interval*1024));
-	delay_ms = delay_ms/1000;
+	delay_ms = do_div(tsf, (pmlmeinfo->bcn_interval * 1024));
+	delay_ms = delay_ms / 1000;
 
 	if (delay_ms >= 8)
 		pmlmeext->bcn_delay_cnt[8]++;
-- 
2.45.3

