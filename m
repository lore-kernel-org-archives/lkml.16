Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43BD23B631
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 10:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750068214; cv=none; b=TBWRIe8vMtJ14d0+AfbelL/VUda5kfHg3UFKYRgp3VWUstqdAVla/fQoMJStvXCzxWD/ScbcEMfTMF/kq+N4bJHal6aR2Oa84ytSlWUsQg7G+5AgGfgHCv2FmCI8Lbjdu5JtqybfqHuuBHj0K6UWtj1uIEXlBZnEwpWtjadbRr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750068214; c=relaxed/simple;
	bh=PF7BZIoYDMyPRkvSdxJ7qUwkAa3baF64lOFIGdPHG8o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fjJHDSKdBa5xv3CLcCDZkrAkTfHKawRt7+Y8LbQ+Km4IHRieHTEk8+jK8m9HPiq8FvAhbOVMtSl12Co9XmdhAUbMi5o3mC2NIT0+vhx1hNJyxtUlSds8o6bQCIUXS7I98rzWxxYpEy0Y7+tQ5Qh93gXKcIThCB7CifbTrqCeEh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WiPB4+5o; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WiPB4+5o"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-234d3261631so28571565ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 03:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750068212; x=1750673012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iJ2MacCddp0V5gOqxFL2EbYLr6/fKZB7iWuwWhUYU38=;
        b=WiPB4+5oQRttYdra/XOhZnlT0J19sPXiwZIat6s+N6xkber8B0N7fcoK+XFDsxftNx
         P9f5viqR5ldN3d0V4kpZY+bc6lxT0Pwqt98kT0hyC03ZAwuxmmTi5W0Q1kgsGEJWuScz
         DnCfUOELbrC0J0igWwsKQWCWXPDCYpQ3bP4sOVAnv/K9oTODAa1g2EEbSjSm/5vx+0YA
         fi935e8yGnuTI2xTVcp0RKF7pUv4mTAr/6jYYztXpNqUxSl0IxMDwvup9Ymq/ND9kHj9
         TbuRHtABJ5WTGM8FS1fcMtLkxOXreQA6hONh+IvlEVC/QtXB7fG6sPSYVP51Uxga/whR
         WrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750068212; x=1750673012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJ2MacCddp0V5gOqxFL2EbYLr6/fKZB7iWuwWhUYU38=;
        b=iaxHpjg4TuNKPrdyPLO3c9++Thln3nZTl72gEdLEYUTkBWZHF/z6b2UUiZs2n9iAP7
         MIkxw7hTeFtWQNDps+V/CiSfO04pzGfSGgSAa3zryCAMlBzbYB0E2F4CSCqc7hDuHmjV
         ACKrBiv2l23ORzWGtFs7SRZhqzp0PonSjn9jbejEv3e346Nv1ZzD9MvPDa6uaQzqcX1B
         vYMgUbfC6+UyoHTvaSPJUR9qAqgB5sla1VzbeWUEvoaHsUnhk/gWN3tYTVpDHrzCXkCD
         hiX0Zx6a1SIdRQ7CDzCGQYLAloI4NkrGwkMRN0viII5EPrmFGMVfg1AkOb3y7us9JoF9
         617w==
X-Gm-Message-State: AOJu0YxDktfJygwmHL2awzOuf2XPgAWYGtg4fmoL6CDrtVrrhfrvoZMX
	Jmt8JPxoLIa9DxoLWJweoNyXi3mLKvFr1CN1rGQZLd+SVHiQ6cWkGA+x
X-Gm-Gg: ASbGncs30uGjkhlkxsuRj4BEA477vRjN6QioMakTUE8TwsdmNrBrkugRsPw53Del2nU
	SXqn6wboltB/tKyVss8jlGPBO9pyAsnJjJLbbWC98Equi/yuvG4dk1XZkO+qLBdniDn42uHqtpI
	hGQhaz1gxxj3zJNF1K6YxA61qDlJ0LqfdBn1rro9haHUZdRNwLWUuwG0Pc7SnrA3NGXX0NRNF1F
	af3ej97z0yIwffpoaY56YGiJdZBMMBQbJLZ8JH6PbJtBfZGvKdM/uOTtT+BvUf3qwfaNfz1TY3C
	83sFyFPg3atohLuYrXIjOKwx0i7mtGjavrgWT9lfuk7noliu8ULSW2xtZrhc4s/OlBTG6+KW4LR
	91HQ6/iCPJtR4n726LWHP
X-Google-Smtp-Source: AGHT+IGewYJENQDUKHNRYdYJMBvCnlNb9EkIWSxZaOgICbAExsnTBd7BTjE6HagiZ4edLiO6twkU3g==
X-Received: by 2002:a17:903:1aeb:b0:234:8c64:7878 with SMTP id d9443c01a7336-2366b001630mr131380345ad.11.1750068211963;
        Mon, 16 Jun 2025 03:03:31 -0700 (PDT)
Received: from localhost.localdomain ([180.101.244.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de78169sm57327545ad.123.2025.06.16.03.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 03:03:31 -0700 (PDT)
From: Tianxiang Peng <luminosity1999@gmail.com>
X-Google-Original-From: Tianxiang Peng <txpeng@tencent.com>
To: puwen@hygon.cn,
	tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	Tianxiang Peng <txpeng@tencent.com>,
	Hui Li <caelli@tencent.com>,
	Hao Peng <flyingpeng@tencent.com>
Subject: [PATCH] x86/cpu/hygon: fix missing resctrl_cpu_detect() in bsp_init helper
Date: Mon, 16 Jun 2025 18:02:31 +0800
Message-ID: <20250616100231.1238313-1-txpeng@tencent.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since upstream commit 923f3a2b48bdccb6a1d1f0dd48de03de7ad936d9
("x86/resctrl: Query LLC monitoring properties once during boot"),
resctrl_cpu_detect() has been moved from common cpu initialization
code to vendor-specific bsp init helper, while hygon didn't put
that call in their code.

This triggers div-zero fault during early booting stage on our
machines with X86_FEATURE_CQM* supported, where
get_rdt_mon_resources() tries to calculate mon_l3_config with
uninitialized boot_cpu_data.x86_cache_occ_scale.

Fix the missing resctrl_cpu_detect() in hygon bsp init helper.

Signed-off-by: Tianxiang Peng <txpeng@tencent.com>
Reviewed-by: Hui Li <caelli@tencent.com>
Reviewed-by: Hao Peng <flyingpeng@tencent.com>
---
 arch/x86/kernel/cpu/hygon.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kernel/cpu/hygon.c b/arch/x86/kernel/cpu/hygon.c
index 2154f12766fb..1fda6c3a2b65 100644
--- a/arch/x86/kernel/cpu/hygon.c
+++ b/arch/x86/kernel/cpu/hygon.c
@@ -16,6 +16,7 @@
 #include <asm/spec-ctrl.h>
 #include <asm/delay.h>
 #include <asm/msr.h>
+#include <asm/resctrl.h>
 
 #include "cpu.h"
 
@@ -117,6 +118,8 @@ static void bsp_init_hygon(struct cpuinfo_x86 *c)
 			x86_amd_ls_cfg_ssbd_mask = 1ULL << 10;
 		}
 	}
+
+	resctrl_cpu_detect(c);
 }
 
 static void early_init_hygon(struct cpuinfo_x86 *c)
-- 
2.43.5

