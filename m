Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29C9278174
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744371444; cv=none; b=RLw+QY5MT7NwtmhpuMQxCDaG9JCFH1N1wKb/2VT3eqCvDhJZUB1uZdeIbNhnZPFIvDRDO7eonswkAkt0Y/yz5xdTRI9tt6/2/AhejvZWWRRhBpxYqBHRcFwpHfvW4wSp4mVwgDsBAOabBt1tyycWhhZdGlUE5kH7EFiDmLhF5bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744371444; c=relaxed/simple;
	bh=GgvsIiMSWI7ot2dKymYgJgOK0zbQ7qHM79BD698yXeI=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=p0thM1K2NDP9XdVxobqs+RsVDxs7UWYgZhwZaYvCBxRn0DE9t7d8L8mmwwo5STdEGpiwTYxVOTJ/z1jzVfCQWqJsjXkAckc40c54tDh0Do+1QktOo7i1Ve2lcbFv1HXmRal/JR9HKphU0k0j+4nWP3htXbeEV/C2tC3WgfWJ9YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxG6zs_vhngMu4AA--.12835S3;
	Fri, 11 Apr 2025 19:37:16 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMDxPcXr_vhniKl6AA--.36349S3;
	Fri, 11 Apr 2025 19:37:15 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Enhance robust of kprobe
To: Jinyang He <hejinyang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
References: <20250408092756.22339-1-yangtiezhu@loongson.cn>
 <f83d1048-93f6-6c11-2c2a-98c1e1ea7e9d@loongson.cn>
 <0b5039c3-019b-fd3d-e822-5d2a52c4111d@loongson.cn>
 <56519aed-b23e-fece-3e91-f8db44da6d45@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <5c0db0f8-bab8-7cdb-172e-931658ed0548@loongson.cn>
Date: Fri, 11 Apr 2025 19:37:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <56519aed-b23e-fece-3e91-f8db44da6d45@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMDxPcXr_vhniKl6AA--.36349S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kr1xAr1rKr4UuFy7Ar18Zwc_yoW8Wr1xpF
	W7AF4kGrZ7WF1kZFyDJw4Sv3WxJrZ3K34xCa1vk3yfuF43Cr95Xrn7C347Z3Wqv395AF10
	9FyDtwnIqFsxAFbCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-UUUU
	U

On 04/11/2025 12:46 PM, Jinyang He wrote:
>
> On 2025-04-11 10:48, Tiezhu Yang wrote:
>> On 04/09/2025 10:17 AM, Jinyang He wrote:
>>> On 2025-04-08 17:27, Tiezhu Yang wrote:

...

> I have just explained the previous status may be broken by IRQ.

The initial aim is to make sure the irq is disabled at the end of
do_bp(), so let us narrow down the scope.

> On the other hand, have you tried only fix do_bp weather cause hang?
>
> bool this_bp_ie = regs->csr_prmd & CSR_PRMD_PIE;
> if (this_bp_ie)
>   local_irq_enable();
> ...
> if (this_bp_ie)
>   local_irq_disable();

This is a good idea, thank you.

I will test the following change, if it works well and no more comments,
I will send v2 in the next week.

---8<---
diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
index 2ec3106c0da3..68cc4165578a 100644
--- a/arch/loongarch/kernel/traps.c
+++ b/arch/loongarch/kernel/traps.c
@@ -710,11 +710,12 @@ asmlinkage void noinstr do_bce(struct pt_regs *regs)
  asmlinkage void noinstr do_bp(struct pt_regs *regs)
  {
         bool user = user_mode(regs);
+       bool pie = regs->csr_prmd & CSR_PRMD_PIE;
         unsigned int opcode, bcode;
         unsigned long era = exception_era(regs);
         irqentry_state_t state = irqentry_enter(regs);

-       if (regs->csr_prmd & CSR_PRMD_PIE)
+       if (pie)
                 local_irq_enable();

         if (__get_inst(&opcode, (u32 *)era, user))
@@ -780,7 +781,7 @@ asmlinkage void noinstr do_bp(struct pt_regs *regs)
         }

  out:
-       if (regs->csr_prmd & CSR_PRMD_PIE)
+       if (pie)
                 local_irq_disable();

         irqentry_exit(regs, state);

Thanks,
Tiezhu

