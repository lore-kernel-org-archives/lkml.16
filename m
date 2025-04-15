Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEE7218EB7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 22:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744754500; cv=none; b=XedBSB7VqY0X/R5f+9Qq5239M+n8G59xYSvnsAUTQWyvTcEsBGSoWmezNzHl7BNSCNXX2CjNX740AxIzqbmkh25onMMn8EeTeaiYw9BQBoAed1Y7NY0dBMruwlLQNBkMx8U1k2nqYCQ+2mZAUhhpgT/U1UFjwRBs3fkpOqEUUY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744754500; c=relaxed/simple;
	bh=2yGLZDf4dtyDLmCwgjHDpb8h8mRuJ4W+0E8WP7YPPkk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PVnUfvsZFHV7CcLLehCU6X4+srRupC7dYOe/4Qxg0AB+prCzQD/e6DdVzmZoXbX7ZvJvVUX0aV1iM68sFjYwuCjBnkUD/NhqwNG2KCha1lOfidkYt1PARLCp1FyZHRJcF1p3MOQyXmOyIgiZ9LFS+3gZ1SSkCQTunPkQnh0kz5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PX0qk2tJ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PX0qk2tJ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so1062759166b.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744754496; x=1745359296; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzBIIjRstBjUGatoAF70eCAeCOGJFOM1m+yPUqXEbbM=;
        b=PX0qk2tJIvk5axqQOg0lcK0f8Ws1fn3OyMbRK65NjnkHmSbrJDzgvPslREFPGpd7Rt
         VY6ROg9ysW9I4br0qMmHLOqPM7XmPJaEh4q+sL7tHV7cOoPRzjQEJ5QDEj2bEhh9BqVP
         Jb8tN6YfR6bq2mAuFNcQdUYBckw9P/cd3ojppRhobQpXcSbKNU4l0GfWCP2gDuRSzrw9
         pgT2PYSTg+QpvsuCO/rsRyCYuMLeVN+RL4JvHRfxPtpgcgP8NbrwIrXjMyljsWcSw1dh
         W9EI2vJz6Ysa0QnIxjZg3BuQRtli4ypHiDqO+fcRsD52DqU7TGRiE8FnY+cAWl3YjEfT
         UPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744754496; x=1745359296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WzBIIjRstBjUGatoAF70eCAeCOGJFOM1m+yPUqXEbbM=;
        b=jjVMhJtIn/qU6QEWMtYCn0okFLuqyuy6bdQUcT8g7yKE7/YTKEMpjid9ggToD++Ovf
         NfsD/HKpw8G0d5sMfZ0euDDpN5SXGyuUoG0edlFyh+dmHmDWJhf8520A2Sy+TuApmR8z
         C7dijkb9eIpDpBalQAWnbc+gA8wqPvFCdJdzvjSTK0Rs0fp81S2LBO3FNPBs+yTUjlzb
         bsDJp/hIQv8S0x9JKlRewlH59XLopVlQKmWqzkXDPwCI8o/YQ0Qnlx+1HE+Fyswfg/xk
         j7opsPvKAHZihYyGX9LF31SMhG08pVR3QuuhH+nvv7YryKjlYKaVeh0qUhhaK55LTbyX
         fB4Q==
X-Gm-Message-State: AOJu0YxYt2gJjBPNdDJDfDlmRFFsL77qUy6jDOr6kzTSKnHlP/D5emyX
	vCKI+A3olxbMjVFe6az0VVP/sHL/pzKyO7O1qutl+pCnYQvfHd1v6H8O7WJuikZz8ONF8YObUg3
	Wt54XLrrjgj2XBteau6L9FKFiUFM=
X-Gm-Gg: ASbGncvP5BnqQouDTFjxFOuTwXjrugncYP076QDlEXWw8CluWNOG8VQQ0Aq2Np160U+
	JwaD5l3g3JdCnQ7fc+JUQiEm9ZbvmDwXGQyv81X9/MkRPRdUB3J9XYI+JH1mgY3JVEshGI0EoQR
	unGt5R/Y2g8LYTD+fWvGIT0A==
X-Google-Smtp-Source: AGHT+IF4ukabCLDIf0KE5pOl2z39ZOppMtyc2OarR1QkfiUwVVaVjTy16FNzVrIisCEl9+V16MC3ApYdH8+KJxxocEw=
X-Received: by 2002:a17:907:97d4:b0:ac3:26ff:11a0 with SMTP id
 a640c23a62f3a-acb384f1d46mr62728566b.38.1744754495980; Tue, 15 Apr 2025
 15:01:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <20250414034607.762653-5-ankur.a.arora@oracle.com> <mp6sg35nbmjzahnlkstw7y7n2cbcz3waqcthz27ciyc7fmki3s@jws4rtvqyds4>
 <87tt6pw11t.fsf@oracle.com>
In-Reply-To: <87tt6pw11t.fsf@oracle.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 16 Apr 2025 00:01:24 +0200
X-Gm-Features: ATxdqUGzzGCbuCA9AHhziS55e9h5zJvWoHt4Y0ZYlQjrLY25ubTnJ8jZRp8W8t4
Message-ID: <CAGudoHEuRgDEHQOAsK=SmFu29a3NUyLDL1r5PVuahxbdOR6jZg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] x86/folio_zero_user: multi-page clearing
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org, 
	torvalds@linux-foundation.org, akpm@linux-foundation.org, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com, luto@kernel.org, 
	peterz@infradead.org, paulmck@kernel.org, rostedt@goodmis.org, 
	tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com, bharata@amd.com, 
	raghavendra.kt@amd.com, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 11:46=E2=80=AFPM Ankur Arora <ankur.a.arora@oracle.=
com> wrote:
>
>
> Mateusz Guzik <mjguzik@gmail.com> writes:
>
> > On Sun, Apr 13, 2025 at 08:46:07PM -0700, Ankur Arora wrote:
> >> clear_pages_rep(), clear_pages_erms() use string instructions to zero
> >> memory. When operating on more than a single page, we can use these
> >> more effectively by explicitly advertising the region-size to the
> >> processor, which can use that as a hint to optimize the clearing
> >> (ex. by eliding cacheline allocation.)
> >>
> >> As a secondary benefit, string instructions are typically microcoded,
> >> and working with larger regions helps amortize the cost of the decode.
> >>
> >> When zeroing the 2MB page, maximize spatial locality by clearing in
> >> three sections: the faulting page and its immediate neighbourhood, the
> >> left and the right regions, with the local neighbourhood cleared last.
> >>
> >> Performance
> >> =3D=3D
> >>
> >> Use mmap(MAP_HUGETLB) to demand fault a 64GB region on the local
> >> NUMA node.
> >>
> >> Milan (EPYC 7J13, boost=3D0, preempt=3Dfull|lazy):
> >>
> >>                  mm/folio_zero_user    x86/folio_zero_user     change
> >>                   (GB/s  +- stddev)      (GB/s  +- stddev)
> >>
> >>   pg-sz=3D2MB       11.89  +- 0.78%        16.12  +-  0.12%    +  35.5=
%
> >>   pg-sz=3D1GB       16.51  +- 0.54%        42.80  +-  3.48%    + 159.2=
%
> >>
> >> Milan uses a threshold of LLC-size (~32MB) for eliding cacheline
> >> allocation, so we see a dropoff in cacheline-allocations for pg-sz=3D1=
GB.
> >>
> >> pg-sz=3D1GB:
> >>   -  9,250,034,512      cycles                           #    2.418 GH=
z                         ( +-  0.43% )  (46.16%)
> >>   -    544,878,976      instructions                     #    0.06  in=
sn per cycle
> >>   -  2,331,332,516      L1-dcache-loads                  #  609.471 M/=
sec                       ( +-  0.03% )  (46.16%)
> >>   -  1,075,122,960      L1-dcache-load-misses            #   46.12% of=
 all L1-dcache accesses   ( +-  0.01% )  (46.15%)
> >>
> >>   +  3,688,681,006      cycles                           #    2.420 GH=
z                         ( +-  3.48% )  (46.01%)
> >>   +     10,979,121      instructions                     #    0.00  in=
sn per cycle
> >>   +     31,829,258      L1-dcache-loads                  #   20.881 M/=
sec                       ( +-  4.92% )  (46.34%)
> >>   +     13,677,295      L1-dcache-load-misses            #   42.97% of=
 all L1-dcache accesses   ( +-  6.15% )  (46.32%)
> >>
> >> That's not the case with pg-sz=3D2MB, where we also perform better but
> >> the number of cacheline allocations remain the same.
> >>
> >> It's not entirely clear why the performance for pg-sz=3D2MB improves. =
We
> >> decode fewer instructions and the hardware prefetcher can do a better
> >> job, but the perf stats for both of those aren't convincing enough to
> >> the extent of ~30%.
> >>
> >> pg-sz=3D2MB:
> >>   - 13,110,306,584      cycles                           #    2.418 GH=
z                         ( +-  0.48% )  (46.13%)
> >>   -    607,589,360      instructions                     #    0.05  in=
sn per cycle
> >>   -  2,416,130,434      L1-dcache-loads                  #  445.682 M/=
sec                       ( +-  0.08% )  (46.19%)
> >>   -  1,080,187,594      L1-dcache-load-misses            #   44.71% of=
 all L1-dcache accesses   ( +-  0.01% )  (46.18%)
> >>
> >>   +  9,624,624,178      cycles                           #    2.418 GH=
z                         ( +-  0.01% )  (46.13%)
> >>   +    277,336,691      instructions                     #    0.03  in=
sn per cycle
> >>   +  2,251,220,599      L1-dcache-loads                  #  565.624 M/=
sec                       ( +-  0.01% )  (46.20%)
> >>   +  1,092,386,130      L1-dcache-load-misses            #   48.52% of=
 all L1-dcache accesses   ( +-  0.02% )  (46.19%)
> >>
> >> Icelakex (Platinum 8358, no_turbo=3D1, preempt=3Dfull|lazy):
> >>
> >>                  mm/folio_zero_user    x86/folio_zero_user     change
> >>                   (GB/s +- stddev)      (GB/s +- stddev)
> >>
> >>   pg-sz=3D2MB       7.95  +- 0.30%        10.90 +- 0.26%       + 37.10=
%
> >>   pg-sz=3D1GB       8.01  +- 0.24%        11.26 +- 0.48%       + 40.57=
%
> >>
> >> For both page-sizes, Icelakex, behaves similarly to Milan pg-sz=3D2MB:=
 we
> >> see a drop in cycles but there's no drop in cacheline allocation.
> >>
> >
> > Back when I was young and handsome and 32-bit x86 was king, people
> > assumed 4K pages needed to be cleared with non-temporal stores to avoid
> > evicting stuff from caches. I had never seen measurements showing this
> > has the intended effect. Some time after this became a thing I did see
> > measurements showing that this in fact *increases* cache misses. I am
> > not saying this was necessarily the case for all x86 uarchs, merely tha=
t
> > the sensibly sounding assumption turned bogus at some point (if it was
> > ever legit).
>
> That was a long time ago though ;-). And, your point makes sense for
> small sized pages. But, consider that zeroing a 1GB page can easily blow
> away an L3 cache for absolutely nothing gained -- probabilistically,
> nothing that was in the page that remains in the cache will ever be
> accessed.
>
> Now, you could argue that the situation is less clear for 2MB pages.
>

Well I was talking about 2MB. ;) I thought it is a foregone conclusion
that 1GB pages will be handled with non-temporal stores, but maybe I'm
crossing my wires.

> > This brings me to the multi-stage clearing employed here for locality.
> > While it sounds great on paper, for all I know it does not provide any
> > advantage. It very well may be it is harmful by preventing the CPU from
> > knowing what you are trying to do.
> >
> > I think doing this warrants obtaining stats from some real workloads,
> > but given how time consuming this can be I think it would be tolerable
> > to skip it for now.
> >
> >> Performance for preempt=3Dnone|voluntary remains unchanged.
> >>
> >
> > So I was under the impression the benefit would be realized for all
> > kernels.
> >
> > I don't know how preemption support is implemented on Linux. Do you
> > always get an IPI?
>
> No. The need-resched bit is common. It's just there's no preemption via
> irqentry, just synchronous calls to cond_resched() (as you mention below)=
.
>
> Zeroing via a subroutine like instruction (rep; stos) is incompatible wit=
h
> synchronous calls to cond_resched() so this code is explicitly not called
> for none/voluntary (see patch 3.)
>
> That said, I'll probably take Ingo's suggestion of chunking things up
> in say 8/16MB portions for cooperative preemption models.

makes sense, thanks

>
>
> > I was thinking something like this: a per-cpu var akin to preemption
> > count, but indicating the particular code section is fully preemptible
> >
> > Then:
> >
> > preemptible_enter();
> > clear_pages();
> > preemptible_exit();
> >
> > for simpler handling of the var it could prevent migration to other
> > CPUs.
> >
> > then the IPI handler for preemption would check if ->preemptible is set
> > + preemption disablement is zero, in which case it would take you off
> > cpu.
> >
> > If this is a problem, then a better granularity would help (say 8 pages
> > between cond_rescheds?)
> >
> >> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> >> ---
> >>  arch/x86/mm/Makefile |  1 +
> >>  arch/x86/mm/memory.c | 60 +++++++++++++++++++++++++++++++++++++++++++=
+
> >>  include/linux/mm.h   |  1 +
> >>  3 files changed, 62 insertions(+)
> >>  create mode 100644 arch/x86/mm/memory.c
> >>
> >> diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
> >> index 32035d5be5a0..e61b4d331cdf 100644
> >> --- a/arch/x86/mm/Makefile
> >> +++ b/arch/x86/mm/Makefile
> >> @@ -55,6 +55,7 @@ obj-$(CONFIG_MMIOTRACE_TEST)       +=3D testmmiotrac=
e.o
> >>  obj-$(CONFIG_NUMA)          +=3D numa.o numa_$(BITS).o
> >>  obj-$(CONFIG_AMD_NUMA)              +=3D amdtopology.o
> >>  obj-$(CONFIG_ACPI_NUMA)             +=3D srat.o
> >> +obj-$(CONFIG_PREEMPTION)    +=3D memory.o
> >>
> >>  obj-$(CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS)      +=3D pkeys.o
> >>  obj-$(CONFIG_RANDOMIZE_MEMORY)                      +=3D kaslr.o
> >> diff --git a/arch/x86/mm/memory.c b/arch/x86/mm/memory.c
> >> new file mode 100644
> >> index 000000000000..99851c246fcc
> >> --- /dev/null
> >> +++ b/arch/x86/mm/memory.c
> >> @@ -0,0 +1,60 @@
> >> +// SPDX-License-Identifier: GPL-2.0-or-later
> >> +#include <linux/mm.h>
> >> +#include <linux/range.h>
> >> +#include <linux/minmax.h>
> >> +
> >> +#ifndef CONFIG_HIGHMEM
> >> +/*
> >> + * folio_zero_user_preemptible(): multi-page clearing variant of foli=
o_zero_user().
> >> + *
> >> + * Taking inspiration from the common code variant, we split the zero=
ing in
> >> + * three parts: left of the fault, right of the fault, and up to 5 pa=
ges
> >> + * in the immediate neighbourhood of the target page.
> >> + *
> >> + * Cleared in that order to keep cache lines of the target region hot=
.
> >> + *
> >> + * For gigantic pages, there is no expectation of cache locality so j=
ust do a
> >> + * straight zero.
> >> + */
> >> +void folio_zero_user_preemptible(struct folio *folio, unsigned long a=
ddr_hint)
> >> +{
> >> +    unsigned long base_addr =3D ALIGN_DOWN(addr_hint, folio_size(foli=
o));
> >> +    const long fault_idx =3D (addr_hint - base_addr) / PAGE_SIZE;
> >> +    const struct range pg =3D DEFINE_RANGE(0, folio_nr_pages(folio) -=
 1);
> >> +    int width =3D 2; /* pages cleared last on either side */
> >> +    struct range r[3];
> >> +    int i;
> >> +
> >> +    if (folio_nr_pages(folio) > MAX_ORDER_NR_PAGES) {
> >> +            clear_pages(page_address(folio_page(folio, 0)), folio_nr_=
pages(folio));
> >> +            goto out;
> >> +    }
> >> +
> >> +    /*
> >> +     * Faulting page and its immediate neighbourhood. Cleared at the =
end to
> >> +     * ensure it sticks around in the cache.
> >> +     */
> >> +    r[2] =3D DEFINE_RANGE(clamp_t(s64, fault_idx - width, pg.start, p=
g.end),
> >> +                        clamp_t(s64, fault_idx + width, pg.start, pg.=
end));
> >> +
> >> +    /* Region to the left of the fault */
> >> +    r[1] =3D DEFINE_RANGE(pg.start,
> >> +                        clamp_t(s64, r[2].start-1, pg.start-1, r[2].s=
tart));
> >> +
> >> +    /* Region to the right of the fault: always valid for the common =
fault_idx=3D0 case. */
> >> +    r[0] =3D DEFINE_RANGE(clamp_t(s64, r[2].end+1, r[2].end, pg.end+1=
),
> >> +                        pg.end);
> >> +
> >> +    for (i =3D 0; i <=3D 2; i++) {
> >> +            int len =3D range_len(&r[i]);
> >> +
> >> +            if (len > 0)
> >> +                    clear_pages(page_address(folio_page(folio, r[i].s=
tart)), len);
> >> +    }
> >> +
> >> +out:
> >> +    /* Explicitly invoke cond_resched() to handle any live patching n=
ecessary. */
> >> +    cond_resched();
> >> +}
> >> +
> >> +#endif /* CONFIG_HIGHMEM */
> >> diff --git a/include/linux/mm.h b/include/linux/mm.h
> >> index b7f13f087954..b57512da8173 100644
> >> --- a/include/linux/mm.h
> >> +++ b/include/linux/mm.h
> >> @@ -4114,6 +4114,7 @@ enum mf_action_page_type {
> >>  };
> >>
> >>  #if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_HUGETLBFS)
> >> +void folio_zero_user_preemptible(struct folio *fio, unsigned long add=
r_hint);
> >>  void folio_zero_user(struct folio *folio, unsigned long addr_hint);
> >>  int copy_user_large_folio(struct folio *dst, struct folio *src,
> >>                        unsigned long addr_hint,
> >> --
> >> 2.31.1
> >>
> >>
>
>
> --
> ankur



--=20
Mateusz Guzik <mjguzik gmail.com>
