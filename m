Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DEE2472B2
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747760149; cv=none; b=SttpXeZtwpgJfcM9HuvgOX+Uwc+3q5s0JhcU+paqWOugBFVfo9I/GLlW9Y5NA9swlojuzJ91CEk10QjBH7bRBpqw4D+G3iXwtzvZ40xMOiwVFOrnLJomWdVn9rtPsmArFoexoxnRUpLYdy/m0S+pgwnlo0Ct5hUMMfeVPYucuUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747760149; c=relaxed/simple;
	bh=kG9b7YOD4tOr14A0O76GtglKVdC0/XpKP6P/aXwuyQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dHI0HVH4syxJgYlIymPDJLYqwbxYsd2RkVKINZY0YwcwdrBeVow0ipsdvOlUDy1zs0C8LWaPpcH+4tGgr15JHN5SgMnOE1EwzVUAVF7F1ilLoQjWJteMOsjMDCgRHCimq2dC1jXdBP0eNTKjASw635wmFaZpirejmHOGiOuVswU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDB4441C7D;
	Tue, 20 May 2025 16:55:36 +0000 (UTC)
Message-ID: <8faad7be-d7a5-4f71-b020-960ea443f751@ghiti.fr>
Date: Tue, 20 May 2025 18:55:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] riscv: mm: Add support for Svinval extension
To: Mayuresh Chitale <mchitale@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 alexghiti@rivosinc.com, samuel.holland@sifive.com, ajones@ventanamicro.com
References: <20240702102637.9074-1-mchitale@ventanamicro.com>
 <mhng-38c26ef6-8d45-4dd1-9c3a-f71f34f1ef81@palmer-ri-x1c9>
 <CAN37VV6DMpsRWnH-1tN2AfT8HXbEFh2We4Yw0XYkuCNvF75o4w@mail.gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAN37VV6DMpsRWnH-1tN2AfT8HXbEFh2We4Yw0XYkuCNvF75o4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdejheculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepteegiedvhfdvgfelffekveehjeetveehteeluedtffelfeeguedtvddugfeiheehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpihhnvhgrlhdrihhrpdhinhhfrhgruggvrggurdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemkeeksghfmegvsgeltdemkedtrgefmegsiedtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemkeeksghfmegvsgeltdemkedtrgefmegsiedtiedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemkeeksghfmegvsgeltdemkedtrgefmegsiedtiegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepledprhgtphhtthhopehmtghhihhtrghlvgesvhgvnhhtrghnrghmihgtrhhordgtohhmpdhrt
 ghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheprghlvgigghhhihhtihesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepshgrmhhuvghlrdhhohhllhgrnhgusehsihhfihhvvgdrtghomh
X-GND-Sasl: alex@ghiti.fr

Hi Mayuresh!

On 7/30/24 10:43, Mayuresh Chitale wrote:
> On Wed, Jul 24, 2024 at 8:20 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> On Tue, 02 Jul 2024 03:26:37 PDT (-0700), mchitale@ventanamicro.com wrote:
>>> The Svinval extension splits SFENCE.VMA instruction into finer-grained
>>> invalidation and ordering operations and is mandatory for RVA23S64 profile.
>>> When Svinval is enabled the local_flush_tlb_range_threshold_asid function
>>> should use the following sequence to optimize the tlb flushes instead of
>> Do you have any performance numbers for the optimization?  As per here
>> <https://lore.kernel.org/all/mhng-f799bd2b-7f22-4c03-bdb2-903fa3b5d508@palmer-ri-x1c9a/>.
> No, currently there are no numbers available for comparison but the
> rationale for the optimization is described in the spec. The extension
> is mandatory for the RVA23S64 profile but any platform that doesn't
> support this extension will not be impacted as the code executes only
> if the svinval extension is enabled at the boot up.


So I finally have some numbers! I tested this patchset on the BananaPi: 
I measured the number of cycles when flushing 64 entries (which is our 
current threshold) and I made sure to touch the entries beforehand.

Here they are:

* svinval:

#cycles: 364920
#cycles: 365856
#cycles: 367993

* !svinval:

#cycles: 663585
#cycles: 663105
#cycles: 664073

So that's roughly /2 using svinval. To me that's good enough to merge 
that for 6.16 :)

Sorry for the very very long delay and thanks again for the multiple 
revisions!

Alex


>>> a simple sfence.vma:
>>>
>>> sfence.w.inval
>>> svinval.vma
>>>    .
>>>    .
>>> svinval.vma
>>> sfence.inval.ir
>>>
>>> The maximum number of consecutive svinval.vma instructions that
>>> can be executed in local_flush_tlb_range_threshold_asid function
>>> is limited to 64. This is required to avoid soft lockups and the
>>> approach is similar to that used in arm64.
>>>
>>> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
>>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>>> ---
>>> Changes in v8:
>>> - Fix line wrap
>>> - Add RB tag
>>>
>>> Changes in v7:
>>> - Use existing svinval macros in the insn-def.h
>>> - Rename local_sinval_vma_asid to local_sinval_vma
>>>
>>> Changes in v6:
>>> - Rebase on latest torvalds/master
>>>
>>> Changes in v5:
>>> - Reduce tlb flush threshold to 64
>>> - Improve implementation of local_flush_tlb* functions
>>>
>>> Changes in v4:
>>> - Rebase and refactor as per latest changes on torvalds/master
>>> - Drop patch 1 in the series
>>>
>>> Changes in v3:
>>> - Fix incorrect vma used for sinval instructions
>>> - Use unified static key mechanism for svinval
>>> - Rebased on torvalds/master
>>>
>>> Changes in v2:
>>> - Rebased on 5.18-rc3
>>> - update riscv_fill_hwcap to probe Svinval extension
>>>
>>>   arch/riscv/mm/tlbflush.c | 32 ++++++++++++++++++++++++++++++++
>>>   1 file changed, 32 insertions(+)
>>>
>>> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
>>> index 9b6e86ce3867..782147a63f3b 100644
>>> --- a/arch/riscv/mm/tlbflush.c
>>> +++ b/arch/riscv/mm/tlbflush.c
>>> @@ -6,6 +6,27 @@
>>>   #include <linux/hugetlb.h>
>>>   #include <asm/sbi.h>
>>>   #include <asm/mmu_context.h>
>>> +#include <asm/cpufeature.h>
>>> +
>>> +#define has_svinval()        riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
>>> +
>>> +static inline void local_sfence_inval_ir(void)
>>> +{
>>> +     asm volatile(SFENCE_INVAL_IR() ::: "memory");
>>> +}
>>> +
>>> +static inline void local_sfence_w_inval(void)
>>> +{
>>> +     asm volatile(SFENCE_W_INVAL() ::: "memory");
>>> +}
>>> +
>>> +static inline void local_sinval_vma(unsigned long vma, unsigned long asid)
>>> +{
>>> +     if (asid != FLUSH_TLB_NO_ASID)
>>> +             asm volatile(SINVAL_VMA(%0, %1) : : "r" (vma), "r" (asid) : "memory");
>>> +     else
>>> +             asm volatile(SINVAL_VMA(%0, zero) : : "r" (vma) : "memory");
>>> +}
>>>
>>>   /*
>>>    * Flush entire TLB if number of entries to be flushed is greater
>>> @@ -26,6 +47,16 @@ static void local_flush_tlb_range_threshold_asid(unsigned long start,
>>>                return;
>>>        }
>>>
>>> +     if (has_svinval()) {
>>> +             local_sfence_w_inval();
>>> +             for (i = 0; i < nr_ptes_in_range; ++i) {
>>> +                     local_sinval_vma(start, asid);
>>> +                     start += stride;
>>> +             }
>>> +             local_sfence_inval_ir();
>>> +             return;
>>> +     }
>>> +
>>>        for (i = 0; i < nr_ptes_in_range; ++i) {
>>>                local_flush_tlb_page_asid(start, asid);
>>>                start += stride;
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
