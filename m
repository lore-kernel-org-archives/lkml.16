Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0973918BC06
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945235; cv=none; b=cv20XRFNmVAH3HLi4tLw4hByhHZbp7w8m0/Dxz83EjBvD8QALOtVcVgQ4kp6rUW/KtoewkoqMo52zLmzzR2GBVZXYNRFLYKtzdcU3I8m3v7/AzsK46nVKKNMOMDSspmOakF0SNtnSEhH/NPWL1KL4QN13cBv2J6gDiZ/AU1Mxt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945235; c=relaxed/simple;
	bh=0LXMXurC6Gawyvm4E1zu7tPTj1mQzsTQk7nAEio62/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gYxF3EFhGXgvI4kPZadhiWd052hnKAEzX8ZcBPRK4YCUGBbDIbOGmB0y2rSj3PXcNoNB7vUhfuRmGBnYC89UN5Gd8iuB4ZslG4LDyiL0cEX3NTtfUVSFpMsu8BfLu4MM1GAFYYtb5e6/ZI9Aum2I7ncJIayTWxgP/76pklMQGQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=AdoiEivH; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="AdoiEivH"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so1116837f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738945232; x=1739550032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Po82zolBmxhVPQkc00G0dtG6NMWIt9O8oQKIvW2rpQo=;
        b=AdoiEivHcdjrbGutj9ZmFSqjLBDNHZ8W33Hj4oinPCcJvpPsYeMssg+uRYQdOzkPrV
         FTsbXr1gfxwrMghFueJbOCvpHKvx/zteD/W//1pKc9derb/i6pg9p9gq/ajvdd4h11YW
         5yr8CKagF21GMU01dI7bc8obWdSM2LNAeykCnNk2wJrB+5FDAldKV24IUNcxsT17aoS5
         dNQK2KrdYB4HRVwSl0niQsXMq8Z5cpVdVaWoNrvfqHsA6q8zAjCxUwFZupUjlwgwBSnc
         XK85M2zPo3qzy2agvL398/EihlaC/Ez2x2FlBV+f9ECU5dzVddbFnXZ1YtsdCVgGUM+u
         TPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945232; x=1739550032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Po82zolBmxhVPQkc00G0dtG6NMWIt9O8oQKIvW2rpQo=;
        b=DyXowioMiwSZQLxYHu8QpZVz5MBH3qpQegNKhTXDZC6FCGotP+jIjuSWu9RE3H0f/T
         QPcqQlMBb4C44t5AtNtFnAwh0rDXK5M/s/Q0OLWRO8F3Wo34h3P4FrkHJ/40KYaSIKNH
         fC/jzH+mG9v/Ae/2l1YXakWF3AHNk9TJMFVcCdLCoU/AYCqkCu+TYLlPV8/yBGS4S8J+
         492wi2uBkRszI9/uqJ4kbdbaQFrTDD4Xp4cGgldo0uJv9wP/3zLn5DIi0YrjcWkwtd+j
         kPWBlWpwOr2j1mwwp37fE5JZIJVwoOFhtzRsSHqIEC8CWusM5qKbWVEujmPylrCelqzX
         95tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzgj+1EYeclusdx3Mr1kg1PSaOYbXRkKAwAD7YZxAndtNtIsz22sp5fo87gdPvirGYfd+tEMO6Lr2d//c=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk0I6WrAPr3QWnTwFpKfeUQXInz37GDB+3mnNSjf4XwE4IS9CK
	7bmSDeuOBL/l6LiH89s2V7WvHTezdsdKvkJfF7TNi1xLDGEyXU039mkipr01914=
X-Gm-Gg: ASbGncsHyiWHdwBzbJ/hEquP2iSHcRmJkyrQlw8s/zMzD/nT0BJZjhkJ/KhcztJRonr
	QSwp6rVBMab9M9wP1mhRdp4EgBjW6alqaxKzb4PDKlKNb1PcmGb2BbmaiR6ec3KBO/1ZrxJf5+q
	Ba0CTBea0kHnrjiyztUSEKwomiteg73rikhojNXyc3D1i1HlkME4sMlCKeMQ5/2zMF7dEzBstOv
	XTO4ZC1RxUzAkIMq9V0xVQjL5x09P6KYfPsJqjaVSmX0xwPl5PbSFTJipo2mN2i1pFrkqKJpS39
	h1YcYtmt6wke2+KlJo/SrPC/Wp2shLOansUbIu0Fzwycg+GpB3dnpQ62eA==
X-Google-Smtp-Source: AGHT+IFYzRkLD2/iNXs8ekCwva+Q7XAjeoRJSdBX1SHt2e7DvSU1eBo/Pp0WwXjQHrpcwp7IId0zvg==
X-Received: by 2002:a5d:598d:0:b0:38d:ac2d:6dbc with SMTP id ffacd0b85a97d-38dc8dc1ab0mr2372712f8f.17.1738945232146;
        Fri, 07 Feb 2025 08:20:32 -0800 (PST)
Received: from localhost (089144193052.atnat0002.highway.a1.net. [89.144.193.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db10b2fsm94032895e9.33.2025.02.07.08.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:20:31 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 6/9] riscv: Fix set up of vector cpu hotplug callback
Date: Fri,  7 Feb 2025 17:19:46 +0100
Message-ID: <20250207161939.46139-17-ajones@ventanamicro.com>
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

Whether or not we have RISCV_PROBE_VECTOR_UNALIGNED_ACCESS we need to
set up a cpu hotplug callback to check if we have vector at all,
since, when we don't have vector, we need to set
vector_misaligned_access to unsupported rather than leave it the
default of unknown.

Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 31 +++++++++++-----------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index c9d3237649bb..d9d4ca1fadc7 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -356,6 +356,20 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
 	per_cpu(vector_misaligned_access, cpu) = speed;
 }
 
+/* Measure unaligned access speed on all CPUs present at boot in parallel. */
+static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
+{
+	schedule_on_each_cpu(check_vector_unaligned_access);
+
+	return 0;
+}
+#else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
+static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
+{
+	return 0;
+}
+#endif
+
 static int riscv_online_cpu_vec(unsigned int cpu)
 {
 	if (!has_vector()) {
@@ -363,27 +377,16 @@ static int riscv_online_cpu_vec(unsigned int cpu)
 		return 0;
 	}
 
+#ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
 	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
 		return 0;
 
 	check_vector_unaligned_access_emulated(NULL);
 	check_vector_unaligned_access(NULL);
-	return 0;
-}
-
-/* Measure unaligned access speed on all CPUs present at boot in parallel. */
-static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
-{
-	schedule_on_each_cpu(check_vector_unaligned_access);
+#endif
 
 	return 0;
 }
-#else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
-static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
-{
-	return 0;
-}
-#endif
 
 static int __init check_unaligned_access_all_cpus(void)
 {
@@ -409,10 +412,8 @@ static int __init check_unaligned_access_all_cpus(void)
 	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
 				  riscv_online_cpu, riscv_offline_cpu);
 #endif
-#ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
 	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
 				  riscv_online_cpu_vec, NULL);
-#endif
 
 	return 0;
 }
-- 
2.48.1

