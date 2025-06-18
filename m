Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D25274672
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750281467; cv=none; b=TkGBOxxXIFGGWDIBMzrciwbwtwBn+D2NwMb3QTEumZNRAl7MWjFippzJjZCBWQNpFQ9cxyEr2OpkxN7+ipIApXrMNsDrMYYQpw6MXhZ4B4i7gTUfqfN8rPLrWMxj9D52XKrE2NJT4RgbYwJDQwKY9hY6HaWZgQj6TPDIGqOGYmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750281467; c=relaxed/simple;
	bh=CMs2h4kbVtiV15SKFeOJCR6/uSQFgcHkomdTrmd6ICM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XwAqXg15oM19wtsT3Y180OKpF4EoZb6yuc3e9qJLnl2k2CD+TVCK2t6jk9uGTT8FZmO9g9gwa5cGaX337og9x6zrjGG/05As8b4Fskf7IDm0nCjX3QZPshZ4QuMNADobiVwx9J3Et/r6yplKMWJj8b+lFpwoyYLqcIZBV/1welM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FmlWRqHQ; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FmlWRqHQ"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7394772635dso66647b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750281465; x=1750886265; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SDeX7q/l2+xg1imuGAxKGeggwWOnK+wgg5Zm+bSeJk0=;
        b=FmlWRqHQXaKSWosrOxrkfXMLMZf0nfBTbax4oS+1dFJqz6txfxDPA9eTkML5FilCa7
         BmdshjclBUyrVxpKspVrHLRUkB4dhC+5FQrhxkoecPdbfzM2SN/dEPdI8qQS4GXzbrjc
         calWORmoLLnRaM7oTSEBnlwRaDm35nzwYue9DgdjFq/hK7UHElUcLhHriGmcWoAGMfob
         B4v7XcF/EO/RBeNEEtnbf+riDWvj0xbLMmnVtL8FGS5KuyaQT1gP6j/UekkYULwx8vgK
         P3hzDYdRaasYRZpmQOOIMWafcoSApNbaeRQUKE5a9mRZXpBdbaV7pd8tptYT1XMHPyBp
         CfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750281465; x=1750886265;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SDeX7q/l2+xg1imuGAxKGeggwWOnK+wgg5Zm+bSeJk0=;
        b=cZ8THNLhTDzotV7P1pV1p7YuVrSiu8lEEHz01UP0uBhMWmKHJQQjbxImb7NDK0U9FI
         pbVY8jztiPTAMnIkpp22oNnM4Gg7u5yjkK7RIEVMhDce4+xyFtDi0py2dzwfyB6F3wDR
         DWOh8f73HGVc7mEL0edCx8C234jKpdf5gNA90MKcdxBHHLuWK8qKYBDe+gvhvUR6GlG8
         z7KqkrEyuSpAWOLfzt88D60yWkfj5gW48KTf1LI+ItyWihhd5RosdCfxvEqO5wv1minH
         9NQjTMfkVLP6tDhSILaNsunY4ARVX9Xh4VieTRq5rKizjvu9HgjDD7XFllSkWucugMEV
         IfaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNz4byX9w1LuWD9Hnhqv5zisNd1YwklSyVZdFZAPGAAKhVBk7B0cnT0HqS4dx18934Ur37b5qaU3ebdW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxHI7sEQQrV/Iq983aZtLvkxck1Z+8nHu/JyxUFNSQZs52C8e9
	rymFIcBsY2dPPP9MohXdNP40SvPpl7WawATD8gTR0DBoYSp5lonprRgEXXDUtCPb4EJuuI69Bwi
	qV7PvHQ==
X-Google-Smtp-Source: AGHT+IFrMBaSJPDppRsJZ5jvlklOZU4VQzs3tJ3F6qMENhjmoLLRaWLyHwVi7GAyrqStyqYxXS8ZDE6slDQ=
X-Received: from pfbef26.prod.google.com ([2002:a05:6a00:2c9a:b0:747:aac7:7c2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3399:b0:21a:e091:ac25
 with SMTP id adf61e73a8af0-21fbd505f24mr32186546637.6.1750281465010; Wed, 18
 Jun 2025 14:17:45 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:17:43 -0700
In-Reply-To: <aFMS4O2TkWN8nexY@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
 <20250618042424.330664-3-jthoughton@google.com> <aFMS4O2TkWN8nexY@linux.dev>
Message-ID: <aFMs9_GBVsiRmgz7@google.com>
Subject: Re: [PATCH v3 02/15] KVM: arm64: Add "struct kvm_page_fault" to
 gather common fault variables
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: James Houghton <jthoughton@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 18, 2025, Oliver Upton wrote:
> On Wed, Jun 18, 2025 at 04:24:11AM +0000, James Houghton wrote:
> > From: Sean Christopherson <seanjc@google.com>
> > 
> > Introduce "struct kvm_page_fault" and use it in user_mem_abort() in lieu
> > of a collection of local variables.  Providing "struct kvm_page_fault"
> > will allow common KVM to provide APIs to take in said structure, e.g. when
> > preparing memory fault exits.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_host.h |  9 +++++++++
> >  arch/arm64/kvm/mmu.c              | 32 +++++++++++++++++--------------
> >  2 files changed, 27 insertions(+), 14 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index 6ce2c51734820..ae83d95d11b74 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -413,6 +413,15 @@ struct kvm_vcpu_fault_info {
> >  	u64 disr_el1;		/* Deferred [SError] Status Register */
> >  };
> >  
> > +struct kvm_page_fault {
> > +	const bool exec;
> > +	const bool write;
> > +	const bool is_private;
> > +
> > +	gfn_t gfn;
> > +	struct kvm_memory_slot *slot;
> > +};
> > +
> 
> So this seems to cherry-pick "interesting" values into the structure but

s/interesting/necessary.  I literally grabbed only the fields that were needed
to handle the userfault :-)

> leaves the rest of the abort context scattered about in locals. If we're
> going to do something like this I'd rather have a wholesale refactoring
> than just the bits to intersect with x86 (more on that later...)

Definitely no objection from me.  How about I send a standalone patch so that we
can iterate on just that without James having to respin the entire series (for
changes that have no meaningful impact)?  I'm anticipating we'll need a few rounds
to strike the right balance between what was done here and "throw everything into
kvm_page_fault".  E.g. we probably don't want "vma" in kvm_page_fault.

Hmm, yeah, and I suspect/hope that moving more things into kvm_page_fault will
allow for encapsulating the mmap_read_lock() section in a helper without having
a bajillion boolean flags being passed around.  That would obviate the need to
nullify vma, because it would simply go out of scope.
