Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55EFE7083A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 02:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744165044; cv=none; b=bqpnWHFfAfWC3Hryhhr+tV3m/tytnPvz4IGcsLVB/I3objSHetbGRXsaAFkZ3u8vsjy7Dtur7grmculRqUPI8+wO/VrhVjbZA8+15ScT+Qc4mINv2+HDBdrAqa2ZnHL6unv3jx2X0pfBOGPH/Ih2xTszLaPsdgmSn3sjFi1fEu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744165044; c=relaxed/simple;
	bh=WDqMBd92k2n/VhyZDze6xnRKCm6vD/2kvmn85px7pIA=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=YH4hDgmG8eorZBmrLc7RVBlszgbjaT858C3tkzQN7OsJQGa/OzC2jVrD0WE5VmTHzMdN4L0Em4e1z6pqgWl7zi6fdcO661jlK881PUsJMCi+yR4pEObCxbunTJA+pel/wZKMwuwr3oTlxypCp4YFILBd1cqNFpeqnenG/2vnMnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8CxvnKr2PVnYKy1AA--.40691S3;
	Wed, 09 Apr 2025 10:17:15 +0800 (CST)
Received: from [10.136.12.26] (unknown [111.9.175.10])
	by front1 (Coremail) with SMTP id qMiowMCxPsep2PVnbb91AA--.26584S3;
	Wed, 09 Apr 2025 10:17:15 +0800 (CST)
Subject: Re: [PATCH] LoongArch: Enhance robust of kprobe
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250408092756.22339-1-yangtiezhu@loongson.cn>
From: Jinyang He <hejinyang@loongson.cn>
Message-ID: <f83d1048-93f6-6c11-2c2a-98c1e1ea7e9d@loongson.cn>
Date: Wed, 9 Apr 2025 10:17:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250408092756.22339-1-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMCxPsep2PVnbb91AA--.26584S3
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoWxWrWkAw13WFWfJFWxAF17XFc_yoW5GFy8pF
	s7C3yrtrW8XFy0va4UAw15uryFy3yUJ3yxWw1UAa43tws8Cw1qqr1xWrWq9Fn8Gr4rtr1S
	vF18Kry0vF1UGFgCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU70PfDUUU
	U

On 2025-04-08 17:27, Tiezhu Yang wrote:

> Currently, interrupts need to be disabled before single-step mode is set,
> it requires that the CSR_PRMD_PIE must be cleared in save_local_irqflag()
> which is called by setup_singlestep(), this is reasonable.
>
> But in the first kprobe breakpoint exception, if the irq is enabled at the
> beginning of do_bp(), it will not be disabled at the end of do_bp() due to
> the CSR_PRMD_PIE has been cleared in save_local_irqflag(). For this case,
> it may corrupt exception context when restoring exception after do_bp() in
> handle_bp(), this is not reasonable.
>
> Based on the above analysis, in order to make sure the irq is disabled at
> the end of do_bp() for the first kprobe breakpoint exception, it is proper
> to disable irq first before clearing CSR_PRMD_PIE in save_local_irqflag().
>
> Fixes: 6d4cc40fb5f5 ("LoongArch: Add kprobes support")
> Co-developed-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>   arch/loongarch/kernel/kprobes.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/loongarch/kernel/kprobes.c b/arch/loongarch/kernel/kprobes.c
> index 8ba391cfabb0..6eab97636e6b 100644
> --- a/arch/loongarch/kernel/kprobes.c
> +++ b/arch/loongarch/kernel/kprobes.c
> @@ -113,6 +113,7 @@ NOKPROBE_SYMBOL(set_current_kprobe);
>   static void save_local_irqflag(struct kprobe_ctlblk *kcb,
>   			       struct pt_regs *regs)
>   {
> +	local_irq_disable();
>   	kcb->saved_status = regs->csr_prmd;
>   	regs->csr_prmd &= ~CSR_PRMD_PIE;
>   }

Hi, Tiezhu,

I think the carsh is caused by "irq-triggered re-re-enter" clear
the previous_kprobe status. An example things like,

...
   static void setup_singlestep(struct kprobe *p, struct pt_regs *regs,
                    struct kprobe_ctlblk *kcb, int reenter)
   {
       union loongarch_instruction insn;

       if (reenter) {
           save_previous_kprobe(kcb);
  ===================   <- irq and trigger re-re-enter in its handler
           set_current_kprobe(p);
           kcb->kprobe_status = KPROBE_REENTER;
       } else {
           kcb->kprobe_status = KPROBE_HIT_SS;
       }
...

We should assure the previous_kprobe status not be changed after re-enter.
So this `local_irq_disable` should be set in reenter block begin.
And for !reenter block, `local_irq_disable` may be not needed.

Jinyang

