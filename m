Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0049D10FD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743165836; cv=none; b=Pw0VRefWQzZdk0yLIIgkoJqKohL5L7mdNGqjeOKHNMfUnM5+WQcuCYKcO3n2l7PqXrFPH/WOk2IHFsMNTuJAzfuxjUadxBNMQVhKBL8yBilS2JpKRWONx74elnD1LBIrEED75xFtcq+AgKg1x9O1ZZZJbFoktJ92m44hvyMt0gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743165836; c=relaxed/simple;
	bh=yo2nSbFbnDvEpXtDz4YyUqTGuHkXB4H/e61AZ1RpH8U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ogwjY0AWsNSFjvaKWKyrlZ5fh/mzxaJWqwnFNxpdIWF6/QnZW/Ntviso70jv3GDd4UQICjOFVzcQUuzYkU49hmPM8+ABGqGge1WoaCwp+dXf7slCdL1gF7h8Hr3Jf5HQ8JZNNlolo5QP0iJtULqfxszprlUJdQI1JfzLdF7NFzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOXbvDS2; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOXbvDS2"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf257158fso15102835e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 05:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743165832; x=1743770632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSWyRsAZEY2bsUvblBGw6qBcgqiSN9F8ibkKgLHo5j0=;
        b=KOXbvDS29Lsr1JfM74e4p4xDZByUZETMMT8JxaOMvlH5cj1EdF1Abx4oTpns9i/2gX
         pGCWFI+IHiPwSmuwsqdqDK5V/cnshdJLBBVZRtGU00ujM0NruaWNhhso7eSRR63WFmTm
         aXG47/iNgfsJxoXMFTaWqiVQ4tj5b6S4gSU7p0gVkZZZQPCSohvB086BB1QjYv322v7R
         N6yrUYS6gzgtIV0ewN5qKFy6WPHy2nw+jcKoQaAZt10VlSL9yV/CjJE+9lrGDes9t9GI
         3dZ+Ms5lzDf5sF7DygV3Rr8JDJOlDK1iOZqJklDA3UfeVxgFHSd0yxB6KYnOKsLFGh8G
         OK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743165832; x=1743770632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSWyRsAZEY2bsUvblBGw6qBcgqiSN9F8ibkKgLHo5j0=;
        b=TJQY+oi3vOAb94dQ8WXgkhU+07+1d35y6xbZ4emRGMHxW5Lj6XsPqHbQB4CnOdc2t1
         cTPE3iy2lNB6UFvSNz5SGmugtucBKUxVaaQ8k4NT4dFvG8OEAJ7ihxzzYaegCpapjHd4
         magTvF11qLfK2NGA/Sy+2ZfxyvfKhy3e9CUdo/188bxGCo60zGFFojfo79FjVgFbugZD
         vOrKnDyAhQtd5dX7AvPB4Ie/h1afz7OIduCIf6fa9Ezg4ebpbkUvY9ztSgy5RtnOWKrW
         J9ioV2UuHdNll/WGUtGvNWfTpG2e+Za+CXyrNH5Tliwy3L4x5VhzSD4OuTgpRwdYlKy7
         kV2g==
X-Forwarded-Encrypted: i=1; AJvYcCXw+1iAFvYurvvua+R1cF4SBG7Ij4hcVN1GMfH97VGJ0y39ylDFXLXk3ALUJA3zOd2W6bb0qDm8FTiZX/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMwDy1oM3G+SgvBXFWmDBPmWkgbSAHkonbFNTqqeIg+yn5gU0I
	PmRpNJ/PF3bjJgh4f6B4kgrUcrFWwaR3ucIyHDXHLLbZT6W9sWDW
X-Gm-Gg: ASbGncvX9qy8UjkVKAH51pYyyR29s+sVUvjAzEJTIsoMgH7ksMO9AMaITxvY9K/lKjU
	DLRcsBiRGddXvATrccx8vtffGx5t/hsnay10YJFgPbmRbHB8eb5lwGIPR/j7lkWvXVJTADynttE
	M9/LaTpa0C2r9zgvDNRVM3EfcEvZ3yRQyoX5vzFh1k2jXtiElXggpUnBqh3VCsJorlIHwD+yZrg
	etKAC9i1NM3w3JXgeesThTamkx3IoFIiA3mtwJpg3LcqjnkbXV4OcGCTmXyetVNsjr1cAj9L8ID
	rBZj3Xur+V+HsiedS15Pa3CHi5jSyhqT+mwrE6PNgm9o3Yl4Jv3QvRuzxVk=
X-Google-Smtp-Source: AGHT+IG8r0Ap2wZ6PEBAxi3nZZ5k+lwNmpPMvqvrKzmAindlw5EOAK85HmpsdnhtnSmAJH4ZsYFnjw==
X-Received: by 2002:a05:600c:45cf:b0:43c:fae1:5151 with SMTP id 5b1f17b1804b1-43d85099a26mr42682305e9.25.1743165831904;
        Fri, 28 Mar 2025 05:43:51 -0700 (PDT)
Received: from HP-650 ([105.112.193.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b658b47sm2571620f8f.13.2025.03.28.05.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 05:43:51 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	julia.lawall@inria.fr,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH 4/5] staging: rtl8723bs: correct placement of braces around if-else block
Date: Fri, 28 Mar 2025 13:39:41 +0100
Message-Id: <a7938a2ba84f1347518f80c68b41d1b03cf4acf5.1743163801.git.abrahamadekunle50@gmail.com>
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

The if-else blocks includes cases where braces were used for multiple
statement 'if' blocks and no braces for corresponding single statement
'else' blocks and vice versa.
It also includes case where for both single statement
'if' and 'else' blocks use braces defying Linux kernel coding style.

Modify if-else blocks where multiple statement 'if' blocks use braces
and corresponding single 'else' block use no braces and vice versa to all
use braces and removing braces for single statement if and else blocks
to conform to Linux kernel coding style.

Reported by checkpatch:

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  4 +--
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  9 +++--
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 13 +++----
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 11 +++---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  7 ++--
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 36 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  8 ++---
 7 files changed, 47 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 7820cb17eecc..ad949b0e2b97 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -273,9 +273,9 @@ struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue)
 
 	/* spin_lock_bh(&(queue->lock)); */
 	spin_lock_irqsave(&queue->lock, irqL);
-	if (list_empty(&queue->queue))
+	if (list_empty(&queue->queue)) {
 		obj = NULL;
-	else {
+	} else {
 		obj = container_of(get_next(&queue->queue), struct cmd_obj, list);
 		list_del_init(&obj->list);
 	}
diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index e0b1c1a1311b..643fc11021a2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -466,8 +466,9 @@ int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwis
 		pos += WPA_SELECTOR_LEN;
 		left -= WPA_SELECTOR_LEN;
 
-	} else if (left > 0)
+	} else if (left > 0) {
 		return _FAIL;
+	}
 
 	/* pairwise_cipher */
 	if (left >= 2) {
@@ -526,8 +527,9 @@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwi
 		pos += RSN_SELECTOR_LEN;
 		left -= RSN_SELECTOR_LEN;
 
-	} else if (left > 0)
+	} else if (left > 0) {
 		return _FAIL;
+	}
 
 	/* pairwise_cipher */
 	if (left >= 2) {
@@ -546,8 +548,9 @@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwi
 			left -= RSN_SELECTOR_LEN;
 		}
 
-	} else if (left == 1)
+	} else if (left == 1) {
 		return _FAIL;
+	}
 
 	if (is_8021x) {
 		if (left >= 6) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index a0cadb1d8a49..193999a6a00f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -739,9 +739,9 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 					} else {
 						pmlmepriv->to_join = true;
 					}
-				} else
+				} else {
 					rtw_indicate_disconnect(adapter);
-
+				}
 				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 			}
 		}
@@ -1523,15 +1523,16 @@ void rtw_mlme_reset_auto_scan_int(struct adapter *adapter)
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 
-	if (pmlmeinfo->VHT_enable) /* disable auto scan when connect to 11AC AP */
+	if (pmlmeinfo->VHT_enable) { /* disable auto scan when connect to 11AC AP */
 		mlme->auto_scan_int_ms = 0;
-	else if (adapter->registrypriv.wifi_spec && is_client_associated_to_ap(adapter) == true)
+	} else if (adapter->registrypriv.wifi_spec && is_client_associated_to_ap(adapter) == true) {
 		mlme->auto_scan_int_ms = 60 * 1000;
-	else if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
+	} else if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
 		if (check_fwstate(mlme, WIFI_STATION_STATE) && check_fwstate(mlme, _FW_LINKED))
 			mlme->auto_scan_int_ms = mlme->roam_scan_int_ms;
-	} else
+	} else {
 		mlme->auto_scan_int_ms = 0; /* disabled */
+	}
 }
 
 static void rtw_auto_scan_handler(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 667337793385..183c3046ca1f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2945,9 +2945,9 @@ void issue_assocreq(struct adapter *padapter)
 	if (bssrate_len > 8) {
 		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, bssrate, &(pattrib->pktlen));
 		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (bssrate_len - 8), (bssrate + 8), &(pattrib->pktlen));
-	} else
+	} else {
 		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, bssrate_len, bssrate, &(pattrib->pktlen));
-
+	}
 	/* vendor specific IE, such as WPA, WMM, WPS */
 	for (i = sizeof(struct ndis_802_11_fix_ie); i < pmlmeinfo->network.ie_length;) {
 		pIE = (struct ndis_80211_var_ie *)(pmlmeinfo->network.ies + i);
@@ -3974,9 +3974,9 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 
 		memcpy(bssid->ssid.ssid, (p + 2), *(p + 1));
 		bssid->ssid.ssid_length = *(p + 1);
-	} else
+	} else {
 		bssid->ssid.ssid_length = 0;
-
+	}
 	memset(bssid->supported_rates, 0, NDIS_802_11_LENGTH_RATES_EX);
 
 	/* checking rate info... */
@@ -4056,8 +4056,9 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 
 			if (le16_to_cpu(pHT_caps->u.HT_cap_element.HT_caps_info) & BIT(14))
 				pmlmepriv->num_FortyMHzIntolerant++;
-		} else
+		} else {
 			pmlmepriv->num_sta_no_ht++;
+		}
 	}
 
 	/*  mark bss info receiving from nearby channel as signal_quality 101 */
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 74a8fcf18e84..84109e338c86 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -462,8 +462,9 @@ void LPS_Enter(struct adapter *padapter, const char *msg)
 				pwrpriv->bpower_saving = true;
 				rtw_set_ps_mode(padapter, pwrpriv->power_mgnt, padapter->registrypriv.smart_ps, 0, buf);
 			}
-		} else
+		} else {
 			pwrpriv->LpsIdleCount++;
+		}
 	}
 }
 
@@ -1098,9 +1099,9 @@ int rtw_pm_set_lps(struct adapter *padapter, u8 mode)
 			pwrctrlpriv->bLeisurePs =
 				pwrctrlpriv->power_mgnt != PS_MODE_ACTIVE;
 		}
-	} else
+	} else {
 		ret = -EINVAL;
-
+	}
 	return ret;
 }
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index f1d17a1dc8fb..479596f17a8d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -109,9 +109,9 @@ union recv_frame *_rtw_alloc_recvframe(struct __queue *pfree_recv_queue)
 	struct adapter *padapter;
 	struct recv_priv *precvpriv;
 
-	if (list_empty(&pfree_recv_queue->queue))
+	if (list_empty(&pfree_recv_queue->queue)) {
 		precvframe = NULL;
-	else {
+	} else {
 		phead = get_list_head(pfree_recv_queue);
 
 		plist = get_next(phead);
@@ -275,9 +275,9 @@ struct recv_buf *rtw_dequeue_recvbuf(struct __queue *queue)
 
 	spin_lock_bh(&queue->lock);
 
-	if (list_empty(&queue->queue))
+	if (list_empty(&queue->queue)) {
 		precvbuf = NULL;
-	else {
+	} else {
 		phead = get_list_head(queue);
 
 		plist = get_next(phead);
@@ -432,9 +432,9 @@ static union recv_frame *decryptor(struct adapter *padapter, union recv_frame *p
 	if (res == _FAIL) {
 		rtw_free_recvframe(return_packet, &padapter->recvpriv.free_recv_queue);
 		return_packet = NULL;
-	} else
+	} else {
 		prxattrib->bdecrypted = true;
-
+	}
 	return return_packet;
 }
 
@@ -479,9 +479,9 @@ static union recv_frame *portctrl(struct adapter *adapter, union recv_frame *pre
 			memcpy(&be_tmp, ptr, 2);
 			ether_type = ntohs(be_tmp);
 
-			if (ether_type == eapol_type)
+			if (ether_type == eapol_type) {
 				prtnframe = precv_frame;
-			else {
+			} else {
 				/* free this frame */
 				rtw_free_recvframe(precv_frame, &adapter->recvpriv.free_recv_queue);
 				prtnframe = NULL;
@@ -500,9 +500,9 @@ static union recv_frame *portctrl(struct adapter *adapter, union recv_frame *pre
 			/* else { */
 			/*  */
 		}
-	} else
+	} else {
 		prtnframe = precv_frame;
-
+	}
 	return prtnframe;
 }
 
@@ -711,9 +711,9 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 		memcpy(pattrib->ta, pattrib->src, ETH_ALEN);
 
 		sta_addr = mybssid;
-	} else
+	} else {
 		ret  = _FAIL;
-
+	}
 
 
 	if (bmcast)
@@ -1121,11 +1121,12 @@ static union recv_frame *recvframe_chk_defrag(struct adapter *padapter, union re
 		if (type != WIFI_DATA_TYPE) {
 			psta = rtw_get_bcmc_stainfo(padapter);
 			pdefrag_q = &psta->sta_recvpriv.defrag_q;
-		} else
+		} else {
 			pdefrag_q = NULL;
-	} else
+		}
+	} else {
 		pdefrag_q = &psta->sta_recvpriv.defrag_q;
-
+	}
 	if ((ismfrag == 0) && (fragnum == 0))
 		prtnframe = precv_frame;/* isn't a fragment frame */
 
@@ -1281,11 +1282,10 @@ static signed int validate_recv_data_frame(struct adapter *adapter, union recv_f
 
 	}
 
-	if (ret == _FAIL) {
+	if (ret == _FAIL)
 		goto exit;
-	} else if (ret == RTW_RX_HANDLED) {
+	else if (ret == RTW_RX_HANDLED)
 		goto exit;
-	}
 
 
 	if (!psta) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 297c93d65315..026061b464f7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -2001,12 +2001,12 @@ inline bool xmitframe_hiq_filter(struct xmit_frame *xmitframe)
 		)
 			allow = true;
 
-	} else if (registry->hiq_filter == RTW_HIQ_FILTER_ALLOW_ALL)
+	} else if (registry->hiq_filter == RTW_HIQ_FILTER_ALLOW_ALL) {
 		allow = true;
-	else if (registry->hiq_filter == RTW_HIQ_FILTER_DENY_ALL) {
-	} else
+	} else if (registry->hiq_filter == RTW_HIQ_FILTER_DENY_ALL) {
+	} else {
 		rtw_warn_on(1);
-
+	}
 	return allow;
 }
 
-- 
2.34.1

