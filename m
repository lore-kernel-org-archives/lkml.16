Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DEB25A2C7
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 21:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750800344; cv=none; b=K4eCCiddmgRulNWBrKwJKHxyk3Nyldp6Pe7FGlY0OPwlgSj3yZHEczLOVJbJYsYVt15Ty8df24VwUz50T1mXreeZ9bZpzHYOoq1dM8wRz/C/0+eBN0TPMyTrV5zYAima3RwWyaMZoT4HSdaCccYuf3fccVYZNJE21d1Tn9huo90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750800344; c=relaxed/simple;
	bh=V7VDQ47jH9iNdsT2T46dzLpNy/9xIELQI+h/me3PTyA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OeUP8CrHsWHGDnR++Uer7jykeS31iaFJBXaIuiMzlbyLF79N8qgA/SjVTz6eDAyfORFgCR52PKKBb+ptu/zJ0RRzM81naKEyvlCgQvnwgWdfF/vvXc/yaqQWNWfu2uDzv0ipbkhvbAn/T//kswkawCN7vzr/JdkOAriirLH/Jss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Dm5qX0S1; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dm5qX0S1"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3138e64b3f1so7115452a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750800343; x=1751405143; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5XSerilfAD61ZoTQIVntI3Kk9baU60Yfysak4jiQVwY=;
        b=Dm5qX0S1zwUkEvEZtHci9Tmi+oCWZk3UvuAQp3idco01PNhUgR1cL2hFYlQsIYdPJa
         4v8f/TFIQlwbKBb7eDZSAP4CJYOER38kBIroh33fwYcVAVHycetR1pAcn4xP5mdMINHc
         zPVT4npQKmi2Aw/2ZwZN9j4BJERKslEcGIoQyjo62v5QRplZDh1P5dVtjqTJ/DTHIgYl
         3ovoNIxixDYfz8B7s7ZyWWWGVXscPGBqgBYOhovPeD5eht+OV4j1CHA23v7MxgAq04rE
         hZUOQg7HBpW+/VY2KPjdZLz3eRct2QUUxTXdh5cFb3GCrNZ84WksoWY2vsXemfGZKQ+1
         05Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750800343; x=1751405143;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5XSerilfAD61ZoTQIVntI3Kk9baU60Yfysak4jiQVwY=;
        b=cYSLlko5tifHsS/zZOZ+lDPYEV8li7W7mnQZZv11pNA/s9pWzIYBtEZF9kvE6XedQt
         IJcFIQiDVdai2AM0D14edgYzjN4MzoTHKeEnz3i/WP8X+fUEM1c5bcUG9rQHdS5DSKqP
         K7KaKIxLcgS22K2+/1g2Qcj6fPkQRwhmihqFgzyCiDrx72qGyF75XNEoqxraXJ4eSeIT
         7YwvePqmtcdLLtzvnu9CZH7+Zn8Dq9TmXk9Y0yGOcPbzV3WMrSHYsPOvjLRFJ60vFDF+
         LH5LgiVpSvykNrR2IdpqNTLCwrJWwHXc5+Veco8MHLVf61+0Gd5h36R+YaYd6tsyEOy7
         yXYg==
X-Gm-Message-State: AOJu0YxO9j11OxX2+OKGKNfkv1ffEjXRpuc9uj5rF5+xOShbwxD8HFkX
	w66bVZgZVxP2BVYO7T/c1Di4MDInsdcsMpIwNyDFAJMlyR0bBneRfdu+O2r2FGA0ibcYFZVBG0S
	8i/AABg==
X-Google-Smtp-Source: AGHT+IGkM/XNg35LvSqspwm0qZtEc6PDjLpvf8bq2CGQisDevIpjEsk0tBTVA+YS1W0lXTWRmPNzHlZU19o=
X-Received: from pjvf5.prod.google.com ([2002:a17:90a:da85:b0:2fc:e37d:85dc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c09:b0:311:c939:c84a
 with SMTP id 98e67ed59e1d1-315f2632d6emr575525a91.15.1750800342686; Tue, 24
 Jun 2025 14:25:42 -0700 (PDT)
Date: Tue, 24 Jun 2025 14:25:41 -0700
In-Reply-To: <20250530185239.2335185-2-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250530185239.2335185-1-jmattson@google.com> <20250530185239.2335185-2-jmattson@google.com>
Message-ID: <aFsX1anrZGWFsbF-@google.com>
Subject: Re: [PATCH v4 1/3] KVM: x86: Replace growing set of *_in_guest bools
 with a u64
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, May 30, 2025, Jim Mattson wrote:
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 570e7f8cbf64..8c20afda4398 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -6605,13 +6605,13 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>  			pr_warn_once(SMT_RSB_MSG);
>  
>  		if (cap->args[0] & KVM_X86_DISABLE_EXITS_PAUSE)
> -			kvm->arch.pause_in_guest = true;
> +			kvm_disable_exits(kvm, KVM_X86_DISABLE_EXITS_PAUSE);
>  		if (cap->args[0] & KVM_X86_DISABLE_EXITS_MWAIT)
> -			kvm->arch.mwait_in_guest = true;
> +			kvm_disable_exits(kvm, KVM_X86_DISABLE_EXITS_MWAIT);
>  		if (cap->args[0] & KVM_X86_DISABLE_EXITS_HLT)
> -			kvm->arch.hlt_in_guest = true;
> +			kvm_disable_exits(kvm, KVM_X86_DISABLE_EXITS_HLT);
>  		if (cap->args[0] & KVM_X86_DISABLE_EXITS_CSTATE)
> -			kvm->arch.cstate_in_guest = true;
> +			kvm_disable_exits(kvm, KVM_X86_DISABLE_EXITS_CSTATE);
>  		r = 0;
>  disable_exits_unlock:
>  		mutex_unlock(&kvm->lock);

Can't this simply be?  The set of capabilities to disable has already been vetted,
so I don't see any reason to manually process each flag.

		mutex_lock(&kvm->lock);
		if (kvm->created_vcpus)
			goto disable_exits_unlock;

#define SMT_RSB_MSG "This processor is affected by the Cross-Thread Return Predictions vulnerability. " \
		    "KVM_CAP_X86_DISABLE_EXITS should only be used with SMT disabled or trusted guests."

		if (!mitigate_smt_rsb && boot_cpu_has_bug(X86_BUG_SMT_RSB) &&
		    cpu_smt_possible() &&
		    (cap->args[0] & ~(KVM_X86_DISABLE_EXITS_PAUSE |
				      KVM_X86_DISABLE_EXITS_APERFMPERF)))
			pr_warn_once(SMT_RSB_MSG);

		kvm_disable_exits(kvm, cap->args[0]);
		r = 0;
disable_exits_unlock:
		mutex_unlock(&kvm->lock);
		break;
