Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6122046A6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745364811; cv=none; b=fHQHnx+L717vEFyPPIhgUCmDGhw9CEy/1JehI/lr7A/tJJe/0VpxBgy5jetj0l/hIAGZ/dkhzDWyHUNazpKEUAtkiQzhYRjSQBE5VJrpMBbPomCHIIKASv9aKlILBvxGbMdXuObFiUdHm26XLzvfzcyXKcMdF+QyLejgINh6SRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745364811; c=relaxed/simple;
	bh=MfX169rL5WFSPdnrQdj8uzUL8J8cc6VmIO/Gs3JY6oY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=a29+HHSnGVt28mJxJtjXG6hywhqWCqY+uR4lBDLQeoCH4oyZWrg20BoH2Q/kGFFwC+JBcTjoT/KCDVct1Vf2lJKoYhTGLXQ0VAMC2AwoeoMTWNR5YJYjUTBIhQlYS35URBpoP+vZEWpzFoiw7e+oHyo+qtjL1Hh6mzgnvX+sOio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AAfvlIRj; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AAfvlIRj"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff854a2541so5094390a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745364809; x=1745969609; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sKuSQtVqKCZi8aIHUiPbJGNUFfpx9y5jYdYrQBru+k0=;
        b=AAfvlIRj5yCNXXjQQZx4O5uZU1yffi24JlqBUsCQe8SSGwSEc4132eKjIrdNJreGvo
         o3afrFtGVjrpvrMU3X8vb5sJuGO7hIRRSJyZFAXaMmHsnM7YpW4IN123O/EczO24/K8H
         KHybbK0Q3iI4iTFJwxT9fMfCaeg+IB15H8nD4TLVwI85wBNqkmdsmNDfD/P2Su4DsZ/O
         r/qFW2dj9lTfr5qcHGlgYU6haTVE2t1Hwu4EZVGsM8bmoG1mbgUSA3+G3FN6q4VFyb42
         BqsfBXsIoYQTAPY+VMuRc4YpWZ9hfAYHvo6hw4GkpjToWFwqXYwFlOHZcqL/+xEWEZc1
         f1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745364809; x=1745969609;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sKuSQtVqKCZi8aIHUiPbJGNUFfpx9y5jYdYrQBru+k0=;
        b=KT5qaW7uS+Qkqubx9QmgVqqTh588+kZqDkjA3nTITRl43T/LDwBHHmCMjdw2WIiIMf
         LNwJ31URSLOPCsat/yY3l39CAhCTkW164OiVFcxXjTzkfEsivBifzJFr+8tV95AYrgSI
         wtbTSbFz9ttemUh/MAcGKVtCCFmcRBDEZcvaDcgH26I9yUVeC/ioO2Oiq39e9Q33XTmT
         FQnvd1bm+iBcngDVfNIEy5/ITvu7Aamdv8w5MP4X36ZrWo6JLEAj8OSlmvIw/id2wm2O
         LMvKpwoZPeUQdGdQMsSeLZScGwtIwhwmeNCFLfYD0fc/8/fas8PhM8kAl/d1CKwT/RFJ
         /wRw==
X-Forwarded-Encrypted: i=1; AJvYcCWHJjXc0RqAZYJWFRBhtWt37JYZY1giWFXJQ+M8oqkd6EKd4w+qTPqORkiLzeW3qanV6B/PJfAxWt9Gb1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUqIk8LgJSbKpnwVuGJaug9GXkuBdb5ZgNGwKjpuOYYgsT7CmQ
	VFi1fyGG6u/bduF1P8OdKuq5m33TPqbtluiWmkgmxcb8Zn2zCNuF3XxsAjPbwUGZU9L+rl+p2oL
	jOg==
X-Google-Smtp-Source: AGHT+IFsRzMEwI2gOop4ko7isYcFzOi/MMBU5tMj0zZPPCMFEr+rtSrWNSNBVv3+yaW2FERoyWJAx/Q6KxM=
X-Received: from pjbkl15.prod.google.com ([2002:a17:90b:498f:b0:2f9:c349:2f84])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:dfc5:b0:2fa:1a23:c01d
 with SMTP id 98e67ed59e1d1-3087bb6bcaamr24480280a91.21.1745364808747; Tue, 22
 Apr 2025 16:33:28 -0700 (PDT)
Date: Tue, 22 Apr 2025 16:33:27 -0700
In-Reply-To: <20250416002546.3300893-2-mlevitsk@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250416002546.3300893-1-mlevitsk@redhat.com> <20250416002546.3300893-2-mlevitsk@redhat.com>
Message-ID: <aAgnRx2aMbNKOlXY@google.com>
Subject: Re: [PATCH 1/3] x86: KVM: VMX: Wrap GUEST_IA32_DEBUGCTL read/write
 with access functions
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: kvm@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Paolo Bonzini <pbonzini@redhat.com>, x86@kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 15, 2025, Maxim Levitsky wrote:
> Instead of reading and writing GUEST_IA32_DEBUGCTL vmcs field directly,
> wrap the logic with get/set functions.

Why?  I know why the "set" helper is being added, but it needs to called out.

Please omit the getter entirely, it does nothing more than obfuscate a very
simple line of code.

> Also move the checks that the guest's supplied value is valid to the new
> 'set' function.

Please do this in a separate patch.  There's no need to mix refactoring and
functional changes.

> In particular, the above change fixes a minor security issue in which L1

Bug, yes.  Not sure it constitutes a meaningful security issue though.

> hypervisor could set the GUEST_IA32_DEBUGCTL, and eventually the host's
> MSR_IA32_DEBUGCTL

No, the lack of a consistency check allows the guest to set the MSR in hardware,
but that is not the host's value.

> to any value by performing a VM entry to L2 with VM_ENTRY_LOAD_DEBUG_CONTROLS
> set.

Any *legal* value.  Setting completely unsupported bits will result in VM-Enter
failing with a consistency check VM-Exit.

> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>  arch/x86/kvm/vmx/nested.c    | 15 +++++++---
>  arch/x86/kvm/vmx/pmu_intel.c |  9 +++---
>  arch/x86/kvm/vmx/vmx.c       | 58 +++++++++++++++++++++++-------------
>  arch/x86/kvm/vmx/vmx.h       |  3 ++
>  4 files changed, 57 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> index e073e3008b16..b7686569ee09 100644
> --- a/arch/x86/kvm/vmx/nested.c
> +++ b/arch/x86/kvm/vmx/nested.c
> @@ -2641,6 +2641,7 @@ static int prepare_vmcs02(struct kvm_vcpu *vcpu, struct vmcs12 *vmcs12,
>  	struct vcpu_vmx *vmx = to_vmx(vcpu);
>  	struct hv_enlightened_vmcs *evmcs = nested_vmx_evmcs(vmx);
>  	bool load_guest_pdptrs_vmcs12 = false;
> +	u64 new_debugctl;
>  
>  	if (vmx->nested.dirty_vmcs12 || nested_vmx_is_evmptr12_valid(vmx)) {
>  		prepare_vmcs02_rare(vmx, vmcs12);
> @@ -2653,11 +2654,17 @@ static int prepare_vmcs02(struct kvm_vcpu *vcpu, struct vmcs12 *vmcs12,
>  	if (vmx->nested.nested_run_pending &&
>  	    (vmcs12->vm_entry_controls & VM_ENTRY_LOAD_DEBUG_CONTROLS)) {
>  		kvm_set_dr(vcpu, 7, vmcs12->guest_dr7);
> -		vmcs_write64(GUEST_IA32_DEBUGCTL, vmcs12->guest_ia32_debugctl);
> +		new_debugctl = vmcs12->guest_ia32_debugctl;
>  	} else {
>  		kvm_set_dr(vcpu, 7, vcpu->arch.dr7);
> -		vmcs_write64(GUEST_IA32_DEBUGCTL, vmx->nested.pre_vmenter_debugctl);
> +		new_debugctl = vmx->nested.pre_vmenter_debugctl;
>  	}
> +
> +	if (CC(!vmx_set_guest_debugctl(vcpu, new_debugctl, false))) {

The consistency check belongs in nested_vmx_check_guest_state(), only needs to
check the VM_ENTRY_LOAD_DEBUG_CONTROLS case, and should be posted as a separate
patch.

> +		*entry_failure_code = ENTRY_FAIL_DEFAULT;
> +		return -EINVAL;
> +	}
> +
> +static void __vmx_set_guest_debugctl(struct kvm_vcpu *vcpu, u64 data)
> +{
> +	vmcs_write64(GUEST_IA32_DEBUGCTL, data);
> +}
> +
> +bool vmx_set_guest_debugctl(struct kvm_vcpu *vcpu, u64 data, bool host_initiated)
> +{
> +	u64 invalid = data & ~vmx_get_supported_debugctl(vcpu, host_initiated);
> +
> +	if (invalid & (DEBUGCTLMSR_BTF|DEBUGCTLMSR_LBR)) {
> +		kvm_pr_unimpl_wrmsr(vcpu, MSR_IA32_DEBUGCTLMSR, data);
> +		data &= ~(DEBUGCTLMSR_BTF|DEBUGCTLMSR_LBR);
> +		invalid &= ~(DEBUGCTLMSR_BTF|DEBUGCTLMSR_LBR);
> +	}
> +
> +	if (invalid)
> +		return false;
> +
> +	if (is_guest_mode(vcpu) && (get_vmcs12(vcpu)->vm_exit_controls &
> +					VM_EXIT_SAVE_DEBUG_CONTROLS))
> +		get_vmcs12(vcpu)->guest_ia32_debugctl = data;
> +
> +	if (intel_pmu_lbr_is_enabled(vcpu) && !to_vmx(vcpu)->lbr_desc.event &&
> +	    (data & DEBUGCTLMSR_LBR))
> +		intel_pmu_create_guest_lbr_event(vcpu);
> +
> +	__vmx_set_guest_debugctl(vcpu, data);
> +	return true;

Return 0/-errno, not true/false.
