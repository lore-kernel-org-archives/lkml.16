Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C317E1D432D
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739225829; cv=none; b=uMlqVyXeh3xISjahkDLCPldzJwGvDQ2fDNg9s2fx1zbqsyu0y86IfNrpHXuGsNA5EStYz5drTlucfwi7HGdOtSIPRWvty99G6pK97yblo9VnZcvp1hjOdcjVj6yeC7JZz2Ea+CjbjFjCxvp50ehLw3/dagKdfBBUGj3M7Y8JPcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739225829; c=relaxed/simple;
	bh=6lE5Mnx/T7Poj2YlCWXbpUyGGnjq5GAq+vZkbcngMo8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rPIRgDZkpR/Wz5JFM8aoVsYqqn4vNj3zjRG70n8GXise5b7eeYimNQdfV1jwcD90NPjpiqMzppLu7uWtMUR/6w3MbcDSeY5K4d0VXn0u+1N8zkDkQ0Id9wCzF6jY8EiMOfPfBRVVUALFdM+c75hYsMSW7vB/9wDCk2L7u99ciyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SN105Hcd; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SN105Hcd"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f46b7851fcso14951309a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739225827; x=1739830627; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NiQktNxQxsAHB60qGvEjY4Wnpw2CpSJgOu9uKXQ/mCE=;
        b=SN105HcdZqBq3UL/IWci7pYMJ4YGTrlwiVO39EfCsQ4Ng9nLBigcN7izudPSGLvcJC
         hG16WI5bFgGoF7K3VyHsNQzlqrIBeX/qztOTWJDZzepY9fg31au59BW+4aKvsnxzISqh
         OvHf+OUA15jYXW/EkspkVu6b0kLOslBisBGZFK5KZDiBcUSDng7cR0tvbAd4CrwI7If6
         TRHPovVVvlVoxZYNtY3qI7LUnvQOaFL0fj7vUfXKQ5o8xSGd4AAVoiVHuVR2fnW0Ay56
         S6LR/wt9hGbtC5dce7u5PH5orrqK4MksMSpLFbRfgyIMkCRpeYQLokRxlt2812C+T6fX
         vKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739225827; x=1739830627;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NiQktNxQxsAHB60qGvEjY4Wnpw2CpSJgOu9uKXQ/mCE=;
        b=mgReOWrv8Ct8WGixdbcIHlruT7zbBt1a5b6TIAcKppxSWnGpfOtryorbZ8H+1DYa3A
         uuEMzZjnm8IEXjf+Nl0vgaL+cJ1g8EsHgKSfbb+nYWtV5uVOBI+VhV6I0vTMRUviYuqq
         OC10KmhQO00IxucJoqsKIWAVl2USsmd5xIE8EJ7IRSAPBUsJXhw/XHSBUO/ng6cKvjmE
         D6UevjfbNdgkQ+JtaO2csxQDYSqnLBr6Oi2vLQZOqhOlhAjPy/93wAxTkDCjGPOP6Oda
         lQBaScoMrevkukiWDjJGgpIBWSGciyIVTxhlGJhGfG/8Jb9SXkrb1aWf0Q1tK8eVamsy
         qsRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtvDw4gm9YrsiXMtnEzOqfj46Xwnt9o1uMtnaXrJlmbtg7JQAYqCeb/hgc6bDTMOWMjQq3GcIcaVWphZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Xf5AVF7laVRFeqpymeGE6kIOao13SsTgisIGVAHc2rCJMGzE
	wth+HAfd5k9NFPbwqZ4wloVHJDi2VkRkEuraEuz24rzaeK0hMY3usZX17L23wtEScan/dy3JY/p
	egA==
X-Google-Smtp-Source: AGHT+IFUr8B406UlqTbwQn8/a3DnwXEDSVRHSHvADMnY9/DAsyJd87DA1vBUl7os5VL41nbcjyiEKpkvFTw=
X-Received: from pjbnc15.prod.google.com ([2002:a17:90b:37cf:b0:2ef:9b30:69d3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3143:b0:2ee:b0b0:8e02
 with SMTP id 98e67ed59e1d1-2fa243f0272mr23783490a91.28.1739225827007; Mon, 10
 Feb 2025 14:17:07 -0800 (PST)
Date: Mon, 10 Feb 2025 14:17:05 -0800
In-Reply-To: <Z6bBoZOynhI3eV+Q@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250207030640.1585-1-yan.y.zhao@intel.com> <20250207030810.1701-1-yan.y.zhao@intel.com>
 <Z6Yg0pORbMyC-9xA@google.com> <Z6bBoZOynhI3eV+Q@yzhao56-desk.sh.intel.com>
Message-ID: <Z6p64UaZnYg-qfNU@google.com>
Subject: Re: [PATCH 2/4] KVM: x86/tdp_mmu: Merge the prefetch into the
 is_access_allowed() check
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: pbonzini@redhat.com, rick.p.edgecombe@intel.com, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sat, Feb 08, 2025, Yan Zhao wrote:
> On Fri, Feb 07, 2025 at 07:03:46AM -0800, Sean Christopherson wrote:
> > On Fri, Feb 07, 2025, Yan Zhao wrote:
> > > Merge the prefetch check into the is_access_allowed() check to determine a
> > > spurious fault.
> > > 
> > > In the TDP MMU, a spurious prefetch fault should also pass the
> > > is_access_allowed() check.
> > 
> > How so? 
> > 
> >   1. vCPU takes a write-fault on a swapped out page and queues an async #PF
> >   2. A different task installs a writable SPTE
> >   3. A third task write-protects the SPTE for dirty logging
> >   4. Async #PF handler faults in the SPTE, encounters a read-only SPTE for its
> >      write fault.
> > 
> > KVM shouldn't mark the gfn as dirty in this case.
> Hmm, but when we prefetch an entry, if a gfn is not write-tracked, it allows to
> mark the gfn as dirty, just like when there's no existing SPTE, a prefetch fault
> also marks a gfn as dirty.

Yeah, but there's a difference between installing a SPTE and overwriting a SPTE.

> If a gfn is write-tracked, make_spte() will not grant write-permission to make
> the gfn dirty.
> 
> However, I admit that making the new SPTE as not-accessed again is not desired.
> What about below?
> 
> @@ -983,7 +983,7 @@ static int tdp_mmu_map_handle_target_level(struct kvm_vcpu *vcpu,
>                 return RET_PF_RETRY;
> 
>         if (is_shadow_present_pte(iter->old_spte) &&
> -           is_access_allowed(fault, iter->old_spte) &&
> +           (fault->prefetch || is_access_allowed(fault, iter->old_spte)) &&
>             is_last_spte(iter->old_spte, iter->level))
>                 return RET_PF_SPURIOUS;

Works for me.
