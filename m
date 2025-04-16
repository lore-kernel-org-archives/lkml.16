Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11813F9DA;
	Wed, 16 Apr 2025 02:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744770655; cv=none; b=lre9hzb/t1qfoPiZ+v7J/dedaK/Bv7Y5MY+uTMZ2yABPqAvK0TsTgBKjy2VFIyAeovGaL1Pw6OyxKBjY1h/pcqgEjbEYF8pxYJYKrpLBSEOkWSgxy9Up4bYnVM6+pRJK/0qzTdGyaPPl1QRVGNQhotEOyRhsqgmnCNC1LfBYF1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744770655; c=relaxed/simple;
	bh=JWhq+XXYyMJEFwa1sLaoVo607RP3LT68poj4yLhNFsg=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=YLeTTA7EBE1HDkZNgSYMuyL4nN9BiDMCoZe5jff/X6kLE+EjOBQhMMVT5x7VzRZwkRLTz3nJ7dx78N5u0s486gPsCTEvoI6CPWU88ooLcGESFCinu3c1tfcuU4RxoDtfgsldMqF7DbLfuu+Jnb1oM6z7rMHeHZxPfBVEu2K+3jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8Bx365NFv9nDhu_AA--.36522S3;
	Wed, 16 Apr 2025 10:30:37 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowMCx7xtHFv9nv_SEAA--.63165S3;
	Wed, 16 Apr 2025 10:30:36 +0800 (CST)
Subject: Re: [PATCH v2 1/2] Docs/LoongArch: Add Advanced Extended-Redirect IRQ
 model description
To: Yanteng Si <si.yanteng@linux.dev>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, tglx@linutronix.de,
 jiaxun.yang@flygoat.com, peterz@infradead.org, wangliupu@loongson.cn,
 lvjianmin@loongson.cn, maobibo@loongson.cn, siyanteng@cqsoftware.com.cn,
 gaosong@loongson.cn, yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250331064116.32540-1-zhangtianyang@loongson.cn>
 <20250331064116.32540-2-zhangtianyang@loongson.cn>
 <d9b6f34c-95f2-45f6-b5dc-89098d1f8d22@linux.dev>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <3f31ead7-f342-1d64-edf0-902779613537@loongson.cn>
Date: Wed, 16 Apr 2025 10:29:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <d9b6f34c-95f2-45f6-b5dc-89098d1f8d22@linux.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMCx7xtHFv9nv_SEAA--.63165S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ur1xWF18WFWUZw1rCw15Awc_yoW8Xryfpr
	Z7CFn3JFZ3J34xGF1fu3WUXry3J3WxCa1YqF1fCF18Xwn8ur1vqr18XryvgFy5Ww4vyay0
	gr4rGF98uF1UAwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUf529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUP0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1D
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
	0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8Dl1DUUUUU==

Hi, Yanteng

在 2025/4/1 上午9:39, Yanteng Si 写道:
>
> 在 3/31/25 2:41 PM, Tianyang Zhang 写道:
>> Introduce the redirect interrupt controllers.When the redirect interrupt
>> controller is enabled, the routing target of MSI interrupts is no 
>> longer a
>> specific CPU and vector number, but a specific redirect entry. The 
>> actual
>> CPU and vector number used are described by the redirect entry.
>>
>> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
>> ---
>>   .../arch/loongarch/irq-chip-model.rst         | 38 +++++++++++++++++++
>>   .../zh_CN/arch/loongarch/irq-chip-model.rst   | 37 ++++++++++++++++++
>>   2 files changed, 75 insertions(+)
>>
>> diff --git a/Documentation/arch/loongarch/irq-chip-model.rst 
>> b/Documentation/arch/loongarch/irq-chip-model.rst
>> index a7ecce11e445..84fafb86ec17 100644
>> --- a/Documentation/arch/loongarch/irq-chip-model.rst
>> +++ b/Documentation/arch/loongarch/irq-chip-model.rst
>> @@ -181,6 +181,44 @@ go to PCH-PIC/PCH-LPC and gathered by EIOINTC, 
>> and then go to CPUINTC directly::
>>                | Devices |
>>                +---------+
>
>> +Advanced Extended IRQ model (with redirection)
>> +===============
>
> Did you do the build test?
If you're referring to the equal sign alignment issue, this is indeed my 
oversight. Thank you for pointing it out.
>
>
>
> Thanks,
>
> Yanteng

