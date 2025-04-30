Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E18B2110
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745975763; cv=none; b=ugHHnE81/jXtR0LU7pb5CoDjhI+UZGL0ve/BfCC82mxkZMkm51gi0Lk+8HoyMnONod846o0mgp0cm8UQsdR8agdeNn/3AKLCFSwV6LTi/ctMbDDq0W8JAwwVY1SVvCpBPtz2gvl2bODSoGSvuNnvzi999KiZiDLu4+Y9uEt/hdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745975763; c=relaxed/simple;
	bh=t0aXD3JL+luQqga4D/re4ukEhm5GSYKe7mt37z4f/lU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=FBKjUSL7NOZewB0a1X8PUyUt2UkePvxbKVB62/wZU4f/kojodlIWwsl/H3E4qGykEtZja62ThO9KIawQq3guXjk4ka0oPeAhf1mLj2A5A7sxme8ehpgsqWjbHrXJQj6K9YtLNdTgQr4C34aGfifGnikkHYOoGC0ACgUkIWzgTMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8DxvnPNeRFo6aDKAA--.40572S3;
	Wed, 30 Apr 2025 09:15:57 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowMBx3MTJeRFofjSfAA--.5036S3;
	Wed, 30 Apr 2025 09:15:55 +0800 (CST)
Subject: Re: [PATCH] LoongArch:support CONFIG_SCHED_MC
To: Xi Ruoyao <xry111@xry111.site>, chenhuacai@kernel.org, kernel@xen0n.name,
 wanghongliang@loongson.cn, yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250429113356.17929-1-zhangtianyang@loongson.cn>
 <f0d7965a0016f458bb06e2968c15d8eb46be296e.camel@xry111.site>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <ea8c9b7b-2ed2-98b9-e859-4843b0c87227@loongson.cn>
Date: Wed, 30 Apr 2025 09:15:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <f0d7965a0016f458bb06e2968c15d8eb46be296e.camel@xry111.site>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMBx3MTJeRFofjSfAA--.5036S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Aw1fJry5AFWUtF15JF47GFX_yoW8Cry7pr
	97AFn5GrW5KFn3Grsxt34UZryrJrZ7J3y2qr42ya48ur98Xwn0gr4jqr909F18Jws5G3yY
	qFy5Ww1a9F45X3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU70PfDUUU
	U

Hi, Ruoyao

在 2025/4/29 下午7:44, Xi Ruoyao 写道:
> On Tue, 2025-04-29 at 19:33 +0800, Tianyang Zhang wrote:
>> From: wanghongliang <wanghongliang@loongson.cn>
>>
>> In order to achieve more reasonable load balancing behavior,
>> support for SCHED_MC has been added.
>> The LLC distribution of Loongarch now is consistent with numa-node,
>> the balancing domain of SCHED_MC can effectively reduce the situation
>> where processes are awakened to smt_slibing
>>
>> Co-developed-by: wanghongliang <wanghongliang@loongson.cn>
>> Signed-off-by: wanghongliang <wanghongliang@loongson.cn>
>> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
>> ---
>>   arch/loongarch/Kconfig                |  9 ++++++
>>   arch/loongarch/include/asm/smp.h      |  1 +
>>   arch/loongarch/include/asm/topology.h |  8 +++++
>>   arch/loongarch/kernel/smp.c           | 46 +++++++++++++++++++++++++++
>>   4 files changed, 64 insertions(+)
>>
>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
>> index 1a2cf012b..72a142a85 100644
>> --- a/arch/loongarch/Kconfig
>> +++ b/arch/loongarch/Kconfig
>> @@ -493,6 +493,15 @@ config NR_CPUS
>>   	  This allows you to specify the maximum number of CPUs which this
>>   	  kernel will support.
>>   
>> +config SCHED_MC
>> +	def_bool y
>> +	prompt "Multi-core scheduler support"
>> +	depends on SMP
>> +	help
>> +	  Multi-core scheduler support improves the CPU scheduler's decision
>> +	  making when dealing with multi-core CPU chips at a cost of slightly
>> +	  increased overhead in some places. If unsure say N here.
> To me it's puzzling to say "if unsure say N here" while setting the
> default to y.
It's really confusing. I will make the necessary changes here. Thank you
>

