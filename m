Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEDE2E36F6
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 07:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751701429; cv=none; b=gLQvYF82/SV7Ytt2bXAyQQKoNIrPVwb6X7Qw1UFKd9IQhs0FFYpe9POtW6DLBngudYk0xcymmRNTRcxOmpy1HZ87GWJqpj8mLOT9UGKJzVnSvVlef5f42uBD32LRQZQjd1n5347U1dNZxO77ExAiMgJSWEjPzG1YhP9RrOA8wWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751701429; c=relaxed/simple;
	bh=WEF59fri1fwXjBvvMO9QMW1xvg67eaPTRymMTMW4pUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iEEU99i6v9oultoLJ54ZNzQmCowW68gFsVnop2TJhcTWOCSf6gEBvHThZ4YIVIP7kyTLVg2BDkbSL5B/fqGxxgp/jscXnq0BLGExT7ch3cg1/RqhK2tb78nxN+i7dH6LZBIlil4qLWFwNAlKWTV/N8untyo/GstQcACcY3WPvRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FbNTWIVg; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FbNTWIVg"
Message-ID: <031be49c-b079-40c3-af92-7ab3abeec6b3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751701424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0cOvaEMZDlYCZuGP3rV6CtMosiqfse3Z99B9fDQMSYw=;
	b=FbNTWIVgOlZtetO3M0PMTBYjNEGkFB6gofMu0uuxu6L278lqSckZEj5A5BLsbZQmMt9GSy
	5xXYY4i67hFkR0gDmGta1AFupbhMqb6ObtZD6RAlwW/dBxCJ9FmIj3zYA4/rGw0hg4c65P
	R+Kats95irR9U7JcEne0wYdhlMeA/EQ=
Date: Sat, 5 Jul 2025 00:43:36 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] Few timer and AIA fixes for KVM RISC-V
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250704153838.6575-1-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250704153838.6575-1-apatel@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 7/4/25 8:38 AM, Anup Patel wrote:
> The RISC-V Privileged specificaiton says the following: "WFI is also
> required to resume execution for locally enabled interrupts pending
> at any privilege level, regardless of the global interrupt enable at
> each privilege level."
>
> Based on the above, if there is pending VS-timer interrupt when the
> host (aka HS-mode) executes WFI then such a WFI will simply become NOP
> and not do anything. This result in QEMU RISC-V consuming a lot of CPU
> time on the x86 machine where it is running. The PATCH1 solves this
> issue by adding appropriate cleanup in KVM RISC-V timer virtualization.
>
> As a result PATCH1, race conditions in updating HGEI[E|P] CSRs when a
> VCPU is moved from one host CPU to another are being observed on QEMU
> so the PATCH2 tries to minimize the chances of these race conditions.
>
> Anup Patel (2):
>    RISC-V: KVM: Disable vstimecmp before exiting to user-space
>    RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC virtualization
>
>   arch/riscv/include/asm/kvm_aia.h |  4 ++-
>   arch/riscv/kvm/aia.c             | 51 +++++---------------------------
>   arch/riscv/kvm/aia_imsic.c       | 45 ++++++++++++++++++++++++++++
>   arch/riscv/kvm/vcpu.c            |  2 --
>   arch/riscv/kvm/vcpu_timer.c      | 16 ++++++++++
>   5 files changed, 71 insertions(+), 47 deletions(-)
>
For the entire series :

Tested-by: Atish Patra <atishp@rivosinc.com>
