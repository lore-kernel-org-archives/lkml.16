Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4A223ED7B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 19:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142284; cv=none; b=rkrsnFtHCPiPmJT+gROqMp85wWrWoWqjC/top6AfQb6PUYWlEAykH3xQ5AQZrOW8MbidpBc+lPAHTX2oXJBIaWSGjtOtfcB/aPsLnQGE9Rhlh4Ai+fXQaGnYv60rPs8RnbOeNaFefonadCoegancrrbR1aQurTpYXc0L3pxZ1M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142284; c=relaxed/simple;
	bh=Kkj9GohePdbHPB9rpAZSOl6dv06PU7x0WQC/liO3+mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UF3BPwDGINIJbU3pNvDQKYga011Ok6ViG2bFmb5hWs5TcFc9TNyyLE//7oJxWU3Okl5if/g1Rf4Ls1vdhA6fafdt1queCE97gFle2WTsDqFdFNjBqA0RV1MUNn/rKFqj4Y+Tdyj/mCyyjSMP9iPvMQ4W+jWj/BjtRu/BrQ6RGN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kVvtbMIT; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kVvtbMIT"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-af5085f7861so3797002a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 12:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744142281; x=1744747081; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lduEcIzJil9047xkgT6hDyNCUaJld8YJ1rfKXfQjuxU=;
        b=kVvtbMITITbU3AaWOuIV3TVYn6DEO+YbA9k0k0pJ4YkE6smkY4YvMrcItSiFRgeI0M
         wAzhXreNYHieO1QNL83hOoXdZLgkKtJ8ngrDvwDkDC6LVD3YzrbTLkeCRwYMGzWMgISy
         zUPmAIZK4AcH2B85UrnyfFIf0HWu4c8UukXkoUv04i7RCisS2pyqqTVYbKA6AVeIA8re
         lEIe3ZUoRi0SRbC1tJhfVl4ZnIBznQnmQosdCptJjsU30cQ5Spt+D7QduDfxoUnsz9Rn
         GFJtt17Y1yQlgcUr5nnwNwbijfPAHHI2d4aCWiTyTtz1Znwf/L3CbfsOj+4XcB/L0mo1
         lNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142281; x=1744747081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lduEcIzJil9047xkgT6hDyNCUaJld8YJ1rfKXfQjuxU=;
        b=fAxlBs+HsYpRq4hc+QDV2Y2peVQFkjBTyflbia3vOZ6Xhr7Zmbvs/e2IzNyQQe/S4M
         YXuDm54PULfz12OyDO48rk/5GsXbGe6FNXlWKfgyLibe8kiXmhKiUUq0A4LfOC5uZqSD
         9XuVgDD+RZFzbGXRl27BbOWQWeshetENLM1vf1msmHZrXpNqsCXFUUUDgePwiG12jvxL
         l+tN+qj+ryUTb3xUVRLZSeN5Ua6zbtlrVWyEglBSKuttQKcMiKnNTd4kCOjZ36t7Blu7
         +ccLKRZNxgYjl37CorFp6b476hiG1VQf3GlarZgsafizK7fk212EXirgr3l55CFYEhJX
         Sx/A==
X-Forwarded-Encrypted: i=1; AJvYcCV2ATy5wXqqni+iB9oNBCnBtEqcT2kSoiKrh6yUE3kjmOCHGlLVxY/wVTB4ulSw3o+ovmIwk2LV4kFTD7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWkIWQBiwGsAs+b1DLQCZ3W86MUY/SLGBydNM9QRm/Ysm2OeRe
	zS8qjHgzicjQsnDvIjzj+wGpbr/8WnL+upYl533odHP11ZHGZ5nbiF62g5bfbQ==
X-Gm-Gg: ASbGnctvEDsQ3ul/tccJD0RFSR7i9cWRr8BPB6OjeA+t1DMfHZePShFwHvW/HBmjIFT
	WMNkhRmvpEyKiEmaXpe/yPnRa2TyFWypzVTl+FXgsPlH3AJU2uWsE/M9T2pPwVUs0j2ET0YHrkz
	bpO2leY8uEacmi4ifOupjbRggPpcFuVKWAgeVkNWu0eeT80tvGKKaGwu/3QYmcvZjnwhDixqSNK
	i73tts5pPk/+qlB1oUs7eg1/vIdVv0UASN7SeetViYaDBkb4KlfM3t5vZ6FxVlj+SRODVJ8CkLF
	OXvyGEEY95Mjidoocu1LC7Iffy7xL7L9sWnob3hHMnyFgkVLNqQCGI3Hhrj2SQd3x3TlHgF8VjS
	U77+mNdPmLcYGHEbChQSVG+xYew==
X-Google-Smtp-Source: AGHT+IFor0iASzFnnbbMCvlZdq1DNYl/sjVsXAFwMdH3cFVbjXLUMfVqsU/jqqIox3/wYp0bWz4FAw==
X-Received: by 2002:a17:90b:514e:b0:2ee:a583:e616 with SMTP id 98e67ed59e1d1-306dbbb5c92mr734616a91.9.1744142281307;
        Tue, 08 Apr 2025 12:58:01 -0700 (PDT)
Received: from google.com (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983da812sm11467438a91.46.2025.04.08.12.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 12:58:00 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:57:57 -0700
From: William McVicker <willmcvicker@google.com>
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Donghoon Yu <hoony.yu@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	semen.protsenko@linaro.org
Subject: Re: [PATCH v2 0/7] Add module support for Arm64 Exynos MCT driver
Message-ID: <Z_V_xXsAedUSZURp@google.com>
References: <CGME20250402233425epcas2p479285add99d27dc18aabd2295bfcbdc8@epcas2p4.samsung.com>
 <20250402233407.2452429-1-willmcvicker@google.com>
 <Z+8xrLbya9/oFg7y@perf>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z+8xrLbya9/oFg7y@perf>

On 04/04/2025, Youngmin Nam wrote:
> On Wed, Apr 02, 2025 at 04:33:51PM -0700, Will McVicker wrote:
> > This series adds support to build the Arm64 Exynos MCT driver as a module. This
> > is only possible on Arm64 SoCs since they can use the Arm architected timer as
> > the clocksource. Once the Exynos MCT module is loaded and the device probes,
> > the MCT is used as the wakeup source for the arch_timer to ensure the device
> > can wakeup from the "c2" idle state.
> > 
> > These patches are originally from the downstream Pixel 6 (gs101) kernel found
> > at [1] and have been adapted for upstream. Not only has the Exynos MCT driver
> > been shipping as a module in the field with Android, but I've also tested this
> > seris with the upstream kernel on my Pixel 6 Pro.
> > 
> > Thanks,
> > Will
> > 
> > Note1, instructions to build and flash a Pixel 6 device with the upstream kernel
> > can be found at [2].
> > 
> > Note2, this series is based off of linux-next/master commit 405e2241def8 ("Add
> > linux-next specific files for 20250331").
> > 
> > [1] https://android.googlesource.com/kernel/gs/+log/refs/heads/android-gs-raviole-5.10-android12-d1
> > [2] https://protect2.fireeye.com/v1/url?k=d287bb1b-b30cae21-d2863054-74fe4860008a-f0cb7ae29f3b1b85&q=1&e=4e8467a4-13da-4dd4-a8fd-4ddfc38e89b4&u=https%3A%2F%2Fgit.codelinaro.org%2Flinaro%2Fgooglelt%2Fpixelscripts%2F-%2Fblob%2Fclo%2Fmain%2FREADME.md%3Fref_type%3Dheads
> > 
> > Cc: Alim Akhtar <alim.akhtar@samsung.com>
> > Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> > Cc: Donghoon Yu <hoony.yu@samsung.com>
> > Cc: Hosung Kim <hosung0.kim@samsung.com>
> > Cc: kernel-team@android.com
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Saravana Kannan <saravanak@google.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Youngmin Nam <youngmin.nam@samsung.com>
> > Cc: Peter Griffin <peter.griffin@linaro.org>
> > Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> > Cc: André Draszik <andre.draszik@linaro.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > Cc: linux-samsung-soc@vger.kernel.org
> > 
> > ---
> > Changes in v2:
> > - Re-worked patch v1 5 based on Rob Herring's review to use the compatible data
> >   for retrieving the mct_init function pointer.
> > - Updated the Kconfig logic to disallow building the Exynos MCT driver as
> >   a module for ARM32 configurations based on Krzysztof Kozlowski's findings.
> > - Added comments and clarified commit messages in patches 1 and 2 based on
> >   reviews from John Stultz and Youngmin Nam.
> > - Fixed an issue found during testing that resulted in the device getting
> >   stuck on boot. This is included in v2 as patch 5.
> > - Collected *-by tags
> > - Rebased to the latest linux-next/master.
> > 
> > ---
> > Donghoon Yu (1):
> >   clocksource/drivers/exynos_mct: Add module support
> > 
> > Hosung Kim (1):
> >   clocksource/drivers/exynos_mct: Set local timer interrupts as percpu
> > 
> > Will Deacon (1):
> >   arm64: dts: exynos: gs101: Add 'local-timer-stop' to cpuidle nodes
> > 
> > Will McVicker (4):
> >   of/irq: Export of_irq_count for modules
> >   clocksource/drivers/exynos_mct: Don't register as a sched_clock on
> >     arm64
> >   clocksource/drivers/exynos_mct: Fix uninitialized irq name warning
> >   arm64: exynos: Drop select CLKSRC_EXYNOS_MCT
> > 
> >  arch/arm64/Kconfig.platforms                 |  1 -
> >  arch/arm64/boot/dts/exynos/google/gs101.dtsi |  3 +
> >  drivers/clocksource/Kconfig                  |  3 +-
> >  drivers/clocksource/exynos_mct.c             | 73 ++++++++++++++++----
> >  drivers/of/irq.c                             |  1 +
> >  5 files changed, 67 insertions(+), 14 deletions(-)
> > 
> > -- 
> > 2.49.0.472.ge94155a9ec-goog
> > 
> > 
> 
> Hi Will.
> 
> I tested this series on a E850-96(Exynos3830 based) board and it's working as a moudle.
> 
> # dmesg | grep mct
> [7.376224] clocksource: mct-frc: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 73510017198 ns
> 
> # lsmod | grep exynos_mct
> exynos_mct             12288  0
> 
> # cat /sys/devices/system/clocksource/clocksource0/current_clocksource
> arch_sys_counter
> # cat /sys/devices/system/clockevents/clockevent0/current_device
> arch_sys_timer
> 
> # cat /proc/interrupts 
>         CPU0    CPU1    CPU2    CPU3    CPU4    CPU5    CPU6    CPU7
>  12:    2566    2752    2467    4026    3372    2822    2115    3227 GIC-0  27 Level     arch_timer
> ...
>  77:       0       0       0       0       0       0       0       0 GIC-0 235 Level     mct_comp_irq
>  78:       0       0       0       0       0       0       0       0 GIC-0 239 Level     mct_tick0
>  79:       0       0       0       0       0       0       0       0 GIC-0 240 Level     mct_tick1
>  80:       0       0       0       0       0       0       0       0 GIC-0 241 Level     mct_tick2
>  81:       0       0       0       0       0       0       0       0 GIC-0 242 Level     mct_tick3
>  82:       0       0       0       0       0       0       0       0 GIC-0 243 Level     mct_tick4
>  83:       0       0       0       0       0       0       0       0 GIC-0 244 Level     mct_tick5
>  84:       0       0       0       0       0       0       0       0 GIC-0 245 Level     mct_tick6
>  85:       0       0       0       0       0       0       0       0 GIC-0 246 Level     mct_tick7
> 
> Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
> Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
> 
> Thanks,
> Youngmin

Thanks Youngmin for the reviews and testing!

Regards,
Will


