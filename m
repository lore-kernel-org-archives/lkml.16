Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B981991BF
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936454; cv=none; b=FWPytAzxTP5nLcPumlPdOY9XX5vShkKJ8pUdcPNO6oZUPm2KzbKcFOGzhwNdB0enzzsmFukUBwdvXacf0kym6qw/oyfbwqWZvpWnMywEiFqSxZtpBK6QFasXcStwG65O0YdtSE6O2W5POy5ps/x75fraKjO/5xs1n4RX27Tpk38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936454; c=relaxed/simple;
	bh=A9YtGBnfYXBmKsazP3aoG07lV5AvVekJPWQUW/Wlt+s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mIiZa/H9ECiVtJS55n+4czwp3SUEKJN+fSH8SwXxTTANvMzY6Q3u+v3RY9pUbFtY6JWeSzJitb6Hfx9OdCJ4H+9wti5S5L43kN1GoQnZ3oA2msACEZa9L+5dli3EPKdxvMBb0c1LVUf6rmxc+uu5bA2pkl9u7g19QrQogcYoGiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IzggNKZv; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IzggNKZv"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-310e7c24158so166329a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747936452; x=1748541252; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jYTKGMCXf+T08o3CH6Pdo/aVmKCBvpZJKlu4AEtbneA=;
        b=IzggNKZv07/b+r4korOJ2DfH5OAOISiyfJ8IY8EiIHCPRuO/H7Bl0hec0U/o0Jxuad
         OduEi6RAVNIojWKfe/rZaR3xJvGVuL43z8DaaVCPX+NO6jcYbBrelm20+UdmeHeGZqaG
         RanakhX+oSvefwDoq6Tc5YzUcqU0FrfUm0M0yQgH+Qg2gjJiZ/7CbnPNEJgKyn/35XRS
         dDrd5d7UBt+60n+F9m9v4FRj6LMlGyY7aEZ5IS65sBJ7EPGtn9Wzgrpeg1/s2UB9ConK
         raMBP3UAdDKLsdjh4UYdVTtK1InruQdvsI0HzBY6cHCJC3t1DDJszZ2XjbT+HzanA49c
         eCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747936452; x=1748541252;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jYTKGMCXf+T08o3CH6Pdo/aVmKCBvpZJKlu4AEtbneA=;
        b=lAmuc/uxIpSfRBuapRrwG9EU2wG2cEAwrYVDO7iH7FgOYD3ULSwSb56ygZ7VzlxpQb
         RdNpXMfhMf1JM+xnLB/uQmQt747t2KpzbIQKCPkXlG2U6CxYrGZz6iThkdXtuvTmP9Hv
         G36zDvu1rMNhZOjlCGQee/nKxm9dPZ4ehsedmqygWecwTLijFisE2bAYTD4549nTND3z
         uqHpBLyoZpRmlQeZN7J9J0vvpEWFzpsCKD8M057z8nMIEkhEdf6A2dHMZdkUmp+897pS
         EHmEhlynhR5aLDX8MmRqvb8jjkOGMSVvrfDGmmXwlpurTED4BGnz+npHrQ6wZm0LYue0
         jcOw==
X-Forwarded-Encrypted: i=1; AJvYcCUj8bHxk2bs4Yc+aZXySRXQ+21SK2kRGGdKCtBNPWtF2quLCGNXEiY+J1TNK2yc4xDinlUmhGLzPblrx2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSmZVyaXC44v7eMoUf6sEhMmmwQD7tbA+t4ePOOPqQJiw8cg5a
	5hP/eJziXMsUPMa+i2OQdh4Fd6zkBLF+I+tkvYEz2c85f57jy24zkpgJKsFM55yhilsWMiABPjT
	mneOrHA==
X-Google-Smtp-Source: AGHT+IHuhEsqFWFlAH8y96+h2FL09Ry9K1MrokTzgmXWNLTYISdJwQxN+5eloQ0CtjDqiEDKckc9GYUnN5I=
X-Received: from pjl13.prod.google.com ([2002:a17:90b:2f8d:b0:2ff:5344:b54])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2751:b0:2fe:afbc:cd53
 with SMTP id 98e67ed59e1d1-30e8321595cmr38620501a91.28.1747936451886; Thu, 22
 May 2025 10:54:11 -0700 (PDT)
Date: Thu, 22 May 2025 10:54:10 -0700
In-Reply-To: <20250522005555.55705-6-mlevitsk@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250522005555.55705-1-mlevitsk@redhat.com> <20250522005555.55705-6-mlevitsk@redhat.com>
Message-ID: <aC9kwukxBtH4vawX@google.com>
Subject: Re: [PATCH v5 5/5] KVM: VMX: preserve DEBUGCTLMSR_FREEZE_IN_SMM
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: kvm@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, May 21, 2025, Maxim Levitsky wrote:
> Pass through the host's DEBUGCTL.DEBUGCTLMSR_FREEZE_IN_SMM to the guest
> GUEST_IA32_DEBUGCTL without the guest seeing this value.
> 
> Since the value of the host DEBUGCTL can in theory change between VM runs,
> check if has changed, and if yes, then reload the GUEST_IA32_DEBUGCTL with
> the new value.
> 
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>  arch/x86/include/asm/kvm_host.h | 1 +
>  arch/x86/kvm/vmx/vmx.c          | 6 +++++-
>  arch/x86/kvm/x86.c              | 7 +++++--
>  3 files changed, 11 insertions(+), 3 deletions(-)

SVM and TDX definitely should WARN (though TDX can simply reuse the WARN on a
non-zero run_fags), if only to document that KVM isn't buggy.

> @@ -7380,6 +7381,9 @@ fastpath_t vmx_vcpu_run(struct kvm_vcpu *vcpu, u64 run_flags)
>  	if (run_flags & KVM_RUN_LOAD_GUEST_DR6)
>  		set_debugreg(vcpu->arch.dr6, 6);
>  
> +	if (run_flags & KVM_RUN_LOAD_DEBUGCTL)
> +		vmx_guest_debugctl_write(vcpu, vmx_guest_debugctl_read());

There's a rather amusing and subtle nested VMX bug.  On a VM-Fail that is missed
by KVM, KVM will have done vcpu_enter_guest() => vmx_vcpu_run() with vmcs02,
i.e. will have updated the host_debugctl snapshot, but won't explicitly write
vmcs01 because nested_vmx_restore_host_state() doesn't emulate a VM-Exit (it mostly
restores state that KVM shoved into its software model).

I mention that here, because I was already wondering if it made sense to add a
helper to perform the VMWRITE if and only if necessary.  I was leaning "no",
because for this path, it should always be necessary.  But with the nested VM-Fail
path in play, it will often be unnecessary.
