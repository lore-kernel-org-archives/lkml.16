Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA88E210FB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743687738; cv=none; b=uvFEQiaGtzkZSTuiKDxN46ybEHk+BsWdeL5DKvq3bGs4Myt8V3T09gOlTXrJSfHXWk13E2WP3EqduniQa1JUsZupDkMpL1D5K7QaicOQ4EqlulFfnSaLd6T9NDId0x1yZPHsqWjtIaOvEcjg1BSwMB5Rbqmo/kVEPmlUKzjs8eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743687738; c=relaxed/simple;
	bh=UwqrUYs/tDmcgi/laKzxLNjN2dD0BKH+uhvk77Z3gD0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k6NnII58OlsF+1rfrt3wukR2J3n6iFwcGGYcpYv7DyJCLNAJRVfh0E6vKn6IB3xUI4WGIWvS1KAoRrxtB0DRAQhb/bEc8vz/ow+JTKA8hiO90xJyYpt8Vmu0lip0BDZxafpRcUgqi3p6nUdHBbOn8wYW+aiW01DINyeCIAu+bus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=XhkYdDOi; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="XhkYdDOi"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso565522f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 06:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743687733; x=1744292533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KzSv22Tlh8b0C2DIJrcJuTRBaLWunIy9hBuJEBnkWz4=;
        b=XhkYdDOi4gPRR6YKaqy/WNAmfxVbPfGBAef7k3aryC7X4LIWNzvb4UUQKcQVYD+nyC
         53vHu2OAQ8Bam6hj6U/ijL5w6a1ux85KkYRR4zvtr5sVoSdWto9xqwBsBeSLXxINNGbU
         kJZHX4pkxw21pCwIxjxQjw4h1q7SkC0raZtKnHvTl/WfQL6UdzQSkFXhjwF1GQ806brt
         ZA8eWDW3YwSE9Alz8d7IDV/SpWYOfa8D4gY+2RhPqHG1vTsJ3fR4FAn44hk4TrrR0ABE
         TNA7qvz5wEpKa+NeL4KtW0YMWs4Sn7ZbVUYmbug9NiEe90cd7iv/HaHM3Zdrd5fTASQx
         QpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743687733; x=1744292533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KzSv22Tlh8b0C2DIJrcJuTRBaLWunIy9hBuJEBnkWz4=;
        b=mk5t/yClpLpBDSQztNgALCUV0Mw8n6CCNOHKOZEqaB7ir1LBL+OoeD9BIo5GhIh/mk
         OQOZ70a6tnXAXKc4oRPBR+SNlgId7cq9ZbkJ5S7paaeaZUZf+Z7K1znNSDBjvH+4IcYL
         zXbMWqDda27m6eL56ut4H322fiumA3Ygwbrd+Km3xMbEuG6gHyJO+2WlQf+Jn6/Y4xUk
         9CjXInOEBXLzm8rV/n8Cw4iRnTbv/Q6X3/Kh5YHLCFbgp/6RIlc1uj7li69OWkIYHMLH
         lfjWuhbSAYRC0akClit5Jhgzf8SkZm3YzxsCaLCbeSyBGoyS3XFoLVf0y8/7jTV9mKTh
         TxQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxfk8oHP12MItVJ56GHd6XUPGQzcF2XuV8HfrEjQzN1b9iZleKUBK81HMp6aflc3r/FIwV9rVwuBgAS2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzlVfHBkxeFvXzsoh5TOOg1o3JO05XcMsYRVR3LapQPkvLorCD
	p06AG97BALH8G9tp+61WgArIppaVQ3LCXc1fCRE/q2v6OP5Lps8dI39JyFFc1/M=
X-Gm-Gg: ASbGncutoSNfkPlDQla8pEK+06f7bsmXI902krrxXJ87iHtOLIbB4Bf7cPF8Yms1JRm
	swAgBbz6RGO4C6VPWh3WXqdVkbirI8FKcOCCIh/Ri4J/Y/pGXvpDDeOo+/BvYLL8mg5Q6ruH6c1
	e6yEj9mtMILLmcYsm7z1dASDFqzIm038NhirCOivSYYCBrOJEc+QrRvGSc7s/PpBrZAcOO4ymnc
	+DqlF2su7sI/5F6jSafvfoobVaGiOLotYVWBJB6cxlrJDr1W4lKJh0gb/XDzJUv39SM6+rB+Tsi
	kRgDetzJoJLuzyTVao/wFB+PkXTnpDutTIA1VpA1M9bia6UjcCF+9SuReSxlrIC6BsMqri/Q4qw
	=
X-Google-Smtp-Source: AGHT+IGq/wOsMPKFUCVYs7nL4AsOHO70+LxMIkYWJmXF6+zZV/6eUJ+XSIteFv/WFh6+yfsrGoEdgg==
X-Received: by 2002:a05:6000:1786:b0:39a:c9ae:9eea with SMTP id ffacd0b85a97d-39c2e617779mr3043553f8f.10.1743687733190;
        Thu, 03 Apr 2025 06:42:13 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3382:ef90:7c12:ff06:d34a:d3e9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b76f2sm1854884f8f.53.2025.04.03.06.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 06:42:12 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ard Biesheuvel <ardb@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2] scripts: Do not strip .rela.dyn section
Date: Thu,  3 Apr 2025 15:42:00 +0200
Message-Id: <20250403134200.385077-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

riscv uses the .rela.dyn section to relocate the kernel at runtime but
that section is stripped from vmlinux. That prevents kexec to
successfully load vmlinux since it does not contain the relocations info
needed.

Fixes: 71d815bf5dfd ("kbuild: Strip runtime const RELA sections correctly")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index cad20f0e66ee..0a1f1e67a0ed 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -377,7 +377,7 @@ quiet_cmd_objcopy = OBJCOPY $@
 cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
 
 quiet_cmd_strip_relocs = RSTRIP  $@
-cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $@
+cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' --remove-section=!.rela.dyn $@
 
 # Gzip
 # ---------------------------------------------------------------------------
-- 
2.39.2

