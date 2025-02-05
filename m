Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689301FE453
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 18:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738780267; cv=none; b=a5b+L2JnDV6z4gwm3DWlrhH83cTBxy/JN4nRmH7UPVPp6OZXjLU6hp0uKIvw9dYL89Ugcv/gIS/dOmdBFMPJqO1WyMvsQBBdqNYgqQfMYecl6Z4BTuAYU0JwE99KYov5cT+UioOR3INki3E7E8qH58xk8qGT6FnkPqRGSFpDwIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738780267; c=relaxed/simple;
	bh=QJSYeo6rV+Ccf0PFn8DkEA97WLib5KbAwVZRvpD2HcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dLkRq+t2pAe5xtm+/tSiPUfdy0An2fF065ytN0NuEPz5pPmshc+wMOipryTgEIgaTklysX6tznnB6K3D+sNgPBVmxvIUJQsj7sBCf7NAl51qke/8vwrjAyuu8s19xpnPDSYh/26lcXCRMoA0sre+BqwNYLOsCT5roMZA9zbQax4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6RipvTu; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6RipvTu"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7bcf32a6582so2124485a.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 10:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738780264; x=1739385064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7RjXzLN1PQdwv2QT+N1LyWarSnbcTgUOsDuiAkX/8A=;
        b=V6RipvTuGXQXPNjfw0fSBRRu0/TLMWH+dQTBQ6sEkENX35ljtQdJZszKPamw3gLiIB
         v7lUt5pnGYA1Jm/i8oBrxsAuGYZDhYAB1R+ZzXo8rVtSpAkJbKoX2Jxl5pxHFmHHRPTT
         4hjQPSvymwDjxvHMgUd2DrN71U6apCPfUAxJnpYc/CRtvrwPC4j9fa55hKzuFHkl0dlq
         iP2bGxjCdW4YTQ3t5O8m4enZIaVgBFPRgGxKgKWZGmUTvkvIOzjFWFxvE8xdme72BY/q
         ZU/iYueQWf1EKyfPzeS6ZycenioqyQWYKLpWIIv9i03HTsDGxoSlSiBJ4ENPXAG/28SO
         GCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738780264; x=1739385064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J7RjXzLN1PQdwv2QT+N1LyWarSnbcTgUOsDuiAkX/8A=;
        b=Ls+5uIgUGbTbQvhMnrUs2AYRdzhCgz1HAwNNIyeF81tR3fvAxeDmLa7IxIKhKq2H33
         QulPz8aatyHnTXep/f9vLLAsXG8ij/RZ2frxyO9LL/U4Een5VqHdJUBCMD/t/Dm0hArr
         yhCVHwk74+fZqGIj/DC8Uct5aAx3b54XA6vDwym4/r1jokshKi8Es4oMPAiN4UnMl+Li
         ZwidfZm+/r7jt0JPAj8T4uveN6fepIDRE6F6bWfD5mIbCur783HXQ793iMQqa5++ZyZ8
         WzPIt+DGqzDHKoK+I/2OMf9dGaSUYiYQfVswGdheHp4HHKM3FfjHZA7A4GDrnGDd6+fM
         IGCA==
X-Forwarded-Encrypted: i=1; AJvYcCVbalv1yrtuq1wn9Mfy69DXl3kFX40gbtk2gihpOvltyv55sxlqLYHZd4I+XoL6lAqE8npS28NcYdZ/bIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFgNq+dePZF+FOm55rRmsyiJ5tbR+IOp6oRbBXaDg4DWq2Zjyu
	FZjO8yZ4EdGbSlvlZuiVZF8ZWt4EiJCZRRJaZajevA4GOglXRMQS
X-Gm-Gg: ASbGncufA/zOkmrIn1NwiXRGW5fcDS60v9uksq8rWCFbpk+b22mVgk3NfGFIoSxAjFq
	sVlZBzohtq+rqwFAgFiJ1l+EgHs/3COxihbih5gql8kTNvSWviEO2+ujQB6NyFb0tqYsuHAfmuq
	RV8OLfs5CWuLh6Vv3hmrg6uZ8HPIg26Sx0n9vOkBFP9hxjiiEjiS8q2jTNfE0sL6o/dstemHUYQ
	sBiChCrDlzuss0NKO2zXRXzbq0iWdfu4tTSue4QDy3Sd6+yEjWsENm08qfcQynAzrlGurmfIO84
	x+1S2dxZVsx1zQi4rk/Qkw==
X-Google-Smtp-Source: AGHT+IFMr5pz3q7/y9NDlcPMlFtQn5/9/iZLA/HC81EqhEkzwd40+b54U3FT6AZvUOFgApDwFpGSHA==
X-Received: by 2002:a05:620a:801b:b0:7b1:48ff:6b62 with SMTP id af79cd13be357-7c039fcf0b2mr519268985a.16.1738780264078;
        Wed, 05 Feb 2025 10:31:04 -0800 (PST)
Received: from DESKTOP-GL3U3CJ ([149.88.18.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8c8eaasm777449185a.36.2025.02.05.10.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 10:31:03 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: fix spacing complaints
Date: Wed,  5 Feb 2025 10:30:53 -0800
Message-ID: <5c1964df6ca3ce60524e90201367a93af60a5091.1738780135.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <cover.1738780135.git.onlyian4981@gmail.com>
References: <cover.1738780135.git.onlyian4981@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix complaints related to spacing reported by checkpatch.

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 111 +++++++++++-----------
 1 file changed, 56 insertions(+), 55 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 297c93d65315..20133289f4e7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -78,7 +78,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	}
 	pxmitpriv->pxmit_frame_buf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->pallocated_frame_buf), 4);
 
-	pxframe = (struct xmit_frame *) pxmitpriv->pxmit_frame_buf;
+	pxframe = (struct xmit_frame *)pxmitpriv->pxmit_frame_buf;
 
 	for (i = 0; i < NR_XMITFRAME; i++) {
 		INIT_LIST_HEAD(&pxframe->list);
@@ -248,7 +248,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 			pxmitbuf->pend = pxmitbuf->pbuf + MAX_CMDBUF_SZ;
 			pxmitbuf->len = 0;
 			pxmitbuf->pdata = pxmitbuf->ptail = pxmitbuf->phead;
-			pxmitbuf->alloc_sz = MAX_CMDBUF_SZ+XMITBUF_ALIGN_SZ;
+			pxmitbuf->alloc_sz = MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ;
 		}
 	}
 
@@ -274,7 +274,7 @@ void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 {
 	int i;
 	struct adapter *padapter = pxmitpriv->adapter;
-	struct xmit_frame	*pxmitframe = (struct xmit_frame *) pxmitpriv->pxmit_frame_buf;
+	struct xmit_frame	*pxmitframe = (struct xmit_frame *)pxmitpriv->pxmit_frame_buf;
 	struct xmit_buf *pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmitbuf;
 
 	rtw_hal_free_xmit_priv(padapter);
@@ -401,7 +401,7 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 				u8 HTOpMode = pmlmeinfo->HT_protection;
 
 				if ((pmlmeext->cur_bwmode && (HTOpMode == 2 || HTOpMode == 3)) ||
-					(!pmlmeext->cur_bwmode && HTOpMode == 3)) {
+				    (!pmlmeext->cur_bwmode && HTOpMode == 3)) {
 					pattrib->vcs_mode = RTS_CTS;
 					break;
 				}
@@ -558,7 +558,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		memcpy(pattrib->dot118021x_UncstKey.skey, psta->dot118021x_UncstKey.skey, 16);
 
 	if (pattrib->encrypt &&
-		((padapter->securitypriv.sw_encrypt) || (!psecuritypriv->hw_decrypted)))
+	    ((padapter->securitypriv.sw_encrypt) || (!psecuritypriv->hw_decrypted)))
 		pattrib->bswenc = true;
 	else
 		pattrib->bswenc = false;
@@ -636,7 +636,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	memcpy(pattrib->src, &etherhdr.h_source, ETH_ALEN);
 
 	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
+	    (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
 		memcpy(pattrib->ra, pattrib->dst, ETH_ALEN);
 		memcpy(pattrib->ta, pattrib->src, ETH_ALEN);
 	} else if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
@@ -661,7 +661,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		if (pktfile.pkt_len > 282) {/* MINIMUM_DHCP_PACKET_SIZE) { */
 			if (pattrib->ether_type == ETH_P_IP) {/*  IP header */
 				if (((tmp[21] == 68) && (tmp[23] == 67)) ||
-					((tmp[21] == 67) && (tmp[23] == 68))) {
+				    ((tmp[21] == 67) && (tmp[23] == 68))) {
 					/*  68 : UDP BOOTP client */
 					/*  67 : UDP BOOTP server */
 					pattrib->dhcp_pkt = 1;
@@ -736,7 +736,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	pattrib->subtype = WIFI_DATA_TYPE;
 	pattrib->priority = 0;
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE|WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE)) {
+	if (check_fwstate(pmlmepriv, WIFI_AP_STATE | WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE)) {
 		if (pattrib->qos_en)
 			set_qos(&pktfile, pattrib);
 	} else {
@@ -787,15 +787,15 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 				rtw_secmicsetkey(&micdata, &pattrib->dot11tkiptxmickey.skey[0]);
 			}
 
-			if (pframe[1]&1) {   /* ToDS == 1 */
+			if (pframe[1] & 1) {   /* ToDS == 1 */
 				rtw_secmicappend(&micdata, &pframe[16], 6);  /* DA */
-				if (pframe[1]&2)  /* From Ds == 1 */
+				if (pframe[1] & 2)  /* From Ds == 1 */
 					rtw_secmicappend(&micdata, &pframe[24], 6);
 				else
 					rtw_secmicappend(&micdata, &pframe[10], 6);
 			} else {	/* ToDS == 0 */
 				rtw_secmicappend(&micdata, &pframe[4], 6);   /* DA */
-				if (pframe[1]&2)  /* From Ds == 1 */
+				if (pframe[1] & 2)  /* From Ds == 1 */
 					rtw_secmicappend(&micdata, &pframe[16], 6);
 				else
 					rtw_secmicappend(&micdata, &pframe[10], 6);
@@ -810,16 +810,16 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 
 			for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
 				payload = (u8 *)round_up((SIZE_PTR)(payload), 4);
-				payload = payload+pattrib->hdrlen+pattrib->iv_len;
+				payload = payload + pattrib->hdrlen + pattrib->iv_len;
 
-				if ((curfragnum+1) == pattrib->nr_frags) {
-					length = pattrib->last_txcmdsz-pattrib->hdrlen-pattrib->iv_len-((pattrib->bswenc) ? pattrib->icv_len : 0);
+				if ((curfragnum + 1) == pattrib->nr_frags) {
+					length = pattrib->last_txcmdsz - pattrib->hdrlen - pattrib->iv_len - ((pattrib->bswenc) ? pattrib->icv_len : 0);
 					rtw_secmicappend(&micdata, payload, length);
-					payload = payload+length;
+					payload = payload + length;
 				} else {
-					length = pxmitpriv->frag_len-pattrib->hdrlen-pattrib->iv_len-((pattrib->bswenc) ? pattrib->icv_len : 0);
+					length = pxmitpriv->frag_len - pattrib->hdrlen - pattrib->iv_len - ((pattrib->bswenc) ? pattrib->icv_len : 0);
 					rtw_secmicappend(&micdata, payload, length);
-					payload = payload+length+pattrib->icv_len;
+					payload = payload + length + pattrib->icv_len;
 				}
 			}
 			rtw_secgetmic(&micdata, &mic[0]);
@@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 					if (SN_LESS(pattrib->seqnum, tx_seq)) {
 						pattrib->ampdu_en = false;/* AGG BK */
 					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq + 1) & 0xfff;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum + 1) & 0xfff;
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
 				}
@@ -985,9 +985,9 @@ s32 rtw_txframes_pending(struct adapter *padapter)
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 
 	return ((!list_empty(&pxmitpriv->be_pending.queue)) ||
-			 (!list_empty(&pxmitpriv->bk_pending.queue)) ||
-			 (!list_empty(&pxmitpriv->vi_pending.queue)) ||
-			 (!list_empty(&pxmitpriv->vo_pending.queue)));
+		(!list_empty(&pxmitpriv->bk_pending.queue)) ||
+		(!list_empty(&pxmitpriv->vi_pending.queue)) ||
+		(!list_empty(&pxmitpriv->vo_pending.queue)));
 }
 
 /*
@@ -1105,7 +1105,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 		if (bmcst || (rtw_endofpktfile(&pktfile) == true)) {
 			pattrib->nr_frags = frg_inx;
 
-			pattrib->last_txcmdsz = pattrib->hdrlen + pattrib->iv_len + ((pattrib->nr_frags == 1) ? llc_sz:0) +
+			pattrib->last_txcmdsz = pattrib->hdrlen + pattrib->iv_len + ((pattrib->nr_frags == 1) ? llc_sz : 0) +
 					((pattrib->bswenc) ? pattrib->icv_len : 0) + mem_sz;
 
 			ClearMFrag(mem_start);
@@ -1155,7 +1155,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 	mem_start = pframe = (u8 *)(pxmitframe->buf_addr) + TXDESC_OFFSET;
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
 
-	ori_len = BIP_AAD_SIZE+pattrib->pktlen;
+	ori_len = BIP_AAD_SIZE + pattrib->pktlen;
 	tmp_buf = BIP_AAD = rtw_zmalloc(ori_len);
 	subtype = GetFrameSubType(pframe); /* bit(7)~bit(2) */
 
@@ -1206,20 +1206,20 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 		ClearPwrMgt(BIP_AAD);
 		ClearMData(BIP_AAD);
 		/* conscruct AAD, copy address 1 to address 3 */
-		memcpy(BIP_AAD+2, pwlanhdr->addr1, 18);
+		memcpy(BIP_AAD + 2, pwlanhdr->addr1, 18);
 		/* copy management fram body */
-		memcpy(BIP_AAD+BIP_AAD_SIZE, MGMT_body, frame_body_len);
+		memcpy(BIP_AAD + BIP_AAD_SIZE, MGMT_body, frame_body_len);
 		/* calculate mic */
 		if (omac1_aes_128(padapter->securitypriv.dot11wBIPKey[padapter->securitypriv.dot11wBIPKeyid].skey
-			, BIP_AAD, BIP_AAD_SIZE+frame_body_len, mic))
+			, BIP_AAD, BIP_AAD_SIZE + frame_body_len, mic))
 			goto xmitframe_coalesce_fail;
 
 		/* copy right BIP mic value, total is 128bits, we use the 0~63 bits */
-		memcpy(pframe-8, mic, 8);
+		memcpy(pframe - 8, mic, 8);
 	} else { /* unicast mgmt frame TX */
 		/* start to encrypt mgmt frame */
 		if (subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC ||
-			subtype == WIFI_REASSOCREQ || subtype == WIFI_ACTION) {
+		    subtype == WIFI_REASSOCREQ || subtype == WIFI_ACTION) {
 			if (pattrib->psta)
 				psta = pattrib->psta;
 			else
@@ -1233,11 +1233,11 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 
 			/* according 802.11-2012 standard, these five types are not robust types */
 			if (subtype == WIFI_ACTION &&
-			(pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_PUBLIC ||
-			pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_HT ||
-			pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_UNPROTECTED_WNM ||
-			pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_SELF_PROTECTED  ||
-			pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_P2P))
+			    (pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_PUBLIC ||
+			     pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_HT ||
+			     pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_UNPROTECTED_WNM ||
+			     pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_SELF_PROTECTED  ||
+			     pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_P2P))
 				goto xmitframe_coalesce_fail;
 			/* before encrypt dump the management packet content */
 			if (pattrib->encrypt > 0)
@@ -1266,7 +1266,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 			/* copy mgmt data portion after CCMP header */
 			memcpy(pframe, tmp_buf+pattrib->hdrlen, pattrib->pktlen-pattrib->hdrlen);
 			/* move pframe to end of mgmt pkt */
-			pframe += pattrib->pktlen-pattrib->hdrlen;
+			pframe += pattrib->pktlen - pattrib->hdrlen;
 			/* add 8 bytes CCMP IV header to length */
 			pattrib->pktlen += pattrib->iv_len;
 			if ((pattrib->icv_len > 0) && (pattrib->bswenc)) {
@@ -1372,7 +1372,7 @@ void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe,
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	u8 pkt_num = 1;
 
-	if ((pxmitframe->frame_tag&0x0f) == DATA_FRAMETAG) {
+	if ((pxmitframe->frame_tag & 0x0f) == DATA_FRAMETAG) {
 		pkt_num = pxmitframe->agg_num;
 
 		pmlmepriv->LinkDetectInfo.NumTxOkInPeriod += pkt_num;
@@ -1393,7 +1393,7 @@ void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe,
 }
 
 static struct xmit_buf *__rtw_alloc_cmd_xmitbuf(struct xmit_priv *pxmitpriv,
-		enum cmdbuf_type buf_type)
+						enum cmdbuf_type buf_type)
 {
 	struct xmit_buf *pxmitbuf =  NULL;
 
@@ -1414,7 +1414,7 @@ static struct xmit_buf *__rtw_alloc_cmd_xmitbuf(struct xmit_priv *pxmitpriv,
 }
 
 struct xmit_frame *__rtw_alloc_cmdxmitframe(struct xmit_priv *pxmitpriv,
-		enum cmdbuf_type buf_type)
+					    enum cmdbuf_type buf_type)
 {
 	struct xmit_frame		*pcmdframe;
 	struct xmit_buf		*pxmitbuf;
@@ -2010,7 +2010,8 @@ inline bool xmitframe_hiq_filter(struct xmit_frame *xmitframe)
 	return allow;
 }
 
-signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct xmit_frame *pxmitframe)
+signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter,
+					      struct xmit_frame *pxmitframe)
 {
 	signed int ret = false;
 	struct sta_info *psta = NULL;
@@ -2072,7 +2073,7 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 
 	spin_lock_bh(&psta->sleep_q.lock);
 
-	if (psta->state&WIFI_SLEEP_STATE) {
+	if (psta->state & WIFI_SLEEP_STATE) {
 		u8 wmmps_ac = 0;
 
 		if (pstapriv->sta_dz_bitmap & BIT(psta->aid)) {
@@ -2085,20 +2086,20 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 			switch (pattrib->priority) {
 			case 1:
 			case 2:
-				wmmps_ac = psta->uapsd_bk&BIT(0);
+				wmmps_ac = psta->uapsd_bk & BIT(0);
 				break;
 			case 4:
 			case 5:
-				wmmps_ac = psta->uapsd_vi&BIT(0);
+				wmmps_ac = psta->uapsd_vi & BIT(0);
 				break;
 			case 6:
 			case 7:
-				wmmps_ac = psta->uapsd_vo&BIT(0);
+				wmmps_ac = psta->uapsd_vo & BIT(0);
 				break;
 			case 0:
 			case 3:
 			default:
-				wmmps_ac = psta->uapsd_be&BIT(0);
+				wmmps_ac = psta->uapsd_be & BIT(0);
 				break;
 			}
 
@@ -2216,20 +2217,20 @@ void wakeup_sta_to_xmit(struct adapter *padapter, struct sta_info *psta)
 		switch (pxmitframe->attrib.priority) {
 		case 1:
 		case 2:
-			wmmps_ac = psta->uapsd_bk&BIT(1);
+			wmmps_ac = psta->uapsd_bk & BIT(1);
 			break;
 		case 4:
 		case 5:
-			wmmps_ac = psta->uapsd_vi&BIT(1);
+			wmmps_ac = psta->uapsd_vi & BIT(1);
 			break;
 		case 6:
 		case 7:
-			wmmps_ac = psta->uapsd_vo&BIT(1);
+			wmmps_ac = psta->uapsd_vo & BIT(1);
 			break;
 		case 0:
 		case 3:
 		default:
-			wmmps_ac = psta->uapsd_be&BIT(1);
+			wmmps_ac = psta->uapsd_be & BIT(1);
 			break;
 		}
 
@@ -2261,7 +2262,7 @@ void wakeup_sta_to_xmit(struct adapter *padapter, struct sta_info *psta)
 
 		pstapriv->tim_bitmap &= ~BIT(psta->aid);
 
-		if (psta->state&WIFI_SLEEP_STATE)
+		if (psta->state & WIFI_SLEEP_STATE)
 			psta->state ^= WIFI_SLEEP_STATE;
 
 		if (psta->state & WIFI_STA_ALIVE_CHK_STATE) {
@@ -2276,7 +2277,7 @@ void wakeup_sta_to_xmit(struct adapter *padapter, struct sta_info *psta)
 	if (!psta_bmc)
 		goto _exit;
 
-	if ((pstapriv->sta_dz_bitmap&0xfffe) == 0x0) { /* no any sta in ps mode */
+	if ((pstapriv->sta_dz_bitmap & 0xfffe) == 0x0) { /* no any sta in ps mode */
 		xmitframe_phead = get_list_head(&psta_bmc->sleep_q);
 		list_for_each_safe(xmitframe_plist, tmp, xmitframe_phead) {
 			pxmitframe = list_entry(xmitframe_plist,
@@ -2329,20 +2330,20 @@ void xmit_delivery_enabled_frames(struct adapter *padapter, struct sta_info *pst
 		switch (pxmitframe->attrib.priority) {
 		case 1:
 		case 2:
-			wmmps_ac = psta->uapsd_bk&BIT(1);
+			wmmps_ac = psta->uapsd_bk & BIT(1);
 			break;
 		case 4:
 		case 5:
-			wmmps_ac = psta->uapsd_vi&BIT(1);
+			wmmps_ac = psta->uapsd_vi & BIT(1);
 			break;
 		case 6:
 		case 7:
-			wmmps_ac = psta->uapsd_vo&BIT(1);
+			wmmps_ac = psta->uapsd_vo & BIT(1);
 			break;
 		case 0:
 		case 3:
 		default:
-			wmmps_ac = psta->uapsd_be&BIT(1);
+			wmmps_ac = psta->uapsd_be & BIT(1);
 			break;
 		}
 
@@ -2452,7 +2453,7 @@ struct xmit_buf *dequeue_pending_xmitbuf_under_survey(struct xmit_priv *pxmitpri
 			type = GetFrameSubType(pxmitbuf->pbuf + TXDESC_OFFSET);
 
 			if ((type == WIFI_PROBEREQ) ||
-				(type == WIFI_DATA_NULL) ||
+			    (type == WIFI_DATA_NULL) ||
 				(type == WIFI_QOS_DATA_NULL)) {
 				list_del_init(&pxmitbuf->list);
 				break;
-- 
2.45.3

