Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023AC20E01D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 17:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743526823; cv=none; b=B7zWFT/cwnEkxciOzfM0fpWT+V92VPcuHwnfECiSAZ6upi+mV2vg06KXouLllaIbEzlyqzVAjPLdU0FYpled3Was7mbsZXf6H9Rr+R5padW5oo4CMhcE0LuF+Aw/1vxxSE5vQF8OBcJSYE/tyI1puvSBKxY15MmwbknUBJJq1wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743526823; c=relaxed/simple;
	bh=70T7ff+cvTgy9HmQcmQ+w6+CJzqiILA3azoHraLtg/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tdx28fYkHgjkvITzfb0MZwZ5rNKRTVnAK6jDmVCwD6NTiMGY8oarYpOCqfypafbVdBkVIQ4bv52Y0y9dE6A38233EtB4F+KHU0Z8n7sjdujvpkPVxzaLml3JNVZ0erZckiFfxbnkRjtFNmXMKjUgAV9k3KREBaoyl9TY7uKrv40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsVq+tzB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsVq+tzB"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so40814705e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 10:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743526819; x=1744131619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvVOyjDeuKJzEI0Ln+MX+oZNgFkv015EO/qfO7rmFtM=;
        b=RsVq+tzBYr0pi2Xv7dRzYBnzicsWplXUh3WUhsJmZ2AXbZTFggomHzvyF7gO7Wjz17
         FYEhzpumb45Bsa8aITD1oQaRezqf3r5pIpOumwxSYIzqsLifxqgW02flANqb6CSb1ig9
         0PmJ8752rlAuoHYkXWaIoZ563Hea902tBtfbvCqswrjN8hRVDwk1HNZQCKfEgI5lZHYs
         RQvIEmZKvXBL2NvRld/LbPvFuCrtlHmYgWte19ujUs6aHLvD5oa+3drN5ybxb0YgPW42
         sKm+AveDzrzUpMk9AUx3YqPBomQCQg50Zwp8MduEe6TJZITxXW42Kpl8P2hdTPbETQQr
         jh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743526819; x=1744131619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SvVOyjDeuKJzEI0Ln+MX+oZNgFkv015EO/qfO7rmFtM=;
        b=C4nR1B6sfA6Q8xQf3blrlef06F8swcwNh7wNzp3kPuEtSZjEF/Em6RkSxkKQ0/xOSI
         qv9w/7DzjTG7WlgkebsFDCDK8sqNW6zx8/Kdv0hhk/0Tu5F5cHkdRV4kzRllEZQpAdZt
         EeqdY/hQ8Zb/As3qKL04WDlsIs3wEc15vcvRS+XsUMevNyPqKUB7S9wAVjVzz+7zvhHT
         dNg6v99K2E991f+IKf6hFcxF1QmDJ1okVdL7DsuOAPu6hN/8CeMKD0crwEs0fGxYfaPi
         cEy/yeCzSiVYL3bgvtQfxOQckglveHGyTWLuEBg4b/BmrtqUksh3SMEIzn92A6gznnvS
         zmoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmLuqcpj7qukuP5tdl7LxIoMWtJyx1tjmh0c629UFeRUm5s48qaKhbcIrvdkPq+ssdCoTZo3JP9h2Hdvk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3/7qUaxf2Pldo19E8wxgZ4NRZyvx9kA+9NsYfxD5KHRy2N1Xs
	DyNMdFNBkHmfc4B6yJ75C6PMNaIzgypUC9MQ+b+OEgW09WNQnGPz
X-Gm-Gg: ASbGnctf2QC62sDdd95O3eZ6c8S4Hv6GJeByVdnmnlHDl+Pm429OhMtykaAO6puEvh7
	SSCIJPwGo6vtBEOcRkeQdy0wnAJZgFoo3UCOH9I48l/W6Q+8ZCAcx9aShr7VlLYuCirIC5SkID0
	ztKxNNbxdCWcapFDPUyE6wUeAK+l8hLX+BChdqRTpnix9799K8c0FnbyXKYTW/Bfzo3AkEZ7lWF
	0wlkDgn2diIJXp8a44BxujbR+xqLNPNyiR3yEmkcMr3iuluOaxp0Xv+zd0jOXuaQZwVqjnftowj
	0QO3rc4WccTEWMm5Ly9budMzVCFrz4m9NvGM7XI=
X-Google-Smtp-Source: AGHT+IGk+Bp+mzmPj2lLL07JX/Nje7UXGMoiYywoqCB+dnmAXU2NQBOf6gLoy73xAVKKjLFPffdhZw==
X-Received: by 2002:a05:6000:4282:b0:391:3bba:7f18 with SMTP id ffacd0b85a97d-39c120de348mr11435921f8f.12.1743526819194;
        Tue, 01 Apr 2025 10:00:19 -0700 (PDT)
Received: from pc.. ([41.206.42.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fccfe2fsm161520215e9.22.2025.04.01.10.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 10:00:18 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] staging: rtl8723bs: no space before tabs
Date: Tue,  1 Apr 2025 19:59:37 +0300
Message-ID: <4e39b1295d68aea947aa5757e3148a2e401b72bc.1743524096.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743524096.git.karanja99erick@gmail.com>
References: <cover.1743524096.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove spaces before tabs to comply with the Linux kernel coding style
guidelines. Proper indentation using tabs improves code consistency
and readability.

Reported by checkpatch:

    WARNING: please, no space before tabs

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c | 33 ++++------------------
 1 file changed, 6 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 9105594d2dde..44f73baf1cb4 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -9,14 +9,14 @@
 #include <hal_btcoex.h>
 #include <Mp_Precomp.h>
 
-/* 		Global variables */
+/*Global variables */
 
 struct btc_coexist GLBtCoexist;
 static u8 GLBtcWiFiInScanState;
 static u8 GLBtcWiFiInIQKState;
 
 /*  */
-/* 		Debug related function */
+/*Debug related function */
 /*  */
 static u8 halbtcoutsrc_IsBtCoexistAvailable(struct btc_coexist *pBtCoexist)
 {
@@ -84,9 +84,9 @@ static void halbtcoutsrc_LeaveLowPower(struct btc_coexist *pBtCoexist)
 	ready = _FAIL;
 #ifdef LPS_RPWM_WAIT_MS
 	timeout = LPS_RPWM_WAIT_MS;
-#else /*  !LPS_RPWM_WAIT_MS */
+#else
 	timeout = 30;
-#endif /*  !LPS_RPWM_WAIT_MS */
+#endif
 
 	stime = jiffies;
 	do {
@@ -401,9 +401,6 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getType, void *pOutBuf)
 
 	case BTC_GET_U1_MAC_PHY_MODE:
 		*pu8 = BTC_SMSP;
-/* 			*pU1Tmp = BTC_DMSP; */
-/* 			*pU1Tmp = BTC_DMDP; */
-/* 			*pU1Tmp = BTC_MP_UNKNOWN; */
 		break;
 
 	case BTC_GET_U1_AP_NUM:
@@ -561,7 +558,7 @@ static u8 halbtcoutsrc_Set(void *pBtcContext, u8 setType, void *pInBuf)
 }
 
 /*  */
-/* 		IO related function */
+/* IO related function */
 /*  */
 static u8 halbtcoutsrc_Read1Byte(void *pBtcContext, u32 RegAddr)
 {
@@ -772,7 +769,7 @@ static void halbtcoutsrc_FillH2cCmd(void *pBtcContext, u8 elementId, u32 cmdLen,
 }
 
 /*  */
-/* 		Extern functions called by other module */
+/* Extern functions called by other module */
 /*  */
 static u8 EXhalbtcoutsrc_BindBtCoexWithAdapter(void *padapter)
 {
@@ -808,8 +805,6 @@ void hal_btcoex_Initialize(void *padapter)
 
 	pBtCoexist = &GLBtCoexist;
 
-	/* pBtCoexist->statistics.cntBind++; */
-
 	pBtCoexist->chipInterface = BTC_INTF_SDIO;
 
 	EXhalbtcoutsrc_BindBtCoexWithAdapter(padapter);
@@ -900,14 +895,12 @@ void EXhalbtcoutsrc_IpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 		ipsType = BTC_IPS_ENTER;
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_IpsNotify(pBtCoexist, ipsType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_IpsNotify(pBtCoexist, ipsType);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_LpsNotify(struct btc_coexist *pBtCoexist, u8 type)
@@ -952,14 +945,12 @@ void EXhalbtcoutsrc_ScanNotify(struct btc_coexist *pBtCoexist, u8 type)
 	}
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_ScanNotify(pBtCoexist, scanType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_ScanNotify(pBtCoexist, scanType);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_ConnectNotify(struct btc_coexist *pBtCoexist, u8 action)
@@ -978,14 +969,12 @@ void EXhalbtcoutsrc_ConnectNotify(struct btc_coexist *pBtCoexist, u8 action)
 		assoType = BTC_ASSOCIATE_FINISH;
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_ConnectNotify(pBtCoexist, assoType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_ConnectNotify(pBtCoexist, assoType);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_MediaStatusNotify(struct btc_coexist *pBtCoexist, enum
@@ -1006,14 +995,12 @@ void EXhalbtcoutsrc_MediaStatusNotify(struct btc_coexist *pBtCoexist, enum
 		mStatus = BTC_MEDIA_DISCONNECT;
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_MediaStatusNotify(pBtCoexist, mStatus);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_MediaStatusNotify(pBtCoexist, mStatus);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 pktType)
@@ -1037,14 +1024,12 @@ void EXhalbtcoutsrc_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 pktTy
 	}
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_SpecialPacketNotify(pBtCoexist, packetType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_SpecialPacketNotify(pBtCoexist, packetType);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_BtInfoNotify(struct btc_coexist *pBtCoexist, u8 *tmpBuf, u8 length)
@@ -1055,14 +1040,12 @@ void EXhalbtcoutsrc_BtInfoNotify(struct btc_coexist *pBtCoexist, u8 *tmpBuf, u8
 	pBtCoexist->statistics.cntBtInfoNotify++;
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_BtInfoNotify(pBtCoexist, tmpBuf, length);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_BtInfoNotify(pBtCoexist, tmpBuf, length);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_HaltNotify(struct btc_coexist *pBtCoexist)
@@ -1102,14 +1085,12 @@ void EXhalbtcoutsrc_Periodical(struct btc_coexist *pBtCoexist)
 
 	/*  Periodical should be called in cmd thread, */
 	/*  don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_Periodical(pBtCoexist);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_Periodical(pBtCoexist);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_SetAntNum(u8 type, u8 antNum)
@@ -1119,10 +1100,8 @@ void EXhalbtcoutsrc_SetAntNum(u8 type, u8 antNum)
 		GLBtCoexist.boardInfo.btdmAntNum = antNum;
 	} else if (type == BT_COEX_ANT_TYPE_ANTDIV) {
 		GLBtCoexist.boardInfo.btdmAntNum = antNum;
-		/* GLBtCoexist.boardInfo.btdmAntPos = BTC_ANTENNA_AT_MAIN_PORT; */
 	} else if (type == BT_COEX_ANT_TYPE_DETECTED) {
 		GLBtCoexist.boardInfo.btdmAntNum = antNum;
-		/* GLBtCoexist.boardInfo.btdmAntPos = BTC_ANTENNA_AT_MAIN_PORT; */
 	}
 }
 
-- 
2.43.0

