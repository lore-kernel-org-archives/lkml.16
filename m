Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A52227EAF
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747995746; cv=none; b=UkSbKRz87lHtKVP0N8LKl0F1JN+MPR2WcAhutppKUIn72Q2jtGhTgwHV2r8wruNrA8YX0fXff8gW5P5dVF2AR6+Q6I2PC6ZgbWkEMXLZtFo++fXyO5Ic7O66PGYxVgmBsq7c5qLI3b6GNNZE7SrZ8c9Tw/A/17feTJCp5vNEv90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747995746; c=relaxed/simple;
	bh=ViCP/GXPR6c4TqOEA6RHPSeoT6XgmF7w9rLMCocIqJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KD9ljSSzQVVS+t/3bTD2gJctD2pakW/KVeXjrwrh3GvQelcgARseJ0t5KgtRhW/1HzB5gaGaey2HatCeu0UUKey7nPsk8MdQaBabPlrKJqKxKeJW/yTMxV3UduRWb0fPW4Smbmg2EOg6XsGgv7NUuvqDMaGrBbWWHSwNhRox/3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=F4BLMmvU; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="F4BLMmvU"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso10970562b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995744; x=1748600544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJlHvKZgzBuDLrZteqciLWVF8ALRj3f5YDjK6RzEUVA=;
        b=F4BLMmvUragUW4s7HyKp0BYbTKVW3t5KE14GnKOGodHwi/oOQ9epFFGVDSTCc2EGCE
         unmJMniOabLV+9iCUQEtm36SHxTUHyF9g2kgDZzMfbcD0Zg312zo+BlS5wNhUZh8FePs
         1PqZfkN7IMu6extAbRIVX+t4fRXYmB9dxV4gQnmBJqsFJfaPEvGvWiHuaHCE7tb6KDfi
         iGVxa4AhX+H73k/AGzcJof9GS1RUMkdo6kanbzU6BNBaNPPNxgPEjEFB7UGybGaaJhOG
         CxDoBBO1hc/KeOAnOTbzJZ1S6Uy0S7kGYFclirqXqGhizlUCand9GvD1h2U9OVROTB5G
         X4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995744; x=1748600544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJlHvKZgzBuDLrZteqciLWVF8ALRj3f5YDjK6RzEUVA=;
        b=apK8uO2ZG0yLAoN/c2FW3ng8stCW4Rwcm8SGZY4SzKxdzuW82mdXK47mLX9s/1kKPQ
         Mr0zrMWZTG79cIG8gHJ6OJru3+SSd/s2uCRSHkmJe9KiwYwPn5e4XpW+aCkCNNBRjkmq
         95OVOmq+bVAYVE3GHz3rjgE92CGuF6+dbW00MjozRhSQM/xRwqC1XYrgbeZqH1FrdD9H
         qp/6qYssIpjrHifOUvNwWFgVlOW4YeYNKG0DRlbkigkYjTvMkbQ8APzMxtRSM5nKIBX7
         qIIvTh7gsTD0RIEoF8PtVqS3KzKjomwmPqGQEVb0zGkMRDT57rhkyUe7bbYpYgDx8iXk
         5PLA==
X-Forwarded-Encrypted: i=1; AJvYcCURwIfpkXthwBfTnd1LkMF6bvvP8JNv0Z1wp0FimJGBoXygbPGLr0eGf9Z4aEBwJNYBlUtMdC95aPN6Sf4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywny6fDnhMSkVK2ALDIfi5sY3UfmDyKfVwUmOm6VYZJUnU3VTMf
	9cCT1vb8qcZ2nvKk7fT+Qat4V8hRL3owKsGJCytxSYOC7iRWs44U+j97xM6xmgNi/z4=
X-Gm-Gg: ASbGncsC33PJdb5tmLxl+zaRL2jBW9fDSWY938ltdfq66bBYZ79KIb2ujqyhj9spGiD
	4n96XuESHgIxw8sn9j+3ZA4eu9PMG3H2/EHxtEqXvNIvYzjk4mXi6BXhNaKCHWoVk5kmSurvEHr
	NqTfQQP1fwtyTkINSPdVnj58U5oF1nw0rnREFvDmiE+CPY3/HHJpk/GezsZIiuz3ga/Hd8drnkg
	47u6d97kk+1BfoiCfX+VD1eOHAKlFRZAnQ0D/CNVRR7+GcndElrNfracBBvxuf0ba5Q+nWCOXkE
	zYmbiNQnjUX7lzXWmdp99zVI62Qsumsw2zmLTk2npPF3nBRYBcvw
X-Google-Smtp-Source: AGHT+IGKDj0Vt3rsaPKYZL2nBjHo4cZKOOLzPGlgQIfiludDyBY6vduzzuNU0u8N497C+aWPSTsTOQ==
X-Received: by 2002:a05:6a00:3e0b:b0:736:34a2:8a18 with SMTP id d2e1a72fcca58-742acd75e6amr44078224b3a.24.1747995744354;
        Fri, 23 May 2025 03:22:24 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:22:23 -0700 (PDT)
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
	Deepak Gupta <debug@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v8 10/14] riscv: misaligned: add a function to check misalign trap delegability
Date: Fri, 23 May 2025 12:19:27 +0200
Message-ID: <20250523101932.1594077-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
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
 arch/riscv/include/asm/cpufeature.h  |  6 ++++++
 arch/riscv/kernel/traps_misaligned.c | 17 +++++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 2bfa4ef383ed..fbd0e4306c93 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -81,6 +81,12 @@ static inline bool unaligned_ctl_available(void)
 
 #if defined(CONFIG_RISCV_MISALIGNED)
 DECLARE_PER_CPU(long, misaligned_access_speed);
+bool misaligned_traps_can_delegate(void);
+#else
+static inline bool misaligned_traps_can_delegate(void)
+{
+	return false;
+}
 #endif
 
 bool __init check_vector_unaligned_access_emulated_all_cpus(void);
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 7ecaa8103fe7..93043924fe6c 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -724,10 +724,10 @@ static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
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
@@ -763,6 +763,7 @@ static int cpu_online_sbi_unaligned_setup(unsigned int cpu __always_unused)
 {
 	return 0;
 }
+
 #endif
 
 int cpu_online_unaligned_access_init(unsigned int cpu)
@@ -775,3 +776,15 @@ int cpu_online_unaligned_access_init(unsigned int cpu)
 
 	return cpu_online_check_unaligned_access_emulated(cpu);
 }
+
+bool misaligned_traps_can_delegate(void)
+{
+	/*
+	 * Either we successfully requested misaligned traps delegation for all
+	 * CPUs, or the SBI does not implement the FWFT extension but delegated
+	 * the exception by default.
+	 */
+	return misaligned_traps_delegated ||
+	       all_cpus_unaligned_scalar_access_emulated();
+}
+EXPORT_SYMBOL_GPL(misaligned_traps_can_delegate);
-- 
2.49.0

