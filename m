Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF20236D
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 16:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747586486; cv=none; b=e7tRR9hstxF75ch6DmF/+ujXnWDsS1tk6TFeKzhEFRfFcjlLmj08vYMsDbG08BQepEgN7TSUlIJt8wTVJ0MIzFeClfptS0tKy2zguMT60giA/mzx/85B0eVRI8x35iclRVOSIxvDyjpfZ8sZDcnAXxkgnj0RosLeq7YPO17S4D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747586486; c=relaxed/simple;
	bh=flyQrErcaDeYGqXGq+B+sPOzFqMI8XoPFcb3KSLgGpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jgpAKZQZ4NoTfctEfkhZ02JAfKu2H6ZGl/BgoJTVGKrIHQKZ74Ronz/9ubmyl9qA25Abkj8yaweimmWbZoegzgUn/AodGFSbJGtD69OG+/iqG78ksSS0A0dJyRlTOHih4MkTOsB6RwC1V0gSz92HmP+EzFm8vN+4+YfT+IHyAhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbGbrZpy; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbGbrZpy"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-742caef5896so246496b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747586484; x=1748191284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=NGJ5rqBC7WbitGDnZ0mNGgmapTnH34KgA6S43fvjY00=;
        b=lbGbrZpyEtk3/i2Jb4//8NvXhr3JsIQs3Ynr4hxMyEuS298A2rUFL7JpUK+g1O53Zd
         vBN1nbiNkf/q41iiCWYgwtHVioQY4gxqnlsSMw1n9YEcbhl22R/nx3bGvL64eT9/B4zD
         SUY9lg5Um0iV20zLLKQ3rgMBYQkUL6T+MYB2aZMXtUe5+3sxquH6VmJG63cuo/QSZZOg
         me94hpfnpZxqy08Xhcrno/x1Z2giX2VsJImy1LCgeK+gTa5l/JOYlv1GLG7jXZ7lcLQU
         QJb0OXizHYxmZdJoNwoXhrr8/Oak8ydfSzSX0KKUai9RR0T2407abaYBikvq3JSValeG
         nIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747586484; x=1748191284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGJ5rqBC7WbitGDnZ0mNGgmapTnH34KgA6S43fvjY00=;
        b=AdQS8Y1LLX3/K4jCJPORh3xU3dvUBCsWkgLPchLtmkm48jbMRCFuQqyJqj2AwnikFr
         CVhiZ2DOVzeVyqIFk8XiVJTzNEdRaIa3ZmDVjNq0PSm1HfmaS6cylfASj5ySUSw6L/fS
         ONXs9JuX4qKvUl/CS1/71cKGIeuujVlXwBthge7r4wc9e2QDs8EE+uIexR6nh688KFwX
         I4Oh1Ti2XZUhQK2XtOB5BE9bGa7NlCOLpp/Y6Ow8rUeo+CUG9kWOQ1FNy/xev/3ryknX
         XFwHrO+1ROjzFBHx90nh9Kwv4xPis2/OcRS/lP2+PONwUYOGWaRBGqMbB2Slqhr2jwRV
         2PyA==
X-Forwarded-Encrypted: i=1; AJvYcCWlik/lfMtX4wB88HS/0NvI+ZJefhc+ArmSEPDP7H/YdcuTTBUHGQ6tILBVGmz6mhDivsmpqvG3Je+GeYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrG/LR1sl/VRjBerLJK8LcpWrSxUhcoq3CBQH1H+b3/fyXnk1T
	BbD/K6MgRwkqNqNz+ZHtasRBXv2yJt6zSn6TnHfSt3f3R5Jy9XaxU41J
X-Gm-Gg: ASbGnctSByZ2+OCMivak9inpIdJXU8FwCnvLQTNG5LraS1z4nCxCYg3SAIjEe5TGtDc
	j80sbkZalROQKYbder73ySnW5SWH6qdzjxmDv1MKzKnQwiGwFtE8P9VTmH9+4VbGVsZahNzR7dC
	eJmn+O5/KusPelYlAElU1z919FCixzNFgeaiQzCKFnil+IsGjnbQK9EzkJrNKp4DWp42+0OvaaJ
	oqP6DgU9af3erhIpzmRNhOpui+8QaBE9i8NQSEWCUkG5zINuRADubN5vXeG394jYL9FVocs+jAB
	IjG52btelz94U78zg+1QfDsBq3LcIVzpGrnnE1wlou4KO8nDXQdFwKMuTlQRhAW1
X-Google-Smtp-Source: AGHT+IGpcmzbvOjTwEWfKyz0NR5r88tR69+PRwvb3xEu4Qb74Qw2Id1qqyBUkxPFhlZZvE6xhqzJgQ==
X-Received: by 2002:a17:903:2582:b0:232:1daf:6f06 with SMTP id d9443c01a7336-2321daf701fmr31313455ad.47.1747586483869;
        Sun, 18 May 2025 09:41:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231e2118b07sm42255275ad.43.2025.05.18.09.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 09:41:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] ARM: integrator: Fix early initialization
Date: Sun, 18 May 2025 09:41:18 -0700
Message-ID: <20250518164118.3859567-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starting with commit bdb249fce9ad4 ("ARM: integrator: read counter using
syscon/regmap"), intcp_init_early calls syscon_regmap_lookup_by_compatible
which in turn calls of_syscon_register. This function allocates memory.
Since the memory management code has not been initialized at that time,
the call always fails. It either returns -ENOMEM or crashes as follows.

Unable to handle kernel NULL pointer dereference at virtual address 0000000c when read
[0000000c] *pgd=00000000
Internal error: Oops: 5 [#1] ARM
Modules linked in:
CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.15.0-rc5-00026-g5fcc9bf84ee5 #1 PREEMPT
Hardware name: ARM Integrator/CP (Device Tree)
PC is at __kmalloc_cache_noprof+0xec/0x39c
LR is at __kmalloc_cache_noprof+0x34/0x39c
...
Call trace:
 __kmalloc_cache_noprof from of_syscon_register+0x7c/0x310
 of_syscon_register from device_node_get_regmap+0xa4/0xb0
 device_node_get_regmap from intcp_init_early+0xc/0x40
 intcp_init_early from start_kernel+0x60/0x688
 start_kernel from 0x0

The crash is seen due to a dereferenced pointer which is not supposed to be
NULL but is NULL if the memory management subsystem has not been
initialized. The crash is not seen with all versions of gcc. Some versions
such as gcc 9.x apparently do not dereference the pointer, presumably if
tracing is disabled. The problem has been reproduced with gcc 10.x, 11.x,
and 13.x. Either case, if the crash is not seen, the call to
syscon_regmap_lookup_by_compatible returns -ENOMEM, and
sched_clock_register is never called.

Fix the problem by moving the early initialization code into the standard
machine initialization code.

Fixes: bdb249fce9ad4 ("ARM: integrator: read counter using syscon/regmap")
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/arm/mach-versatile/integrator_cp.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-versatile/integrator_cp.c b/arch/arm/mach-versatile/integrator_cp.c
index 2ed4ded56b3f..03dfb5f720b7 100644
--- a/arch/arm/mach-versatile/integrator_cp.c
+++ b/arch/arm/mach-versatile/integrator_cp.c
@@ -86,14 +86,6 @@ static u64 notrace intcp_read_sched_clock(void)
 	return val;
 }
 
-static void __init intcp_init_early(void)
-{
-	cm_map = syscon_regmap_lookup_by_compatible("arm,core-module-integrator");
-	if (IS_ERR(cm_map))
-		return;
-	sched_clock_register(intcp_read_sched_clock, 32, 24000000);
-}
-
 static void __init intcp_init_irq_of(void)
 {
 	cm_init();
@@ -119,6 +111,10 @@ static void __init intcp_init_of(void)
 {
 	struct device_node *cpcon;
 
+	cm_map = syscon_regmap_lookup_by_compatible("arm,core-module-integrator");
+	if (!IS_ERR(cm_map))
+		sched_clock_register(intcp_read_sched_clock, 32, 24000000);
+
 	cpcon = of_find_matching_node(NULL, intcp_syscon_match);
 	if (!cpcon)
 		return;
@@ -138,7 +134,6 @@ static const char * intcp_dt_board_compat[] = {
 DT_MACHINE_START(INTEGRATOR_CP_DT, "ARM Integrator/CP (Device Tree)")
 	.reserve	= integrator_reserve,
 	.map_io		= intcp_map_io,
-	.init_early	= intcp_init_early,
 	.init_irq	= intcp_init_irq_of,
 	.init_machine	= intcp_init_of,
 	.dt_compat      = intcp_dt_board_compat,
-- 
2.45.2

