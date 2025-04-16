Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72E122C35D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744790851; cv=none; b=OYf4lrd2s4L+nsn/oLJBrGlfGF/A11F6REzY5mPmUaOsEulNAyiuGEG/6aNGeu7gfi9AQRL1cD4AtqxXT+G/1T04nbATJUZ3zGz+Acw20J9fi4pkLuVqeg8yVQBba2PTUgZNf3mHHLx3QqeHP7zkihsRo28F8zmJlk++RCwWGp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744790851; c=relaxed/simple;
	bh=42uCu0XDhLKbT4XQXQM62JEbPBuR9Lz5iT9BYqDINCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=um8WAoggWinsUDE1XNoKI9dYOS03UT8biQiv+oQjOIgiQhlXWB5bxsyV6hHS38jX/bsv1eBw8er/ufu12emzbj2pj4TvDyDjo8xk+IA/7yn5fjtwFtTbIThj4C6ecjuYfQm/1BVf4MIkUN1d/eAFIo22O/Eo8fpRTthFmuSOruo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cAm7+bAB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cAm7+bAB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744790848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Xja4eUGUMsOy6FIyIfvFJza/PLIS2KmDMr0RiGpwd+E=;
	b=cAm7+bABw2yqEFSbIP0av1XCLpJCgDMrOLEGA52SswSQMBcj4K86k5ioffeureIyFPiW+t
	R6dycoFIGYxViphk+IRhWwl6j7T0UESnE0ZcRJyKX8PcR/MAves9zld/3JtWzPKtZYw/t/
	Y+NskFggGLUqE9HLA9G7gHtDVTx4c4Y=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-gzI2r4j8M9iM49ca1Y-hxA-1; Wed, 16 Apr 2025 04:07:25 -0400
X-MC-Unique: gzI2r4j8M9iM49ca1Y-hxA-1
X-Mimecast-MFC-AGG-ID: gzI2r4j8M9iM49ca1Y-hxA_1744790844
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac25852291cso676261666b.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744790844; x=1745395644;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Xja4eUGUMsOy6FIyIfvFJza/PLIS2KmDMr0RiGpwd+E=;
        b=KevDdVo46gpdtiTPRJ0yol3cTl1dymCqJs/S31yhF8OV9NFw3hlnJc77Q5W6nsbYXC
         KNrXpDMXHuTIE8g5DHRP90pqnSZqOPwR+z8Q4iua0+cPncXTuymgDnpQYxl7fydFAyWu
         WUddj8lYO3t79vSYAvzHq+Ss1Db66bvQB0+AmQ9/VVsSTFxr0/NiG+VCxjnzyZS51IoA
         6WarLG/PvtlPy7+45Pt6k6ocvj0ARMsQjWYfZCo4Utulrho8XZSKw/Hkkjn5RxUjEX28
         j6RGSQvPVUCPD/tHeFwjdpIvnFsjp9UDHp2ArH5VSnba97NmQ/cwnTKcI50WZIlXjqtu
         5SKg==
X-Forwarded-Encrypted: i=1; AJvYcCV9DHKs9gp04/L6APv9VARcndbp8VAGSKCRn0hloiiv8stB16CzFEwi3fAehtnXz1VMgMmsefUUbr3eyXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/ra/unqdIEwIVNhbGVkjvcK+YkVrJ32WuavC3QqhnCHc8iqcU
	p+14HPuMZQ8BAvE/ntb7FD0hyYE2oyojxP7asepYB7VuqLy1PVsMw3V+ccE3U+ru/JZtGGoOTQ5
	Kw1G4n83vTMXG2nwvnoHd5KVvn+HOLu3/nH050WaAP1aKypaZMeMP/1+73sz5CbekPKp/ZIM+Ru
	U=
X-Gm-Gg: ASbGncswc9MlsFpbKD5r9GlaQ7MtK44tpmGXU9LNuvVNO+DgeUpvrWE2xt8ZNiO7Xk+
	5eb+Dcvvk/s2wCtbZUiAXBEIqyh74HxVlDsr1o3MXIXDl9NT4Te5q6aah3k4JMFhhNWou9oZIuV
	UOYvEcaQMwUNwkYrjWDTfsXQJMM3stoQ9xug1VjFVkokhTY6U304xv8bijA7Vklrw3VeP81tIgq
	6AewwVwwHQrEFdWdeaikbaEgrHkvjcM6rbpXiosA/z4jO5xBppyjHXOWfkZjLv1uVpSkhm1diNs
	8fNyVQ4nJquW8MWw6RZpbxAYmKsAhNVvaLInwROnOTMlFIUK8tTCRhBcn/+4dnCEXPKeCyIsbMn
	QTnXqIleAZOlhO9U1YwoIZkzV9uh/0GVIngY5pg==
X-Received: by 2002:a17:907:1c94:b0:ac7:e80a:7fc9 with SMTP id a640c23a62f3a-acb429c24d6mr75910466b.31.1744790844264;
        Wed, 16 Apr 2025 01:07:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgsFYdzP0Tyi5BW34DlQym28nqaCyVo3d/BPIrV2U8iQCm5IhTVJEhAETphY+Slnug+QOrLQ==
X-Received: by 2002:a17:907:1c94:b0:ac7:e80a:7fc9 with SMTP id a640c23a62f3a-acb429c24d6mr75907266b.31.1744790843848;
        Wed, 16 Apr 2025 01:07:23 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cd63f12sm79769566b.32.2025.04.16.01.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 01:07:23 -0700 (PDT)
Message-ID: <b7d2f1dd-d181-4821-ac05-b000818daf91@redhat.com>
Date: Wed, 16 Apr 2025 10:07:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [mm/rmap] 6af8cb80d3: vm-scalability.throughput
 7.8% regression
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Lutomirks^H^Hski <luto@kernel.org>, Borislav Betkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Lance Yang <ioworker0@gmail.com>, Liam Howlett <liam.howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcow <willy@infradead.org>, Michal Koutn <mkoutny@suse.com>,
 Muchun Song <muchun.song@linux.dev>, tejun heo <tj@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Zefan Li <lizefan.x@bytedance.com>, linux-mm@kvack.org
References: <202504152235.188dcce9-lkp@intel.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <202504152235.188dcce9-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.04.25 09:01, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed a 7.8% regression of vm-scalability.throughput on:
> 
> 
> commit: 6af8cb80d3a9a6bbd521d8a7c949b4eafb7dba5d ("mm/rmap: basic MM owner tracking for large folios (!hugetlb)")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> 
> testcase: vm-scalability
> config: x86_64-rhel-9.4
> compiler: gcc-12
> test machine: 256 threads 2 sockets GENUINE INTEL(R) XEON(R) (Sierra Forest) with 128G memory
> parameters:
> 
> 	runtime: 300s
> 	size: 8T
> 	test: anon-cow-seq
> 	cpufreq_governor: performance
> 

This should be the scenario with THP enabled. At first, I thought the 
problem would be contention on the per-folio spinlock, but what makes me 
scratch my head is the following:

      13401           -16.5%      11190        proc-vmstat.thp_fault_alloc
...   3430623           -16.5%    2864565        proc-vmstat.thp_split_pmd


If we allocate less THP, performance of the benchmark will obviously be 
worse with less THPs.

We allocated 2211 less THPs and had 566058 less THP PMD->PTE remappings.

566058 / 2211 =  256, which is exactly the number of threads -> 
vm-scalability fork'ed child processes.

So it was in fact the benchmark that was effectively using 16.5% less THPs.

I don't see how this patch would affect the allocation of THPs in any 
way (and I don't think it does).


Regarding possible contention on the spinlock, I was already expecting a 
slight hit once we have that many threads over multiple sockets. From my 
cover letter:

"
Similarly, running these benchmarks with 2 MiB THPs enabled on the
AmpereOne A192-32X with 192 cores, I got < 1% difference with < 1% 
stdev, which is nice.

So far, I did not get my hands on a similarly large system with multiple
sockets.
"

And further:

"
If it ever becomes a problem we could either investigate improving the
locking, or simply stopping the MM tracking once there are "too many
mappings" and simply assume that the folio is "mapped shared" until it
was freed.

[...] Adding that logic to stop adds more code to the hot path, so I 
avoided that for now.
"

So while I am planning on looking into optimizing the locking at some 
point, it has low priority for me because (a) it adds more complexity 
(b) has the potential to affect the hot path (not shared) and (c) this 
benchmark in that scale is not a compelling argument.

-- 
Cheers,

David / dhildenb

