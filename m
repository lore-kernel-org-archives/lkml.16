Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D08146593
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 19:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746559372; cv=none; b=AaeF9yGpbl4OwOohhLaiX+uPDWOBz+s/V+uVrh7zQciMvWk8tj62aVXCTW3JHPi2Wj9tr8I2uxA5KMQJ1dmaIir2FR4WeAZ20Nlb39jEUooL+MU1gR4ppsUKwWhHTt4P8Ve3kiLSg9TiGzR/zOj4zQ2VyPRWAZXODH6OnZhBj3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746559372; c=relaxed/simple;
	bh=adViIxT4K+8OILyTBF/w5gsHiQUH4RC4i3QZNQkAnEE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cRzE6z3ZCg5vheNMDNzOm1lAa/23X83xMdA10/it4BkRtRODg4996nHPBTtJ/JtusD39nXK8IVBi8ccK1sXad7IWzFrfJ+yegpO52lcDg32+8u2TkI5kerm0AcO8OF3LP+JOizUGhqLi9lDnN3WcQTl7Vu0NO/TVRKGyzaX8lGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uUaswSTJ; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uUaswSTJ"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-73917303082so3969551b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 12:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746559369; x=1747164169; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YdVfAUAmDEBQ8JFX7fJFifwcWORGf91hOm42i7pODPI=;
        b=uUaswSTJjmb1FQo3fau9BMJ+wOuLnRKen5mr6LtEv4UH1TYO5KySFZgUoF6vYRC7Ho
         5SCmkOFM18Jqv6a8Eo4CqE671a9RU15WqQBqHN18jMnk+s7s8qK1b1yu6VSxAahL73OA
         nyBaiXXapSnK2j/P3XUJ12c1Ulz1WIXS3RScjfCAbpmMC02pjR4RRCMvoAmHjn3V1JQB
         3FhQ9fWzJjons3hGUFGYIxPQPUIOCi26kAWUyPq7ByhGXanFNBRAKUkRyVnwow5Z4mCs
         ZB7ugRkPCtqOnWrFZOVLfQUuAy86fEvg8cLTz3QGNSGL5lmaRJqnRh8rI57mHWObise9
         9GsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746559369; x=1747164169;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YdVfAUAmDEBQ8JFX7fJFifwcWORGf91hOm42i7pODPI=;
        b=ZIUcomp6PZjyueB+75QxiOoi+abUmUd2eWkiZodbC2PGG8G3gA/b3MZvl7mkbSXqPD
         Rvj6vJSN/8G8RM2NW8tam7mz0syKZljEirPYtjUpX0yIC29hD93CW2AuUY0JuRJ8k6U9
         xUvY+0P6xGsAwfXZuVpT44sIbCMlRAgHI+o2tJ2o3PGlFO4LNhJNh+JvH4mDVSpc09y2
         Zr7j22PKDjOGSfejacmqek4xSof/M2KoKmOd/0ZDlwTwR9Jxt5v0RCjPwGoJOaJCDUzj
         VPwRczB2NYkTm2brKmnHWYICn9DW1i2i2Rg/GfDfhYNLMRprXEweDH18EUgjR3EH3YPa
         cHQA==
X-Forwarded-Encrypted: i=1; AJvYcCV4EKo0mapGi1jbL6P40dhw+/yHaOI+N8GCl8i4gvEAeuaXPdlcYCrVMU06qLBtlNJv+EmpeS4gJ943Xoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhFThdOSgCU0fBE5YXEJDeHGna+JqzU4E5dkS5PKjpGm9h+JXR
	CoKtayQDcJshzjY8wTrY6UcZmTjUeVxoqU0cMGsPwPPJLJVMtfLO0qwnYJipBW3JMZqWoh+x7Fo
	h3krP/Lyu+bqrs6+mKsDS6g==
X-Google-Smtp-Source: AGHT+IF6xVKxxuyEiNYi+0vPcETYSLwUkqiD4tqqqh48d1N2zs7IMgRp17ja4z+L+OzOmL3DebRn7uSN+uZhGnUzFw==
X-Received: from pfcg7.prod.google.com ([2002:a05:6a00:23c7:b0:730:8e17:ed13])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:ab05:b0:730:9946:5973 with SMTP id d2e1a72fcca58-7409cf1e873mr452083b3a.5.1746559369363;
 Tue, 06 May 2025 12:22:49 -0700 (PDT)
Date: Tue, 06 May 2025 12:22:47 -0700
In-Reply-To: <aBlkplRxLNojF4m1@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aA7UXI0NB7oQQrL2@yzhao56-desk.sh.intel.com> <diqz4iy5xvgi.fsf@ackerleytng-ctop.c.googlers.com>
 <aBlkplRxLNojF4m1@yzhao56-desk.sh.intel.com>
Message-ID: <diqz1pt1sfw8.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [RFC PATCH 39/39] KVM: guest_memfd: Dynamically split/reconstruct
 HugeTLB page
From: Ackerley Tng <ackerleytng@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: vannapurve@google.com, chenyi.qiang@intel.com, tabba@google.com, 
	quic_eberman@quicinc.com, roypat@amazon.co.uk, jgg@nvidia.com, 
	peterx@redhat.com, david@redhat.com, rientjes@google.com, fvdl@google.com, 
	jthoughton@google.com, seanjc@google.com, pbonzini@redhat.com, 
	zhiquan1.li@intel.com, fan.du@intel.com, jun.miao@intel.com, 
	isaku.yamahata@intel.com, muchun.song@linux.dev, erdemaktas@google.com, 
	qperret@google.com, jhubbard@nvidia.com, willy@infradead.org, 
	shuah@kernel.org, brauner@kernel.org, bfoster@redhat.com, 
	kent.overstreet@linux.dev, pvorel@suse.cz, rppt@kernel.org, 
	richard.weiyang@gmail.com, anup@brainfault.org, haibo1.xu@intel.com, 
	ajones@ventanamicro.com, vkuznets@redhat.com, maciej.wieczor-retman@intel.com, 
	pgonda@google.com, oliver.upton@linux.dev, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Yan Zhao <yan.y.zhao@intel.com> writes:

>> > <snip>
>> >
>> > What options does userspace have in this scenario?
>> > It can't reduce the flag to KVM_GUEST_MEMFD_HUGE_2MB. Adjusting the gmem.pgoff
>> > isn't ideal either.
>> >
>> > What about something similar as below?
>> >
>> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> > index d2feacd14786..87c33704a748 100644
>> > --- a/virt/kvm/guest_memfd.c
>> > +++ b/virt/kvm/guest_memfd.c
>> > @@ -1842,8 +1842,16 @@ __kvm_gmem_get_pfn(struct file *file, struct kvm_memory_slot *slot,
>> >         }
>> >
>> >         *pfn = folio_file_pfn(folio, index);
>> > -       if (max_order)
>> > -               *max_order = folio_order(folio);
>> > +       if (max_order) {
>> > +               int order;
>> > +
>> > +               order = folio_order(folio);
>> > +
>> > +               while (order > 0 && ((slot->base_gfn ^ slot->gmem.pgoff) & ((1 << order) - 1)))
>> > +                       order--;
>> > +
>> > +               *max_order = order;
>> > +       }
>> >
>> >         *is_prepared = folio_test_uptodate(folio);
>> >         return folio;
>> >
>> 
>> Vishal was wondering how this is working before guest_memfd was
>> introduced, for other backing memory like HugeTLB.
>> 
>> I then poked around and found this [1]. I will be adding a similar check
>> for any slot where kvm_slot_can_be_private(slot).
>>
>> Yan, that should work, right?
> No, I don't think the checking of ugfn [1] should work.
>
> 1. Even for slots bound to in-place-conversion guest_memfd (i.e. shared memory
> are allocated from guest_memfd), the slot->userspace_addr does not necessarily
> have the same offset as slot->gmem.pgoff. Even if we audit the offset in
> kvm_gmem_bind(), userspace could invoke munmap() and mmap() afterwards, causing
> slot->userspace_addr to point to a different offset.
>
> 2. for slots bound to guest_memfd that do not support in-place-conversion,
> shared memory is allocated from a different backend. Therefore, checking
> "slot->base_gfn ^ slot->gmem.pgoff" is required for private memory. The check is
> currently absent because guest_memfd supports 4K only.
>
>

Let me clarify, I meant these changes:

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 4b64ab3..d0dccf1 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12938,6 +12938,11 @@ int memslot_rmap_alloc(struct kvm_memory_slot *slot, unsigned long npages)
        return 0;
 }
 
+static inline bool kvm_is_level_aligned(u64 value, int level)
+{
+       return IS_ALIGNED(value, KVM_PAGES_PER_HPAGE(level));
+}
+
 static int kvm_alloc_memslot_metadata(struct kvm *kvm,
                                      struct kvm_memory_slot *slot)
 {
@@ -12971,16 +12976,20 @@ static int kvm_alloc_memslot_metadata(struct kvm *kvm,
 
                slot->arch.lpage_info[i - 1] = linfo;
 
-               if (slot->base_gfn & (KVM_PAGES_PER_HPAGE(level) - 1))
+               if (!kvm_is_level_aligned(slot->base_gfn, level))
                        linfo[0].disallow_lpage = 1;
-               if ((slot->base_gfn + npages) & (KVM_PAGES_PER_HPAGE(level) - 1))
+               if (!kvm_is_level_aligned(slot->base_gfn + npages, level))
                        linfo[lpages - 1].disallow_lpage = 1;
                ugfn = slot->userspace_addr >> PAGE_SHIFT;
                /*
-                * If the gfn and userspace address are not aligned wrt each
-                * other, disable large page support for this slot.
+                * If the gfn and userspace address are not aligned or if gfn
+                * and guest_memfd offset are not aligned wrt each other,
+                * disable large page support for this slot.
                 */
-               if ((slot->base_gfn ^ ugfn) & (KVM_PAGES_PER_HPAGE(level) - 1)) {
+               if (!kvm_is_level_aligned(slot->base_gfn ^ ugfn, level) ||
+                   (kvm_slot_can_be_private(slot) &&
+                    !kvm_is_level_aligned(slot->base_gfn ^ slot->gmem.pgoff,
+                                          level))) {
                        unsigned long j;
 
                        for (j = 0; j < lpages; ++j)

This does not rely on the ugfn check, but adds a similar check for gmem.pgoff.

I think this should take care of case (1.), for guest_memfds going to be
used for both shared and private memory. Userspace can't update
slot->userspace_addr, since guest_memfd memslots cannot be updated and
can only be deleted.

If userspace re-uses slot->userspace_addr for some other memory address
without deleting and re-adding a memslot,

+ KVM's access to memory should still be fine, since after the recent
  discussion at guest_memfd upstream call, KVM's guest faults will
  always go via fd+offset and KVM's access won't be disrupted
  there. Whatever checking done at memslot binding time will still be
  valid.
+ Host's access and other accesses (e.g. instruction emulation, which
  uses slot->userspace_addr) to guest memory will be broken, but I think
  there's nothing protecting against that. The same breakage would
  happen for non-guest_memfd memslot.

p.s. I will be adding the validation as you suggested [1], though that
shouldn't make a difference here, since the above check directly
validates against gmem.pgoff.

Regarding 2., checking this checks against gmem.pgoff and should handle
that as well.

[1] https://lore.kernel.org/all/aBnMp26iWWhUrsVf@yzhao56-desk.sh.intel.com/

I prefer checking at binding time because it aligns with the ugfn check
that is already there, and avoids having to check at every fault.

>> [1] https://github.com/torvalds/linux/blob/b6ea1680d0ac0e45157a819c41b46565f4616186/arch/x86/kvm/x86.c#L12996
>> 
>> >> >> Adding checks at binding time will allow hugepage-unaligned offsets (to
>> >> >> be at parity with non-guest_memfd backing memory) but still fix this
>> >> >> issue.
>> >> >> 
>> >> >> lpage_info will make sure that ranges near the bounds will be
>> >> >> fragmented, but the hugepages in the middle will still be mappable as
>> >> >> hugepages.
>> >> >> 
>> >> >> [1] https://lpc.events/event/18/contributions/1764/attachments/1409/3706/binding-must-have-same-alignment.svg
