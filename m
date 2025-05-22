Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC4F1EA84
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936065; cv=none; b=kcrWyei/QvIF/aCIuWpxvg9HB0iE9MmMCNWk4jW7Z69j7VendB5pclU7gloxQayT835eM2EYsptqoUex5MH2g1HMwWFyvvJCItmJr2adb1/HSXrV5viQcPNGiYGbxl88wJAwiCBY+A+9GFZGrN2zM2wRF0wjnz1DXRLuO4cRxXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936065; c=relaxed/simple;
	bh=9TCcLMKCfCi3v37I+6cMTCVnR65cZTJsCK6Ao0BuT8M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ewTE21ucXYcrVhhQgEmceUP+B6FPQYOSxkQQ/1+To7lu5nl5QQ+Hrnw3FUoISnJwYMkAUVqG5GAnlpqTACMdGUX55+Sie3viAwYxNQvBdYqLwKR/XJidJSsGfxMLFRuaH78BMxHZqMYXlN1J2cfHnaiDSVzRIS3qDSuJcW/IGZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xTLosbmO; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xTLosbmO"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30a29af28d1so6554412a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747936063; x=1748540863; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nui8gTSevfIigrGuHShq/RvE2jnQwHLezywqPF+zYbg=;
        b=xTLosbmO4MO2mTB86RBCL+kmvxasc2lkSr3I7sPTlwgHz4Eem6h5POAB7nnogn4ks8
         JowgZIrQkuzywp2aq1MYu1zKEcEo77op4QqfXwliagD3J8Q6f8C2uNJsfXubqgivLuPu
         pSdtv4q+YRnMNL8AuRgn9CUyGqjBOukx2AkeCMfd6n/HLm5YK2Yb6o6OEmE0sjCQwlcS
         +kUifkPmJB16M3EMpLxIEkylLJP6xLK4ppBRbcfnQRgXTFHBkjDX9ycVmLodTIqlopRj
         IlMorSacgvMY9/b3N1l88PbyDEAJ3M3cql6yyW85LraCNjoIFaoj3+4jUnO33FUytAjg
         oS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747936063; x=1748540863;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nui8gTSevfIigrGuHShq/RvE2jnQwHLezywqPF+zYbg=;
        b=jV1MqBxExi84vOCBUUrYGdka4/Bn989/u9BUeKSTlENVxcXWKi0SoRqEAvGJpKtf1B
         jBr1gTTE5+Id5gcwVmG6pWWlXJH7caFOX6dnETWOu2vvfDHv9TtgjNmS7XOaIe6u8EoU
         N27NCZGqF7No8iztqvOjMTF1Em3TrSMyb68k/fCBrEjScWhPuvvr+oi7i1/F1Y99InLS
         a9GXC1hMaBgrOjTxvjgXxtmRACsjrYdPlmLnTZ/UpprY6TiZmdPlUKOuxQhK1B23UCNI
         q35vW++gdsmPZdbdRbszxjnRWXgdeCfqg7wTKZIU4qvXondlpIbvpNLEI5cBX9nse31k
         I8tA==
X-Forwarded-Encrypted: i=1; AJvYcCVoaJLlUi0KEbu4hlPe+LqaX/8JuwTz7werRUxZrY77TNA/b9wLsr+kQ/7pidAUfzJ3w5heVrI5wJ2vEfY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIZzBz2csCm6/1BjS/cmjbiKGHvrZzHk0w09bxMjK10AB9eAYF
	d1ROQWwDKXQiHRUfa3FhzCKYahwYo6uB01Tc6X31fijI5y8U5zP6XkBqkuk/91J3EBSGf7fSM3Z
	AK9Ts7A==
X-Google-Smtp-Source: AGHT+IG3YI0ycq9rZ9FsYkUnUURw/fDosRLaCP5tJGdqjf9xjAyHL2I7UTe+BkztbzyysLlI5JD9NkJOjJg=
X-Received: from pjbqn14.prod.google.com ([2002:a17:90b:3d4e:b0:2fc:201d:6026])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d44e:b0:2f8:b2c:5ef3
 with SMTP id 98e67ed59e1d1-310e96c5f78mr139536a91.14.1747936063496; Thu, 22
 May 2025 10:47:43 -0700 (PDT)
Date: Thu, 22 May 2025 10:47:41 -0700
In-Reply-To: <20250522005555.55705-5-mlevitsk@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250522005555.55705-1-mlevitsk@redhat.com> <20250522005555.55705-5-mlevitsk@redhat.com>
Message-ID: <aC9jPd25Jf2vU5h7@google.com>
Subject: Re: [PATCH v5 4/5] KVM: VMX: wrap guest access to IA32_DEBUGCTL with wrappers
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: kvm@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

This doesn't just wrap guest access, it wraps all access.

On Wed, May 21, 2025, Maxim Levitsky wrote:
> diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> index 00f2b762710c..b505f3f7e9ab 100644
> --- a/arch/x86/kvm/vmx/nested.c
> +++ b/arch/x86/kvm/vmx/nested.c
> @@ -2653,7 +2653,7 @@ static int prepare_vmcs02(struct kvm_vcpu *vcpu, struct vmcs12 *vmcs12,
>  	if (vmx->nested.nested_run_pending &&
>  	    (vmcs12->vm_entry_controls & VM_ENTRY_LOAD_DEBUG_CONTROLS)) {
>  		kvm_set_dr(vcpu, 7, vmcs12->guest_dr7);
> -		vmcs_write64(GUEST_IA32_DEBUGCTL, vmcs12->guest_ia32_debugctl);
> +		vmx_guest_debugctl_write(vcpu, vmcs12->guest_ia32_debugctl);
>  	} else {
>  		kvm_set_dr(vcpu, 7, vcpu->arch.dr7);
>  		vmcs_write64(GUEST_IA32_DEBUGCTL, vmx->nested.pre_vmenter_debugctl);

I think it makes sense to use the accessors for this case as well.  Conceptually,
pre_vmenter_debugctl holds the guest value.  The fact that it holds the combined
value _as written_ is rather subtle, and could change for the worse, e.g. it'd
be quite unfortunate/hilarious if someone converted the read path to use the
getter, and in doing so introduced a bug.
