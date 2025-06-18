Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D7621CC55
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280382; cv=none; b=jefBrp371lzhpj700p1IViyWzLn5U84bNRHCXXe9nrW3BZ1dSayR12haFfH/kxow9YHmawNawJ287QhgXVJDZcfKacUuuOOsoTSYoEF3JNdkZpTY5hN0WBkRWR/jdBnWjGq4X90yVhBulpBW12JVE0TfzXzOLe7YwkjSSsAIflY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280382; c=relaxed/simple;
	bh=TGl3VBkKi7oE2h+1aWKRYyzd0xAZ30Hgfd6PLNHMvvM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W5nRw41GUF8JPBAX95mC4E3tMJNnTxTNN7f3VQsxSKmFbwud80JMscgrzk3w7EN88K050T8p5+zgCNG0WWpZo5YkKtF1/MxjirQj2a/VDPkgQnBOOydblxaCXicIuIouRvmfsYVR587RDLV0aUzl8+poJHVSRQIS/x5Y/Kdm9Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SqiZ+pv5; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SqiZ+pv5"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-747cebffd4eso41833b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750280380; x=1750885180; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aF8FChrkDuPz1pKDYbAfDf2mWO3Vl3/6TjWiBlEasWs=;
        b=SqiZ+pv562nzGlJL5tbxdFLpL1ej9fsTPi79ALeWymANiMixIDY8yZcMcbpwn83siY
         QimvQOMnr2CyaGDgGNed3+CsN4/YtT+Fp3TWbQBecsZ3cE1uIcinGtfwllPr1LtUCmJi
         5oXOmR2B72oFDXLqxgHz2NxcixZwW0i51d1MnsjsMgRhQ9jMx//32Qyv2XoT48u8PFrf
         Rc6dJj7AiIPTRTYEcLFsYG4o3mYHs7s4aeeVdzCTH2u81FONoizcxrhNjQTGLDWSfwRq
         kiUTk2rkPOv3tIJd+LV7g41JSoEd4S1fOw5sNzoudMnJZOLskLx0pThCIpChwrg3R2cL
         +WCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750280380; x=1750885180;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aF8FChrkDuPz1pKDYbAfDf2mWO3Vl3/6TjWiBlEasWs=;
        b=WQlmnBo6JXk/phCFhx1J0lT4GYGSnP/6yahjYZ6fMrpZh86aA6V2M/Fkapr4P15Owr
         MOsiH9KK0uQMzGuIM67IeEirvHj/FB3q6LL4eHnxcXLOeioEClETas+lDk4B8NgOQEdD
         5edpmWPnlD9kJeEInjQKBrE6AYuqIFBrSh0mpyNubsBtZ24U+KnCA/4emTIBdFYztLRk
         WDpBC4hnIsfTm+JECBt1BHpXRhoysrk8tH8Wi2sJR9L0iiYLGrZ27uWCfJDFLPceLoud
         +YXt5aapWe/448e3xI/AQkWdD6INNSEks9adoqweo8mgNzvm1uaI8twqVtgFVxpWPxWB
         H5Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWZ0A72LJur5tcei9dTljLM8Hz2y7wKmcGNCPMVXdGw3+YWKLBJzs/cN9a3yFyYjDkYT+yJtXxgYHtt9dw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs2EteJR7nOFuL7WQKzw+qoAUrQfQN7cpuzqIQfC55YM2VW1E2
	ur0HjjuFKhjnDDJNySdIqXQluh61rgFzkOjBq8DHb2IQqmv5YrOxYUuKZkzcAR87H42fynFbaF9
	/gZg0Mg==
X-Google-Smtp-Source: AGHT+IF2uJOMlygI0ECXMxjUKFr94MDL8dRFNErS7/emaEcq+7yIxFlJ3NplEPfGVdrHzu/gZljNYVWfvEE=
X-Received: from pfoa20.prod.google.com ([2002:aa7:8654:0:b0:748:2476:b25f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4646:b0:748:3822:e8e0
 with SMTP id d2e1a72fcca58-7489cfd5dbemr25408374b3a.13.1750280379840; Wed, 18
 Jun 2025 13:59:39 -0700 (PDT)
Date: Wed, 18 Jun 2025 13:59:38 -0700
In-Reply-To: <7timm7vdq4vjwn6jo5bwgtbn3f7pdtdch7l5dws76pjg7syqwb@al5mifdmboog>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com> <20250611224604.313496-14-seanjc@google.com>
 <bmx43lru6mwdyun3ktcmoeezqw6baih7vgtykolsrmu5q2x7vu@xp5jrbbqwzej>
 <aFGTYoxlLhZsiMUC@google.com> <7timm7vdq4vjwn6jo5bwgtbn3f7pdtdch7l5dws76pjg7syqwb@al5mifdmboog>
Message-ID: <aFMoumQ8ILTLr7PZ@google.com>
Subject: Re: [PATCH v3 12/62] KVM: SVM: Inhibit AVIC if ID is too big instead
 of rejecting vCPU creation
From: Sean Christopherson <seanjc@google.com>
To: Naveen N Rao <naveen.rao@amd.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 18, 2025, Naveen N Rao wrote:
> On Tue, Jun 17, 2025 at 09:10:10AM -0700, Sean Christopherson wrote:
> > Hmm, yes and no.  I completely agree that clearing apicv_active in avic.c
> > is all kinds of gross, but clearing apic->apicv_active in lapic.c to handle
> > this particular scenario is just as problematic, because then
> > avic_init_backing_page() would need to check kvm_vcpu_apicv_active() to
> > determine whether or not to allocate the backing page.  In a way, that's
> > even worse, because setting apic->apicv_active by default is purely an
> > optimization, i.e. leaving it %false _should_ work as well, it would just
> > be suboptimal.  But if AVIC were to key off apic->apicv_active, that could
> > lead to KVM incorrectly skipping allocation of the AVIC backing page.
> 
> I understand your concern about key'ing off apic->apicv_active - that 
> would definitely require a thorough audit and does add complexity to 
> this.
> 
> However, as far as I can see, after your current series, we no longer 
> maintain a pointer to the AVIC backing page, but instead rely on the 
> lapic-allocated page.
> 
> Were you referring to the APIC access page though? 

Gah, yes.  I was hyper aware of the two things when typing up the response, and
still managed to screw up.  *sigh* :-)

> That is behind kvm_apicv_activated() today, which looks to be problematic if
> there are inhibits set during vcpu_create() and if those can be unset later?
> Shouldn't we be allocating the apic access page unconditionally here?

In theory, yes.  In practice, this guards against an unnecessary allocation for
SEV+ guests (see APICV_INHIBIT_REASON_SEV).

That said, I completely agree that checking kvm_apicv_activated() is weird and
sketchy.  Hopefully that can be cleaned up, too (but after this series).
