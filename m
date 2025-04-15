Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879D620C488
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744712204; cv=none; b=G+RjWlgfnjYHW3EeupFe1sc0EDqm2cFHq7e1+bQQGrGlTeu0YqzDcxVLLByD+BoIlnVhpPpoEAygRnl/BbzThYmkPnXsFmsJLN+LKDYaQkdmhyCooo3T9A8td8093G+IJa/icQJxhF9jHidP4Ue/Yzt6HlXRmKKuqgAXh17DM1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744712204; c=relaxed/simple;
	bh=0+aBJYB6XifWYKGbOi5LWIHihMKfcqala/f6Sgh9oNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dgFM2hOkIpPyySUlZa6tWumNTtV2thpmPJZsnYmA1WkBGVA8Oy96+TMMA/NRxDLQr84XG6bBN/QLahHJO01WqjjKhuMbOnOq6DZ7TkC3y4WTeeT9DVjqg1ExFZfFBhSuNa1/1YdGYm+13qHO/yTy1bBDSI0Dskg4glectQEatag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFPeM1yf; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFPeM1yf"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfe574976so36680325e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744712200; x=1745317000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3wPLWpzg0uJc6DKNe0j57Rzmezfms/1F6deuRd/kaWA=;
        b=bFPeM1yfq3t3HR1Et3e0En1gu4JkfVwMzyY9iZ7XHX6kRXcj2MvS5vPTN7FXrxzALI
         9/qnJerwT0H76rwZxZQD9IbjXqXyaybMH6zAocCkCXmCxOZ4UfkNwEEKwZdUK8pYNXlt
         xPlwBOKJ61jfaIIYgdpTu63dnMIFwKpDpnTNDBYm+FmepWdel0hrbL6bxpluOaee1PGF
         OYRTtLFGAb9bzazBzPMNrN8ayaG4cxQvQ49uRvzEZqS794d72uzbcgqkQjr9XXOJZ6rM
         SqhDI1u3KyD0MekaIuD+YBohxNETbH3JyiSvHdcJkuOER85Z8omTGYbi6LbI53rK3r2g
         tZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744712200; x=1745317000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wPLWpzg0uJc6DKNe0j57Rzmezfms/1F6deuRd/kaWA=;
        b=juz3MtVDf9s15M/2WL4cWSu6YEu0dhpPMu4VFR6YwTCi0qFNndqOkq5rVWqTlaMYLp
         ktCPPAz/Nl3HshxYPAB1CpTuHp53BlWuRkFrIUds46uAOPtoGASnjeqUUBlJvd0yh28n
         yUCnH5yhngaXGLQUotIoLghWMF0ut3kgFyVDvdQAVslnb/T+tyCYJ2C3e2Nl+AcGeYBZ
         Fu7beCFVZ7IZh2kArUp0uojujXwzoX+O8i6HPgRuHgEZlH1Rq2VbfVzF1hzxln86RXqV
         DrfzTrUudLou9DvhfjH1c+MYpUfO/we/0EeHgsNrR1cevN+p+zakJWRDvjKyrM6eoTTS
         tfzQ==
X-Gm-Message-State: AOJu0YwaAXU453M/LQa6nFgdJidf3ELmEZUaPLG96kage1z8Z4iP0z9U
	rWjcWzYf3jdUkChMTynlfYRgNHBQO98AYFWPrpOzJKAz9xnPx1JYCOukIexr
X-Gm-Gg: ASbGncuD7nprr9LjS44Fe3NrGs5+dyisBsKUxJm+U/+fL3Z/sp+ziPaqe8pFFWXdxdP
	27yB+WBSjv0BSf117bkQRgzkcxe2NPKDkZZYi9iVrKK2Lq5RWoyGilwqjSNSQN1xBMo0O4rsQLy
	CDba/Om+SRMZAvwD5vCdDPhABlDYOoA1sY9yuP/kyS8BD693DtZbA2yNQu6KmkliAi+3Qgyr1+Y
	APJ9P1Zo2xbH9co2ERJNEYK4bLgg3g+OSb3z2i9hkQxUiuH7pzIsVapo0ebL/qjicUNnacPI48B
	BJ42lkyMhx0yOYXg1nfWWYejjfHiKp3NlGFsnjI2onvmqCtxU2Fw3Q==
X-Google-Smtp-Source: AGHT+IFrXaLuRdHFBlBDP1BMt/Hh83oA+N35XyDE64nV8bTXaAqlcbovRdOe56UhpE4z32chMbZfiw==
X-Received: by 2002:a05:600c:3501:b0:43c:fe15:41e1 with SMTP id 5b1f17b1804b1-43f3a925a32mr157186225e9.4.1744712199310;
        Tue, 15 Apr 2025 03:16:39 -0700 (PDT)
Received: from f (cst-prg-79-34.cust.vodafone.cz. [46.135.79.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f205ecac8sm207375175e9.4.2025.04.15.03.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:16:38 -0700 (PDT)
Date: Tue, 15 Apr 2025 12:16:26 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org, 
	torvalds@linux-foundation.org, akpm@linux-foundation.org, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com, luto@kernel.org, 
	peterz@infradead.org, paulmck@kernel.org, rostedt@goodmis.org, tglx@linutronix.de, 
	willy@infradead.org, jon.grimm@amd.com, bharata@amd.com, raghavendra.kt@amd.com, 
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v3 4/4] x86/folio_zero_user: multi-page clearing
Message-ID: <mp6sg35nbmjzahnlkstw7y7n2cbcz3waqcthz27ciyc7fmki3s@jws4rtvqyds4>
References: <20250414034607.762653-1-ankur.a.arora@oracle.com>
 <20250414034607.762653-5-ankur.a.arora@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250414034607.762653-5-ankur.a.arora@oracle.com>

On Sun, Apr 13, 2025 at 08:46:07PM -0700, Ankur Arora wrote:
> clear_pages_rep(), clear_pages_erms() use string instructions to zero
> memory. When operating on more than a single page, we can use these
> more effectively by explicitly advertising the region-size to the
> processor, which can use that as a hint to optimize the clearing
> (ex. by eliding cacheline allocation.)
> 
> As a secondary benefit, string instructions are typically microcoded,
> and working with larger regions helps amortize the cost of the decode.
> 
> When zeroing the 2MB page, maximize spatial locality by clearing in 
> three sections: the faulting page and its immediate neighbourhood, the
> left and the right regions, with the local neighbourhood cleared last.
> 
> Performance
> ==
> 
> Use mmap(MAP_HUGETLB) to demand fault a 64GB region on the local
> NUMA node.
> 
> Milan (EPYC 7J13, boost=0, preempt=full|lazy):
> 
>                  mm/folio_zero_user    x86/folio_zero_user     change
>                   (GB/s  +- stddev)      (GB/s  +- stddev)
> 
>   pg-sz=2MB       11.89  +- 0.78%        16.12  +-  0.12%    +  35.5%
>   pg-sz=1GB       16.51  +- 0.54%        42.80  +-  3.48%    + 159.2%
> 
> Milan uses a threshold of LLC-size (~32MB) for eliding cacheline
> allocation, so we see a dropoff in cacheline-allocations for pg-sz=1GB.
> 
> pg-sz=1GB:
>   -  9,250,034,512      cycles                           #    2.418 GHz                         ( +-  0.43% )  (46.16%)
>   -    544,878,976      instructions                     #    0.06  insn per cycle
>   -  2,331,332,516      L1-dcache-loads                  #  609.471 M/sec                       ( +-  0.03% )  (46.16%)
>   -  1,075,122,960      L1-dcache-load-misses            #   46.12% of all L1-dcache accesses   ( +-  0.01% )  (46.15%)
> 
>   +  3,688,681,006      cycles                           #    2.420 GHz                         ( +-  3.48% )  (46.01%)
>   +     10,979,121      instructions                     #    0.00  insn per cycle
>   +     31,829,258      L1-dcache-loads                  #   20.881 M/sec                       ( +-  4.92% )  (46.34%)
>   +     13,677,295      L1-dcache-load-misses            #   42.97% of all L1-dcache accesses   ( +-  6.15% )  (46.32%)
> 
> That's not the case with pg-sz=2MB, where we also perform better but
> the number of cacheline allocations remain the same.
> 
> It's not entirely clear why the performance for pg-sz=2MB improves. We
> decode fewer instructions and the hardware prefetcher can do a better
> job, but the perf stats for both of those aren't convincing enough to
> the extent of ~30%.
> 
> pg-sz=2MB:
>   - 13,110,306,584      cycles                           #    2.418 GHz                         ( +-  0.48% )  (46.13%)
>   -    607,589,360      instructions                     #    0.05  insn per cycle
>   -  2,416,130,434      L1-dcache-loads                  #  445.682 M/sec                       ( +-  0.08% )  (46.19%)
>   -  1,080,187,594      L1-dcache-load-misses            #   44.71% of all L1-dcache accesses   ( +-  0.01% )  (46.18%)
> 
>   +  9,624,624,178      cycles                           #    2.418 GHz                         ( +-  0.01% )  (46.13%)
>   +    277,336,691      instructions                     #    0.03  insn per cycle
>   +  2,251,220,599      L1-dcache-loads                  #  565.624 M/sec                       ( +-  0.01% )  (46.20%)
>   +  1,092,386,130      L1-dcache-load-misses            #   48.52% of all L1-dcache accesses   ( +-  0.02% )  (46.19%)
> 
> Icelakex (Platinum 8358, no_turbo=1, preempt=full|lazy):
> 
>                  mm/folio_zero_user    x86/folio_zero_user     change
>                   (GB/s +- stddev)      (GB/s +- stddev)
> 
>   pg-sz=2MB       7.95  +- 0.30%        10.90 +- 0.26%       + 37.10%
>   pg-sz=1GB       8.01  +- 0.24%        11.26 +- 0.48%       + 40.57%
> 
> For both page-sizes, Icelakex, behaves similarly to Milan pg-sz=2MB: we
> see a drop in cycles but there's no drop in cacheline allocation.
> 

Back when I was young and handsome and 32-bit x86 was king, people
assumed 4K pages needed to be cleared with non-temporal stores to avoid
evicting stuff from caches. I had never seen measurements showing this
has the intended effect. Some time after this became a thing I did see
measurements showing that this in fact *increases* cache misses. I am
not saying this was necessarily the case for all x86 uarchs, merely that
the sensibly sounding assumption turned bogus at some point (if it was
ever legit).

This brings me to the multi-stage clearing employed here for locality.
While it sounds great on paper, for all I know it does not provide any
advantage. It very well may be it is harmful by preventing the CPU from
knowing what you are trying to do.

I think doing this warrants obtaining stats from some real workloads,
but given how time consuming this can be I think it would be tolerable
to skip it for now.

> Performance for preempt=none|voluntary remains unchanged.
> 

So I was under the impression the benefit would be realized for all
kernels.

I don't know how preemption support is implemented on Linux. Do you
always get an IPI?

I was thinking something like this: a per-cpu var akin to preemption
count, but indicating the particular code section is fully preemptible

Then:

preemptible_enter();
clear_pages();
preemptible_exit();

for simpler handling of the var it could prevent migration to other
CPUs.

then the IPI handler for preemption would check if ->preemptible is set
+ preemption disablement is zero, in which case it would take you off
cpu.

If this is a problem, then a better granularity would help (say 8 pages
between cond_rescheds?)

> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> ---
>  arch/x86/mm/Makefile |  1 +
>  arch/x86/mm/memory.c | 60 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mm.h   |  1 +
>  3 files changed, 62 insertions(+)
>  create mode 100644 arch/x86/mm/memory.c
> 
> diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
> index 32035d5be5a0..e61b4d331cdf 100644
> --- a/arch/x86/mm/Makefile
> +++ b/arch/x86/mm/Makefile
> @@ -55,6 +55,7 @@ obj-$(CONFIG_MMIOTRACE_TEST)	+= testmmiotrace.o
>  obj-$(CONFIG_NUMA)		+= numa.o numa_$(BITS).o
>  obj-$(CONFIG_AMD_NUMA)		+= amdtopology.o
>  obj-$(CONFIG_ACPI_NUMA)		+= srat.o
> +obj-$(CONFIG_PREEMPTION)	+= memory.o
>  
>  obj-$(CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS)	+= pkeys.o
>  obj-$(CONFIG_RANDOMIZE_MEMORY)			+= kaslr.o
> diff --git a/arch/x86/mm/memory.c b/arch/x86/mm/memory.c
> new file mode 100644
> index 000000000000..99851c246fcc
> --- /dev/null
> +++ b/arch/x86/mm/memory.c
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +#include <linux/mm.h>
> +#include <linux/range.h>
> +#include <linux/minmax.h>
> +
> +#ifndef CONFIG_HIGHMEM
> +/*
> + * folio_zero_user_preemptible(): multi-page clearing variant of folio_zero_user().
> + *
> + * Taking inspiration from the common code variant, we split the zeroing in
> + * three parts: left of the fault, right of the fault, and up to 5 pages
> + * in the immediate neighbourhood of the target page.
> + *
> + * Cleared in that order to keep cache lines of the target region hot.
> + *
> + * For gigantic pages, there is no expectation of cache locality so just do a
> + * straight zero.
> + */
> +void folio_zero_user_preemptible(struct folio *folio, unsigned long addr_hint)
> +{
> +	unsigned long base_addr = ALIGN_DOWN(addr_hint, folio_size(folio));
> +	const long fault_idx = (addr_hint - base_addr) / PAGE_SIZE;
> +	const struct range pg = DEFINE_RANGE(0, folio_nr_pages(folio) - 1);
> +	int width = 2; /* pages cleared last on either side */
> +	struct range r[3];
> +	int i;
> +
> +	if (folio_nr_pages(folio) > MAX_ORDER_NR_PAGES) {
> +		clear_pages(page_address(folio_page(folio, 0)), folio_nr_pages(folio));
> +		goto out;
> +	}
> +
> +	/*
> +	 * Faulting page and its immediate neighbourhood. Cleared at the end to
> +	 * ensure it sticks around in the cache.
> +	 */
> +	r[2] = DEFINE_RANGE(clamp_t(s64, fault_idx - width, pg.start, pg.end),
> +			    clamp_t(s64, fault_idx + width, pg.start, pg.end));
> +
> +	/* Region to the left of the fault */
> +	r[1] = DEFINE_RANGE(pg.start,
> +			    clamp_t(s64, r[2].start-1, pg.start-1, r[2].start));
> +
> +	/* Region to the right of the fault: always valid for the common fault_idx=0 case. */
> +	r[0] = DEFINE_RANGE(clamp_t(s64, r[2].end+1, r[2].end, pg.end+1),
> +			    pg.end);
> +
> +	for (i = 0; i <= 2; i++) {
> +		int len = range_len(&r[i]);
> +
> +		if (len > 0)
> +			clear_pages(page_address(folio_page(folio, r[i].start)), len);
> +	}
> +
> +out:
> +	/* Explicitly invoke cond_resched() to handle any live patching necessary. */
> +	cond_resched();
> +}
> +
> +#endif /* CONFIG_HIGHMEM */
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index b7f13f087954..b57512da8173 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -4114,6 +4114,7 @@ enum mf_action_page_type {
>  };
>  
>  #if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_HUGETLBFS)
> +void folio_zero_user_preemptible(struct folio *fio, unsigned long addr_hint);
>  void folio_zero_user(struct folio *folio, unsigned long addr_hint);
>  int copy_user_large_folio(struct folio *dst, struct folio *src,
>  			  unsigned long addr_hint,
> -- 
> 2.31.1
> 
> 
