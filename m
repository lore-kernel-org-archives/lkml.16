Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A914189520
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945189; cv=none; b=Z3Sh6JIrYH4x7ZtICe4AbL+sxhGvNNhs/dQQRoFEuHPt0UHnVxZW+i5J7GIOf2/uSfS7lnyfm9xqcExYva26XqbccY3mNTvrNNZ+YDLBREp7rvD53S+X8CUmoT9n8Ql8Cae3bZrZPkyBvuRdmXgOF9VLwwHuH7eI84hjCZqVCfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945189; c=relaxed/simple;
	bh=GF0Hn09KPD012xYnrHRyG4xf0X9wQ9KlAHjX6egHn0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OEX5QTypT938s8lOzibxDrlBH1Q4gVdkZvy+pVu7fxwj8O8bDY4Uu50JLCEpeXi1xl9t9MaHfwA3zwjJLQ3px/VU7drPLQ6RHZfYbSfqMJdRVj824q97FqbtnRjHj5NvAcpMuB+9riFyVVzZBMv8rKDJvolcm69kktToncLOPOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Fc23NXLD; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Fc23NXLD"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso16283925e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738945186; x=1739549986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuJMR1N/b1qpsKDKcoeIqZx9TZLHFvG76FujKxOxlNs=;
        b=Fc23NXLDEBHIucN065QbvTqtWkcpOLHFSxTTqTfxBfCti6gsOvFFPZ5FPIUfEzis6B
         FiNGxoGY1GEc67rTyakbMrofh3Ed6/KQeTT8rhdPDUCzdP2mNAOYwBQ1p3D2h/6Tv/gf
         AhKmMGi6JIVPjGZ/NkJvwNuewo+cuvj7F+wOWfFu66Wvr+IGtN2/Qu10KrL5lqR612mD
         he1SGLFdVSQO+A6ZIgfYWZqFGFUOkyte+dit8uYnd5sszYwAuwTA8BI+qQb5ZRNyE/dJ
         movWztGzVEcDwjCKlaYKa++UbHdueBuY+7qhMxxK2xHZIInLFVFZ+brlT6xw6I0AUyGG
         HnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945186; x=1739549986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuJMR1N/b1qpsKDKcoeIqZx9TZLHFvG76FujKxOxlNs=;
        b=N5wbeR20+jCzbZR04S30L7tpk5GZzSJOWX6AxIvtrTO8XXX64UeZojbMYvoQ1aNRWX
         gTEw1RjSm5XPwkCxBCjMxDsv+F+/wcSL5oGKnrrWgFTYUpJK+kb+rgTBS4j9ngZQgKwB
         07jwjIx/4bf1sGiRKv1YKJCd0Lo8x/TcGbMa2We9lVcp9W0EzI7H0fjA/ZDwDVQ1jEvb
         S2aUru8M5eKaY8OpLttdsZdYlyataMMVpEFOttld3NzYUsb/PopN2X8UKYXwpMgeB1Ez
         /tMyRqQ+6szh+jd4Mr3cDpnh30Fja/BFclzjZ44VwiGPnDjPm2LXK9r1h3fnLhwzU90K
         2Byg==
X-Forwarded-Encrypted: i=1; AJvYcCWTOX+FNjXZwsuerLzOii1qpzT3FtaMhY2fns5D23ZIlsILBYvrz2Fo21dSNGvaN5VTLTMTOlTUkoP+NL8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl4skUdXoNV1PpukiM+d3ZRTUbP4W4hkPZ7Zt6XKAlZ5AMiWi1
	u6kcI95CVj/kEwCYN7a/ZnEqcgJ49cCbwOhnk7Z3rRSKQmDmCRJgaW/Vy6Ib630=
X-Gm-Gg: ASbGnctkg6P1u3wCx8XSDqICG9HJV4PUmdOGP/XmxXcg9huyywKVD2oppQ2h/4p+/rw
	BTCOVfFjxASXQ0rNglP55pAmrRkqkqO3JMAJllHWozhiN+6k5a/i6ujTa5nMxa3ogVTQYSQRQmm
	k334rKJeome0JP9ulziQtVTtjnNcwu5rCan2eXSrFzjCm8OptJAlvNQpEAgpifmhJSrRyIa1MnF
	bZBTE12+sECZeUCpo67pdL7Rug2apL0Usv+aQEbPKutFyTeT5gde+3NWr6I4GzVTFKmHrWUxFsm
	9uw0soVt5HOD0/enazQzPgJolMLm3DXZTjZbRjCjRB420C4ZVgijKb+L1w==
X-Google-Smtp-Source: AGHT+IF2QBiK/6fJgHT5gF+3avImUBiADzRKV6TlV+pcR6wlIV7GNBKNVzGepoKdRql8iUw7eoyotg==
X-Received: by 2002:a05:6000:1787:b0:38d:a876:845a with SMTP id ffacd0b85a97d-38dc959fab9mr2553003f8f.47.1738945185782;
        Fri, 07 Feb 2025 08:19:45 -0800 (PST)
Received: from localhost (089144193052.atnat0002.highway.a1.net. [89.144.193.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm3037899f8f.18.2025.02.07.08.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:19:45 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/9] riscv: Annotate unaligned access init functions
Date: Fri,  7 Feb 2025 17:19:41 +0100
Message-ID: <20250207161939.46139-12-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207161939.46139-11-ajones@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several functions used in unaligned access probing are only run at
init time. Annotate them appropriately.

Fixes: f413aae96cda ("riscv: Set unaligned access speed at compile time")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/cpufeature.h        |  4 ++--
 arch/riscv/kernel/traps_misaligned.c       |  8 ++++----
 arch/riscv/kernel/unaligned_access_speed.c | 14 +++++++-------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 569140d6e639..19defdc2002d 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -63,7 +63,7 @@ void __init riscv_user_isa_enable(void);
 #define __RISCV_ISA_EXT_SUPERSET_VALIDATE(_name, _id, _sub_exts, _validate) \
 	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), _validate)
 
-bool check_unaligned_access_emulated_all_cpus(void);
+bool __init check_unaligned_access_emulated_all_cpus(void);
 #if defined(CONFIG_RISCV_SCALAR_MISALIGNED)
 void check_unaligned_access_emulated(struct work_struct *work __always_unused);
 void unaligned_emulation_finish(void);
@@ -76,7 +76,7 @@ static inline bool unaligned_ctl_available(void)
 }
 #endif
 
-bool check_vector_unaligned_access_emulated_all_cpus(void);
+bool __init check_vector_unaligned_access_emulated_all_cpus(void);
 #if defined(CONFIG_RISCV_VECTOR_MISALIGNED)
 void check_vector_unaligned_access_emulated(struct work_struct *work __always_unused);
 DECLARE_PER_CPU(long, vector_misaligned_access);
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 7cc108aed74e..aacbd9d7196e 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -605,7 +605,7 @@ void check_vector_unaligned_access_emulated(struct work_struct *work __always_un
 	kernel_vector_end();
 }
 
-bool check_vector_unaligned_access_emulated_all_cpus(void)
+bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 {
 	int cpu;
 
@@ -625,7 +625,7 @@ bool check_vector_unaligned_access_emulated_all_cpus(void)
 	return true;
 }
 #else
-bool check_vector_unaligned_access_emulated_all_cpus(void)
+bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 {
 	return false;
 }
@@ -659,7 +659,7 @@ void check_unaligned_access_emulated(struct work_struct *work __always_unused)
 	}
 }
 
-bool check_unaligned_access_emulated_all_cpus(void)
+bool __init check_unaligned_access_emulated_all_cpus(void)
 {
 	int cpu;
 
@@ -684,7 +684,7 @@ bool unaligned_ctl_available(void)
 	return unaligned_ctl;
 }
 #else
-bool check_unaligned_access_emulated_all_cpus(void)
+bool __init check_unaligned_access_emulated_all_cpus(void)
 {
 	return false;
 }
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 91f189cf1611..b7a8ff7ba6df 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -121,7 +121,7 @@ static int check_unaligned_access(void *param)
 	return 0;
 }
 
-static void check_unaligned_access_nonboot_cpu(void *param)
+static void __init check_unaligned_access_nonboot_cpu(void *param)
 {
 	unsigned int cpu = smp_processor_id();
 	struct page **pages = param;
@@ -175,7 +175,7 @@ static void set_unaligned_access_static_branches(void)
 	modify_unaligned_access_branches(&fast_and_online, num_online_cpus());
 }
 
-static int lock_and_set_unaligned_access_static_branch(void)
+static int __init lock_and_set_unaligned_access_static_branch(void)
 {
 	cpus_read_lock();
 	set_unaligned_access_static_branches();
@@ -218,7 +218,7 @@ static int riscv_offline_cpu(unsigned int cpu)
 }
 
 /* Measure unaligned access speed on all CPUs present at boot in parallel. */
-static int check_unaligned_access_speed_all_cpus(void)
+static int __init check_unaligned_access_speed_all_cpus(void)
 {
 	unsigned int cpu;
 	unsigned int cpu_count = num_possible_cpus();
@@ -264,7 +264,7 @@ static int check_unaligned_access_speed_all_cpus(void)
 	return 0;
 }
 #else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
-static int check_unaligned_access_speed_all_cpus(void)
+static int __init check_unaligned_access_speed_all_cpus(void)
 {
 	return 0;
 }
@@ -379,7 +379,7 @@ static int riscv_online_cpu_vec(unsigned int cpu)
 }
 
 /* Measure unaligned access speed on all CPUs present at boot in parallel. */
-static int vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
+static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
 {
 	schedule_on_each_cpu(check_vector_unaligned_access);
 
@@ -393,13 +393,13 @@ static int vec_check_unaligned_access_speed_all_cpus(void *unused __always_unuse
 	return 0;
 }
 #else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
-static int vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
+static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
 {
 	return 0;
 }
 #endif
 
-static int check_unaligned_access_all_cpus(void)
+static int __init check_unaligned_access_all_cpus(void)
 {
 	bool all_cpus_emulated, all_cpus_vec_unsupported;
 
-- 
2.48.1

