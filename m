Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9A01BC3F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 12:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749989117; cv=none; b=YFcqxyQH/rv9qDYEpLiCSTKt/99Yl9BfAvfZzyYXkQG1NEJCgYwb1c0wt/LCZbatCwZ72AfqchT3325/pQNxxR67JZ1JN3hv7w1QCGyVwvn6l6IIYWsM4GAXj2hj7UK/IVea0beEbdw62KhzeVWbC0U4BmdLcznNjnR0Et8odkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749989117; c=relaxed/simple;
	bh=BFQom8CRsfX5+9eMLCdrsz8BwecPF8NjpitltozJt90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J7DUNcb/Eh1DqbOt4+xktvtnZo8kQ5R4VVSEYzwxZ0MHhbcdg71NolCi+XgDPs2M3s13AVuhr3H/KqTrvtwjP/m9yZGugCyKstSjgUGsp9lI1Vqq55NvZqEOmIvZr8yx6dZ21xwncbvnYzN8UDCCEcfJO9BXATemcLJO8VxFeeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+47ggTK; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+47ggTK"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-607b59b447bso6215458a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 05:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749989114; x=1750593914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Lv+MSsgBNOJHMMndsvJGs/aVKU1C3SCJjVTZh90PrQ=;
        b=W+47ggTKnykjhlmtB0zo9jfWnR6BMD8fjkVpmU/SefUMCWcWqxabFbLA4U0tXdx28w
         BwwDBF4y9IOdxaIZE7HtQJCsXwO4QNlq+Ml5mrg3LU9nGtIRiTsk7ToaHS73kW5LfkTa
         5D1TMdwmR04NHGoRZrDyfUeG5zswzzhUxcg/hqTwatHMAYTuWreSnsGC3KWG80Aj0yIN
         +UnItEk7Tx/YGBI20ZQn3zojy7QrPs+iwefU/ssYLjktvAcmuhw3rqy3AyG/NbXfztfx
         otDTY0T6UnvQuJ+xbHZMwj4sz/hLBnemAd9Q4Hck0Nl61k15Sc3eR5gis8On8tLu6Ttc
         gg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749989114; x=1750593914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Lv+MSsgBNOJHMMndsvJGs/aVKU1C3SCJjVTZh90PrQ=;
        b=wTQ/v4Zug1hlcPqVsQi2VYK3WoMvTUf83mDV0SfXGQFYlJVCPdd14PprvyJRTfjdus
         pO/4W4yaVQPt2w8VfZVgipBepYdqZOUdtWR/0251/tJ/qleqgePeecVZabgIp6gbbHhb
         MxaeSO2PWWFhxOz22wjYEA7NJvFrz2UcfUx+7c1i2/LHYQyKonqbW30lvN/IzJ61ezMJ
         dA7XEb5ej5k1SgHRwLX+ORmrbMV1EEV2ex0o0S9b+nYaxD1iHFHuBZdN4Z/lvAtp4Kb3
         p0mj41qiOms8Nyzm9GaHrbs0FF9WyCCsD2bAWnnyUUJi5UgOJdVaXv0AJAJOB2719M2h
         cA+Q==
X-Gm-Message-State: AOJu0Yw14qXnb0L6fRgPg98Ze2+q20QwHvvrnPYorHqhHs5XX16odjqY
	H3auK0eywrI4UtX4t+2udQItQKE5FCEoQUye8R/OknxryrApOOAsxxZC
X-Gm-Gg: ASbGncsWteK1cyJJiKBSwpeQq+Eb1SlKWk0nCuGZpXhH4YxrIIETpWoLwKNDAZeigXU
	VPEAtBPgXMjq1VFX2+Eoddi3fm1YezRm6Acgq02Dxkxx8VWsq/tuP7nEniJBtHNShnNcG0Uuw39
	q730ajat+8najGKPLG3BQJzz8+Un3tkDahQYGDzewss5AuOBr7zuIKn6S74qeGbSzFtu6fS3wW+
	9JSExp5L8yEuITUIYWtM/yHzQBC3fAEMtRjxRVYBPitrsN7zgCC5e4p91jrdHKY8CUxFxKbGsVg
	UNJIYzix7225Zn1DdSLYo6F00b00SiwWQ5vSVSB9y+F7w8jgcjo2iY39C0H5apnE8kJpKtM2VGQ
	SgnAR6z/lSxy7
X-Google-Smtp-Source: AGHT+IEz2BRhj2e2JFOilbrIz3NUtIlZ/4xtR9DWHFx0KVc2OSxb4tij3Q4MxiGTj9FLayHQqs8NMA==
X-Received: by 2002:a17:907:3da0:b0:adf:7741:ba61 with SMTP id a640c23a62f3a-adfad31f820mr552625966b.14.1749989114227;
        Sun, 15 Jun 2025 05:05:14 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec892b63fsm464279566b.128.2025.06.15.05.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 05:05:13 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Khalid Ali <khaliidcaliy@gmail.com>
Subject: [PATCH] kernel/entry: Remove duplicate function documentation
Date: Sun, 15 Jun 2025 12:04:26 +0000
Message-ID: <20250615120429.1496-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move exit_to_user_mode_loop() documentation to "entry-common.h",
above function prototype for consistency and remove duplicate
function doc.

Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
---
 include/linux/entry-common.h | 2 ++
 kernel/entry/common.c        | 5 -----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index f94f3fdf15fc..dad1f257e3dd 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -302,6 +302,8 @@ void arch_do_signal_or_restart(struct pt_regs *regs);
 
 /**
  * exit_to_user_mode_loop - do any pending work before leaving to user space
+ * @regs:	Pointer to pt_regs on entry stack
+ * @ti_work:	TIF work flags as read by the caller
  */
 unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
 				     unsigned long ti_work);
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index 3e9f2d40230f..67df77732fd2 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -81,11 +81,6 @@ noinstr void syscall_enter_from_user_mode_prepare(struct pt_regs *regs)
 /* Workaround to allow gradual conversion of architecture code */
 void __weak arch_do_signal_or_restart(struct pt_regs *regs) { }
 
-/**
- * exit_to_user_mode_loop - do any pending work before leaving to user space
- * @regs:	Pointer to pt_regs on entry stack
- * @ti_work:	TIF work flags as read by the caller
- */
 __always_inline unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
 						     unsigned long ti_work)
 {
-- 
2.49.0

