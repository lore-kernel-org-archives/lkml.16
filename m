Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB5A20B22
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 01:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749086227; cv=none; b=VwkzbAbPD9m6186vZFdYJZwJK/ZbT3YSRX1WFTgbYrsCTDniHkdUSrq4gdqBqCkUPNm87dZdrXqwRhoh2r73hBQYl55P+U7fZXLJKPOmriDvRlipW/cKUa6a4lKuTI3IeEp+32pYfEPfQxSx5jQI4e94fEZnv8uFbGUtJ4ZUAxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749086227; c=relaxed/simple;
	bh=NgleEF0GmAK56MefLtpSyUrGHQR1CKQpfNOU4qf2W0k=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=oIdyXvQcZz2DYAcGWwsrmO07B/DdzmflR7P/T0qkYZJJ639UpyrMTLGo0XlXOuwNmLu3NedcSBkk4enHdGvDbgtMjBzSAlcSqjBOlCBc8miRMyS/hWMaoKU4jwbUA+RWdgv2zT/tSv3682G2PUk3T96pdRyDH9PrNAxtlkV17Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8Axz3MH8EBosysMAQ--.35660S3;
	Thu, 05 Jun 2025 09:16:55 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowMDxH+UF8EBoC2wKAQ--.33363S3;
	Thu, 05 Jun 2025 09:16:55 +0800 (CST)
Subject: Re: [PATCH] Loongarch:Fixed up panic cause by a NULL-pmd
To: Yanteng Si <si.yanteng@linux.dev>, chenhuacai@kernel.org,
 kernel@xen0n.name, zhanghongchen@loongson.cn, wangming01@loongson.cn,
 peterx@redhat.com
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250526065512.13215-1-zhangtianyang@loongson.cn>
 <1876bf9a-a77d-40a5-bedd-643df939bfbf@linux.dev>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <93915902-0a91-921f-1953-b35f1742efb6@loongson.cn>
Date: Thu, 5 Jun 2025 09:16:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1876bf9a-a77d-40a5-bedd-643df939bfbf@linux.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMDxH+UF8EBoC2wKAQ--.33363S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uFy8Cw13Cr18WFyUCFykWFX_yoW8Gw1rpF
	yUJw4rGw4fC3yDX3W2vw4kZF4vya4Ik3Wkur10qFykZwn5Jr1jqFy29ryS9r4UAr4rtay0
	qFWUtF90vr1UZagCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_
	JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2MKZDUUUU

Hi, Yanteng

在 2025/5/27 下午1:47, Yanteng Si 写道:
> 在 5/26/25 2:55 PM, Tianyang Zhang 写道:
>> From: zhangtianyang <zhangtianyang@loongson.cn>
>>
>> Fixes: bd51834d1cf6 ("LoongArch: Return NULL from huge_pte_offset() 
>> for invalid PMD")
>> ERROR INFO:
>>
>> CPU 25 Unable to handle kernel paging request at virtual address 0x0
>>           ...
>>   Call Trace:
>>   [<900000000023c30c>] huge_pte_offset+0x3c/0x58
>>   [<900000000057fd4c>] hugetlb_follow_page_mask+0x74/0x438
>>   [<900000000051fee8>] __get_user_pages+0xe0/0x4c8
>>   [<9000000000522414>] faultin_page_range+0x84/0x380
>>   [<9000000000564e8c>] madvise_vma_behavior+0x534/0xa48
>>   [<900000000056689c>] do_madvise+0x1bc/0x3e8
>>   [<9000000000566df4>] sys_madvise+0x24/0x38
>>   [<90000000015b9e88>] do_syscall+0x78/0x98
>>   [<9000000000221f18>] handle_syscall+0xb8/0x158
>>
>
>> In some cases, pmd may be NULL and rely on NULL as the return value
>> for processing, so it is necessary to determine this situation here
>
> Your description is a bit vague. Could you please specify
> on which machines and in what scenarios this bug can be
> reproduced? I believe such information should be included
> in the commit message.
>
> Thanks,
> Yanteng

Sorry for the late reply.

I will provide more detailed information in the commit of the next patch

Thanks

Tianyang

