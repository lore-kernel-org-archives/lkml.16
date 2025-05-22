Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2059718E3F
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 02:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747879552; cv=none; b=L0iQuEgkLi5oxzt8B8qSe/5Ohyc1JCHhTI24yzrcQguuEGJATrYXYoPwjLXSHO7Q81P5zJIOykUNbSUL/q5COUeerOyylZTmneoqFaUELayhpaGKeD6+2dOBRUhdR9Eb8KkdDiOtmmiB1XGWC3cLviLcWH2vF7XeycqgIhesFrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747879552; c=relaxed/simple;
	bh=kX6LvYwNoxRoJCezYpAf9Uoi8auvyUl6RV2LT2j1fos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=lUJ0iFQDP6GQKv7lXztAK2YdKRlh9wxc5y0CWiZqY0D6R/ZLdG1pV35K8wKEeHmOFgQlp5hU9FzYJRn67RUP+Br3uUcP2ITnIYo50E59dJEmp4NCZQHMbcPkqRcys27zv1HTZJMkK+mIOEeE4FXdaq2PURKD9rt1FZcPyA/N47w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mruTyAc6; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mruTyAc6"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-877d7fa49e0so3876680241.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 19:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747879549; x=1748484349; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfcSpn9AJtIs0/yJRdv0J7LsjW7YRrvFwD8SBJzlwA8=;
        b=mruTyAc6+RDXYN/aQpAKLaY3F0ss58FqcWujC6vxUqtDCTod4HgoFQye4zZYadWImv
         elEMPEmM/7qEURnmjQwxHpflAbEMsR1F8nrjPubZDjOgy+zypJvw8p8NHapEYByTfmNo
         cV/oyIAs6HN/3QRw+LcM5TJmpmUfOJj3jdcr62xig1Wed/moQ976+EbDbWesQj/+Uv+d
         MSOROXBSOTymtqeqIP/SPplhuMCNvZZ43X8LaZj5HPEt74nTlG2ZvXrQcss/SCV+8bt+
         utOV1dcqAoW6T9RBeVbD3lA+GUKtFcfcT/3wYyRm9P/mKx+UUDqmL/Se4Fnpof3Ra/u9
         1ueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747879549; x=1748484349;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfcSpn9AJtIs0/yJRdv0J7LsjW7YRrvFwD8SBJzlwA8=;
        b=X/QE5iW1eoV2tR1iStHMbEYoalPKbMQOsyzeiCGNHpWypN0YbKCJeLCA+UZf9eENVp
         i6irZOeZM0me3PMjSLflgOpT7AHgCI8q0Vwoi08cmwtXZd4J4CUsvzrRy8E37yQXTZWB
         Gh/BWH0h2mGhLaziky8UP7UaxAv1/oQ4pzh+0PuGuM+cNbUkVGygwFhVzOntOxZXWa0e
         f2WzZM6wjhLQc99WKps58k6Skp4PTdIzTMoVbd82tCTi0m2+7mUH/SHUWtbzxsT4bo9g
         iXsgNppn6PlEESgYeEO4U5OkIXJIn7SMp/Ovyvd+uHv9ZcrHL44a72mrHqIpDjUaC8Wx
         8SiA==
X-Forwarded-Encrypted: i=1; AJvYcCVotDxxvU6QZIb8nSinSBOGWyyKrWw2NWcWWYkUsLo9vJ7uODeRO0c428AICB8Vcf+FktZykQczYv9r61s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbrpJ8UDpppUQszkwSE1AQPZ5oYkYgAtc2mGAI4M5mz7bGktqe
	JRKeRyOehXyF4rZRSbkFueB1FJrLzugb/AYWFRSr/SbbOmxq247Ll7tv+g8stb3NZPUBSXEqx6o
	meEiPsdCheImvgSG8QvLPLWC41gXstB8=
X-Gm-Gg: ASbGncvjaS1T13R4FCt6wBCpL/BJWaqZzEfpN8bKGDbsengZyDp73JEe8qNnM98kwzv
	x99rZuzjE3BPBORWmiJP5Ks7AGoiKgyNtVsf5tXDVAbA05BZzP/XymlFd1E3Y5LXQ3zJua6HVHt
	irtiC9nyOp5gv60JcnqFbvViyCSEHZjltpvA==
X-Google-Smtp-Source: AGHT+IGkhKjoXbG/7RhJh9ClxQvyGOe78DoLqgfKSz1L9F+0+1ISN9VlM0pJauQqNv1ern4cNzoHIIrP6N6IYEdjL58=
X-Received: by 2002:a05:6102:c0e:b0:4db:10c6:319f with SMTP id
 ada2fe7eead31-4dfa6bf8c2amr23167425137.19.1747879548826; Wed, 21 May 2025
 19:05:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514070820.51793-1-21cnbao@gmail.com> <xymq3lezzjc3hzh2eduogqpn6okrbbkodjdwu6ylpeszakb22a@ck6yhdfdcayq>
In-Reply-To: <xymq3lezzjc3hzh2eduogqpn6okrbbkodjdwu6ylpeszakb22a@ck6yhdfdcayq>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 22 May 2025 14:05:37 +1200
X-Gm-Features: AX0GCFuJvK1sHOpD8ShmMfDXD5NjCslpGjySxSdbTuHvd2HlgsrJtNyqAWg9UMI
Message-ID: <CAGsJ_4yKpRv392rbM=insAPZMA-cwvTNbcPzGAEycfPDzsbJZQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2] mm: add support for dropping LRU recency on
 process exit
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Barry Song <21cnbao@gmail.com>, 
	akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	zhengtangquan@oppo.com, Barry Song <v-songbaohua@oppo.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@redhat.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Matthew Wilcox <willy@infradead.org>, 
	Oscar Salvador <osalvador@suse.de>, Ryan Roberts <ryan.roberts@arm.com>, Zi Yan <ziy@nvidia.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Liam,
I really appreciate your review=E2=80=94thank you!

On Wed, May 21, 2025 at 4:20=E2=80=AFAM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Barry Song <21cnbao@gmail.com> [250514 03:08]:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > Currently, both zap_pmd and zap_pte always promote young file folios,
> > regardless of whether the processes are dying.
> > However, in systems where the process recency fades upon dying, we may
> > want to reverse this behavior. The goal is to reclaim the folios from
> > the dying process as quickly as possible, allowing new processes to
> > acquire memory ASAP.
> > For example, while Firefox is killed and LibreOffice is launched,
> > activating Firefox's young file-backed folios makes it harder to
> > reclaim memory that LibreOffice doesn't use at all.
> >
> > On systems like Android, processes are either explicitly stopped by
> > user action or reaped due to OOM after being inactive for a long time.
> > These processes are unlikely to restart in the near future. Rather than
> > promoting their folios, we skip promoting and demote their exclusive
> > folios so that memory can be reclaimed and made available for new
> > user-facing processes.
> >
> > Users possibly do not care about the recency of a dying process.
> > However, we still need an explicit user indication to take this action.
>
> Can you add why?  It'd be nice to capture the reasons pointed out in v1
> discussion as they seem important to why this isn't set as a default for
> all tasks.

Essentially, I took Johannes=E2=80=99 point (and to some extent David=E2=80=
=99s as
well) to be that it behaves somewhat unpredictably in broader
application scenarios=E2=80=94for example, when repeatedly executing a file
in a script or restarting an application shortly after it exits.

Also, when a shared library is mapped by multiple processes, we might
still want to retain recency information from a process that is exiting.
So we might only want to do that only for exclusive folios.

This actually leads to two questions:

1. Are we confident that the recency of a dead process is no longer
   useful within a period of time?

2. Should we limit the optimization only to exclusive folios=E2=80=94for
   example, shared objects (.so files) that are specific to the
   exiting process?

For both questions, the answer seems to be yes.

Though in the first case=E2=80=94when we repeatedly restart the same
application=E2=80=94the folios are likely still in the LRU and may still be
hit even if we unconditionally demote them. But that's not guaranteed.
So we likely need a userspace hint to eliminate the uncertainty.

>
> > Thus, we introduced a prctl to provide that necessary user-level hint
> > as suggested by Johannes and David.
>
> I'm not sure it really makes much of a difference if we update the lru
> or not in this case.  Johannes point about this small change having
> unknown results for the larger community is certainly the best argument
> as to why we need this to be opt-in.
>
> We should probably document it so that people can opt-in though :)
>
> >
> > We observed noticeable improvements in refaults, swap-ins, and swap-out=
s
> > on a hooked Android kernel. More data for this specific version will
> > follow.
>
> Looking forward to the results.  What happens when I kill my app and
> reopen it? (close all apps, open the one that was being annoying?)

I'm not sure I fully understand your question. In Android, we're
primarily concerned with smooth app switching. For example, in a
sequence like A =E2=86=92 B =E2=86=92 C =E2=86=92 D =E2=86=92 E, if we can =
quickly reclaim folios
from dead processes, it helps us launch new (different) apps faster.

However, if we do A =E2=86=92 kill A =E2=86=92 start A =E2=86=92 kill A =E2=
=86=92 start A repeatedly,
it=E2=80=99s likely not a problem because our memory can hold the same
application. The issue arises when memory isn=E2=80=99t enough to hold
A + B + C + D + E simultaneously.

I=E2=80=99m not overly concerned about repeatedly restarting the same
application in Android. However, for wider scenarios across various
industries, I=E2=80=99m uncertain.

>
> >
> > Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Johannes Weiner <hannes@cmpxchg.org>
> > Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> > Cc: Oscar Salvador <osalvador@suse.de>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Zi Yan <ziy@nvidia.com>
> > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Mike Rapoport <rppt@kernel.org>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Michal Hocko <mhocko@suse.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > ---
> >  -v2:
> >  * add prctl as suggested by Johannes and David
> >  * demote exclusive file folios if drop_recency can apply
> >  -v1:
> >  https://lore.kernel.org/linux-mm/20250412085852.48524-1-21cnbao@gmail.=
com/
> >
> >  include/linux/mm_types.h   |  1 +
> >  include/uapi/linux/prctl.h |  3 +++
> >  kernel/sys.c               | 16 ++++++++++++++++
> >  mm/huge_memory.c           | 12 ++++++++++--
> >  mm/internal.h              | 14 ++++++++++++++
> >  mm/memory.c                | 12 +++++++++++-
> >  6 files changed, 55 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > index 15808cad2bc1..84ab113c54a2 100644
> > --- a/include/linux/mm_types.h
> > +++ b/include/linux/mm_types.h
> > @@ -1733,6 +1733,7 @@ enum {
> >   * on NFS restore
> >   */
> >  //#define MMF_EXE_FILE_CHANGED       18      /* see prctl_set_mm_exe_f=
ile() */
> > +#define MMF_FADE_ON_DEATH    18      /* Recency is discarded on proces=
s exit */
>
> Why is recency not in the MMF name?  Why not MMF_NO_RECENCY or
> something?

I included RECENCY in the name but found it too long. On the other hand,
MMF_NO_RECENCY seems insufficient to convey the true meaning, since we
do have recency=E2=80=94it=E2=80=99s just lost on death. So perhaps the ori=
ginal, longer
names I considered are better: MMF_RECENCY_FADE_ON_DEATH or
MMF_NO_RECENCY_ON_DEATH?

>
> I guess we are back to no space in this flag.

Yes, it is 32 bits.

>
> >
> >  #define MMF_HAS_UPROBES              19      /* has uprobes */
> >  #define MMF_RECALC_UPROBES   20      /* MMF_HAS_UPROBES can be wrong *=
/
> > diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> > index 15c18ef4eb11..22d861157552 100644
> > --- a/include/uapi/linux/prctl.h
> > +++ b/include/uapi/linux/prctl.h
> > @@ -364,4 +364,7 @@ struct prctl_mm_map {
> >  # define PR_TIMER_CREATE_RESTORE_IDS_ON              1
> >  # define PR_TIMER_CREATE_RESTORE_IDS_GET     2
> >
> > +#define PR_SET_FADE_ON_DEATH                 78
> > +#define PR_GET_FADE_ON_DEATH                 79
> > +
> >  #endif /* _LINUX_PRCTL_H */
> > diff --git a/kernel/sys.c b/kernel/sys.c
> > index c434968e9f5d..cabe1bbb35a4 100644
> > --- a/kernel/sys.c
> > +++ b/kernel/sys.c
> > @@ -2658,6 +2658,22 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned lon=
g, arg2, unsigned long, arg3,
> >                       clear_bit(MMF_DISABLE_THP, &me->mm->flags);
> >               mmap_write_unlock(me->mm);
> >               break;
> > +     case PR_GET_FADE_ON_DEATH:
> > +             if (arg2 || arg3 || arg4 || arg5)
> > +                     return -EINVAL;
> > +             error =3D !!test_bit(MMF_FADE_ON_DEATH, &me->mm->flags);
> > +             break;
>
> Is there a usecase for get?

Probably not. I was just trying to implement put/get for a pair.
I=E2=80=99m happy to remove it if you feel it=E2=80=99s redundant.

>
> > +     case PR_SET_FADE_ON_DEATH:
>
> Could you just check the value prior to setting and just return if it's
> what you want?  In which case, the setting is just change_bit(), and
> there probably isn't a need for a get?

Ok.

>
> > +             if (arg3 || arg4 || arg5)
> > +                     return -EINVAL;
> > +             if (mmap_write_lock_killable(me->mm))
> > +                     return -EINTR;
> > +             if (arg2)
> > +                     set_bit(MMF_FADE_ON_DEATH, &me->mm->flags);
> > +             else
> > +                     clear_bit(MMF_FADE_ON_DEATH, &me->mm->flags);
> > +             mmap_write_unlock(me->mm);
> > +             break;
> >       case PR_MPX_ENABLE_MANAGEMENT:
> >       case PR_MPX_DISABLE_MANAGEMENT:
> >               /* No longer implemented: */
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 2780a12b25f0..c99894611d4a 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -2204,6 +2204,7 @@ static inline void zap_deposited_table(struct mm_=
struct *mm, pmd_t *pmd)
> >  int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
> >                pmd_t *pmd, unsigned long addr)
> >  {
> > +     bool drop_recency =3D false;
> >       pmd_t orig_pmd;
> >       spinlock_t *ptl;
> >
> > @@ -2260,13 +2261,20 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct=
 vm_area_struct *vma,
> >                       add_mm_counter(tlb->mm, mm_counter_file(folio),
> >                                      -HPAGE_PMD_NR);
> >
> > +                     drop_recency =3D zap_need_to_drop_recency(tlb->mm=
);
> >                       /*
> >                        * Use flush_needed to indicate whether the PMD e=
ntry
> >                        * is present, instead of checking pmd_present() =
again.
> >                        */
> > -                     if (flush_needed && pmd_young(orig_pmd) &&
> > -                         likely(vma_has_recency(vma)))
> > +                     if (flush_needed && pmd_young(orig_pmd) && !drop_=
recency &&
> > +                                     likely(vma_has_recency(vma)))
> >                               folio_mark_accessed(folio);
> > +                     /*
> > +                      * Userspace explicitly marks recency to fade whe=
n the process
> > +                      * dies; demote exclusive file folios to aid recl=
amation.
> > +                      */
> > +                     if (drop_recency && !folio_maybe_mapped_shared(fo=
lio))
> > +                             deactivate_file_folio(folio);
> >               }
> >
> >               spin_unlock(ptl);
> > diff --git a/mm/internal.h b/mm/internal.h
> > index 6b8ed2017743..af9649b3e84a 100644
> > --- a/mm/internal.h
> > +++ b/mm/internal.h
> > @@ -11,6 +11,7 @@
> >  #include <linux/khugepaged.h>
> >  #include <linux/mm.h>
> >  #include <linux/mm_inline.h>
> > +#include <linux/oom.h>
> >  #include <linux/pagemap.h>
> >  #include <linux/pagewalk.h>
> >  #include <linux/rmap.h>
> > @@ -130,6 +131,19 @@ static inline int folio_nr_pages_mapped(const stru=
ct folio *folio)
> >       return atomic_read(&folio->_nr_pages_mapped) & FOLIO_PAGES_MAPPED=
;
> >  }
> >
> > +/*
> > + * Returns true if the process attached to the mm is dying or undergoi=
ng
> > + * OOM reaping, and its recency=E2=80=94explicitly marked by userspace=
=E2=80=94will also
> > + * fade; otherwise, returns false.
> > + */
> > +static inline bool zap_need_to_drop_recency(struct mm_struct *mm)
>
> This name is confusing.  We are zapping the need to drop the recency? If
> this returns false, then the need to drop recency is false..  It is not
> very easy to read and harder to understand how it translates to the
> values it returns.
>
> How about mm_has_exit_recency(), like vma_has_recency()?
> Or mmf_update_recency()?

It seems mm_has_exit_recency() is good.

>
> > +{
> > +     if (!atomic_read(&mm->mm_users) || check_stable_address_space(mm)=
)
>
> FYI, failed forks may also set the address space as unstable.
>
> > +             return !!test_bit(MMF_FADE_ON_DEATH, &mm->flags);
> > +
> > +     return false;
> > +}
> > +
> >  /*
> >   * Retrieve the first entry of a folio based on a provided entry withi=
n the
> >   * folio. We cannot rely on folio->swap as there is no guarantee that =
it has
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 5a7e4c0e89c7..6dd01a7736a8 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -1505,6 +1505,7 @@ static __always_inline void zap_present_folio_pte=
s(struct mmu_gather *tlb,
> >               bool *force_flush, bool *force_break, bool *any_skipped)
> >  {
> >       struct mm_struct *mm =3D tlb->mm;
> > +     bool drop_recency =3D false;
> >       bool delay_rmap =3D false;
> >
> >       if (!folio_test_anon(folio)) {
> > @@ -1516,9 +1517,18 @@ static __always_inline void zap_present_folio_pt=
es(struct mmu_gather *tlb,
> >                               *force_flush =3D true;
> >                       }
> >               }
> > -             if (pte_young(ptent) && likely(vma_has_recency(vma)))
> > +
> > +             drop_recency =3D zap_need_to_drop_recency(mm);
> > +             if (pte_young(ptent) && !drop_recency &&
> > +                             likely(vma_has_recency(vma)))
>
>
> I really don't like that you are calling an atomic_read() and two flag
> checks every time this block of code it executed.  This must impact your
> performance?

Fair enough. That seems like a valid point to consider regarding atomic
operations.

>
> How about this:
> 1. Check in unmap_vmas() that the range is 0 - ULONG_MAX, and if the OOM
> flag is set.
> 2. set a new zap_flags_t flag (mmf_update_recency, maybe?) if
> test_bit(MMF_FADE_ON_DEATH)
> 3. check zap_details->zap_flags if that bit is set in this function.
> 4. (hopefully) profit with better performance :)
>
> Since this really is a zap flag, it fits to make it one.  It also means
> that you will not need to check an atomic and will only check the one
> flag as apposed to two.
>
> I think we can live with some user (probably syzbot) unmapping 0 -
> ULONG_MAX and incorrectly checking a flag and, in the very rare case of
> actually using this flag, does not do the correct LRU aging.  If you
> unmap everything, we can be pretty confident that you will be on the
> exit path rather quickly.

Good idea=E2=80=94let me give this a try.

>
> >                       folio_mark_accessed(folio);
> >               rss[mm_counter(folio)] -=3D nr;
> > +             /*
> > +              * Userspace explicitly marks recency to fade when the pr=
ocess dies;
> > +              * demote exclusive file folios to aid reclamation.
> > +              */
> > +             if (drop_recency && !folio_maybe_mapped_shared(folio))
> > +                     deactivate_file_folio(folio);
>
> Thanks,
> Liam
>

Thanks
Barry
