Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A423FE7;
	Tue, 24 Jun 2025 01:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750729210; cv=none; b=S6GGsu4G/6D/Z724xQ4WGZ/RRTuF8IpVKQ7gRfgjVOYyJZsU93K8vWww3Iz0gVA22qGHlb4Sr5U4a2+mc3SabCe9FyFWZJYHpdAhT/9e4tatylvsquEciQXa2r1V2ADVXLLtu5CLWj0PJJgl3WC4cLyyhDLLE5IyGjcZX4AMUcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750729210; c=relaxed/simple;
	bh=pgiPJLvvmTflKzjDY7E5OaH4sV2YGQ0u+axBomTRsOw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=lsK+X0EQLxxrpMkX9GsxpnkUlfLyInrveG/3no8RFRj+lKh4bty231TN7K7NPvZvZ9HkFWlLySekdaaxL0ElcKuE3wQL7qs0fgQ73NDSyDmnekXjqPVHz2HLiEzrnmMV+DhrzgV7wcX//RIrc7ZACFYYl3ogreCTp8DCdHd56A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8Ax3eLuAVpotfobAQ--.24562S3;
	Tue, 24 Jun 2025 09:39:58 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowMAxzxvqAVpoby8oAQ--.3360S3;
	Tue, 24 Jun 2025 09:39:56 +0800 (CST)
Subject: Re: [PATCH v4 2/2] irq/irq-loongarch-ir:Add Redirect irqchip support
To: Thomas Gleixner <tglx@linutronix.de>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, peterz@infradead.org, wangliupu@loongson.cn,
 lvjianmin@loongson.cn, maobibo@loongson.cn, siyanteng@cqsoftware.com.cn,
 gaosong@loongson.cn, yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250610114252.21077-1-zhangtianyang@loongson.cn>
 <20250610114252.21077-3-zhangtianyang@loongson.cn> <87o6uris6p.ffs@tglx>
 <9c60326b-f7bd-0b36-3bc5-0ad7d19690f1@loongson.cn> <87v7omooag.ffs@tglx>
 <fceb603c-6072-2941-15d5-56c8a4b4c32c@loongson.cn> <87jz52nrzo.ffs@tglx>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <a8f2ec4d-2616-17dc-320b-b7ac5ca99255@loongson.cn>
Date: Tue, 24 Jun 2025 09:39:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <87jz52nrzo.ffs@tglx>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMAxzxvqAVpoby8oAQ--.3360S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWFW3ZF1xAF13Ary3XryxZwc_yoWrCw13pF
	W8K3WxK3ykta1I934Iva1kZa47tw4kKFW5Gr95GFyvy3s0qF1xuF40qFW5Za48Xrs7Zr1j
	vFZ0vrWq9F98ZabCm3ZEXasCq-sJn29KB7ZKAUJUUUUf529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
	Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2txhDUUUU

Hi, Thomas

在 2025/6/24 上午4:05, Thomas Gleixner 写道:
> On Mon, Jun 23 2025 at 17:33, Tianyang Zhang wrote:
>> 在 2025/6/23 下午4:27, Thomas Gleixner 写道:
>>> tail is the software managed part of the ringbuffer which is shared with
>>> the hardware, right?
>>>
>>> So even if the compiler would be allowed to reevalutate tail after the
>>> barrier (it is NOT), then tail would still contain the same value as
>>> before, no?
>>>
>>> The wmb() is required to ensure that the hardware can observe the full
>>> write of the command _before_ it can observe the update to the tail
>>> index.
>>>
>>> Anything else is voodoo.
>>>
>>> Thanks,
>>>
>>>           tglx
>> In my previous understanding, tail'value is actually a part of 'full
>> write of the command '.
> Of course. The hardware observes the tail value. If it is not updated
> then the command is not executed. But these are two distinct things:
>
> The invalidate command is written to a location in the command buffer
> which is determined by tail:
>
> 	inv_addr = (struct irde_inv_cmd *)(rqueue->base + tail * sizeof(struct irde_inv_cmd));
> 	memcpy(inv_addr, cmd, sizeof(struct irde_inv_cmd));
>
> requeue::base points to an array of invalidate commands. The array
> size is INVALID_QUEUE_SIZE. tail is the position in the array to which
> the software writes the next command. tail is software managed and
> written to a completely different location via write_queue_tail(...):
>
> static phys_addr_t redirect_reg_base = 0x1fe00000;
>
> #define REDIRECT_REG_BASE(reg, node) \
> 	(UNCACHE_BASE | redirect_reg_base | (u64)(node) << NODE_ADDRSPACE_SHIFT | (reg))
> #define	redirect_reg_queue_tail(node)	REDIRECT_REG_BASE(LOONGARCH_IOCSR_REDIRECT_CQT, (node))
> #define read_queue_tail(node)		(*((u32 *)(redirect_reg_queue_tail(node))))
> #define write_queue_tail(node, val)	(*((u32 *)(redirect_reg_queue_tail(node))) = (val))
>
> The hardware maintains the head index. It's the last command index the
> hardware processed. When the hardware observes that head != tail then it
> processes the next entry and after completion it updates head with the
> next index. This repeats until head == tail.
>
>> We must ensure that tail is updated to the correct value first, and
>> then write this value into the register (perhaps by adding wmb in
>> write_queue_tail ).
> No. The local variable 'tail' is purely local to the CPU and the
> invalidation hardware does not even know that it exists.
>
> There are two things which are relevant to the hardware:
>
>     1) command is written to the hardware visible array at index of tail
>
>     2) hardware visible tail memory (register) is updated to tail + 1
>
> The memory barrier is required to prevent that #2 is written to the
> hardware _before_ #1 completed and is fully visible to the hardware.
>
>> In other words, this is originally to prevent the write register
>> instruction from being executed out of order before updating tail.
> No. The barrier is solely for the above #1 vs. #2 ordering.
>
> There is a difference between program flow ordering and memory ordering.
>
> The hardware _CANNOT_ execute the write _before_ the value it writes is
> computed. That's enforced by program flow order.
>
> So it's always guaranteed that the CPU executes
>
>     tail + 1
>
> _before_ executing the write to the register because that's a program
> order dependency.
>
> If that would not be guaranteed, then your CPU would have more serious
> problems than this piece of code. It simply would not even survive the
> first five instructions in the boot loader.
>
> But what's not guaranteed is that consecutive writes become visible to
> other parts of the system (other CPUs, the invalidation hardware, ....)
> in the same consecutive order.
>
> To ensure that ordering you need a WMB(). If you would have CPU to CPU
> communication then you would need a RMB() on the reader side to ensure
> that the command is not read before the tail. In your case the hardware
> side takes care of that.
>
>> The above is just my personal understanding
> Which might need some slight adjustments :)
>
> Thanks,
>
>          tglx

Hmm... it seems I confused program-flow-ordering and memory-ordering .

my understanding of the previous issue may not have been right.

Your reply has taught me a great deal, truly appreciate it

Thank you very much

Tianyang

