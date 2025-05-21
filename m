Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5451D63DF
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841060; cv=none; b=sl64SEJ0VSkhanqzbD+jRG7AWFCd2bSmUcymTmZzq93QfKOdCqSYl3HJsSdlFURJpHwg8ML+ri25C6RqsSLmE/rh4FHKBuqqkV4ulijqFcT1oLvCa4eoSlNFYs2P8tgojB26pvpW03RJ+OG75e99WTuUBQYmgM7YrwF7NCPAY88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841060; c=relaxed/simple;
	bh=7CodgDFGCpMBU+/Bg+diyCYhpTJXE+AvR7xj10i+qZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pe8U5BLT9LlpnLS4wGeyfPlu++AxOBiLdlVCAClOKQLK4EkWaZ5cUCIHOTOQL2d2uYp6xpaB0rUNNAIAGdbt32Rq6O+fOmmTW11hpSkwqqggzPGdRkO7vNZgtS1ZJvr9h8i+drMqTOkKxD2A2MxjF4UAGIa+YLI0vnLKOBy4cTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZNOKInCW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZNOKInCW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747841054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8vqJcgtD0m0cV+LRe+RWGRd1MfJDepFj2iZqcJ0qHUQ=;
	b=ZNOKInCWgaQG6dSpSHD32KBjDAD2zgRv2fbDaYrtt+NvNzlBPx6xJ95Z8t6RAlcuLdFH0r
	9jN/IV54VaqG0RC4ySn5S0w0oZFAEUttXmExyiEmPdh0vmaQRwMJgfE7j/SrlUGY17qKLz
	25m6P9rrCmQifHhBMKi2nRdM+XUqQT4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-_L4lvll5N8mpu3hlAA56Gw-1; Wed, 21 May 2025 11:24:12 -0400
X-MC-Unique: _L4lvll5N8mpu3hlAA56Gw-1
X-Mimecast-MFC-AGG-ID: _L4lvll5N8mpu3hlAA56Gw_1747841051
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c955be751aso1248077785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747841051; x=1748445851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vqJcgtD0m0cV+LRe+RWGRd1MfJDepFj2iZqcJ0qHUQ=;
        b=lvxGNj7SG2s66gUrBvA2PkBIJwiQ+Lx3QNjI/yQheZvf87zUD97kth3+TPGADPnEN7
         m84EnYgu+mvh79mifBmA7RExHtWltFYvhC43XPH23gNiCs+qtjR65nPDlXquvglqyOTY
         lfosbeWL9OUXK28zwQRi7Ohl3lD0+wxTOnuevUOxreVCz3Bm3RvYxu/q7Kg+JhcYqLXd
         o+MJ2Yi3YlQJrcvYH12FOaFoOGBjM07SB2OJjQ5yfZg6pkAdxHo/xmwhWbCoq/qXCOuf
         Ewu/c5TDdC2aZmfOl3otzdogHmPyUAoL8Jpz48K49ZN4ub79wljBuFG7Gnp6fguSKFyh
         q8bw==
X-Forwarded-Encrypted: i=1; AJvYcCWuYtpGHolYuXPP6N2P692NU8JoO6em/sPq6bJx95aki2bH/sKkow0NYNZCdcxQm700DDgk1ZRrcQ6dZH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLnr5gL36srjy8Raq+cfNHbHLUucbRAIYzWgfbkYv+PxgMPEcl
	Xb7UuaUOXb7lmgDPf/p3OAm3co86qJ1aBmIZfsFQbQEWIROS3oHDDq8AcH7MMTJEriyMdLqKG2n
	uZUt03AuK/0AwGbTub0qcxgQS3OP8Oh1hDBACuwn5fhWsflXsRAtEuugGTrtVhBiiXw==
X-Gm-Gg: ASbGnctt/hyRzMuZk02NbrN60wnU5uddo0gApEDPqFoQk0o4bz/UMExCKXwn9j5oro4
	3bzMfgIEAYiGNuZuXWOgFKHiiGE3v43TFwKQOnbfhsf0AgXn1+pSX+6vBJaXmJgpalTydishulx
	wPjAsIsKYwFVyQERBnsoOuqRucmsVrVykMbUFPLzxo4T+eY2KaIUtTb3VvCJ/j2wnZK5Ch5QX/O
	81Prx5R3DBYreSuLCgKsf0GKSa7+tX9Q90dTH7S98dxb0SiF6PLAba1hoYsimdLfgfeHQbzeXOe
	Emk=
X-Received: by 2002:a05:620a:2994:b0:7c5:3c0a:ab7e with SMTP id af79cd13be357-7cd46707c65mr2827172585a.5.1747841051363;
        Wed, 21 May 2025 08:24:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpKCsLZK8fldjDSKpxmr3xZ4LVd50UA3aAZSvoaTqmv4NchFdKg38lljbXixaCEhED3occeQ==
X-Received: by 2002:a05:620a:2994:b0:7c5:3c0a:ab7e with SMTP id af79cd13be357-7cd46707c65mr2827169685a.5.1747841050957;
        Wed, 21 May 2025 08:24:10 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468cc782sm886213785a.101.2025.05.21.08.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 08:24:10 -0700 (PDT)
Date: Wed, 21 May 2025 11:24:07 -0400
From: Peter Xu <peterx@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Yan Zhao <yan.y.zhao@intel.com>,
	Maxim Levitsky <mlevitsk@redhat.com>,
	Binbin Wu <binbin.wu@linux.intel.com>,
	James Houghton <jthoughton@google.com>,
	Pankaj Gupta <pankaj.gupta@amd.com>
Subject: Re: [PATCH v3 0/6]  KVM: Dirty ring fixes and cleanups
Message-ID: <aC3wFwFwFbLlsIft@x1.local>
References: <20250516213540.2546077-1-seanjc@google.com>
 <aCzUIsn1ZF2lEOJ-@x1.local>
 <aC0NMJIeqlgvq0yL@google.com>
 <aC0VlENyfE9ewuTF@x1.local>
 <aC3oIjkivS2KqKZH@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aC3oIjkivS2KqKZH@google.com>

On Wed, May 21, 2025 at 07:50:10AM -0700, Sean Christopherson wrote:
> On Tue, May 20, 2025, Peter Xu wrote:
> > On Tue, May 20, 2025 at 04:16:00PM -0700, Sean Christopherson wrote:
> > > On Tue, May 20, 2025, Peter Xu wrote:
> > > > On Fri, May 16, 2025 at 02:35:34PM -0700, Sean Christopherson wrote:
> > > > > Sean Christopherson (6):
> > > > >   KVM: Bound the number of dirty ring entries in a single reset at
> > > > >     INT_MAX
> > > > >   KVM: Bail from the dirty ring reset flow if a signal is pending
> > > > >   KVM: Conditionally reschedule when resetting the dirty ring
> > > > >   KVM: Check for empty mask of harvested dirty ring entries in caller
> > > > >   KVM: Use mask of harvested dirty ring entries to coalesce dirty ring
> > > > >     resets
> > > > >   KVM: Assert that slots_lock is held when resetting per-vCPU dirty
> > > > >     rings
> > > > 
> > > > For the last one, I'd think it's majorly because of the memslot accesses
> > > > (or CONFIG_LOCKDEP=y should yell already on resets?).  
> > > 
> > > No?  If KVM only needed to ensure stable memslot accesses, then SRCU would suffice.
> > > It sounds like holding slots_lock may have been a somewhat unintentional,  but the
> > > reason KVM can't switch to SRCU is that doing so would break ordering, not because
> > > slots_lock is needed to protect the memslot accesses.
> > 
> > Hmm.. isn't what you said exactly means a "yes"? :)
> > 
> > I mean, I would still expect lockdep to report this ioctl if without the
> > slots_lock, please correct me if it's not the case.
> 
> Yes, one of slots_lock or SRCU needs to be held.
> 
> > And if using RCU is not trivial (or not necessary either), so far the
> > slots_lock is still required to make sure the memslot accesses are legal?
> 
> I don't follow this part.  The intent of the comment is to document why slots_lock
> is required, which is exceptional because memslot access for readers are protected
> by kvm->srcu.

I always think it's fine to take slots_lock for readers too.  RCU can
definitely be better in most cases..

> The fact that slots_lock also protects memslots is notable only
> because it makes acquiring kvm->srcu superfluous.  But grabbing kvm->srcu is still
> safe/legal/ok:
> 
> diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
> index 1ba02a06378c..6bf4f9e2f291 100644
> --- a/virt/kvm/dirty_ring.c
> +++ b/virt/kvm/dirty_ring.c
> @@ -121,18 +121,26 @@ int kvm_dirty_ring_reset(struct kvm *kvm, struct kvm_dirty_ring *ring,
>         u64 cur_offset, next_offset;
>         unsigned long mask = 0;
>         struct kvm_dirty_gfn *entry;
> +       int idx;
>  
>         /*
>          * Ensure concurrent calls to KVM_RESET_DIRTY_RINGS are serialized,
>          * e.g. so that KVM fully resets all entries processed by a given call
> -        * before returning to userspace.  Holding slots_lock also protects
> -        * the various memslot accesses.
> +        * before returning to userspace.
>          */
>         lockdep_assert_held(&kvm->slots_lock);
>  
> +       /*
> +        * Holding slots_lock also protects the various memslot accesses, but
> +        * acquiring kvm->srcu for read here is still safe, just unnecessary.
> +        */
> +       idx = srcu_read_lock(&kvm->srcu);
> +
>         while (likely((*nr_entries_reset) < INT_MAX)) {
> -               if (signal_pending(current))
> +               if (signal_pending(current)) {
> +                       srcu_read_unlock(&kvm->srcu, idx);
>                         return -EINTR;
> +               }
>  
>                 entry = &ring->dirty_gfns[ring->reset_index & (ring->size - 1)];
>  
> @@ -205,6 +213,8 @@ int kvm_dirty_ring_reset(struct kvm *kvm, struct kvm_dirty_ring *ring,
>         if (mask)
>                 kvm_reset_dirty_gfn(kvm, cur_slot, cur_offset, mask);
>  
> +       srcu_read_unlock(&kvm->srcu, idx);
> +
>         /*
>          * The request KVM_REQ_DIRTY_RING_SOFT_FULL will be cleared
>          * by the VCPU thread next time when it enters the guest.
> --
> 
> And unless there are other behaviors that are protected by slots_lock (which is
> entirely possible), serializing the processing of each ring could be done via a

Yes, I am not the original author, but when I was working on it I don't
remember anything relying on that.  However still it's possible it can
serialize some operations under the hood (which will be true side effect of
using this lock..).

> dedicated (for example only, the dedicated mutex could/should be per-vCPU, not
> global).
> 
> This diff in particular shows why I ordered and phrased the comment the way I
> did.  The blurb about protecting memslot accesses is purely a friendly reminder
> to readers.  The sole reason for an assert and comment is to call out the need
> for ordering.
> 
> diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
> index 1ba02a06378c..92ac82b535fe 100644
> --- a/virt/kvm/dirty_ring.c
> +++ b/virt/kvm/dirty_ring.c
> @@ -102,6 +102,8 @@ static inline bool kvm_dirty_gfn_harvested(struct kvm_dirty_gfn *gfn)
>         return smp_load_acquire(&gfn->flags) & KVM_DIRTY_GFN_F_RESET;
>  }
>  
> +static DEFINE_MUTEX(per_ring_lock);
> +
>  int kvm_dirty_ring_reset(struct kvm *kvm, struct kvm_dirty_ring *ring,
>                          int *nr_entries_reset)
>  {
> @@ -121,18 +123,22 @@ int kvm_dirty_ring_reset(struct kvm *kvm, struct kvm_dirty_ring *ring,
>         u64 cur_offset, next_offset;
>         unsigned long mask = 0;
>         struct kvm_dirty_gfn *entry;
> +       int idx;
>  
>         /*
>          * Ensure concurrent calls to KVM_RESET_DIRTY_RINGS are serialized,
>          * e.g. so that KVM fully resets all entries processed by a given call
> -        * before returning to userspace.  Holding slots_lock also protects
> -        * the various memslot accesses.
> +        * before returning to userspace.
>          */
> -       lockdep_assert_held(&kvm->slots_lock);
> +       guard(mutex)(&per_ring_lock);
> +
> +       idx = srcu_read_lock(&kvm->srcu);
>  
>         while (likely((*nr_entries_reset) < INT_MAX)) {
> -               if (signal_pending(current))
> +               if (signal_pending(current)) {
> +                       srcu_read_unlock(&kvm->srcu, idx);
>                         return -EINTR;
> +               }
>  
>                 entry = &ring->dirty_gfns[ring->reset_index & (ring->size - 1)];
>  
> @@ -205,6 +211,8 @@ int kvm_dirty_ring_reset(struct kvm *kvm, struct kvm_dirty_ring *ring,
>         if (mask)
>                 kvm_reset_dirty_gfn(kvm, cur_slot, cur_offset, mask);
>  
> +       srcu_read_unlock(&kvm->srcu, idx);
> +
>         /*
>          * The request KVM_REQ_DIRTY_RING_SOFT_FULL will be cleared
>          * by the VCPU thread next time when it enters the guest.
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 571688507204..45729a6f6451 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -4908,16 +4908,12 @@ static int kvm_vm_ioctl_reset_dirty_pages(struct kvm *kvm)
>         if (!kvm->dirty_ring_size)
>                 return -EINVAL;
>  
> -       mutex_lock(&kvm->slots_lock);
> -
>         kvm_for_each_vcpu(i, vcpu, kvm) {
>                 r = kvm_dirty_ring_reset(vcpu->kvm, &vcpu->dirty_ring, &cleared);
>                 if (r)
>                         break;
>         }
>  
> -       mutex_unlock(&kvm->slots_lock);
> -
>         if (cleared)
>                 kvm_flush_remote_tlbs(kvm);
> --
> 

I think we almost agree on each other, and I don't see anything
controversial.

It's just that for this path using srcu may have slight risk of breaking
what used to be serialized as you said.  Said that, I'd be surprised if
so.. even if aarch64 is normally even trickier and it now also supports the
rings.  So it's just that it seems unnecessary yet to switch to srcu,
because we don't expect any concurrent writters anyway.

So totally no strong opinion on how the comment should be laid out in the
last patch - please feel free to ignore my request.  But I hope I stated
the fact, that in the current code base the slots_lock is required to
access memslots safely when rcu isn't around..

Thanks,

-- 
Peter Xu

