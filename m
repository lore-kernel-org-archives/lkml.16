Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE64252287
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 16:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751559987; cv=none; b=XTFHorOZj5sVO/5RBiVMf61zpt+Evag7BLR8zA0RL/8zDpnRZfGG3w5s0KDGV4Gejf8xmDGTL2uznCayHCgHSD+HimKedS5AGd+7fuIWzyXlsLcLInsvBiIQg1UTW7oFeCffCqagxcNZmCfaYnL8rKb9Fcd7PhNf7dlzXC9zOpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751559987; c=relaxed/simple;
	bh=jUxrOyYaHkGojyPnulFYD8nv/MuH8PRQATzTFRe6EIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SH/rKgD4ifSYiw+opphM5yk/xfNgf8p6gFedNghcvijvIQp5PLU0PWCw8iSFwecJqxOmYnK8rn/YIb0MCe+CEtPDFXI6kVlGiIWc/Ia+vzz8rbkwJl3WTzB2RwkBC58cssf+yelsELawXXZHWteMBWlb1VVWuRLYZonIOPu74iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hK+sI4UD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hK+sI4UD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751559984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4Y6zCExeDq8zceYvmEFOtzzhRpN64YrjMCwXYdkn74M=;
	b=hK+sI4UDqX0X3cBusKeWDCb/RH4zeHUtjrpZeDEePfUAqKqyY5/ZpIPv55nY1ObrN30wfx
	YQY1ij6/EQZfbHWu7OME6wKhDDjydaYobyqmOkUSCrdMu75Hz/YLKIl/K4I7fo9J4cdsYC
	VSgfaDBkm7HJ7/Uk7ftNBgS+Zl/WrrI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-eSnQy0t8Ny6QIyX73OlL7g-1; Thu, 03 Jul 2025 12:26:23 -0400
X-MC-Unique: eSnQy0t8Ny6QIyX73OlL7g-1
X-Mimecast-MFC-AGG-ID: eSnQy0t8Ny6QIyX73OlL7g_1751559983
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3e90c3a81so1415885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 09:26:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751559983; x=1752164783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Y6zCExeDq8zceYvmEFOtzzhRpN64YrjMCwXYdkn74M=;
        b=JJMB3G8EfWdV5JlsEYCC9w1PL9YtmVrrLM3fpv+pTn51ux4lQO72sE+7B2c/Y3LJFB
         GN1k/TGGwf7ORL/GxbErc2kHI48guzjRY3Cu7P03sSnx+v1Lxk9yCa9ePyXUVZGeM1EU
         8a09k0VDf3J9sRB6hitSOIS993S0Q3V5UDCBJ7wXUcysc9JNFKkLhf4xe7945l0F0OCL
         MBQq2YaT0P3LF1P/zds4zqRfr1ATtXZF7wVcOFVROdkILqwBMSZwwaWvaWNe301N+6k9
         ETXbZnjz5gnn0/RUF3qOA/0aa90+16p9nHbt2I8PcxNp9ClQedD2JEpXYrJAcjk4aqxQ
         rGYA==
X-Forwarded-Encrypted: i=1; AJvYcCUg9AGd34y9PvxU0oJve99lSeOvXJJ9+mebmCdqeclVd/rqtVrd+bxe7lCwHWzfDtsY8NB5h3DrGzt4vnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX/KBr7l42zKYOtfcMlPmAk5PrDnG61EmU+Zoaz/4nYMqjWV0T
	lDsxI1jJ2eDvttrLhSAM5XC/mZHmxsWf5gkTFfqWuvBEfslQAgv06L/z6p6wUCoETpWjmB3R8Yh
	dH4gM9yha9sN79xpCwYAw6u9//ARmmRd8Ra96tPwRlwfXALvRkKvgRgRH2ROH8e0R6A==
X-Gm-Gg: ASbGncvdWOPvhETAvqcH9Uv3K3R8YV7RxBn0dVc0ClOLdQ9aVMC4CwPy6qIfuGo6GCt
	NPNiJpCTkC8sr0M8Lbt9KLgDOB6qiDJ9dEcOOqXBRyliIjY6xTF1xtl+unBVIkpOHmN/e4dEQZx
	yrEQZMF1Kb8rCWJioc249gk5N5ySA9VTYQ1cM2ojCzjczluvpxR/KOSRZxJI4zvDss3Dp4TI7zw
	NMM3UdscYD5BdGKPlbUm3zLBJFAm9L8BFAkDSbMnthfTIJX++E0vl5vC/mnjKVfuY5Jhofw1/4x
	qK1Qvahd+W+dnQ==
X-Received: by 2002:a05:620a:a10c:b0:7d5:dbc3:4184 with SMTP id af79cd13be357-7d5dbc3419dmr64219885a.1.1751559982793;
        Thu, 03 Jul 2025 09:26:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7sc61w0XpTLo0eopdVSxu3NVsb/iPtSzOZNv6mB6attAfczYLdg4MkHjnjmMcH1lA6umW4g==
X-Received: by 2002:a05:620a:a10c:b0:7d5:dbc3:4184 with SMTP id af79cd13be357-7d5dbc3419dmr64213485a.1.1751559982118;
        Thu, 03 Jul 2025 09:26:22 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe7baedsm12772085a.57.2025.07.03.09.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 09:26:21 -0700 (PDT)
Date: Thu, 3 Jul 2025 12:26:17 -0400
From: Peter Xu <peterx@redhat.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Muchun Song <muchun.song@linux.dev>,
	Mike Rapoport <rppt@kernel.org>, Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 0/4] mm/userfaultfd: modulize memory types
Message-ID: <aGavKS-ugFeIbQ8g@x1.local>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <92265a41-7e32-430c-8ab2-4e7680609624@lucifer.local>
 <aGWYT4vFk2pyVwtv@x1.local>
 <54bb09fc-144b-4d61-8bc2-1eca4d278382@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <54bb09fc-144b-4d61-8bc2-1eca4d278382@lucifer.local>

On Thu, Jul 03, 2025 at 04:55:01PM +0100, Lorenzo Stoakes wrote:
> Peter you've ignored a large part of what I've said here, I'm not sure this is
> productive.
> 
> On Wed, Jul 02, 2025 at 04:36:31PM -0400, Peter Xu wrote:
> > On Mon, Jun 30, 2025 at 11:29:30AM +0100, Lorenzo Stoakes wrote:
> > > On Fri, Jun 27, 2025 at 11:46:51AM -0400, Peter Xu wrote:
> > > > [based on latest akpm/mm-new of June 27th, commit 9be7387ae43f]
> > > >
> > > > v2 changelog:
> > > > - Patch 1
> > > >   - update English in commit log [David]
> > > >   - move vm_uffd_ops definition to userfaultfd_k.h [Mike]
> > > > - Patch 4
> > > >   - fix sparse warning on bitwise type conversions [syzbot]
> > > >   - Commit message updates on explanation of vma_can_userfault check [James]
> > > >
> > > > v1: https://lore.kernel.org/r/20250620190342.1780170-1-peterx@redhat.com
> > > >
> > > > This series is an alternative proposal of what Nikita proposed here on the
> > > > initial three patches:
> > > >
> > > >   https://lore.kernel.org/r/20250404154352.23078-1-kalyazin@amazon.com
> > > >
> > > > This is not yet relevant to any guest-memfd support, but paving way for it.
> > > > Here, the major goal is to make kernel modules be able to opt-in with any
> > > > form of userfaultfd supports, like guest-memfd.  This alternative option
> > > > should hopefully be cleaner, and avoid leaking userfault details into
> > > > vm_ops.fault().
> > > >
> > > > It also means this series does not depend on anything.  It's a pure
> > > > refactoring of userfaultfd internals to provide a generic API, so that
> > > > other types of files, especially RAM based, can support userfaultfd without
> > > > touching mm/ at all.
> > >
> > > I'm very concerned that this change will simply move core mm functionality out
> > > of mm and into drivers where it can bitrot and cause subtle bugs?
> > >
> > > You're proposing providing stuff like page table state and asking for a folio
> > > back from a driver etc.
> > >
> > > I absolutely am not in favour of us providing core mm internals like this to
> > > drivers, and I don't want to see us having to EXPORT() mm internals just to make
> > > module-ised uffd code work (I mean I just will flat out refuse to do that).
> > >
> > > I think we need to think _very_ carefully about how we do this.
> > >
> > > I also feel like this series is at a really basic level and you've not fully
> > > determined what API calls you need.
> >
> > See:
> >
> > https://lore.kernel.org/all/aGWVIjmmsmskA4bp@x1.local/#t
> 
> OK so it seems the point you're making there is - there's a lot of complexity -
> and you'd rather not think about it for now?

This is not a fair judgement.  I think I have provided my thought process
and how I made the decision to come up with this series.

> 
> My concern is that in _actuality_ you'll need to do a _lot_ more and expose a
> _lot_ more mm internals to achieve what you need to.
> 
> I am happy for the API to be internal-to-mm-only.
> 
> My concerns are really simple:
> 
> - exposing page table manipulation outside of mm is something I just cannot
>   accept us doing for reasons I already mentioned and also Liam
> 
> - we should absolutely minimise how much we do expose
> 
> - we mustn't have hooks that don't allow us to make sensible decisions in core
>   mm code.
> 
> I think overall I'm just not in favour of us having uffd functionality in
> modules, I think it's an abstraction mismatch.
> 
> Now if you instead had something like:
> 
> enum uffd_minor_fault_handler_type {
> 	UFFD_MINOR_FAULT_DEFAULT_HANDLER,
> 	UFFD_MINOR_FAULT_FOO_HANDLER,
> 	UFFD_MINOR_FAULT_BAR_HANDLER,
> 	etc.
> };
> 
> And the module could _choose_ which should be used then that's far far better.
> 
> Really - hermetically seal the sensitive parts but allow module choice.
> 
> You could find ways to do this in a more sophisticated way too by e.g. having a
> driver callback that provides a config struct that sets things up.
> 
> If we're going 'simple first' and can 'change what we want' why not do it like
> this to start?

Could you help to define UFFD_MINOR_FAULT_FOO_HANDLER for guest-memfd, and
how that handler would be able to hook to the guest-memfd driver?  The
kernel needs to build with/without CONFIG_KVM.

What about MISSING?  Do you plan to support missing in the proposal you
mentioned?

> 
> >
> > >
> > > I agree that it's sensible to be incremental, but I feel like you sort of need
> > > to somewhat prove the case that you can jump from 'incremental version where we
> > > only support code in mm/' to supporting arbitrary file system code that might be
> > > modules.
> > >
> > > Because otherwise you're basically _guessing_ that you can do this, possibly, in
> > > the future and maybe it's just not the right approach but that's not clear yet?
> >
> > Did you follow up with the discussions in v1?  I copied you too.
> >
> > https://lore.kernel.org/r/114133f5-0282-463d-9d65-3143aa658806@amazon.com
> >
> > Would Nikita's work help here?  Could you explain what are you asking for
> > to prove that this works for us?
> 
> Yeah thanks this seems like it actually implements useful functionality. The
> point is the API seems currently to be a stub so doesn't really give us much to
> go on as to what might ultimately be required.
> 
> You say yourself in the series that you'll likely need to expand things and you
> already have todos to this effect.
> 
> >
> > >
> > > >
> > > > To achieve it, this series introduced a file operation called vm_uffd_ops.
> > > > The ops needs to be provided when a file type supports any of userfaultfd.
> > > >
> > > > With that, I moved both hugetlbfs and shmem over.
> > >
> > > Well as you say below hugetlbfs is sort of a stub implementation, I wonder
> > > whether we'd need quite a bit more to make that work.
> > >
> > > One thing I'd _really_ like to avoid is us having to add a bunch of hook points
> > > into core mm code just for uffd that then call out to some driver.
> > >
> > > We've encountered such a total nightmare with .mmap() for instance in the past
> > > (including stuff that resulted in security issues) because we - simply cannot
> > > assume anything - about what the hook implementor might do with the passed
> > > parameters.
> > >
> > > This is really really problematic.
> > >
> > > I also absolutely hate the:
> > >
> > > if (uffd)
> > > 	do_something_weird();
> > >
> > > Pattern, so hopefully this won't proliferate that.
> 
> ^ you didn't respond to this.

Can you elaborate?  I don't understand how this is attached to this series.
AFAIU, the series is trying to remove some "if()s", not adding.

> 
> > >
> > > >
> > > > Hugetlbfs is still very special that it will only use partial of the
> > > > vm_uffd_ops API, due to similar reason why hugetlb_vm_op_fault() has a
> > > > BUG() and so far hard-coded into core mm.  But this should still be better,
> > > > because at least hugetlbfs is still always involved in feature probing
> > > > (e.g. where it used to not support ZEROPAGE and we have a hard-coded line
> > > > to fail that, and some more).  Meanwhile after this series, shmem will be
> > > > completely converted to the new vm_uffd_ops API; the final vm_uffd_ops for
> > > > shmem looks like this:
> > > >
> > > > static const vm_uffd_ops shmem_uffd_ops = {
> > > > 	.uffd_features	= 	__VM_UFFD_FLAGS,
> > > > 	.uffd_ioctls	= 	BIT(_UFFDIO_COPY) |
> > > > 				BIT(_UFFDIO_ZEROPAGE) |
> > > > 				BIT(_UFFDIO_WRITEPROTECT) |
> > > > 				BIT(_UFFDIO_CONTINUE) |
> > > > 				BIT(_UFFDIO_POISON),
> > > > 	.uffd_get_folio	=	shmem_uffd_get_folio,
> > > > 	.uffd_copy	=	shmem_mfill_atomic_pte,
> > > > };
> > > >
> > > > As I mentioned in one of my reply to Nikita, I don't like the current
> > > > interface of uffd_copy(), but this will be the minimum change version of
> > > > such API to support complete extrenal-module-ready userfaultfd.  Here, very
> > > > minimal change will be needed from shmem side to support that.
> > >
> > > Right, maybe a better version of this interface might address some of my
> > > concerns... :)
> > >
> > > >
> > > > Meanwhile, the vm_uffd_ops is also not the only place one will need to
> > > > provide to support userfaultfd.  Normally vm_ops.fault() will also need to
> > > > be updated, but that's a generic function and it'll play together with the
> > > > new vm_uffd_ops to make everything fly.
> > > >
> > > > No functional change expected at all after the whole series applied.  There
> > > > might be some slightly stricter check on uffd ops here and there in the
> > > > last patch, but that really shouldn't stand out anywhere to anyone.
> > > >
> > > > For testing: besides the cross-compilation tests, I did also try with
> > > > uffd-stress in a VM to measure any perf difference before/after the change;
> > > > The static call becomes a pointer now.  I really cannot measure anything
> > > > different, which is more or less expected.
> > > >
> > > > Comments welcomed, thanks.
> > > >
> > > > Peter Xu (4):
> > > >   mm: Introduce vm_uffd_ops API
> > > >   mm/shmem: Support vm_uffd_ops API
> > > >   mm/hugetlb: Support vm_uffd_ops API
> > > >   mm: Apply vm_uffd_ops API to core mm
> > > >
> > > >  include/linux/mm.h            |   9 +++
> > > >  include/linux/shmem_fs.h      |  14 -----
> > > >  include/linux/userfaultfd_k.h |  98 +++++++++++++++++++----------
> > > >  mm/hugetlb.c                  |  19 ++++++
> > > >  mm/shmem.c                    |  28 ++++++++-
> > > >  mm/userfaultfd.c              | 115 +++++++++++++++++++++++++---------
> > > >  6 files changed, 207 insertions(+), 76 deletions(-)
> > > >
> > > > --
> > > > 2.49.0
> > > >
> > >
> > > Sorry to be critical, I just want to make sure we're not setting ourselves up
> > > for trouble here.
> > >
> > > I _very much_ support efforts to make uffd more generalised, and ideally to find
> > > a way to separate out shmem and hugetlbfs implementation bits, so I support the
> > > intent _fully_.
> > >
> > > I just want to make sure we do it in a safe way :)
> >
> > Any explicit suggestions (besides objections)?
> 
> I gave some above.
> 
> I'm fundamentally opposed to us exposing page table manipulation or really any
> state subject to sensitive locks to modules.
> 
> Cheers, Lorenzo
> 

-- 
Peter Xu

