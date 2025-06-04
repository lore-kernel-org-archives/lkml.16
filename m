Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B66928F921
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 13:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749043813; cv=none; b=YiCp2HKT0nClVRP3nWSAZyZo3WJGqLW/567l6TJhk6SovT8Uq9EqHwezDVwOa10MBbzNSGbLiHEEvTuBYjwF0Tz9QdMoVBzTI3MDl1U8zE3S+nLvb7Nu/HJc1rkmg6qJ9KKd5zjtMeBHtLQzm0i6pmn6gednyemMawEuithMeeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749043813; c=relaxed/simple;
	bh=DJDT9AInBT4ZBXbnpZMDD3OPwVP1JNHKWyTYB41+vgw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i1UO+V8miSeFnFCfyl8f42v3uPu6H1MR8EhLnKWlQynHomWu4D+X97ZCZC+hHRBk0u3Qk+on3mN8ZUj78BbKfrK/8NV+JfDYMCsqtq2uN1Z6F/twE2+pIBOhl5WTDcgIoUKOyeK/HBTljzqTzH3JWjRbtifNBVWpA4ArxAmmQUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P7OjiSZA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P7OjiSZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749043811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wM730wYdKzGLtqTwQp0WD4PZQ3ILvslvUEZgXXpTyII=;
	b=P7OjiSZArcKxSBVMjw0eKvG5inYAcNzvIJQ0Ct+VSHTEud1loUEv3BYwBT+VU/0fpeJxsW
	5gN2y/zfh48QVlmKLSyTXPwjZnan4wIBjHquER/BDg3YCq4htYzZDzGpcfNiJX59AWMHBU
	Si381pV6UFqGsgbek+hASAhUIiWWfEI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-WEylEPTzMIyld6opMeS5VQ-1; Wed, 04 Jun 2025 09:30:09 -0400
X-MC-Unique: WEylEPTzMIyld6opMeS5VQ-1
X-Mimecast-MFC-AGG-ID: WEylEPTzMIyld6opMeS5VQ_1749043807
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d57a0641so46685915e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 06:30:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749043807; x=1749648607;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wM730wYdKzGLtqTwQp0WD4PZQ3ILvslvUEZgXXpTyII=;
        b=OSmPKytkTkdQapCD4p9g1lQao1alQMqP8i5++f6WwwgKop965tm8BHllgxpjv3Il0E
         1GpSCs3xzyajfC1LFwxH9aT8t6ayRKqnSyO4B/ET+dqjsNlyNzjaCDUX4xXFlSTgG0lA
         nhYABI5SgM95fPnFz3c52mjgJGCy/HREpZIL6fBSh6Yd1CBT6DzSRd9ZsP3GHl2nNfZh
         omBzGTbu4nLNUbYK2E+CKtFmHBLC7rMHvkvaF7yILtk07rcATsaWBCp+LKbJU7goQn69
         Rk2w0f27V3wH6W77ziBFUB6N7wKFW4KKZCcezFk7q1vTXPxzOkHeAFFDcjU1cxdCYciY
         i2Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVppcWdFULkbion1Xr1TGuXLpra7d4/DSGJWNeLGrDyV9GNPfLXYyg1HLJEYdvNzaa2tShkEX6iBJEO6bw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGuMTDm+ld4Ln2LT4q/5QbOxTUiOAcC4r7SqCp+rj43MoH3JRt
	Edf8UyrCa1GcYaSfbaw4mCf+aQSzWnVyCobzvllQ6pmkImkl+kF4Us4XeG3LzjzaAu0xLPwqtfB
	wzcUdLtWN/uUCFTy6VuNeN2+Ufor0dxij/FgiolcHiELDNk4HjVsnfWExSzC8sFVbBMmOJgnsfq
	EU
X-Gm-Gg: ASbGncsG6aZUcXZaC5gvPwY2t9UfCwZ/bHveg8UAkt5VUoT8ftup9LxluSdRQ5OM6Hf
	1QZq3s90fuMXtL7mreq7Hu9J8alSmFyrofSs/VZEG2GPzVqEZmUavPyWmKOt5byqIVWi9o5sHVQ
	NVI4T2eQgbxtzdcFU//MITm3WMFeEG3NErN677w6VFdGkcQMze1CSMEMtRbkd16CnVG4YBoCal8
	orXBz+14yljynOnk/j+AKg6hsQjUiwpQLDmA1iTVP5YuBnIQoW6Zd6yxanJ3q9G/xxouO7pKd/f
	d8/0Ua4vx60/isPgJxk1Msq0nOOsfcdmOR1NMbixxcLHJDYwXA3P9lEWqb5T7O22YeSwYKRhrCx
	cFm92a29Hu8D7H7ld0QzfwGl0qCBYhucgbg35PX0=
X-Received: by 2002:a05:600c:3484:b0:450:c20d:64c3 with SMTP id 5b1f17b1804b1-451f50a2126mr15328895e9.18.1749043807372;
        Wed, 04 Jun 2025 06:30:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpnyxfH8Pv/rAsTwh7fWe/qdlsqtP0waH+CRL3dgCTNExEMwgjRrMrmo08vFsHutGjTeZV9A==
X-Received: by 2002:a05:600c:3484:b0:450:c20d:64c3 with SMTP id 5b1f17b1804b1-451f50a2126mr15328525e9.18.1749043806909;
        Wed, 04 Jun 2025 06:30:06 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf? (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8eceasm200932785e9.7.2025.06.04.06.30.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 06:30:06 -0700 (PDT)
Message-ID: <8abecd5b-2768-49d0-afc3-561b95d77a24@redhat.com>
Date: Wed, 4 Jun 2025 15:30:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] drivers/base/node: Optimize memory block
 registration to reduce boot time
To: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Zi Yan <ziy@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Nilay Shroff
 <nilay@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <2a0a05c2dffc62a742bf1dd030098be4ce99be28.1748452241.git.donettom@linux.ibm.com>
 <20250603200729.b7581e017e4ca63f502c795e@linux-foundation.org>
 <b355e72d-0284-4a31-84e3-ae4a79ad922f@redhat.com>
 <9f7ae0e6-4640-418d-a4db-dba594377ac2@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <9f7ae0e6-4640-418d-a4db-dba594377ac2@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04.06.25 15:17, Donet Tom wrote:
> 
> On 6/4/25 3:15 PM, David Hildenbrand wrote:
>> On 04.06.25 05:07, Andrew Morton wrote:
>>> On Wed, 28 May 2025 12:18:00 -0500 Donet Tom <donettom@linux.ibm.com>
>>> wrote:
>>>
>>>> During node device initialization, `memory blocks` are registered under
>>>> each NUMA node. The `memory blocks` to be registered are identified
>>>> using
>>>> the node’s start and end PFNs, which are obtained from the node's
>>>> pg_data
>>>
>>> It's quite unconventional to omit the [0/N] changelog.  This omission
>>> somewhat messed up my processes so I added a one-liner to this.
>>>
>>
>> Yeah, I was assuming that I simply did not get cc'ed on the cover
>> letter, but there is actually none.
>>
>> Donet please add that in the future. git can do this using
>> --cover-letter.
> 
> Sure,
> 
> I will add cover letter in next revision.
> 
> 
>>
>>>>
>>>> ...
>>>>
>>>> Test Results on My system with 32TB RAM
>>>> =======================================
>>>> 1. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled.
>>>>
>>>> Without this patch
>>>> ------------------
>>>> Startup finished in 1min 16.528s (kernel)
>>>>
>>>> With this patch
>>>> ---------------
>>>> Startup finished in 17.236s (kernel) - 78% Improvement
>>>
>>> Well someone is in for a nice surprise.
>>>
>>>> 2. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT disabled.
>>>>
>>>> Without this patch
>>>> ------------------
>>>> Startup finished in 28.320s (kernel)
>>>
>>> what.  CONFIG_DEFERRED_STRUCT_PAGE_INIT is supposed to make bootup
>>> faster.
>>
>> Right, that's weird. Especially that it is still slower after these
>> changes.
>>
>> CONFIG_DEFERRED_STRUCT_PAGE_INIT should be initializing in parallel
>> which ... should be faster.
>>
>> @Donet, how many CPUs and nodes does your system have? Can you
>> identify what is taking longer than without
>> CONFIG_DEFERRED_STRUCT_PAGE_INIT?
> 
> 
> 
> My system has,
> 
> CPU      - 1528

Holy cow.

Pure speculation: are we parallelizing *too much* ? :)

That's ~95 CPUs per node on average.

Staring at deferred_init_memmap(), we do have

	max_threads = deferred_page_init_max_threads(cpumask);

And that calls cpumask_weight(), essentially using all CPUs on the node.

... not sure what exactly happens if there are no CPUs for a node.

> Node     - 16

Are any of these memory-less?

> Memory - 31TB



-- 
Cheers,

David / dhildenb

