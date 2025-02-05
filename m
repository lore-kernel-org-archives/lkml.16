Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED9E1FECBC
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 18:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738780269; cv=none; b=XqkuupkZwTLt+6VEZ8OrjYNdhPAMGbQmSO2Od6szdB8Wtr96oIVa9cExUeuOPbF+zdTKCagEiOG2vzUR6iv+B/xNff93g2z8Zt1PJOQ61pn2muVwFNNjxiI9GPtrB9mqMMxQm0wY15mR4IUA3GyqYDqq2Xv5KJBjPqzR8KB9K8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738780269; c=relaxed/simple;
	bh=5Mr7EaGwFFMuZMmncoftmFxZWGQz2g9Yr/0IweXt/u8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YOV+ECNp47DYexGWIyR1iVLjDcaqU8zZwSymgWurKlaSKO7d5N4OeWLmhXKL5QRlcpPsBxzgX7BGD947hEhExUFmBeaaNrMdU5+uLrTKtU2U/p+2LcHRa3wEX5Gbt1ZARR7yo5Pj6Ff7OR9zmbEyH5iNzrp/IUJRveIFRT96fXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJoi0dPz; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJoi0dPz"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6dfbc45355bso1082926d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 10:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738780266; x=1739385066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FG2GhHncNF+F3cNwpVz06FJbKb2fAZu8m0DYgTpUQ/A=;
        b=JJoi0dPzkhBnYrXjp59g8jE2jnlwO0V9Gx7+Ab+afdjGGUPhoDyKJu8k4+vnEBUylF
         gVi2S3BjL0Yd0ovQN9HJWjApJSh3UfIrQUgoydq1LzT/cP4F6MCuBOeRSLdyWaY/B4ow
         jJY+waNSh6sOOnEhkWWJIc/Z6wHJRHVAFdW7C+TjtpBv193j32gHB2+TcVJFzFYFkEVE
         Ja1sUeFJWusQKx7vBZFevSgwX38sh7DNCXpwmRpW6ZP7ZqwPnsljQtEloUyS/LG3cl60
         lWEj2fpNuK1aJrfR5eH3x1bg11R8ydm2eTpzwNXzKTxBXwwkIbzbla1tPBZCN6TaJji+
         h8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738780266; x=1739385066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FG2GhHncNF+F3cNwpVz06FJbKb2fAZu8m0DYgTpUQ/A=;
        b=QW4ujgI14zudxhrY2bl/pPFqCQ1H8mYvlyrXG9cB0PyhCy0ZGWaKeV++XNMoK7mKmx
         jco0JGp9+foxCyLLiId6UWe1YM0mAS47GbL32HwRW2g+zJhFZOcBjm3Urdj5TOlswUv3
         FqJvxr+5u2xvFJG7xpU0pt89PbKOYJ7erh8MTdCUtSTgfRHPnfppN4Taj5vd0g8Y/eGg
         hq2mVHuGTIthhRRDIYXWMgZUTS8zNk0cQBMkDZvnxwYFZGOuiPSvDNrKI5JtkCwWor0G
         2YXJrSkpP02kcdNgbbQALhVBNiBFPAbSkCNedjAMLlZLY5TOKPp6G8ephY0gIAQ2eARE
         8Omg==
X-Forwarded-Encrypted: i=1; AJvYcCVDbPGX4J9SeZ8yw6MCY9xbo8Epnm7o1H4ngLUiyc+KACosLVCipKelfUIAdwGc11gsvwb7/FCfRZsdtwk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHYG3P0wXRInTW8a9PMxg5F0kG6vLJbPGfrVGzUslmdDTMg0q6
	8DExvZQAQqRCd4/kaTzA1YhipGUevF8exwWe6B8DgtG6MDXGIPRg
X-Gm-Gg: ASbGncvla+6G3s52ksjwIH2VkoWU2HroqfF07Du0L8pUC6wkKRiPbJdRM4b0TlVPZF7
	il6nvPZ18NsGSuc6L3/+1c2HNLTfcAkoLsN3OJVyA1lbX6zglcUuJh8uaXJoRuEXVKsEjxe3VwH
	Aug7EB8pGIHFWGRl/60Bpli3Sh0CL3u4lzsPzEAvqcwwLps+oGC+a7jY1Wpdkg6XurtdbU0F49/
	ixmn/FkjqUeJCF8DPoIn+QzVNNsXFne/5yM1oeUwVt65UPeoj+d8q3dNHA5niUSmGVxVMVktlSy
	/BrV3N+esckOKczGMhtbtw==
X-Google-Smtp-Source: AGHT+IHPc+tWVe4jX/sJI9XX+I3QYqSZQEu7pUB+60hh52JWmyMzHN42qOwETK5e/sruwGPGKX5ejA==
X-Received: by 2002:ad4:5ba3:0:b0:6e4:2e12:3a0c with SMTP id 6a1803df08f44-6e42fcb5b85mr47920266d6.39.1738780265773;
        Wed, 05 Feb 2025 10:31:05 -0800 (PST)
Received: from DESKTOP-GL3U3CJ ([149.88.18.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e4396bef38sm1124196d6.50.2025.02.05.10.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 10:31:05 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: break up lines
Date: Wed,  5 Feb 2025 10:30:54 -0800
Message-ID: <74a1724fbb06ee8341636bb3093333cd3d84a149.1738780135.git.onlyian4981@gmail.com>
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

Break up lines that are too long. Reported by checkpatch.

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 71 +++++++++++++++--------
 1 file changed, 47 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 20133289f4e7..73a3880f2a69 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -126,10 +126,12 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitbuf->buf_tag = XMITBUF_DATA;
 
 		/* Tx buf allocation may fail sometimes, so sleep and retry. */
-		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
+		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf,
+						 (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
 		if (res == _FAIL) {
 			msleep(10);
-			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
+			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf,
+							 (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
 			if (res == _FAIL)
 				goto exit;
 		}
@@ -208,7 +210,8 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitbuf->padapter = padapter;
 		pxmitbuf->buf_tag = XMITBUF_MGNT;
 
-		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, MAX_XMIT_EXTBUF_SZ + XMITBUF_ALIGN_SZ, true);
+		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf,
+						 MAX_XMIT_EXTBUF_SZ + XMITBUF_ALIGN_SZ, true);
 		if (res == _FAIL) {
 			res = _FAIL;
 			goto exit;
@@ -238,7 +241,8 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 			pxmitbuf->padapter = padapter;
 			pxmitbuf->buf_tag = XMITBUF_CMD;
 
-			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, MAX_CMDBUF_SZ+XMITBUF_ALIGN_SZ, true);
+			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf,
+							 MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ, true);
 			if (res == _FAIL) {
 				res = _FAIL;
 				goto exit;
@@ -289,7 +293,8 @@ void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 	}
 
 	for (i = 0; i < NR_XMITBUFF; i++) {
-		rtw_os_xmit_resource_free(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
+		rtw_os_xmit_resource_free(padapter, pxmitbuf,
+					  (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
 
 		pxmitbuf++;
 	}
@@ -311,7 +316,8 @@ void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 	/*  free xmit extension buff */
 	pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmit_extbuf;
 	for (i = 0; i < NR_XMIT_EXTBUFF; i++) {
-		rtw_os_xmit_resource_free(padapter, pxmitbuf, (MAX_XMIT_EXTBUF_SZ + XMITBUF_ALIGN_SZ), true);
+		rtw_os_xmit_resource_free(padapter, pxmitbuf,
+					  (MAX_XMIT_EXTBUF_SZ + XMITBUF_ALIGN_SZ), true);
 
 		pxmitbuf++;
 	}
@@ -321,7 +327,8 @@ void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 	for (i = 0; i < CMDBUF_MAX; i++) {
 		pxmitbuf = &pxmitpriv->pcmd_xmitbuf[i];
 		if (pxmitbuf)
-			rtw_os_xmit_resource_free(padapter, pxmitbuf, MAX_CMDBUF_SZ+XMITBUF_ALIGN_SZ, true);
+			rtw_os_xmit_resource_free(padapter, pxmitbuf,
+						  MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ, true);
 	}
 
 	rtw_free_hwxmits(padapter);
@@ -380,8 +387,9 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 	} else {
 		while (true) {
 			/* IOT action */
-			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && (pattrib->ampdu_en == true) &&
-				(padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
+			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) &&
+			    (pattrib->ampdu_en == true) &&
+			    (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
 				pattrib->vcs_mode = CTS_TO_SELF;
 				break;
 			}
@@ -431,7 +439,8 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 		pattrib->vcs_mode = padapter->driver_vcs_type;
 }
 
-static void update_attrib_phy_info(struct adapter *padapter, struct pkt_attrib *pattrib, struct sta_info *psta)
+static void update_attrib_phy_info(struct adapter *padapter, struct pkt_attrib *pattrib,
+				   struct sta_info *psta)
 {
 	struct mlme_ext_priv *mlmeext = &padapter->mlmeextpriv;
 
@@ -467,7 +476,8 @@ static void update_attrib_phy_info(struct adapter *padapter, struct pkt_attrib *
 	pattrib->retry_ctrl = false;
 }
 
-static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *pattrib, struct sta_info *psta)
+static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *pattrib,
+				  struct sta_info *psta)
 {
 	signed int res = _SUCCESS;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -481,7 +491,8 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 	if (psta->ieee8021x_blocked == true) {
 		pattrib->encrypt = 0;
 
-		if ((pattrib->ether_type != 0x888e) && (check_fwstate(pmlmepriv, WIFI_MP_STATE) == false)) {
+		if ((pattrib->ether_type != 0x888e) &&
+		    (check_fwstate(pmlmepriv, WIFI_MP_STATE) == false)) {
 			res = _FAIL;
 			goto exit;
 		}
@@ -506,7 +517,8 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		}
 
 		/* For WPS 1.0 WEP, driver should not encrypt EAPOL Packet for WPS handshake. */
-		if (((pattrib->encrypt == _WEP40_) || (pattrib->encrypt == _WEP104_)) && (pattrib->ether_type == 0x888e))
+		if (((pattrib->encrypt == _WEP40_) || (pattrib->encrypt == _WEP104_)) &&
+		    (pattrib->ether_type == 0x888e))
 			pattrib->encrypt = _NO_PRIVACY_;
 	}
 
@@ -700,7 +712,8 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		if (!psta)	{ /*  if we cannot get psta => drop the pkt */
 			res = _FAIL;
 			goto exit;
-		} else if ((check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) && (!(psta->state & _FW_LINKED))) {
+		} else if ((check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) &&
+			   (!(psta->state & _FW_LINKED))) {
 			res = _FAIL;
 			goto exit;
 		}
@@ -771,7 +784,8 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 	if (pattrib->encrypt == _TKIP_) {
 		/* encode mic code */
 		{
-			u8 null_key[16] = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
+			u8 null_key[16] = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
+					   0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
 
 			pframe = pxmitframe->buf_addr + hw_hdr_offset;
 
@@ -1017,7 +1031,8 @@ u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib)
  * 5. move frag chunk from pframe to pxmitframe->mem
  * 6. apply sw-encrypt, if necessary.
  */
-s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
+s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt,
+			   struct xmit_frame *pxmitframe)
 {
 	struct pkt_file pktfile;
 
@@ -1136,7 +1151,8 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 }
 
 /* broadcast or multicast management pkt use BIP, unicast management pkt use CCMP encryption */
-s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
+s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt,
+				struct xmit_frame *pxmitframe)
 {
 	u8 *pframe, *mem_start = NULL, *tmp_buf = NULL;
 	u8 subtype;
@@ -1180,7 +1196,8 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 		memset(MME, 0, 18);
 
 		/* other types doesn't need the BIP */
-		if (GetFrameSubType(pframe) != WIFI_DEAUTH && GetFrameSubType(pframe) != WIFI_DISASSOC)
+		if (GetFrameSubType(pframe) != WIFI_DEAUTH &&
+		    GetFrameSubType(pframe) != WIFI_DISASSOC)
 			goto xmitframe_coalesce_fail;
 
 		MGMT_body = pframe + sizeof(struct ieee80211_hdr_3addr);
@@ -1241,7 +1258,8 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 				goto xmitframe_coalesce_fail;
 			/* before encrypt dump the management packet content */
 			if (pattrib->encrypt > 0)
-				memcpy(pattrib->dot118021x_UncstKey.skey, psta->dot118021x_UncstKey.skey, 16);
+				memcpy(pattrib->dot118021x_UncstKey.skey,
+				       psta->dot118021x_UncstKey.skey, 16);
 			/* bakeup original management packet */
 			memcpy(tmp_buf, pframe, pattrib->pktlen);
 			/* move to data portion */
@@ -1264,7 +1282,8 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 			memcpy(pframe, pattrib->iv, pattrib->iv_len);
 			pframe += pattrib->iv_len;
 			/* copy mgmt data portion after CCMP header */
-			memcpy(pframe, tmp_buf+pattrib->hdrlen, pattrib->pktlen-pattrib->hdrlen);
+			memcpy(pframe, tmp_buf + pattrib->hdrlen,
+			       pattrib->pktlen - pattrib->hdrlen);
 			/* move pframe to end of mgmt pkt */
 			pframe += pattrib->pktlen - pattrib->hdrlen;
 			/* add 8 bytes CCMP IV header to length */
@@ -1751,7 +1770,8 @@ s32 rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitfram
 	return _SUCCESS;
 }
 
-struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *psta, signed int up, u8 *ac)
+struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *psta,
+				     signed int up, u8 *ac)
 {
 	struct tx_servq *ptxservq = NULL;
 
@@ -2106,7 +2126,8 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter,
 			if (wmmps_ac)
 				psta->sleepq_ac_len++;
 
-			if (((psta->has_legacy_ac) && (!wmmps_ac)) || ((!psta->has_legacy_ac) && (wmmps_ac))) {
+			if (((psta->has_legacy_ac) && (!wmmps_ac)) ||
+			    ((!psta->has_legacy_ac) && (wmmps_ac))) {
 				if (!(pstapriv->tim_bitmap & BIT(psta->aid)))
 					update_tim = true;
 
@@ -2126,7 +2147,8 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter,
 	return ret;
 }
 
-static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struct sta_info *psta, struct __queue *pframequeue)
+static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struct sta_info *psta,
+						 struct __queue *pframequeue)
 {
 	signed int ret;
 	struct list_head *plist, *phead, *tmp;
@@ -2147,7 +2169,8 @@ static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struc
 		ret = xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe);
 
 		if (true == ret) {
-			ptxservq = rtw_get_sta_pending(padapter, psta, pattrib->priority, (u8 *)(&ac_index));
+			ptxservq = rtw_get_sta_pending(padapter, psta, pattrib->priority,
+						       (u8 *)(&ac_index));
 
 			ptxservq->qcnt--;
 			phwxmits[ac_index].accnt--;
-- 
2.45.3

