Received: from sg-3-14.ptr.tlmpb.com (sg-3-14.ptr.tlmpb.com [101.45.255.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D4E1E5B6F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.45.255.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750837206; cv=none; b=UFKvbw146W9+M6I0EEXBnWChkwvY6M9mPFOItsDzafiOA2rpfd/1sTlN0NTClz8YhLK2mQFjPElkamS/naEr2Vc+mMtAasKVCrIK+LoaoHzQTO/nn7OzCrWi1Od9/gvjrQL+0wcs8OZoIybiDSCcU5z42hOndEzJO+cE3sT5Z30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750837206; c=relaxed/simple;
	bh=H76aGG9NANKQKUoBKScTVy6S4W+i5WmHwJChDecDC4E=;
	h=Message-Id:Mime-Version:References:Content-Type:Cc:From:
	 In-Reply-To:Subject:To:Date; b=cdObwpmRYaePWBPGuZy3d/ummf0lWpNNNZ4u26XlRfcGrfyvFJENBxzylwq0npTtDqG7pQr0xjay10L8a72Go61mLePz82a29ucfmmiEJ4NJ3EC3p9lq38a5deQe01jljXKy/nEtvs3ubNqR+o2kQN/SU7QBUjLovd2fFkf6PYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com; spf=pass smtp.mailfrom=lanxincomputing.com; dkim=pass (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.b=j+dxlps+; arc=none smtp.client-ip=101.45.255.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.b="j+dxlps+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1750837193;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=yzsraZSWqwSvVbcAdyXaFFgenrSPFsa+2FOgTUwiozM=;
 b=j+dxlps+gqW75WVPPsqWlJvqwvDuXfQft+a69WvTgKMfG1ztI7NAwby5qicDw6C1+PSBxw
 anus9AjfqKrhz+CeM1ftngoAyn6nIG/2al8nXPvRgFxxZoDZRJQ9dz2n49mku6rDE6IsPV
 EQiJgGU6FXMYxuoUupl7koWKIUCmuDGPCEFuFUgutgoFLDUXrcpwohxK9/JTytFS/8AWqO
 bcBc/nmibBonzP9JG+TOhkRmLQFUxfEee0VnXIjfv57q+3semoTOuB6gZcfPqmdruAGMrP
 z0y6cFdUQCLmm8C28TzINWZdhEGMCEctyUnaBMFooxCKHWz/xXXmB4YZDXq3vg==
Message-Id: <88b20a43-46c7-4297-ac20-dea7b0157c92@lanxincomputing.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618113532.471448-1-apatel@ventanamicro.com> <20250618113532.471448-8-apatel@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, 
	"Andrew Jones" <ajones@ventanamicro.com>, 
	"Anup Patel" <anup@brainfault.org>, <kvm@vger.kernel.org>, 
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Atish Patra" <atishp@rivosinc.com>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Content-Transfer-Encoding: 7bit
In-Reply-To: <20250618113532.471448-8-apatel@ventanamicro.com>
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
Received: from [127.0.0.1] ([139.226.59.215]) by smtp.feishu.cn with ESMTPS; Wed, 25 Jun 2025 15:39:50 +0800
X-Lms-Return-Path: <lba+2685ba7c7+c5d702+vger.kernel.org+liujingqi@lanxincomputing.com>
Subject: Re: [PATCH v3 07/12] RISC-V: KVM: Use ncsr_xyz() in kvm_riscv_vcpu_trap_redirect()
To: "Anup Patel" <apatel@ventanamicro.com>, 
	"Atish Patra" <atish.patra@linux.dev>
Date: Wed, 25 Jun 2025 15:39:48 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US

On 6/18/2025 7:35 PM, Anup Patel wrote:
> The H-extension CSRs accessed by kvm_riscv_vcpu_trap_redirect() will
> trap when KVM RISC-V is running as Guest/VM hence remove these traps
> by using ncsr_xyz() instead of csr_xyz().
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/kvm/vcpu_exit.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index 6e0c18412795..85c43c83e3b9 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -9,6 +9,7 @@
>   #include <linux/kvm_host.h>
>   #include <asm/csr.h>
>   #include <asm/insn-def.h>
> +#include <asm/kvm_nacl.h>
>   
>   static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
>   			     struct kvm_cpu_trap *trap)
> @@ -135,7 +136,7 @@ unsigned long kvm_riscv_vcpu_unpriv_read(struct kvm_vcpu *vcpu,
>   void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
>   				  struct kvm_cpu_trap *trap)
>   {
> -	unsigned long vsstatus = csr_read(CSR_VSSTATUS);
> +	unsigned long vsstatus = ncsr_read(CSR_VSSTATUS);
>   
>   	/* Change Guest SSTATUS.SPP bit */
>   	vsstatus &= ~SR_SPP;
> @@ -151,15 +152,15 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
>   	vsstatus &= ~SR_SIE;
>   
>   	/* Update Guest SSTATUS */
> -	csr_write(CSR_VSSTATUS, vsstatus);
> +	ncsr_write(CSR_VSSTATUS, vsstatus);
>   
>   	/* Update Guest SCAUSE, STVAL, and SEPC */
> -	csr_write(CSR_VSCAUSE, trap->scause);
> -	csr_write(CSR_VSTVAL, trap->stval);
> -	csr_write(CSR_VSEPC, trap->sepc);
> +	ncsr_write(CSR_VSCAUSE, trap->scause);
> +	ncsr_write(CSR_VSTVAL, trap->stval);
> +	ncsr_write(CSR_VSEPC, trap->sepc);
>   
>   	/* Set Guest PC to Guest exception vector */
> -	vcpu->arch.guest_context.sepc = csr_read(CSR_VSTVEC);
> +	vcpu->arch.guest_context.sepc = ncsr_read(CSR_VSTVEC);
>   
>   	/* Set Guest privilege mode to supervisor */
>   	vcpu->arch.guest_context.sstatus |= SR_SPP;

Reviewed-by: Nutty Liu <liujingqi@lanxincomputing.com>

Thanks,
Nutty
