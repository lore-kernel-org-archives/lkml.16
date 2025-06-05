Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9361FE44D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749110382; cv=none; b=drADZynEMRFxP5CkihRIBMvkZUPAHBT5AbanPsHpH4Ryl4b+e+0G3qRalVUHZ+bqbp2WppNtCzBcxDUy5ZiWwX+28+CRmnDR7TmYO9u/UJ/Z74SWNIlPJkpNroV+PkVc3SPlpv+sdypzhuMut9GZF7wPwZod+XWWWP9qQ6MB/8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749110382; c=relaxed/simple;
	bh=a2/CVQAjIR60WTMMzxWbGVeRq/hOePNljug5w5dqhS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZCpDPULOGC993ICuyA1iGSGVehzcl+WquFEi9NfqI0iNsElZOGVn5cQtG3+DYBja1W0U8SCaaTJtL6RFmtLC7CYyArVoqq9KNFyZXNGlYmt22TPurvj7exsWP9o0yQg4/7pINO4eJbIl25nwC3Kp4ZXYUBqpgoF4HxTDrWLKoZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0if4epi; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0if4epi"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-52b2290e292so241850e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 00:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749110379; x=1749715179; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIXoZ8nnG6zKXvBD8hYHXvLPlGzG2L6Za+aocYQ9cfw=;
        b=Q0if4epiuORFjdK5tEAX4o2kTHWLyxzXyjYat+7Mg3WWGog2yGfInB1zsGhHY4/1T/
         KfJZ17HrRzMhuERjw2aH3fgk1606QiHDD1KRw9ujXaanUOlRoHxlRTcfc803Zbh//WPR
         DB0yKY7zyzMutAxbDXcCqaVumUSDdp/tO6ALyBEGBXBTQqoExGp+y+t8LcefGTmE55ZU
         Zg3srcKhy8gmTPRx2kIgPZc3+A8BQ7knBvWMdsB5EWOQXT29t04c8YH57fScksME/8xj
         u8jbvIQBWg9uiokEJiamFc4KrLt6HZvDaZkdNr//kUOK9lf/TrOBoheQBjMYJtLBk4D6
         MGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749110379; x=1749715179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIXoZ8nnG6zKXvBD8hYHXvLPlGzG2L6Za+aocYQ9cfw=;
        b=BTFIeXzMnGJfpnYRpX0lQbIEJCeNv2Ah4jftbIAmY3PnCj72toswM8LGPfcROQBnbQ
         J5+y2A/PPD9JKBEc/hbzWxW83i9HUiRLJAq4Y78QF+fpTSufskefPS8VAZkeLMDGfHz8
         12HsT1VkfAjCdsac0nAgF/Cb3nuLfVTjnt9a9Qwu0giBFjguT8qEyVkkf15JOhLQU8hD
         58v66Botvg3UmQZ4NxqLixLJboOZCgg3Vts8dCbrLnSMmOLb5bdxokf4G7ki30EVSmDh
         egkoW8PJDBw6caOTmw2/IAruswgh7/xVSSYdnXM76KXEn+g5gmJ1l0u3HfdnI1F0VYy0
         4UvA==
X-Forwarded-Encrypted: i=1; AJvYcCVszWOTBEuySCgnSnOr6LC6Qc0YQBtNi4r8U7QoF5/s36kjqLwgUF+QOJvRfQVKXhw8iglyxvTJJu01Au8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAxR4zocyaID+QepRqVttIGp26DGM9t5vhYGAOaTDmBzMHQ++7
	fvWjWW2rP6HnIiiLsu8D78US9D/ekCnW+qbFYFTtRmx7JjbEBqjvNrIuJRoWcK6PBjtt6reHD6z
	IcOlRS2qHKIHBbe9NE8Guzb6z0rnxDPo=
X-Gm-Gg: ASbGncsZnSJXf5Wk9z4WyXcu5ao3oXQzkLlnZ0a3Z+c3pll66VNcII/rAkFsWb6tf7q
	YVlASADYPSpYY9STZgjpb18f8q3qGX8LpZvmq4ohaXpATpnMoQx54IMdtg3wiBIq4MB8JRnHS5P
	dFd9lAZ2NV6mqhqPqsUmxqQPvmBgQrf/KiZg==
X-Google-Smtp-Source: AGHT+IGD1VWwlaV9ZhRp/8D2WO1IzmDAledYMtYdxA5w0p2HGkI8w+20Zc5VcEKdQ1kaVVfw8TiY6UdV0u8G7Hcu04E=
X-Received: by 2002:a05:6122:1d0f:b0:530:6dc2:ba9c with SMTP id
 71dfb90a1353d-530c7277cf7mr5533878e0c.2.1749110379470; Thu, 05 Jun 2025
 00:59:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530152445.2430295-1-ryan.roberts@arm.com>
 <CAGsJ_4wfhA6C2dV+a=dnx=EKRmrt80ujrh6KrepJ_P8JqCbPnw@mail.gmail.com> <96266c85-0a17-4291-8147-867925cac7ca@arm.com>
In-Reply-To: <96266c85-0a17-4291-8147-867925cac7ca@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 5 Jun 2025 19:59:28 +1200
X-Gm-Features: AX0GCFu-NeKAfhhcYcVhf3vSCPP-_eYGIgeZ7mHBWdE7DMc26rnYrXdIXoJNJwk
Message-ID: <CAGsJ_4wtbKb_q-QC1zXEtVkepp5ZumMKVAAQ_9YXS3CwR8dK2Q@mail.gmail.com>
Subject: Re: [PATCH v1] arm64/mm: Close theoretical race where stale TLB entry
 remains valid
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 10:32=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:
>
> On 03/06/2025 10:49, Barry Song wrote:
> > On Sat, May 31, 2025 at 3:24=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.=
com> wrote:
> >>
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
> >>         CPU0                            CPU1
> >>         ----                            ----
> >>                                         user accesses memory using RW =
PTE
> >>                                         [PTE now cached in TLB]
> >>         try_to_unmap_one()
> >>         =3D=3D> ptep_get_and_clear()
> >>         =3D=3D> set_tlb_ubc_flush_pending()
> >>                                         mprotect(addr, PROT_READ)
> >>                                         =3D=3D> change_pte_range()
> >>                                         =3D=3D> [ PTE non-present - no=
 flush ]
> >>
> >>                                         user writes using cached RW PT=
E
> >>         ...
> >>
> >>         try_to_unmap_flush()
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
> >
> > Hi Ryan,
> >
> > Sorry for bringing up another question late, but your explanation made =
me
> > reconsider whether I might also be wrong in arch_tlbbatch_flush(). Spec=
ifically,
> > try_to_unmap_flush() needs to ensure that all TLBI operations from othe=
r CPUs
> > for all involved memory contexts have completed. However, as you pointe=
d
> > out, a DSB ISH alone cannot guarantee this.
>
> Hmm, does try_to_unmap_flush() actually need to ensure that *all* pending=
 TLBIs
> are completed, or does it only need to ensure that the TLBIs previously i=
ssued
> by the same instance of shrink_folio_list() are completed?
>
> I understood it to be the latter and therefore thought the current
> arch_tlbbatch_flush() was safe.
>
> If another instance has concurrently queued up some TLBIs using tlbbatch =
(i.e.
> MADV_PAGEOUT) then the first instance would never see those PTEs so I don=
't
> think it matters that the TLB flush is still pending? Perhaps I'm wrong..=
.

You're right =E2=80=94 I got a bit scared that day. As long as each thread =
can
flush the pending TLBI for its own folio list, it's all good.

>
> >
> > This makes me wonder if we should take inspiration from RISC-V or x86 a=
nd use a
> > cpumask to track all CPUs that have pending TLBIs. Then, we could use I=
PIs to
> > explicitly request those CPUs to issue DSB ISH, ensuring their TLB
> > invalidations are fully completed.
> >
> > I mean something similar to what x86 and RISC-V do, but using just a
> > simpler approach like issuing DSB ISH on the relevant CPUs.
> >
> > void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
> > {
> >         on_each_cpu_mask(&batch->cpumask, __ipi_flush_tlbi, NULL, NULL)=
;
> >         cpumask_clear(&batch->cpumask);
> > }
> >
> > static void __ipi_flush_tlbi(void *info)
> > {
> >         dsb(ish);
> > }
>
> My initial instinct is yuk :). I guess we would need to do a bunch of
> benchmarking if this is needed. But would be good to avoid if possible. L=
et's
> figure out if we definitely have a race first...
>
> Thanks,
> Ryan
>
> >
> > Sorry for the mess I made earlier.
>
> No worries, it happens.
>
> >
> >>
> >> Fix this by flushing the entire mm in arch_flush_tlb_batched_pending()=
.
> >> This aligns with what the other arches that implement the tlbbatch
> >> feature do.
> >>
> >> Fixes: 43b3dfdd0455 ("arm64: support batched/deferred tlb shootdown du=
ring page reclamation/migration")
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
> >> -       dsb(ish);
> >> +       flush_tlb_mm(mm);
> >>  }
> >>
> >>  /*
> >> --
> >> 2.43.0
> >>
> >

Thanks
Barry
