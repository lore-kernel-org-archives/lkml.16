Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F602ECD34
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750443471; cv=none; b=TXHZooTdmhodxetjf4oPvhijJBb+qGhRldYYmZz+vBSvCApdpAGfpJKnaJjG5IQIwoGqFUPTsOIvq43MqfJeegtZ2yLOLUrRRoU3hVwhdlj7NQdPU1mi+jIF5WxxovFRjJ3sDL/7hlhM6zXOhV/dNHP79B1bBaYwNGzjanibTKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750443471; c=relaxed/simple;
	bh=qdxcwdOlQ3EdsQcn5czc5e/96PPBxIfgnyOOP8Kx86M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iU3VUBIzercopWlVBtimZO3sa/B3WtA7KYJVMxxCd2dm+d5fgFcMZ62cJFnst0Mc6xhxSuMIN9Gd8VUZpp5gyOe6Fy8C/cCGBalzMlsIvuoJEn9oKx56MC4l0xSNe0ex+hyKaHPMK5AG+kYdYjULp4lyP0UmlqNB88moJQGfVWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yjTuIaNq; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yjTuIaNq"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b0e0c573531so1418608a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750443469; x=1751048269; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KucomvysAjkq7Mc20S0WzT2rldg2A7wys58v4bjZBcg=;
        b=yjTuIaNqXautQ/wHGc8RJ8CQ1oUw61wmO4b9F2Q8Q0E+DhQ1LDgTMG/N3Ye0JYkpXQ
         bDjMHulvLr1LrFioiP8ZS3DEaEsBJ5lrNbvG3KIFDYbwC09j64zDun8RLf9U0PH2B1iT
         O/+5ejXOwvKb6yR30AM/hvlYxsNWbv7Ft2NfKa/jDIknBsEyhTlDDM6QB8YrHxmakRVG
         Wfq7tJ7T3cB9tAefTWmwUvrET8BkJvm6t4PRVpDLVEWqulZM+mBytBOWmyu6N2THUNCK
         dFMyCWWvW+36SmXZZgD1C6kVqJsgRFGCU568XKN2pbFZg7iE3N/Kc1RpOovoWiNr3odm
         NmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443469; x=1751048269;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KucomvysAjkq7Mc20S0WzT2rldg2A7wys58v4bjZBcg=;
        b=q0MH+UwvlhdDOJtn7Ctr/7taG1rJB+/W3T/q07ZjgRCtnf7u/oChc5ns/2I6l3+EWw
         uFDpHfwKb8MCPSBwgilBZthbF81FsLgCjMcmZqvkvr8Ssz/PwT0kpsMnXdrGHGdKhEFl
         8a+AZf5jyTPryr7BqtwLs1RPclgW0G/G0ZGOOzEbP9bILUQlZca0k40w8SjblIqN1fWd
         9Auxzc+EWB7+Z/HnImWt0fmCd6sIDd+5J5s/GVRdMnzV2P0Ae6aM5QWuZZLiQqe1xOMW
         49vTnHOITVOOB+WAlp1y8wJpOwmWhzyp6Egz/4N6NTPpLjSKKvLcgS8Q4Z3diZ6/OTFJ
         yB7w==
X-Forwarded-Encrypted: i=1; AJvYcCVy4r5IkR6hwXZGHhSh7U5ZdnCVz3Qz9GTzdcYnRECnGcGIt0MbyepaxXxdzegXGvLUqy8RyLSDzQh6E0I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5ewxwRs69dUZeoiAH7pqvxTCfrYhpUTgI7RiUYuXW21ptnr4j
	wwZi/Fnvk/QbKYySkiw0/MS1b/9frBHy9tTHWgd9x/ofwCyP3vJHQeRxoetKo1NmUhdUqZZFA3K
	eTe7C5MMR6gOu/uF8Q3Bnoq+CZYZ8Ww==
X-Google-Smtp-Source: AGHT+IHpdvlqIvd5OPMBnBWNmW/55tcTKxbpdQaDGPMx3/p+0hFPHDCPkEbjUA750R9QqBN1jh56itwHNkqhRDPQ52g=
X-Received: from pge20.prod.google.com ([2002:a05:6a02:2d14:b0:b2f:637a:a7d0])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:9f8b:b0:1f5:7ea8:a791 with SMTP id adf61e73a8af0-22026c30688mr5635494637.10.1750443468893;
 Fri, 20 Jun 2025 11:17:48 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:17:07 -0700
In-Reply-To: <20250620181719.1399856-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250620181719.1399856-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250620181719.1399856-5-willmcvicker@google.com>
Subject: [PATCH v4 4/6] clocksource/drivers/exynos_mct: Fix uninitialized irq
 name warning
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The Exynos MCT driver doesn't set the clocksource name until the CPU
hotplug state is setup which happens after the IRQs are requested. This
results in an empty IRQ name which leads to the below warning at
proc_create() time. When this happens, the userdata partition fails to
mount and the device gets stuck in an endless loop printing the error:

  root '/dev/disk/by-partlabel/userdata' doesn't exist or does not contain a /dev.

To fix this, we just need to initialize the name before requesting the
IRQs.

Warning from Pixel 6 kernel log:

[  T430] name len 0
[  T430] WARNING: CPU: 6 PID: 430 at fs/proc/generic.c:407 __proc_create+0x258/0x2b4
[  T430] Modules linked in: dwc3_exynos(E+)
[  T430]  ufs_exynos(E+) phy_exynos_ufs(E)
[  T430]  phy_exynos5_usbdrd(E) exynos_usi(E+) exynos_mct(E+) s3c2410_wdt(E)
[  T430]  arm_dsu_pmu(E) simplefb(E)
[  T430] CPU: 6 UID: 0 PID: 430 Comm: (udev-worker) Tainted:
         ... 6.14.0-next-20250331-4k-00008-g59adf909e40e #1 ...
[  T430] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE
[  T430] Hardware name: Raven (DT)
[...]
[  T430] Call trace:
[  T430]  __proc_create+0x258/0x2b4 (P)
[  T430]  proc_mkdir+0x40/0xa0
[  T430]  register_handler_proc+0x118/0x140
[  T430]  __setup_irq+0x460/0x6d0
[  T430]  request_threaded_irq+0xcc/0x1b0
[  T430]  mct_init_dt+0x244/0x604 [exynos_mct ...]
[  T430]  mct_init_spi+0x18/0x34 [exynos_mct ...]
[  T430]  exynos4_mct_probe+0x30/0x4c [exynos_mct ...]
[  T430]  platform_probe+0x6c/0xe4
[  T430]  really_probe+0xf4/0x38c
[...]
[  T430]  driver_register+0x6c/0x140
[  T430]  __platform_driver_register+0x28/0x38
[  T430]  exynos4_mct_driver_init+0x24/0xfe8 [exynos_mct ...]
[  T430]  do_one_initcall+0x84/0x3c0
[  T430]  do_init_module+0x58/0x208
[  T430]  load_module+0x1de0/0x2500
[  T430]  init_module_from_file+0x8c/0xdc

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/exynos_mct.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index a5ef7d64b1c2..62febeb4e1de 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -465,8 +465,6 @@ static int exynos4_mct_starting_cpu(unsigned int cpu)
 		per_cpu_ptr(&percpu_mct_tick, cpu);
 	struct clock_event_device *evt = &mevt->evt;
 
-	snprintf(mevt->name, sizeof(mevt->name), "mct_tick%d", cpu);
-
 	evt->name = mevt->name;
 	evt->cpumask = cpumask_of(cpu);
 	evt->set_next_event = exynos4_tick_set_next_event;
@@ -567,6 +565,14 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 	for (i = MCT_L0_IRQ; i < nr_irqs; i++)
 		mct_irqs[i] = irq_of_parse_and_map(np, i);
 
+	for_each_possible_cpu(cpu) {
+		struct mct_clock_event_device *mevt =
+		    per_cpu_ptr(&percpu_mct_tick, cpu);
+
+		snprintf(mevt->name, sizeof(mevt->name), "mct_tick%d",
+			 cpu);
+	}
+
 	if (mct_int_type == MCT_INT_PPI) {
 
 		err = request_percpu_irq(mct_irqs[MCT_L0_IRQ],
-- 
2.50.0.rc2.761.g2dc52ea45b-goog

