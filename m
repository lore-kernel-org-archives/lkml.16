Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA2F8821
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 01:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748915767; cv=none; b=gaVIu4Z/GuhPyuVoMhj1ocUPw/Q2F+58rDr/t08D/3s2HYz3XZ9CFB2UUB9mBYlCyNlTstL5r6nVZLXlFoqI8kfolBGrggh813zI0FKfNS2p9vO1A0Okc+uy8xZkigTz7ViCeXj/9VYB/GMknRN024BwIPyQE88fewtAfiTImxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748915767; c=relaxed/simple;
	bh=gk3zfkmAoeD6qX6HjvVBFlNWyoDhuHtYGOXvCTI3R3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CuDSM+7byV9IJBEaadXuWZfL4Thj8ReTSLV7ZcTowGKfaMeeRDZvcDkVBQ+Bpkqpbgm/8ISsEsdngGeOD+SJXl0UaJgl4393Q5fNzPh02mmOZUPlRKePV7GMh+KqvyGNaPdGc1udACRdkFUO4JUnWFKP81xL3Cr4MaY7qtW1GVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gj9PMC98; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gj9PMC98"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-87df048fda8so2453936241.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 18:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748915765; x=1749520565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjwz7K+3C5Y9HHx06yESpqFLa2bL0hzbV0H1wyWAxzY=;
        b=gj9PMC98OEy0uuCpPpin2DutjfVgSlCuPlcH2qoueqt1havJk2hu5Zg2TGP0ttPvmq
         DwYKTBIwhC9u3dEWXEoQJTBhCBeAeejQccYJa+Hrr+m4R7kT37qcG53iTTAhWwx9BFzG
         LTw7HE75ASQkk0lXbljZEOlHW3WBqeN8TFnclNttvK5Niw8U3ygJZcK97X7AO1z/BhSd
         cx1YZkG4DZnesME4YIahkDBhcXKE2aUQvidsWF/40QE3xPcNI+EQ56isoW4/Kl/UoVSU
         TXO67L8+H/RIv812cI3uAItaRkrpx8t11cMGK9tgCZwf7VxcjU435s6/E+c5njsalJUW
         vr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748915765; x=1749520565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjwz7K+3C5Y9HHx06yESpqFLa2bL0hzbV0H1wyWAxzY=;
        b=liDNswUGl4ovDhVblF9WAsSsIaqtwwZfoA8MwzFnMouxshtIOxHpZuRQe3KncktSh9
         0MIQOQINVhcKvT8l3LJLZg8r37iyfx5qFO9LsWqYpXY5S5GTErUhnPFMYcGmMoPXsxlk
         A/h8kdnPWtLogt1WifcjBDL1v7JOY8hPE3lATAFw990g9zzzdutfwVAkg8xpXKWHf1VG
         Y0kBS/Q98WL6pjLCqw3bUtPmFyzwUqFLJOKOIFvIaUdMaTuuTa19VUwb9+3r8ppvsoBw
         BIbhPT46yTMBdavjcA+GP1fC7f7/SZzviLI0BTKy6y2pH8svZl/NSxlW/CKgPZETmo11
         hIXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh9MXq1jtp0qbh53DLG1bkmKsiCBmBS8pNpFfMchmYegolLtvhJMOQXYH/lQd8aW7sN+FYgLECHfj872g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV77F6m9MQcbch8Z83Ld3x3ShzxZpi7ej2lW274NP6XnU9tYSH
	VK7f38jNK2shiP2DbZ5ER2Gru64+Bx0oxgc7cYRnOvst6tecBUjWF2kmvxM90LhzepIcyRMLbmR
	YGPkVVLpyr/4GHmCvArLF6Kln4FGgVjv/aMOV
X-Gm-Gg: ASbGnct7RoZ/ctdKkhsiHw8TZCz1XTcGaEs+p7DDXBe+yjXDHGhsx2LUAM4ghWitpVJ
	ypqvqaxJ/K7cUgJUEjCUx236KGBj4bEFMvT2gn+1MCa2Z33/KqBbA8REVxCcjABc1dudTu2JZML
	OaG7gDAEh3p8nUkKyv7Wqs3Gq8RAv+CmX4xw==
X-Google-Smtp-Source: AGHT+IE0T9BO6q1wzLTJ95JtVQFrX3//75v+ctXp12UmlWdewLG/VBORVzYwyBSCoOuDuKGPa7/9WY/NaGFUHwwFnzk=
X-Received: by 2002:a05:6102:cd3:b0:4e5:a837:b0d2 with SMTP id
 ada2fe7eead31-4e701a2842emr8699909137.3.1748915742691; Mon, 02 Jun 2025
 18:55:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530152445.2430295-1-ryan.roberts@arm.com>
 <20250602120042.GB1227@willie-the-truck> <8ef5cadd-2f9b-4a19-a85c-18e17d7edfbc@arm.com>
In-Reply-To: <8ef5cadd-2f9b-4a19-a85c-18e17d7edfbc@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 3 Jun 2025 13:55:31 +1200
X-Gm-Features: AX0GCFuxwlQ8o1crYF9fsectv4nxVSCChPH3dMA3wh1aXX5xOBowo2lsIa0tFBM
Message-ID: <CAGsJ_4zZdfgiy0k+kK3Gqg5KvuFs8Rx3zQXLhkLk-K-+Hf0grw@mail.gmail.com>
Subject: Re: [PATCH v1] arm64/mm: Close theoretical race where stale TLB entry
 remains valid
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Mel Gorman <mgorman@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 2:00=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.com> =
wrote:
>
> On 02/06/2025 13:00, Will Deacon wrote:
> > On Fri, May 30, 2025 at 04:23:47PM +0100, Ryan Roberts wrote:
> >> Commit 3ea277194daa ("mm, mprotect: flush TLB if potentially racing wi=
th
> >> a parallel reclaim leaving stale TLB entries") describes a race that,
> >> prior to the commit, could occur between reclaim and operations such a=
s
> >> mprotect() when using reclaim's tlbbatch mechanism. See that commit fo=
r
> >> details but the summary is:
> >>
> >> """
> >> Nadav Amit identified a theoritical race between page reclaim and
> >> mprotect due to TLB flushes being batched outside of the PTL being hel=
d.
> >>
> >> He described the race as follows:
> >>
> >>      CPU0                            CPU1
> >>      ----                            ----
> >>                                      user accesses memory using RW PTE
> >>                                      [PTE now cached in TLB]
> >>      try_to_unmap_one()
> >>      =3D=3D> ptep_get_and_clear()
> >>      =3D=3D> set_tlb_ubc_flush_pending()
> >>                                      mprotect(addr, PROT_READ)
> >>                                      =3D=3D> change_pte_range()
> >>                                      =3D=3D> [ PTE non-present - no fl=
ush ]
> >>
> >>                                      user writes using cached RW PTE
> >>      ...
> >>
> >>      try_to_unmap_flush()
> >> """
> >>
> >> The solution was to insert flush_tlb_batched_pending() in mprotect() a=
nd
> >> friends to explcitly drain any pending reclaim TLB flushes. In the
> >> modern version of this solution, arch_flush_tlb_batched_pending() is
> >> called to do that synchronisation.
> >>
> >> arm64's tlbbatch implementation simply issues TLBIs at queue-time
> >> (arch_tlbbatch_add_pending()), eliding the trailing dsb(ish). The
> >> trailing dsb(ish) is finally issued in arch_tlbbatch_flush() at the en=
d
> >> of the batch to wait for all the issued TLBIs to complete.
> >>
> >> Now, the Arm ARM states:
> >>
> >> """
> >> The completion of the TLB maintenance instruction is guaranteed only b=
y
> >> the execution of a DSB by the observer that performed the TLB
> >> maintenance instruction. The execution of a DSB by a different observe=
r
> >> does not have this effect, even if the DSB is known to be executed aft=
er
> >> the TLB maintenance instruction is observed by that different observer=
.
> >> """
> >>
> >> arch_tlbbatch_add_pending() and arch_tlbbatch_flush() conform to this
> >> requirement because they are called from the same task (either kswapd =
or
> >> caller of madvise(MADV_PAGEOUT)), so either they are on the same CPU o=
r
> >> if the task was migrated, __switch_to() contains an extra dsb(ish).
> >>
> >> HOWEVER, arm64's arch_flush_tlb_batched_pending() is also implemented =
as
> >> a dsb(ish). But this may be running on a CPU remote from the one that
> >> issued the outstanding TLBIs. So there is no architectural gurantee of
> >> synchonization. Therefore we are still vulnerable to the theoretical
> >> race described in Commit 3ea277194daa ("mm, mprotect: flush TLB if
> >> potentially racing with a parallel reclaim leaving stale TLB entries")=
.
> >>
> >> Fix this by flushing the entire mm in arch_flush_tlb_batched_pending()=
.
> >> This aligns with what the other arches that implement the tlbbatch
> >> feature do.
> >>
> >> Fixes: 43b3dfdd0455 ("arm64: support batched/deferred tlb shootdown du=
ring page reclamation/migration")
> >
> > Barry -- it would be great if you could re-run some of the benchmarks
> > from that commit with this fix applied.
>
> Worth rerunning if possible, but I would guess that those benchmarks will=
 still
> show the similar improvement because they are measuring the cost of doing=
 the
> TLB flushing. But with the fix, there is an extra cost that those benchma=
rks
> probably won't measure; subsequent work within the target mm will have no=
 VAs
> cached in the TLB so the miss rate will be much higher.

Right, not sure if we have a suitable benchmark to measure the
side effect, but I assume reclamation speed is more important
when we're reclaiming memory.

This was originally introduced in commit 3ea277194daae
("mm, mprotect: flush TLB if potentially racing with a parallel
reclaim leaving stale TLB entries").

Cc'ing Mel to see if he has any comments.

>
> >
> >> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> >> ---
> >>  arch/arm64/include/asm/tlbflush.h | 9 +++++----
> >>  1 file changed, 5 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/as=
m/tlbflush.h
> >> index eba1a98657f1..7d564c2a126f 100644
> >> --- a/arch/arm64/include/asm/tlbflush.h
> >> +++ b/arch/arm64/include/asm/tlbflush.h
> >> @@ -323,13 +323,14 @@ static inline bool arch_tlbbatch_should_defer(st=
ruct mm_struct *mm)
> >>  }
> >>
> >>  /*
> >> - * If mprotect/munmap/etc occurs during TLB batched flushing, we need=
 to
> >> - * synchronise all the TLBI issued with a DSB to avoid the race menti=
oned in
> >> - * flush_tlb_batched_pending().
> >> + * If mprotect/munmap/etc occurs during TLB batched flushing, we need=
 to ensure
> >> + * all the previously issued TLBIs targeting mm have completed. But s=
ince we
> >> + * can be executing on a remote CPU, a DSB cannot guarrantee this lik=
e it can
> >> + * for arch_tlbbatch_flush(). Our only option is to flush the entire =
mm.
> >>   */
> >>  static inline void arch_flush_tlb_batched_pending(struct mm_struct *m=
m)
> >>  {
> >> -    dsb(ish);
> >> +    flush_tlb_mm(mm);
> >>  }
> >
> > Thanks, Ryan. I'll pick this as a fix, but perhaps the core code should
> > do this given that all the architectures selecting
> > ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH now have an identical implementation
> > of arch_flush_tlb_batched_pending()?
>
> Ha, yes... infact it looks like that's what it did prior to commit db6c1f=
6f236d
> ("mm/tlbbatch: introduce arch_flush_tlb_batched_pending()").

Yep, it was just a flush_tlb_mm(mm) inside flush_tlb_batched_pending().

>
> I'll do that tidy up once this fix appears in mm-unstable.
>
> Thanks,
> Ryan
>
>
> >
> > Will
>

Thanks
Barry
