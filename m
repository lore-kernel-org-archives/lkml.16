Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F78F2918FE
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297437; cv=none; b=hO8nfYofTPKz/dRQ56BymbgY22QJ8YPEstwhcRcGSMddeC5GKmV4PZh7tT29/4AAB16fWa1n2+NW08s6ZcphfIm7GSYfo6pV0b6QX/eJRNY+i2neKeCsM+UhqALKFT7mHkQYz3fV6sFkYpExhsSJM3J7eqy2qHpljckLKcsMObk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297437; c=relaxed/simple;
	bh=MaIrwOKv+YVVxdhE/r+zc5gTHYqZ311Osy8lrbnqATY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z4yjwq255MqCq0awwUzH1tZ771WsQd/+aJFrsQLDjBPwwrayCjVaIOo/hGHb2haiE3Zx1nPRziZGaH95lnYTI1wRMhA2ySyGDvEhezH/aoBeHU3dQyIhJO0PJBuAm2GmojZ23g1dEaKlGl0AK2U+ucaYVsZP6s72PA4mreLShhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=EK2gjO+q; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="EK2gjO+q"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a1fa0d8884so291769f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297432; x=1747902232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0iF+NUUhZJ5jxYVuPSRzuPMezDiacMrJKv4fNDBdRi4=;
        b=EK2gjO+qaczb3fcaIgJO9UwDj16ed11AoFoahsgYGSPGpoJxK0u2vB27BUMRSN917a
         0B5x7CJ8QdSumLxLUOTSRaFuqNO5CWt4HlZ5VZAAaDOKaRpeDBTUnL+7yAJMqZMcJdoH
         oDGxc6BXbBveVJKLIm6TqRJkghM+L1gdw2MWUHdd+0QUEeoIn+i/9hXBzk19TBCqhkeT
         WsWF8g+oxOKFAW0zm51XIPYIKPO6g1G45oXunHjqgbNa4y3eRMIe+3VKWV236oTzoolM
         +5MTxDqZqTAckpT1HMobwyef1NClMUw0Qv5xrSYhWXVYaJfFIBfCy9gmDz5JAcH/a9zB
         moNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297432; x=1747902232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0iF+NUUhZJ5jxYVuPSRzuPMezDiacMrJKv4fNDBdRi4=;
        b=ngHWGQ9z/OliDR6uulgAqzSLcIUGgWjyjC22p+3MLeqSrBKDr7CajSZ03Thm381/Ux
         z+UnvDfEjN7OinV2RVziBFaIZT1HZGrsVwvPOkU/oHZw0FExP1EyMUUG2SoQVQX7SToO
         +OfHrkAOMH97D5pn5euuhavRAIMRw+tA/UBVZN4lF/owJzvQPswWdzVdtLg0xEN33JWU
         e3zXVJqth5Zo5vG5OTpcH963DBAQuq34jhFOD9LsEbT5ORdUZ4m119CLmjaOJcxHKVDN
         XSYcWQXZgsnOvg8y4RfFZ7Ck2jyvY/wTP1SHuOtMX4xkJGYxKCDl/jB4QP+9e/O4YuK7
         9nHA==
X-Forwarded-Encrypted: i=1; AJvYcCUgitHDkeDH0qpiLW32JJjdlNStanOD5sIXKpa/pIY3czWqh6QM31fAlxcFPCLb3O0LiwIBUN0zeEMWV+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqxB4FHq1JxUjKM4/y/0x84MJ+oqU5hFmU5xR4zwuL7xppfmYa
	9Epju7UIJkY7SAEpnhJhn64mw1YnwlQ9kqJ9qmOWoYc/NBifb1L0FcyMQoD2Sik=
X-Gm-Gg: ASbGncs7M2XOrjvYB+mPNWj3SUvK9CfyP0McEPavM+7bLd0y2t1F3WOR3wpkojMKrFA
	+1nOJdnbRknxy+UcqSAGry3z85vFsGZGP1uKDzh2bIDbZ6jywVGS8///W4bfXCEGeELo3yRRD+Y
	f/QHRQxjW6OXgBcQutyYnIzUeLk+UJ0Dhr3qZmaJb2cU0MAm9Nn48QX2FDKB4IwAtME2mTMuM5T
	ob3k9DoHmKM7mhDHjdNFroorpBqute5aZaEw2qu7SNOrJApPO0zHfN4uA7Wd82Cl80AeoLJUjyw
	yST4XhXO7hYEL7D8SMODzFviT8SVa/dt4h8NOdaDW9eJhg0vQx47mp7kU93UjA==
X-Google-Smtp-Source: AGHT+IG/sxfuxXzoVLJQzgwnpP2BoJhjD/oKnctxBNP0O5v4fRD4OfvNOZerKN94X8y7ctt3mQZ17w==
X-Received: by 2002:a5d:5f8e:0:b0:3a1:f535:e9be with SMTP id ffacd0b85a97d-3a349694ac7mr5405960f8f.7.1747297432412;
        Thu, 15 May 2025 01:23:52 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:51 -0700 (PDT)
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
Subject: [PATCH v7 07/14] riscv: misaligned: use on_each_cpu() for scalar misaligned access probing
Date: Thu, 15 May 2025 10:22:08 +0200
Message-ID: <20250515082217.433227-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

schedule_on_each_cpu() was used without any good reason while documented
as very slow. This call was in the boot path, so better use
on_each_cpu() for scalar misaligned checking. Vector misaligned check
still needs to use schedule_on_each_cpu() since it requires irqs to be
enabled but that's less of a problem since this code is ran in a kthread.
Add a comment to explicit that.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/traps_misaligned.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 592b1a28e897..34b4a4e9dfca 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -627,6 +627,10 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 {
 	int cpu;
 
+	/*
+	 * While being documented as very slow, schedule_on_each_cpu() is used since
+	 * kernel_vector_begin() expects irqs to be enabled or it will panic()
+	 */
 	schedule_on_each_cpu(check_vector_unaligned_access_emulated);
 
 	for_each_online_cpu(cpu)
@@ -647,7 +651,7 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 
 static bool unaligned_ctl __read_mostly;
 
-static void check_unaligned_access_emulated(struct work_struct *work __always_unused)
+static void check_unaligned_access_emulated(void *arg __always_unused)
 {
 	int cpu = smp_processor_id();
 	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
@@ -688,7 +692,7 @@ bool __init check_unaligned_access_emulated_all_cpus(void)
 	 * accesses emulated since tasks requesting such control can run on any
 	 * CPU.
 	 */
-	schedule_on_each_cpu(check_unaligned_access_emulated);
+	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
 
 	for_each_online_cpu(cpu)
 		if (per_cpu(misaligned_access_speed, cpu)
-- 
2.49.0

