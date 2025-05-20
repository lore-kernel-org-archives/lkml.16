Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE0326773C
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732476; cv=none; b=d1KzX4i7RJyuxlvdknMooHfyHq/Ky8L87oWu0NthGXkZ5sAt/booq18CS/t7drd23KKdFZ9hTfw7PvUXRi5b0kdoTMUM3RZ2bk2s5zWk107OLjwyiKRGkg5n4qI9gnW+qPRW089yct3Ij+uj6BZbN5np0YBQ38JjlzIgE7OOdpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732476; c=relaxed/simple;
	bh=+G29v+ogLqLPL/0G7HTPE8KmEfe0mSOk6fbW/Vm8sG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r6CiRLizy4Pyi9T8XK7GuQAD2v6nXRqdlj1weCUnJ+58rE+PzDp2SxNShSGansZ+DM691hBkQvOn8QIWacHHXEIfmK03VqnMdtze/Joe9uIIxYGK2VTW9n7rPNc6Xcm3rfTstPrVGMjT4CizLo4ShqeCx4gdhnorHylcst6P4ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h/bKx850; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h/bKx850"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747732473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZJTOBMlTlNPP2FNS/azBK/bEROBAE69fDrYhowmzN0g=;
	b=h/bKx8507L6J80c1GCIGO8odbcl10OCST6jmjt4b6MmbNVkBr47Lqd0K7c9j796ZH28g/e
	5BnGLun0WxX8qRL/U/CC+3dnRoZP1Npna/WvNUpxu9sax0ZuEnP1iGJ9cnlo2QLLNgzNiu
	QeH3NEEsgDxuosoxmZLBYPOu2QiPmbw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-HOql39RPNvKmMU5GekszeA-1; Tue, 20 May 2025 05:14:31 -0400
X-MC-Unique: HOql39RPNvKmMU5GekszeA-1
X-Mimecast-MFC-AGG-ID: HOql39RPNvKmMU5GekszeA_1747732471
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-445135eb689so16396915e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 02:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747732470; x=1748337270;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZJTOBMlTlNPP2FNS/azBK/bEROBAE69fDrYhowmzN0g=;
        b=oKOLH40u+D7nwEMZ5Du7ddMrQ09V27ze16ElDP63813+BnOy4iiXEV7KY203mdzMDy
         V+DYgc813h795jQZT6g/jhgCuHktDw49fssIGdLUfkES3oatEQVhNMtUbJ6xzMKrh4ZV
         JgjSfOrMBl77L33ooocj/9QFgOMp8sqR3ZqmgnT+97pDnjMMP3stHcRUrkUZ7OW12VM2
         TV9huQHGuhtBoOx161MBrt8+jtmJu4wiP9SsAOnRj3RW8N+VbtkHNhLF7hs+6pTJ8i5m
         rdP1nXgN6n9D7BRnHnRHHRWIftm7PlldH19L9AYsa4iUTliBK3v7Cn4nTAvCjHxb3GQX
         W8jQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9lBc2iK3TPYowhhqde9unze3Ic/8qsenseocVR8i9eHSCD3EieoDzZYts5yzrYbGr+k4veadlDBKdk58=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP2+ohec5w2SIr/lE41zeXnJuxYTMUjYG9DHjCUx/2QYmaCjll
	+I6zTk/vHUfDEuusKx0fIIrqdD3jhCYDrTVG1LJzFFUFM3sANBBhINHVcxSPlJuaShsya8G7ZbO
	eSK442riGUubSlmjbkd646QVRGC//Wk7LOXCONzkdmm56Kjq7NIQtSDC+MqnQadS66w==
X-Gm-Gg: ASbGncvUy3MazGLTIWI3RJG6Djkh1zz4rwiXBFxFqdSmupGCJYTV0rGDNSLsNlpeDUz
	S6mX5jI6rfD8gdKJ7Fa8ZKa5zj9VbjCp1mbRGg806iZj0MrKjL5rorlGD6hna5W2zP/QZS8FCzl
	Ew9aC0v/B92F4ZoduIdCQgW4kUHZBJOytClE3DQ9cOK+hSI6ItqSdAZC6Lv0Kkn5poiEEpfUSon
	wpazR7CRKJ+KdKb7kSQkLp4fCM3NnzIQvziKUI/EWon/eq46J+BXWNvLKB3d7NdnwsKTgRHJsJm
	PMzAMlnytKlLdmocELvgNlxGW+YEyI6TEoKDYNQaWPVPMm1vTQ2tOvp4chkI4k8gVUzC9lULDwX
	Hbo2/fc+JUuAM62sC7VbbppF2fXb2BlpHeFZwnac=
X-Received: by 2002:a05:6000:2907:b0:3a3:64b7:6206 with SMTP id ffacd0b85a97d-3a364b76415mr9743328f8f.23.1747732470605;
        Tue, 20 May 2025 02:14:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELMRoyUb9B3CaSwn6aeLm29eDIv1JwJLh9XwSyajwCeGHStBwP7y68AeGNILCinRr/i6UJUA==
X-Received: by 2002:a05:6000:2907:b0:3a3:64b7:6206 with SMTP id ffacd0b85a97d-3a364b76415mr9743306f8f.23.1747732470226;
        Tue, 20 May 2025 02:14:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f16:e400:525a:df91:1f90:a6a8? (p200300d82f16e400525adf911f90a6a8.dip0.t-ipconnect.de. [2003:d8:2f16:e400:525a:df91:1f90:a6a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a84csm15726820f8f.31.2025.05.20.02.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 02:14:29 -0700 (PDT)
Message-ID: <d2751191-fc32-418a-8b62-dedab41d0615@redhat.com>
Date: Tue, 20 May 2025 11:14:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/cma: make detection of highmem_start more robust
To: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Pratyush Yadav
 <ptyadav@amazon.de>, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250519171805.1288393-1-rppt@kernel.org>
 <aCw9mpmhx9SrL8Oy@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aCw9mpmhx9SrL8Oy@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.05.25 10:30, Oscar Salvador wrote:
> On Mon, May 19, 2025 at 08:18:05PM +0300, Mike Rapoport wrote:
>> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>>
>> Pratyush Yadav reports the following crash:
>>
>>      ------------[ cut here ]------------
>>      kernel BUG at arch/x86/mm/physaddr.c:23!
>>      ception 0x06 IP 10:ffffffff812ebbf8 error 0 cr2 0xffff88903ffff000
>>      CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.15.0-rc6+ #231 PREEMPT(undef)
>>      Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Arch Linux 1.16.3-1-1 04/01/2014
>>      RIP: 0010:__phys_addr+0x58/0x60
>>      Code: 01 48 89 c2 48 d3 ea 48 85 d2 75 05 e9 91 52 cf 00 0f 0b 48 3d ff ff ff 1f 77 0f 48 8b 05 20 54 55 01 48 01 d0 e9 78 52 cf 00 <0f> 0b 90 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90
>>      RSP: 0000:ffffffff82803dd8 EFLAGS: 00010006 ORIG_RAX: 0000000000000000
>>      RAX: 000000007fffffff RBX: 00000000ffffffff RCX: 0000000000000000
>>      RDX: 000000007fffffff RSI: 0000000280000000 RDI: ffffffffffffffff
>>      RBP: ffffffff82803e68 R08: 0000000000000000 R09: 0000000000000000
>>      R10: ffffffff83153180 R11: ffffffff82803e48 R12: ffffffff83c9aed0
>>      R13: 0000000000000000 R14: 0000001040000000 R15: 0000000000000000
>>      FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
>>      CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>      CR2: ffff88903ffff000 CR3: 0000000002838000 CR4: 00000000000000b0
>>      Call Trace:
>>       <TASK>
>>       ? __cma_declare_contiguous_nid+0x6e/0x340
>>       ? cma_declare_contiguous_nid+0x33/0x70
>>       ? dma_contiguous_reserve_area+0x2f/0x70
>>       ? setup_arch+0x6f1/0x870
>>       ? start_kernel+0x52/0x4b0
>>       ? x86_64_start_reservations+0x29/0x30
>>       ? x86_64_start_kernel+0x7c/0x80
>>       ? common_startup_64+0x13e/0x141
>>
>>    The reason is that __cma_declare_contiguous_nid() does:
>>
>>            highmem_start = __pa(high_memory - 1) + 1;
>>
>>    If dma_contiguous_reserve_area() (or any other CMA declaration) is
>>    called before free_area_init(), high_memory is uninitialized. Without
>>    CONFIG_DEBUG_VIRTUAL, it will likely work but use the wrong value for
>>    highmem_start.
>>
>> The issue occurs because commit e120d1bc12da ("arch, mm: set high_memory in
>> free_area_init()") moved initialization of high_memory after the call to
>> dma_contiguous_reserve() -> __cma_declare_contiguous_nid() on several
>> architectures.
>>
>> In the case CONFIG_HIGHMEM is enabled, some architectures that actually
>> support HIGHMEM (arm, powerpc and x86) have initialization of high_memory
>> before a possible call to __cma_declare_contiguous_nid() and some
>> initialized high_memory late anyway (arc, csky, microblase, mips, sparc,
>> xtensa) even before the commit e120d1bc12da so they are fine with using
>> uninitialized value of high_memory.
>>
>> And in the case CONFIG_HIGHMEM is disabled high_memory essentially becomes
>> the first address after memory end, so instead of relying on high_memory to
>> calculate highmem_start use memblock_end_of_DRAM() and eliminate the
>> dependency of CMA area creation on high_memory in majority of
>> configurations.
>>
>> Reported-by: Pratyush Yadav <ptyadav@amazon.de>
>> Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> 
> I will note though that it is a bit akward to have highmem involved here
> when we might not have CONFIG_HIGHMEM enabled.
> I get that for !CONFIG_HIGHMEM it is a no-op situation, but still I
> wonder whether we could abstract that from this function.

Same thought here.

Can't we do some IS_ENABLED(CONFIG_HIGHMEM) magic or similar to not even 
use that variable without CONFIG_HIGHMEM?

-- 
Cheers,

David / dhildenb

