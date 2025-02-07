Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD17182D9
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945224; cv=none; b=O4wICwXQrYQOXpyQ7VUsfPJC0TAwBYKjaf3fi1E4/hnA0av33xQq8lwkO8az76vN7e/o6jhEZ93DnkbVfaBLqAEKbZkkDSkaNdS5JzMnOmiwk9GmqC0KPte81iEmqrbSfXOnTgdszozXdEqBYQ0lFJuZXNFOyxr+dmfnyLd7siw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945224; c=relaxed/simple;
	bh=uu6MdVyaN06kGkmx0osoY1uJGP5t5zipJf5Cj8Cyixw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iHoxFbTtTxBrkmf/VeJYEjKstSYJTL5/pzqTpj35hPUsygksUPLQDXzvCozROuaM1Y7jO198iGPd5X81kY16ay5cbo8cjg6kynMxcQVWTTc5bXk3ogVazv2n2Qqil63bAKrhNRTxups3P+HBX82bqMjya3rG5waLuMjd+jQuOMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=QF6C5SIx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="QF6C5SIx"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436249df846so15709755e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738945221; x=1739550021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPC+Zc9/VMADj7AL3TU4wV27hjuGZt3xK3eoVREeXu0=;
        b=QF6C5SIxatnSWGg2Hfad0METKiBPBEqsh+RaJqcJXPMgViPwD5OCP6MpUlPK3CS9Hm
         VFwu9rKKAmmQsVwGLEfdXNjRcDOMHDrcycFy+Cn3sRFWtFu71Hdwa6o8nX6syDTyCfDd
         PHNDKU2po5YQAjU/cmi95prYwmw/jIh7G3ZleAhumftv34mLr6dSN9tjk1JaRtHOww4z
         IKtnUsBnbzi7iK+nc3PKgMllknSlNKpu7D+xO4AVnF/HmNDD6tTzczAxiNsrpN5gIcM7
         rqqRxjFZ8YRadnfwMzOhXs71Rg7ALOerz0S+Uj0hUuh9Z8Bv/u7dTNtcWdgJzopXbHjM
         pKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945221; x=1739550021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EPC+Zc9/VMADj7AL3TU4wV27hjuGZt3xK3eoVREeXu0=;
        b=eoKGldBeiO5pgCtpkqRGh8cGLH1US+qfa8V5YaaFaWdK+TsRlRv59b0OoGNyUoRMJE
         BRvE8a0DxNQn7RhMyjr+LNmwHidtioX/MQBi2o6rVyIx8uv6Ai79bthIeBmNIRnGLFS/
         pCdSCxFdz2QzLoIHJWHnV9qY34vit9m7NU0Rpgmupy2Dvs55nbvMaZAX0hZIs055kXhp
         3PLSbnSAyu0VbO8Makcnm/gcxY6/4pi2MDjzJe8y3aPen66ceqjIxd4B7xku3LhhBFfA
         Y6TxCaJJL+wRTh03pq6arf6MbccrXxpsDGfudxYqEKAkGZlk0U3SA2PWcQX8lTvPdSER
         d4xg==
X-Forwarded-Encrypted: i=1; AJvYcCVf6etE/kPqLtjsLuKnaXEe4FaGjI4cjiKy70TwuSAgWbJ8h8U/sQSyd6+a2YHcyGSO4bz18HIHB8m+NRA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2VOlUw60HXVS37u6BYpfOPephrm+C5Sw7NGXpfHfcEGFLzGIG
	cL0Zs0vgL2S2jS2hiPp6N7/BRqytPu91D4KEsQd9j9tbJUPGTLxhWvFqZYviCfE=
X-Gm-Gg: ASbGncs8WfOrUPiTCSIw2pH7rL8nVh83/dcrQ5jRsysy2uLRikTCmZembuU67H3O6bL
	8M/6gXJV/59U1aovbupU6W5jigp1mK0+mlVrcXsfBwJKzZPwlldx+r4NyXHu8c9eo9n6vZ2cKPt
	HThJY+eYIAomEpedyjkJSLy27yl6CDVjtGTqM9XqNXyFSCglYBl5hXoGk5jMnpZus9k/jvK/IiT
	QQMR8Q+1bdmA4yIQ10E9MjFIwTDGN1ylamcZ8yADr4T1zl/glGWji6aryDeRKo3vqQVwC6OrW4a
	rsGXI44BlRgPbkGM5CHcmeigoTsNLbczn4Q3FqN0e/+weRY3kuVauOQu4Q==
X-Google-Smtp-Source: AGHT+IGFd0vA7i2TE/EqWQzSneLkfz1wZqI3DHki2JEKLR0vkj9VuQIpV1+0LuH7EO7EbRwBTj9qwg==
X-Received: by 2002:a05:600c:3c9b:b0:436:5fc9:30ba with SMTP id 5b1f17b1804b1-439249c385cmr37153945e9.29.1738945221124;
        Fri, 07 Feb 2025 08:20:21 -0800 (PST)
Received: from localhost (089144193052.atnat0002.highway.a1.net. [89.144.193.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43907f16ffasm77934055e9.1.2025.02.07.08.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:20:20 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 5/9] riscv: Fix set up of cpu hotplug callbacks
Date: Fri,  7 Feb 2025 17:19:45 +0100
Message-ID: <20250207161939.46139-16-ajones@ventanamicro.com>
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

CPU hotplug callbacks should be set up even if we detected all
current cpus emulate misaligned accesses, since we want to
ensure our expectations of all cpus emulating is maintained.

Fixes: 6e5ce7f2eae3 ("riscv: Decouple emulated unaligned accesses from access speed")
Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 27 +++++++++++-----------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 780f1c5f512a..c9d3237649bb 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -247,13 +247,6 @@ static void __init check_unaligned_access_speed_all_cpus(void)
 	/* Check core 0. */
 	smp_call_on_cpu(0, check_unaligned_access, bufs[0], true);
 
-	/*
-	 * Setup hotplug callbacks for any new CPUs that come online or go
-	 * offline.
-	 */
-	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
-				  riscv_online_cpu, riscv_offline_cpu);
-
 out:
 	for_each_cpu(cpu, cpu_online_mask) {
 		if (bufs[cpu])
@@ -383,13 +376,6 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
 {
 	schedule_on_each_cpu(check_vector_unaligned_access);
 
-	/*
-	 * Setup hotplug callbacks for any new CPUs that come online or go
-	 * offline.
-	 */
-	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
-				  riscv_online_cpu_vec, NULL);
-
 	return 0;
 }
 #else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
@@ -415,6 +401,19 @@ static int __init check_unaligned_access_all_cpus(void)
 			    NULL, "vec_check_unaligned_access_speed_all_cpus");
 	}
 
+	/*
+	 * Setup hotplug callbacks for any new CPUs that come online or go
+	 * offline.
+	 */
+#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
+	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
+				  riscv_online_cpu, riscv_offline_cpu);
+#endif
+#ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
+	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
+				  riscv_online_cpu_vec, NULL);
+#endif
+
 	return 0;
 }
 
-- 
2.48.1

