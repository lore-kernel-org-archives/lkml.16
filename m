Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27262367
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 03:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748315854; cv=none; b=Hfu2vfpTf+S/lctuGRIjVz2A3Q8AU1s9N1NZwGaQGPop09Kw97TkPDf0hoWvO7O8eDrX0nIOZxnU7OyQJkUBFz1WKIekJAPC9biddRCukI/DWG3G/I0DV+mLd+TTZGpJGiIdjgEdKuxF3mihdSPpufMIuSyiw7Gxmy3fRsfamho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748315854; c=relaxed/simple;
	bh=NZivm+ic3pknzIE+nWe+45uB4StQ36IKCGpSYcxRnIw=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=TKnTQq9GAVCLi5UTD1gWubjTYvv4up195gAUWLVXneERhA1T1VXHqcCMnUKUWUj+ARBcXyprgu2YuMBjVMpsgkokyNPmG3g7Zf0Eo8gGofl0s5RZkWS/cKgl/MJgJM8tB040NSpFAG+QMnOd7KWe9IdK9ob6+Bd0nk7EqomOFf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxlmnCLjVoEMT9AA--.15541S3;
	Tue, 27 May 2025 11:17:22 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBxn8W_LjVoyFD0AA--.40079S3;
	Tue, 27 May 2025 11:17:20 +0800 (CST)
Subject: Re: [RFC PATCH] LoongArch: Do not include larchintrin.h
To: Xi Ruoyao <xry111@xry111.site>, Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250520064936.32291-1-yangtiezhu@loongson.cn>
 <e005dd551aec8bea185b3d37295876bd75d7b3e4.camel@xry111.site>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <a918b221-b7f3-9994-9a7a-d10345aa30df@loongson.cn>
Date: Tue, 27 May 2025 11:17:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <e005dd551aec8bea185b3d37295876bd75d7b3e4.camel@xry111.site>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxn8W_LjVoyFD0AA--.40079S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kr45Kw47ZFy7Aw18WrWfWFX_yoW8tr48pr
	WDCwnIyrWkXr1fArnFk343Wr90yw47Ww12qFyYg34Ikr17WryIqw4rKrZxWF1Uta1FyF10
	qr17Ja4YvF1UArcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw
	1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-
	e5UUUUU==

On 2025/5/21 下午1:41, Xi Ruoyao wrote:
> On Tue, 2025-05-20 at 14:49 +0800, Tiezhu Yang wrote:
>> larchintrin.h is a system header of compiler, include it in the
>> kernel header may lead to the fatal error "'larchintrin.h' file
>> not found".
>>
>> There are two related cases so far:
>>
>> (1) When compiling samples/bpf, it has been fixed in the latest
>> kernel [1].
>>
>> (2) When running bcc script, it has been fixed in the latest
>> bcc [2] [3], like this:
>>
>> $ /usr/share/bcc/tools/filetop
>> In file included from <built-in>:4:
>> In file included from /virtual/include/bcc/helpers.h:54:
>> In file included from arch/loongarch/include/asm/page.h:7:
>> In file included from arch/loongarch/include/asm/addrspace.h:9:
>> arch/loongarch/include/asm/loongarch.h:11:10: fatal error: 'larchintrin.h' file not found
>>     11 | #include <larchintrin.h>
>>        |          ^~~~~~~~~~~~~~~
>> 1 error generated.
>>
>> Maybe there are same errors for the other unknown projects, it is
>> annoyance to add the include path each time. In order to avoid such
>> errors once and for all, do not include larchintrin.h, just use the
>> builtin functions directly.
> 
> Sorry, but in GCC those builtin functions are not documented and may
> subject to change in the future.  Only the larchintrin.h interface is
> documented.

AFAICT, the LoongArch Base Built-in Functions are listed in the GCC
documentation [1], they will not be changed easily and frequently in
my opinion.

__builtin_loongarch_cpucfg()
__builtin_loongarch_csrrd_w()
__builtin_loongarch_csrrd_d()
__builtin_loongarch_csrwr_w()
__builtin_loongarch_csrwr_d()
__builtin_loongarch_csrxchg_w()
__builtin_loongarch_csrxchg_d()
__builtin_loongarch_iocsrrd_w()
__builtin_loongarch_iocsrrd_d()
__builtin_loongarch_iocsrwr_w()
__builtin_loongarch_iocsrwr_d()

> Thus if you don't want to rely on GCC for those operations, you may need
> to write inline asm...

so these builtin functions can be used directly and safely.

[1] 
https://gcc.gnu.org/onlinedocs/gcc/LoongArch-Base-Built-in-Functions.html

Thanks,
Tiezhu

