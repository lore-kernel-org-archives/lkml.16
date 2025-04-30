Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A3842DC777
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745975845; cv=none; b=UsVyaPCGfOeWigq8Y0/eabqsQ/Cp5j+8iYFFFao+G7PrY7vA7k4D1+k74g1KVDInRNWigoOg+//VSyzMMo8snxa9+XbC8N5zKICV7Wddyt6K/QMzFvR+3EmKAwTdn6V6pcxPfO2xocHWZ9+T1IjF+h0knK2QzceTzoG0JCUR098=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745975845; c=relaxed/simple;
	bh=N0V2SsMtExu7hSl2LYO3704pEdC+nNuBal9Nnc0nInM=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=hm56jA22d5tVi9R4Gc4Wh/vzlX8iZwfpNsvus9H/UmT2AxrVRceroZVjYNLfQMkI6iwHAm3LQqn67vcVEo/Kn5PiAVY1PZZvllPD4z6XfhaF0AvHIxKSRJ50xtyAdvBfNEO4/iarS7bHxGE8YZI40jWn+A2bVuCUGWyqGZdOlMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8DxzOIhehFoPqHKAA--.7699S3;
	Wed, 30 Apr 2025 09:17:21 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowMCxrhsgehFoRzWfAA--.21378S3;
	Wed, 30 Apr 2025 09:17:20 +0800 (CST)
Subject: Re: [PATCH] LoongArch:support CONFIG_SCHED_MC
To: Huacai Chen <chenhuacai@kernel.org>, Xi Ruoyao <xry111@xry111.site>
Cc: kernel@xen0n.name, wanghongliang@loongson.cn, yangtiezhu@loongson.cn,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250429113356.17929-1-zhangtianyang@loongson.cn>
 <f0d7965a0016f458bb06e2968c15d8eb46be296e.camel@xry111.site>
 <CAAhV-H7BejoBtsGWP8tn99Pa93M0ij=yXg_E+GJKLETYWhCt3A@mail.gmail.com>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <05b5e603-5263-dfc4-f7d3-14febc4f648a@loongson.cn>
Date: Wed, 30 Apr 2025 09:16:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7BejoBtsGWP8tn99Pa93M0ij=yXg_E+GJKLETYWhCt3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMCxrhsgehFoRzWfAA--.21378S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cw45ZFW7tF1rZF1DtrWDGFX_yoW8tw1xpa
	s7AFn5GrZ0gF93Cr4av348ury5trZ7GrW2qrsFkryfZr90v3ZxWr1UtryDuFn7AwsYk34j
	gFyrua43WF45JabCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Yb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIev
	Ja73UjIFyTuYvjxU2nYFDUUUU

Hi, Huacai

在 2025/4/29 下午7:52, Huacai Chen 写道:
> On Tue, Apr 29, 2025 at 7:44 PM Xi Ruoyao <xry111@xry111.site> wrote:
>> On Tue, 2025-04-29 at 19:33 +0800, Tianyang Zhang wrote:
>>> From: wanghongliang <wanghongliang@loongson.cn>
>>>
>>> In order to achieve more reasonable load balancing behavior,
>>> support for SCHED_MC has been added.
>>> The LLC distribution of Loongarch now is consistent with numa-node,
>>> the balancing domain of SCHED_MC can effectively reduce the situation
>>> where processes are awakened to smt_slibing
>>>
>>> Co-developed-by: wanghongliang <wanghongliang@loongson.cn>
>>> Signed-off-by: wanghongliang <wanghongliang@loongson.cn>
>>> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
>>> ---
>>>   arch/loongarch/Kconfig                |  9 ++++++
>>>   arch/loongarch/include/asm/smp.h      |  1 +
>>>   arch/loongarch/include/asm/topology.h |  8 +++++
>>>   arch/loongarch/kernel/smp.c           | 46 +++++++++++++++++++++++++++
>>>   4 files changed, 64 insertions(+)
>>>
>>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
>>> index 1a2cf012b..72a142a85 100644
>>> --- a/arch/loongarch/Kconfig
>>> +++ b/arch/loongarch/Kconfig
>>> @@ -493,6 +493,15 @@ config NR_CPUS
>>>          This allows you to specify the maximum number of CPUs which this
>>>          kernel will support.
>>>
>>> +config SCHED_MC
>>> +     def_bool y
>>> +     prompt "Multi-core scheduler support"
>>> +     depends on SMP
>>> +     help
>>> +       Multi-core scheduler support improves the CPU scheduler's decision
>>> +       making when dealing with multi-core CPU chips at a cost of slightly
>>> +       increased overhead in some places. If unsure say N here.
>> To me it's puzzling to say "if unsure say N here" while setting the
>> default to y.
> It seems copied from x86, I suggest to modify to
>
> +config SCHED_MC
> + bool "Multi-core scheduler support"
> + depends on SMP
> + default y
> + help
> +  Multi-core scheduler support improves the CPU scheduler's decision
> +  making when dealing with multi-core CPU chips at a cost of slightly
> +  increased overhead in some places.
>
> And put it after SCHED_SMT.

OK , I got it

Thanks

>
> Huacai
>
>
>> --
>> Xi Ruoyao <xry111@xry111.site>
>> School of Aerospace Science and Technology, Xidian University

