Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146991D5CDD
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 14:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746540970; cv=none; b=PY0r1VA+I2bKAGLQkgiCRHPCpmWoTN8vYkGLmrfoA2A3HGBnoNmAeD4SEX5TzU5dRQi+PtC1O+Ps7xkVZHFwCKKq4VZfdQHgIA0PUnuZbRIoTOVwHOG5sxxuVSMnxAgfEvjvnlwQLsc2mBxMbN6xcQm7PNGKcjowLd9Q0mUAnmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746540970; c=relaxed/simple;
	bh=nGZfIx4Ed+ZFz2U1JEUcofTZSLNFo8zSSEgYCX/iv0M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fC2szTvOPBM+o5Y8Rh1IxnbZ+Rh5nUI5qw6xcc9/9Xe+nUrk5grKfV7CvPVdjKZW8ZaQXo33CMFZemdI+9vHEjGTBd/Df9zrTLW5A5baD17HzuFlDGWPcR5bMs/ji210JcX7pyxc2uIdGuSGsQtZlMrGugKi9SSd5NS4v4SS6d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ce4KsqT+; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ce4KsqT+"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736b5f9279cso4687462b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 07:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746540968; x=1747145768; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WrcdjkSiEM3T1KHu9XV65lo+7YycT5Nay5GRFc9p3r4=;
        b=Ce4KsqT+eF8EbZVzCUsXwYn7XREUx6B4EEXP0ely5yXFZWm//yva7jsuFFYZVosnYi
         vvbFo+ceTsGm5mcTzwkMSRmerV8LqHYnyKCI8JVtZY2VTkMVC/dPK1177V5QS0vD/XMy
         /ckzJekE0HnuzInEDyUYnVywKBEHSWC0rl2lsl8U3X9MqFjf5UQHyMXv1XWZ7gH24ml6
         Fq2QrqXOVBPQ6fhtZCJwlJ+olZEMqYcH5yk/0SJpzm5rRKUFr+LbrZDtvdpTPMZqpMVo
         ZxE03KJhVhaGTO2DqUBsUnCl2dL1Nm0Z95HW1qTHjE7rXrkn4f3W8eWW+MuxfvXHhFxb
         3A6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746540968; x=1747145768;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WrcdjkSiEM3T1KHu9XV65lo+7YycT5Nay5GRFc9p3r4=;
        b=Rn8Ld2/evlQQWYPGnkewkDWhepBiZY/YYQ0L8s6RFQa2ZVKmKosvNxGszlHGaTHGyq
         wZd32VOaWYl/Pba8xRQPkgBRZZbIXhtGPvr2awGjgWnms2IA7QCu/Xzwf/8pUArPfokn
         1xBboIvs5QX3dBNKrzC9oF25zXxrqPvXo03ij9YBxkm5uExvXt3XEeDLPjevuN7a6Bmb
         z0kbTEy1ZfRPjOmGwK0283PVsNFM6m46De23G4Fnt1hZm66VcTC+r+yNVGvJWEzNnU6S
         NJW3xBk4zhqbR/Pn61//Kz78h9RxRKS86iwNrzKdsMMPGBTmuW+ht+fVGAYvyTSftQUD
         kjMw==
X-Forwarded-Encrypted: i=1; AJvYcCWa0D0OQWOnowE8k/lTKKYS7lbfgQni3VfB+Qba719OuCK/Y191LSl+KhvWrgUKdX5AkNWJmzydlZOX0sQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxk1XLaxiXyRpEyia8YTuTXBcLQvo6KIdU9V4dTmYBj3S+Y7o6
	psyt7qpUxYK2TzW/3sZ16/Bqn4AfHrh189id80x2XtDxnnt38NcpdN1Qi6REGs+Qt7eq8wijqRL
	qKA==
X-Google-Smtp-Source: AGHT+IGVWwya7CMmkwuCQneO5Dqgblsv/kYJEhrK535ESjIRh4BpPMEUpLfbHphMVOjw5lo3RBtUbslJkfo=
X-Received: from pfgu9.prod.google.com ([2002:a05:6a00:989:b0:73e:2380:71b3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:28c3:b0:736:5438:ccc
 with SMTP id d2e1a72fcca58-740919bd7d7mr4136427b3a.9.1746540968104; Tue, 06
 May 2025 07:16:08 -0700 (PDT)
Date: Tue, 6 May 2025 07:16:06 -0700
In-Reply-To: <aBnbBL8Db0rHXxFX@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250505180300.973137-1-seanjc@google.com> <aBnbBL8Db0rHXxFX@google.com>
Message-ID: <aBoZpr2HNPysavjd@google.com>
Subject: Re: [PATCH v2] KVM: SVM: Set/clear SRSO's BP_SPEC_REDUCE on 0 <=> 1
 VM count transitions
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michael Larabel <Michael@michaellarabel.com>, Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="us-ascii"

On Tue, May 06, 2025, Yosry Ahmed wrote:
> On Mon, May 05, 2025 at 11:03:00AM -0700, Sean Christopherson wrote:
> > +static void svm_srso_vm_destroy(void)
> > +{
> > +	if (!cpu_feature_enabled(X86_FEATURE_SRSO_BP_SPEC_REDUCE))
> > +		return;
> > +
> > +	if (atomic_dec_return(&srso_nr_vms))
> > +		return;
> > +
> > +	guard(spinlock)(&srso_lock);
> > +
> > +	/*
> > +	 * Verify a new VM didn't come along, acquire the lock, and increment
> > +	 * the count before this task acquired the lock.
> > +	 */
> > +	if (atomic_read(&srso_nr_vms))
> > +		return;
> > +
> > +	on_each_cpu(svm_srso_clear_bp_spec_reduce, NULL, 1);
> 
> Just a passing-by comment. I get worried about sending IPIs while
> holding a spinlock because if someone ever tries to hold that spinlock
> with IRQs disabled, it may cause a deadlock.
> 
> This is not the case for this lock, but it's not obvious (at least to
> me) that holding it in a different code path that doesn't send IPIs with
> IRQs disabled could cause a problem.
> 
> You could add a comment, convert it to a mutex to make this scenario
> impossible,

Using a mutex doesn't make deadlock impossible, it's still perfectly legal to
disable IRQs while holding a mutex.

Similarly, I don't want to add a comment, because there is absolutely nothing
special/unique about this situation/lock.  E.g. KVM has tens of calls to
smp_call_function_many_cond() while holding a spinlock equivalent, in the form
of kvm_make_all_cpus_request() while holding mmu_lock.

smp_call_function_many_cond() already asserts that IRQs are disabled, so I have
zero concerns about this flow breaking in the future.

> or dismiss my comment as being too paranoid/ridiculous :)

I wouldn't say your thought process is too paranoid; when writing the code, I had
to pause and think to remember whether or not using on_each_cpu() while holding a
spinlock is allowed.  But I do think the conclusion is wrong :-)
