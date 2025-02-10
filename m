Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71215225D7
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 06:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739167672; cv=none; b=R9OXyu5+OXivNRQ2cbKDm1JJOfNu6RsDj6ttfAcFygIXWddqJKBCAw6JeyVNRpT9JgMcBmnizUjzcoOMHg5xmttBxZYDPHtvFH4wCds8xpx/iu191AA4CV/Dsn4z4YhJu3SJlDah6P+s+ORM1kJgPY9Ut7E6a1vw4qk9/UMiptE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739167672; c=relaxed/simple;
	bh=2ckOBtZ0SayfkUiAGTScq7nP6Ree1sZ/P3eqOOPh5i4=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=U5INA2jwAsnoTZPHMNO1NJjpIIn+EUomml23CGYtdfNSmwUxvsTHKCcx92mI93kmoVrntoePfkeIg7g01ddtZUQg/mZOvBHt3gu+/FJZ5ue9zxKReIPd3MbZPRyQ5x7in1DQ+0biQXAVVkvvfoncktI4SRm0Zo8oJW79bKR5FeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxC+Kxl6ln3flwAA--.22073S3;
	Mon, 10 Feb 2025 14:07:45 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxPsevl6lnzsAJAA--.38660S3;
	Mon, 10 Feb 2025 14:07:44 +0800 (CST)
Subject: Re: [PATCH v6 0/9] Add jump table support for objtool on LoongArch
To: Josh Poimboeuf <jpoimboe@kernel.org>
References: <20241217010905.13054-1-yangtiezhu@loongson.cn>
 <ef1e3e7c-0117-175c-5a85-091382696748@loongson.cn>
 <20250115013444.anzoct6gvs56m225@jpoimboe>
Cc: Huacai Chen <chenhuacai@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, loongarch@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <4612bfd8-442e-fecb-240f-46e735b48540@loongson.cn>
Date: Mon, 10 Feb 2025 14:07:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250115013444.anzoct6gvs56m225@jpoimboe>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMCxPsevl6lnzsAJAA--.38660S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ur4Uur45Zw4ktrW5uF4rZwc_yoW8GrykpF
	W5GFW29F4kJrWUX3WkKw1agFySqw4ftr1xXr45WrW5Aa1qq3W5tr4fZw4YgFWqgr4YvFyI
	ya1fJa4q9F4DArXCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	XVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jepB-UUUUU=

On 01/15/2025 09:34 AM, Josh Poimboeuf wrote:
> On Sat, Jan 11, 2025 at 02:57:42PM +0800, Tiezhu Yang wrote:
>> Hi Josh and Peter,
>>
>> On 12/17/2024 09:08 AM, Tiezhu Yang wrote:
>>> This version is based on tip/tip.git objtool/core branch [1], add some weak
>>> and arch-specific functions to make the generic code more readable, tested
>>> with the latest upstream mainline Binutils, GCC and Clang.
>>
>> ...
>>
>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=objtool/core
>>>
>>> Tiezhu Yang (9):
>>>   objtool: Handle various symbol types of rodata
>>>   objtool: Handle different entry size of rodata
>>>   objtool: Handle PC relative relocation type
>>>   objtool: Handle unreachable entry of rodata
>>>   objtool/LoongArch: Add support for switch table
>>>   objtool/LoongArch: Add support for goto table
>>>   LoongArch: Enable jump table for objtool
>>>   LoongArch: Convert unreachable() to BUG()
>>>   drm/amd/display: Mark dc_fixpt_from_fraction() noinline
>>
>> Are you OK with the first 8 patches?
>> What's the merge plan for this series?
>
> Sorry, my inbox is still reeling from the holidays.  I will review this
> soon.

What are the status of the first 8 patches?
What is the next step? Is there anything else to be done here?
I would really appreciate any advice on how to get this merged.

Thanks,
Tiezhu

