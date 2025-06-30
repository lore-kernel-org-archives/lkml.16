Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0A8221F0C
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751269837; cv=none; b=TcDVcKWtoMj/qzAhIrL/NXNWGNbqY3hZFVcI9q93dkQVMmIOPZLSIvptiwGprpQvIhLPF1pRi1yyHA+17yyIZKaUb0L6IPBlLIGfo5e8t6/Yj1rOVqZJLKkgV/2XI6jWUXgZ+m/3zs8kY6PUQFjMmVjD7lv3+nCmtSuUx6yNadg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751269837; c=relaxed/simple;
	bh=dW1S/Vd8ohxG3RdNI1svkbdQsHOBXKFy5ERXSJJ/UWU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=j3Fofj25eZOdEBINvLdqL/h58glg2Sy4bVdLkF4KWDLjHyUVD8I0kTFND2Vi0e5uz3K47E6ixs8be7H2+/yZOsmsE53326jzrOKUHczIN3QRwKpKCuAb8HPrno95WuPUbD51ekf/5MWJ3ZDNTJwy4SKgkfcP9oNEqjx4PGns+lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mr7R8vw7; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mr7R8vw7"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2efa219b5bbso524161fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 00:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751269835; x=1751874635; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g/l29yXOs8sSf8dKtHOSd7SknDHgyt7qIGbzVZwBj1w=;
        b=Mr7R8vw7r0aJAmZb95SU2u3j4WNIl2zRcrcrP5ZAzpbNxu2ACG/6RH7jMIfc70FMiF
         4npASRVvD7/cHko/OYxY4tdi/db045Dj5TT4nIBXAJXWrZNAYRB9K6J+ntjeRHB9B0Bs
         sVDoyf0kVVo0+0TbLe25PETATNO8RbbeHbztfWJ4nPNrTjvo5m6OelEb9Lm9316gCqVw
         65wlLZUn9iPtqLHy+iOSNZUgGiFNNwZXFCAPTuGEhht0LpS+QcOCNaEoU1vnbhad9YDE
         hMzIxSM788zG6vpMFklnHbUYn0u4e6aJhRBqiKp90jia4YfFI4UOg9mpBeE9ItyOD2wv
         qvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751269835; x=1751874635;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g/l29yXOs8sSf8dKtHOSd7SknDHgyt7qIGbzVZwBj1w=;
        b=VJttR0Hpo1+pQSPs2z03KnTz51a3vxIovN783wKDDvX9mw8YmE+AoC5/DqPSM83WJn
         oOX4dTT4ScvPkETnKctoTtOtHhhiU8KKgy0vTnYXKmVTxWT88CEn5FaOAQ3zIjrLtJgl
         h64sbzqPX9tpZ3mEPgPU13URFOUlxxhmmI+eeDl+rgOaugkPqLsXRmiX9L2gpZ3PmCHY
         R6UFBecW1q70M/PlW1WUKlGTKPloXOIajIuEz58JraJVuTDYlibpPizmE/1mlBfJENX9
         4Rq+j8r9P0a411NoBqWlc1dpJVcTESzGIRQ0Cm2CZfRDHBz2pQI1i0PCnP34LaileneX
         NEZw==
X-Gm-Message-State: AOJu0YxtwqXV869UpN+2C3MiswBRzbgvbSoO+KDhBst9Hkt3mQSE3nLY
	Q3Imxu7ChDuuLkYb6SyLjgWVACi2XsLqMunkJjx2n66DiB3kBNAvjIHSPTLuA4QQdbdfvGaf22j
	alvHKUqV7SdJ3gUVZwc/6EN06XXnz9hkxQd06f2FL500K4wIBxxgSzAti
X-Gm-Gg: ASbGncvv1A6yR8lkAywUF6l+rOPYipEjq2jGrcM1l4PQtj/zPVHYKKWpkZZyKWQR/7F
	CB4PjN8sM1FNolUKh7udYmYTAeI7LLAkyrFOnRR66BITW+0TXq4fE3DWT1ov0Fi15h7ufkgQcE3
	Uci89APMhIny/BVOezuf+Nvu6uVgBxyS5Q0LEXHwuk
X-Google-Smtp-Source: AGHT+IFit+5SfO0GaAfOTHQfprpfULo68GtNss9IbrHvpeb8NgCZTKNSUq0vwXRUdW21+78+Y5YUOVeOhVPtsz+8AOY=
X-Received: by 2002:a05:6870:8a2c:b0:2d5:230f:b34d with SMTP id
 586e51a60fabf-2efed4511d7mr8439534fac.1.1751269834790; Mon, 30 Jun 2025
 00:50:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ben Copeland <ben.copeland@linaro.org>
Date: Mon, 30 Jun 2025 08:50:22 +0100
X-Gm-Features: Ac12FXwbVbhKrQRrhmtGqdk3H80s3ORpUnDkppSOzjKooTKGOPIoCXyUl35_h8E
Message-ID: <CAL0q8a6pOBZbWYdwKzC1U-PuH4rgf2miv0jcF=fWVZt_dUZHmw@mail.gmail.com>
Subject: next-20250627: IOMMU DMA warning during NVMe I/O completion after 06cae0e3f61c
To: linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, linux-nvme@lists.infradead.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>, kbusch@kernel.org, axboe@kernel.dk, 
	hch@lst.de, sagi@grimberg.me
Content-Type: text/plain; charset="UTF-8"

A regression in the NVMe PCI driver triggers IOMMU DMA warnings during
I/O completion on ARM64 systems. The issue manifests as
drivers/iommu/dma-iommu.c warnings during the DMA unmapping process.
IOMMU DMA unmapping warnings occur during NVMe completion processing.
The warnings appear consistently during normal NVMe I/O operations.

- CONFIG_ARM64_64K_PAGES=y

Test Environment:
* Ampere Altra - AmpereOne

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

First seen on next-20250627
Good: next-20250626
Bad: next-20250627

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Test log
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
[   32.768746] pc : iommu_dma_unmap_page+0xc4/0xe8
[   32.776040] lr : iommu_dma_unmap_page+0x40/0xe8
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
[   32.857521] iommu_dma_unmap_page+0xc4/0xe8 (P)
[   32.862039] dma_unmap_page_attrs+0x238/0x2a0
[   32.866385] nvme_unmap_data+0x1dc/0x278 [nvme]
[   32.870904] nvme_pci_complete_rq+0xb8/0x118 [nvme]
[   32.878632] blk_complete_reqs+0x5c/0x80
[   32.885320] blk_done_softirq+0x28/0x40
[   32.892006] handle_softirqs+0x16c/0x408
[   32.896436] __do_softirq+0x1c/0x28
[   32.899912] ____do_softirq+0x18/0x30
[   32.903561] call_on_irq_stack+0x24/0x30
[   32.907472] do_softirq_own_stack+0x24/0x38
[   32.911642] __irq_exit_rcu+0xd4/0x118
[   32.915378] irq_exit_rcu+0x18/0x48
[   32.918854] el1_interrupt+0x38/0x68
[   32.922418] el1h_64_irq_handler+0x18/0x28
[   32.926502] el1h_64_irq+0x6c/0x70
[   32.929891] cpuidle_enter_state+0xcc/0x4c0 (P)
[   32.934410] cpuidle_enter+0x40/0x60
[   32.937972] do_idle+0x204/0x288
[   32.941188] cpu_startup_entry+0x3c/0x50
[   32.945098] secondary_start_kernel+0x140/0x168
[   32.949617] __secondary_switched+0xc0/0xc8
[   32.953788] ---[ end trace 0000000000000000 ]---

## Bisection
git bisect start
# bad: [06cae0e3f61c4c1ef18726b817bbb88c29f81e57] nvme-pci: merge the
simple PRP and SGL setup into a common helper
git bisect bad 06cae0e3f61c4c1ef18726b817bbb88c29f81e57
# good: [d6c12c69ef4fa33e32ceda4a53991ace01401cd9] block: add
scatterlist-less DMA mapping helpers
git bisect good d6c12c69ef4fa33e32ceda4a53991ace01401cd9
# good: [07c81cbf438b769e0d673be3b5c021a424a4dc6f] nvme-pci: refactor
nvme_pci_use_sgls
git bisect good 07c81cbf438b769e0d673be3b5c021a424a4dc6f
# first bad commit: [06cae0e3f61c4c1ef18726b817bbb88c29f81e57]
nvme-pci: merge the simple PRP and SGL setup into a common helper

## Source
* Kernel version: 6.16.0-rc3-next-20250627
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 2aeda9592360c200085898a258c4754bfe879921
* Git describe: 6.16.0-rc3-next-20250627
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master-ampere/build/next-20250627/
* Architectures: arm64
* Toolchains: gcc-13
* Kconfigs: gcc-13-lkftconfig-64k_page_size

## Build arm64
* Test LAVA log:
https://lkft-staging.validation.linaro.org/scheduler/job/180925#L7760
* Build link: https://storage.tuxsuite.com/public/ampere/ci/builds/2z6SDAcW8aM7PBWZ8oJ82QlfXvH/
* Kernel config:
https://storage.tuxsuite.com/public/ampere/ci/builds/2z6SDAcW8aM7PBWZ8oJ82QlfXvH/config

## Steps to reproduce:
# https://storage.tuxsuite.com/public/ampere/ci/builds/2z6SDAcW8aM7PBWZ8oJ82QlfXvH/tuxmake_reproducer.sh

Linaro LKFT
https://lkft.linaro.org
