Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E44F79D2
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 19:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751313075; cv=none; b=Gz58ftqg6U1RDDIR4FCo7/KhmexkVCuZKDtE0tyVDKYcOGS/PdmeEykwzx94DGrsJ1IyqQ/gT3tFzKuQLCoAkFCvfn3A8BkELHnr6mLZY2wzTy2A+kxfpYRHz9zjAJ+KKOkttTlSwqfV2I0MF/UUjsm5YMOxO2ooW72agEOEUlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751313075; c=relaxed/simple;
	bh=dZRgZSkGylWVAacMRcxHxNoUOFGbYD3K1ocJpzmzm2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ewHgg8V6+WRsVG1RbrUmseD5/dsEe0PWKQbcJ6/k+YQrlGjzaIZ8JltVXuFC2LLAXHSpG3xRmszp+/qsQlj/TsI9VaWWqRZmQfK/HP4sNV+nHlNWOG8mSzlu3BS9JWAZKtgXNKHYLVcjJDlQ+de3qZEIvUCNErBTu8rAh4c67KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KPXAlqPZ; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KPXAlqPZ"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2db2f23f174so3335482fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751313072; x=1751917872; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ga4y3MOQS/NhUmQF1ukYLMYf01uWr2HXnuupm/ZCD24=;
        b=KPXAlqPZGGBDsZuIoBd+V7iq+NFfD5wpl0S0XB7Rzw6xNH9mkC/5dGErupwQD4wrLh
         HKhUsPuFsgNV4jhyJmA22CaYEgxJPDvgC2yhGbkrocmfDNAhFbqvU393JhuZzAuv2zyT
         0P+YzOyEx5VnWkSTrYeZb92uDRMwNHC0eGXva2fLIjXnsyx4mwkSsXoJji+Cn+9ebVJQ
         uCLwSL0rddx+W9uoRyHDQnCJtKSW0lkX9J0+huyOSwq3F/PEZzdsgs4vv9Ve4IkXTGmj
         j4/xsGyU2YJWpXJjZlCmUDhb7MH0bIglOqIBXaRWtARbHstNN/z/ytzw7LlMYTPaADSC
         N4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751313072; x=1751917872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ga4y3MOQS/NhUmQF1ukYLMYf01uWr2HXnuupm/ZCD24=;
        b=U75FNSpv+6A6AKgSWY6zzxo4IbAb0HrdWSxte1w9xnoahPl7EXgqiBoTCcbRRxJYyO
         7aDePDiWJml5URvSpkepdyz28/3dz0jbmuz21XN5aPG4emlfRgXiMb3ab+UKZ5qu0qhe
         eGfNhyBshnq4nmtgLH4mQVdP9/zPdWVBWPBQSbLd3J9vUFowVopa/LZLkHgZpd/9InjZ
         QjQuqpLM9gOETCz9yJsAfGKjqDtu9ZxsmXuIZ2sI6ECWEs5tNyF2K4VTRJ3vCGz+xTYK
         Ashlbc3l6Fe6fdKefEVv1QT1OrkN+K+tETD2xcKjB5NbPlcOfvasSdBGArCjCjmINt6z
         CZ0w==
X-Gm-Message-State: AOJu0YxEbpKFh2XkPd038ImCS1Edhey/dvUfnaKooGXDzry7LK7+LikT
	BW1+xcJAmOCFDmEx1pl82HhTwMlLh1NiJ6lQurvgAqMiNuYLc/77L9BHhA1+gZj/Qhrf65Vk9Cu
	G5Q6Uo4SxutCyWaVpy1pp1AAMLDPcrgeCFCAx2+cE
X-Gm-Gg: ASbGncu0AMUJMhRdnBMPGtoA9RnFd4srb3p0JEvJI85+uAwmYkAgAiUZYsL8nTK3jX9
	Rx+mI1c37KhsE2r5Jbuz2UgM0NzeH7lyUdldJkXpxDmXRFYMRbcu+8zI49NAcvZRdzyqKRmtwJk
	IB91OBI6zJonJO2XO6WtYFRZOkA+lqz5TZ7lZL93Un
X-Google-Smtp-Source: AGHT+IHRDrJscnosC1ZeT+2J6X1LwE0WFgWPIrMVmWeOWgj5sfxh2F6EAd7QnzFSZOpkIKhjeOC1jIHYzrsZvVxF+Xo=
X-Received: by 2002:a05:6870:7905:b0:2ea:841f:773c with SMTP id
 586e51a60fabf-2efed759ab7mr11102999fac.35.1751313072313; Mon, 30 Jun 2025
 12:51:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAL0q8a6pOBZbWYdwKzC1U-PuH4rgf2miv0jcF=fWVZt_dUZHmw@mail.gmail.com>
 <20250630133343.GA26040@lst.de>
In-Reply-To: <20250630133343.GA26040@lst.de>
From: Ben Copeland <ben.copeland@linaro.org>
Date: Mon, 30 Jun 2025 20:51:01 +0100
X-Gm-Features: Ac12FXw8R8mMZVmm9DFkYryumLpFODa-57Pyd4kyo7Xil12Rg1NLjYfQ9ut-Kvw
Message-ID: <CAL0q8a7sE4a00ehKrkyepA_xA3Z2HiGv0LazvYe=2NciTkkPFQ@mail.gmail.com>
Subject: Re: next-20250627: IOMMU DMA warning during NVMe I/O completion after 06cae0e3f61c
To: Christoph Hellwig <hch@lst.de>
Cc: linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, linux-nvme@lists.infradead.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, kbusch@kernel.org, axboe@kernel.dk, 
	sagi@grimberg.me, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello Christoph,

On Mon, 30 Jun 2025 at 14:33, Christoph Hellwig <hch@lst.de> wrote:
>
> Hi Ben,
>
> > [   32.857521] iommu_dma_unmap_page+0xc4/0xe8 (P)
>
> Can you resolve this to a source location for me. i.e.
>
> gdb vmlinux
>
> l *(iommu_dma_unmap_page+0xc4)

Sure, here's the kernel stack trace.

[   32.699872] WARNING: drivers/iommu/dma-iommu.c:1232 at
iommu_dma_unmap_page+0xc4/0xe8, CPU#13: swapper/13/0
[   32.714204] Modules linked in: cdc_ether usbnet sm3_ce nvme sha3_ce
nvme_core xhci_pci_renesas arm_cspmu_module arm_spe_pmu ipmi_devintf
arm_cmn ipmi_msghandler cppc_cpufreq fuse drm backlight ip_tables
x_tables
[   32.732967] CPU: 13 UID: 0 PID: 0 Comm: swapper/13 Tainted: G W
6.16.0-rc3-next-20250627 #1 PREEMPT
[   32.743562] Tainted: [W]=WARN
[   32.749381] Hardware name: Inspur NF5280R7/Mitchell MB, BIOS
04.04.00004001 2025-02-04 22:23:30 02/04/2025
[   32.759020] pstate: 63400009 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
[   32.768746] pc : iommu_dma_unmap_page
(/builds/linux/drivers/iommu/dma-iommu.c:1232 (discriminator 1))
[   32.776040] lr : iommu_dma_unmap_page
(/builds/linux/drivers/iommu/dma-iommu.c:1232 (discriminator 1))
[   32.780559] sp : ffff8000801afde0
[   32.783861] x29: ffff8000801afde0 x28: 0000000000000005 x27: fff00001d7d230f0
[   32.790983] x26: 0000000000000000 x25: fff00001003da0c8 x24: 0000000000000002
[   32.798106] x23: 0000000000000000 x22: 0000000000001000 x21: 00000000feed5000
[   32.805229] x20: fff00001003da0c8 x19: fff00001d7d23000 x18: 0000000000080000
[   32.812352] x17: 0000000000000040 x16: ffffae5c7594ea68 x15: 0000000000000000
[   32.819474] x14: 000000000007ffff x13: 0000000000000001 x12: 000000000000002c
[   32.826597] x11: 00000000000fffff x10: ffffffffffffffff x9 : ffffae5c76358e60
[   32.833719] x8 : ffff8000801afd68 x7 : ffffae5c76358a78 x6 : 00000000feed5001
[   32.840842] x5 : 000000000000000d x4 : ffffae5c76358a78 x3 : 0000000000000000
[   32.847965] x2 : 0000000000000000 x1 : fff00001027e54c0 x0 : 0000000000000000
[   32.855088] Call trace:
[   32.857521] iommu_dma_unmap_page
(/builds/linux/drivers/iommu/dma-iommu.c:1232 (discriminator 1)) (P)
[   32.862039] dma_unmap_page_attrs (/builds/linux/kernel/dma/mapping.c:193)
[   32.866385] nvme_unmap_data
(/home/ben/linux/linux/drivers/nvme/host/nvme.h:788
/home/ben/linux/linux/drivers/nvme/host/pci.c:1077) nvme
[   32.870904] nvme_pci_complete_rq
(/home/ben/linux/linux/drivers/nvme/host/pci.c:1051
/home/ben/linux/linux/drivers/nvme/host/pci.c:1063
/home/ben/linux/linux/drivers/nvme/host/pci.c:1071) nvme
[   32.878632] blk_complete_reqs (/builds/linux/block/blk-mq.c:1223
(discriminator 1))
[   32.885320] blk_done_softirq (/builds/linux/block/blk-mq.c:1230)
[   32.892006] handle_softirqs
(/builds/linux/arch/arm64/include/asm/jump_label.h:36
/builds/linux/include/trace/events/irq.h:142
/builds/linux/kernel/softirq.c:580)
[   32.896436] __do_softirq (/builds/linux/kernel/softirq.c:614)
[   32.899912] ____do_softirq (/builds/linux/arch/arm64/kernel/irq.c:82)
[   32.903561] call_on_irq_stack (/builds/linux/arch/arm64/kernel/entry.S:897)
[   32.907472] do_softirq_own_stack (/builds/linux/arch/arm64/kernel/irq.c:87)
[   32.911642] __irq_exit_rcu (/builds/linux/kernel/softirq.c:460
/builds/linux/kernel/softirq.c:680)
[   32.915378] irq_exit_rcu (/builds/linux/kernel/softirq.c:698
(discriminator 1))
[   32.918854] el1_interrupt
(/builds/linux/arch/arm64/include/asm/current.h:19
/builds/linux/arch/arm64/kernel/entry-common.c:280
/builds/linux/arch/arm64/kernel/entry-common.c:586
/builds/linux/arch/arm64/kernel/entry-common.c:598)
[   32.922418] el1h_64_irq_handler
(/builds/linux/arch/arm64/kernel/entry-common.c:604)
[   32.926502] el1h_64_irq (/builds/linux/arch/arm64/kernel/entry.S:596)
[   32.929891] cpuidle_enter_state
(/builds/linux/drivers/cpuidle/cpuidle.c:292) (P)
[   32.934410] cpuidle_enter
(/builds/linux/drivers/cpuidle/cpuidle.c:391 (discriminator 2))
[   32.937972] do_idle (/builds/linux/kernel/sched/idle.c:160
/builds/linux/kernel/sched/idle.c:235
/builds/linux/kernel/sched/idle.c:330)
[   32.941188] cpu_startup_entry
(/builds/linux/kernel/sched/idle.c:428 (discriminator 1))
[   32.945098] secondary_start_kernel
(/builds/linux/arch/arm64/include/asm/atomic_ll_sc.h:95 (discriminator
2) /builds/linux/arch/arm64/include/asm/atomic.h:28 (discriminator 2)
/builds/linux/include/linux/atomic/atomic-arch-fallback.h:546
(discriminator 2)
/builds/linux/include/linux/atomic/atomic-arch-fallback.h:994
(discriminator 2)
/builds/linux/include/linux/atomic/atomic-instrumented.h:436
(discriminator 2) /builds/linux/include/linux/sched/mm.h:37
(discriminator 2) /builds/linux/arch/arm64/kernel/smp.c:214
(discriminator 2))
[   32.949617] __secondary_switched (/builds/linux/arch/arm64/kernel/head.S:405)
[   32.953788] ---[ end trace 0000000000000000 ]---


>
> Also what IOMMU driver is this device using?  It looks like it
> might not support a 4k IOMMU page size.
>

From the boot log, I can see

[    1.083447] arm-smmu-v3 arm-smmu-v3.16.auto: option mask 0x0
[    1.083460] arm-smmu-v3 arm-smmu-v3.16.auto: IDR0.HTTU
features(0x600000) overridden by FW configuration (0x0)
[    1.083463] arm-smmu-v3 arm-smmu-v3.16.auto: ias 48-bit, oas 48-bit
(features 0x0094dfef)

Let me know if there is anything else.

Ben
