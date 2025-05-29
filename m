Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D82228DB64
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748512105; cv=none; b=FuwUwKFICfETl2nNT0XR2+32bMtNff5iisxPy+pojOB12EE2aO+62Y240PcEyfNDcg4stbMX6D7O7M2zudTqbFx7L814e8I9mdV/0ABHsVg7nQDDRvQyEfehTMcIfGaKKKw8rczuSnRL1UD6lm+b7pFRfAVrkhUuRE1JQV7p5pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748512105; c=relaxed/simple;
	bh=mCBPF3CJ36k4V5dXJH2gpRnAP5FNb2FulINW8M6tPfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ii+HeXlpV95mx2GterQJVOR21We0MKacf04oEf5ocs3zNjU9FpAC0NExrGePwHMhxWEELlL0Z0qATQ3EVcGmvtn0slHuN3I50RyhCAFJiIPvZpwpYBHSh+9xBwFjHJQiGAAgk4k6062nbA58lko9obChEvHYhE86agClhSzKiKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OJyLbDUW; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OJyLbDUW"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-450cf214200so5832445e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 02:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748512102; x=1749116902; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BaFVkQVJDKjRYWtNug3oA8cOPJXftESUXFz7M4SIesM=;
        b=OJyLbDUWEbBQO61Qw8f3Z/PO0CAfQdxlUweiWMFETjxe+aIjZMzTFnQUMoNazwYmxh
         gI54WVsxvf55MZ/sAXNSBo154EEQocUlF5pYuVwgp1SUAnWa09Zis/RoMQ8sB5Ao44rR
         QlITn2EXAqMHG2bxk6VcHoEb1LWytE3j4MAJ2khD7hNMP1R1YqKin6Hk9IFQgn7DKk7b
         JhevVCW3LvmicpUE0QZtbFtGqw3MJlkR8I5y1gJ1RmyUqyUCW+qn+3L/7UV5ufiHvRRJ
         Oz+bTcYsrKCokb4KnoW3fubFEJpb9Z2su687aqZaF3ChTda3aaD7sXUDt74UXJBk02YA
         /kZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748512102; x=1749116902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BaFVkQVJDKjRYWtNug3oA8cOPJXftESUXFz7M4SIesM=;
        b=wvVJydds+Y0KOBDpCA9narL737EGbG2BI1JNUc18nFuTZVn6eJQYPgh1zmuyI31saa
         iM1qBKJ3JLDbQQcb0txkB6pir9ObzddiQKxu8EhswU7cmNZzEtvn+ASc4nWEX9FF4cM7
         CBQuJp0jG1VdxFocXgbmqHjrFa723fLkV97RgWybdlU4EpFO1LQNQs/Fw60rgyKINZ61
         4huUOpHVkD9hC4VkQ0mHBE3w4eKMAbfzyVtrJ/KUCLuue4Z7pLa+MBmR4pps8XDctHMZ
         drKQPC3LKEmVpE4C/k0//GsZtj7injyvy32bh4OQqg7e99DaxYsDb916CuZ7DS4wt1vW
         ZYqA==
X-Forwarded-Encrypted: i=1; AJvYcCVkTspJUzx6LB35DDpaLFFvd9MU8/N8Ese+Nf7ep5SNf8WO89anc+3MySi+FclSVTqdDsfTQkAF84afm2M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy3k+fKh5zTC/j/0V3z8WX0BXvRo7OddXqyb2zqsLV6gfVm8kH
	HMS4tEwKs7xWL+JEDL5hjF4dcZxtWIgpbmhlTqW1vQIaaGxO0jHvidvxvLr0qfJIgr8=
X-Gm-Gg: ASbGncu4OAgerlpBiDNVZw+hr523Wt5acGM5JqOGcuJ7/7J3/iwXsQNkyyH9Ol4ONW/
	vXMpRmEMf4dqZ9ttzkn9zKmxlzbNvre0zYn0qK0di1S+Y+UuWFy3GDNvUlhQ3w2M6RLGT4J5fN3
	ThFgsQHX4H9/88ajPLrJFsViF3qWhuvyKpQtSThkvcK6G0eOzTkkpnUruEwIRq8lZ2nfv5cDgBM
	1bqsmxL04VgK0aCuzhYluuMJAX8CPDp1AS4Mqbw7RQ1qrxcC/KAwJVJ3r2KTZy+U46qxzXTzIYx
	nC1PwZLeLE+IIl7DBHDFygkDQURpQo8qzoVxI5hqXlj0c4TGkbPQo8um
X-Google-Smtp-Source: AGHT+IGqR9/I2Bjkk0qR5H6OlZDpGRs84NmDbQcbBpPkkl4lqLIAxu7/3yK/uxy3vBcppOHkP1XOiw==
X-Received: by 2002:a05:600c:4e14:b0:444:34c7:3ed9 with SMTP id 5b1f17b1804b1-44c955da4f7mr185008435e9.26.1748512101772;
        Thu, 29 May 2025 02:48:21 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc27dd8sm15171385e9.26.2025.05.29.02.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:48:21 -0700 (PDT)
Message-ID: <d412031a-cdfa-4983-8702-1e1bb93d5641@linaro.org>
Date: Thu, 29 May 2025 10:48:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 0/5] arm64/perf: Enable branch stack sampling
To: "Rob Herring (Arm)" <robh@kernel.org>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Leo Yan <leo.yan@arm.com>
References: <20250520-arm-brbe-v19-v22-0-c1ddde38e7f8@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250520-arm-brbe-v19-v22-0-c1ddde38e7f8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/05/2025 11:27 pm, Rob Herring (Arm) wrote:
> This series enables perf branch stack sampling support on arm64 via a
> v9.2 arch feature called Branch Record Buffer Extension (BRBE). Details
> on BRBE can be found in the Arm ARM[1] chapter D18.
> 
> I've picked up this series from Anshuman. v19 and later versions have
> been reworked quite a bit by Mark and myself. The bulk of those changes
> are in patch 5.
> 
> A git branch is here[2].
> 
> [1] https://developer.arm.com/documentation/ddi0487/latest/
> [2] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git arm/brbe-v22
> 
> Changes in v22:
>   - New patch reworking the labels in el2_setup.h
>   - Move branch stack disabling after armpmu_stop() in armpmu_del()
>   - Fix branch_records_alloc() to work on heterogeneous systems
>   - Make setting .sched_task function ptr conditional on BRBE support
>   - Reword booting.rst section name (s/feature/the/) and move next to
>     other PMU related features instead of in the middle of SME features.
>   - Drop setting SYS_BRBCR_EL1
>   - Drop CONFIG_ARM64_BRBE ifdef
>   - Rework initialization of HFGITR_EL2
> 
> v21:
>   - https://lore.kernel.org/r/20250407-arm-brbe-v19-v21-0-ff187ff6c928@kernel.org
>   - Drop clean-up patches 1-7 already applied
>   - Rebase on v6.15-rc1
> 
> v20:
>   - https://lore.kernel.org/r/20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org
>   - Added back some of the arm64 specific exception types. The x86 IRQ
>     branches also include other exceptions like page faults. On arm64, we
>     can distinguish the exception types, so we do. Also, to better
>     align with x86, we convert 'call' branches which are user to kernel
>     to 'syscall'.
>   - Only enable exceptions and exception returns if recording kernel
>     branches (matching x86)
>   - Drop requiring event and branch privileges to match
>   - Add "branches" caps sysfs attribute like x86
>   - Reword comment about FZP and MDCR_EL2.HPMN interaction
>   - Rework BRBE invalidation to avoid invalidating in interrupt handler
>     when no handled events capture the branch stack (i.e. when there are
>     multiple users).
>   - Also clear BRBCR_ELx bits in brbe_disable(). This is for KVM nVHE
>     checks if BRBE is enabled.
>   - Document that MDCR_EL3.SBRBE can be 0b01 also
> 
> v19:
>   - https://lore.kernel.org/all/20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org/
>   - Drop saving of branch records when task scheduled out (Mark). Make
>     sched_task() callback actually get called. Enabling requires a call
>     to perf_sched_cb_inc(). So the saving of branch records never
>     happened.
>   - Got rid of added armpmu ops. All BRBE support is contained within
>     pmuv3 code.
>   - Fix freeze on overflow for VHE
>   - The cycle counter doesn't freeze BRBE on overflow, so avoid assigning
>     it when BRBE is enabled.
>   - Drop all the Arm specific exception branches. Not a clear need for
>     them.
>   - Fix handling of branch 'cycles' reading. CC field is
>     mantissa/exponent, not an integer.
>   - Rework s/w filtering to better match h/w filtering
>   - Reject events with disjoint event filter and branch filter or with
>     exclude_host set
>   - Dropped perf test patch which has been applied for 6.14
>   - Dropped patch "KVM: arm64: Explicitly handle BRBE traps as UNDEFINED"
>     which has been applied for 6.14
> 
> v18:
>   - https://lore.kernel.org/all/20240613061731.3109448-1-anshuman.khandual@arm.com/
> 
> For v1-v17, see the above link. Not going to duplicate it all here...
> 
> Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
> ---
> ---
> Anshuman Khandual (4):
>        arm64/sysreg: Add BRBE registers and fields
>        arm64: el2_setup.h: Make __init_el2_fgt labels consistent, again
>        arm64: Handle BRBE booting requirements
>        KVM: arm64: nvhe: Disable branch generation in nVHE guests
> 
> Rob Herring (Arm) (1):
>        perf: arm_pmuv3: Add support for the Branch Record Buffer Extension (BRBE)
> 
>   Documentation/arch/arm64/booting.rst |  21 +
>   arch/arm64/include/asm/el2_setup.h   |  81 +++-
>   arch/arm64/include/asm/kvm_host.h    |   2 +
>   arch/arm64/include/asm/sysreg.h      |  17 +-
>   arch/arm64/kvm/debug.c               |   4 +
>   arch/arm64/kvm/hyp/nvhe/debug-sr.c   |  32 ++
>   arch/arm64/kvm/hyp/nvhe/switch.c     |   2 +-
>   arch/arm64/tools/sysreg              | 132 ++++++
>   drivers/perf/Kconfig                 |  11 +
>   drivers/perf/Makefile                |   1 +
>   drivers/perf/arm_brbe.c              | 802 +++++++++++++++++++++++++++++++++++
>   drivers/perf/arm_brbe.h              |  47 ++
>   drivers/perf/arm_pmu.c               |  16 +-
>   drivers/perf/arm_pmuv3.c             | 125 +++++-
>   include/linux/perf/arm_pmu.h         |   8 +
>   15 files changed, 1276 insertions(+), 25 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250129-arm-brbe-v19-24d5d9e5e623
> 
> Best regards,

Tested-by: James Clark <james.clark@linaro.org>


