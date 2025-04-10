Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C1D1372
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291088; cv=none; b=fcONAE7jQAwd4U1sLKOiIpoylLFd/o2LwTvvDu8uOurpdHLeNvui7kJfoIR80XvGsUBYrJVE8jJBs6xwkV6KGJJ1NY3lUc6iiSHJWvNOlRK2qGXqODuodlHEKiHTvjCzaDbH9bBrfLK7usha421EfgsmoSyIlmuaU77T+Mn+pB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291088; c=relaxed/simple;
	bh=5wDIyjy1FA7YNlAf1AI1AUf2HITeMgYjuHU8D8dlSTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yzi/SIrtFyAnA75BQZy6HlFZ77R6QFprB4/qpltct2R4qVVXZoWASGAYcd3sk1FYqKlMarIEmGng5708WOCxkJyDP65Wwjw3w+3aoIOI1vbMs9muJaCf/IyM1q80hr4UfG5sXEA57zfLdQ54QN/2ToMQXf9rRvvKzOWibrvOJ7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hQBwW6ZH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hQBwW6ZH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744291085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qYdozQ83pAfI2LS/ciFqTknVkAqAgJBo7C9zCgCmzPs=;
	b=hQBwW6ZHn1mxiOIWk88U4HV4s+/94DYGzvyNsyYYQaeTqFm5CKouKtebeyeKXN4+vQ4fy/
	YvoyJ79/q1PVQuoQ4X/t0NbKlpajlFv6wVGEKsTlmTvbbVLqmg1F53NnDJg8MQuRFHRe0b
	Z4vIlY/AmRKTkotuO4ATHmIFVsN7SMo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-p27tHqPQN-OrKVreP8uzUg-1; Thu, 10 Apr 2025 09:18:04 -0400
X-MC-Unique: p27tHqPQN-OrKVreP8uzUg-1
X-Mimecast-MFC-AGG-ID: p27tHqPQN-OrKVreP8uzUg_1744291082
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912fe32b08so437389f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744291082; x=1744895882;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qYdozQ83pAfI2LS/ciFqTknVkAqAgJBo7C9zCgCmzPs=;
        b=VhshPYHNA4jBZj6qLPfbv2/Lg5G9dMT2JIX5ACc8Y8vYtyR/6cgYGQSIkFLY0fVlbE
         NjZzOkiYg0Pk6xRFJY3sfP/iYpYGOvzcrNgEELPrgYNHAeVDbSgjE26vgSwr9UB9CIhY
         asXiHvZh39sUfevsEslkY1DJSmS7b6vAdTnA48SAr7v0wPr0hmRMNWC+ehEa4IJ69pez
         zKA3RYvzQq0WvisH5kPYyK6caHxj9gPjkUwdeC2ZOWprSaI+jmPJuc5iUgy8JkhJvwOQ
         BhfxsjBVGGC3+hla2i2c5UTRgf2W8Ns/8+9n0+QRToQ7rA89kEFeYzzk6F+TIHliaJBa
         H49w==
X-Gm-Message-State: AOJu0YxRB+qW/XcwrLkZQB7eDY3dGOgqrZBcFOW0stW6sIZ5Um1f71W3
	G29MLd5C4qMFxOdjpeMyLJDJOnFABBy0NLSzgM7KMrWVHl4V6Plj3NNg1VNvx/TqJT5XJDpqG4T
	p0XgVQzlua3cldw9BBUZ+/hdnFbNS04YzfoaGfZf7jl7eeoFTVZ0pNnt5O9IQ7Q==
X-Gm-Gg: ASbGncvKnKS1et6UFmPC3xeD2eG19fehhhU73bzL936RaNTySzOfbIwN8M38B35e4QK
	MDLiS/nGoQhzkl4T9+spwrfZ8D8+LplMHdK3YTYXj/WTjaBHv9cnr5Ht4tseYKRjTuRGhVkr1bb
	LZM90rY4I2IxtljNqpGC+luGdBvWUC8OSzicxhu8aPssW4K+plzycjXUCeN/zJmFSVQgbz7JJbr
	wX8vzWYoReuOzNlEYyLHdJAhsQuM7/W94KEfL8/qqui6vpKaGrqnDnLQ3L7EtdBgFtwJlAnfHXo
	olqS535v3IunNVyN2Afl3imQdNCNB/2Z1oDEc3lry1addv+wHKgDWWUdbzgcRAsM4BJdIPWzrNm
	EKmbwRbPJuIp7klnjB82/aeZN/+M2n7QpaMLaC+k=
X-Received: by 2002:a5d:648a:0:b0:39a:c80b:8288 with SMTP id ffacd0b85a97d-39d8f498932mr2498932f8f.33.1744291082435;
        Thu, 10 Apr 2025 06:18:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmWbn02yU/ZyPUWLVFCTg5rw0wbi12tRQIvd2Hr2/9QbAZJOu03RqeRA86JksV54Hn1j+zLA==
X-Received: by 2002:a5d:648a:0:b0:39a:c80b:8288 with SMTP id ffacd0b85a97d-39d8f498932mr2498889f8f.33.1744291081873;
        Thu, 10 Apr 2025 06:18:01 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71a:5900:d106:4706:528a:7cd5? (p200300cbc71a5900d1064706528a7cd5.dip0.t-ipconnect.de. [2003:cb:c71a:5900:d106:4706:528a:7cd5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893611dcsm4754879f8f.9.2025.04.10.06.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 06:18:01 -0700 (PDT)
Message-ID: <9deb3725-8991-43d1-8c3d-56523fabff28@redhat.com>
Date: Thu, 10 Apr 2025 15:18:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/base/memory: Avoid overhead from
 for_each_present_section_nr()
To: Gavin Shan <gshan@redhat.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, adityag@linux.ibm.com,
 donettom@linux.ibm.com, osalvador@suse.de, gregkh@linuxfoundation.org,
 rafael@kernel.org, dakr@kernel.org, akpm@linux-foundation.org,
 shan.gavin@gmail.com
References: <20250410125110.1232329-1-gshan@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250410125110.1232329-1-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.04.25 14:51, Gavin Shan wrote:
> for_each_present_section_nr() was introduced to add_boot_memory_block()
> by commit 61659efdb35c ("drivers/base/memory: improve add_boot_memory_block()").
> It causes unnecessary overhead when the present sections are really
> sparse. next_present_section_nr() called by the macro to find the next
> present section, which is far away from the spanning sections in the
> specified block. Too much time consumed by next_present_section_nr()
> in this case, which can lead to softlockup as observed by Aditya Gupta
> on IBM Power10 machine.
> 
>    watchdog: BUG: soft lockup - CPU#248 stuck for 22s! [swapper/248:1]
>    Modules linked in:
>    CPU: 248 UID: 0 PID: 1 Comm: swapper/248 Not tainted 6.15.0-rc1-next-20250408 #1 VOLUNTARY
>    Hardware name: 9105-22A POWER10 (raw) 0x800200 opal:v7.1-107-gfda75d121942 PowerNV
>    NIP:  c00000000209218c LR: c000000002092204 CTR: 0000000000000000
>    REGS: c00040000418fa30 TRAP: 0900   Not tainted  (6.15.0-rc1-next-20250408)
>    MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 28000428  XER: 00000000
>    CFAR: 0000000000000000 IRQMASK: 0
>    GPR00: c000000002092204 c00040000418fcd0 c000000001b08100 0000000000000040
>    GPR04: 0000000000013e00 c000c03ffebabb00 0000000000c03fff c000400fff587f80
>    GPR08: 0000000000000000 00000000001196f7 0000000000000000 0000000028000428
>    GPR12: 0000000000000000 c000000002e80000 c00000000001007c 0000000000000000
>    GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>    GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>    GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>    GPR28: c000000002df7f70 0000000000013dc0 c0000000011dd898 0000000008000000
>    NIP [c00000000209218c] memory_dev_init+0x114/0x1e0
>    LR [c000000002092204] memory_dev_init+0x18c/0x1e0
>    Call Trace:
>    [c00040000418fcd0] [c000000002092204] memory_dev_init+0x18c/0x1e0 (unreliable)
>    [c00040000418fd50] [c000000002091348] driver_init+0x78/0xa4
>    [c00040000418fd70] [c0000000020063ac] kernel_init_freeable+0x22c/0x370
>    [c00040000418fde0] [c0000000000100a8] kernel_init+0x34/0x25c
>    [c00040000418fe50] [c00000000000cd94] ret_from_kernel_user_thread+0x14/0x1c
> 
> Avoid the overhead by folding for_each_present_section_nr() to the outer
> loop. add_boot_memory_block() is dropped after that.
> 
> Fixes: 61659efdb35c ("drivers/base/memory: improve add_boot_memory_block()")
> Closes: https://lore.kernel.org/linux-mm/20250409180344.477916-1-adityag@linux.ibm.com
> Reported-by: Aditya Gupta <adityag@linux.ibm.com>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   drivers/base/memory.c | 41 +++++++++++++++++------------------------
>   1 file changed, 17 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index 8f3a41d9bfaa..19469e7f88c2 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -816,21 +816,6 @@ static int add_memory_block(unsigned long block_id, unsigned long state,
>   	return 0;
>   }
>   
> -static int __init add_boot_memory_block(unsigned long base_section_nr)
> -{
> -	unsigned long nr;
> -
> -	for_each_present_section_nr(base_section_nr, nr) {
> -		if (nr >= (base_section_nr + sections_per_block))
> -			break;
> -
> -		return add_memory_block(memory_block_id(base_section_nr),
> -					MEM_ONLINE, NULL, NULL);
> -	}
> -
> -	return 0;
> -}
> -
>   static int add_hotplug_memory_block(unsigned long block_id,
>   				    struct vmem_altmap *altmap,
>   				    struct memory_group *group)
> @@ -957,7 +942,7 @@ static const struct attribute_group *memory_root_attr_groups[] = {
>   void __init memory_dev_init(void)
>   {
>   	int ret;
> -	unsigned long block_sz, nr;
> +	unsigned long block_sz, block_id, nr;
>   
>   	/* Validate the configured memory block size */
>   	block_sz = memory_block_size_bytes();
> @@ -970,15 +955,23 @@ void __init memory_dev_init(void)
>   		panic("%s() failed to register subsystem: %d\n", __func__, ret);
>   
>   	/*
> -	 * Create entries for memory sections that were found
> -	 * during boot and have been initialized
> +	 * Create entries for memory sections that were found during boot
> +	 * and have been initialized. Use @block_id to track the last
> +	 * handled block and initialize it to an invalid value (ULONG_MAX)
> +	 * to bypass the block ID matching check for the first present
> +	 * block so that it can be covered.
>   	 */
> -	for (nr = 0; nr <= __highest_present_section_nr;
> -	     nr += sections_per_block) {
> -		ret = add_boot_memory_block(nr);
> -		if (ret)
> -			panic("%s() failed to add memory block: %d\n", __func__,
> -			      ret);
> +	block_id = ULONG_MAX;
> +	for_each_present_section_nr(0, nr) {
> +		if (block_id != ULONG_MAX && memory_block_id(nr) == block_id)
> +			continue;
> +
> +		block_id = memory_block_id(nr);
> +		ret = add_memory_block(block_id, MEM_ONLINE, NULL, NULL);
> +		if (ret) {
> +			panic("%s() failed to add memory block: %d\n",
> +			      __func__, ret);
> +		}
>   	}
>   }
>   

Staring at the end result and the particularly long comment, are we now 
really any better than before 61659efdb35c?

Revert instead?

-- 
Cheers,

David / dhildenb

