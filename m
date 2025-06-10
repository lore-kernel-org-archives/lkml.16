Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE6A278E41
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749539913; cv=none; b=Djr0W1XUbORlm/nT4TVc1KOd/sL4ijRe9aRXfAO087uUBxgxiP36URNL5J2zowGH4TcvenAXex6vW/lj13DjKZTs9kzaFXhLl2ZHAi8bzKFquPMQLzDyDS+VpKwnkOEzDh3b97vZYd2p8zm9SzP+ePtdYYPlI0O7ac/XnNsQoNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749539913; c=relaxed/simple;
	bh=KHQLDsJ4E+kG/B+xHajjkoc/MZlUo7hjn+WFDIwXVtw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Aq0bs2XNlc2w1/jKZv4TfFfOjzDl9ofVAOwNjGJRYJc6l3H9wd+wZXbuxxO4TKv+Cg1/PtDvqvsIXDYx7ySQk5ZnNlV9bYcgeWZCTxKmXXFOKuAG2HZSIfZAwohrdPDd76VsY8We7SuSBfqjvuFEWWcwfBKqK+cdRZLdckqFafc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DzWk9FJ5; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DzWk9FJ5"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4e58d270436so1797155137.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749539910; x=1750144710; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SkHumX+B+y86i8MSC5SJDKQ6nFwDO3pplzjQCYTDa/A=;
        b=DzWk9FJ5p5buHP5wsEAgTx2+YwHVnFAIaFUhqj0cGYXYUwA1Li+Z73RXGfycLoubM6
         qY6MT8vCRUJxw3eiYnaUFvf3E32re/Nf6l6B4CniqwbR/9ikpclDh1qt4RAtOytHv7rA
         umNgogFgdngUzu883gpjb9qEgiCpT8jqqzC1fx6+W36K/KCBfR/FiZO7vA0IIgLOlNnE
         I73H2IOU2OlIMAXam5UjDB9fLhYT7gVGHeSXPIQRdnE286+eX+P8dafePJ+Hc16HzWMi
         kbDJWVn3JudRfClrnlwqiHEpEMqBe7n+AqmfwA+AR079t6zML5xiFsoFvLqw3hm/JIiT
         Tv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749539910; x=1750144710;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SkHumX+B+y86i8MSC5SJDKQ6nFwDO3pplzjQCYTDa/A=;
        b=LNhFnowswpRbzmzRu7rYbsIi2UrLUQQ77C3COLvHA16knRVyqwvu+k4SmzQwliuXPp
         jGDAtc6VBg3Abgn+fav+lI6RdU5LzYEjs1cd/xMaf/72UjJ31b0iTCnPRrhyVoLZjZVK
         5rA9AEB5I87PmkYo3PX118O4BLMbEO1qLrs4ImCJUXvoa9praKpp4hEcyxYU80aw/jTK
         SR1BDsU7rMikgWSy9Feob21ZtD5oLAUwKxIQ8y98ILQsr9w0dTjgwsgC47veY+20eWrQ
         dvKsayvjjLN3RhW/4c9LBHhSaOI7QfZ5Wbc1UpaKiBJDi+FkCxipbNORaDGeTE7EwQHG
         KC+g==
X-Forwarded-Encrypted: i=1; AJvYcCV36QqI3uUCqKj5LgsksCo1Eog1SoKlLX/URFkwVkL0O4sup4/JR4y2KpHTnXpcmRuo2pHwS82lF3RP1bA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwALH/EE6iV3aUoZxnhRRKV3eN2ZUiuky3eQxR2SQdUPHf1CcdD
	vBNqjL5EuoybEpq7Q8H9v6UmNsiQVIvnT6zpt8YJcbMFu9O4e0YsnKBzuytdyLlfJpLHYPxZ0yo
	j7Dsls6aINewIo44n6LWZju6ILAdZkwnVST6PXWeTRg==
X-Gm-Gg: ASbGncvyTv0LAyT9V+LqeASBTI5EUZZgJRTyXy3OX9Qd4T7ukHFIji7v3xK3AHuUURe
	QPVNVQLwq1A7QjoaJ0T05ZLwWL5KlFbpT9O4zDD9WN5TVd/ZK8P42uRJInZsv1LNInEWhDJuEYP
	ucZD9mnn4PKWRZGpgR3KYWAqTmLhCJFlCf6Qjjw/Yc7w7KItCgXx9uQdhrviL+QqhND8y91JGUt
	TQP
X-Google-Smtp-Source: AGHT+IEWeK8X5+m8ElJSK5z3+ETpZn+gitvlG/z+JagvODDs6mTjgbOyPmSCoIASAzlc/+Rww7q/dUQ/dbl/qwPi6yI=
X-Received: by 2002:a05:6102:4403:b0:4e2:a5b9:df1d with SMTP id
 ada2fe7eead31-4e7729acf70mr12705549137.8.1749539910181; Tue, 10 Jun 2025
 00:18:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 10 Jun 2025 12:48:18 +0530
X-Gm-Features: AX0GCFs5HGZPW_5vlnOtlFErN9wZOl5LWlGniaDfW8i9KS2B_HI6AE7jX17fEGo
Message-ID: <CA+G9fYsYVuEpL5KnYdq4ciRmpnUMQqkNQHmy7y5XvUm48kjxyA@mail.gmail.com>
Subject: Juno-r2 WARNING kernel time clockevents.c cev_delta2ns clockevents_config.part
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regression while booting Juno-r2 with the Linux next-20250606
the following kernel warnings found.

This boot warning was reproduced with juno-r2.dtb and juno-r2-scmi.dtb.

Regressions found on Juno-r2
- boot warning

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

First seen on the next-20250606
Good: next-20250512
Bad:  next-20250606

The suspected patch that found between tags is,

# git show next-20250512..next-20250513 --
arch/arm64/boot/dts/arm/juno-base.dtsi
commit 1fa3ed04ac55134063e3cd465b41aeb26715e52a
Author: Sudeep Holla <sudeep.holla@arm.com>
Date:   Mon May 12 11:11:32 2025 +0100

    arm64: dts: arm: Drop the clock-frequency property from timer nodes

    Drop the clock-frequency property from the timer nodes, since it must be
    configured by the boot/secure firmware.

    Cc: Liviu Dudau <liviu.dudau@arm.com>
    Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
    Cc: Mark Rutland <mark.rutland@arm.com>
    Message-Id: <20250512101132.1743920-1-sudeep.holla@arm.com>
    Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi
b/arch/arm64/boot/dts/arm/juno-base.dtsi
index 055764d0b9e5..9ccb80821bdb 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -10,7 +10,6 @@ / {
        memtimer: timer@2a810000 {
                compatible = "arm,armv7-timer-mem";
                reg = <0x0 0x2a810000 0x0 0x10000>;
-               clock-frequency = <50000000>;
                #address-cells = <1>;
                #size-cells = <1>;
                ranges = <0 0x0 0x2a820000 0x20000>;


Boot regression: Juno-r2 WARNING kernel time clockevents.c
cev_delta2ns clockevents_config.part

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Boot warning
[    0.000000] timer_sp804: timer clock not found: -517
[    0.000000] timer_sp804: arm,sp804 clock not found: -2
[    0.000000] Failed to initialize
'/bus@8000000/motherboard-bus@8000000/iofpga-bus@300000000/timer@110000':
-22
[    0.000000] timer_sp804: timer clock not found: -517
[    0.000000] timer_sp804: arm,sp804 clock not found: -2
[    0.000000] Failed to initialize
'/bus@8000000/motherboard-bus@8000000/iofpga-bus@300000000/timer@120000':
-22
[    0.000000] arch_timer: frequency not available
[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at kernel/time/clockevents.c:38
cev_delta2ns (kernel/time/clockevents.c:38 (discriminator 1))
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
6.15.0-next-20250605 #1 PREEMPT
[    0.000000] Hardware name: ARM Juno development board (r2) (DT)
[    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.000000] pc : cev_delta2ns (kernel/time/clockevents.c:38
(discriminator 1))
[    0.000000] lr : clockevents_config.part.0 (kernel/time/clockevents.c:499)
[    0.000000] sp : ffff800082923cd0
[    0.000000] x29: ffff800082923cd0 x28: 0000000000000400 x27: ffff800081650000
[    0.000000] x26: ffff80008292fcc0 x25: ffff800082425888 x24: ffff8000829343c0
[    0.000000] x23: ffff800083210000 x22: 000000000000000b x21: ffff8000823cf178
[    0.000000] x20: ffff800082433880 x19: ffff00080021e240 x18: 0000000000000000
[    0.000000] x17: ffff00080021a400 x16: ffff00080021a200 x15: 0000000000000100
[    0.000000] x14: fffffdffe0008a00 x13: ffff800080000000 x12: 0000000000000000
[    0.000000] x11: 0000000000000068 x10: 0000000000000100 x9 : ffff8000801b50f8
[    0.000000] x8 : 000000001dcd6500 x7 : 000000003b9aca00 x6 : 0000000000000020
[    0.000000] x5 : 0000000000000020 x4 : 0000000000000000 x3 : 0000000f00000000
[    0.000000] x2 : 0000000000000000 x1 : ffff00080021e240 x0 : 000000000000000f
[    0.000000] Call trace:
[    0.000000] cev_delta2ns (kernel/time/clockevents.c:38 (discriminator 1)) (P)
[    0.000000] clockevents_config_and_register (kernel/time/clockevents.c:519)
[    0.000000] arch_timer_mem_frame_register
(drivers/clocksource/arm_arch_timer.c:1319
drivers/clocksource/arm_arch_timer.c:1580)
[    0.000000] arch_timer_mem_of_init
(drivers/clocksource/arm_arch_timer.c:1653)
[    0.000000] timer_probe (drivers/clocksource/timer-probe.c:31)
[    0.000000] time_init (arch/arm64/kernel/time.c:62)
[    0.000000] start_kernel (init/main.c:1014)
[    0.000000] __primary_switched (arch/arm64/kernel/head.S:247)
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] arch_timer: cp15 and mmio timer(s) running at 50.00MHz
(phys/phys).

## Source
* Kernel version: 6.15.0-next-20250513 to 6.15.0-next-20250606
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 4f27f06ec12190c7c62c722e99ab6243dea81a94
* Toolchain: gcc-13

## Boot details
* Boot lava log: https://lkft.validation.linaro.org/scheduler/job/8309469#L622
* Boot log: https://qa-reports.linaro.org/api/testruns/28679128/log_file/
* Boot warning:
https://regressions.linaro.org/lkft/linux-next-master/next-20250605/log-parser-boot/exception-warning-cpu-pid-at-kerneltimeclockevents-cev_delta2ns/
* Build link:  https://storage.tuxsuite.com/public/linaro/lkft/builds/2y4wgEvmeoVH3Vr528M4YN2OBXY/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2y4wgEvmeoVH3Vr528M4YN2OBXY/config

--
Linaro LKFT
https://lkft.linaro.org
