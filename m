Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948EA30E84D;
	Mon, 23 Jun 2025 09:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750671245; cv=none; b=VPl7tDugEIjXiCOiyHn3dhI2lJynkgYg8HTu0/xedV2T5SfwGT+lgcXPqO3aZrK5I496kl8h2BxG9HEEMNTDwA7kTP40REUNCjssXI7WKCpd50ZQmziodgCo6Du3ovSUkB3fmssIDl9yluzEsE3a68zsr4L0qZzO2ehft/0JspE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750671245; c=relaxed/simple;
	bh=KQQkkGa+FOJrfi+7O0ocknbs6Q+TgN71Lv+m1UTik/g=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=m/qFGJoBimFN8zDIim3da1E6qJLoETXxw8ukVsJh+uMU6YWf1YNberPxLrgG4aro2fVDur9XMuazrloHlC4PzVAQ/ovCyMxu4aiDgxdUBa7MG4QY+KGGr1e44IPnZijVz4OcF+8crPKxFx+/4Zlw5FSRpa1OyYPpFS1XV/rESIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8BxPOKBH1louIobAQ--.20857S3;
	Mon, 23 Jun 2025 17:33:53 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowMBx3MR+H1lo9iwnAQ--.51623S3;
	Mon, 23 Jun 2025 17:33:52 +0800 (CST)
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
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <fceb603c-6072-2941-15d5-56c8a4b4c32c@loongson.cn>
Date: Mon, 23 Jun 2025 17:33:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <87v7omooag.ffs@tglx>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMBx3MR+H1lo9iwnAQ--.51623S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tF1rur1fGFWDJr45Xw13Awc_yoW8CF47p3
	93K3Wxta1vqr4I9r12vanFvF97KF4kJay3C34kGryjv34qqF1agFs7XrWFkF18urs7Xryj
	vrWY9rWq9wn8XabCm3ZEXasCq-sJn29KB7ZKAUJUUUUf529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
	Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8uc_3UUUU
	U==

Hi, Thomas

在 2025/6/23 下午4:27, Thomas Gleixner 写道:
> On Mon, Jun 23 2025 at 10:45, Tianyang Zhang wrote:
>> 在 2025/6/13 下午11:20, Thomas Gleixner 写道:
>>> On Tue, Jun 10 2025 at 19:42, Tianyang Zhang wrote:
>>>
>>>> +	tail = (tail + 1) % INVALID_QUEUE_SIZE;
>>> Why is this before the barrier? The barrier does not do anything about
>>> this and you can simplify this. See below.
>>>
>>> And as there is no rmb() counterpart you want to explain that this is
>>> serializing against the hardware.
>>>> +	 */
>>>> +	wmb();
>>>> +
>>>> +	write_queue_tail(rqueue->node, tail);
>>> 	write_queue_tail(rqueue->node, (tail + 1) & INVALID_QUEUE_MASK);
>>>
>>> No?
>> The reason fo coding here is that during testing, it was found that a
>> barrier is needed between the update of temporary variable 'tail' and
>> the operation of register with 'write_queue_tail' , otherwise
>> write_queue_tail will probabilistically fail to obtain the correct
>> value.
> How so?
>
> tail is the software managed part of the ringbuffer which is shared with
> the hardware, right?
>
> So even if the compiler would be allowed to reevalutate tail after the
> barrier (it is NOT), then tail would still contain the same value as
> before, no?
>
> The wmb() is required to ensure that the hardware can observe the full
> write of the command _before_ it can observe the update to the tail
> index.
>
> Anything else is voodoo.
>
> Thanks,
>
>          tglx

In my previous understanding, tail'value is actually a part of 'full 
write of the command '.

We must ensure that tail is updated to the correct value first, and then 
write this value

into the register (perhaps by adding wmb in write_queue_tail ).

In other words, this is originally to prevent the write register 
instruction from being executed

out of order before updating tail.

The above is just my personal understanding

Thanks

Tianyang


