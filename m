Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3B1215F56
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743435537; cv=none; b=ch6uQ0itNKzj6F4ge6Y6Yx+IR+x6N96q+sN8wmdIjO4jpo8dNeXlB32/bupEDOBzm8F0XDmGjE7nGxmBfkwuUN57e++N9TsWBtc7eh/jtUm9Q1BE/ww9WM9AXnbM96JHQlBHiGm7OAnQQlzY1/IHV0A/t+hUcd5VdtX3/ksJxDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743435537; c=relaxed/simple;
	bh=XSmVkVeZdRqAgRBh6fbVg6tdGfHaB+Oq9/dh6pVnsnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=os/cqzP1DO9uu7QhUD9g6bdFdjt6ngGs72U4xaiNXQyGsLyAxB+k8U9I0W3V0R0tWQ+ODuHacKYdcgd1mIv3By92gV5IZkpz9UCnN/eJq6WXr41BQNntsNgKYry8EhT2DcMlu/l2jU1SWCXUDlJCeeokRWbtKynraocNhXCYPLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/iFSTOg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/iFSTOg"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so29096195e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743435534; x=1744040334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3cV2X3A/AFNmBG0lPkf6t+LeaV66zSVbYS9oBEkGpMY=;
        b=N/iFSTOgwbHCTLdDxhfPc5hwEasTUgSwLeO/xEGIWU5mk+27ej4vkAnukRN0HE9Ln1
         oncmBecE5dWDKhBvD1RaAKmZJ7gizWDfS5fBA5I4TZr709YCAjIjMu4apJDvGl3ekZ2l
         ifp3CIuWqe1EyKu3a7J7K+wddU+BK4L4tHTYiJXeAIMCbprU8UAwiHgkuxdwX9bpfaTl
         kvWdJHSHx6stL/Ppyu9pfgu16Ob6j+abHMY92M2zk/n+HpB6bme8Hro0lkkJAbGcS7Hg
         P1YVq5l9l192Z+7lYuzc0oEl+kmEa6iPUTioAmXuzbp2Rm0lkwg8cXvNbSozi3tL3bM6
         2Tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743435534; x=1744040334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3cV2X3A/AFNmBG0lPkf6t+LeaV66zSVbYS9oBEkGpMY=;
        b=CqMhMTkE5MjqlaA6RK/kCkaFvwvZDc7bCKbRdvkApbln7o3pxQzI5EVAcSktckqAt/
         WwO7XmV3Af1ybChbZ8KwyYhFYEVqfijZy+dNK+gn39w28kSca9pSQmvfINQXAxPcEPXl
         7MmfTbnP8OZMqG9+ZyRh16R08aI4TM/Ghu/HrvYF7n3zyeZsFISL17Nenvmfskn+qgGh
         vpmUs068/PVCzW5jM6cy47KYUyscob81docy6QJMz3X9QJfFnZpCqBSkRlld8Mwb/WUK
         b1XCtwZQGZqNjXdZCvOtBd1HWDloi6iEhTWGsMkNxZR0kJYnfmhlxavoEVOWLPOHnx6q
         ntgg==
X-Forwarded-Encrypted: i=1; AJvYcCWmthfF2zblwTiQl36rc4i1BAl6Uy/UfKxjbmS9lLo/wz5RO2SCs1R+o9fGHB6MmBvZhQaMVUZVIlN2k/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu7rB5Tf7pGM6/Cr6AOhcIjZwGlkNbBZHkes0rA8261GVPDpzo
	t2eX7tNhuJP6JIHY/Ulf80Rly9mBZinNsdK9f+NbM7Kcn+40R4Qz
X-Gm-Gg: ASbGncu+C0Nmn32kjnSz+x4N+Azc5fRdbfZbPSh3WMZFTM4M10p9UoMvJNO/Wf36BnM
	zLnzIbehdvw74YqRRFtJKbxtJhY8n+5O4pqJQhhpO7WXB6sOL+xOMB7h4rpbKhgs3vPRfmcFzFl
	8rWCWbUgzFRZWJeS9aEfZ/LvKYwuSVQWqNwbnlnZU1LLJWijvo233RoJzOxaB4m/R3LCyU3FJVE
	xeJJtQyFtq8tntQQCJCEaxMJnve9gUsVvx0H57dttbTwYuRFNwnsUW+PIx/9seSx3Ga+i4jrCdg
	Y3GWMpmRq+X/5KfgFxRCQast1yE0UHUywU0FEfw=
X-Google-Smtp-Source: AGHT+IFHxPVBCNkh80Wi3fPvpwcdrU6K0fcLb5jPOJqwVZV5BBIXRjafmwnPOTESjluqIx/0l5a7hA==
X-Received: by 2002:a05:6000:240a:b0:39c:1401:679c with SMTP id ffacd0b85a97d-39c140167cfmr6806416f8f.21.1743435534196;
        Mon, 31 Mar 2025 08:38:54 -0700 (PDT)
Received: from pc.. ([41.206.42.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6588d0sm11419167f8f.7.2025.03.31.08.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 08:38:53 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH 4/5] staging: rtl8723bs: no space before tabs
Date: Mon, 31 Mar 2025 18:37:57 +0300
Message-ID: <f4e52e87e0dbaf4c728bd0d2a2c641e8d465edd2.1743434232.git.karanja99erick@gmail.com>
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

Remove spaces before tabs to comply with the Linux kernel coding style
guidelines. Proper indentation using tabs improves code consistency
and readability.

Reported by checkpatch:

    WARNING: please, no space before tabs

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c | 42 +++++++++++-----------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 9105594d2dde..b0e023d0435c 100644
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
@@ -401,9 +401,9 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getType, void *pOutBuf)
 
 	case BTC_GET_U1_MAC_PHY_MODE:
 		*pu8 = BTC_SMSP;
-/* 			*pU1Tmp = BTC_DMSP; */
-/* 			*pU1Tmp = BTC_DMDP; */
-/* 			*pU1Tmp = BTC_MP_UNKNOWN; */
+/* *pU1Tmp = BTC_DMSP; */
+/* *pU1Tmp = BTC_DMDP; */
+/* *pU1Tmp = BTC_MP_UNKNOWN; */
 		break;
 
 	case BTC_GET_U1_AP_NUM:
@@ -561,7 +561,7 @@ static u8 halbtcoutsrc_Set(void *pBtcContext, u8 setType, void *pInBuf)
 }
 
 /*  */
-/* 		IO related function */
+/* IO related function */
 /*  */
 static u8 halbtcoutsrc_Read1Byte(void *pBtcContext, u32 RegAddr)
 {
@@ -772,7 +772,7 @@ static void halbtcoutsrc_FillH2cCmd(void *pBtcContext, u8 elementId, u32 cmdLen,
 }
 
 /*  */
-/* 		Extern functions called by other module */
+/* Extern functions called by other module */
 /*  */
 static u8 EXhalbtcoutsrc_BindBtCoexWithAdapter(void *padapter)
 {
@@ -900,14 +900,14 @@ void EXhalbtcoutsrc_IpsNotify(struct btc_coexist *pBtCoexist, u8 type)
 		ipsType = BTC_IPS_ENTER;
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
+	/* halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_IpsNotify(pBtCoexist, ipsType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_IpsNotify(pBtCoexist, ipsType);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
+	/* halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_LpsNotify(struct btc_coexist *pBtCoexist, u8 type)
@@ -952,14 +952,14 @@ void EXhalbtcoutsrc_ScanNotify(struct btc_coexist *pBtCoexist, u8 type)
 	}
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
+	/* halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_ScanNotify(pBtCoexist, scanType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_ScanNotify(pBtCoexist, scanType);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
+	/* halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_ConnectNotify(struct btc_coexist *pBtCoexist, u8 action)
@@ -978,14 +978,14 @@ void EXhalbtcoutsrc_ConnectNotify(struct btc_coexist *pBtCoexist, u8 action)
 		assoType = BTC_ASSOCIATE_FINISH;
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
+	/* halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_ConnectNotify(pBtCoexist, assoType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_ConnectNotify(pBtCoexist, assoType);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
+	/* halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_MediaStatusNotify(struct btc_coexist *pBtCoexist, enum
@@ -1006,14 +1006,14 @@ void EXhalbtcoutsrc_MediaStatusNotify(struct btc_coexist *pBtCoexist, enum
 		mStatus = BTC_MEDIA_DISCONNECT;
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
+	/* halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_MediaStatusNotify(pBtCoexist, mStatus);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_MediaStatusNotify(pBtCoexist, mStatus);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
+	/* halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 pktType)
@@ -1037,14 +1037,14 @@ void EXhalbtcoutsrc_SpecialPacketNotify(struct btc_coexist *pBtCoexist, u8 pktTy
 	}
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
+	/* halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_SpecialPacketNotify(pBtCoexist, packetType);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_SpecialPacketNotify(pBtCoexist, packetType);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
+	/* halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_BtInfoNotify(struct btc_coexist *pBtCoexist, u8 *tmpBuf, u8 length)
@@ -1055,14 +1055,14 @@ void EXhalbtcoutsrc_BtInfoNotify(struct btc_coexist *pBtCoexist, u8 *tmpBuf, u8
 	pBtCoexist->statistics.cntBtInfoNotify++;
 
 	/*  All notify is called in cmd thread, don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
+	/* halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_BtInfoNotify(pBtCoexist, tmpBuf, length);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_BtInfoNotify(pBtCoexist, tmpBuf, length);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
+	/* halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_HaltNotify(struct btc_coexist *pBtCoexist)
@@ -1102,14 +1102,14 @@ void EXhalbtcoutsrc_Periodical(struct btc_coexist *pBtCoexist)
 
 	/*  Periodical should be called in cmd thread, */
 	/*  don't need to leave low power again */
-/* 	halbtcoutsrc_LeaveLowPower(pBtCoexist); */
+	/*  halbtcoutsrc_LeaveLowPower(pBtCoexist); */
 
 	if (pBtCoexist->boardInfo.btdmAntNum == 2)
 		EXhalbtc8723b2ant_Periodical(pBtCoexist);
 	else if (pBtCoexist->boardInfo.btdmAntNum == 1)
 		EXhalbtc8723b1ant_Periodical(pBtCoexist);
 
-/* 	halbtcoutsrc_NormalLowPower(pBtCoexist); */
+	/*  halbtcoutsrc_NormalLowPower(pBtCoexist); */
 }
 
 void EXhalbtcoutsrc_SetAntNum(u8 type, u8 antNum)
-- 
2.43.0

