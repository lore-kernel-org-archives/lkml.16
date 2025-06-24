Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC66E283FF4
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793817; cv=none; b=WRNp5ITnp/UHU0a6u5aEW4ECY006gNZa/HehXG7I9HDOu07vJRxMW2tdeVRM7/zdanfK8EMmYraEnYXrFjQCrjS3QeN2k9ZwGHAh/klM+Uji7wwRAdhz7DtL5kIbn14px+82geQD8gKs5fWG+33TSLsC8sK3YhY2j0FEk0biIJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793817; c=relaxed/simple;
	bh=j/dlt5NY1sEevXbFRYWQdOfVqrxkNincuVvtIcU8akk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AwbwumxtWoSHEgoGkA0HxV4e2yrkyk6WJR//9PkN6cMhgwjUXjTzUGgSg3d53xZM09LqFWT51/7JH8gMW2u2T0yFucURAwLPgDQL/HW8esV6LAUk31EZTA0qfobMdAUuqkVWudb14G3LN9qXvFmfrXa/zgnj29KHUc6aiaVdgC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gbikuS0l; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gbikuS0l"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3132c1942a1so7830878a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750793814; x=1751398614; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=viMSycPBqiPur3+TWdDYuhle0MIOLpvl/Uol+qz3flA=;
        b=gbikuS0lFtr1wo0YL/0s0z7eAtK96pusWYNJslLiW4wn0YyA5yUx6br1rLR6pop9Hq
         oTNGUpTec4KgeTucQtQwVpLvG30dRv/IbFGxv+5o7FHeTSRiM3clfY0OHhc+AV1fswYb
         1A8nq1SSNoyxjOpSxpDW6R6pg+Ktvcg8PaVuijOxkXBVbDAK0js9dy0JSjX6/WlCVhol
         AGvCWik7yddSaBpfuVpEj+pvIoHKSAYpyeYtR8dEaTMNrteUAkb52F5TpX+Ra4mCKJnF
         udenBOvBDF6hwKFzYffTncMwEJlapN/0BRercnJmHOrsHxqZVkYlnLJ5kbCO2ztIVK9x
         dktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750793814; x=1751398614;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=viMSycPBqiPur3+TWdDYuhle0MIOLpvl/Uol+qz3flA=;
        b=GSKz8BC/dyelt372VyIpoqu3eacPkj6drwCkJUyzeJcj12FECVeDJGm8evp1T16Yf9
         lmxoHtGBD+Ube28PI6pxSB3BVrjlNWLn0CujL2ie0JOoz2Y0WyxeB7GJ4CBrTVhyXQ79
         T2Xl+RyURerUi7/fX76RCzOGjb85AmScluqlyLxIJc+oQ66W90BXmk1JHMPPtisPNKuq
         pIY/AM6dpoyzMF0zFaPj8C43G5PKESFrN84J39RhmqWbLwzrRUeUjSVwSg/VQkDFygnM
         Bed5UnjYv2+xze54/o1jAsh9a5/Yubawg4xsxsqdTB159fRPOO4bZNLYvm5OqAXs52zX
         wDpA==
X-Gm-Message-State: AOJu0YzH0IABwLt8b+TkX8xv0xw1n87i1VL/EA3AUF4BZAxf/k77fW46
	T5xQ+n1u9+Lsy8UsKSjPAd17asGci6mMANw8YquW9ecbiYkGROaiKnP1oWihrms4vWEzmBsJlHS
	wOgDc2Q==
X-Google-Smtp-Source: AGHT+IFRkQQ2myYZZnKFJSslcKWO07YibtuViIOb3x6ZN/PHZPWcw4jA+Uawc7SEfK6LvysgQOH01TybSVA=
X-Received: from pjvf5.prod.google.com ([2002:a17:90a:da85:b0:2fc:e37d:85dc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e87:b0:315:6f2b:ce5a
 with SMTP id 98e67ed59e1d1-315f2623ca2mr171587a91.11.1750793813797; Tue, 24
 Jun 2025 12:36:53 -0700 (PDT)
Date: Tue, 24 Jun 2025 12:36:26 -0700
In-Reply-To: <aEylI-O8kFnFHrOH@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aEylI-O8kFnFHrOH@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <175079250757.516293.17591190576479567167.b4-ty@google.com>
Subject: Re: [RFC PATCH] KVM: x86: Dynamically allocate bitmap to fix
 -Wframe-larger-than error
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	avinashlalotra <abinashlalotra@gmail.com>
Cc: linux-kernel@vger.kernel.org, vkuznets@redhat.com, pbonzini@redhat.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	avinashlalotra <abinashsinghlalotra@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Fri, Jun 13, 2025, Sean Christopherson wrote:                                
> Use a preallocated per-vCPU bitmap for tracking the unpacked set of vCPUs     
> being targeted for Hyper-V's paravirt TLB flushing.  If KVM_MAX_NR_VCPUS      
> is set to 4096 (which is allowed even for MAXSMP=n builds), putting the       
> vCPU mask on-stack pushes kvm_hv_flush_tlb() past the default FRAME_WARN      
> limit.
> 
> [...]

Applied my version to kvm-x86 fixes, thanks!

[1/1] KVM: x86/hyper-v: Use preallocated per-vCPU buffer for de-sparsified vCPU masks
      https://github.com/kvm-x86/linux/commit/4bbcc07a56e6

--
https://github.com/kvm-x86/kvm-unit-tests/tree/next
