Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C459D1E7C12
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 11:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746271373; cv=none; b=JtIks2NvAMH0OazmSzDbHYvi8wiQPTE6SJCQUZFf6aXMIkRQ8mRnfYwqXyH1vDBdYNVkFjGQNhfvxK59PMpV9JRbbyAyx3L8Q2TxNgrmGGP2wR1ov/K8/EffR3F/uTtHPXZchYTjmp+R9mg3sVgi7QHs3grzkYwx6LB+ecN2ODQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746271373; c=relaxed/simple;
	bh=SZrkBxQBIX661W5VVvcyVuJfe1U3MCxKou9uEoGpCEA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nva9lYMks0u5jrOTAdf32tYrbOj4rPakxUU0tHAnYqSqCXbLphkjMaJMjZYCy+Gfh/+C/Zb6JCy0m21MBRCz5Os/OrGC2Q5X3AnepRNG9X2ATcmf6luS06UdeN8FRitCwtyfgm5jiSx0FikFuhjE6+5d/uM+HR1APUIs0lPBFX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1tZyDCfm; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1tZyDCfm"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-44059976a1fso12403295e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 04:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746271370; x=1746876170; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jEy2dzK1CfY22N91JTriuMXrrKPXV1plVaNkK6ipqjE=;
        b=1tZyDCfm++FDUK3/mA+Y2m5LvEz5IGyMOiS5o3c00Uv3lKU6hVeDjVhTzsh/Aox6AY
         1h2N4prKEQD/kkubO0F6u/sWyIhxIE2vZqAYVE0oecq7pjiz/4Hplgc1G3DGEptNYaru
         YyAO+tTZV+ZRtM9Q/17tkBY42zWCU2J/+GLyp0NdLzhEAQxeSqI7BZJ+83F6cbDu4qPc
         pH/86Okj5tGUceTdcYi1U7IwauoprPtuTSct3w+dtxPwFw07+ZzHETFVqFr5Zv7YuDZd
         3T1nuntQaQO2WE8LiC5nXCZV9icdMhaIJD37TCJB4pJghunYtcD5TbRz9WRYMYrEJIxe
         oB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746271370; x=1746876170;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jEy2dzK1CfY22N91JTriuMXrrKPXV1plVaNkK6ipqjE=;
        b=H8pKYudCGhwgoPdiEHTjMspDOFEidQQf0G3FvTYaQkshqFWb0e/j3afaE5gT8yvsSP
         9kqF4hjEJ2YQXD5w0nU7BnP7/qIa6PwdS2pHVhun34LQvg2oog9FDf28uYqBu3iINB8O
         uF6/+tlV/4UouLZqNhYaRlTas2tCUqE1V/Zea319EWJ/1TQpLHHpz8UT/6spegtre/ID
         3dibJcfoRno/cE+CMSSRNa7Tiu80AhUUS69h4DrrluTd10IYKzSMB1ebOzIRwqFDFEpY
         QEjsxbYJEIrW9DffxrKmtQxcE33iLsCJuyMv8hwnL5nfyPwSSM4l7PkGK03wKUTZsefY
         Qg0g==
X-Gm-Message-State: AOJu0YzUIzKvuGjnEYVEKYsXuyVOEHIWtjxw83m3gGMyOT7G8/+M0+R9
	jcaLvJqGCJW+ofy0RZNJ7SV81e1OfzZArAUJfOtVmYuHagGRH2/dPTh37gFIJAd43Y5Uaw==
X-Google-Smtp-Source: AGHT+IHtyEmjTf996TScnc9rNYSDGzCIfB73VkA62s/k7MjtMyfOp3/sC6ByzFU+INk5DTveL/kLKzLT
X-Received: from wmbes9.prod.google.com ([2002:a05:600c:8109:b0:43b:d523:6ad8])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:350e:b0:43c:e478:889
 with SMTP id 5b1f17b1804b1-441bbe2c815mr56213835e9.0.1746271370173; Sat, 03
 May 2025 04:22:50 -0700 (PDT)
Date: Sat,  3 May 2025 13:21:39 +0200
In-Reply-To: <20250503112137.1962910-5-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250503112137.1962910-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2602; i=ardb@kernel.org;
 h=from:subject; bh=3mTSEZ1dW7QwAe+xdFMTtJ+M2UkpWDSJCGZmF4mmZBs=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUP0jzOzUaNl8abjX4L2Jb549miO1dubsc+UH3xe6nt/2
 opXAg93dZSyMIhxMMiKKbIIzP77bufpiVK1zrNkYeawMoEMYeDiFICJ+GxiZDglEp+gk8UW5GyU
 5tT9iP3d5zCe3nftkXYLliedOqr7wI7hf166mF62jWq3vfpcDdGrflp8v88XhBzdo7Ms543XIuZ 77AA=
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250503112137.1962910-6-ardb+git@google.com>
Subject: [PATCH 1/3] arm64/boot: Move init_pgdir[] into __pi_ namespace
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

init_pgdir[] is only referenced from the startup code, but lives after
BSS in the linker map. Before tightening the rules about accessing BSS
from startup code, move init_pgdir[] into the __pi_ namespace, so it
does not need to be exported explicitly.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/pgtable.h | 2 --
 arch/arm64/kernel/image-vars.h   | 2 --
 arch/arm64/kernel/pi/pi.h        | 1 +
 arch/arm64/kernel/vmlinux.lds.S  | 4 ++--
 4 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index d3b538be1500..6a040f0bbfe1 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -754,8 +754,6 @@ static inline bool pud_table(pud_t pud) { return true; }
 				 PUD_TYPE_TABLE)
 #endif
 
-extern pgd_t init_pg_dir[];
-extern pgd_t init_pg_end[];
 extern pgd_t swapper_pg_dir[];
 extern pgd_t idmap_pg_dir[];
 extern pgd_t tramp_pg_dir[];
diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 5e3c4b58f279..a0977f7cd3ec 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -56,8 +56,6 @@ PROVIDE(__pi_memstart_offset_seed	= memstart_offset_seed);
 
 PROVIDE(__pi_init_idmap_pg_dir		= init_idmap_pg_dir);
 PROVIDE(__pi_init_idmap_pg_end		= init_idmap_pg_end);
-PROVIDE(__pi_init_pg_dir		= init_pg_dir);
-PROVIDE(__pi_init_pg_end		= init_pg_end);
 PROVIDE(__pi_swapper_pg_dir		= swapper_pg_dir);
 
 PROVIDE(__pi__text			= _text);
diff --git a/arch/arm64/kernel/pi/pi.h b/arch/arm64/kernel/pi/pi.h
index c91e5e965cd3..38a908d048e8 100644
--- a/arch/arm64/kernel/pi/pi.h
+++ b/arch/arm64/kernel/pi/pi.h
@@ -22,6 +22,7 @@ static inline void *prel64_to_pointer(const prel64_t *offset)
 extern bool dynamic_scs_is_enabled;
 
 extern pgd_t init_idmap_pg_dir[], init_idmap_pg_end[];
+extern pgd_t init_pg_dir[];
 
 void init_feature_override(u64 boot_status, const void *fdt, int chosen);
 u64 kaslr_early_init(void *fdt, int chosen);
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index e73326bd3ff7..73fa57f341b0 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -321,9 +321,9 @@ SECTIONS
 	BSS_SECTION(SBSS_ALIGN, 0, 0)
 
 	. = ALIGN(PAGE_SIZE);
-	init_pg_dir = .;
+	__pi_init_pg_dir = .;
 	. += INIT_DIR_SIZE;
-	init_pg_end = .;
+	__pi_init_pg_end = .;
 	/* end of zero-init region */
 
 	. += SZ_4K;		/* stack for the early C runtime */
-- 
2.49.0.906.g1f30a19c02-goog

