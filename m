Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE55664C6
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 09:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748944210; cv=none; b=EviAJpRCVwIlxzeqdi/veWOs2esG8OADPKyC4Ib9BQWeRIA/Jy7EaSHv4Pa8XOd/0GnzQtYca57iJcXfexKK9k4stL50SRyh9tcSghi53rOIxF/3myX0/pYulVBmKr+sYEoaaAx1N5SiRV4fBjRVU/wCxKgQTXpKNsJpp1sXL5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748944210; c=relaxed/simple;
	bh=ZMDdXWtRgteJCqeqXf7oIA+PnOJQx4oyfibMSO/WRZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=taIh05hF/X2yXjbiqQUIp1cR8v+nVJzdaxoSJhI8Gi+vZtLivw8lq9WlgnLduVRPAT16e/b9uW9/bf6HFymthna3KYOHBUURQnOyNXWcu3mQeFPs5eAEfGuAiGeeE+Sbfc2r9F+9zaw65sFWu6W4COv9TCRQyw06NL/+6SzxGIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hi9c4Hgs; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hi9c4Hgs"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-87ded588c8eso1269337241.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 02:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748944207; x=1749549007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+akt4Dp6cmOPFSL8kMH30g7Rp+2DiyUojQn0D3oWqI=;
        b=Hi9c4Hgs4NwaXAxNX2CAto5eRH2uTEx6XkzLs09oxhUtxQrwQH5VJcr2fttURdvScU
         X6TdwsLjsYqO22tSGFREWIj2yGWtllGDOVLfjExNnQKSeIYfBZFxUzRgb6dKlV+f1uQ7
         CQMF/HcfstmDviqckH0kofnbPXordl0+VTSNOtJxrukLWKs3r+mxNTLDmZz4bBXBsUEh
         KxZrwilsIijLOtizqK5Xn2ID0ECYj6txpmAydH7OO3MscbdXFe+VKiQW9ezHbCHWispR
         WAzEpK+n5DRimxvbZ9bJbWi4quM29yPcZQq5NDnEOBoW0aoCXtmINiIgRBUCkEJyBWQy
         NsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748944207; x=1749549007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+akt4Dp6cmOPFSL8kMH30g7Rp+2DiyUojQn0D3oWqI=;
        b=kX36OuT/zPuItH9sftkx/J3pbb6nSP+47zipI7QO9mzekIJ4mXj/3RGMDHc6sHjVyC
         692DrDYN0tTxTsTZ8S1PxAp0fIEUexBoDF8P0Y4kKvb7qUmxZ6xlvJO1P90CnD+r1rdv
         NC+FnWEj+UblZcu2HJJGVm/z1+3Vgj0DpXH21lHVLMeFWJ4H+SR5tEPHPEoA8z2FugQ3
         rZQsoBtoCz3Q+tnSyKj2fL8tO3msUR9Wth+mMyjtHKYTKWLmFIV9sxv4fthmvUh0CJdA
         v4fr5NN2mLxC/fzxa6cKflTJ+YbtvMIfWyolER9fP03NxojaPAlh9mzYIdecVbxPrQvr
         wAOw==
X-Forwarded-Encrypted: i=1; AJvYcCXUeWJmO9hYi7uZA746czGQ0jTBnMmgBikFjRHxwcR2JrQ1UEUUz2XjRuPuMIxRjxbTlnOvn+JRBntsCK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwisETVHI54GMqm0Cu7OsMrwSEF6w18Dd1ob4EDG5M4Y9UQnlUo
	VSYbFGte5SQKZIZbh6Dj7YX0R0wGs1jaz5ek7Ez7XoDwsWo/kOumu5tzNsKjR2eqVDor3y7JDq6
	pVk55Je8tFmz+dZnwZlwCdWKTWv29Aec=
X-Gm-Gg: ASbGncvAS1001FELEZviH4TiD5c+4pIvvLa5fycT4x7DKDHbo63rkoD/ZgxeouWHdxq
	IM/VHe4CYvmt7hPXZgOoaDSZ4bJiM/9US2ilMyO1pJzo6G+qmr3AZGy9iw1WoViI1vQeOiKrnO2
	P3b72joLIQIiiDFBhjBwKyAtWi1Mn8bXyYrnZuEZlasen2
X-Google-Smtp-Source: AGHT+IGdphO3eSjpshfA1ahQtVxmSC0SjGRr0bfVfc6RhBBzixX2doriuCFFelSDmFBYmpd4w0OdVdQjoqLM/q838Cg=
X-Received: by 2002:a05:6102:3a0b:b0:4e5:a398:b6fa with SMTP id
 ada2fe7eead31-4e6ecd2e74fmr12727388137.3.1748944207155; Tue, 03 Jun 2025
 02:50:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530152445.2430295-1-ryan.roberts@arm.com>
In-Reply-To: <20250530152445.2430295-1-ryan.roberts@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 3 Jun 2025 21:49:55 +1200
X-Gm-Features: AX0GCFvnuBi9XQmk2yPV4q8ADSSK-euG69kT8A6SLKTtKahFIzprIUZvZjsk9F8
Message-ID: <CAGsJ_4wfhA6C2dV+a=dnx=EKRmrt80ujrh6KrepJ_P8JqCbPnw@mail.gmail.com>
Subject: Re: [PATCH v1] arm64/mm: Close theoretical race where stale TLB entry
 remains valid
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 3:24=E2=80=AFAM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:
>
> Commit 3ea277194daa ("mm, mprotect: flush TLB if potentially racing with
> a parallel reclaim leaving stale TLB entries") describes a race that,
> prior to the commit, could occur between reclaim and operations such as
> mprotect() when using reclaim's tlbbatch mechanism. See that commit for
> details but the summary is:
>
> """
> Nadav Amit identified a theoritical race between page reclaim and
> mprotect due to TLB flushes being batched outside of the PTL being held.
>
> He described the race as follows:
>
>         CPU0                            CPU1
>         ----                            ----
>                                         user accesses memory using RW PTE
>                                         [PTE now cached in TLB]
>         try_to_unmap_one()
>         =3D=3D> ptep_get_and_clear()
>         =3D=3D> set_tlb_ubc_flush_pending()
>                                         mprotect(addr, PROT_READ)
>                                         =3D=3D> change_pte_range()
>                                         =3D=3D> [ PTE non-present - no fl=
ush ]
>
>                                         user writes using cached RW PTE
>         ...
>
>         try_to_unmap_flush()
> """
>
> The solution was to insert flush_tlb_batched_pending() in mprotect() and
> friends to explcitly drain any pending reclaim TLB flushes. In the
> modern version of this solution, arch_flush_tlb_batched_pending() is
> called to do that synchronisation.
>
> arm64's tlbbatch implementation simply issues TLBIs at queue-time
> (arch_tlbbatch_add_pending()), eliding the trailing dsb(ish). The
> trailing dsb(ish) is finally issued in arch_tlbbatch_flush() at the end
> of the batch to wait for all the issued TLBIs to complete.
>
> Now, the Arm ARM states:
>
> """
> The completion of the TLB maintenance instruction is guaranteed only by
> the execution of a DSB by the observer that performed the TLB
> maintenance instruction. The execution of a DSB by a different observer
> does not have this effect, even if the DSB is known to be executed after
> the TLB maintenance instruction is observed by that different observer.
> """
>
> arch_tlbbatch_add_pending() and arch_tlbbatch_flush() conform to this
> requirement because they are called from the same task (either kswapd or
> caller of madvise(MADV_PAGEOUT)), so either they are on the same CPU or
> if the task was migrated, __switch_to() contains an extra dsb(ish).
>
> HOWEVER, arm64's arch_flush_tlb_batched_pending() is also implemented as
> a dsb(ish). But this may be running on a CPU remote from the one that
> issued the outstanding TLBIs. So there is no architectural gurantee of
> synchonization. Therefore we are still vulnerable to the theoretical
> race described in Commit 3ea277194daa ("mm, mprotect: flush TLB if
> potentially racing with a parallel reclaim leaving stale TLB entries").

Hi Ryan,

Sorry for bringing up another question late, but your explanation made me
reconsider whether I might also be wrong in arch_tlbbatch_flush(). Specific=
ally,
try_to_unmap_flush() needs to ensure that all TLBI operations from other CP=
Us
for all involved memory contexts have completed. However, as you pointed
out, a DSB ISH alone cannot guarantee this.

This makes me wonder if we should take inspiration from RISC-V or x86 and u=
se a
cpumask to track all CPUs that have pending TLBIs. Then, we could use IPIs =
to
explicitly request those CPUs to issue DSB ISH, ensuring their TLB
invalidations are fully completed.

I mean something similar to what x86 and RISC-V do, but using just a
simpler approach like issuing DSB ISH on the relevant CPUs.

void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
{
        on_each_cpu_mask(&batch->cpumask, __ipi_flush_tlbi, NULL, NULL);
        cpumask_clear(&batch->cpumask);
}

static void __ipi_flush_tlbi(void *info)
{
        dsb(ish);
}

Sorry for the mess I made earlier.

>
> Fix this by flushing the entire mm in arch_flush_tlb_batched_pending().
> This aligns with what the other arches that implement the tlbbatch
> feature do.
>
> Fixes: 43b3dfdd0455 ("arm64: support batched/deferred tlb shootdown durin=
g page reclamation/migration")
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/tlbflush.h | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/t=
lbflush.h
> index eba1a98657f1..7d564c2a126f 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -323,13 +323,14 @@ static inline bool arch_tlbbatch_should_defer(struc=
t mm_struct *mm)
>  }
>
>  /*
> - * If mprotect/munmap/etc occurs during TLB batched flushing, we need to
> - * synchronise all the TLBI issued with a DSB to avoid the race mentione=
d in
> - * flush_tlb_batched_pending().
> + * If mprotect/munmap/etc occurs during TLB batched flushing, we need to=
 ensure
> + * all the previously issued TLBIs targeting mm have completed. But sinc=
e we
> + * can be executing on a remote CPU, a DSB cannot guarrantee this like i=
t can
> + * for arch_tlbbatch_flush(). Our only option is to flush the entire mm.
>   */
>  static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
>  {
> -       dsb(ish);
> +       flush_tlb_mm(mm);
>  }
>
>  /*
> --
> 2.43.0
>

Thanks
Barry
