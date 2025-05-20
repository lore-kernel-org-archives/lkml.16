Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5822128C5C0
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747773393; cv=none; b=jDG+ZsDCFMYxI/hyqyendalveYau1zFCcPdhKVi5F4nfj9ScoAAW2x0elCf0X+jCqrjERKLPfshw9qyF/ONT4+5mEzn9/uV9Jerj6eOIwF0gynK/OnFJkZvXM8i/+Y2q3YOk2tnkYAbpkG61eT/npzaKTfeG2wlsQQjydesA1rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747773393; c=relaxed/simple;
	bh=ZKfsnzKjHWRvUGjeYrgiENx6pawfGlJOEUf65hQxSqs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Vrf+mtznQVTyherxJ2QbT4KPdSXm1Y2QYePyrrlOyGAwF0iGh8YQjn9CVGKnAv/RUI6vzejGu4rzygw+f0NupoxNAXAyOZ+7So3gzItTO3UspJFLoIrbZFormv43nR/vk6hTQ9iy/BdXLuO2agbQc+39eG2LOm8537hKcA0Ns00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eJ0BMXIo; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eJ0BMXIo"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2371b50cabso6298008a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747773390; x=1748378190; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NikUqd8YUJYJZVQ9NNWuumuHYhTthKmVTkOJEDEId4g=;
        b=eJ0BMXIoRkkjyt9enk90GhZdOAd60XB7FknBFhErmP28/fKyBCrdsP3V0HvRDZL+6P
         W+eYep8StJ51XP6xLNekeht8MSkDqd3L4z0SEzHqgddIkAgQiR0kRgt+ERRbVsHfTH+R
         KfhCWrhEuTygkJ+LmC/q+pPby/jxNs1PRd6cDbNjJEcettnNb7CmrxbJODi9p9XBK8lZ
         aXWcBKRoaz32gQm4MCIS3jjZWMhI66Sj/ItL2/xG3ErUDyRhF/OE8Ih79R4njhgnmYKG
         M2e6V3xKVXUMMOPnFiBLLuEQ4/uEsMM1+JIMSqBxwjx0RZrwXb7u6J9Nf79A91OJuGwU
         uQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747773390; x=1748378190;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NikUqd8YUJYJZVQ9NNWuumuHYhTthKmVTkOJEDEId4g=;
        b=Dqjaqz1QC3+JKpWvbyfT5BtoV833LBzoRncTsuAvsII2dzDp8OLqhQtp9FnlT4N4k4
         r+fS2BhsurjkQ5eYb3W1II8yO4I4u1+BUUMDRFoc5TiU1JyLabTbmqp9uDGybd9G7cOt
         w1qKGYTSSUxrzxQNp6hCjEqAq9zyUPouyvUaop1Kf+ZdvYM5ixE+zbDu/mXy5rnUOi7P
         hLNYtf2iqN3jnfI+ldT2CfEu9EEKmx6zID0XYS5zYpSiTMug6jFCajXHGDbx6KDfHP1S
         tRbK8OMZEz4o6V9Xdjf79Lm/5Lsz9aQ63EE/NFLAqy2Ixzsj9LXwMEJ9sbdFy//WjlTt
         aPNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuUPBhvDn1j1gAfZmo4dKUSwz0+TqPdCY3oPz4klRl9La/iJu9DIEZfU0yy4eLIyCQx9RcJWHGHbNKT2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqKPGR+AJ8IlKoXaI1LNyR/yvc7ZMNd0+A92Ht6rlpjdMDIlbH
	deqrszz8ymxfXuYYLBrjurm27dHe9Mztyy3Yr0gRg4FPcpoV42J5ErXd2l1+ZV4Q1jLGFjWGPa3
	l372DOA==
X-Google-Smtp-Source: AGHT+IHP6rysVOKSkISEgr29agj9TpppemjJvlT6UOUwgsn7uAspuzrIU/dBu0EIRPFTBgRjNvR+rZRe+h0=
X-Received: from pjbph15.prod.google.com ([2002:a17:90b:3bcf:b0:2f9:dc36:b11])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d44:b0:30e:7d09:2a7
 with SMTP id 98e67ed59e1d1-30e83107ed7mr28064460a91.14.1747773390587; Tue, 20
 May 2025 13:36:30 -0700 (PDT)
Date: Tue, 20 May 2025 13:36:29 -0700
In-Reply-To: <d270ff32-7763-40d5-a4dc-3970383571dc@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com> <20250404193923.1413163-31-seanjc@google.com>
 <d270ff32-7763-40d5-a4dc-3970383571dc@redhat.com>
Message-ID: <aCznzZ-SN4Pf_htE@google.com>
Subject: Re: [PATCH 30/67] KVM: VMX: Stop walking list of routing table
 entries when updating IRTE
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, kvm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Maxim Levitsky <mlevitsk@redhat.com>, 
	Joao Martins <joao.m.martins@oracle.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 08, 2025, Paolo Bonzini wrote:
> On 4/4/25 21:38, Sean Christopherson wrote:
> > Now that KVM provides the to-be-updated routing entry, stop walking the
> > routing table to find that entry.  KVM, via setup_routing_entry() and
> > sanity checked by kvm_get_msi_route(), disallows having a GSI configured
> > to trigger multiple MSIs, i.e. the for-loop can only process one entry.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >   arch/x86/kvm/vmx/posted_intr.c | 100 +++++++++++----------------------
> >   1 file changed, 33 insertions(+), 67 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
> > index 00818ca30ee0..786912cee3f8 100644
> > --- a/arch/x86/kvm/vmx/posted_intr.c
> > +++ b/arch/x86/kvm/vmx/posted_intr.c
> > @@ -268,78 +268,44 @@ int vmx_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
> >   		       unsigned int host_irq, uint32_t guest_irq,
> >   		       struct kvm_kernel_irq_routing_entry *new)
> >   {
> > -	struct kvm_kernel_irq_routing_entry *e;
> > -	struct kvm_irq_routing_table *irq_rt;
> > -	bool enable_remapped_mode = true;
> >   	struct kvm_lapic_irq irq;
> >   	struct kvm_vcpu *vcpu;
> >   	struct vcpu_data vcpu_info;
> > -	bool set = !!new;
> > -	int idx, ret = 0;
> >   	if (!vmx_can_use_vtd_pi(kvm))
> >   		return 0;
> > -	idx = srcu_read_lock(&kvm->irq_srcu);
> > -	irq_rt = srcu_dereference(kvm->irq_routing, &kvm->irq_srcu);
> > -	if (guest_irq >= irq_rt->nr_rt_entries ||
> > -	    hlist_empty(&irq_rt->map[guest_irq])) {
> > -		pr_warn_once("no route for guest_irq %u/%u (broken user space?)\n",
> > -			     guest_irq, irq_rt->nr_rt_entries);
> > -		goto out;
> > -	}
> > -
> > -	hlist_for_each_entry(e, &irq_rt->map[guest_irq], link) {
> > -		if (e->type != KVM_IRQ_ROUTING_MSI)
> > -			continue;
> > -
> > -		WARN_ON_ONCE(new && memcmp(e, new, sizeof(*new)));
> 
> Alternatively, if you want to keep patches 28/29 separate, you could add
> this WARN_ON_ONCE to avic.c in the exact same place after checking e->type
> -- not so much for asserting purposes, but more to document what's going on
> for the reviewer.

FWIW, AVIC already has the same WARN, they were both added by "KVM: x86: Pass new
routing entries and irqfd when updating IRTEs".

That said, I agree that squashing 28/29 is the way to go, especially since I didn't
isolate the changes for VMX (I've no idea why I did for SVM but not VMX).
