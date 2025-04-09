Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB902676F4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213015; cv=none; b=EnrOeiJrLW1i1QsuPtUx7Dq3zUOmMkRZyCaopGqNH0YHVsQb8IsxBjVvRQk77kFEqg1p20j1qyQxDQyLrJVlUK7SqYBm2ZZwytwAW6+rLGcKZYLQW5s4uTvcJyEj+kVtdNfZVVAj5YA1jUt3gkE9LR06mXUpnJ1e9ZeCHjOnLlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213015; c=relaxed/simple;
	bh=1IK4Kd00gJfwKOr6L9OKMiq65CdAp6gRhRiFfUxI/8E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jbOPVGqHd8WVFvRny+Xvd3EBPWHeFC6aLTgbnFdGwtgqTv+vjhCbfZU9nogWOGPVhAKAc0/Bu91WRsgEFxak4QT4cLbYYJjqmgSpwIk/ou6sd8Kx4nM21ohB89Ewpg40gl5CpbZiofIgHYqrdDgwZncWI+fqR8Do3WzC1kziQ7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Y6bvw7e5; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Y6bvw7e5"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso703363f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 08:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744213012; x=1744817812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qfUM5mGHhpw8hKZuwlrvDlDzAMvYd8UqjjsU88J1W0w=;
        b=Y6bvw7e5sqD6V0qtGgFY+fwnwhIWt1yTdBF4MELpQIMTNW8m2vkU1n/CpNvy1BsM2T
         kYxJiJnGmR3AM6kZUuez6qnjNG8pzZWj1JKEvE6Gx6UWzv/8/wg47E89xf1L1oeJ/b8z
         4nA/RVW8kffcpfOntPhohlAqAAucCq2MHLuztuSBuZQX3eX+XGwB6v919gtdDTh1/iU1
         cxbf1Ca24WpyIKRMhNbs5+Ft03n2eSX8T/ILxfUO9ZIOuGGP7UTzyq1ZwWePCxG29Ker
         KUQpC2qxO67Knf4dvBGXERyajyJry/yfy2z4bk3Fc30YK5hdYCumgpCEBx1fVtTlL+vb
         p1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213012; x=1744817812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qfUM5mGHhpw8hKZuwlrvDlDzAMvYd8UqjjsU88J1W0w=;
        b=EEM3TKX3JvP5PcoO/Hb7YwLMRA2lRaxkNIzojHn66/y2JZL+3OpeiH6liImvCYZwcn
         baDBUOHjC7b2VK3CSCnzbrM3kchpeFvOqQBFlTklRmWtCGcz93HJhLBlxCruws+YXCcu
         5P4Xt2XKx4QyRUtqLynSzpl1BHy4VCDDG96SWuqMaTeIizrUeAJ1lgIqB0Sxb71j7hH+
         vatmu00f3QoCRvbW424VT/GuGreYG3Z+JjgJXgFs9d/15c7cTngnIESLEGcgtBcNV7ND
         x4auEns8rw69FaA2iG39QCrHFTFNBU8bEgVO4M47wyxe+C97KBv2HJvygl1012Qmn1BU
         Ejxw==
X-Forwarded-Encrypted: i=1; AJvYcCUMI29umQ2xs9tZqMqcwWhx+J28ZA7wV6jx63OlhQkDpZA0x6HjUpGPRc7gVTljaBbAg1O1rfsWYMRr2iU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKGtOHMuhJLoZRjFM7mkPmS/PUhs+AblIyAes4wp8t2AyVJwQy
	bDNwAmq3oiKHiL15Uqi9ytvZU5Iai/b+T9yKwbXznBG5tKOi6H5z+T0lli8shaM=
X-Gm-Gg: ASbGncsAQPJD7LCX5xdjLjLNiSzCfs0F8oTEk65dEa8tqpr6D17A6dmB1KSpFJDtelv
	D4+NqERIT4jepKFXSSLlf37Epd6CmUpy5bzpGzZZrl1/VTycAvFipJc41ywW3siq0OedGjOPRYH
	V671uYw9f+10O5WoKL2UqSEXbBSTfeuMb74IoR4CShzVvHXsEb4ee4KOL9L6yyTNQDM20ACJCAe
	PshdykLzahOT5QrH4pkzZgDqj+jfPM0+6A/9arj0JQ6VDvure9g5Kzr+Jbgx/CWK8qiYUl3/ZUm
	oo4x9rJtbk1dlM02SI8CVLc+xchH
X-Google-Smtp-Source: AGHT+IEHd1ox11xPN2snB8m+aQ/4eSxd2QCdR3SX0Uzkhj5FFWGu2zYPXfDx9gyBtnXRt+W19GbChA==
X-Received: by 2002:a5d:64cd:0:b0:390:e9ee:f27a with SMTP id ffacd0b85a97d-39d88010b83mr2806725f8f.28.1744213011831;
        Wed, 09 Apr 2025 08:36:51 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::31af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893f0cfdsm1961634f8f.76.2025.04.09.08.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:36:51 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	cleger@rivosinc.com,
	alexghiti@rivosinc.com,
	geert@linux-m68k.org
Subject: [PATCH] riscv: Fix unaligned access info messages
Date: Wed,  9 Apr 2025 17:36:51 +0200
Message-ID: <20250409153650.84433-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure we only print messages about command line parameters when
the parameters are actually in use. Also complain about the use
of the vector parameter when vector support isn't available.

Fixes: aecb09e091dc ("riscv: Add parameter for skipping access speed tests")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/all/CAMuHMdVEp2_ho51gkpLLJG2HimqZ1gZ0fa=JA4uNNZjFFqaPMg@mail.gmail.com/
Closes: https://lore.kernel.org/all/CAMuHMdWVMP0MYCLFq+b7H_uz-2omdFiDDUZq0t_gw0L9rrJtkQ@mail.gmail.com/
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 35 +++++++++++++---------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 585d2dcf2dab..b8ba13819d05 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -439,29 +439,36 @@ static int __init check_unaligned_access_all_cpus(void)
 {
 	int cpu;
 
-	if (unaligned_scalar_speed_param == RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN &&
-	    !check_unaligned_access_emulated_all_cpus()) {
-		check_unaligned_access_speed_all_cpus();
-	} else {
-		pr_info("scalar unaligned access speed set to '%s' by command line\n",
-			speed_str[unaligned_scalar_speed_param]);
+	if (unaligned_scalar_speed_param != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN) {
+		pr_info("scalar unaligned access speed set to '%s' (%lu) by command line\n",
+			speed_str[unaligned_scalar_speed_param], unaligned_scalar_speed_param);
 		for_each_online_cpu(cpu)
 			per_cpu(misaligned_access_speed, cpu) = unaligned_scalar_speed_param;
+	} else if (!check_unaligned_access_emulated_all_cpus()) {
+		check_unaligned_access_speed_all_cpus();
+	}
+
+	if (unaligned_vector_speed_param != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN) {
+		if (!has_vector() &&
+		    unaligned_vector_speed_param != RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED) {
+			pr_warn("vector support is not available, ignoring unaligned_vector_speed=%s\n",
+				speed_str[unaligned_vector_speed_param]);
+		} else {
+			pr_info("vector unaligned access speed set to '%s' (%lu) by command line\n",
+				speed_str[unaligned_vector_speed_param], unaligned_vector_speed_param);
+		}
 	}
 
 	if (!has_vector())
 		unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
 
-	if (unaligned_vector_speed_param == RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN &&
-	    !check_vector_unaligned_access_emulated_all_cpus() &&
-	    IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
-		kthread_run(vec_check_unaligned_access_speed_all_cpus,
-			    NULL, "vec_check_unaligned_access_speed_all_cpus");
-	} else {
-		pr_info("vector unaligned access speed set to '%s' by command line\n",
-			speed_str[unaligned_vector_speed_param]);
+	if (unaligned_vector_speed_param != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN) {
 		for_each_online_cpu(cpu)
 			per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
+	} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
+		   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
+		kthread_run(vec_check_unaligned_access_speed_all_cpus,
+			    NULL, "vec_check_unaligned_access_speed_all_cpus");
 	}
 
 	/*
-- 
2.48.1

