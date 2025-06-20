Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69A4221DAD
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 20:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750451519; cv=none; b=YHLWnwSDED59iwmF/up7sBMtrKI9Jz1tVVdV9cMoJ9u/+Lx8b0WDtb3W/WBBh0TwBJm6CC7OoIvCnfFbF98bh4qVq+sjsNO1WbggOmj7qMsmCcv6f+sZfuHS7JNejSY1exPYlH3+z0FHh6O6IAf6tBCoEcm4lgxptfhG6lDzEOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750451519; c=relaxed/simple;
	bh=gPYvpazE5IHW++4+swnhzOjII5AZCwNMAl3KBQt/agU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=h4LxANSDENm9wcuHNV4uwEDkdpBbNdnJVNHZw2crCM/iRFqd5MANAyPmeOJvc0A02vvF7+wdyNouD4HIWuAPs6bruZatZfdsEbjiVu4DZd7oVzOnkg/B+qyZsdgVUjZvtCXMzKSSz4C/VFBQQ/ShvWhCXZTjNrQInaN8LVc2eFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ScZahKNR; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ScZahKNR"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b115383fcecso1515403a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 13:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750451517; x=1751056317; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bt/+aWwyrkpIimxSl5BUL+43sm1rEuMKKgBDpLCw3jg=;
        b=ScZahKNRPcbzzJICOWTLZpjHpya8kSku/xDBr+HXBeH/o7fqOqo3oMe8jCLrHjBQab
         IdHPit9XbvOlXWsA4QANIE3PZxu6C0bfz0yb0HqA94jMVtaNqTuLpzSY+rNnfqxSfocd
         eXrgsps1JDZtucwr2yHMgc/RIaTNln0ijQoL8R8Ev9IwOQAUBwqSoWL7poaUsZDCwV6X
         XKUejW9UEYfwUckzB+/CL4PsOldfEpZfjcpNfOmc4bEggdcUCRKKNxXRObWqS3k16y1B
         ExRBjMqu32ARjR2wqihCYs1UiYx9L7mL9vAsFZ1eqNHQeBdnlgsu+N+mIrvUW6L9QCwY
         o1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750451517; x=1751056317;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bt/+aWwyrkpIimxSl5BUL+43sm1rEuMKKgBDpLCw3jg=;
        b=xNGs48We3Qzr2B4cmSH/iihDkE8ztfRrezitbD6zyE7DLHmNijiOWQNLWSnc2ajlYr
         J3gQ1PQZKjZI9424Mjij2/O/MCJH1t7ROhXa8TLM46pVJO2E0WxoHyV2RMKHDpjHFLGl
         zw5Uzo6mrUxeE0ehAQvaI8doTZ4dt/cDWWVU7p80jluAM24q1GuEHAyVfcZt6p2wk6np
         4nuuMxBC2nRKIHsE8B4HZgRe2dfePIqSIUXMmUV4sWpucbHTOkBVmCVdU1a5O+VabjRu
         isfW/JeeeHfa0DzlLGfOLDNYg3V7o7Mw53gKnax5hcy9qBZTau53m62nH8PJoXtNdZgG
         jYDw==
X-Forwarded-Encrypted: i=1; AJvYcCXrAWf+1qGPUuoPmowH0DZ98Vgs4nckqhNCRt3P59YUEcKlvTOGhPPN343EXo0ZUjzsG4YcqBHsOq02pLk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwa4lVjphmXWyJs2kUpsTeMCxj019PMNURRw7WSPLvImzY9o8j
	KeikJVS1gVcVLOH/3Q+ubDx/VXyHcl+xS048s9jPJihKugkstFLywS+bFJ0dhqz/Dbc8TzUabQZ
	Q5u7Ijw==
X-Google-Smtp-Source: AGHT+IENxgy3xkU/bYFGboojnHAxZAT6iEP2BT2EbQa3Q20JReS/EV7Fji9LhO0E/EbM/UcH2Oi/Nx+lNZo=
X-Received: from pjb7.prod.google.com ([2002:a17:90b:2f07:b0:312:f650:c7aa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5212:b0:311:b3e7:fb3c
 with SMTP id 98e67ed59e1d1-3159d8fef6dmr5375179a91.31.1750451517093; Fri, 20
 Jun 2025 13:31:57 -0700 (PDT)
Date: Fri, 20 Jun 2025 13:31:55 -0700
In-Reply-To: <aFW2NISX0q11sop1@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com> <20250611224604.313496-4-seanjc@google.com>
 <86tt4lcgs3.wl-maz@kernel.org> <aErlezuoFJ8u0ue-@google.com>
 <aEyOcJJsys9mm_Xs@linux.dev> <aFWY2LTVIxz5rfhh@google.com>
 <aFWtB6Vmn9MnfkEi@linux.dev> <aFWws7h3L-iN52sF@google.com> <aFW2NISX0q11sop1@linux.dev>
Message-ID: <aFXFO6_lVV5PpGW-@google.com>
Subject: Re: [PATCH v3 02/62] KVM: arm64: WARN if unmapping vLPI fails
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Jun 20, 2025, Oliver Upton wrote:
> On Fri, Jun 20, 2025 at 12:04:19PM -0700, Sean Christopherson wrote:
> > If I post it as a standalone patch, could you/Marc put it into a stable topic
> > branch based on kvm/master? (kvm/master now has patch 1, yay!)  Then I can create
> > a topic branch for this mountain of stuff based on the arm64 topic branch.
> 
> Ok, how about making the arm64 piece patch 1 in your series and you take
> the whole pile. If we need it, I'll bug you for a ref that only has the
> first change.

Any preference as to whether I formally post the last version, or if I apply it
directly from this thread?

> That ok?

Ya, works for me.  What's the going bribe rate for an ack these days?  :-D
