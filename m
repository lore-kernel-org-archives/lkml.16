Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6682817A2F3
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747934506; cv=none; b=MgErq/UlX0U7tN8vbinBKEvQ1HGZxm8nGBxB9yfzE0Shusqf05qRhcnRa0f2M0rwWuvb2eTP13tYb+aBnRVLTreqkuAY7EwoHJVug+k7n0QqZsYnKjWpTwFFH7J85tjsQGCvU3eULn9xMoWUkVO/Ft5KbDhFQcD9G6oMyWXDdSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747934506; c=relaxed/simple;
	bh=RAtY91HxN9IcTIRUAkExLDkwV8G2HLhKdgvt/sQTwX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xxp8qRNhIBVj/Eogvg5CMKnIiq6jOPgyrxkweKc7mq2cO8C0ZIWoOaz3kIrsz1kmvb4GcHFMOAWtLsyWT0E5d163KDe2eVVzT0QdX7PsdHv5Pn5Adn22GIvcveuKdaOzXpAQUgT+/ORG3ZnZ5C8s3XRegMUIEaK0MhZxPk5HDZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eEwmiYFq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eEwmiYFq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747934503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pYxc2D0JwJLViMTAcH2xt8CaCIo0A7lmtsU/AQhy9Wk=;
	b=eEwmiYFq0Iz38WmEok+UyIAj7/fDIKgmjTY27DyCgxJ+i6W9bXaa9TqlAe+H3RchHIgvvc
	Q380G6ibRtEhHMF3N04QsR5Y8AU8yy+gHSf/zhQo7qqGLz0rzc7ck8fbdLWcWNZyV4lUdS
	JWwxshrzlY9D60KI0xvw+3CCwQw1qX4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-SxHHHB_3MnWSQreViRrQsw-1; Thu, 22 May 2025 13:21:41 -0400
X-MC-Unique: SxHHHB_3MnWSQreViRrQsw-1
X-Mimecast-MFC-AGG-ID: SxHHHB_3MnWSQreViRrQsw_1747934500
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a362939f61so3333694f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747934500; x=1748539300;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pYxc2D0JwJLViMTAcH2xt8CaCIo0A7lmtsU/AQhy9Wk=;
        b=hVYyEJuvO+XIKH8Lx2m2w5W9iLQETDdTtHw8KJP9lJFuADIjy/Nf3YVMK+K1lIESOm
         XoEnW7u2Sef5EXIEctSCbu6bRIHOOod4vq3ozSpH7AUjq/32WnLfau4PlkVUxiUPMurM
         I6H0EhbXo7Wp5jkHz2KUFmDGS/FpisXU/R0TNgkhwBCEIE2vFjxQMmiy5WsUAIyOOFlS
         2XxpaTnimr6xwrC4sIJt3HCOMXXimChkPMUPTUU44Cb6p8+tTKPlCXiUn0JsuC0ixdpd
         gP39wWwWcSGFIfdMypl4R/bPONd5liG4px77LctpD8Dum5rFsvEk7Jb/Bfbd0WthubaC
         1tow==
X-Forwarded-Encrypted: i=1; AJvYcCW4JaHJTcIy+JM8aK2tn3vCpgyo/76KsAtWyuan65IMbg3h0JH+GLFGRaHKHutSHZhztNEwHi61tA0MLQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDmZHzH3Ed+B1PRtFatUYEeERAjmEsHkBGQvm0QKsTnLbzzN22
	QyWZaioVYXOURz/zy0RjA0FJlzFM6B0Nwss0JkutMFNvIXdwlB7U1dA3KkCkSfdiE8maM68xLhD
	15m74SsIUwo0UavznaFB53c99IyHZd5wO6ZAMbiRMuRknyN+qw29QxS8IzdiTQFpCzQ==
X-Gm-Gg: ASbGncu0e/hgmC2f9hVpYqCoQGebz5MJMHFas6pMKDn67yM6RlNX/+ZtLUBJun/NP/y
	X21SoZnlCEX2YX2vg6WY6cEaHj5R7CJNSkBQi6eqoU0BqvKio0wLEcEpfcRKMyJfxBB8nbomxcg
	i0vCMaMog/s4dezW4jhwRGDFuAWqzrohdWA/RHk88EIdcWWNKbEQIKNI8ThuKfpIGLaZECoT5/r
	pPg/QkZRkGtlgwGU+AyE0b9+zZaxfRAGwDrfaZcCAb1ZKt2pLSHjVHVIuYcrA3ioUoAWkaAOpVF
	VSpOjtJ/Eg2rh6Zp/w1trG7e6QiavkBr95EfpxzA3fzDM1hQVhCq611rvIlcXF7XMrFj7Y6cSqB
	idW9UctOW6pTi5jW/aCpC4vtL0YjNZjdCIt+ZMZY=
X-Received: by 2002:a05:6000:2282:b0:3a3:7bbc:d94e with SMTP id ffacd0b85a97d-3a37bbcdc22mr12205828f8f.6.1747934500487;
        Thu, 22 May 2025 10:21:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp/byQcJieqNQ3hbbBNzcI5U9f85MgUT9hdxi5zZ2koQY7FLLXdzMyNlpCQ3pvw4LXVWqGMA==
X-Received: by 2002:a05:6000:2282:b0:3a3:7bbc:d94e with SMTP id ffacd0b85a97d-3a37bbcdc22mr12205805f8f.6.1747934500082;
        Thu, 22 May 2025 10:21:40 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f22:2e00:6e71:238a:de9f:e396? (p200300d82f222e006e71238ade9fe396.dip0.t-ipconnect.de. [2003:d8:2f22:2e00:6e71:238a:de9f:e396])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5abaesm23879693f8f.39.2025.05.22.10.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 10:21:39 -0700 (PDT)
Message-ID: <382839fc-ea63-421a-8397-72cb35dd8052@redhat.com>
Date: Thu, 22 May 2025 19:21:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v0 2/2] mm: sched: Batch-migrate misplaced pages
To: Zi Yan <ziy@nvidia.com>
Cc: Bharata B Rao <bharata@amd.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Jonathan.Cameron@huawei.com, dave.hansen@intel.com,
 gourry@gourry.net, hannes@cmpxchg.org, mgorman@techsingularity.net,
 mingo@redhat.com, peterz@infradead.org, raghavendra.kt@amd.com,
 riel@surriel.com, rientjes@google.com, sj@kernel.org, weixugc@google.com,
 willy@infradead.org, ying.huang@linux.alibaba.com, dave@stgolabs.net,
 nifan.cxl@gmail.com, joshua.hahnjy@gmail.com, xuezhengchu@huawei.com,
 yiannis@zptcorp.com, akpm@linux-foundation.org
References: <20250521080238.209678-1-bharata@amd.com>
 <20250521080238.209678-3-bharata@amd.com>
 <62cef618-123c-4ffa-b45a-c38b65d2a5a3@redhat.com>
 <AE28D27C-58C2-41A4-B553-50049E963745@nvidia.com>
 <5d6b92d8-251f-463b-adde-724ea25b2d89@redhat.com>
 <996B013E-4143-4182-959F-356241BE609A@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <996B013E-4143-4182-959F-356241BE609A@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.05.25 18:38, Zi Yan wrote:
> On 22 May 2025, at 12:26, David Hildenbrand wrote:
> 
>> On 22.05.25 18:24, Zi Yan wrote:
>>> On 22 May 2025, at 12:11, David Hildenbrand wrote:
>>>
>>>> On 21.05.25 10:02, Bharata B Rao wrote:
>>>>> Currently the folios identified as misplaced by the NUMA
>>>>> balancing sub-system are migrated one by one from the NUMA
>>>>> hint fault handler as and when they are identified as
>>>>> misplaced.
>>>>>
>>>>> Instead of such singe folio migrations, batch them and
>>>>> migrate them at once.
>>>>>
>>>>> Identified misplaced folios are isolated and stored in
>>>>> a per-task list. A new task_work is queued from task tick
>>>>> handler to migrate them in batches. Migration is done
>>>>> periodically or if pending number of isolated foios exceeds
>>>>> a threshold.
>>>>
>>>> That means that these pages are effectively unmovable for other purposes (CMA, compaction, long-term pinning, whatever) until that list was drained.
>>>>
>>>> Bad.
>>>
>>> Probably we can mark these pages and when others want to migrate the page,
>>> get_new_page() just looks at the page's target node and get a new page from
>>> the target node.
>>
>> How do you envision that working when CMA needs to migrate this exact page to a different location?
>>
>> It cannot isolate it for migration because ... it's already isolated ... so it will give up.
>>
>> Marking might not be easy I assume ...
> 
> I guess you mean we do not have any extra bit to indicate this page is isolated,
> but it can be migrated. My point is that if this page is going to be migrated
> due to other reasons, like CMA, compaction, why not migrate it to the target
> node instead of moving it around within the same node.

I think we'd have to identify that

a) This page is isolate for migration (could be isolated for other
    reasons)

b) The one responsible for the isolation is numa code (could be someone
    else)

c) We're allowed to grab that page from that list (IOW sync against
    others, and especially also against), to essentially "steal" the
    isolated page.

-- 
Cheers,

David / dhildenb

