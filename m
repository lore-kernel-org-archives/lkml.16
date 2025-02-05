Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7781DE4D3
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 21:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738791959; cv=none; b=HtiokXF4uqy4nB7mzuva9eHkA4KJv4OxGIcgmxVgRBv6M/WLRqX7feIu7WnJZEYjyd5hJA0P1Be+jDyenfcVQ84KJQa36ZfIsX6nGLwOT9ENpoGoT1Wt/gju42BPmckVG6rBTtE/R4aK1R58vYzCJ/pqNzP/yONitZe06WI/eQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738791959; c=relaxed/simple;
	bh=xkLq+hxeEBmjLtqlUevon4jVLT+q6Prhm3C8w3aOJjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=No1UWxq09BQQ9CF01Kdyx75czGIWeuaidzw/smexS7cRrh3SvVF6bSofF6O2M4EHjGa0jQHRCMTENoQjrMPQ+Xf45UO7oMgG9tSXRz4qav4VTkPCPwClPHcc7qCB4hE8mAFhjp9LlqdZ9Ccze771tspEBQ6QxTMhDVC3GLPCSZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TLYS/ZeR; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TLYS/ZeR"
Date: Wed, 5 Feb 2025 21:45:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738791949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UcD82YHfFlnLbOGCKlGp519IT43cQW3uzid6ew7JUk4=;
	b=TLYS/ZeRw9mupYyFbz7Mk2Avr51nX4IZXt6dZu22u5/pIsqTB85PdH7/FUoyDCiSbgXMWR
	mVw5rZUmCn6g19f6hIRWeNfwIkCcFsBCZokd/8aJoJPdDJ2fXwPIX1cYA4dVNkufxr/Kw/
	CfjO0kxnerCBSyE2icYQbGKSv3bgdYc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 09/13] KVM: nSVM: Handle nested TLB flush requests
 through TLB_CONTROL
Message-ID: <Z6PcCUh73yVZPlUq@google.com>
References: <20250205182402.2147495-1-yosry.ahmed@linux.dev>
 <20250205182402.2147495-10-yosry.ahmed@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205182402.2147495-10-yosry.ahmed@linux.dev>
X-Migadu-Flow: FLOW_OUT

On Wed, Feb 05, 2025 at 06:23:58PM +0000, Yosry Ahmed wrote:
> Handle L1's requests to flush L2's TLB through the TLB_CONTROL field of
> VMCB12. This is currently redundant because a full flush is executed on
> every nested transition, but is a step towards removing that.
> 
> TLB_CONTROL_FLUSH_ALL_ASID flushes all ASIDs from L1's perspective,
> including its own, so do a guest TLB flush on both transitions. Never
> propagate TLB_CONTROL_FLUSH_ALL_ASID from the guest to the actual VMCB,
> as this gives the guest the power to flush the entire physical TLB
> (including translations for the host and other VMs).
> 
> For other cases, the TLB flush is only done when entering L2. The nested
> NPT MMU is also sync'd because TLB_CONTROL also flushes NPT
> guest-physical mappings.
> 
> All TLB_CONTROL values can be handled by KVM regardless of FLUSHBYASID
> support on the underlying CPU, so keep advertising FLUSHBYASID to the
> guest unconditionally.
> 
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> ---
>  arch/x86/kvm/svm/nested.c | 42 ++++++++++++++++++++++++++++++++-------
>  arch/x86/kvm/svm/svm.c    |  6 +++---
>  2 files changed, 38 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index 0735177b95a1d..e2c59eb2907e8 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -484,19 +484,36 @@ static void nested_save_pending_event_to_vmcb12(struct vcpu_svm *svm,
>  
>  static void nested_svm_entry_tlb_flush(struct kvm_vcpu *vcpu)
>  {
> +	struct vcpu_svm *svm = to_svm(vcpu);
> +
>  	/* Handle pending Hyper-V TLB flush requests */
>  	kvm_hv_nested_transtion_tlb_flush(vcpu, npt_enabled);
>  
> +	/*
> +	 * If L1 requested a TLB flush for L2, flush L2's TLB on nested entry
> +	 * and sync the nested NPT MMU, as TLB_CONTROL also flushes NPT
> +	 * guest-physical mappings. We technically only need to flush guest_mode
> +	 * page tables.
> +	 *
> +	 * KVM_REQ_TLB_FLUSH_GUEST will flush L2's ASID even if the underlying
> +	 * CPU does not support FLUSHBYASID (by assigning a new ASID), so we
> +	 * can handle all TLB_CONTROL values from L1 regardless.
> +	 *
> +	 * Note that TLB_CONTROL_FLUSH_ASID_LOCAL is handled exactly like
> +	 * TLB_CONTROL_FLUSH_ASID. We can technically flush less TLB entries,
> +	 * but this would require significantly more complexity.
> +	 */
> +	if (svm->nested.ctl.tlb_ctl != TLB_CONTROL_DO_NOTHING) {
> +		if (nested_npt_enabled(svm))
> +			kvm_make_request(KVM_REQ_MMU_SYNC, vcpu);
> +		kvm_make_request(KVM_REQ_TLB_FLUSH_GUEST, vcpu);
> +	}
> +
>  	/*
>  	 * TODO: optimize unconditional TLB flush/MMU sync.  A partial list of
>  	 * things to fix before this can be conditional:
>  	 *
> -	 *  - Honor L1's request to flush an ASID on nested VMRUN
> -	 *  - Sync nested NPT MMU on VMRUN that flushes L2's ASID[*]
>  	 *  - Don't crush a pending TLB flush in vmcb02 on nested VMRUN
> -	 *
> -	 * [*] Unlike nested EPT, SVM's ASID management can invalidate nested
> -	 *     NPT guest-physical mappings on VMRUN.
>  	 */
>  	kvm_make_request(KVM_REQ_MMU_SYNC, vcpu);
>  	kvm_make_request(KVM_REQ_TLB_FLUSH_CURRENT, vcpu);
> @@ -504,9 +521,18 @@ static void nested_svm_entry_tlb_flush(struct kvm_vcpu *vcpu)
>  
>  static void nested_svm_exit_tlb_flush(struct kvm_vcpu *vcpu)
>  {
> +	struct vcpu_svm *svm = to_svm(vcpu);
> +
>  	/* Handle pending Hyper-V TLB flush requests */
>  	kvm_hv_nested_transtion_tlb_flush(vcpu, npt_enabled);
>  
> +	/*
> +	 * If L1 had requested a full TLB flush when entering L2, also flush its
> +	 * TLB entries when exiting back to L1.
> +	 */
> +	if (svm->nested.ctl.tlb_ctl == TLB_CONTROL_FLUSH_ALL_ASID)
> +		kvm_make_request(KVM_REQ_TLB_FLUSH_GUEST, vcpu);
> +
>  	/* See nested_svm_entry_tlb_flush() */
>  	kvm_make_request(KVM_REQ_MMU_SYNC, vcpu);
>  	kvm_make_request(KVM_REQ_TLB_FLUSH_CURRENT, vcpu);
> @@ -825,7 +851,8 @@ int enter_svm_guest_mode(struct kvm_vcpu *vcpu, u64 vmcb12_gpa,
>  	nested_svm_copy_common_state(svm->vmcb01.ptr, svm->nested.vmcb02.ptr);
>  
>  	svm_switch_vmcb(svm, &svm->nested.vmcb02);
> -	nested_vmcb02_prepare_control(svm, vmcb12->save.rip, vmcb12->save.cs.base);
> +	nested_vmcb02_prepare_control(svm, vmcb12->save.rip,
> +				      vmcb12->save.cs.base);

These unrelated changes were unintentional, please ignore them.
