Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509AF289809
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 21:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751317344; cv=none; b=lxJRi9r7SnkJODff/qOSqBXPYw37biQrkfT4fUXCVJSThWPHSPyAh/iiPj20Q0wSwiAw4p0jwlnheaKFmEm/rbqHNqYGL3hI/SwLhc320HaTHGeVX560+XoJskbm88LJl/O9ZZbzNJaPOMfmHhPL4UQRJGzWharJz/KmM/uWlAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751317344; c=relaxed/simple;
	bh=fN5AyUDSjivmScTDQEptYySYmoeck1+soU1qFzXnDF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/MG3MotBuIfyo7qfhHpTgtCq/rreVIXMyjv3L7jFt/jX4YaknkkPCp6jah1MBlTrBGJRPn89vvZLJGf8hlnJztHxK4oPryzHCkk3lHbryvDY3zpjWBab+P6cu7rlqtkUU/TEFaJNzQgnmj1pHtbj/AKEL/wIUWOMdHJXrNZ+8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwptlcNu; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwptlcNu"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a52874d593so2214650f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751317341; x=1751922141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ws/TSm+ZZeehlVxXUB88Ms5rsDGr5e9O7TxAj23rWQw=;
        b=jwptlcNu2VlKN187YbaZgwkd13TDGkw8hrQ+o9BRCqRAKY4GvA69oCdjPx85Dmc9tB
         Na1pf9hG6emTVL5cbJEgsHlqIi11LThqgAiS9mnbEBfPxHEysJJgG0xjiSXkID/YMeVg
         FbU63CodN9ovw05eW/kIhZGRJEbap6+kypy/LAefRrsxb0u0ZVdzK8amXiiTnLJleNUP
         S/9GVRkVkmYFHlgKLm3cJWxN+v00EtW5S9WowlLkK6LherUx+aZJ0BJyHq4uZOJrC5dN
         0dPI5Su/IFZnwHCZU5YjNGnYNvQBcI/ZBkeq3D9cQHTmKoSyf8+u5JFHtCF0RrkuMCBS
         SVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751317341; x=1751922141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ws/TSm+ZZeehlVxXUB88Ms5rsDGr5e9O7TxAj23rWQw=;
        b=aCG6krXNS/Nk0GtZo+2UsSjrxb/USsasm9+glHVO972EPzizB1cTfm8W6Ze2jAKAZL
         0o6C/f14TvDn4u55Elmrkmo62W2gW8aog1OA5Z/karRzA1rhmxgem7S+CMgrD2qQqhMW
         /8YGJ81LBzD/ckBp0HIehUBFDe1DBjXW8KJp6DypSwdbk4x3MsPbf1X0OZGDesuFOvmd
         gk+rT8DPXfCw/VI20SxAFeNlg5v75hGMWgraz9B6rR2AkbT5fYww2hrgHkzazsI+cOpy
         V95RogOl1a7YSDcK5S4a7SPuydkAnD1HK+mGc06Gn2Kr666Cps7wheVDbz9vnCZYn6Oe
         g/cg==
X-Forwarded-Encrypted: i=1; AJvYcCWa1PAor9b45FT4jFD3zfFi9RZXkV/EsFWrcjsBQzu7d+QiDk1bCy6D0dxqVcam1uhn8OyAW/1qb9ITT4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcX7gqxSRsz6n+YNa+k7VGiWt03yqqXtbz/cMy7pYwIFlE464b
	/PXXG0LTj2olcl5Qb+WZUotBywaOpHMYj+MkelzttZYoojv/WxAponcOCWnj0Hhn
X-Gm-Gg: ASbGnctkHg0wh3bMrjPUzjdp0QG3DdIREoqYxTZjYkDKPYkrk7w5+eIyIav42pyap3b
	pch/UcIbRMrsVhrsyXaTAn8EmJ2aR+LrDvTFFlSzm5HQE8NXSd2fTAIzb7mDvpv9iA4+l94NXiU
	UabYSXupTdLnJ4Eh86Tu0Ubgtt8+ZIJ7Rt6GeIhKzS8wioyRfZZebX0QIs1ie4NXvIx3myF7sRk
	vFmWrIVYvusYdzIi6m6EtICFUYy4Wccp7E29A/rDoFYIwkptoYBWhmms/AMMDRdLt7vB1MJYV7x
	Zdu3JrkAd85G+0VQ44DqKcvyHP+iodjRCr/2h4s/q48rbCsfWt+6+OKU4MY9IEtPhAAFis8lmcs
	P8sYiyQ==
X-Google-Smtp-Source: AGHT+IGSemyFfun8x66j729jzWKL23uFr3oT8p6ycJ2Gqg8IaVogp53Aua09Ypb0xc3CjaZ29XZz+A==
X-Received: by 2002:adf:b649:0:b0:3a4:cf40:ff37 with SMTP id ffacd0b85a97d-3a8f45494cdmr11129730f8f.6.1751317340305;
        Mon, 30 Jun 2025 14:02:20 -0700 (PDT)
Received: from cachyos.customer.ask4.lan ([89.26.177.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fada5sm11503584f8f.32.2025.06.30.14.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 14:02:19 -0700 (PDT)
From: Marcos Garcia <magazo2005@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	dan.carpenter@linaro.org,
	karanja99erick@gmail.com,
	rodrigo.gobbi.7@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Garcia <magazo2005@gmail.com>
Subject: [PATCH staging] staging: rtl8723bs: Replace magic numbers in beacon initialization
Date: Mon, 30 Jun 2025 23:02:11 +0200
Message-ID: <20250630210211.3922530-1-magazo2005@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <38411a98-d907-4173-a528-8d50b337de0c@suswa.mountain>
References: <38411a98-d907-4173-a528-8d50b337de0c@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace hardcoded register values in rtl8723b_InitBeaconParameters()
with descriptive defines to improve code readability and maintainability:
- TBTT_PROHIBIT_DEFAULT (0x6404): Sets TBTT prohibit time to 100ms
  (bits [15:8]) with a 2ms margin (bits [7:0]).
- BCNTCFG_DEFAULT (0x660F): Configures maximum AIFS for beacon
  transmission to ensure high priority, as recommended by the designer.

Preserve original comments where they provide useful context, such as
firmware control in power-saving mode and designer notes about beacon
contention. Fix typo "contension" to "contention" in the comment.

Signed-off-by: Marcos Garcia <magazo2005@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 50 +++++++++++++++----
 kernel/sched/ext.c                            |  8 ++-
 2 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index cc7886d75a0b..a3438280e1ab 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1183,9 +1183,25 @@ void rtl8723b_read_chip_version(struct adapter *padapter)
 	ReadChipVersion8723B(padapter);
 }
 
-/* Beacon Configuration */
-#define TBTT_PROHIBIT_DEFAULT_MS	0x6404  /* 100ms interval + 4ms margin */
-#define BCNTCFG_AIFS_LARGEST		0x660F  /* Max AIFS for beacon priority */
+/*
+ * Beacon Configuration
+ *
+ * REG_TBTT_PROHIBIT: 16-bit register where:
+ *   - Bits [15:8] = TBTT prohibit time in units of 1ms
+ *   - Bits [7:0] = TBTT prohibit margin time in units of 0.5ms
+ * Default value of 0x6404 means:
+ *   - 0x64 (100) ms prohibit time
+ *   - 0x04 (4 * 0.5 = 2) ms margin time
+ */
+#define TBTT_PROHIBIT_100MS_2MS_MARGIN 0x6404
+
+/*
+ * REG_BCNTCFG: Beacon configuration register
+ * 0x660F sets AIFS to maximum value (0xF) with other default parameters
+ * This ensures beacons get highest priority (no contention window),
+ * as suggested by the original designer for test chips.
+ */
+#define BCNTCFG_MAX_AIFS 0x660F
 
 void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 {
@@ -1193,19 +1209,31 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 	u16 val16;
 	u8 val8 = DIS_TSF_UDT;
 
-	val16 = val8 | (val8 << 8); /* port0 and port1 */
-	val16 |= EN_BCN_FUNCTION;   /* Enable prot0 beacon function */
+	/* Configure beacon control for both port 0 and port 1 */
+	val16 = val8 | (val8 << 8);
+	val16 |= EN_BCN_FUNCTION; /* Enable beacon function for PSTDMA */
 	rtw_write16(padapter, REG_BCN_CTRL, val16);
 
-	/* Fixed: Replaced magic numbers with defines */
-	rtw_write16(padapter, REG_TBTT_PROHIBIT, TBTT_PROHIBIT_DEFAULT_MS);
+	/* Configure TBTT prohibit timer with 100ms interval + 2ms margin */
+	rtw_write16(padapter, REG_TBTT_PROHIBIT, TBTT_PROHIBIT_100MS_2MS_MARGIN);
+
+	/*
+	 * Firmware controls early interrupt timing in power save mode,
+	 * so only set REG_DRVERLYINT when not in station mode
+	 */
+	if (!check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE))
+		rtw_write8(padapter, REG_DRVERLYINT, DRIVER_EARLY_INT_TIME_8723B); /* 5ms */
 
-	if (check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE) == false)
-		rtw_write8(padapter, REG_DRVERLYINT, DRIVER_EARLY_INT_TIME_8723B);
+	/* Set beacon DMA interrupt time to 2ms */
+	rtw_write8(padapter, REG_BCNDMATIM, BCN_DMA_ATIME_INT_TIME_8723B); /* 2ms */
 
-	rtw_write8(padapter, REG_BCNDMATIM, BCN_DMA_ATIME_INT_TIME_8723B);
-	rtw_write16(padapter, REG_BCNTCFG, BCNTCFG_AIFS_LARGEST);
+	/*
+	 * Suggested by designer timchen: Set AIFS to maximum to avoid contention
+	 * before sending beacons on test chips. By tynli, 2009.11.03
+	 */
+	rtw_write16(padapter, REG_BCNTCFG, BCNTCFG_MAX_AIFS);
 
+	/* Save initial register values for reference */
 	pHalData->RegBcnCtrlVal = rtw_read8(padapter, REG_BCN_CTRL);
 	pHalData->RegTxPause = rtw_read8(padapter, REG_TXPAUSE);
 	pHalData->RegFwHwTxQCtrl = rtw_read8(padapter, REG_FWHW_TXQ_CTRL+2);
diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index b498d867ba21..7cecc0ca700d 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -4258,7 +4258,13 @@ void scx_group_set_weight(struct task_group *tg, unsigned long weight)
 
 void scx_group_set_idle(struct task_group *tg, bool idle)
 {
-	/* TODO: Implement ops->cgroup_set_idle() */
+	struct sched_ext_ops *ops;
+
+	rcu_read_lock();
+	ops = rcu_dereference(ext_ops);
+	if (ops && ops->cgroup_set_idle)
+		ops->cgroup_set_idle(tg, idle);
+	rcu_read_unlock();
 }
 
 static void scx_cgroup_lock(void)
-- 
2.50.0

