Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF601A072C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504020; cv=none; b=l8La8doHWaL880geCRxPhqo5PMvDne82Lv4YblrOjc5Wwu1RYEivX5IRM5qZkuuIYcdLKG5tP1eZbRB3rW2o6+EBWCfDo2GBr2fPm8O0qrHBFODUqeBp6e+Za+ybb9bZxDuMGHp657UnooCYDNGQ6mw2NodwXM6KucP45yFyKRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504020; c=relaxed/simple;
	bh=IU1W/JCdrrhxdJ5WvmQGAwCklNVOFnQBmbNWHuEVJyY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cCFi/WypV1XjyQ8kX12lJFJ7d3vWR5nd8tsm1WgCQLFBzq/I0oiuk+QBaPYsM08196jqZZdIZuqSAkfHeep/gcim/YV8vm/29ohlEaNaZSFYS8OkOBgeTtGYNnyT1b3OjVlgbTZiVMMx+M/T9FsKBfqonpU+qYhTw8ekWndsQGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L4QM/kh2; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L4QM/kh2"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b090c7c2c6aso652584a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745504018; x=1746108818; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t921yTGj75JTSKsSLngkcs2w5nGrP5C6g0Ynh60adb4=;
        b=L4QM/kh2Sfy20MrUlCIpP+cxS/I+cnVhDUHXBSY85N4adZlOZJRVi7Z504aZHnaWcE
         aqmfpX0NOK3NyvMT34lf+pzSWIhExo1vzMXAYgLcXKu/q1uGDNVtPr18Qn+cKbV4W6TG
         24VzLKk9hdqig7pMStEIZnVhtREDIbgJ3EUZxEDJGR8A7R2CdJ0UnUAP1LoYh+2HBVHm
         YOT40nxKvj+CFWDuE5ULXYf1YvPhCHNJxHk+8yxw391Tf70ki+1oPZvoWmyvkk8apnXk
         P1htsxzoAuk8DqZDfZ6D3RHUFLoYrfgSRL2Uy34a32iU6PhqjWRhPJe5jW9JCnmax2HR
         kjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504018; x=1746108818;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t921yTGj75JTSKsSLngkcs2w5nGrP5C6g0Ynh60adb4=;
        b=BPHcPU5Z00VwL0UdfpNVstVfO/bQ4dsyoGo9Pa4NAxotrnInLrJxhhlPlBUsDozbxR
         5VWCuf49KzQ6SaNm24OTCVMMD6lD3Oi3wOz5MgjmipGaseThZxt1Td+RkPBC+z/2eayc
         Yt2jSpRl8h33GKNeZ3L+U3pqVYDojFvbSHgrSE6hg1PT1k7gFQujPrsVMjixt+OR8veq
         FXbGsTADTUGjf65cBZx4SNJk6Of+cOSoYlaT240OmWF8jPL7lXu//sxVi1oDdHGr7jW4
         glZn/EJukdQim4JV2HX22osOJlICnPdlbYO3PyISKIjzFidzYWTyPeLyfzak4uvCRKBN
         y7GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZxJ3sC6NEOBbZEvIh04RioQ6YDTai1L8UoMo+/GZuGhnnmMtyQbBaYf7g4Is9t7KFhNYUB6VW9WkVLPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNBNpBvlv4lpMKyYv5c717et7qNnxD1OfTcgU1N8icOfJLUziU
	KnlrpXYVIBnUOsHowlQndqkyyNvk6rzHDF33xoDTdRVqfae3MguYQQk6dAZJ0ZCHQ2QXIbPN1EN
	6mQ==
X-Google-Smtp-Source: AGHT+IH1Gu9GLKfGiYTCOjMoGySHlcEjW+ds+b1IrKT29iIUpO61X0NEHkvZCaXOOFQOQ3oqS5p4trwyczY=
X-Received: from pfbkm27.prod.google.com ([2002:a05:6a00:3c5b:b0:736:47b8:9b88])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1309:b0:736:5c8e:bab8
 with SMTP id d2e1a72fcca58-73e245ba24bmr4220090b3a.3.1745504018497; Thu, 24
 Apr 2025 07:13:38 -0700 (PDT)
Date: Thu, 24 Apr 2025 07:13:36 -0700
In-Reply-To: <1fa0f7f8-be88-4617-a0b2-57d4204c6d6f@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com> <20250404193923.1413163-34-seanjc@google.com>
 <1fa0f7f8-be88-4617-a0b2-57d4204c6d6f@amd.com>
Message-ID: <aApHEK4R4tAYi5Q0@google.com>
Subject: Re: [PATCH 33/67] KVM: x86: Dedup AVIC vs. PI code for identifying
 target vCPU
From: Sean Christopherson <seanjc@google.com>
To: Sairaj Kodilkar <sarunkod@amd.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, kvm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Apr 24, 2025, Sairaj Kodilkar wrote:
> On 4/5/2025 1:08 AM, Sean Christopherson wrote:
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index b8b259847d05..0ab818bba743 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -13567,6 +13567,43 @@ bool kvm_arch_has_irq_bypass(void)
> >   }
> >   EXPORT_SYMBOL_GPL(kvm_arch_has_irq_bypass);
> > +static int kvm_pi_update_irte(struct kvm_kernel_irqfd *irqfd,
> > +			      struct kvm_kernel_irq_routing_entry *old,
> 
> the argument 'old' is redundant in this function.

Ooh, and @new to kvm_x86_ops.pi_update_irte is also unused.  I'll get rid of them
both.  I went through multiple iterations of hacking to figure out how to dedup
the code, and (obviously) missed a few things when tidying up after the fact.

Good eyes, and thanks again for the reviews!

P.S. Please trim your replies.
