Received: from sg-1-13.ptr.blmpb.com (sg-1-13.ptr.blmpb.com [118.26.132.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809C63234
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 04:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749183975; cv=none; b=NNCeArGDEvp22JxtR56syoQQl3fB5gWTIDcEiORQ5Dog1h5aRlZH9putbfivZVhqH+ThB+ym5tu0Jn8EgrP0txsMbs8CDDvBjaAqjHH63n7IuG+fXRCkP6cuQlJsuInpJx12SjCPPMlABSDycLwforxldmVlkOVd/eAAfVpoobU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749183975; c=relaxed/simple;
	bh=Am7HXR3Njlqss4G5BEuoNyLPBqJ+LbLJG8/4zJZ6BHI=;
	h=Content-Type:To:Subject:Date:Message-Id:Mime-Version:In-Reply-To:
	 References:Cc:From; b=BskR0UHHntLRueiUH93GjN1ObFA3xKBFR5mMg+b1+th1jJXgHqAazbJ1J0bFXFCxO4nf6hcivi9Fqm+e5/pJ6Pasw0QMJzPW1VBYdko+NnY8MWICgZTABsCPNNb23/mtnPEg6O3TTKk1GQnxwpIz7GRjE4iLiZPHROpsqvClEkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com; spf=pass smtp.mailfrom=lanxincomputing.com; dkim=pass (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.b=2k8niFS8; arc=none smtp.client-ip=118.26.132.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lanxincomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.b="2k8niFS8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1749183964;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=k4UTS9zfNjzXfbqFSh5F0rYTKZrQ+NdfqBJ4iEJ2ZhY=;
 b=2k8niFS88KxGFPALcAa38Jw7sjrdwkPfFMEAG4B+kHpqVcQaqxkmiSconxOGziNmUoQHty
 e0a7hSMCrinssRtK8F49jZJ9RdIH5pNsIymNZjv5B/WdMk/sLmxDwwLhbfqAU1LpwFu6Mg
 C9WYcOHcDNOLVqrlYTJ2tUf9Q+s5DcpNiKBdFneD39adoT7UDg5kA6+BMYkLwGp6s9/Alu
 gRwQXR5jb8QhOFJXHVD+vx/6YYkDYbPkDDnJrOyMOSzLj3s5s112GRPpjpRQL1BAuSELwZ
 /mFoiXwcOkfdWcw/8vIiXsksp+i8EzNL49xfCKxqOFxFr6NPkaIXuOkb9y9CIw==
Content-Type: text/plain; charset=UTF-8
To: "Anup Patel" <apatel@ventanamicro.com>, 
	"Atish Patra" <atish.patra@linux.dev>
Subject: Re: [PATCH 05/13] RISC-V: KVM: Rename and move kvm_riscv_local_tlb_sanitize()
Date: Fri, 6 Jun 2025 12:25:59 +0800
Message-Id: <321c0f23-9e9f-4626-8b0d-b805c7cdf5ad@lanxincomputing.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
Content-Transfer-Encoding: 7bit
Received: from [127.0.0.1] ([180.165.23.184]) by smtp.feishu.cn with ESMTPS; Fri, 06 Jun 2025 12:26:01 +0800
In-Reply-To: <20250605061458.196003-6-apatel@ventanamicro.com>
Content-Language: en-US
X-Lms-Return-Path: <lba+268426dda+015927+vger.kernel.org+liujingqi@lanxincomputing.com>
References: <20250605061458.196003-1-apatel@ventanamicro.com> <20250605061458.196003-6-apatel@ventanamicro.com>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, 
	"Andrew Jones" <ajones@ventanamicro.com>, 
	"Anup Patel" <anup@brainfault.org>, <kvm@vger.kernel.org>, 
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
User-Agent: Mozilla Thunderbird

On 6/5/2025 2:14 PM, Anup Patel wrote:
> The kvm_riscv_local_tlb_sanitize() deals with sanitizing current
> VMID related TLB mappings when a VCPU is moved from one host CPU
> to another.
>
> Let's move kvm_riscv_local_tlb_sanitize() to VMID management
> sources and rename it to kvm_riscv_gstage_vmid_sanitize().
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/include/asm/kvm_host.h |  3 +--
>   arch/riscv/kvm/tlb.c              | 23 -----------------------
>   arch/riscv/kvm/vcpu.c             |  4 ++--
>   arch/riscv/kvm/vmid.c             | 23 +++++++++++++++++++++++
>   4 files changed, 26 insertions(+), 27 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 85cfebc32e4c..134adc30af52 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -327,8 +327,6 @@ void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
>   				     unsigned long order);
>   void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
>   
> -void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu);
> -
>   void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
>   void kvm_riscv_hfence_gvma_vmid_all_process(struct kvm_vcpu *vcpu);
>   void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
> @@ -376,6 +374,7 @@ unsigned long kvm_riscv_gstage_vmid_bits(void);
>   int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
>   bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
>   void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu);
> +void kvm_riscv_gstage_vmid_sanitize(struct kvm_vcpu *vcpu);
>   
>   int kvm_riscv_setup_default_irq_routing(struct kvm *kvm, u32 lines);
>   
> diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> index 2f91ea5f8493..b3461bfd9756 100644
> --- a/arch/riscv/kvm/tlb.c
> +++ b/arch/riscv/kvm/tlb.c
> @@ -156,29 +156,6 @@ void kvm_riscv_local_hfence_vvma_all(unsigned long vmid)
>   	csr_write(CSR_HGATP, hgatp);
>   }
>   
> -void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
> -{
> -	unsigned long vmid;
> -
> -	if (!kvm_riscv_gstage_vmid_bits() ||
> -	    vcpu->arch.last_exit_cpu == vcpu->cpu)
> -		return;
> -
> -	/*
> -	 * On RISC-V platforms with hardware VMID support, we share same
> -	 * VMID for all VCPUs of a particular Guest/VM. This means we might
> -	 * have stale G-stage TLB entries on the current Host CPU due to
> -	 * some other VCPU of the same Guest which ran previously on the
> -	 * current Host CPU.
> -	 *
> -	 * To cleanup stale TLB entries, we simply flush all G-stage TLB
> -	 * entries by VMID whenever underlying Host CPU changes for a VCPU.
> -	 */
> -
> -	vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
> -	kvm_riscv_local_hfence_gvma_vmid_all(vmid);
> -}
> -
>   void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu)
>   {
>   	kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_FENCE_I_RCVD);
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index f98a1894d55b..cc7d00bcf345 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -961,12 +961,12 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>   		}
>   
>   		/*
> -		 * Cleanup stale TLB enteries
> +		 * Sanitize VMID mappings cached (TLB) on current CPU
>   		 *
>   		 * Note: This should be done after G-stage VMID has been
>   		 * updated using kvm_riscv_gstage_vmid_ver_changed()
>   		 */
> -		kvm_riscv_local_tlb_sanitize(vcpu);
> +		kvm_riscv_gstage_vmid_sanitize(vcpu);
>   
>   		trace_kvm_entry(vcpu);
>   
> diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
> index ddc98714ce8e..92c01255f86f 100644
> --- a/arch/riscv/kvm/vmid.c
> +++ b/arch/riscv/kvm/vmid.c
> @@ -122,3 +122,26 @@ void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu)
>   	kvm_for_each_vcpu(i, v, vcpu->kvm)
>   		kvm_make_request(KVM_REQ_UPDATE_HGATP, v);
>   }
> +
> +void kvm_riscv_gstage_vmid_sanitize(struct kvm_vcpu *vcpu)
> +{
> +	unsigned long vmid;
> +
> +	if (!kvm_riscv_gstage_vmid_bits() ||
> +	    vcpu->arch.last_exit_cpu == vcpu->cpu)
> +		return;
> +
> +	/*
> +	 * On RISC-V platforms with hardware VMID support, we share same
> +	 * VMID for all VCPUs of a particular Guest/VM. This means we might
> +	 * have stale G-stage TLB entries on the current Host CPU due to
> +	 * some other VCPU of the same Guest which ran previously on the
> +	 * current Host CPU.
> +	 *
> +	 * To cleanup stale TLB entries, we simply flush all G-stage TLB
> +	 * entries by VMID whenever underlying Host CPU changes for a VCPU.
> +	 */
> +
> +	vmid = READ_ONCE(vcpu->kvm->arch.vmid.vmid);
> +	kvm_riscv_local_hfence_gvma_vmid_all(vmid);
> +}

Thanks.

Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>
