Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35924126C03
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 14:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551542; cv=none; b=qVYTWkYTcSWiQD9se1XXuS23WMqvqMQNDQHtr3VCUv6rWEPduKd7XJWBp+xuzUqLU2HkFVQqrm+zWiN40zGfFlzB4z5eUcH11VZysSDK+uIOVsygnPYr2ZSLQdvr9shNJMqoC4HKBSdo0x05kszmhBjZMCqx06ketc/0X/y6X2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551542; c=relaxed/simple;
	bh=RFhmM+0SWORGoM20VwdPsAHkqBELRVeudXp7nbrppv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O+YQsr6WiK/+MP6KewYNpCkBvQwpbdgUVk6UCR2zyanCjwOcXnZeu9PP2Y543hQfWruKTDaM7RBLYvwGanpZSmeqajkzjJ/kpAQVUUljz87KE5YjjiD2I+V0mZKFfrpcn5kww9/mljHvCzDMPMeGOqrARRdgsEF1ma5ROAg+7SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXlJH26f; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXlJH26f"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54d98aa5981so8188791e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 07:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751551539; x=1752156339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JmUr7a9e0PATdvV0LHXQVvdSyYTobgcYcqniNe1h/bk=;
        b=HXlJH26f5UrDs70ngFYWiXmKL/HotS0aQKKSQvA29Vviwh+netlCyWGbO2b9Y2kiMr
         BcUkPU9eoBe52kkMp7avGurvDJlM38kyNjY+UV0DvWFXarnha2wWXs7Rn4h8spyswvIf
         2hQQy9tP2Xjeu6diD5k2YzMYfkdinOlgf3VNkeuRb3liRBFsf+iv5H4QXb5WBOcK+rfm
         gUQhpn0H4Agk3ouwDOC+YEHavCa9zGgGhRBY59XcMQvYLIaBGSoRjqK96BAQCMZkr1m5
         ySYtXgIm2hJ/8c07PrKHAU8KNufClvNeMTKpM0NmZU6vIxY4Uprk35JpqCukCyTYj4KS
         aJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751551539; x=1752156339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JmUr7a9e0PATdvV0LHXQVvdSyYTobgcYcqniNe1h/bk=;
        b=qrqsZRUeaW6QQ1zU0mj04b8g/E9R355HV99r3xarAsdSn4quIHfNvrDE5kH1sCWNsr
         zCKMsGUNDk5VnW3DpJ8qZbQeAqIt6QGzEghP10PMT1Bmj5xhgUOEq0BNl/5XBvjMbA6k
         E8pzDURLBNz6VgoNvWhANaCYEfnDBwvrOgNNJ+GVbAho6dc7x25eyIL7Hkxe7ucuyBHE
         D16p/kK7OIJ0f9XwdLhKZpVLGQgqdNuTx9sgK4CauJr22F6cPNA23/rBC9n7Tto7zv6R
         BKIAVH2oGFnhOcmm36cklgzgESjFNSuZ5+RYAYofEzmET6ONOq7HtRIgA4J2nuna2YeI
         gziA==
X-Forwarded-Encrypted: i=1; AJvYcCVs6/guNpXwssWzy/g/Ar4zknuAo5dUJCj6TBKFJGCnA2s+J8v4uzfrp1O5CtdPvEQARwSWYLh6xKtyX+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCR6MhcsllJwk8X6xMsU9piuuoG/GCX5nwgz6yWni/xH2g/M8z
	sAcinxeVkSXVSVgHUv9T6TlyvOPn1xGFn9qHCLXPnsWssvy4BXuhbl4k
X-Gm-Gg: ASbGncs8RiRu4EIAJ5l6yEbimhVotP65Tm9ydNSddx3zM5OXtA58OSrMS8Htmfb0OHQ
	VuQZY6g3gGvmftcuCJ7Q1REGbhQ/Weg6tZbvbvUzKPhwSuCCGCjTY6YkBTozfIkP/2LL/PKWPHh
	8mV0B9oOIP+8HonmaEykQ84bYqsWspOhK6KbFJkA/ipafxN2uoH7BXBLccIXl/ic+lx08iTmWPm
	Mum5g7mYjnEQl6fDJLETpJdxXWTv+HsQOkLhumMRDyOxMT6oobI+HG1gg/pZgW+Nah1awODu0YP
	RnMU8xe2MO8FxNRwLfNwWJe+tya9BwJ5j1LqbneuukVxTDqZ7YaYTrR3uRbhkJNppV6ytJx5/QI
	rs95FgPJApw==
X-Google-Smtp-Source: AGHT+IH3oVtukEMZKjnNjSNsZF/v94pisXnFb81xGOvkRQiVVqdLP6ILpVrCEuXxOzNZO5u54DBolA==
X-Received: by 2002:a05:6512:12d1:b0:553:3178:2928 with SMTP id 2adb3069b0e04-556282c250bmr2919602e87.16.1751551538784;
        Thu, 03 Jul 2025 07:05:38 -0700 (PDT)
Received: from localhost.localdomain ([80.87.144.137])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2a73ebsm2442274e87.101.2025.07.03.07.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 07:05:38 -0700 (PDT)
From: Alexander Kochetkov <al.kochet@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexander Kochetkov <al.kochet@gmail.com>
Subject: [PATCH] ARM: rockchip: fix kernel hang during smp initialization
Date: Thu,  3 Jul 2025 17:04:53 +0300
Message-ID: <20250703140453.1273027-1-al.kochet@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to bring up secondary CPUs main CPU write trampoline
code to SRAM. The trampoline code is written while secondary
CPUs are powered on (at least that true for RK3188 CPU).
Sometimes that leads to kernel hang. Probably because secondary
CPU execute trampoline code while kernel doesn't expect.

The patch moves SRAM initialization step to the point where all
secondary CPUs are powered down.

That fixes rarely hangs on RK3188:
[    0.091568] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.091996] rockchip_smp_prepare_cpus: ncores 4

Signed-off-by: Alexander Kochetkov <al.kochet@gmail.com>
---
 arch/arm/mach-rockchip/platsmp.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-rockchip/platsmp.c b/arch/arm/mach-rockchip/platsmp.c
index 36915a073c23..f432d22bfed8 100644
--- a/arch/arm/mach-rockchip/platsmp.c
+++ b/arch/arm/mach-rockchip/platsmp.c
@@ -279,11 +279,6 @@ static void __init rockchip_smp_prepare_cpus(unsigned int max_cpus)
 	}
 
 	if (read_cpuid_part() == ARM_CPU_PART_CORTEX_A9) {
-		if (rockchip_smp_prepare_sram(node)) {
-			of_node_put(node);
-			return;
-		}
-
 		/* enable the SCU power domain */
 		pmu_set_power_domain(PMU_PWRDN_SCU, true);
 
@@ -316,11 +311,19 @@ static void __init rockchip_smp_prepare_cpus(unsigned int max_cpus)
 		asm ("mrc p15, 1, %0, c9, c0, 2\n" : "=r" (l2ctlr));
 		ncores = ((l2ctlr >> 24) & 0x3) + 1;
 	}
-	of_node_put(node);
 
 	/* Make sure that all cores except the first are really off */
 	for (i = 1; i < ncores; i++)
 		pmu_set_power_domain(0 + i, false);
+
+	if (read_cpuid_part() == ARM_CPU_PART_CORTEX_A9) {
+		if (rockchip_smp_prepare_sram(node)) {
+			of_node_put(node);
+			return;
+		}
+	}
+
+	of_node_put(node);
 }
 
 static void __init rk3036_smp_prepare_cpus(unsigned int max_cpus)
-- 
2.43.0

