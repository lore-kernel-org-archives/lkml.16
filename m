Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBCD1DAC92
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 20:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751488602; cv=none; b=pG2qq9Ob2Tc5GQ5Osr/2N4eoHXzynouLy4uOxNgUc+prDegjFMQE03nrXlTive4deHo4RSQMXfYMYUipPbhRtb8Xsk6gheIHKcLbfO9nWTxtdKwHVtCjTtB0b7amxFFKZHOb83maqEi6R5dblKuxrHKxuABwLwnETfeLErArfW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751488602; c=relaxed/simple;
	bh=544fp6BGMTIrtpo4DWW1OenPCrEYoQ5atJd83Wf63Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUCW8IZGNRHnJNggjpSNBgb97PNw5kmZ/fYiNXpfkrrOsqQUPK8YcUHQuU9hD2pEcz9hhrvbdky1K8TszmEfN5hpPVT7n10vJqQbNMsFs+PVxfdG6ImOPb/vso12ilSW/t7he86J+Yq/0+IsxcEv5Jk3huT7s1bbwm60U7xIvpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BUFyQ1Ku; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BUFyQ1Ku"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751488598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OL23Q7Q9NrlgNMFncEiNJFIUCrL+UMC2Lcyay4XewBc=;
	b=BUFyQ1KuXnSRtAb5cbJcXP5Xprdt/ZE/Dq4oRR4qoGWFG2AMc2edrvPNRd239DnGPLz0uV
	jjfiQASUSHf2aDwqXHy+QG/ZhixA4UrtFg0xcQKoyhLPu8XHLtrkZ0ltgOgjQceBiutVou
	RnAOdVOW6Qh+OzzgnBFVKvy81xIBz7M=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-FyfA5WgtNrSf16a4q_Ch7w-1; Wed, 02 Jul 2025 16:36:37 -0400
X-MC-Unique: FyfA5WgtNrSf16a4q_Ch7w-1
X-Mimecast-MFC-AGG-ID: FyfA5WgtNrSf16a4q_Ch7w_1751488597
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09bc05b77so135061985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 13:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751488596; x=1752093396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OL23Q7Q9NrlgNMFncEiNJFIUCrL+UMC2Lcyay4XewBc=;
        b=w/o5hoDzc8fC6sT7hDUXW5HxN3JF+xNAQNQ/irOQClq1zku/xzBJDTSWm3ydWJkGl4
         Zki+8bfC+GR7Q1PB5OeeVyW904++X17zpBHrvtN62A9HlPeEFbnQAjB0YA7sz7edycGp
         4Tz4fioevnCh51LPz5J4Rz5D7H2dCRw0bIbS8Tc5CvhKcL2r87TR9s7+Xl21rswUi/an
         6qnTZ69dFtn8TBqhVBFUrlrKIto8U95kU95K4r+NWahrBZMDSyhecZPRwbcaDj9rvq/t
         9ITU8GL7Nxd612A3KZNAs3QksO5658hRnBTjBqG2oGxTzh95LI22ExFTSa6j+nSB3tOp
         KCog==
X-Forwarded-Encrypted: i=1; AJvYcCW7p/61Y5rp248QH0tEL34XNWjbxAdkjJj5qoCNIsYH/ontxXo4QCzxlkp0/s6Jd3KWJXjTh4vJ5oUXPB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYI9KNnf/1oT8V7JOyYNfUYoRyzn5ZeYjOr20uJa+eEfb/RPWl
	ogrV0mOJN4qU50h7MnePPKUl52wHyL7VMyFCEtRialjA90+W6orMOq7/WKVHr68c3qjyA/5XPkg
	J0/FDvlzqPOxmPxAAUQTr2OjfGUQS497teB3m9BdWJMnTd/jh9z38xO6+WXhqm+PnGaKWwN013A
	==
X-Gm-Gg: ASbGncufFFctxTf+ko+idgpI/9KR9vL1MPdIbcRXfe45bO7Tp86CFXqC+FLEgZ+ZzJo
	sduqzw84OoenwoQ9qZb2fJOEVwsO5ftXV6OXnrBuGnIsKrXnhE2i6BQ/SXmRhT4CuDeDcYyN1Vl
	nrd+x/EUTelTZn+/bNpB95ukigDYxih2L+5a5vZDq5U5XwKaA6p3ReD/KrwFJjFHg/i3vdfy0/A
	kwNZOMaH3sndUGQcDyhoZqQubREDoYcecw9qgylYoeAy8qaqbfSVHbxAWIoUO/cCgh9DW3OMYBf
	JzuYHlZdwxc/lw==
X-Received: by 2002:a05:620a:1a8d:b0:7cd:565b:dbc9 with SMTP id af79cd13be357-7d5c477edacmr470446185a.26.1751488596369;
        Wed, 02 Jul 2025 13:36:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr+VZI7xQQFXix0YoKKczgSHvm4AIwXNE11tqJYsMDPOV7HPgC1heTFWU6De0i3wyYJjUw7A==
X-Received: by 2002:a05:620a:1a8d:b0:7cd:565b:dbc9 with SMTP id af79cd13be357-7d5c477edacmr470442085a.26.1751488595851;
        Wed, 02 Jul 2025 13:36:35 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443134f32sm998799385a.12.2025.07.02.13.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 13:36:35 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:36:31 -0400
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
Message-ID: <aGWYT4vFk2pyVwtv@x1.local>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <92265a41-7e32-430c-8ab2-4e7680609624@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <92265a41-7e32-430c-8ab2-4e7680609624@lucifer.local>

On Mon, Jun 30, 2025 at 11:29:30AM +0100, Lorenzo Stoakes wrote:
> On Fri, Jun 27, 2025 at 11:46:51AM -0400, Peter Xu wrote:
> > [based on latest akpm/mm-new of June 27th, commit 9be7387ae43f]
> >
> > v2 changelog:
> > - Patch 1
> >   - update English in commit log [David]
> >   - move vm_uffd_ops definition to userfaultfd_k.h [Mike]
> > - Patch 4
> >   - fix sparse warning on bitwise type conversions [syzbot]
> >   - Commit message updates on explanation of vma_can_userfault check [James]
> >
> > v1: https://lore.kernel.org/r/20250620190342.1780170-1-peterx@redhat.com
> >
> > This series is an alternative proposal of what Nikita proposed here on the
> > initial three patches:
> >
> >   https://lore.kernel.org/r/20250404154352.23078-1-kalyazin@amazon.com
> >
> > This is not yet relevant to any guest-memfd support, but paving way for it.
> > Here, the major goal is to make kernel modules be able to opt-in with any
> > form of userfaultfd supports, like guest-memfd.  This alternative option
> > should hopefully be cleaner, and avoid leaking userfault details into
> > vm_ops.fault().
> >
> > It also means this series does not depend on anything.  It's a pure
> > refactoring of userfaultfd internals to provide a generic API, so that
> > other types of files, especially RAM based, can support userfaultfd without
> > touching mm/ at all.
> 
> I'm very concerned that this change will simply move core mm functionality out
> of mm and into drivers where it can bitrot and cause subtle bugs?
> 
> You're proposing providing stuff like page table state and asking for a folio
> back from a driver etc.
> 
> I absolutely am not in favour of us providing core mm internals like this to
> drivers, and I don't want to see us having to EXPORT() mm internals just to make
> module-ised uffd code work (I mean I just will flat out refuse to do that).
> 
> I think we need to think _very_ carefully about how we do this.
> 
> I also feel like this series is at a really basic level and you've not fully
> determined what API calls you need.

See:

https://lore.kernel.org/all/aGWVIjmmsmskA4bp@x1.local/#t

> 
> I agree that it's sensible to be incremental, but I feel like you sort of need
> to somewhat prove the case that you can jump from 'incremental version where we
> only support code in mm/' to supporting arbitrary file system code that might be
> modules.
> 
> Because otherwise you're basically _guessing_ that you can do this, possibly, in
> the future and maybe it's just not the right approach but that's not clear yet?

Did you follow up with the discussions in v1?  I copied you too.

https://lore.kernel.org/r/114133f5-0282-463d-9d65-3143aa658806@amazon.com

Would Nikita's work help here?  Could you explain what are you asking for
to prove that this works for us?

> 
> >
> > To achieve it, this series introduced a file operation called vm_uffd_ops.
> > The ops needs to be provided when a file type supports any of userfaultfd.
> >
> > With that, I moved both hugetlbfs and shmem over.
> 
> Well as you say below hugetlbfs is sort of a stub implementation, I wonder
> whether we'd need quite a bit more to make that work.
> 
> One thing I'd _really_ like to avoid is us having to add a bunch of hook points
> into core mm code just for uffd that then call out to some driver.
> 
> We've encountered such a total nightmare with .mmap() for instance in the past
> (including stuff that resulted in security issues) because we - simply cannot
> assume anything - about what the hook implementor might do with the passed
> parameters.
> 
> This is really really problematic.
> 
> I also absolutely hate the:
> 
> if (uffd)
> 	do_something_weird();
> 
> Pattern, so hopefully this won't proliferate that.
> 
> >
> > Hugetlbfs is still very special that it will only use partial of the
> > vm_uffd_ops API, due to similar reason why hugetlb_vm_op_fault() has a
> > BUG() and so far hard-coded into core mm.  But this should still be better,
> > because at least hugetlbfs is still always involved in feature probing
> > (e.g. where it used to not support ZEROPAGE and we have a hard-coded line
> > to fail that, and some more).  Meanwhile after this series, shmem will be
> > completely converted to the new vm_uffd_ops API; the final vm_uffd_ops for
> > shmem looks like this:
> >
> > static const vm_uffd_ops shmem_uffd_ops = {
> > 	.uffd_features	= 	__VM_UFFD_FLAGS,
> > 	.uffd_ioctls	= 	BIT(_UFFDIO_COPY) |
> > 				BIT(_UFFDIO_ZEROPAGE) |
> > 				BIT(_UFFDIO_WRITEPROTECT) |
> > 				BIT(_UFFDIO_CONTINUE) |
> > 				BIT(_UFFDIO_POISON),
> > 	.uffd_get_folio	=	shmem_uffd_get_folio,
> > 	.uffd_copy	=	shmem_mfill_atomic_pte,
> > };
> >
> > As I mentioned in one of my reply to Nikita, I don't like the current
> > interface of uffd_copy(), but this will be the minimum change version of
> > such API to support complete extrenal-module-ready userfaultfd.  Here, very
> > minimal change will be needed from shmem side to support that.
> 
> Right, maybe a better version of this interface might address some of my
> concerns... :)
> 
> >
> > Meanwhile, the vm_uffd_ops is also not the only place one will need to
> > provide to support userfaultfd.  Normally vm_ops.fault() will also need to
> > be updated, but that's a generic function and it'll play together with the
> > new vm_uffd_ops to make everything fly.
> >
> > No functional change expected at all after the whole series applied.  There
> > might be some slightly stricter check on uffd ops here and there in the
> > last patch, but that really shouldn't stand out anywhere to anyone.
> >
> > For testing: besides the cross-compilation tests, I did also try with
> > uffd-stress in a VM to measure any perf difference before/after the change;
> > The static call becomes a pointer now.  I really cannot measure anything
> > different, which is more or less expected.
> >
> > Comments welcomed, thanks.
> >
> > Peter Xu (4):
> >   mm: Introduce vm_uffd_ops API
> >   mm/shmem: Support vm_uffd_ops API
> >   mm/hugetlb: Support vm_uffd_ops API
> >   mm: Apply vm_uffd_ops API to core mm
> >
> >  include/linux/mm.h            |   9 +++
> >  include/linux/shmem_fs.h      |  14 -----
> >  include/linux/userfaultfd_k.h |  98 +++++++++++++++++++----------
> >  mm/hugetlb.c                  |  19 ++++++
> >  mm/shmem.c                    |  28 ++++++++-
> >  mm/userfaultfd.c              | 115 +++++++++++++++++++++++++---------
> >  6 files changed, 207 insertions(+), 76 deletions(-)
> >
> > --
> > 2.49.0
> >
> 
> Sorry to be critical, I just want to make sure we're not setting ourselves up
> for trouble here.
> 
> I _very much_ support efforts to make uffd more generalised, and ideally to find
> a way to separate out shmem and hugetlbfs implementation bits, so I support the
> intent _fully_.
> 
> I just want to make sure we do it in a safe way :)

Any explicit suggestions (besides objections)?

Thanks,

-- 
Peter Xu

