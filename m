Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED14D433A6
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 18:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749234146; cv=none; b=jma+AHBwVm6ipd+Mh7Yp5pcv3XV9KL6eIq2wy3Nb1XtjfQKHAIO/1znGFstE/FjcVzTysOc7eewg8yP4DUeO3ZXJQVNrpa5SaOMZvhZ7qHmp6X7oPWm5SRjO7tZZ5zHuubbB7STnBblt2qG/7IS71iputqUejScfI5jrcRmf0SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749234146; c=relaxed/simple;
	bh=wD3ohA+2DtNVVMZ9motY8mWNX8A9Usl66ckYinm/99E=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=tl2c40Ba/HRB8Wh+yHMk6wf5EC/zDcewKOeZC3uUby8Bq2i2Pu0ig9N8u3WXY2AdMDAK3ebo7Zj8jvaR0No6uEsUFRjC/QDEGNe4kJ45xfI+ZeTQiIuz4k5jR62GrgX+Ahx73Q80LUi1zp2VijI+RC5irYHJMI7rzVqva7U4fCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=byk1l4yV; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="byk1l4yV"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-234fcadde3eso29258065ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 11:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749234143; x=1749838943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZrMvaEHkl3yooXaY3MSFj8fFjzuxvYEiXVTkirVIzk=;
        b=byk1l4yVcTrr698paW31ATjzOL9czFtVCGcFx+Qk5XYU7Obwp1d1K2389uUrG0dfYb
         APn5xrsXAXdbSiPbW6CkLgftg9b3KDhdq3/mucxtTdMLYR+FCdKy6WFH9nXgOXyYbc+i
         g86QjKNdOxRjlWct0xguv4frrerFD5ySvqY8z+XIMdCDLcxf6lvujKzj1ESpBJ9wpzec
         r/jceQvIzOziS9Fm6bOptHeM3gE6JV14nghIzQrEaQqp9p0mR6OJmiBe4eiM3iqS66Tv
         Lg4hyveuk4wWMMNwWlT6waPdRd4S8LM/yaGM1Z455bsOFG05WYJRvPHJ/NIjHj8s5y1o
         c9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749234143; x=1749838943;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZrMvaEHkl3yooXaY3MSFj8fFjzuxvYEiXVTkirVIzk=;
        b=e8hhl1ooeImeQ2ZLcM3raJ40pWXA69JA/jjTyQYz8EBRHkxhvrHM0l5b+Y45zV6tOc
         WDf9xGik+rRjhPU/do8fKgx0b1irrKWC6hcQw70g/c/UbWLJkQWuVgicjUw42w0vJ9it
         vuTId0CZPaXO41r7KJAsZG0P+HhOClpWdY3xxYvGHikUZJmCOITNF+rkQgn1e92rtNoM
         B/uLTpWj4ddfNJpQThQiGoCvAMq9GfsyJMcCWGdPbTHH6I8RS38ehYxHnxh8ibGs6Qr8
         fY9fopnhPbuNCHlVd9jBpNh7CdsXrNIL5Ksyf2UYzPqG0ZSQZS0vo3iu0DRdcSRK1VgO
         JMsw==
X-Forwarded-Encrypted: i=1; AJvYcCVdicfIwhNHmBSbRwQsGrG/pZ9i087YgOQt1Mbu+eqhblyyPSsGLgh2UENnVrYW/2tIPLnmDrOgEQdQDqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHBGGxu27llx4qXi9z+h+/hEBhn05yOoMJMIGxx05QG6eXrLG7
	lF15LrQ8ZP4EfCJzfMx/i5WX/aWXJaptUA7XTnDhdjGg3VQ+KdwGQj3Y4cTWS4GntECvYq/uqtC
	9zpxl
X-Gm-Gg: ASbGncuIpIohPo9vb7Jgj83+85wig4+el1gPRUXwCrLXGjh50YOdtDAD6mreGpGtAND
	/Xr6Nyketnds+ALiL1l8A16N1gp4zegwWyH6ksMO0XddVDj54e3EGRBk8ZJ50o75a0jmGgMw7aw
	OetZpBOMnDTpqllGzRc6tM6yXkD6+AbCSc7bBB5NIM8Lz2+ArSYjaWW3bt3cwXjbMaNB/dST/X9
	+y+oldkraK43HGeh/SXsI19HTPYyEyapSKRA3MBJTacjqPLqYuhMhsxhQ8SKr1VWUAOytAJfCpc
	p+98xT+lsQ7QedZHMDST2J52dFgcg6QsMayQSsmALBl3LoPXFYyKPk4=
X-Google-Smtp-Source: AGHT+IGMlluHec06cdDvnE+fsfsOP8CEZrDoNNmjzyHDnUqsJgq7fMhrAUqDcdxh0pOY9mNBmLtDoA==
X-Received: by 2002:a17:902:d483:b0:235:e1d6:4e29 with SMTP id d9443c01a7336-23601dc0136mr70329185ad.36.1749234143099;
        Fri, 06 Jun 2025 11:22:23 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:2724])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-236030788a1sm15357385ad.16.2025.06.06.11.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 11:22:22 -0700 (PDT)
Date: Fri, 06 Jun 2025 11:22:22 -0700 (PDT)
X-Google-Original-Date: Fri, 06 Jun 2025 11:22:16 PDT (-0700)
Subject:     Re: [PATCH v8] riscv: mm: Add support for Svinval extension
In-Reply-To: <CAN37VV4ohoi48BAM1-OTdSGe9yD=2Eh84pKsHLsWQSaRadJ7tw@mail.gmail.com>
CC: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  alexghiti@rivosinc.com, samuel.holland@sifive.com, ajones@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mchitale@ventanamicro.com
Message-ID: <mhng-BE91CAF1-2E4D-45A2-A21A-FD613551610D@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 22 May 2025 08:11:09 PDT (-0700), mchitale@ventanamicro.com wrote:
> Hi Alex,
>
> On Tue, May 20, 2025 at 10:25 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>>
>> Hi Mayuresh!
>>
>> On 7/30/24 10:43, Mayuresh Chitale wrote:
>> > On Wed, Jul 24, 2024 at 8:20 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> >> On Tue, 02 Jul 2024 03:26:37 PDT (-0700), mchitale@ventanamicro.com wrote:
>> >>> The Svinval extension splits SFENCE.VMA instruction into finer-grained
>> >>> invalidation and ordering operations and is mandatory for RVA23S64 profile.
>> >>> When Svinval is enabled the local_flush_tlb_range_threshold_asid function
>> >>> should use the following sequence to optimize the tlb flushes instead of
>> >> Do you have any performance numbers for the optimization?  As per here
>> >> <https://lore.kernel.org/all/mhng-f799bd2b-7f22-4c03-bdb2-903fa3b5d508@palmer-ri-x1c9a/>.
>> > No, currently there are no numbers available for comparison but the
>> > rationale for the optimization is described in the spec. The extension
>> > is mandatory for the RVA23S64 profile but any platform that doesn't
>> > support this extension will not be impacted as the code executes only
>> > if the svinval extension is enabled at the boot up.

I seem to remember writing something like this up at some point, but I 
didn't see it so I figured I'd just write it up again in case anyone's 
looking in the future...

My core worry here  is that there's two ways to tuse the Svinval 
extension:

* This, which just replaces the sfence.vma with a loop of Svinval 
  instructions.  This keeps the Svinval instructions close to each 
  other.
* Some more extensive modifications to move the Svinval instructions 
  farther apart from each other.

Which approach is better is going to depend on what them microarchicture 
implements: does it want the Svinval instructions close to each other so 
it can pattern match them, or does it want them far apart so the 
ordering instructions stall less.  It's entirely possible that the wrong 
flavor of Svinval will actually decrease performance on systems that 
were built around the other flavor, and we don't know which flavor is 
getting implemented.

So it's not one of these extensions where we can just say "these are 
only used on systems that implement the extensions, so it's obviously 
faster".  We really need some numbers to demonstrate this flavor is 
actually faster...

>> So I finally have some numbers! I tested this patchset on the BananaPi:
>> I measured the number of cycles when flushing 64 entries (which is our
>> current threshold) and I made sure to touch the entries beforehand.
>>
>> Here they are:
>>
>> * svinval:
>>
>> #cycles: 364920
>> #cycles: 365856
>> #cycles: 367993
>>
>> * !svinval:
>>
>> #cycles: 663585
>> #cycles: 663105
>> #cycles: 664073
>>
>
> That's awesome !! Thank you so much for getting the data.

So I think that's good enough to start, so it's going up to Linus and 
hopefully it lands (there's been a bit of chaos, but hopefully that's 
all sorted out).

>> So that's roughly /2 using svinval. To me that's good enough to merge
>> that for 6.16 :)

Ya, but probably low enough that we're going to want a lower threshold 
too -- if the svinval loop is only a factor of 2 faster for 64 entries, 
it's probably going to end up slower at some point...

On the flip side, it's a big enough change that we probably want to 
re-evaluate tlb_flush_all_threshold, too.

>> Sorry for the very very long delay and thanks again for the multiple
>> revisions!
>>
>> Alex
>>
>>
>> >>> a simple sfence.vma:
>> >>>
>> >>> sfence.w.inval
>> >>> svinval.vma
>> >>>    .
>> >>>    .
>> >>> svinval.vma
>> >>> sfence.inval.ir
>> >>>
>> >>> The maximum number of consecutive svinval.vma instructions that
>> >>> can be executed in local_flush_tlb_range_threshold_asid function
>> >>> is limited to 64. This is required to avoid soft lockups and the
>> >>> approach is similar to that used in arm64.
>> >>>
>> >>> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
>> >>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> >>> ---
>> >>> Changes in v8:
>> >>> - Fix line wrap
>> >>> - Add RB tag
>> >>>
>> >>> Changes in v7:
>> >>> - Use existing svinval macros in the insn-def.h
>> >>> - Rename local_sinval_vma_asid to local_sinval_vma
>> >>>
>> >>> Changes in v6:
>> >>> - Rebase on latest torvalds/master
>> >>>
>> >>> Changes in v5:
>> >>> - Reduce tlb flush threshold to 64
>> >>> - Improve implementation of local_flush_tlb* functions
>> >>>
>> >>> Changes in v4:
>> >>> - Rebase and refactor as per latest changes on torvalds/master
>> >>> - Drop patch 1 in the series
>> >>>
>> >>> Changes in v3:
>> >>> - Fix incorrect vma used for sinval instructions
>> >>> - Use unified static key mechanism for svinval
>> >>> - Rebased on torvalds/master
>> >>>
>> >>> Changes in v2:
>> >>> - Rebased on 5.18-rc3
>> >>> - update riscv_fill_hwcap to probe Svinval extension
>> >>>
>> >>>   arch/riscv/mm/tlbflush.c | 32 ++++++++++++++++++++++++++++++++
>> >>>   1 file changed, 32 insertions(+)
>> >>>
>> >>> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
>> >>> index 9b6e86ce3867..782147a63f3b 100644
>> >>> --- a/arch/riscv/mm/tlbflush.c
>> >>> +++ b/arch/riscv/mm/tlbflush.c
>> >>> @@ -6,6 +6,27 @@
>> >>>   #include <linux/hugetlb.h>
>> >>>   #include <asm/sbi.h>
>> >>>   #include <asm/mmu_context.h>
>> >>> +#include <asm/cpufeature.h>
>> >>> +
>> >>> +#define has_svinval()        riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
>> >>> +
>> >>> +static inline void local_sfence_inval_ir(void)
>> >>> +{
>> >>> +     asm volatile(SFENCE_INVAL_IR() ::: "memory");
>> >>> +}
>> >>> +
>> >>> +static inline void local_sfence_w_inval(void)
>> >>> +{
>> >>> +     asm volatile(SFENCE_W_INVAL() ::: "memory");
>> >>> +}
>> >>> +
>> >>> +static inline void local_sinval_vma(unsigned long vma, unsigned long asid)
>> >>> +{
>> >>> +     if (asid != FLUSH_TLB_NO_ASID)
>> >>> +             asm volatile(SINVAL_VMA(%0, %1) : : "r" (vma), "r" (asid) : "memory");
>> >>> +     else
>> >>> +             asm volatile(SINVAL_VMA(%0, zero) : : "r" (vma) : "memory");
>> >>> +}
>> >>>
>> >>>   /*
>> >>>    * Flush entire TLB if number of entries to be flushed is greater
>> >>> @@ -26,6 +47,16 @@ static void local_flush_tlb_range_threshold_asid(unsigned long start,
>> >>>                return;
>> >>>        }
>> >>>
>> >>> +     if (has_svinval()) {
>> >>> +             local_sfence_w_inval();
>> >>> +             for (i = 0; i < nr_ptes_in_range; ++i) {
>> >>> +                     local_sinval_vma(start, asid);
>> >>> +                     start += stride;
>> >>> +             }
>> >>> +             local_sfence_inval_ir();
>> >>> +             return;
>> >>> +     }
>> >>> +
>> >>>        for (i = 0; i < nr_ptes_in_range; ++i) {
>> >>>                local_flush_tlb_page_asid(start, asid);
>> >>>                start += stride;
>> > _______________________________________________
>> > linux-riscv mailing list
>> > linux-riscv@lists.infradead.org
>> > http://lists.infradead.org/mailman/listinfo/linux-riscv
