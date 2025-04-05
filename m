Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421AF1DE3C4
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 11:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743852410; cv=none; b=d48nC37ayiBD0UihZRwmGkVcszIT6kkmmoa+R4MKog/mu8rHHXIVY0URn2TrptY+Me0mKB133k0dovQis75vOq9387DFLPBQbbGNznp0IuP6oqOf9c7kStOvRdmm6QPeWsg0p2C84kI6d2AyUGnOzI5Zzdl5a4cS2TeQeDEJr2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743852410; c=relaxed/simple;
	bh=aOOWiCI3ZK6+dzDuMUQZ7ZuRMibgi+DohpZfmHWxiow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gJZL0jfkeb538htYbAMuzO16tA98+i3D7etCwMytOqlvJtVqfiTWKLkRbPOQjZelQmtF+nCC57+b7tTvlEiHBcy6utknTk1DEefXqZ+iYfgFdEIQnOiODBQPQNiOPUJGEdY5EyLXoUjwmGhz9e/DrOumHPcPa6O8rOthQeYURIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ig43mErt; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ig43mErt"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so28490545e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 04:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743852406; x=1744457206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pK/O4pDg7hGitdXCJDavzci3Ws7cE2OFjqh+I33m5qk=;
        b=Ig43mErtfOeqBOMz6gJknlOctsXMzPy9rgk+I8p/5mmaX+du0sXSkGi5aTuSJYcMNw
         QxIFdlUfeUormoS/YpQV7Mmsw/wyLS7OjxNMUlzLwU37oUUbXjj6W23i4ouHxTXzI4Qh
         FPgM2T1wUz19hBt6wxCkddw7NQ8sxLqIixe0+d7fdSHWHxjU3AUf05ohD4qXlteDQ05C
         f3BPK+1WxyqsVIJlh+HQQW4anlmTc/dJekJAHy2P7Yw2VJ1w27k54faqU5FTXkuxEGKu
         p0jWSEuVbS4n37kXoTw1sDNNFflAgMzNqZT8YvleCTLAfB7KxlZduSwwKoD5S3Rsv1JU
         JiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743852406; x=1744457206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pK/O4pDg7hGitdXCJDavzci3Ws7cE2OFjqh+I33m5qk=;
        b=OuxzIg5BdOhGEH9oseYZdZ4PdDoWYlthnBTs4y/28RHnKD4HThFHwcotooF+ZfuiYd
         vDwm1oHn2Ewkz2+Z10PirfC5+AoYajY35S3C76oi666a+N4KaQQwlGxWc+rPe91cC7wB
         zKUvPJ3cj4wfd1jTtW5Brjil14S6pta118ovtNfd2vxUCaaG+F7m/rYcb7NcTGZGP8yE
         MHP+hwasIBYiOBqSTgCD4xXhmXIYOfy0yDcYCoe3NPMPb/B9UJ+6oEJ5EldY1qeGNeLu
         hAXI9V2a2kxcbkqKOGTfOnG2Zls++XBS7rVhzVHUweN6OZDLZlo5u+mdSsnSPDLGX7c0
         y7SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnlXPjbngN8d8zG6mBDNJLT0QDa5c0EqrkZReVIu4DReUQ8/+H/XxXGsv37ROeJk1InezSMk7BXSprTSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY/2NccaAoh+Ahe/i4H1P6cmJePkh64+yII94YZBJtrreG7Ztu
	3bAg4suK7Xg0gHGQv1liI41q+ZGBp7tN0IrXcvczyiiansidA6KEkbMtM4txm5I=
X-Gm-Gg: ASbGnctwFrOdv1oorhIkrGDX6hGGhXfUaXxvd5zNhE5r1eyBkkNAo6HLMZqJ1PEvmvb
	GGt+x++NNoA9PAeh9VsFOieygQLBVwRtW6PAPyE9V6jFcxWm9EvYk9E/MG9vw9CuGAgOeVEMALK
	cbClHRY1EOTvKEdNPyDIeE96QCD3tdbs3hLdk+tADstsrx94WWhrgJqWKu5Zzbr4KjcUAQCClnQ
	Fx83epPwjWoUTuCB4YMKZ4aFCwoAyqG129Gx4d3p4ojRNOhQCHx928ADp8pDqOs5xekattJkQUd
	aDzHpwDpAYOj4BV0rhlkUoKeE3i7Z2LRQQUuprJOyg==
X-Google-Smtp-Source: AGHT+IHLA/32ujDJpWp156gtDsNMkozYCoV5fYDtmUGAjRgxJe6FJCwxQGZ2W2BX9K+wIzPE7dOyXA==
X-Received: by 2002:a05:600c:3ba4:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-43ecf89d5b9mr46271625e9.9.1743852406289;
        Sat, 05 Apr 2025 04:26:46 -0700 (PDT)
Received: from pc.. ([197.232.62.173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b0d06sm74361705e9.35.2025.04.05.04.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 04:26:45 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: rtl8723bs: use preferred comparison order
Date: Sat,  5 Apr 2025 14:26:05 +0300
Message-ID: <3534b660142c78e800e369c31df091625e61f844.1743851473.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743851473.git.karanja99erick@gmail.com>
References: <cover.1743851473.git.karanja99erick@gmail.com>
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

