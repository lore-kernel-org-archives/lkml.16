Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ECB221721
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 18:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744999401; cv=none; b=ZS/T8kYBkt4NtmNGP/DtuIMFVWavYllmI9enpqmtJLDNSe6vifsf7FFxzGMHcyPaKHwM5OyR305UmydRqa1CWhsaVrYj580Dfh3n9Rzag2LGzfUKnpKRHJfRCLk0dCJeXHFXXSG6l3a1pGOz0y6LE4BBv95yvsYyxlv7VnSukjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744999401; c=relaxed/simple;
	bh=1YG7DuypvUO2eH+ZtNma3tnBVmRMdQt3rkXfWDkxfvY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JBfj/MVKpRUoaiyz3ER4BVXT/IHUwujdxM9zDR+pJyGvp1MHr14Pk60qtie7Mt/YIUf55qQPWs8caFmoOtCxH36Cx3bVRdr50VLsa3GxZZHAr3S2PbJqIyeG3B8RXTrnPfOUUkjokN8n6oWhkL15qJUYR2V9n0mr0KnjmLeSFO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RNkVP7Ow; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RNkVP7Ow"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff8a2c7912so1711663a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 11:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744999399; x=1745604199; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rqJHg5UYMXwn+mNlrL5oxyZCVbhJU0UNvh0766Pzt3w=;
        b=RNkVP7Ow+ZXf59m9XKNn8w8xsZoToQ9upST6cMiOeg357tp+4V3UgTNM7DDO/zqvbM
         QpGArvz31DMfOloWu8Hwslnxblsy0pioclQHvuI+jyaO5mzJ3pmHSPDN9uxai/PpHFhK
         2Mw/0XjFQv5PRqwNmkei0Fc5hhwZG5T9wIifLN1zNPA2TfwaHVAV+WalVh/BQQKaU/73
         YZ2aX89oYvRHlDfCTnMhqXLOQoSpiCojl8T+JDCt3PmSGWDGBZXDRzMMLIovnyx8WFl5
         W3Wvy7YhGQr5MaKJDH820TqExF8HEmobAu5g8MYoR59tqA4V3U9+faOfcqG7hAlTSdt/
         IDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744999399; x=1745604199;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rqJHg5UYMXwn+mNlrL5oxyZCVbhJU0UNvh0766Pzt3w=;
        b=XcBZS3caXf8rEHSqGlo1vCtG46GigirI/71L6peeeqlEvvakQ9iHiRN/MpYQhHT1b/
         CAQsmEQrHlFcTvsYl7lJO8gOyTvNtwiu3k2sAlkzaw7Bt8hG+1BRBX+yaN/S6+JknBSa
         44ST6NW4TdMc9uNC4jVzRorknghYRZfJ9lmnouqcVshpPjDKtBUw+wAT1yV/OnlcDdyg
         wRgFbuxDaHBV6gg+BF2ofMUkUDbkI5mPy04oizdvJDWB7+3AQnwOi1PZxWOQse82kypw
         /33K+xfhF1RKj3NNz941ImolED3CdItlib7LWL8SoiSN4dyHDDQGxAiCsakotxzAUTgV
         wABA==
X-Gm-Message-State: AOJu0YwFKXu2OLxPwsrSQJLMHznXd15IiZGzWBmCgWVs2iCPA7hmtoKj
	ifQPlJCDPbXs5HRzlv7SxQTD1XqXFDvE26aAdnCRIjrXYnpbzVDwgGN0Y4japgU4uwzQAYZlbEN
	xIA==
X-Google-Smtp-Source: AGHT+IFCmvZ0T+9eNap/pJTWsl4JOWWblp3uZelMKEtnIjAjt7ekoYrCZmpLXyNDhFs3e4WXHrwgxFD2ZsI=
X-Received: from pjbsn15.prod.google.com ([2002:a17:90b:2e8f:b0:2fa:b84:b308])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e18f:b0:2ee:c30f:33c9
 with SMTP id 98e67ed59e1d1-3087c36106amr5592365a91.14.1744999399596; Fri, 18
 Apr 2025 11:03:19 -0700 (PDT)
Date: Fri, 18 Apr 2025 11:03:18 -0700
In-Reply-To: <20250418171609.231588-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250418171609.231588-1-pbonzini@redhat.com>
Message-ID: <aAKT5mLHVV7rz830@google.com>
Subject: Re: [PATCH] KVM: arm64, x86: make kvm_arch_has_irq_bypass() inline
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Apr 18, 2025, Paolo Bonzini wrote:
> kvm_arch_has_irq_bypass() is a small function and even though it does
> not appear in any *really* hot paths, it's also not entirely rare.
> Make it inline---it also works out nicely in preparation for using it in
> kvm-intel.ko and kvm-amd.ko, since the function is not currently exported.
> 
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  arch/arm64/include/asm/kvm_host.h   | 5 +++++
>  arch/arm64/kvm/arm.c                | 5 -----
>  arch/powerpc/include/asm/kvm_host.h | 2 ++
>  arch/x86/include/asm/kvm_host.h     | 6 ++++++
>  arch/x86/kvm/x86.c                  | 5 -----
>  include/linux/kvm_host.h            | 1 -
>  6 files changed, 13 insertions(+), 11 deletions(-)

...

> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index 2d139c807577..6f761b77b813 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -907,4 +907,6 @@ static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
>  static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
>  static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
>  
> +bool kvm_arch_has_irq_bypass(void);

...

> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 291d49b9bf05..82f044e4b3f5 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2383,7 +2383,6 @@ struct kvm_vcpu *kvm_get_running_vcpu(void);
>  struct kvm_vcpu * __percpu *kvm_get_running_vcpus(void);
>  
>  #if IS_ENABLED(CONFIG_HAVE_KVM_IRQ_BYPASS)
> -bool kvm_arch_has_irq_bypass(void);

Moving the declaration to PPC is unnecessary, and IMO undesirable.  It's perfectly
legal to have a non-static declaration follow a "static inline", and asm/kvm_host.h
is included by linux/kvm_host.h, i.e. the per-arch "static inline" is guaranteed
to be processed first.

And KVM already have multiple instances of this, e.g. kvm_arch_vcpu_blocking().
If only for consistency, I vote to keep the common declaration.

>  int kvm_arch_irq_bypass_add_producer(struct irq_bypass_consumer *,
>  			   struct irq_bypass_producer *);
>  void kvm_arch_irq_bypass_del_producer(struct irq_bypass_consumer *,
> -- 
> 2.43.5
> 
