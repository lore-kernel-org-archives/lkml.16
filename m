Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C2C20C47E
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 01:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738720228; cv=none; b=r9GqoSVIeGYcRxUqi451YhZUQGF6ad0nJdR3PJf4746OXtxNEf0PVg+g72b/OumWQ1hL4fux79ZEHWDqNojr6HBR9WRCsG1Yt0aFhFHheacU17DZ7a7GI1+Optqh1Fm5tiErsaILc4z64JCpaQxxsZJv0pb8ZMPt6VkBlL7eR/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738720228; c=relaxed/simple;
	bh=PhOVZkmQLI0Ov2+c/lHD/93cAFnmjEn08IE35A/YCHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R0ZZxvsWgs4menmseiHu7j7GsB2jROymSulnZN5hrcgAD5b935JOyfxh6cIb+PvrJRPB933MI9CL2Me+F/NLtcW1vGvJhtBIfpBtLWi3qXOt4/Uemq+ZQCpKgWwKaVfRfMyx4yz/zkK6YtkME+smQZVkhqaBATOZm70PYpQQvR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSwegiqV; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSwegiqV"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-216426b0865so109369455ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 17:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738720225; x=1739325025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDo3xHkuJJR7VmViW90AygRyML17ekq7U9suXa747ZY=;
        b=BSwegiqVUq1+kglBG36SM05IcOnZuYoLr6hPzbiKeL+WlGSb8l0kYrw42/TsUmTZnm
         2F1obwPKhLhKwYiwRZCizh4PKUENIupSpR6c/3+6Oc/zWqzBflS831Z2cNhicpuN+O5x
         nI9u2Wead5JzYVSpkxIBbEwIrLWqK/R+RR2154daxCjmRAJ/nUNNRvShsOa7FJBP7HGI
         +ghtL1nPI4HTzzTeF4mAYx+speZKk1ee45HS/9c07v6DRx8tdH8D/i/9ib5jlpXn0wrG
         PN5AL1/zOMY3FliG+Fx+lmBVd79Ipb4k0QPFYcyfSJCj1dxzJ7WzhtXLiE+l90UCb2uI
         zhNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738720225; x=1739325025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDo3xHkuJJR7VmViW90AygRyML17ekq7U9suXa747ZY=;
        b=ZLsooN7pAwbNBBDG/bXzPGQ4CSoNryF7F8ypW4dHNcgz7uxTo+LnGlDXNSZZnvb1kK
         6XXAsDL6u1zJS2BkDYbSsX+MvJuAJJj5N2Vx/cMvtgmRH+bdSrORXZbcOxw8cDiY5mnQ
         6bsKRAD22/I9IlUaVed2snAHSJy/04Gdw/a6no3BkgmfDsG90gYGijwE2HlaRvJLq/nT
         MJ5/2NWp8brfLvrkBiB6JM2Bb2fvIKwrxUWsEaFIj3IVWWjzqSZlT6PVHnMR3kD7Zxzr
         qpvIVYa/QBD3RO6LrwvYta0dm5ue1PQJ31VbjCIfAERnYudicoN7b6nhHdbzEolWU495
         2Izg==
X-Forwarded-Encrypted: i=1; AJvYcCUfjqfJKU/XXwqYbbdwHDs446qGgf+ud6MaOO9/OJLWVtQBXEXiGiV4YgqMfhhtE5/IFBMIvV/KtAqEfac=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRjJv5xvquguru4FP032j10A5rJC5HxUZsNThdnZGGDdcC5rF3
	jz6Ha8L29nOIk7KQ6b1Px28AiY+G+Fm1N3I0I14XQ7jUHq1rCQu2DV01i2LPn5g=
X-Gm-Gg: ASbGncs007kydrwT/r/Y9n18dNIJSRcRFAxVmFIKZHnYuSuudxns9s0oVEE8/wVFJw5
	oKk8V/X0z/GPqXYVR+qv7YBhj7fAt9efnAZEYxPFVBpRyXlh7vx/TnWbyeEUh3MLNnqWfzTMUUX
	nysMuidwdgclzedDUdA55PchbgbGNFTDd46d+D+KlbVsbZObuozlYICZNPl29PlsY+4wZ3WOoIO
	U+s6Df1db6uNpo/JAvIY3h/QwE/GSHmtRmmHOBQqKwPi5Xz7RNoZ4AnUAfeBNnVdxe3S2RXYrHS
	QEZR46NUQnnarQKMmXYHFQ4=
X-Google-Smtp-Source: AGHT+IE44zyc9SI0gwK+1LjnZGp+epmaEKMy8McyTJJqCr+om2RWBcFQnnZHaJN1/AQjMPxLggzF1A==
X-Received: by 2002:a17:903:2d2:b0:21f:55e:ed71 with SMTP id d9443c01a7336-21f17dde150mr20781685ad.5.1738720224853;
        Tue, 04 Feb 2025 17:50:24 -0800 (PST)
Received: from DESKTOP-GL3U3CJ ([146.70.174.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f19361d47sm2317545ad.209.2025.02.04.17.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:50:24 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 1/4] staging: rtl8723bs: remove unnecessary parentheses
Date: Tue,  4 Feb 2025 17:50:16 -0800
Message-ID: <d0b70310eb6b2dfdf062ba865362cd2640cb93e0.1738720049.git.onlyian4981@gmail.com>
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

Removed unnecessary parentheses present in file.

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 159 +++++++++++-----------
 1 file changed, 80 insertions(+), 79 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 5ded183aa08c..5fbae82ddc72 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -119,7 +119,7 @@ struct	wlan_network *rtw_alloc_network(struct	mlme_priv *pmlmepriv)
 		pnetwork = NULL;
 		goto exit;
 	}
-	plist = get_next(&(free_queue->queue));
+	plist = get_next(&free_queue->queue);
 
 	pnetwork = container_of(plist, struct wlan_network, list);
 
@@ -141,7 +141,7 @@ void _rtw_free_network(struct	mlme_priv *pmlmepriv, struct wlan_network *pnetwor
 {
 	unsigned int delta_time;
 	u32 lifetime = SCANQUEUE_LIFETIME;
-	struct __queue *free_queue = &(pmlmepriv->free_bss_pool);
+	struct __queue *free_queue = &pmlmepriv->free_bss_pool;
 
 	if (!pnetwork)
 		return;
@@ -161,17 +161,16 @@ void _rtw_free_network(struct	mlme_priv *pmlmepriv, struct wlan_network *pnetwor
 
 	spin_lock_bh(&free_queue->lock);
 
-	list_del_init(&(pnetwork->list));
+	list_del_init(&pnetwork->list);
 
-	list_add_tail(&(pnetwork->list), &(free_queue->queue));
+	list_add_tail(&pnetwork->list, &free_queue->queue);
 
 	spin_unlock_bh(&free_queue->lock);
 }
 
 void _rtw_free_network_nolock(struct	mlme_priv *pmlmepriv, struct wlan_network *pnetwork)
 {
-
-	struct __queue *free_queue = &(pmlmepriv->free_bss_pool);
+	struct __queue *free_queue = &pmlmepriv->free_bss_pool;
 
 	if (!pnetwork)
 		return;
@@ -404,7 +403,8 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 	long rssi_final;
 
 	/* The rule below is 1/5 for sample value, 4/5 for history value */
-	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) && is_same_network(&(padapter->mlmepriv.cur_network.network), src, 0)) {
+	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) &&
+	    is_same_network(&padapter->mlmepriv.cur_network.network, src, 0)) {
 		/* Take the recvpriv's value for the connected AP*/
 		ss_final = padapter->recvpriv.signal_strength;
 		sq_final = padapter->recvpriv.signal_qual;
@@ -440,29 +440,31 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 
 static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex *pnetwork)
 {
-	struct	mlme_priv *pmlmepriv = &(adapter->mlmepriv);
+	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 
-	rtw_bug_check(&(pmlmepriv->cur_network.network),
-		&(pmlmepriv->cur_network.network),
-		&(pmlmepriv->cur_network.network),
-		&(pmlmepriv->cur_network.network));
+	rtw_bug_check(&pmlmepriv->cur_network.network,
+		      &pmlmepriv->cur_network.network,
+		      &pmlmepriv->cur_network.network,
+		      &pmlmepriv->cur_network.network);
 
-	if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) && (is_same_network(&(pmlmepriv->cur_network.network), pnetwork, 0))) {
-		update_network(&(pmlmepriv->cur_network.network), pnetwork, adapter, true);
-		rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + sizeof(struct ndis_802_11_fix_ie),
-								pmlmepriv->cur_network.network.ie_length);
+	if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) &&
+	    (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
+		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, true);
+		rtw_update_protection(adapter, pmlmepriv->cur_network.network.ies +
+				      sizeof(struct ndis_802_11_fix_ie),
+				      pmlmepriv->cur_network.network.ie_length);
 	}
 }
 
 /*
-Caller must hold pmlmepriv->lock first.
-*/
+ *Caller must hold pmlmepriv->lock first.
+ */
 void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *target)
 {
 	struct list_head	*plist, *phead;
 	u32 bssid_ex_sz;
-	struct mlme_priv *pmlmepriv = &(adapter->mlmepriv);
-	struct __queue	*queue	= &(pmlmepriv->scanned_queue);
+	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
+	struct __queue	*queue	= &pmlmepriv->scanned_queue;
 	struct wlan_network	*pnetwork = NULL;
 	struct wlan_network	*oldest = NULL;
 	int target_find = 0;
@@ -475,7 +477,7 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 
 		rtw_bug_check(pnetwork, pnetwork, pnetwork, pnetwork);
 
-		if (is_same_network(&(pnetwork->network), target, feature)) {
+		if (is_same_network(&pnetwork->network, target, feature)) {
 			target_find = 1;
 			break;
 		}
@@ -492,14 +494,14 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 	/* If we didn't find a match, then get a new network slot to initialize
 	 * with this beacon's information */
 	if (!target_find) {
-		if (list_empty(&pmlmepriv->free_bss_pool.queue)) {
+		if (list_empty & pmlmepriv->free_bss_pool.queue) {
 			/* If there are no more slots, expire the oldest */
 			/* list_del_init(&oldest->list); */
 			pnetwork = oldest;
 			if (!pnetwork)
 				goto exit;
 
-			memcpy(&(pnetwork->network), target,  get_wlan_bssid_ex_sz(target));
+			memcpy(&pnetwork->network, target,  get_wlan_bssid_ex_sz(target));
 			/*  variable initialize */
 			pnetwork->fixed = false;
 			pnetwork->last_scanned = jiffies;
@@ -521,7 +523,7 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 
 			bssid_ex_sz = get_wlan_bssid_ex_sz(target);
 			target->length = bssid_ex_sz;
-			memcpy(&(pnetwork->network), target, bssid_ex_sz);
+			memcpy(&pnetwork->network, target, bssid_ex_sz);
 
 			pnetwork->last_scanned = jiffies;
 
@@ -529,8 +531,7 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 			if (pnetwork->network.phy_info.signal_quality == 101)
 				pnetwork->network.phy_info.signal_quality = 0;
 
-			list_add_tail(&(pnetwork->list), &(queue->queue));
-
+			list_add_tail(&pnetwork->list, &queue->queue);
 		}
 	} else {
 		/* we have an entry and we are going to update it. But this entry may
@@ -553,7 +554,7 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 			update_ie = false;
 		}
 
-		update_network(&(pnetwork->network), target, adapter, update_ie);
+		update_network(&pnetwork->network, target, adapter, update_ie);
 	}
 
 exit:
@@ -629,7 +630,7 @@ void rtw_survey_event_callback(struct adapter	*adapter, u8 *pbuf)
 {
 	u32 len;
 	struct wlan_bssid_ex *pnetwork;
-	struct	mlme_priv *pmlmepriv = &(adapter->mlmepriv);
+	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 
 	pnetwork = (struct wlan_bssid_ex *)pbuf;
 
@@ -645,14 +646,15 @@ void rtw_survey_event_callback(struct adapter	*adapter, u8 *pbuf)
 			struct wlan_network *ibss_wlan = NULL;
 
 			memcpy(pmlmepriv->cur_network.network.ies, pnetwork->ies, 8);
-			spin_lock_bh(&(pmlmepriv->scanned_queue.lock));
-			ibss_wlan = rtw_find_network(&pmlmepriv->scanned_queue,  pnetwork->mac_address);
+			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
+			ibss_wlan = rtw_find_network(&pmlmepriv->scanned_queue,
+						     pnetwork->mac_address);
 			if (ibss_wlan) {
 				memcpy(ibss_wlan->network.ies, pnetwork->ies, 8);
-				spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
+				spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
 				goto exit;
 			}
-			spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
+			spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
 		}
 	}
 
@@ -670,7 +672,7 @@ void rtw_survey_event_callback(struct adapter	*adapter, u8 *pbuf)
 
 void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 {
-	struct	mlme_priv *pmlmepriv = &(adapter->mlmepriv);
+	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 
 	spin_lock_bh(&pmlmepriv->lock);
 	if (pmlmepriv->wps_probe_req_ie) {
@@ -697,7 +699,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 					_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
 				} else {
 					u8 ret = _SUCCESS;
-					struct wlan_bssid_ex    *pdev_network = &(adapter->registrypriv.dev_network);
+					struct wlan_bssid_ex *pdev_network = &adapter->registrypriv.dev_network;
 					u8 *pibss = adapter->registrypriv.dev_network.mac_address;
 
 					/* pmlmepriv->fw_state ^= _FW_UNDER_SURVEY;because don't set assoc_timer */
@@ -922,8 +924,8 @@ inline void rtw_indicate_scan_done(struct adapter *padapter, bool aborted)
 void rtw_scan_abort(struct adapter *adapter)
 {
 	unsigned long start;
-	struct mlme_priv *pmlmepriv = &(adapter->mlmepriv);
-	struct mlme_ext_priv *pmlmeext = &(adapter->mlmeextpriv);
+	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
+	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 
 	start = jiffies;
 	pmlmeext->scan_abort = true;
@@ -1029,8 +1031,8 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 /* ptarget_wlan: found from scanned_queue */
 static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_network *ptarget_wlan, struct wlan_network  *pnetwork)
 {
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
-	struct wlan_network  *cur_network = &(pmlmepriv->cur_network);
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct wlan_network  *cur_network = &pmlmepriv->cur_network;
 
 	/*  why not use ptarget_wlan?? */
 	memcpy(&cur_network->network, &pnetwork->network, pnetwork->network.length);
@@ -1086,9 +1088,9 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 	static u8 __maybe_unused retry;
 	struct sta_info *ptarget_sta = NULL, *pcur_sta = NULL;
 	struct	sta_priv *pstapriv = &adapter->stapriv;
-	struct	mlme_priv *pmlmepriv = &(adapter->mlmepriv);
+	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 	struct wlan_network	*pnetwork	= (struct wlan_network *)pbuf;
-	struct wlan_network	*cur_network = &(pmlmepriv->cur_network);
+	struct wlan_network	*cur_network = &pmlmepriv->cur_network;
 	struct wlan_network	*pcur_wlan = NULL, *ptarget_wlan = NULL;
 	unsigned int		the_same_macaddr = false;
 
@@ -1106,7 +1108,7 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 	pmlmepriv->LinkDetectInfo.LowPowerTransitionCount = 0;
 
 	if (pnetwork->join_res > 0) {
-		spin_lock_bh(&(pmlmepriv->scanned_queue.lock));
+		spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 		retry = 0;
 		if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) {
 			/* s1. find ptarget_wlan */
@@ -1143,7 +1145,7 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 			} else {
 				netdev_dbg(adapter->pnetdev,
 					   "Can't find ptarget_wlan when joinbss_event callback\n");
-				spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
+				spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
 				goto ignore_joinbss_callback;
 			}
 
@@ -1151,7 +1153,7 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
 				ptarget_sta = rtw_joinbss_update_stainfo(adapter, pnetwork);
 				if (!ptarget_sta) {
-					spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
+					spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
 					goto ignore_joinbss_callback;
 				}
 			}
@@ -1169,7 +1171,7 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 			del_timer_sync(&pmlmepriv->assoc_timer);
 			spin_lock_bh(&pmlmepriv->lock);
 		} else {
-			spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
+			spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
 		}
 	} else if (pnetwork->join_res == -4) {
 		rtw_reset_securitypriv(adapter);
@@ -1226,16 +1228,16 @@ void rtw_sta_media_status_rpt(struct adapter *adapter, struct sta_info *psta, u3
 	if (!psta)
 		return;
 
-	media_status_rpt = (u16)((psta->mac_id<<8)|mstatus); /*   MACID|OPMODE:1 connect */
+	media_status_rpt = (u16)((psta->mac_id << 8) | mstatus); /*   MACID|OPMODE:1 connect */
 	rtw_hal_set_hwreg(adapter, HW_VAR_H2C_MEDIA_STATUS_RPT, (u8 *)&media_status_rpt);
 }
 
 void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 {
 	struct sta_info *psta;
-	struct mlme_priv *pmlmepriv = &(adapter->mlmepriv);
+	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
 	struct stassoc_event	*pstassoc	= (struct stassoc_event *)pbuf;
-	struct wlan_network	*cur_network = &(pmlmepriv->cur_network);
+	struct wlan_network	*cur_network = &pmlmepriv->cur_network;
 	struct wlan_network	*ptarget_wlan = NULL;
 
 	if (rtw_access_ctrl(adapter, pstassoc->macaddr) == false)
@@ -1306,12 +1308,12 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) ||
 		(check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
 		if (adapter->stapriv.asoc_sta_count == 2) {
-			spin_lock_bh(&(pmlmepriv->scanned_queue.lock));
+			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 			ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
 			pmlmepriv->cur_network_scanned = ptarget_wlan;
 			if (ptarget_wlan)
 				ptarget_wlan->fixed = true;
-			spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
+			spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
 			/*  a sta + bc/mc_stainfo (not Ibss_stainfo) */
 			rtw_indicate_connect(adapter);
 		}
@@ -1329,11 +1331,11 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 	struct wlan_network *pwlan = NULL;
 	struct wlan_bssid_ex    *pdev_network = NULL;
 	u8 *pibss = NULL;
-	struct	mlme_priv *pmlmepriv = &(adapter->mlmepriv);
+	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 	struct	stadel_event *pstadel	= (struct stadel_event *)pbuf;
-	struct wlan_network *tgt_network = &(pmlmepriv->cur_network);
+	struct wlan_network *tgt_network = &pmlmepriv->cur_network;
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	psta = rtw_get_stainfo(&adapter->stapriv, pstadel->macaddr);
 	if (psta)
@@ -1385,14 +1387,14 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 		rtw_free_assoc_resources(adapter, 1);
 		rtw_indicate_disconnect(adapter);
 
-		spin_lock_bh(&(pmlmepriv->scanned_queue.lock));
+		spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 		/*  remove the network entry in scanned_queue */
 		pwlan = rtw_find_network(&pmlmepriv->scanned_queue, tgt_network->network.mac_address);
 		if (pwlan) {
 			pwlan->fixed = false;
 			rtw_free_network_nolock(adapter, pwlan);
 		}
-		spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
+		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
 
 		_rtw_roaming(adapter, roam_target);
 	}
@@ -1404,16 +1406,17 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 
 		if (adapter->stapriv.asoc_sta_count == 1) {/* a sta + bc/mc_stainfo (not Ibss_stainfo) */
 			u8 ret = _SUCCESS;
-			spin_lock_bh(&(pmlmepriv->scanned_queue.lock));
+
+			spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 			/* free old ibss network */
 			pwlan = rtw_find_network(&pmlmepriv->scanned_queue, tgt_network->network.mac_address);
 			if (pwlan) {
 				pwlan->fixed = false;
 				rtw_free_network_nolock(adapter, pwlan);
 			}
-			spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
+			spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
 			/* re-create ibss */
-			pdev_network = &(adapter->registrypriv.dev_network);
+			pdev_network = &adapter->registrypriv.dev_network;
 			pibss = adapter->registrypriv.dev_network.mac_address;
 
 			memcpy(pdev_network, &tgt_network->network, get_wlan_bssid_ex_sz(&tgt_network->network));
@@ -1521,7 +1524,7 @@ void rtw_mlme_reset_auto_scan_int(struct adapter *adapter)
 {
 	struct mlme_priv *mlme = &adapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	if (pmlmeinfo->VHT_enable) /* disable auto scan when connect to 11AC AP */
 		mlme->auto_scan_int_ms = 0;
@@ -1662,7 +1665,7 @@ int rtw_select_roaming_candidate(struct mlme_priv *mlme)
 {
 	int ret = _FAIL;
 	struct list_head	*phead;
-	struct __queue	*queue	= &(mlme->scanned_queue);
+	struct __queue	*queue	= &mlme->scanned_queue;
 	struct	wlan_network	*pnetwork = NULL;
 	struct	wlan_network	*candidate = NULL;
 
@@ -1671,16 +1674,14 @@ int rtw_select_roaming_candidate(struct mlme_priv *mlme)
 		return ret;
 	}
 
-	spin_lock_bh(&(mlme->scanned_queue.lock));
+	spin_lock_bh(&mlme->scanned_queue.lock);
 	phead = get_list_head(queue);
 
 	list_for_each(mlme->pscanned, phead) {
-
 		pnetwork = list_entry(mlme->pscanned, struct wlan_network,
 				      list);
 
 		rtw_check_roaming_candidate(mlme, &candidate, pnetwork);
-
 	}
 
 	if (!candidate) {
@@ -1695,7 +1696,7 @@ int rtw_select_roaming_candidate(struct mlme_priv *mlme)
 
 	ret = _SUCCESS;
 exit:
-	spin_unlock_bh(&(mlme->scanned_queue.lock));
+	spin_unlock_bh(&mlme->scanned_queue.lock);
 
 	return ret;
 }
@@ -1745,24 +1746,24 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 }
 
 /*
-Calling context:
-The caller of the sub-routine will be in critical section...
-The caller must hold the following spinlock
-pmlmepriv->lock
-*/
+ *Calling context:
+ *The caller of the sub-routine will be in critical section...
+ *The caller must hold the following spinlock
+ *pmlmepriv->lock
+ */
 
 int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
 {
 	int ret;
 	struct list_head	*phead;
 	struct adapter *adapter;
-	struct __queue	*queue	= &(pmlmepriv->scanned_queue);
+	struct __queue	*queue	= &pmlmepriv->scanned_queue;
 	struct	wlan_network	*pnetwork = NULL;
 	struct	wlan_network	*candidate = NULL;
 
 	adapter = (struct adapter *)pmlmepriv->nic_hdl;
 
-	spin_lock_bh(&(pmlmepriv->scanned_queue.lock));
+	spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 
 	if (pmlmepriv->roam_network) {
 		candidate = pmlmepriv->roam_network;
@@ -1800,7 +1801,7 @@ int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
 	ret = rtw_joinbss_cmd(adapter, candidate);
 
 exit:
-	spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
+	spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
 	return ret;
 }
 
@@ -1808,7 +1809,7 @@ signed int rtw_set_auth(struct adapter *adapter, struct security_priv *psecurity
 {
 	struct	cmd_obj *pcmd;
 	struct	setauth_parm *psetauthparm;
-	struct	cmd_priv *pcmdpriv = &(adapter->cmdpriv);
+	struct	cmd_priv *pcmdpriv = &adapter->cmdpriv;
 	signed int		res = _SUCCESS;
 
 	pcmd = rtw_zmalloc(sizeof(struct cmd_obj));
@@ -1840,12 +1841,13 @@ signed int rtw_set_auth(struct adapter *adapter, struct security_priv *psecurity
 	return res;
 }
 
-signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv, signed int keyid, u8 set_tx, bool enqueue)
+signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv,
+		       signed int keyid, u8 set_tx, bool enqueue)
 {
 	u8 keylen;
 	struct cmd_obj		*pcmd;
 	struct setkey_parm	*psetkeyparm;
-	struct cmd_priv 	*pcmdpriv = &(adapter->cmdpriv);
+	struct cmd_priv *pcmdpriv = &adapter->cmdpriv;
 	signed int	res = _SUCCESS;
 
 	psetkeyparm = rtw_zmalloc(sizeof(struct setkey_parm));
@@ -1865,14 +1867,13 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 		adapter->securitypriv.key_mask |= BIT(psetkeyparm->keyid);
 
 	switch (psetkeyparm->algorithm) {
-
 	case _WEP40_:
 		keylen = 5;
-		memcpy(&(psetkeyparm->key[0]), &(psecuritypriv->dot11DefKey[keyid].skey[0]), keylen);
+		memcpy(&psetkeyparm->key[0], &psecuritypriv->dot11DefKey[keyid].skey[0], keylen);
 		break;
 	case _WEP104_:
 		keylen = 13;
-		memcpy(&(psetkeyparm->key[0]), &(psecuritypriv->dot11DefKey[keyid].skey[0]), keylen);
+		memcpy(&psetkeyparm->key[0], &psecuritypriv->dot11DefKey[keyid].skey[0], keylen);
 		break;
 	case _TKIP_:
 		keylen = 16;
@@ -2035,7 +2036,7 @@ void rtw_init_registrypriv_dev_network(struct adapter *adapter)
 {
 	struct registry_priv *pregistrypriv = &adapter->registrypriv;
 	struct eeprom_priv *peepriv = &adapter->eeprompriv;
-	struct wlan_bssid_ex    *pdev_network = &pregistrypriv->dev_network;
+	struct wlan_bssid_ex *pdev_network = &pregistrypriv->dev_network;
 	u8 *myhwaddr = myid(peepriv);
 
 	memcpy(pdev_network->mac_address, myhwaddr, ETH_ALEN);
@@ -2335,7 +2336,7 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 	struct ht_priv 	*phtpriv = &pmlmepriv->htpriv;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 cbw40_enable = 0;
 
 	if (!phtpriv->ht_option)
-- 
2.45.3

