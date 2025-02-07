Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B15188A3B
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945244; cv=none; b=PoiDMQeM2O7x4xsypQy2s1TiqWDCUHQb4gKkBxj1BMZ2l/0+Wmlja1qX0CBPKLC7Pc1RbBfCvwlCsiw2z3ixKxJ+g2LNnYQfnMHZEbWwJNfTkDmYSP2kcG9/tRUBbPGdwMbVXdP/LMUj+3Kz8RtW9SKe8aqQ2pMiZUiY2jqF73c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945244; c=relaxed/simple;
	bh=klAskR1qF2MHdG7hXASfNr2IJY8c+S7DOai4tT9TPY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=khxP/62OZ1NZuNBoDsjgcR+xLohSUnopIUqM38hwTP2gbb2u1T38U81FkEKVXKbtw6VpjGNh1njU8DjBW+BlGS17cWuJ45jQnxwnRKJFdzpxo9M97Hn0Go6JJcDQfomqbNNdRG2qVyABc0gMNGkk1++//ofXOF60af9irzJKcq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=m5H9b6wm; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="m5H9b6wm"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38daf09d37fso1595968f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738945240; x=1739550040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZV9Bvxyy8oBnqpcvuhP90zRC/EQE6fM7xvGU71P15A=;
        b=m5H9b6wm6kkFCgR8RzXWbJqf0VWFgqWD/jHMxUMpF7nZRdO0RSTRDJKm0cSgxLZ3SW
         vt0xG/eldLhNabJYniK+//0G+a62zwfJpW+45jxxdQ5YjVshZeWVtt8SRjNuVDsKcC51
         VS7bvvK1vjYw00lGjDnbVdKwOEAYjRZzsP2d1PGueO8U9ecdvWc8/Rz1y7gq2jZCDivh
         vmxfZ8KAb2lXqEHMW9v4gtJe/kvFi9ecojqvQiQ6FHewZIvkaEzYtvn6JVe/lH5HHTuR
         sgemZaAZtrJ/7c7hag1eNw2CJI6ELdL8LDwnoiloeTbfxDqDdhqur94oaPLEDl9++DnI
         tVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945240; x=1739550040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZV9Bvxyy8oBnqpcvuhP90zRC/EQE6fM7xvGU71P15A=;
        b=fy6StCQZwU/6Dkr1EIHhLwzX8mffjC3gM/jGkHJawm03WlMbFE0v+5hp1Y6EP2czG1
         fnIpmbn8RslZsRQ9aZRKem3LlbOVbvyBOkBuT3yLypCxaF9jgGALWAxa8YXKhIMJHJh2
         f3V639BF/W3dK12PvcraWr7vM1lpWMoUeVsCRdynTqdVmyBPltMQLozS5FXVqA+9rs9b
         DVQz39rm1HqHVtFQWK8R0d7OeqO0lCBPkzwQeI4P4FCHJ3qUpySKILD1HsyOI5zODSSF
         b7O6hYxFXz7kUyo59dinPVpPFbmvbmjd1TGHJFY0uUAqyBIgTszIkO93/w9/eqn3D0aK
         aFiw==
X-Forwarded-Encrypted: i=1; AJvYcCUgcfVo9egDt+htxxu/2RforIQxz9tjwkfRhmoLF5z+H5/rNhRsUbQ84AoTpRsAvRR0vRx6G0GPo1ssqWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG5+ypQYuB+igdrrL+J44SrJeYugbNoXfcEYxe4ofeEy0INOmG
	UITL8xBe0Hzobocf/ZCuYDluY1eKqLsoKiqT4N0YjygMjpJsH809wLRzPySlhMM4ATGG4cMsjQw
	nbsE=
X-Gm-Gg: ASbGncvtH1ERC+of0H58SJ/h7Q8NqeOl9aao55noLz2byF7sghm63ZQBqTZ7S4VPCE5
	tlsRrQbsbOD/btbqvmWeos4lFekQXjIkqyanK9AkLLCD3OdIN8Hu1XttkVG1C2jwuiLAM6vgGy8
	LudiWQHGFy5ltuC12ZUxuqnvtwTU87ZdA10jZLYyh2qz5v7bF7Lx5kJ0P7eWcA5T27dOtfH+vjb
	/tuW5DTPIIDyt1D64Vo/lIVhX/mqReoo6D8fbjJUqtFs/+xARfrcB5HVA6lEY136GRpqCi6e0IP
	SDFpURfT9QIqce8YN+1R+pnt+d4JQ837k18SjJS2By0RKDej78IhNXgqOA==
X-Google-Smtp-Source: AGHT+IEOg6IG0kjsFKTvz6AcKlvyJUvdpYugEgGxtXEalKSZMbMjvynoGIK3ylHbblQH+CwYP9eGsQ==
X-Received: by 2002:a5d:588e:0:b0:38d:d274:4533 with SMTP id ffacd0b85a97d-38dd2745860mr6721f8f.55.1738945240610;
        Fri, 07 Feb 2025 08:20:40 -0800 (PST)
Received: from localhost (089144193052.atnat0002.highway.a1.net. [89.144.193.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd1af32sm5010225f8f.16.2025.02.07.08.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:20:40 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 7/9] riscv: Prepare for unaligned access type table lookups
Date: Fri,  7 Feb 2025 17:19:47 +0100
Message-ID: <20250207161939.46139-18-ajones@ventanamicro.com>
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

Probing unaligned accesses on boot is time consuming. Provide a
function which will be used to look up the access type in a table
by id registers. Vendors which provide table entries can then skip
the probing.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 114 ++++++++++++---------
 1 file changed, 66 insertions(+), 48 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index d9d4ca1fadc7..f8497097e79d 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -130,6 +130,50 @@ static void __init check_unaligned_access_nonboot_cpu(void *param)
 		check_unaligned_access(pages[cpu]);
 }
 
+/* Measure unaligned access speed on all CPUs present at boot in parallel. */
+static void __init check_unaligned_access_speed_all_cpus(void)
+{
+	unsigned int cpu;
+	unsigned int cpu_count = num_possible_cpus();
+	struct page **bufs = kcalloc(cpu_count, sizeof(*bufs), GFP_KERNEL);
+
+	if (!bufs) {
+		pr_warn("Allocation failure, not measuring misaligned performance\n");
+		return;
+	}
+
+	/*
+	 * Allocate separate buffers for each CPU so there's no fighting over
+	 * cache lines.
+	 */
+	for_each_cpu(cpu, cpu_online_mask) {
+		bufs[cpu] = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
+		if (!bufs[cpu]) {
+			pr_warn("Allocation failure, not measuring misaligned performance\n");
+			goto out;
+		}
+	}
+
+	/* Check everybody except 0, who stays behind to tend jiffies. */
+	on_each_cpu(check_unaligned_access_nonboot_cpu, bufs, 1);
+
+	/* Check core 0. */
+	smp_call_on_cpu(0, check_unaligned_access, bufs[0], true);
+
+out:
+	for_each_cpu(cpu, cpu_online_mask) {
+		if (bufs[cpu])
+			__free_pages(bufs[cpu], MISALIGNED_BUFFER_ORDER);
+	}
+
+	kfree(bufs);
+}
+#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
+static void __init check_unaligned_access_speed_all_cpus(void)
+{
+}
+#endif
+
 DEFINE_STATIC_KEY_FALSE(fast_unaligned_access_speed_key);
 
 static void modify_unaligned_access_branches(cpumask_t *mask, int weight)
@@ -186,8 +230,17 @@ static int __init lock_and_set_unaligned_access_static_branch(void)
 
 arch_initcall_sync(lock_and_set_unaligned_access_static_branch);
 
+static bool check_unaligned_access_table(void)
+{
+	return false;
+}
+
 static int riscv_online_cpu(unsigned int cpu)
 {
+	if (check_unaligned_access_table())
+		goto exit;
+
+#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
 	static struct page *buf;
 
 	/* We are already set since the last check */
@@ -203,6 +256,7 @@ static int riscv_online_cpu(unsigned int cpu)
 
 	check_unaligned_access(buf);
 	__free_pages(buf, MISALIGNED_BUFFER_ORDER);
+#endif
 
 exit:
 	set_unaligned_access_static_branches();
@@ -217,50 +271,6 @@ static int riscv_offline_cpu(unsigned int cpu)
 	return 0;
 }
 
-/* Measure unaligned access speed on all CPUs present at boot in parallel. */
-static void __init check_unaligned_access_speed_all_cpus(void)
-{
-	unsigned int cpu;
-	unsigned int cpu_count = num_possible_cpus();
-	struct page **bufs = kcalloc(cpu_count, sizeof(*bufs), GFP_KERNEL);
-
-	if (!bufs) {
-		pr_warn("Allocation failure, not measuring misaligned performance\n");
-		return;
-	}
-
-	/*
-	 * Allocate separate buffers for each CPU so there's no fighting over
-	 * cache lines.
-	 */
-	for_each_cpu(cpu, cpu_online_mask) {
-		bufs[cpu] = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
-		if (!bufs[cpu]) {
-			pr_warn("Allocation failure, not measuring misaligned performance\n");
-			goto out;
-		}
-	}
-
-	/* Check everybody except 0, who stays behind to tend jiffies. */
-	on_each_cpu(check_unaligned_access_nonboot_cpu, bufs, 1);
-
-	/* Check core 0. */
-	smp_call_on_cpu(0, check_unaligned_access, bufs[0], true);
-
-out:
-	for_each_cpu(cpu, cpu_online_mask) {
-		if (bufs[cpu])
-			__free_pages(bufs[cpu], MISALIGNED_BUFFER_ORDER);
-	}
-
-	kfree(bufs);
-}
-#else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
-static void __init check_unaligned_access_speed_all_cpus(void)
-{
-}
-#endif
-
 #ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
 static void check_vector_unaligned_access(struct work_struct *work __always_unused)
 {
@@ -370,6 +380,11 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
 }
 #endif
 
+static bool check_vector_unaligned_access_table(void)
+{
+	return false;
+}
+
 static int riscv_online_cpu_vec(unsigned int cpu)
 {
 	if (!has_vector()) {
@@ -377,6 +392,9 @@ static int riscv_online_cpu_vec(unsigned int cpu)
 		return 0;
 	}
 
+	if (check_vector_unaligned_access_table())
+		return 0;
+
 #ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
 	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
 		return 0;
@@ -392,13 +410,15 @@ static int __init check_unaligned_access_all_cpus(void)
 {
 	int cpu;
 
-	if (!check_unaligned_access_emulated_all_cpus())
+	if (!check_unaligned_access_table() &&
+	    !check_unaligned_access_emulated_all_cpus())
 		check_unaligned_access_speed_all_cpus();
 
 	if (!has_vector()) {
 		for_each_online_cpu(cpu)
 			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
-	} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
+	} else if (!check_vector_unaligned_access_table() &&
+		   !check_vector_unaligned_access_emulated_all_cpus() &&
 		   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
 		kthread_run(vec_check_unaligned_access_speed_all_cpus,
 			    NULL, "vec_check_unaligned_access_speed_all_cpus");
@@ -408,10 +428,8 @@ static int __init check_unaligned_access_all_cpus(void)
 	 * Setup hotplug callbacks for any new CPUs that come online or go
 	 * offline.
 	 */
-#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
 	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
 				  riscv_online_cpu, riscv_offline_cpu);
-#endif
 	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
 				  riscv_online_cpu_vec, NULL);
 
-- 
2.48.1

