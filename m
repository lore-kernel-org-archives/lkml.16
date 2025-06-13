Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37112E11D6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825408; cv=none; b=FRgEFiqbL6q0Q/I8VFdvlE14Cw5dfdMk+TkpsuRlCX00bajvQKWIKfKTV+035Paa3wItmidttHHBu2WnqyVp32dnTKEdHK/x0x7TGYndwGyNotTwqv5ySF8LOBr7neS3XBdbCa3vuBaO0KjVRHsuFyDzwX8Osuikc5OZ+1h7K3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825408; c=relaxed/simple;
	bh=7XAdFLFj5ZRGtMnlA8gsCM1/EuPPduGl6KcF0gGt3+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s8IEnrTZs4NypSDUgK/KTqIOSbuiQ66LZe5bLxlAN8TfZCO2xjPYnLTHdRMcax1qxKKDH9yNRSFY+HkLiTYMSTUSDWLmiAji91qeY+elxIVM46yhKKsKLzYn4kj3J12SlXE99LERUtaDpN7SXxR4LDYb53fypYCv2sfvZPO2Grc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 523AE580165
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:08:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 850F3439AC;
	Fri, 13 Jun 2025 14:08:22 +0000 (UTC)
Message-ID: <793ac05a-66ce-46ca-b588-bcd3cfc5058e@ghiti.fr>
Date: Fri, 13 Jun 2025 16:08:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] riscv: mm: Add support for Svinval extension
To: Palmer Dabbelt <palmer@dabbelt.com>, mchitale@ventanamicro.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 alexghiti@rivosinc.com, samuel.holland@sifive.com, ajones@ventanamicro.com
References: <mhng-BE91CAF1-2E4D-45A2-A21A-FD613551610D@palmerdabbelt-mac>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <mhng-BE91CAF1-2E4D-45A2-A21A-FD613551610D@palmerdabbelt-mac>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukedugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepteegiedvhfdvgfelffekveehjeetveehteeluedtffelfeeguedtvddugfeiheehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpihhnvhgrlhdrihhrpdhinhhfrhgruggvrggurdhorhhgnecukfhppedvrgdtgeemtggvtgdtmeduudduvgemsgeggeelmeekfhdurgemtghffhdumegrfeektdemugefudgvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtdegmegtvggttdemudduudgvmegsgeegleemkehfudgrmegtfhhfudemrgefkedtmegufeduvgdphhgvlhhopeglkffrggeimedvrgdtgeemtggvtgdtmeduudduvgemsgeggeelmeekfhdurgemtghffhdumegrfeektdemugefudgvngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtohepmhgthhhithgrlhgvs
 ehvvghnthgrnhgrmhhitghrohdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegrlhgvgihghhhithhisehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehsrghmuhgvlhdrhhholhhlrghnugesshhifhhivhgvrdgtohhm
X-GND-Sasl: alex@ghiti.fr

On 6/6/25 20:22, Palmer Dabbelt wrote:
> On Thu, 22 May 2025 08:11:09 PDT (-0700), mchitale@ventanamicro.com 
> wrote:
>> Hi Alex,
>>
>> On Tue, May 20, 2025 at 10:25 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>>>
>>> Hi Mayuresh!
>>>
>>> On 7/30/24 10:43, Mayuresh Chitale wrote:
>>> > On Wed, Jul 24, 2024 at 8:20 PM Palmer Dabbelt 
>>> <palmer@dabbelt.com> wrote:
>>> >> On Tue, 02 Jul 2024 03:26:37 PDT (-0700), 
>>> mchitale@ventanamicro.com wrote:
>>> >>> The Svinval extension splits SFENCE.VMA instruction into 
>>> finer-grained
>>> >>> invalidation and ordering operations and is mandatory for 
>>> RVA23S64 profile.
>>> >>> When Svinval is enabled the local_flush_tlb_range_threshold_asid 
>>> function
>>> >>> should use the following sequence to optimize the tlb flushes 
>>> instead of
>>> >> Do you have any performance numbers for the optimization?  As per 
>>> here
>>> >> 
>>> <https://lore.kernel.org/all/mhng-f799bd2b-7f22-4c03-bdb2-903fa3b5d508@palmer-ri-x1c9a/>.
>>> > No, currently there are no numbers available for comparison but the
>>> > rationale for the optimization is described in the spec. The 
>>> extension
>>> > is mandatory for the RVA23S64 profile but any platform that doesn't
>>> > support this extension will not be impacted as the code executes only
>>> > if the svinval extension is enabled at the boot up.
>
> I seem to remember writing something like this up at some point, but I 
> didn't see it so I figured I'd just write it up again in case anyone's 
> looking in the future...
>
> My core worry here  is that there's two ways to tuse the Svinval 
> extension:
>
> * This, which just replaces the sfence.vma with a loop of Svinval 
>  instructions.  This keeps the Svinval instructions close to each  other.
> * Some more extensive modifications to move the Svinval instructions 
>  farther apart from each other.


Yes and those 2 ways are complementary, the next step is to implement 
the second one.


>
> Which approach is better is going to depend on what them 
> microarchicture implements: does it want the Svinval instructions 
> close to each other so it can pattern match them, or does it want them 
> far apart so the ordering instructions stall less.  It's entirely 
> possible that the wrong flavor of Svinval will actually decrease 
> performance on systems that were built around the other flavor, and we 
> don't know which flavor is getting implemented.
>
> So it's not one of these extensions where we can just say "these are 
> only used on systems that implement the extensions, so it's obviously 
> faster".  We really need some numbers to demonstrate this flavor is 
> actually faster...


I don't see how an svinval implementation would lead in that case to 
poorer performance, unless the platform implements a "dummy" svinval to 
conform to rva23, in that case, I think we should not worry about this 
case in the long run.


>
>>> So I finally have some numbers! I tested this patchset on the BananaPi:
>>> I measured the number of cycles when flushing 64 entries (which is our
>>> current threshold) and I made sure to touch the entries beforehand.
>>>
>>> Here they are:
>>>
>>> * svinval:
>>>
>>> #cycles: 364920
>>> #cycles: 365856
>>> #cycles: 367993
>>>
>>> * !svinval:
>>>
>>> #cycles: 663585
>>> #cycles: 663105
>>> #cycles: 664073
>>>
>>
>> That's awesome !! Thank you so much for getting the data.
>
> So I think that's good enough to start, so it's going up to Linus and 
> hopefully it lands (there's been a bit of chaos, but hopefully that's 
> all sorted out).
>
>>> So that's roughly /2 using svinval. To me that's good enough to merge
>>> that for 6.16 :)
>
> Ya, but probably low enough that we're going to want a lower threshold 
> too -- if the svinval loop is only a factor of 2 faster for 64 
> entries, it's probably going to end up slower at some point...
>
> On the flip side, it's a big enough change that we probably want to 
> re-evaluate tlb_flush_all_threshold, too.
>
>>> Sorry for the very very long delay and thanks again for the multiple
>>> revisions!
>>>
>>> Alex
>>>
>>>
>>> >>> a simple sfence.vma:
>>> >>>
>>> >>> sfence.w.inval
>>> >>> svinval.vma
>>> >>>    .
>>> >>>    .
>>> >>> svinval.vma
>>> >>> sfence.inval.ir
>>> >>>
>>> >>> The maximum number of consecutive svinval.vma instructions that
>>> >>> can be executed in local_flush_tlb_range_threshold_asid function
>>> >>> is limited to 64. This is required to avoid soft lockups and the
>>> >>> approach is similar to that used in arm64.
>>> >>>
>>> >>> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
>>> >>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>>> >>> ---
>>> >>> Changes in v8:
>>> >>> - Fix line wrap
>>> >>> - Add RB tag
>>> >>>
>>> >>> Changes in v7:
>>> >>> - Use existing svinval macros in the insn-def.h
>>> >>> - Rename local_sinval_vma_asid to local_sinval_vma
>>> >>>
>>> >>> Changes in v6:
>>> >>> - Rebase on latest torvalds/master
>>> >>>
>>> >>> Changes in v5:
>>> >>> - Reduce tlb flush threshold to 64
>>> >>> - Improve implementation of local_flush_tlb* functions
>>> >>>
>>> >>> Changes in v4:
>>> >>> - Rebase and refactor as per latest changes on torvalds/master
>>> >>> - Drop patch 1 in the series
>>> >>>
>>> >>> Changes in v3:
>>> >>> - Fix incorrect vma used for sinval instructions
>>> >>> - Use unified static key mechanism for svinval
>>> >>> - Rebased on torvalds/master
>>> >>>
>>> >>> Changes in v2:
>>> >>> - Rebased on 5.18-rc3
>>> >>> - update riscv_fill_hwcap to probe Svinval extension
>>> >>>
>>> >>>   arch/riscv/mm/tlbflush.c | 32 ++++++++++++++++++++++++++++++++
>>> >>>   1 file changed, 32 insertions(+)
>>> >>>
>>> >>> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
>>> >>> index 9b6e86ce3867..782147a63f3b 100644
>>> >>> --- a/arch/riscv/mm/tlbflush.c
>>> >>> +++ b/arch/riscv/mm/tlbflush.c
>>> >>> @@ -6,6 +6,27 @@
>>> >>>   #include <linux/hugetlb.h>
>>> >>>   #include <asm/sbi.h>
>>> >>>   #include <asm/mmu_context.h>
>>> >>> +#include <asm/cpufeature.h>
>>> >>> +
>>> >>> +#define has_svinval() 
>>> riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
>>> >>> +
>>> >>> +static inline void local_sfence_inval_ir(void)
>>> >>> +{
>>> >>> +     asm volatile(SFENCE_INVAL_IR() ::: "memory");
>>> >>> +}
>>> >>> +
>>> >>> +static inline void local_sfence_w_inval(void)
>>> >>> +{
>>> >>> +     asm volatile(SFENCE_W_INVAL() ::: "memory");
>>> >>> +}
>>> >>> +
>>> >>> +static inline void local_sinval_vma(unsigned long vma, unsigned 
>>> long asid)
>>> >>> +{
>>> >>> +     if (asid != FLUSH_TLB_NO_ASID)
>>> >>> +             asm volatile(SINVAL_VMA(%0, %1) : : "r" (vma), "r" 
>>> (asid) : "memory");
>>> >>> +     else
>>> >>> +             asm volatile(SINVAL_VMA(%0, zero) : : "r" (vma) : 
>>> "memory");
>>> >>> +}
>>> >>>
>>> >>>   /*
>>> >>>    * Flush entire TLB if number of entries to be flushed is greater
>>> >>> @@ -26,6 +47,16 @@ static void 
>>> local_flush_tlb_range_threshold_asid(unsigned long start,
>>> >>>                return;
>>> >>>        }
>>> >>>
>>> >>> +     if (has_svinval()) {
>>> >>> +             local_sfence_w_inval();
>>> >>> +             for (i = 0; i < nr_ptes_in_range; ++i) {
>>> >>> +                     local_sinval_vma(start, asid);
>>> >>> +                     start += stride;
>>> >>> +             }
>>> >>> +             local_sfence_inval_ir();
>>> >>> +             return;
>>> >>> +     }
>>> >>> +
>>> >>>        for (i = 0; i < nr_ptes_in_range; ++i) {
>>> >>>                local_flush_tlb_page_asid(start, asid);
>>> >>>                start += stride;
>>> > _______________________________________________
>>> > linux-riscv mailing list
>>> > linux-riscv@lists.infradead.org
>>> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
