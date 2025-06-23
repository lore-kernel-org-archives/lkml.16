Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D28C1FBEBD;
	Mon, 23 Jun 2025 09:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750671761; cv=none; b=lXv6anJvmTqL+Gjeq4wJf3ELHFoIi7EDes5lyxcajSEnwplo4TSpoPDRf7swUQk2WRX71Dm3NCqKhLENKL7KF0Dfw7BXJf6UVeSP+oq95sK5laMLwpkSaGKCG92ZkkApmvwzFLQKXZYAKv7/RQpXCn71EjNylic++Mm8yft1/a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750671761; c=relaxed/simple;
	bh=CLokeqalV++KeXWuo7z4YXVqDJENPsLQkL3BLjlU7ZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kAlIDM4r+g+ISwo2jY63/IDF9mQDCL2nekJuB1W96HwdMV2qI8jkOzw4hcEJncyyYnbA/8BqxWy2UomdH62JsUfGiQZEvMstkpoaXlEGrRUbRj1s4RyM9EAddfVCGpV8YEQnKCFplqy1io+tP6TT5lQbWUGXyxzEeIWPnf4dJjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from [192.168.33.186] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowAC3Kdh8IVloO6CpCA--.44794S2;
	Mon, 23 Jun 2025 17:42:21 +0800 (CST)
Message-ID: <8c9b26f3-e782-437c-9930-2996fc625542@iscas.ac.cn>
Date: Mon, 23 Jun 2025 17:42:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] riscv: dts: spacemit: Add DMA translation buses for
 K1
To: Guodong Xu <guodong@riscstar.com>, Yixun Lan <dlan@gentoo.org>
Cc: Alex Elder <elder@ieee.org>, Ze Huang <huangze@whut.edu.cn>,
 spacemit@lists.linux.dev, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250617-k1-dma-buses-rfc-wip-v1-1-c8ec192fbf58@iscas.ac.cn>
 <5cc644f8-7394-48f2-b62b-1e7cd5ce27d3@ieee.org>
 <9e5e54a9-ef90-4a87-b082-d6eb9c7468c5@iscas.ac.cn>
 <20250620105619-GYA165049@gentoo>
 <CAH1PCMZibCc-P7JQf4WyhkKuT607bWppKfKQ-7eo7-PyNGDAOg@mail.gmail.com>
 <20250620145751-GYB165049@gentoo> <20250623070147-GYA193822@gentoo>
 <CAH1PCMaCjM1xH9UMmOAPn62T-qicWVCZ4Lbej2XYgKZUJ+zy8g@mail.gmail.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <CAH1PCMaCjM1xH9UMmOAPn62T-qicWVCZ4Lbej2XYgKZUJ+zy8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qwCowAC3Kdh8IVloO6CpCA--.44794S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFWrJry3uFyDtFykGF1DGFg_yoW8uryUpF
	WrJa45tFykJry5Cr1Svr4jyF40qry8urZ8XFZ8KryxuFZ0gr18XFW8tw4j9F93urn5Cr42
	vw1jqasxua45AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8Jr0_Cr
	1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07beFxUUUUUU=
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/

Hi Guodong and Yixun,

>>>>> <snip>
>>>>>
>>>>>> By the way, I don't think I will be making an RFC v2 of this. I think we
>>>>>> should get everything sorted under this one thread.
>>>>>>
>>>>> Instead, from a SoC tree maintainer's perspective (whom taking care of
>>>>> merging all the dts files), I'd rather perfer an independent or
>>>>> separated patch for this given every party reached consesus, so we could
>>>>> get this patch merged first and early, instead of getting them distributed all
>>>>> over in different series, IMO, separated patches brings more dedependencies
>>>>> if more than two series require one bus and result in more merge conflicts..
>>>>> Besides, introducing new busses result in re-arrangement of previous nodes,
>>>>> those like uart, i2c (even they have no DMA feature implemented currently)..
>>>>>
>>>> Hi Yixun,
>>>>
>>>> So, here is my proposed plan: I will submit two patches. The first
>>>> patch will introduce the dma-bus node and move the relevant (uart0, uart2
>>>> ..uart9) device nodes under it. The second patch will then add the pdma0
>>>> node itself. Please let me know if you have a different approach in mind.
>>>>
>>> ..
>>>> Maybe you want to see an independent patchset with just the first patch? This
>>>> way it can be merged early without waiting for the pdma0 series.
>>>> Let me know. Thanks.
>>> yes, I prefer this way, this will also help other drivers - usb/emac,
>>> since they all wait for those bus nodes..
>>>
>>> please submit following two parts a) introduce bus b) move relevant nodes.
>>> notice, I don't mind who (you or Vivian) doing the job, but keep in
>>> mind don't duplicate the work..
>>>
>> to make it clear, I'd like to see all relevant *bus nodes added in one
>> independent series, not only dma-bus, even some nodes currently not used.
>> the goal here is "do it once, and do it well"
>>
>> in fact, I'd expect Vivian(or Guodong, whoever) to send a new version
>> of this patch without RFC prefix..
>>
> I'm ok if Vivian can do that.
> Thanks.

I will post v1 of this series soon.

Thanks,
Vivian "dramforever" Wang

