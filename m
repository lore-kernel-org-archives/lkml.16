Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D902928DF09;
	Tue, 10 Jun 2025 12:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557287; cv=none; b=YhZiVOnLSPsHMOnBQULRTd7uB2ctaBW4n+lljV1zM7otTCmVhEjADY3jQA9+w18aFbZMHHS8DwfjJ4T1pjHZ5795bkjO9FBhjRFox8O9D0lvbhLu83qrhFavDJjTQWUcYktDo58dAoDvwH1Qr2BGdXhinBPD8UHhCCegSEZNc2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557287; c=relaxed/simple;
	bh=ZzwZmuX1CS+0FiTnplkgygNLxQDbq90B2AuoJJnwJD4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=if/fzPsfT54D+0GIvQnQAvZgNg/Kb+/k9Hi77MBObloiIJiE1c8GcFtAQgBGOP/LhBkgH/4BOYmrl1J5ygrSoat88xRxF2mxtyYJh26IAPMvpQGX9IL0720fdlfNn6ZSO8aO4hB51KcH50P0D8sXSAXb+OBZlsCy9kmFXWKNJnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8Axz3MiIEhoqagSAQ--.45708S3;
	Tue, 10 Jun 2025 20:08:02 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowMAxzMQbIEhoQ1gUAQ--.62619S3;
	Tue, 10 Jun 2025 20:07:57 +0800 (CST)
Subject: Re: [PATCH v4 0/2] Loongarch irq-redirect supprot
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org,
 si.yanteng@linux.dev, tglx@linutronix.de, jiaxun.yang@flygoat.com,
 peterz@infradead.org, wangliupu@loongson.cn, lvjianmin@loongson.cn,
 maobibo@loongson.cn, siyanteng@cqsoftware.com.cn, gaosong@loongson.cn,
 yangtiezhu@loongson.cn, loongarch@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Super User <root@localhost.localdomain>
References: <20250610114252.21077-1-zhangtianyang@loongson.cn>
 <CAAhV-H5XB7sVf0UoUmXHDeTXA8tncJhV2LexLgc-Z1Hebsijtw@mail.gmail.com>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <91858552-2ccd-73af-1f5c-962682952a99@loongson.cn>
Date: Tue, 10 Jun 2025 20:07:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5XB7sVf0UoUmXHDeTXA8tncJhV2LexLgc-Z1Hebsijtw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMAxzMQbIEhoQ1gUAQ--.62619S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZFyDWry5XrW8Cw4DXw1xtFc_yoW5JF1DpF
	WDuas0kF4rCrn7C3ZF9a40vrW5AFyxGrW2q3W2g343ur98uwnFvF10yFZ8uFn7Ga17tw10
	9F15Xa4DWFn8AacCm3ZEXasCq-sJn29KB7ZKAUJUUUUk529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUstxhDUUUU

Hi, Huacai

在 2025/6/10 下午7:54, Huacai Chen 写道:
> Hi, Tianyang,
>
> Have you received my comments in V3?
> https://lore.kernel.org/loongarch/20250523101833.17940-1-zhangtianyang@loongson.cn/T/#m2883f379ce7eb663f3f3eb4736bf9b071c7fd8ab
>
> Huacai

Sorry, except for a slight network issue, I did not receive the email 
mentioned above.

I will reply to the email first and continue to modify this series of 
patches

Tianyang

> On Tue, Jun 10, 2025 at 7:43 PM Tianyang Zhang
> <zhangtianyang@loongson.cn> wrote:
>> From: Super User <root@localhost.localdomain>
>>
>> This series of patches introduces support for interrupt-redirect
>> controllers, and this hardware feature will be supported on 3C6000
>> for the first time
>>
>> change log:
>>          v0->v1:
>>          1.Rename the model names in the document.
>>          2.Adjust the code format.
>>          3.Remove architecture - specific prefixes.
>>          4.Refactor the initialization logic, and IR driver no longer set AVEC_ENABLE.
>>          5.Enhance compatibility under certain configurations.
>>
>>          v1->v2:
>>          1.Fixed an erroneous enabling issue.
>>
>>          v2->v3
>>          1.Replace smp_call with address mapping to access registers
>>          2.Fix some code style issues
>>
>>          v3->v4
>>          1.Provide reasonable comments on the modifications made to IRQ_SET_MASK_OK_DONE
>>          2.Replace meaningless empty functions with parent_mask/unmask/ack
>>          3.Added and indeed released resources
>>          4.Added judgment for data structure initialization completion to avoid duplicate creation during cpuhotplug
>>          5.Fixed the code style and some unnecessary troubles
>>
>> Tianyang Zhang (2):
>>    Docs/LoongArch: Add Advanced Extended-Redirect IRQ model description
>>    irq/irq-loongarch-ir:Add Redirect irqchip support
>>
>>   .../arch/loongarch/irq-chip-model.rst         |  38 ++
>>   .../zh_CN/arch/loongarch/irq-chip-model.rst   |  37 ++
>>   arch/loongarch/include/asm/cpu-features.h     |   1 +
>>   arch/loongarch/include/asm/cpu.h              |   2 +
>>   arch/loongarch/include/asm/loongarch.h        |   6 +
>>   arch/loongarch/kernel/cpu-probe.c             |   2 +
>>   drivers/irqchip/Makefile                      |   2 +-
>>   drivers/irqchip/irq-loongarch-avec.c          |  25 +-
>>   drivers/irqchip/irq-loongarch-ir.c            | 562 ++++++++++++++++++
>>   drivers/irqchip/irq-loongson.h                |  12 +
>>   include/linux/cpuhotplug.h                    |   1 +
>>   11 files changed, 674 insertions(+), 14 deletions(-)
>>   create mode 100644 drivers/irqchip/irq-loongarch-ir.c
>>
>> --
>> 2.41.0
>>

