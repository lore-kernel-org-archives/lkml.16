Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED600291169
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926892; cv=none; b=LqPuBcZ6boVjO//90w6DisUSIuPhlcg7phX0FzJKdNGAdXWv8CDI1uWS1o9wEXD9pN1rKhZdn+b4zKdLrQpgzadN03S0m3sBFuvYgqE+OmMpc6npuHKu9cG9zIo3vyC39//1CAEbELfVt8/A+mh68YyAGEOsumBKSYp5G5sGrao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926892; c=relaxed/simple;
	bh=pzaefFd8IGstktmM/JVc6GqnOuiPyHx8FqmbuCrBwEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RkcBpwlfUzfjFhoeAKXumZvND6bDjc6SKPKjRNqK0ehcr3xXQ96wfih/Wi7FUJ/KpCzloepRLcYzcRQ2QlV/RqWQYfztmBppV+Rj0meIJZDx1/P0WRiVoGsLGL/LfdEPsSlPp3GUS7HYy25DuTAWeUBNutGgFrjj0RDB4CkOXuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HT3nNTFd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HT3nNTFd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747926889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7JYMI7LYWgp6z3rQ/on+fV5hlUyIolqkmdUowSNe14M=;
	b=HT3nNTFdLcfktsnVO8s2DXa8c9voT9mkYMKNBMeeRuYJgchDiL+/0BnWuEQmwc5cMnAzpI
	2fZVmBJA8TFq64vW040vi3TwolmQ8DOBwG3OKjuA2M1a23mJI02ST2RF3v+urjMy31CfBv
	gHRoyjycKNEThPPi63uIC2k3zpZhbBQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-wkYoZ9XHNc-xrnDS9fEdqw-1; Thu, 22 May 2025 11:14:48 -0400
X-MC-Unique: wkYoZ9XHNc-xrnDS9fEdqw-1
X-Mimecast-MFC-AGG-ID: wkYoZ9XHNc-xrnDS9fEdqw_1747926887
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-44b1f5b91c1so1760915e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:14:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926887; x=1748531687;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7JYMI7LYWgp6z3rQ/on+fV5hlUyIolqkmdUowSNe14M=;
        b=HDL3iG4+3JoI7eNOgS+sY20lNGYeOzb1kixojaZZ7XWY98iKTGNyGernDAraG9SYOe
         jI1RXqy0zhBc0CSsSNx82+QSDuiGjIsgU/rgl/Q9qDKvxNKbPJ5vsgdeqqfFv3NUGJu3
         RjJeG1O8m+tc5IzwSg/7u/PrEO4+BwDQlZ2l30OxKWvfV9lt3/qH/VJ3jpPHc9ngJUGY
         x4Zd8Fw1Hzr5OQs1zaIcF4rrwyqH+gTc+mQARh1M3ULuJPdeh3NiOVU53i3G410u73Ch
         jjdPa3thac6d9ranIZGl6dZmtKwR7QPf2s+t/URj+t+deFgL7EHh05zdTM+eqPa702nw
         Qn/A==
X-Forwarded-Encrypted: i=1; AJvYcCVIznSNPiMdLzUMRBYlpausMLQXWKL6Zi7Wa7eeVAlJ8bgNHRX7CLLCe7V1MJpIzsphvLhUenp8LEvBOzE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJzzFvJk01NeRfu4krXk9leZx/4v80+dJq/5syGPMoj7o0Sl72
	JJ8bmyDNPUZn84xIO9ZlWF26Hi+3fQSkHjwiYKYl8bA+YE129OZzhU/a9rPM/wRLfkNNkomhM/U
	o0Pf/kg4ye475guBm1vOsqYxAWbxTM5iH1MkM40WEfVeNj1i5yHedu60WZuOjVgSGJw==
X-Gm-Gg: ASbGncuRnnKZqzmKkKovE3yg7Sh+GUUVN+N6wGkoPV+dG4KuZSPWbJwxlOFHUhptSsC
	WRbPqj1R2MvgAJXBRhvMjR8uYzJgli38nPxPnhkDisma2xePkGM6/MCDaKKY6/14ueUhL/HQ7tg
	Sx0siivYWCd4wOGhOJZYKfqO9mqtJv0vFOFCFzsn5Ko+k73tXd+c92ofIm1lYpR5Yr0zKxAC3kY
	iAQbPq8onDw+iVi55ggq3IrXjhkO3GNgib6ffcKPFLQ/wX/UQ1TF73J9pgf7ER+COJNGadw6UsH
	/fAmhTiaSvQQKyiitidtEyyY19VJD5/pR618VEpdyvIq8SFP0rO8gIkQ0IrORZSs6V7oW2Cuxz+
	bZQGzKxo+p/Z5NIOYTG1abuke6mVLbgmhO9nU6eM=
X-Received: by 2002:a05:600c:6487:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-442fd622e97mr229778835e9.9.1747926887340;
        Thu, 22 May 2025 08:14:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTWXUQ6YSObrClsy1/nOpFkU0Ce4tkRLftf8Q8dErp8Umcz69taRh/uB+yKVOs/MofWoXCOQ==
X-Received: by 2002:a05:600c:6487:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-442fd622e97mr229778535e9.9.1747926886903;
        Thu, 22 May 2025 08:14:46 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f22:2e00:6e71:238a:de9f:e396? (p200300d82f222e006e71238ade9fe396.dip0.t-ipconnect.de. [2003:d8:2f22:2e00:6e71:238a:de9f:e396])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d25b8sm113083635e9.17.2025.05.22.08.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 08:14:46 -0700 (PDT)
Message-ID: <13c5fe73-9e11-4465-b401-fc96a22dc5d1@redhat.com>
Date: Thu, 22 May 2025 17:14:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
To: Pu Lehui <pulehui@huaweicloud.com>, mhiramat@kernel.org, oleg@redhat.com,
 peterz@infradead.org, akpm@linux-foundation.org, Liam.Howlett@oracle.com,
 lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com,
 pfalcato@suse.de
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, pulehui@huawei.com
References: <20250521092503.3116340-1-pulehui@huaweicloud.com>
 <62b5ccf5-f1cd-43c2-b0bc-f542f40c5bdf@redhat.com>
 <afe53868-5542-47d6-8005-71c1b3bec840@huaweicloud.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <afe53868-5542-47d6-8005-71c1b3bec840@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22.05.25 16:37, Pu Lehui wrote:
> 
> 
> On 2025/5/21 18:25, David Hildenbrand wrote:
>> On 21.05.25 11:25, Pu Lehui wrote:
>>> From: Pu Lehui <pulehui@huawei.com>
>>>
>>> We encountered a BUG alert triggered by Syzkaller as follows:
>>>      BUG: Bad rss-counter state mm:00000000b4a60fca type:MM_ANONPAGES
>>> val:1
>>>
>>> And we can reproduce it with the following steps:
>>> 1. register uprobe on file at zero offset
>>> 2. mmap the file at zero offset:
>>>      addr1 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);
>>
>> So, here we will install a uprobe.
>>
>>> 3. mremap part of vma1 to new vma2:
>>>      addr2 = mremap(addr1, 4096, 2 * 4096, MREMAP_MAYMOVE);
>>
>> Okay, so we'll essentially move the uprobe as we mremap.
>>
>>
>>> 4. mremap back to orig addr1:
>>>      mremap(addr2, 4096, 4096, MREMAP_MAYMOVE | MREMAP_FIXED, addr1);
>>
>> And here, we would expect to move the uprobe again.
>>
>>>
>>> In the step 3, the vma1 range [addr1, addr1 + 4096] will be remap to new
>>> vma2 with range [addr2, addr2 + 8192], and remap uprobe anon page from
>>> the vma1 to vma2, then unmap the vma1 range [addr1, addr1 + 4096].
>>> In tht step 4, the vma2 range [addr2, addr2 + 4096] will be remap back
>>> to the addr range [addr1, addr1 + 4096]. Since the addr range [addr1 +
>>> 4096, addr1 + 8192] still maps the file, it will take
>>> vma_merge_new_range to merge these two addr ranges, and then do
>>> uprobe_mmap in vma_complete. Since the merged vma pgoff is also zero
>>> offset, it will install uprobe anon page to the merged vma.
>>
>> Oh, so we're installing the uprobe into the extended VMA before moving
>> the page tables.
> Yep!
>>
>> Gah.
>>
>>> However, the
>>> upcomming move_page_tables step, which use set_pte_at to remap the vma2
>>> uprobe anon page to the merged vma, will over map the old uprobe anon
>>> page in the merged vma, and lead the old uprobe anon page to be orphan.
>>
>> Right, when moving page tables we don't expect there to already be
>> something from the uprobe code.
>>
>>>
>>> Since the uprobe anon page will be remapped to the merged vma, we can
>>> remove the unnecessary uprobe_mmap at merged vma, that is, do not
>>> perform uprobe_mmap when there is no vma in the addr range to be
>>> expaned.
>>
>> Hmmm, I'll have to think about other corner cases ....
>>
> looking forward to it

I think, the rule is that we must not install a uprobe for the range 
that we will be actually moving the page tables for.

So, for the range we're effectively moving (not the one we're extending).

Because logically, the uprobe will be already handled by the existing 
page tables that we're moving.

For the range we're extending, we must call uprobe handling code ...


Alternatively, maybe we could call uprobe handling code after moving the 
page tables. We'd probably find that the uprobe is already installed and 
do nothing (so the theory :) ). ... if that would simplify anything.

-- 
Cheers,

David / dhildenb

