Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AFD2F363E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 22:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750890419; cv=none; b=VgLRTlwrIc2wRks4iCEZ8XWcnRtYOSXl9dkL2guy4HyiK+HMwRGpM54UpyB1nyTmYNVYbOQvxl6iKSIeeUDe8hZt7RRm/6ICQcL3rtmIIEaDogSmREREVHYr5vqOHv3shtR606vb3MPbZh+N9jLWIhf5j4UuNKXtSzybTRREcTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750890419; c=relaxed/simple;
	bh=rCEDy0fW8FC1f3pY+p+n2EHXqYOi6cxmqAfnynuar6M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dkx20yZdSp2j9b/uqIW0LnldnKUJ897MjQSxjYMUu9lBPQ5+bDZZY1qXZ4dgCPRixNaNr8VTeQTbIgHGRjEJFKGy41IGj54YhmKz9xshgCD+W7LpzegRPdfAF+Z5JQj2BS7SdkQpA1wcauLMBwkmEifJdwPRszT1VLpuGkLfk38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zUK5YvSn; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zUK5YvSn"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-313d6d671ffso222305a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750890417; x=1751495217; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kQ33NEAxiy6dGXROQPYsq2BeSkLqn3m7YnA3TQ3LWfQ=;
        b=zUK5YvSnJB3mEIntxl26CTphVH3KqsaoIdmeMkdG8LrEUz0a4vUrzWAM5anoeIWW+j
         4Ho57JxWhXCvn3D3klCBVQKGp5v+5V0WTKr+4wskhrXGJc3s+bLAwYxU8wscqNI+oquF
         Ma/t1wX+yV3YT2MRryfAqXBTg4B9WXY/MNSG3tDubknP8I8B7x/FnnMdhh51fu4bdt65
         msZ8kuqvFfd5denKmisx//r6wF7L+2qJ5gedmi2ia6Wk0d8xWoYb4PTBalgm5bR8u22H
         Kp9u93BQQuImZUNSatljyGfP1yHMOT1Ng/tLpOdtO5U/0KZ55gJJADQhIkQPaqxw6wRo
         RUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750890417; x=1751495217;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kQ33NEAxiy6dGXROQPYsq2BeSkLqn3m7YnA3TQ3LWfQ=;
        b=Sb+Cm1V0C10YgVmb9PqRbNVzDL9OWe1rPqPHEl1HPaRrqVWlGyGoDxi3ngyLISrPTA
         psLKOgQbZnOMyVQyNGkSpGfuZcVOOaV3EBRCxycyWaa0FNCA+HAo7KtXgypLJbjOMQAz
         79+cHfbTQevpNv+50tRQxksf5yiqspvlpBu7xioygMIna5naFtQyqgIs+g/PlY5pWe0c
         7yyAASmxE+lPjCJ+wSnsW51TuMxeW3m4zOToAe6NyGeF4gVgjJDfb+tetbTm5XrCkKPX
         s3mbNz/twv92nGEvceghFtNvhIyNrMWCRLTqJuO1PPKgltkRd+D0FCniEspcVL+B52AL
         zEmQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7BBv5iMiQ5AokOd4/gb7H3rJR0brxle3LoX/VcDAOaAAlpl5AsyRgEJWZiXHpnvZo+NNCQhdNMRP8laI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu31iLuX6weZynQ7DSrThPCUi6IcYdq8kqCNqnyFbQT6Wi2A33
	WjpAV8X15uT3EIpW+7xfV0FmHnirUIk7X/EGoyg+VdSWOMkcskRnIg+4Qxm77Uu1PDKMlZvYMbf
	hbA2+EA==
X-Google-Smtp-Source: AGHT+IHiQUpPpcCXNH4t8rkH6lkA4oXVg34reWFcVeyN+A0kZ6FPQXLgBh8hajKcmoG7/M9PHJB8uy+T1Vk=
X-Received: from pjbpv1.prod.google.com ([2002:a17:90b:3c81:b0:313:2d44:397b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c08:b0:313:2768:3f6b
 with SMTP id 98e67ed59e1d1-31615960decmr1752060a91.27.1750890417636; Wed, 25
 Jun 2025 15:26:57 -0700 (PDT)
Date: Wed, 25 Jun 2025 15:25:37 -0700
In-Reply-To: <20250523011756.3243624-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523011756.3243624-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <175088969830.721563.9184862048308832493.b4-ty@google.com>
Subject: Re: [PATCH 0/5] KVM: VMX: Fix MMIO Stale Data Mitigation
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="utf-8"

On Thu, 22 May 2025 18:17:51 -0700, Sean Christopherson wrote:
> Fix KVM's mitigation of the MMIO Stale Data bug, as the current approach
> doesn't actually detect whether or not a guest has access to MMIO.  E.g.
> KVM_DEV_VFIO_FILE_ADD is entirely optional, and obviously only covers VFIO
> devices, and so is a terrible heuristic for "can this vCPU access MMIO?"
> 
> To fix the flaw (hopefully), track whether or not a vCPU has access to MMIO
> based on the MMU it will run with.  KVM already detects host MMIO when
> installing PTEs in order to force host MMIO to UC (EPT bypasses MTRRs), so
> feeding that information into the MMU is rather straightforward.
> 
> [...]

Applied 1-3 to kvm-x86 mmio, and 4-5 to 'kvm-x86 no_assignment' (which is based
on 'irqs' and includes 'mmio' via a merge, to avoid having the mmio changes
depend on the IRQ overhaul).

[1/5] KVM: x86: Avoid calling kvm_is_mmio_pfn() when kvm_x86_ops.get_mt_mask is NULL
      https://github.com/kvm-x86/linux/commit/c126b46e6fa8
[2/5] KVM: x86/mmu: Locally cache whether a PFN is host MMIO when making a SPTE
      https://github.com/kvm-x86/linux/commit/ffe9d7966d01
[3/5] KVM: VMX: Apply MMIO Stale Data mitigation if KVM maps MMIO into the guest
      https://github.com/kvm-x86/linux/commit/83ebe7157483
[4/5] Revert "kvm: detect assigned device via irqbypass manager"
      https://github.com/kvm-x86/linux/commit/ff845e6a84c8
[5/5] VFIO: KVM: x86: Drop kvm_arch_{start,end}_assignment()
      https://github.com/kvm-x86/linux/commit/bbc13ae593e0

--
https://github.com/kvm-x86/kvm-unit-tests/tree/next
