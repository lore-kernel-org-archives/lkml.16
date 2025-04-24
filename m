Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4C6288C90
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745516108; cv=none; b=Ro5Xm71isG0xPnUzpem9hdLPFuY19Q3ZVBRJKFS4wTxxRff9kKeRog5h7LlR9yfNNWpsvDTnXAxdNZoXWBI/2F8lMG3YAs94+GjIvQjz2PAGoofY9tQIT049NDWUJCeox4beo8JbHB9I1q41a6wgEaCdcb8i9kG9IdBuhKtkh/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745516108; c=relaxed/simple;
	bh=dB1Aqp9jw5AsBzdrqtoxtIcKj/5RdGr1pHa5QHly7Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MiI7C4CviVeoNkPtAzUWWll8Mos8ZHDCahjQxA7qRY3Jvvmxbu5H6XhCT8C/RBTvJia2cJJQ3b2zsQkUw/Smo8HJVszg2U10oOAJk+HFAfj6p1BiZknUk1RnlxISm0bUYT6vKLQKLEPa47TLeZE5KtWnqeFHHWAjjKM0JnXWFVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=VWMZl22y; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="VWMZl22y"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22928d629faso14414835ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745516106; x=1746120906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNDdi3bVRW98tMUmMa3iEbBTwqmvke8nqAL/FJxM67I=;
        b=VWMZl22yAGOgUd1DSj3FivEtJcHpvktTZq1d8gjDDi85aaMEuKeFdGe3yab70wlMuA
         xeEswMQjfHvl2PhvNrRc6vJ9nZ/ej3M3Qsb2hFxMDsjmrFhFqRXSj+huojn5MbbVqLzB
         YwGdC1Wb0k0XCHkijUEZjdcxQkptmT6MygU7VuFf5mS+U6UIkjO9z7+gRXeIQMh0pIyq
         GOh1Sh/lpDfF8YMEn7KBp2hAglT5IG+kS0YpBtdlfhXbOLFgO/bFDMrrxBT0uo3pJBtm
         ZAON01BhkqCERLz4soRDm6iJhwgjjoGUfVtXUbV5Ug3joh0bEVFgeoaLm2QwY6hImik7
         9MyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516106; x=1746120906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNDdi3bVRW98tMUmMa3iEbBTwqmvke8nqAL/FJxM67I=;
        b=YVsD2/MykXJQi+otNpBicTZyuLCNLK9wzx2yGi/WldHPzaVXolvNWlyIDoLaRtzSga
         kU1MSq6fzKk9B1tuPtasX67rSkMxPVcbx6dhfUSQMfIJHfTtvKuycTL5BF7ZMHlbgrN5
         8sOb/B5PrQlwpg+Rm2+WRJpq+7Qj9mYV9p+0M8ahYYSbHHcvFf2M9xUThFEm9xWEX98Y
         Dz3mxyUCCTpfa0RV3M5od0CtfDKWA8tatkmJbA8/4g8GZCbXnVjLNn3pqYGdmG/nNM/5
         YgE1lIEnETLysWa9bAFt2g5EVJiOOuwBrGN3UcZWef9jrziYIAXszxus7kjOMP8ega2t
         laeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUq4+jzXlf3n2sBCLh/EBE2mzxlrSSiozRaH80+w3bCYJq5/stXAkTTWGnn5Dzs7/GZORz6etXGJ9ewA7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwITifeVTS7mkDdhE31dt1RK3riuC8T3ox5Q1X9Vaf/txO+5wG2
	Gyd3mWIAEHMLEzUGrc+cImVyOLMXS5ZR1vi+dIFTKSCYv8rHGrAc67tNioJt6vU=
X-Gm-Gg: ASbGncvYrpP/zMqH5CidH3kVtUqd4xpRHXfUJhob7TDKMbC3Nb4ty/vkLdC1wrSe/5J
	FtIAaBxXKWtVGeIYMIXb39ILHECh9axm9CWwBs0jfiDjYyhyoagXwIROEAxNRqmoBqD+OvXKYP5
	Zbq2qj40ctcZCtUfTCq6KMo1ZSuspQHDxBsFBeF/vzGgbxiiAbY5EQ5Y1D46sWZNZD62OauUmP8
	9KEuQW0Yomqe8twQt2TH6WKuGjjRqAphS+O/xeon7nplbcsEEf3Ua/YDc96xFJOWjZ7zX1mXJJ8
	1fzkjjUH6GQEPPHR/oi6PzA1robkgwTBXRWX3vMyWVVfGokjyI5F
X-Google-Smtp-Source: AGHT+IHgoxOdSwMCR3g5IpOqeK6qLMj0uu2JqSy/m/IXPMpoioHfXGrM09vCJDVNOdL1X/GrKu4d3A==
X-Received: by 2002:a17:902:e74b:b0:224:160d:3f54 with SMTP id d9443c01a7336-22dbd469727mr4368305ad.31.1745516106262;
        Thu, 24 Apr 2025 10:35:06 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c4esm16270255ad.173.2025.04.24.10.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:35:05 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v6 10/14] riscv: misaligned: add a function to check misalign trap delegability
Date: Thu, 24 Apr 2025 19:31:57 +0200
Message-ID: <20250424173204.1948385-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424173204.1948385-1-cleger@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Checking for the delegability of the misaligned access trap is needed
for the KVM FWFT extension implementation. Add a function to get the
delegability of the misaligned trap exception.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/cpufeature.h  |  5 +++++
 arch/riscv/kernel/traps_misaligned.c | 17 +++++++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index dbe5970d4fe6..3a87f612035c 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -72,12 +72,17 @@ int cpu_online_unaligned_access_init(unsigned int cpu);
 #if defined(CONFIG_RISCV_SCALAR_MISALIGNED)
 void unaligned_emulation_finish(void);
 bool unaligned_ctl_available(void);
+bool misaligned_traps_can_delegate(void);
 DECLARE_PER_CPU(long, misaligned_access_speed);
 #else
 static inline bool unaligned_ctl_available(void)
 {
 	return false;
 }
+static inline bool misaligned_traps_can_delegate(void)
+{
+	return false;
+}
 #endif
 
 bool __init check_vector_unaligned_access_emulated_all_cpus(void);
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 410b2e0e0765..1d3be999220f 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -709,10 +709,10 @@ static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
 }
 #endif
 
-#ifdef CONFIG_RISCV_SBI
-
 static bool misaligned_traps_delegated;
 
+#ifdef CONFIG_RISCV_SBI
+
 static int cpu_online_sbi_unaligned_setup(unsigned int cpu)
 {
 	if (sbi_fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 1, 0) &&
@@ -748,6 +748,7 @@ static int cpu_online_sbi_unaligned_setup(unsigned int cpu __always_unused)
 {
 	return 0;
 }
+
 #endif
 
 int cpu_online_unaligned_access_init(unsigned int cpu)
@@ -760,3 +761,15 @@ int cpu_online_unaligned_access_init(unsigned int cpu)
 
 	return cpu_online_check_unaligned_access_emulated(cpu);
 }
+
+bool misaligned_traps_can_delegate(void)
+{
+	/*
+	 * Either we successfully requested misaligned traps delegation for all
+	 * CPUS or the SBI does not implemented FWFT extension but delegated the
+	 * exception by default.
+	 */
+	return misaligned_traps_delegated ||
+	       all_cpus_unaligned_scalar_access_emulated();
+}
+EXPORT_SYMBOL_GPL(misaligned_traps_can_delegate);
-- 
2.49.0

