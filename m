Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9BD19F416
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215190; cv=none; b=SdszGTFB0Izitezq8dDwkfeawjmHFgQGb3Q8vDO2g+AmfN5WN1ltCcpU42vUtGpGenbOZxx14V9oq/R82TxRM+2z3CozQZccVmh6JSNWgisD4L8Vfi0Kl5RcNYWEJK/uCNTa7HQkDdfPeWbHWUPD7gD7Fz8eOav2nyu8WtpTGtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215190; c=relaxed/simple;
	bh=2+VFUUPuTsayjw634qwNU/oky6UeePkMHE+2/YPWZfE=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=bJ6aDpGsM7EO26yMDAD8SLkuCrDlEuQ8sAaTKlx52F2OF8WuV46a/G0J4ckDZADLlDfkF6ddqBL7ukEdpoJmiGrss0meOrJf8LNOckLpvtHg8JBMAcAU7PO1lmg+oAy7AKN+0Xe2wfj485PkBsO9EULZ+Oqkc/RusCJYyAscr6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxYa9KYyRo7n3mAA--.6785S3;
	Wed, 14 May 2025 17:32:58 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxrhtIYyRouTbRAA--.23825S3;
	Wed, 14 May 2025 17:32:56 +0800 (CST)
Subject: Re: [PATCH 2/2] LoongArch: uprobe: Remove redundant code about
 resume_era
To: Huacai Chen <chenhuacai@kernel.org>
References: <20250513092116.25979-1-yangtiezhu@loongson.cn>
 <20250513092116.25979-3-yangtiezhu@loongson.cn>
 <CAAhV-H4AgHQs4pMqGqe7WfwCA+u7mO3U+=hcm8ZWk5DQHhsO1w@mail.gmail.com>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <bbd7e5ad-c353-6916-cf9e-8f3aa3fefda9@loongson.cn>
Date: Wed, 14 May 2025 17:32:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4AgHQs4pMqGqe7WfwCA+u7mO3U+=hcm8ZWk5DQHhsO1w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxrhtIYyRouTbRAA--.23825S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJF4rtw4rCF4fCFW3Ww15Awc_yoW5Gw18p3
	ZrA3Z3KFs8GFykAFyqqFWDZr1Iyr4kGr42gw12yFySyw12qr1Yqr18ta98JFy5ArsYgr10
	qw1Fy34qvFW7A3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-UUUU
	U

On 05/13/2025 11:13 PM, Huacai Chen wrote:
> Hi, Tiezhu,
>
> On Tue, May 13, 2025 at 5:21 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> arch_uprobe_skip_sstep() returns true if instruction was emulated,
>> that is to say, there is no need to single step for the emulated
>> instructions, it will point to the destination address directly
>> after the exception, so the resume_era related code is redundant,
>> just remove them.
>>
>> Fixes: 19bc6cb64092 ("LoongArch: Add uprobes support")
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>  arch/loongarch/include/asm/uprobes.h | 1 -
>>  arch/loongarch/kernel/uprobes.c      | 7 +------
>>  2 files changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/arch/loongarch/include/asm/uprobes.h b/arch/loongarch/include/asm/uprobes.h
>> index 99a0d198927f..025fc3f0a102 100644
>> --- a/arch/loongarch/include/asm/uprobes.h
>> +++ b/arch/loongarch/include/asm/uprobes.h
>> @@ -15,7 +15,6 @@ typedef u32 uprobe_opcode_t;
>>  #define UPROBE_XOLBP_INSN      __emit_break(BRK_UPROBE_XOLBP)
>>
>>  struct arch_uprobe {
>> -       unsigned long   resume_era;
>>         u32     insn[2];
>>         u32     ixol[2];
>>         bool    simulate;
>> diff --git a/arch/loongarch/kernel/uprobes.c b/arch/loongarch/kernel/uprobes.c
>> index 0ab9d8d631c4..6022eb0f71db 100644
>> --- a/arch/loongarch/kernel/uprobes.c
>> +++ b/arch/loongarch/kernel/uprobes.c
>> @@ -52,11 +52,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
>>
>>         WARN_ON_ONCE(current->thread.trap_nr != UPROBE_TRAP_NR);
>>         current->thread.trap_nr = utask->autask.saved_trap_nr;
>> -
>> -       if (auprobe->simulate)
>> -               instruction_pointer_set(regs, auprobe->resume_era);
>> -       else
>> -               instruction_pointer_set(regs, utask->vaddr + LOONGARCH_INSN_SIZE);
>> +       instruction_pointer_set(regs, utask->vaddr + LOONGARCH_INSN_SIZE);
> This seems wrong. If in the simulate case, regs->csr_era has already
> pointed to the correct destination address, then here we should only
> handle the non-simulate case.

What is wrong with this code? AFAICT, the code is right.

Here are the call chains in the generic code of uprobe:

handle_swbp()
   arch_uprobe_skip_sstep()
   pre_ssout()
     arch_uprobe_pre_xol()
handle_singlestep()
   arch_uprobe_post_xol()

arch_uprobe_post_xol() only handles the instruction that is not emulated
because if arch_uprobe_skip_sstep() returns true, arch_uprobe_post_xol()
will not be called, it will be called only if arch_uprobe_skip_sstep()
returns false.

Thanks,
Tiezhu

