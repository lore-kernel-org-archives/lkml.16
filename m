Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88448249F
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661827; cv=none; b=HoP7R39YaoAZLZTu8qe8xBg0j5SpbbiEVLEgZWpA5zVVQTfiEgduZVHZthcsgsq65vGLDX4oCZA8c6M5hG+1jg4pbsHm3A2O/FCLJXVo+s+/pW6QjrmRcTpQkgF/Mku7/1muW5omTyE6b5YTmDlfKauMUdI8VZJg4BrwW1cjvTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661827; c=relaxed/simple;
	bh=Ih+Sy8cNdeXWqKE/CD+IDJzasQTcEDVwvNhOjlF4Odg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=POxU/mvyTim/MIWjCRDIZsDBjf3IQWXO0oeTHC2KXqUwnaJFNevpJ4skofCX+VPK3xly4Csu2PVet+/4G49ur1nnQ1f7TcqCg0xNe8/hUI39m6j58jTxABlGUFWRxYphSgNxOKr5Eui+NIaSan/9CaDB6RKAJwBVfKagrEVGQxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aPwU1EH/; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aPwU1EH/"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7394792f83cso3340919b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 06:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747661825; x=1748266625; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5wDnxumtqGt9ogcrPZCsFOhMaoLEW4JK23LDoIRw8Y=;
        b=aPwU1EH/rX2BCpBPWwUYhOZV5u6II5heieY0t2CKvcEssn5b0kW+ypo8NQtlmNh6U1
         52xc2v+5+dFip3+p7sAx/lVi+MYZAiMnnjiAQisUlWaiHcXPKTWN7xj2SUieI/GCBFaA
         +j/4zryUBdLBNRz727ESseJpGdq2gJhAxTQaw/WnAZbEajXX+KYmLKem9OuiT36/hH3z
         y8IQXsAuBjK9TGG2p8tzcXnnrURwgFP1yIdPKIY5J9G0KuKWZvXx33sG4nxQ2SnpnPua
         aloinTuizoR6m/N3Av9TImuwn8azvs2Q9XwWdK2BpIgFVjbL95bJsHwIvYgtQPP75fxx
         lkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747661825; x=1748266625;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5wDnxumtqGt9ogcrPZCsFOhMaoLEW4JK23LDoIRw8Y=;
        b=h8GVwxrB6PDn658dwsRJOuT4Ly9f0ehL9x6Kh/exdBa52Z5RUkCKnk2rOjCOIaqHZo
         PHlktEex7UNli5JhDyQ8Rcvj10NxqN/iUSs+m+FuqNW3RZM31VQMM0Smg5FzTROqN/8D
         AykH/imzOGNSivKWbb5dtzRcbEWt34OIG8+aYPkP24gMMLe0nsEs4m1nS1vjOaT2BaEt
         H+5SD2jdxIGS90BmuWxz2qCtVjBrB9OtGOHd0NQrhMOoq5OYifvLFKTcnAzSf48Ch4eY
         +XVTCm2o+Ybr3UNXMD0NftnKxerOWYc1N1k8pJvYMQtqgPFuiai69+DOH4KW0lynkKmZ
         Y4vw==
X-Forwarded-Encrypted: i=1; AJvYcCWmFyvTqYm3YD6H3SXFvvErdJXKRKqdCiGDH7vrTYFdnh4uckd06XjeZh4txGUO94L7478AdX8UY7zwbwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8NcUugqdm23U9fwAu05tf4/+Oyxl+qSNd6890F2v8b5aFRSiA
	IOSLk2pxkBOACMz8+mRguHAOneHwz8/fxy/MrJebogpkWVhqE/SM8XKEGgF7F4UGcci9fkycwKB
	Z32lP5g==
X-Google-Smtp-Source: AGHT+IFkfPln23KvT4glfT5BuNhpKGvErMRlKjKsTK6NbsVcGBP6SXTTJxLb01yJQtxzHiBpgRkN93bupBc=
X-Received: from pfbfn14.prod.google.com ([2002:a05:6a00:2fce:b0:732:547c:d674])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b84:b0:730:9801:d3e2
 with SMTP id d2e1a72fcca58-742a97a2752mr21118458b3a.8.1747661825070; Mon, 19
 May 2025 06:37:05 -0700 (PDT)
Date: Mon, 19 May 2025 06:37:03 -0700
In-Reply-To: <fb0580d9-103f-4aa1-94ae-c67938460d71@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516215422.2550669-1-seanjc@google.com> <20250516215422.2550669-4-seanjc@google.com>
 <fb0580d9-103f-4aa1-94ae-c67938460d71@redhat.com>
Message-ID: <aCsz_wF7g1gku3GU@google.com>
Subject: Re: [PATCH v3 3/3] KVM: x86/mmu: Defer allocation of shadow MMU's
 hashed page list
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="us-ascii"

On Sat, May 17, 2025, Paolo Bonzini wrote:
> On 5/16/25 23:54, Sean Christopherson wrote:
> > +	/*
> > +	 * Write mmu_page_hash exactly once as there may be concurrent readers,
> > +	 * e.g. to check for shadowed PTEs in mmu_try_to_unsync_pages().  Note,
> > +	 * mmu_lock must be held for write to add (or remove) shadow pages, and
> > +	 * so readers are guaranteed to see an empty list for their current
> > +	 * mmu_lock critical section.
> > +	 */
> > +	WRITE_ONCE(kvm->arch.mmu_page_hash, h);
> 
> Use smp_store_release here (unlike READ_ONCE(), it's technically incorrect
> to use WRITE_ONCE() here!),

Can you elaborate why?  Due to my x86-centric life, my memory ordering knowledge
is woefully inadequate.

> with a remark that it pairs with kvm_get_mmu_page_hash().  That's both more
> accurate and leads to a better comment than "write exactly once".
