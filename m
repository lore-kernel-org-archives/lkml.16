Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4C913AD1C
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 13:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746104641; cv=none; b=isXA2HgEztLexIE/uMvTiVfLOp8QqQzY5oKEjj4rj9B4xq/pzM/ZbmrZQIkbAYMFh9yoMVIqhw9WT+HzyW3GUOtcPSKgODJ0+gbknk4O13c2IP8g+ThNADHFiThVevZXAkd7a4CbZnlG7yqxObxp373gsJ+eafAtD1LcbKKURWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746104641; c=relaxed/simple;
	bh=nKVLqKLmJJfRIGBCWAGgjHCyy4TQubGRwOKP7zHGUHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sC6vqT4ZZquB9MB0viHBlDiCLBrGhBqjl325Mv+0PV9GHTwKHHq5GgNx+URVjzIcjXa/Vl0IIa6PojIq08PLdeUIocW/4g3cyIPTYSI9WwXgxDxtsQzMbn1Vcxzx30OFURUsQWBERW7qXfqex7vDLoclP3SbKobP1338+2zskU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2V50OzX; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2V50OzX"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-391342fc0b5so421253f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 06:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746104638; x=1746709438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tLp6G69AjGMZh/i0hYBrG+us2tPn51T4tZ/hDIBrtE4=;
        b=R2V50OzX6qetgzRMcNePRoJUiTSj/GBKCHlscgzIL8M9Zzcmwe7tWYAqGUWtx7WOZW
         XQuvAjRaxDCINvPUVUay9HdGr72j7rTDV81Blx5nRjxwhE97UC5XZVCzrLWl5MhKRQGI
         sabrhc0MjFwNnmHWuX/aCaFLV6HzANPKZOYdX88BjF1Y6MRyZsG9XV8Tk1YPZC+CqQ+y
         d156yw1Tt0+3DTnZdR19NxDnUOLln+2/a9LkfJp7qo9Nt1KfvQS5RhWybvEz2T6RgOdA
         zfgusgej/MfOWfsTL2UqW6t4c+URbWr2RevCA0zhezV3fReT6VzlaabEvhVKlCqq3IEe
         Dzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746104638; x=1746709438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLp6G69AjGMZh/i0hYBrG+us2tPn51T4tZ/hDIBrtE4=;
        b=X+c07A8lEK7M5fTzrpVcCRzr1RYOGiEyLnoqN+SORhcVPbov/p2+T37iOF+YO4jX7m
         C/Slvwp6k3/4BBvYOSNQMH1PJZ9i+WoQH3MvHwIW9Wzj6/GwWxsrSskjCSISl3jGOPVo
         Hw5jo1IfdkfIr8r0xXJGPXSjXU3t8+wLEahnRvHGAQ9FT8l1fXcNvyhhTOYF4L8eSLHm
         fV+A7XpdjnB66XYspIjZXVmrHjOgCE2y4m24CDV8K5/x+iNJQmq+sFcsYZ7+dZGd0m2U
         ShRgt2mO3aVQ1g/GfG8Aj1fPfLCc4UpHNpow493YTk7zqmrbdhpT6kRO+Zuy7LmkqFCf
         5dQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyhklqK5HtCxxVpsoHI/OJFuDLlcwiBEEmwqOl88Vgbr/XR0lPuoKkytvSi3ueK+cnDacG5RlITxUMEOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxhfjVBCLvN9DuVjIV6FEWIHUGL3L3Irs1pj4BaqcYowj00bhp
	Y0F1xp+jX55yEgsqTC00yDwGKrToZg0jILqSrbiiaAFwMa34xLk+jVg6LGem
X-Gm-Gg: ASbGncvtTOhZ6ao6ZBsq43vF2dNifQCWpmsIIo51dyA6+8a19qBvdPm/QmCR372eirw
	V9e/M1rCDdqGrlK5z3MSyUX3pf4IacvOFH0ZTFe6rxZdsZbHmNOYuiDoxJ6QhRQ6GyvNUm8kUqV
	ahLDD9YwIZHmxHk69aRb6LhfPTB4f51QYbbMSUgcQgdUsU7J9ah/670lfRQIcgEKZw3Ho93mWZH
	ZR7DOE8+PbztztIcH+l4V5G7zzXDj9E1OJkzYVe76tV5kINkUXhbwWjBJKefRH1e/J/rA0+tyn/
	pr7kVfwk8D4TW/EPhtsnjScujwS30Kn4SMF0NukIqpjGIKVWSuPPoCQzQ7bq
X-Google-Smtp-Source: AGHT+IHN0m78X3MUvAMXKykuMAkM3TbruwNqjk1r7kAdw4UWFKm3it44VrZLXWxJYGsg9ZIawYZjxA==
X-Received: by 2002:a05:6000:310f:b0:391:3f4f:a172 with SMTP id ffacd0b85a97d-3a08ff4fca9mr5109558f8f.49.1746104637846;
        Thu, 01 May 2025 06:03:57 -0700 (PDT)
Received: from localhost.localdomain ([37.72.3.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a3e04asm830880f8f.18.2025.05.01.06.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 06:03:57 -0700 (PDT)
From: mikisabate@gmail.com
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Miquel=20Sabat=C3=A9=20Sol=C3=A0?= <mikisabate@gmail.com>
Subject: [PATCH] Improve Kconfig help for RISCV_ISA_V_PREEMPTIVE
Date: Thu,  1 May 2025 15:03:09 +0200
Message-ID: <20250501130309.14803-1-mikisabate@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Miquel Sabaté Solà <mikisabate@gmail.com>

Fix a couple of spelling issues plus some minor details on the grammar.

Signed-off-by: Miquel Sabaté Solà <mikisabate@gmail.com>
---
 arch/riscv/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 1fd197afd2f7..3f40e33bc115 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -664,12 +664,12 @@ config RISCV_ISA_V_PREEMPTIVE
 	default y
 	help
 	  Usually, in-kernel SIMD routines are run with preemption disabled.
-	  Functions which envoke long running SIMD thus must yield core's
+	  Functions which invoke long running SIMD thus must yield the core's
 	  vector unit to prevent blocking other tasks for too long.
 
-	  This config allows kernel to run SIMD without explicitly disable
-	  preemption. Enabling this config will result in higher memory
-	  consumption due to the allocation of per-task's kernel Vector context.
+	  This config allows the kernel to run SIMD without explicitly disabling
+	  preemption. Enabling this config will result in higher memory consumption
+	  due to the allocation of per-task's kernel Vector context.
 
 config RISCV_ISA_ZAWRS
 	bool "Zawrs extension support for more efficient busy waiting"
-- 
2.49.0

