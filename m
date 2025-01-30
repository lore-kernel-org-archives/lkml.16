Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6340D1B4F04
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 09:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738229290; cv=none; b=moFzsiz/MBdctQ+hNYtWlQ8gegb5Cjxu7nZCCV5614zDMJbMWC8wrUJ4wPr/0fleAMovmEdJW3WPbiN3LfnzsXCjGE2McwxZF+CK3hVw4jN10Cl5IgSFEByDedyZLh5NgYz0X+tULQUAiSro1lbqzouiBC/UEpQgmZcvaTIIEow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738229290; c=relaxed/simple;
	bh=B1owPnV04u47VK/53oPxspH8yMFlCE/sNbHLLUa/wjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nF3WpsevZhxyDxUi+GxYHFH3EEH0V2TWx0sG6zX6RpRh0Vhvou8ljYZkL0zOryS4z58k1QlFq8UeuJnqMXI978Xf+r9YTzndK/zJlb24kixMGCSAvnuaPmqACU01cjOCliUb3PcBeheuzWq/pp+4yyxS/90YLyyFyZvLF5haxOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f2UF8e64; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f2UF8e64"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738229286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8a2uS8Wdref7tlZzoBWWMkEGl9+CP1s01bTe+snzNOI=;
	b=f2UF8e647DvRqz9PG6MNubc9gGF2U5ORIooh+QrwHTxvhxyXizZKbl2i/YoY6hsCmT+Zyf
	UqYLhok80d03SiqcFwPP5WtQmIneWn/EBGrBjet2DUtoDxnK3G8Duj2aX004e0Dr+BXhVc
	oXjPQgF2BqrDs/WLZOe2X0/QxhJOk5k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-FrLu-g8DP2mfr7w8RK2qXQ-1; Thu, 30 Jan 2025 04:28:04 -0500
X-MC-Unique: FrLu-g8DP2mfr7w8RK2qXQ-1
X-Mimecast-MFC-AGG-ID: FrLu-g8DP2mfr7w8RK2qXQ
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4362f893bfaso2536185e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 01:28:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738229283; x=1738834083;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8a2uS8Wdref7tlZzoBWWMkEGl9+CP1s01bTe+snzNOI=;
        b=s5xpI6C9aGG1SaQih6AxuZ2dscnYuFfxjhbbCWm1WZVqRzvPuZnvx4117QD3OPJjau
         croobGvVF7p6G2lspz/dlBlfhrl/MghYZ50oCzuWBqt8jaom54ACJsNF5Z4U9LueLX/C
         gBicfCPwqOSiCBjcWo5ankTMyRSJvm83bsmSYadUgJtiV1WCBam8DyimUaIYexPYd2vg
         O7YpI4sFgQy0ulNWwLYvwXERE8TQVQBpwbcTuE500ZciJWNMASTyYF9gIowOGfOUTgQ3
         5kXWrn21qCi/NRwEOIRcdaRJQksQ3mZRKfgTlqSiYzFZv1GT+SXnk5IX5xRj85ZF5voF
         0zOw==
X-Gm-Message-State: AOJu0Yy+KplIBMtR+GAUWXWvu6+jQwXYs5VWmNMFfDiz7luNTQBHm39B
	4QIG4mvxQOu+HMD1O5D6eDvrCxGrYjtbYrHtzqePpWwBM51iuxArCJa/6s/pw4Svxulfm0HdwFP
	GhNw8/KXQZz3JSU57/kU/HGwposuLNL/zDFkn27o5KxE1aZvCvPNVa0trzo4Cgg==
X-Gm-Gg: ASbGnct62HNPUnhZlxVokrXvMZzNCzw4xVp7T9+obQqghUeOgnxa/A27GZobF59unax
	1QPS+qca6wvKmaIRqGBHez4vy7eOSXTPSopwG8clEl3XGcroYh98EQLE4uvuS7euwcvOte7vU24
	h2OPnsScOhNQbkH+FIq5MXnmt2p2gQGIxBWBuDVLb/F0U6HI2ffaWb2cZXD+QkJsMb+1ZCvHr6J
	QDLCFnROGctWhwTPoIOttokZ9bPOIW8YU7wU4QhKlCpy0qHMUputoxDl4pXmy38pyUcKioFWAD3
	FeCuwIdwnd/PKL/KD9wXHLf5dqzPi6RV+922wGDnx3Tm
X-Received: by 2002:a05:600c:1e21:b0:434:fec5:4ef5 with SMTP id 5b1f17b1804b1-438dc3c3287mr61472935e9.14.1738229283571;
        Thu, 30 Jan 2025 01:28:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVv9sk0PSOraNHCtifr1n2WcH7tWWGxI7ZU8RxZfSrxnyJnI+Uc52lsNZOLN2ReMg84oUVgA==
X-Received: by 2002:a05:600c:1e21:b0:434:fec5:4ef5 with SMTP id 5b1f17b1804b1-438dc3c3287mr61472565e9.14.1738229283230;
        Thu, 30 Jan 2025 01:28:03 -0800 (PST)
Received: from ?IPV6:2a01:599:904:96e0:a245:aa9f:6c57:eb41? ([2a01:599:904:96e0:a245:aa9f:6c57:eb41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23d42d4sm17055365e9.6.2025.01.30.01.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 01:28:02 -0800 (PST)
Message-ID: <eab05949-efc8-4c04-ace1-b4435ec894e6@redhat.com>
Date: Thu, 30 Jan 2025 10:28:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] mm/mmu_notifier: drop owner from
 MMU_NOTIFY_EXCLUSIVE
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115803.2084769-1-david@redhat.com>
 <20250129115803.2084769-3-david@redhat.com>
 <h4dnoixvp2kjeao6mzcpze4zx6t34ebpltqadkjl5zxcjhddkf@lbzo2yhzu5sz>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <h4dnoixvp2kjeao6mzcpze4zx6t34ebpltqadkjl5zxcjhddkf@lbzo2yhzu5sz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.01.25 06:34, Alistair Popple wrote:
> On Wed, Jan 29, 2025 at 12:58:00PM +0100, David Hildenbrand wrote:
>> We no longer get a MMU_NOTIFY_EXCLUSIVE on conversion with the owner set
>> that one has to filter out: if there already *is* a device-exclusive
>> entry (e.g., other device, we don't have that information), GUP will
>> convert it back to an ordinary PTE and notify via
>> remove_device_exclusive_entry().
> 
> What tree is this against? I tried applying to v6.13 and Linus current master
> but neither applied cleanly.

See the cover letter. This is on top of the fixes series, which is based 
on mm-unstable from yesterday.

>   
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_svm.c | 6 +-----
>>   include/linux/mmu_notifier.h          | 4 +---
>>   include/linux/rmap.h                  | 2 +-
>>   lib/test_hmm.c                        | 2 +-
>>   mm/rmap.c                             | 3 +--
>>   5 files changed, 5 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
>> index 39e3740980bb..4758fee182b4 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
>> @@ -510,10 +510,6 @@ static bool nouveau_svm_range_invalidate(struct mmu_interval_notifier *mni,
>>   	struct svm_notifier *sn =
>>   		container_of(mni, struct svm_notifier, notifier);
>>   
>> -	if (range->event == MMU_NOTIFY_EXCLUSIVE &&
>> -	    range->owner == sn->svmm->vmm->cli->drm->dev)
>> -		return true;
> 
> I think this will cause a live-lock because make_device_exclusive_range()
> will call the notifier which without the filtering will increment the sequence
> count and cause endless retries of the loop in nouveau_atomic_range_fault().
> The notifier needs to be able to figure out if it was called in response to
> something this thread did (ie. make_device_exclusive_range) and can therefore
> ignore the invalidation, or from some other thread.

Yes, as discussed in the other patch, this must stay to inform secondary 
MMUs about the conversion *to* device exclusive.

> 
> Looking at hmm_test I see that doesn't use the sequence counter to ensure
> the PTE remains valid whilst it is mapped. I think that is probably wrong, so
> apologies if that lead you astray.

Yes, the hmm_test does not completely follow the same model the nouveau 
implementation does; so it might not be completely correct.

-- 
Cheers,

David / dhildenb

