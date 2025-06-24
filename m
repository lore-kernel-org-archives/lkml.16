Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131002512DD
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794502; cv=none; b=RYdqpdkbh2f5IboSAz/3mTBb6ZPT88dexLK+WeRLMXRDKBLcwGOkEGvtvxFg2tVr+hS3MmMjV7mP7Bfelgf1mLyhlrY3Dm18HU+z9Hh9Dm5I7/71cl6SwZJxmQZP63llakH9uo9BVtDB7UMHXSx2Rcbb2NJyFq7twGmL2B8Fvzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794502; c=relaxed/simple;
	bh=6GotpNDPl6kXY95Qph8BUp0563LHJJPy0THk60BPwCo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=H8XGQt1vctmaKUBU+GHA7KddizsiXf+nuYAAxdS50ITwAhhnVWjKIhYch4WzgrKWFyxC0lp7f3eGpycd26IW0tr0BwizN0uGV9lEEZMPabEDikBNWDc1rimuIDNcZp2OfcDYzUGFfKGERN41MVG2MI93iCYLUokoy0VA9AbuCTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iXvrgX7L; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iXvrgX7L"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-235c897d378so7312585ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750794499; x=1751399299; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FqfSnFWDbYX+XfGG95qXGIQa/IUf7HyXIBVSL1oPA5M=;
        b=iXvrgX7LxlZuCfOu6RsvjymC6y4ezqYcyHZ81rwVKLStC2Ro8uPEVwWWkIX7c+gWTO
         eqRhZNf8Knn8byVswwz5LGlRnIC3AjJr57bV2cU++oKAnjd45aHzGa1cxFQga6a1buoP
         twrArYcw/uh6Gq/ftakiPhMGWM1xj6HoeF01/V5ayaJ+wB7Fw9LNR0+sg7OKouYtOnId
         +8OI/jxHuZYDxbo9UbdWTmnP6tsvu+D9KRA6w7lIoCrhNWERPhyU3BdvcezCpKcIn68e
         EHLALC9xux6llqkftURcyKGJIkXsZLJxEN3s1x6ih42ZjCRdCYEPuWSRPPlQqxgekj7i
         ZVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794499; x=1751399299;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FqfSnFWDbYX+XfGG95qXGIQa/IUf7HyXIBVSL1oPA5M=;
        b=loNy36urrEaPcUPxfTb2VUGXmSg/+UDqvlj+MncWFQWjT2/1ZukS9MId1qkAlmSm45
         YKH13Ir+tv0n1Ip0wBerAuiMnEGBSFhzFjfQV9Al+KkG7u9pp67YrrA19xl8KRUPbrr7
         d7AG68k3hCAKx3x1K+P3n/xUS4+Ki37EwlK5AInpknm1AqPAmB8IFm1nvMO2O90lt9BP
         uyQGJ9lGY/+7njbVHpiJpa/YhwHdsjE9ZBe4dxuSE9Tm0IsdH8VwtJQ/WNKdWuohU80M
         EGAimGOBfC/6cCEwPFFrGv3wnb7sWEhobijI+ZYJ7TuwWjG0YI8ViEyBcXMjYikrH3hT
         9aDA==
X-Forwarded-Encrypted: i=1; AJvYcCWknBKTCEWhxd+apHo3C7kcslHJT2vuKRuXuJxd5uqbsmwEcleI/FY23/q3Ljy1BKGPgsUK2RqrYTK+uUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcEP0fJE+9YFtik3uSeGPfDkz/pzvBVitW5YyZWMvqwk7R8M+Z
	clKRQozmuSw50tTlk7AiYOkUoPS4WEt54U3XBydkcfKWTQnne8kIQELuy+vgfgxvxmhyCzOhUa3
	XIb/9rQ==
X-Google-Smtp-Source: AGHT+IGpxI8leluMl7D0SzRSyFZPnLIXhC1vo2SBZLbYA6FIywV5P5SjIY/uT1NfQ4kDXoXw/tVSxEHwr2k=
X-Received: from plle12.prod.google.com ([2002:a17:903:166c:b0:234:ddd7:5c24])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ec91:b0:235:779:ede0
 with SMTP id d9443c01a7336-2382405cae0mr10401765ad.35.1750794499470; Tue, 24
 Jun 2025 12:48:19 -0700 (PDT)
Date: Tue, 24 Jun 2025 12:48:17 -0700
In-Reply-To: <aDcHfuAbPMrhI9As@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523001138.3182794-1-seanjc@google.com> <20250523001138.3182794-3-seanjc@google.com>
 <7cc5cd92-1854-4e0e-93b7-e4eee5991334@intel.com> <aDcHfuAbPMrhI9As@google.com>
Message-ID: <aFsBAXAbRQTPY45m@google.com>
Subject: Re: [PATCH v4 2/4] KVM: x86/mmu: Dynamically allocate shadow MMU's
 hashed page list
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vipin Sharma <vipinsh@google.com>, James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, May 28, 2025, Sean Christopherson wrote:
> On Wed, May 28, 2025, Xiaoyao Li wrote:
> > On 5/23/2025 8:11 AM, Sean Christopherson wrote:
> > > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > > index cbc84c6abc2e..41da2cb1e3f1 100644
> > > --- a/arch/x86/kvm/mmu/mmu.c
> > > +++ b/arch/x86/kvm/mmu/mmu.c
> > > @@ -3882,6 +3882,18 @@ static int mmu_alloc_direct_roots(struct kvm_vcpu *vcpu)
> > >   	return r;
> > >   }
> > > +static int kvm_mmu_alloc_page_hash(struct kvm *kvm)
> > > +{
> > > +	typeof(kvm->arch.mmu_page_hash) h;
> > 
> > Out of curiousity, it is uncommon in KVM to use typeof() given that we know
> > what the type actually is. Is there some specific reason?
> 
> I'm pretty sure it's a leftover from various experiments.  IIRC, I was trying to
> do something odd and was having a hard time getting the type right :-)
> 
> I'll drop the typeof() in favor of "struct hlist_head *", using typeof here isn't
> justified and IMO makes the code a bit harder to read.

Gah, I forgot to switch to address this when applying.  I'll fixup the commit
and force push; it'll only affect this series (hooray for topic branches).
