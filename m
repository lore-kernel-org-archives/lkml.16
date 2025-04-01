Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5432820E03F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743526800; cv=none; b=XSc0/+f2+rP5j+9/Rod/RsFb+8CEJELuJDdk5KpWbHcWP23NMToKqvFxJRME6UUpvF0qpjTMCLWeZdg5GeWjb++87xLkY3/zS6562HMWAfnDsflVVy9329zQgrWpMuSCKfRsuKoRwOXc6WjMAxcVcB4ZipPzsPbiv8AUmDNc6wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743526800; c=relaxed/simple;
	bh=aOOWiCI3ZK6+dzDuMUQZ7ZuRMibgi+DohpZfmHWxiow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XBT5LEzECFIyed21xsstJcwPJau0J3o0rPFkRJqsnklIvhInwClb/bASL8LDTdZehBkrYdY0fLiLaX8q6huf5KkAjtNksYCZIa5I27Me0Vz/ouOEjTHXqEbsIoA7Cx4WdwM9xUIZBhDcdAcfX0wFf3IS/GaeP54g+t3KA4I5bZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ff/t4HHQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ff/t4HHQ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso58738765e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743526795; x=1744131595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pK/O4pDg7hGitdXCJDavzci3Ws7cE2OFjqh+I33m5qk=;
        b=Ff/t4HHQOMXCokeyw0cgk9Xez2roAdZY8WkaDJfFtc6WMsZLiNCMhu1BAb2li181+s
         eTis2JAhTpLrJW7Q6KnT58hUIFFnFLTBfglBLpARkdTTkcQuZFkJ3nE8lDetz8KwJoZ+
         /cebKyvFaWZakgMGv8XLvIette+58kYxNkb0yPMd7vSRUmMkWts2JKvX4lmg4KEMpZTt
         Kpm4+OEa2lmiCTcc/FvSNojWgP+urAJpi893UK3+Z4MahoemF7nRSR2p8fML3gkywvIF
         tysboRe1ccp8vzbZkFjetOnKk0oQP6prL/PjFDodQp7qD6MY7/yg4DEZo4HUyGc4CYkE
         SXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743526795; x=1744131595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pK/O4pDg7hGitdXCJDavzci3Ws7cE2OFjqh+I33m5qk=;
        b=QsRMtg5xIicg7IgQUqU97NTBG30HbQUlA7zCqPwMXe+lregOKzBIhKgu5L6Fq9/8gn
         fK9yQqOfW1z2646RusMhVnY3x1ZN2/wWcEbuAIODdiiZa0WfNsGGDUktjqQHAlHLendR
         6HE6Rh+OWmh/oLQGOV8V0hDmUDOCk9SmbyQ/P5KvtanhaHQoFsxQez9yJHhdXkUwWG+K
         dRYDi/moDq+5v7sLLIktIT3RQPrd62b2LlUpKTXnL5/f5EBpbDG/ZYj1jkpXJeTttOOv
         vFwZf6ZDIvgNZq/R5WjTDljJnRvcvsJ7DtRGwtAkRHPYIdYrPGWUhu1GWsF8bzI+x33q
         ewCg==
X-Forwarded-Encrypted: i=1; AJvYcCVPVgu2Ii/HExRqfV3DNh3Euf/eBFoGW0WAkSYGT+0KGg14H+TyWALj2bat7V0zdG0v8eAQ8LzHQkzOUo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWFZo9m3zpiL9vemv+lZ2R7FB5v64KqYxqmb2qgWN2FatmLR+T
	juP+bVQAmgq6cGEzrQzNkl+U9xOsLGcotpkbB9I5w+HYGvNQ66Cnr/8BIQK3c0A=
X-Gm-Gg: ASbGncvuTQmySEx9QXecrqRAjZmafKYzyCCAn9IUFNdBNRp+6ZvOCfgiSQclsyWzTa5
	25e6jr4iwvq1KDz+5ruo785MShP13jBUc10Bex8QsSQAumof3wng8IoUWhPoiHQ5nmcd7/s+w05
	49CTMkHZREB1+jtcavf+yJ8YEH0jWPV1sBTKIV+deiyNCNxNgiEkovKcDAftxS+QqC+ezW/UG80
	U54oh57p8WIXW+GUL1+BjUNR++7rseHJVsyxTfzzWn8QrnQohk3Hvf9uYY8ejU+cjh2ugA6Be8L
	bmRXKRZ+cqE+BroDo1kHJ593P5AFaQgdKrO8xhc=
X-Google-Smtp-Source: AGHT+IETbTzAYb/h3dIJZa9Z4oxluG5CHqg0acXlqJ9p0VnpANQt/7sWH8a0uAGyXN8MoYcjIgFbBw==
X-Received: by 2002:a05:600c:3ca6:b0:43c:fa0e:471a with SMTP id 5b1f17b1804b1-43db61d9cf5mr142340485e9.5.1743526795566;
        Tue, 01 Apr 2025 09:59:55 -0700 (PDT)
Received: from pc.. ([41.206.42.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fccfe2fsm161520215e9.22.2025.04.01.09.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:59:55 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] staging: rtl8723bs: use preferred comparison order
Date: Tue,  1 Apr 2025 19:59:33 +0300
Message-ID: <128b2c78fe04c358c96bff4a2fae1de8e7a6839d.1743524096.git.karanja99erick@gmail.com>
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

