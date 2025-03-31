Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77F1214810
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743435522; cv=none; b=hVKqrP1cGTU5llmzUN/4kkhK0RT4Ch5qTtzqZqCsftp8/0PklNih5NW5G7RKAyzurMMDwaNrUrZLi6GsnllnGT94Km9/RYXV7+KnBuSBX9Q69k6ghR9sy+1wLTOP4B5aMmiqs9qKbIc34eACfV2mKV8/xqGyTJrzB/faYVvE/7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743435522; c=relaxed/simple;
	bh=aOOWiCI3ZK6+dzDuMUQZ7ZuRMibgi+DohpZfmHWxiow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k2eBJs1aE/NAX2jCTA8XMIT6yJW+G99GRfC3YHMZoNLjZuIui6ShIigwrnqWdLNC3Z5bI05GLppj7Of4vErZdkRRkRm2frHCe2PA945D66zfJPD7n9raQi4qKTPV3fKmFwve3Ib/GWMkO8kmPg4Z2i64jBh0Mpk3QyQ/E0UAsiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uay+Eqzq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uay+Eqzq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso31184055e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743435519; x=1744040319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pK/O4pDg7hGitdXCJDavzci3Ws7cE2OFjqh+I33m5qk=;
        b=Uay+Eqzqxl05h3Wcp8tbJSy5Ezme9zUJwdA6Wa5HzPYpYsrMBcnMAgxNNZmCH8xL/j
         rj92zzO7vUMehiyJEJxKznVsSlkFanYRXHgF/cB+kwHWmMiCTP8nkoPj1boH3KXz7L1U
         0IrG7qEN3bevhtHS2s+m3nA9XRa0pMhocrTdkfntT8gEW34Ewx+IFYjIYb8YMCOQF/OH
         rsTgw0cc8ecthXYiKUuHYOmlFf5+mOjZHuGMvfpyim8dyAAGjUF6dwrNH7HfixpLJna6
         9Zs/LVLaeRpmsJUQMfO97NkiyQ7QN8Qm5ihRZUL27u6PcMWOuvV6I6uTNPsgzaHMuvwM
         2dOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743435519; x=1744040319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pK/O4pDg7hGitdXCJDavzci3Ws7cE2OFjqh+I33m5qk=;
        b=SpY2BnLHIIL37KuKbjgaEjxHi96KMvf913bT0zitt17TmTp+ppUxVRjhMO/1iSPjou
         Kop2LdqypEcm2GmDtdZxCR6/3qmncZcAtFF49LqTixHqd6eGGhLJo6nJUBIeONTp+ojA
         kpcIsjxUdCXuivCr4FkOxinAQlkBacGjp5e9uTK3YQpe6jClzpfWraN5agQ/5DWG+RFX
         r/0XEi2bsGzE797T3C3Ozje6npruB8CALrCsXSyQlP6oKEujI5LdNhgA2w/N8LYoLhHG
         Uar5r8L8LdtDMzc1ZLiJXzBxOlAhBDHNOMe3va+KaE7wo0bpbq4NjjDPBsUi4M8FNDv2
         xPNA==
X-Forwarded-Encrypted: i=1; AJvYcCXwxVp76zs9kO7ALBgIUHpYtN8ogj5+ivs50ISmpnqfs7MWgk8hclf5HgXEhEyx6qkMBjr2Fs80OqPTTXs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuIUpeX3uFGFjqBmPVEtnGgxrOM9kQHz4ZINzo5pNztAL/eT7z
	JqXSrLn8+S4Zuohn4kvWvax11I3fS5+nJB+HcTuYOU0w+kje+Pe3
X-Gm-Gg: ASbGncvPYX1JA2o0aAq4ScD+Ssn7OhOPYhFPPUUJbTkXHFwPIgAdIG1KTL4WwrKLqRU
	b14xKf1cmG0FDC+dDtb8QlqvubIU0sFw8wG+BNIOnIly/brC1CMV9PaqD6YfJkLg0HzJDggfOVb
	KgI2bTHw1UvaGLbQQ9zuZDE/ZTJ97KlMDB/HfW7QUvSbBAbQRCfmes1ulllKvf78zkdyYEXjqgq
	96nCsQEP+Y/4IA3YnuIyMfS/LHfupEXK1/5LnOQFu61RGxDlSqJQpfVZkas0fnR0nqMOqFQ3AvJ
	ax0nDsj6TVS5B/kcaS+/wmBBsNTrrzelqoTEtM4=
X-Google-Smtp-Source: AGHT+IH2mGFfLetV5v+eJkoMgmWrblW17D+ToN5g6OBQ+briCVirOztPLwgyfX6vxOxCuiLKkNvGwQ==
X-Received: by 2002:a05:600c:1e23:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-43db61cebecmr94980375e9.7.1743435518556;
        Mon, 31 Mar 2025 08:38:38 -0700 (PDT)
Received: from pc.. ([41.206.42.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6588d0sm11419167f8f.7.2025.03.31.08.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 08:38:38 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH 1/5] staging: rtl8723bs: use preferred comparison order
Date: Mon, 31 Mar 2025 18:37:54 +0300
Message-ID: <fedb5c20db46a72eb25358adfa69abfc1e1f3d6b.1743434232.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743434232.git.karanja99erick@gmail.com>
References: <cover.1743434232.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor  conditions check to follow the Linux kernel
coding style, which prefers placing the variable on the left side
of the comparison.

Reported by checkpatch:

	WARNING: Comparisons should place the constant on the right side
    of the test

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index b72cf520d576..9105594d2dde 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -91,7 +91,7 @@ static void halbtcoutsrc_LeaveLowPower(struct btc_coexist *pBtCoexist)
 	stime = jiffies;
 	do {
 		ready = rtw_register_task_alive(padapter, BTCOEX_ALIVE);
-		if (_SUCCESS == ready)
+		if (ready == _SUCCESS)
 			break;
 
 		utime = jiffies_to_msecs(jiffies - stime);
@@ -668,7 +668,7 @@ static void halbtcoutsrc_WriteLocalReg1Byte(void *pBtcContext, u32 RegAddr, u8 D
 	struct btc_coexist *pBtCoexist = (struct btc_coexist *)pBtcContext;
 	struct adapter *Adapter = pBtCoexist->Adapter;
 
-	if (BTC_INTF_SDIO == pBtCoexist->chipInterface)
+	if (pBtCoexist->chipInterface == BTC_INTF_SDIO)
 		rtw_write8(Adapter, SDIO_LOCAL_BASE | RegAddr, Data);
 	else
 		rtw_write8(Adapter, RegAddr, Data);
@@ -894,7 +894,7 @@ void EXhalbtcoutsrc_IpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 	if (pBtCoexist->bManualControl)
 		return;
 
-	if (IPS_NONE == type)
+	if (type == IPS_NONE)
 		ipsType = BTC_IPS_LEAVE;
 	else
 		ipsType = BTC_IPS_ENTER;
@@ -922,7 +922,7 @@ void EXhalbtcoutsrc_LpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 	if (pBtCoexist->bManualControl)
 		return;
 
-	if (PS_MODE_ACTIVE == type)
+	if (type == PS_MODE_ACTIVE)
 		lpsType = BTC_LPS_DISABLE;
 	else
 		lpsType = BTC_LPS_ENABLE;
@@ -1000,7 +1000,7 @@ void EXhalbtcoutsrc_MediaStatusNotify(struct btc_coexist *pBtCoexist, enum
 	if (pBtCoexist->bManualControl)
 		return;
 
-	if (RT_MEDIA_CONNECT == mediaStatus)
+	if (mediaStatus == RT_MEDIA_CONNECT)
 		mStatus = BTC_MEDIA_CONNECT;
 	else
 		mStatus = BTC_MEDIA_DISCONNECT;
@@ -1026,11 +1026,11 @@ void EXhalbtcoutsrc_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 pktTy
 	if (pBtCoexist->bManualControl)
 		return;
 
-	if (PACKET_DHCP == pktType) {
+	if (pktType == PACKET_DHCP) {
 		packetType = BTC_PACKET_DHCP;
-	} else if (PACKET_EAPOL == pktType) {
+	} else if (pktType == PACKET_EAPOL) {
 		packetType = BTC_PACKET_EAPOL;
-	} else if (PACKET_ARP == pktType) {
+	} else if (pktType == PACKET_ARP) {
 		packetType = BTC_PACKET_ARP;
 	} else {
 		return;
@@ -1114,13 +1114,13 @@ void EXhalbtcoutsrc_Periodical(struct btc_coexist *pBtCoexist)
 
 void EXhalbtcoutsrc_SetAntNum(u8 type, u8 antNum)
 {
-	if (BT_COEX_ANT_TYPE_PG == type) {
+	if (type == BT_COEX_ANT_TYPE_PG) {
 		GLBtCoexist.boardInfo.pgAntNum = antNum;
 		GLBtCoexist.boardInfo.btdmAntNum = antNum;
-	} else if (BT_COEX_ANT_TYPE_ANTDIV == type) {
+	} else if (type == BT_COEX_ANT_TYPE_ANTDIV) {
 		GLBtCoexist.boardInfo.btdmAntNum = antNum;
 		/* GLBtCoexist.boardInfo.btdmAntPos = BTC_ANTENNA_AT_MAIN_PORT; */
-	} else if (BT_COEX_ANT_TYPE_DETECTED == type) {
+	} else if (type == BT_COEX_ANT_TYPE_DETECTED) {
 		GLBtCoexist.boardInfo.btdmAntNum = antNum;
 		/* GLBtCoexist.boardInfo.btdmAntPos = BTC_ANTENNA_AT_MAIN_PORT; */
 	}
-- 
2.43.0

