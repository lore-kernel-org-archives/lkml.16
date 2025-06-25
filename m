Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6C92D6601
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 18:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750876167; cv=none; b=CspIIz9RxtjvJ5NT+k0z43yqb75DG+iePBsaWAh/v7+xjLgm06hYE2bD+vZQ+kQYSWpbaZpxSfJuFlFcewSU3u2DfcuBAld+OkgK9KIm8kuJzGcN4BfnkvbVFuP170wU4oRAz8pjd4do8f63hlgh0C2OGoAXHTAZaQmFUYhsvFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750876167; c=relaxed/simple;
	bh=TmQfvKIRFHUQRm9d3k3nPg6QQeGONuWlQrMorEs6wjw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=f/xhtFfpDUgoXJ+jK4nseH8dD/NC/OdLOBLm/rAyArB929ICPn+augikwov1vGRosc7TXCSHreu6y6v1VzKoHE0kcCg3Ig9vdph5G6e2qDqFgNoZe7UUNH9p49cAmwzG4851iDfNWFlINjjcumWpw/5PXkij1Rw4Cgq3L22kIew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SK1ZSpjl; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SK1ZSpjl"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7425efba1a3so200061b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750876165; x=1751480965; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RyisTqyO/JOPc+5y7ScQVEK2p20o+XhWHrp4F91o7kc=;
        b=SK1ZSpjljhMH1mtbdDPbiymGuT787boBWTwH6/9hBEwESe9IHPx2+cm4VtCYUbFGde
         /Ii4sF7gRpPNz7YIUYqZ106z5ZZKk7C6ubj/XjTXCaBclGkpUAo7x+tr+KGJ0JHQu2D0
         hGhOyIzFdGYzurYPjBE1TzISZRKqI8v/XhaLYhffWFuaPXevlxtJR7vMe6iUydNbdeFh
         /dUO/ML4c0jePwBhLJrw9kAUKWmQGOSjX0ADVLqAeLxa/+zELY4r288VKV0xIKguRB6p
         3gZKEYHW/Hh9fmAAwY+43ss34DGHwo8BPH0B95x1Yzg8wl5mdepGJOOLkwllRFsxnKTc
         Sbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750876165; x=1751480965;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RyisTqyO/JOPc+5y7ScQVEK2p20o+XhWHrp4F91o7kc=;
        b=HKIg21nl99HfMpJD24+9F+I7XPqzXzK8yBEtyCxsa/RGpowhjOXspNl7dd/VWx1vJf
         9FHzJdqIhtTUTubIDRnb7cyB1rnVc7iVj4NX+4agLz5tyea2U9Klovb9GcM+IXm5Kz3x
         7i6tIzSc3t2WLtlFm7VJypjbc+oSC2iE+4SW+raDuU3S4KUe9LW+plPaHB6I9J4Uw/ez
         PwjnWRlkOEFv4RZdMA0ojQNgLujBhKbIc0l3az57IeBr5ZtkshLUiFocDpQXasLR5adT
         uqmM7GASNWBgOiyPo5yfpbhR7wXq15RvVLGxAfQUfr5ssqe+MeOw2qyXSCV1ltK+hGxX
         L0Sw==
X-Forwarded-Encrypted: i=1; AJvYcCXldKeL1RtQMZBbGFoqUbx8roIHCafRLUBrkm0noHCJVs5FPm6Bb8NdwhNkYaYzk7QZ/aZlQ6YLZQ8u57I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoLzRkC48DwFEqKu5d6L5qdP4qbNogh04waGE0SECE/2K4hM5d
	piTCh6gg/AcLoX1LAG1QoVkSvQufFLFUcnZWmGcsQ/eFP2a3MDCHZz6f9vBVQl7JuVTQEA+IB1M
	uQdBU+g==
X-Google-Smtp-Source: AGHT+IHO1EEsIJL+9m2YBDHY3A29o1rYIS4ZxaqkzVMPXpsMIhuoThR9fcO3LwPKLXAf4C7bLXu6Jb7838M=
X-Received: from pfop2.prod.google.com ([2002:a05:6a00:b42:b0:749:30b5:c67e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9195:b0:736:4c3d:2cba
 with SMTP id d2e1a72fcca58-74ae40c2799mr696433b3a.9.1750876165145; Wed, 25
 Jun 2025 11:29:25 -0700 (PDT)
Date: Wed, 25 Jun 2025 11:29:15 -0700
In-Reply-To: <2dc165c7-e3fd-48f6-bcfb-c2119fc94a54@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250328171205.2029296-1-xin@zytor.com> <20250328171205.2029296-16-xin@zytor.com>
 <aFrUg4BB-MXuYi3L@google.com> <2dc165c7-e3fd-48f6-bcfb-c2119fc94a54@zytor.com>
Message-ID: <aFw_-8aDtO4wat8M@google.com>
Subject: Re: [PATCH v4 15/19] KVM: x86: Allow FRED/LKGS to be advertised to guests
From: Sean Christopherson <seanjc@google.com>
To: Xin Li <xin@zytor.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, andrew.cooper3@citrix.com, luto@kernel.org, 
	peterz@infradead.org, chao.gao@intel.com, xin3.li@intel.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 25, 2025, Xin Li wrote:
> On 6/24/2025 9:38 AM, Sean Christopherson wrote:
> > > ---
> > >   arch/x86/kvm/cpuid.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
> > > index 5e4d4934c0d3..8f290273aee1 100644
> > > --- a/arch/x86/kvm/cpuid.c
> > > +++ b/arch/x86/kvm/cpuid.c
> > > @@ -992,6 +992,8 @@ void kvm_set_cpu_caps(void)
> > >   		F(FZRM),
> > >   		F(FSRS),
> > >   		F(FSRC),
> > > +		F(FRED),
> > > +		F(LKGS),
> > 
> > These need to be X86_64_F, no?
> 
> Yes.  Both LKGS and FRED are 64-bit only features.
> 
> However I assume KVM is 64-bit only now, so X86_64_F is essentially F,
> right?

Nope, KVM still supports 32-bit builds.  There are plans/efforts to kill off 32-bit
KVM x86, but we're not quite there yet.
