Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A722A18B47C
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945203; cv=none; b=UwTYDvyzPGFoiHKx+D2fBG4A+pqy1e5qPxvS6xjKX9atzzhZQw1aBYvxSbYgKbeEzbgwEe7mWdEj0/rV35a5AaDmr0p7CQjSY/7Oybq5i+si+ZW+ppd2iBAtATd3kLZp/7hT7L1syhcCVVHUlhimD8Z1vxGK1MRtAgvs5flsalw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945203; c=relaxed/simple;
	bh=TflZ8vFhqqgukB3ZACwgUQtCjZPFs1P05Aa8hDY99Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Er2ldTfrZrYApqaGHkyP47uuYBWnDwKfrkBYUipLovuuRU0ziHqBgS7skN0joSWYukvadrVBuwswzP2KFFmqprRNWprboXbddLei5qp2E55ncLW+b/t7ejnmTm3pUWaPETjn0HgiODaW2bbGOlEd/TVzpyxXmbKnxCnAHc97jZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=f35H008O; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="f35H008O"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43621d27adeso15719175e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738945200; x=1739550000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2fCHXwdFaeXSBwfTQI74JIYWCeXWis7TCtNv1LZo0xM=;
        b=f35H008OFN44lBNNekFfdZVYPqN+tLgii7HZJQPrPn4r8rQ9BzOzHgKZVE179xRcg1
         Y2Rh94/QNLAGBN8BOWRaG7Q+ZpWPqh2ekKvns72VmiRNi8cOsHIeEKRQVAvyJl9OjeLy
         ELrWXQtoA6sUgLHiKmE097GfZBjDXdeSW/zs8HFgDnVnNGldMEdPZ57zuUz0Wd1lzIe1
         VOv9io3MMo83R7GDnStbJ28J6MJ9IDp3iOHMuXtRmkcY0QWUwg0QoyolZ2YupaY4e9vl
         KVrRgArxhuWDf93MbIQ+j828kRHUInMijZebfPU1xWejriiieQjrnPGRRUmsxfwaemQ+
         sN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945200; x=1739550000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2fCHXwdFaeXSBwfTQI74JIYWCeXWis7TCtNv1LZo0xM=;
        b=nrwi10nszBc8BVwWhYLD7+qVJ8GYL+MZFgiGLDYRd/tDtsoEwlHd4TCIteEa30v+Pn
         aDNBEUNs+dDfVQqnllduMUZpt/JanL4En6WfDFiH6oSxZp/TUiKQEW3qy1B1lu8+M/BS
         i8hXRQW+WCPX8WMbJDIK47X3CWPF1xTMtUV9zVjr0Vg24R2w13w9q8mvV8XAmOWymTsk
         QrSRctMbRNGpk+F4eAIHkRxUhzN7acEHxxc/zPb7jzf7U9GPBGdDGK8jfVcQqgU+MN2w
         fBxXvhafAnCnKO0/lmNmOQ0M7RlKYrDxXBzLkuzM5Q6/FG9j4z2l8wrBWYkG+CZ6tGeJ
         W+MQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4nWTbDEnAUf1Fs3dRCCQoAUV6FqegG3QC/MC6W8yDX1opYjn6dl68pT5omCnvDXUlywNybNzMblMxlmU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHbxELBx4dgEq7hjqDUV6XT0KdzGbNaxF+G17Xs8r4KjFzrOXV
	bv7gK9BbtmCjbD7FdJWNgAlTQ0q/nRyF/CeFPbf4riPUSByo/xaC0kMF2WyPo4Q=
X-Gm-Gg: ASbGncvPbFZ0Vm5rMFVAtGmvDlcw7rdwwGi43GWYabCwyUuy5vfthRT3g8FhT84E650
	JqWSsx8+GTJHXCzdRgo/MXORLhecVWfOBeFFKw+jgUuQLfsXJm+EQkWANHbOBo+5BAsMhUEspno
	8fuil2GBHKqIuxYT4OVCu8SMTIo2/+LJAhmkdlsyg8NFuciSvwBUvfOrzyYGXWpg4Rrb9T1Tjqs
	j7T7oY9DNBz9KRhj1NU4ZIoi/QHTHLRFDgqJ3NSZ4Sz75xK1tJaPFRO6Bw/V15rseqS7CZVmMrK
	MgcYmvk0fx7Hv/IjZehEYwVZ9NqFxUyO/o19/o9CvA0uSECghW+HKtxAvw==
X-Google-Smtp-Source: AGHT+IFhySvKCOlwcj4Qxz8J3e5OCL6BcBFdracdimWviE7gGpdopqanQ+HxZIazvgx44GvoG2zmWA==
X-Received: by 2002:a5d:457a:0:b0:38d:b610:190b with SMTP id ffacd0b85a97d-38dc9350d85mr2241809f8f.46.1738945199927;
        Fri, 07 Feb 2025 08:19:59 -0800 (PST)
Received: from localhost (089144193052.atnat0002.highway.a1.net. [89.144.193.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde0fd23sm4860354f8f.71.2025.02.07.08.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:19:59 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 3/9] riscv: Fix check_unaligned_access_all_cpus
Date: Fri,  7 Feb 2025 17:19:43 +0100
Message-ID: <20250207161939.46139-14-ajones@ventanamicro.com>
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

check_vector_unaligned_access_emulated_all_cpus(), like its name
suggests, will return true when all cpus emulate unaligned vector
accesses. If the function returned false it may have been because
vector isn't supported at all (!has_vector()) or because at least
one cpu doesn't emulate unaligned vector accesses. Since false may
be returned for two cases, checking for it isn't sufficient when
attempting to determine if we should proceed with the vector speed
check. Move the !has_vector() functionality to
check_unaligned_access_all_cpus() in order for
check_vector_unaligned_access_emulated_all_cpus() to return false
for a single case.

Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/traps_misaligned.c       |  6 ------
 arch/riscv/kernel/unaligned_access_speed.c | 11 +++++++----
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index aacbd9d7196e..4354c87c0376 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -609,12 +609,6 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 {
 	int cpu;
 
-	if (!has_vector()) {
-		for_each_online_cpu(cpu)
-			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
-		return false;
-	}
-
 	schedule_on_each_cpu(check_vector_unaligned_access_emulated);
 
 	for_each_online_cpu(cpu)
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 161964cf2abc..02b485dc4bc4 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -403,13 +403,16 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
 
 static int __init check_unaligned_access_all_cpus(void)
 {
-	bool all_cpus_emulated, all_cpus_vec_unsupported;
+	bool all_cpus_emulated;
+	int cpu;
 
 	all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
-	all_cpus_vec_unsupported = check_vector_unaligned_access_emulated_all_cpus();
 
-	if (!all_cpus_vec_unsupported &&
-	    IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
+	if (!has_vector()) {
+		for_each_online_cpu(cpu)
+			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
+	} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
+		   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
 		kthread_run(vec_check_unaligned_access_speed_all_cpus,
 			    NULL, "vec_check_unaligned_access_speed_all_cpus");
 	}
-- 
2.48.1

