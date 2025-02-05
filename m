Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BD2211A0E
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 01:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738720231; cv=none; b=nSvtvCZ2ZEVKfpy05Q2vi+c4hI5jbSqlrqwAbOLl2F8+7q+IqRUb8hBbviglR3Edcw4KforpKuMJxgU7JZ8EtdoqatV9SI8v2kDqUoFX3mQrHI2WnVtLipBqtq0m/18Z0aR2smIPLiF+uUM9A+5y6RtszMVX+smMN4+EUYKhwZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738720231; c=relaxed/simple;
	bh=vsfosK4EDGncw/JpLWreyZi0mpIhSDZJ0eulurqB8Js=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLcszGZGqBmc2Y09kKW65KaD2flKZzCzLTm79YWvgeYOBjoKTkgZPnNfEcdQscDdjCPa9pIgdbAj9o+OA75mdGJmBQGBbeb2BOn3TeeJoDgc2acMwZI78Ojg4ADlZCiiP188bGPK4Gj2SbFxMC/Bin8O/euuE2auZsmjLk5ARjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXc2dwiv; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXc2dwiv"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f9cd8ecbceso1923630a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 17:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738720229; x=1739325029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJ08YcfgbUiop8dwOeKgURJ7wcJBnOw/KKn3/YRa9b0=;
        b=ZXc2dwivkN9wiPhx5SBna2x1eL8stIipAm4kvETDO4QZCM+bb6HLTiqxXO43QJnIfB
         8Ydgofjh3y7PZWsyTbE0kkmxsKdBkD+9JWyqUBk8tZzvj4WDL3SUUNLDLi1HuejJGXZY
         BUrTQs/ADBsj1MYZvWE5xfkmXNhvL5pa4xogURdZEEhYNfQK6TS+jK9fQOPiubfAFw+Y
         gYuAI0oj5/NoHd91k8qPXm81c89dWXfeOMXApuMdlXn3dZsdYdHHLBpGwoMLbCGYXwXu
         A5afI3dywFqFTMw43p7O7m42/Qc/KmOlxs8x163ofa55uuR6G/GsNU5TZtTBzA8c8R0B
         4/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738720229; x=1739325029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJ08YcfgbUiop8dwOeKgURJ7wcJBnOw/KKn3/YRa9b0=;
        b=u8HhzLG5zunLfcM+Pxh8x8bJFH+X8RVZ6/bY9hGWYK0bn4GvxqM/2mlcOiPekAJoEf
         Yvm0yjHpLWXykDivRY9EJYV508I9g+MWn7oawiSyH+A9kbL0B3Bt7gJj0VTsmxqb+Hv+
         Zr2rZL+7bsvPVXKjTqcK2/zU65o2u9StXwns15Vpk3o6yvAFI8vUC1mvetyQYqCpsVij
         2lDAydyP/JXcCvEhemCIinbZcPohKlD4qLfFw69JK4wyfY7SgkLEJnUqS404KHaEkG1g
         frOp6cX0558KMvUFgcZI5UWLZOMiUMkCrqi/BmioDhFxmNKg590LWVGnA41kssQ99Wb+
         wLug==
X-Forwarded-Encrypted: i=1; AJvYcCW1w/Rs4p/oNe3XdnXQSCzuDFvMjGbyvNtlzXuRHzaubZj/HSElOKBTz48AXY9y1zj7nlc3f9GHaZr0gWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzZv4DKVek8ZOAPZtXuow4wLGhqOmsb6ezCT6lBjo0AwybWgSf
	o50+prF75Uo/YmO7OV4zo+4dKbAwhv/nHWEeV6cs3NyWCtfd7r/P
X-Gm-Gg: ASbGncudGhggdIS7RdrR3q19spH0yulWsUDS+WYitCaBuaraKRz5QrLfA5KVVPLdIRA
	Q26JDJC5Je6cvtR+SLAEqGfDoQz0ltnBbTBRJSYLagA9J2HyE9hhE9SoOEOPrNRBbg4rhM7bD1y
	PhvNKIDZ5yjQMOfjKPWQENnqt72ALmT091ZS3ILJLyrQgNBxOA6obHjC/hHnhqNfsyw6e53lcEp
	cZiQoO154maUnOOL8BKn0QA2ZjREjySWkVdqn2p1LeeIY6ITJ2ZxcL48I7WcCovrCdZ63lJnb9M
	eJKzWAhaCj9RlkknK0JKRzY=
X-Google-Smtp-Source: AGHT+IEApOZoxGoFfiDhvmmSwV9n5I2Bw3v+HjLfPGoYIQ9JHhyVVPDO7bDJYvKmPKmMKTla9hFX5A==
X-Received: by 2002:a17:90b:1809:b0:2ee:8430:b847 with SMTP id 98e67ed59e1d1-2f9e0753844mr1485997a91.6.1738720229067;
        Tue, 04 Feb 2025 17:50:29 -0800 (PST)
Received: from DESKTOP-GL3U3CJ ([146.70.174.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f9c314b64fsm1302137a91.1.2025.02.04.17.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:50:28 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 4/4] staging: rtl8723bs: fixed comment styling
Date: Tue,  4 Feb 2025 17:50:19 -0800
Message-ID: <c167a99c0a96f5eba7e5d10fef947da3edf7d4d9.1738720049.git.onlyian4981@gmail.com>
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

Comments were not neat and did not comply with the coding style.

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 71 +++++++++++------------
 1 file changed, 35 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 4d8dc7646867..9bd36440a15b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -185,10 +185,10 @@ void _rtw_free_network_nolock(struct	mlme_priv *pmlmepriv, struct wlan_network *
 }
 
 /*
-	return the wlan_network with the matching addr
-
-	Shall be called under atomic context... to avoid possible racing condition...
-*/
+ *	return the wlan_network with the matching addr
+ *
+ *	Shall be called under atomic context... to avoid possible racing condition...
+ */
 struct wlan_network *_rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 {
 	struct list_head	*phead, *plist;
@@ -290,10 +290,10 @@ void rtw_free_network_nolock(struct adapter *padapter, struct wlan_network *pnet
 }
 
 /*
-	return the wlan_network with the matching addr
-
-	Shall be called under atomic context... to avoid possible racing condition...
-*/
+ *	return the wlan_network with the matching addr
+ *
+ *	Shall be called under atomic context... to avoid possible racing condition...
+ */
 struct	wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 {
 	struct	wlan_network *pnetwork = _rtw_find_network(scanned_queue, addr);
@@ -483,11 +483,11 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 
 		if (!oldest || time_after(oldest->last_scanned, pnetwork->last_scanned))
 			oldest = pnetwork;
-
 	}
 
 	/* If we didn't find a match, then get a new network slot to initialize
-	 * with this beacon's information */
+	 * with this beacon's information
+	 */
 	if (!target_find) {
 		if (list_empty & pmlmepriv->free_bss_pool.queue) {
 			/* If there are no more slots, expire the oldest */
@@ -564,11 +564,11 @@ void rtw_add_network(struct adapter *adapter, struct wlan_bssid_ex *pnetwork)
 }
 
 /* select the desired network based on the capability of the (i)bss. */
-/*  check items: (1) security */
-/* 			   (2) network_type */
-/* 			   (3) WMM */
-/* 			   (4) HT */
-/*                      (5) others */
+/* check items: (1) security */
+/* 		(2) network_type */
+/* 		(3) WMM */
+/* 		(4) HT */
+/*		(5) others */
 int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork);
 int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork)
 {
@@ -827,8 +827,8 @@ static void find_network(struct adapter *adapter)
 }
 
 /*
-*rtw_free_assoc_resources: the caller has to lock pmlmepriv->lock
-*/
+ *rtw_free_assoc_resources: the caller has to lock pmlmepriv->lock
+ */
 void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 {
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
@@ -863,8 +863,8 @@ void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 }
 
 /*
-*rtw_indicate_connect: the caller has to lock pmlmepriv->lock
-*/
+ *rtw_indicate_connect: the caller has to lock pmlmepriv->lock
+ */
 void rtw_indicate_connect(struct adapter *padapter)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -882,8 +882,8 @@ void rtw_indicate_connect(struct adapter *padapter)
 }
 
 /*
-*rtw_indicate_disconnect: the caller has to lock pmlmepriv->lock
-*/
+ *rtw_indicate_disconnect: the caller has to lock pmlmepriv->lock
+ */
 void rtw_indicate_disconnect(struct adapter *padapter)
 {
 	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -1466,9 +1466,9 @@ void rtw_wmm_event_callback(struct adapter *padapter, u8 *pbuf)
 }
 
 /*
-* _rtw_join_timeout_handler - Timeout/failure handler for CMD JoinBss
-* @adapter: pointer to struct adapter structure
-*/
+ * _rtw_join_timeout_handler - Timeout/failure handler for CMD JoinBss
+ * @adapter: pointer to struct adapter structure
+ */
 void _rtw_join_timeout_handler(struct timer_list *t)
 {
 	struct adapter *adapter = from_timer(adapter, t,
@@ -1503,16 +1503,15 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 
 		/* indicate disconnect for the case that join_timeout and check_fwstate != FW_LINKED */
 		rtw_cfg80211_indicate_disconnect(adapter);
-
 	}
 
 	spin_unlock_bh(&pmlmepriv->lock);
 }
 
 /*
-* rtw_scan_timeout_handler - Timeout/Failure handler for CMD SiteSurvey
-* @adapter: pointer to struct adapter structure
-*/
+ * rtw_scan_timeout_handler - Timeout/Failure handler for CMD SiteSurvey
+ * @adapter: pointer to struct adapter structure
+ */
 void rtw_scan_timeout_handler(struct timer_list *t)
 {
 	struct adapter *adapter = from_timer(adapter, t,
@@ -1628,10 +1627,10 @@ void rtw_set_scan_deny(struct adapter *adapter, u32 ms)
 }
 
 /*
-* Select a new roaming candidate from the original @param candidate and @param competitor
-* @return true: candidate is updated
-* @return false: candidate is not updated
-*/
+ * Select a new roaming candidate from the original @param candidate and @param competitor
+ * @return true: candidate is updated
+ * @return false: candidate is not updated
+ */
 static int rtw_check_roaming_candidate(struct mlme_priv *mlme
 	, struct wlan_network **candidate, struct wlan_network *competitor)
 {
@@ -1710,10 +1709,10 @@ int rtw_select_roaming_candidate(struct mlme_priv *mlme)
 }
 
 /*
-* Select a new join candidate from the original @param candidate and @param competitor
-* @return true: candidate is updated
-* @return false: candidate is not updated
-*/
+ * Select a new join candidate from the original @param candidate and @param competitor
+ * @return true: candidate is updated
+ * @return false: candidate is not updated
+ */
 static int rtw_check_join_candidate(struct mlme_priv *mlme
 	, struct wlan_network **candidate, struct wlan_network *competitor)
 {
-- 
2.45.3

