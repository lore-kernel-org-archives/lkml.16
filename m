Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755491F416B
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748251759; cv=none; b=LipscI7M5qLL9s1KfGt3k4dR8vGVp7sQRj2QC5NVdc92Z5b66uPJsGPVAoPwiGtWguz6nvNAgpKwZh3EBcJLmBwBbICrPm6FnbydFB/QkW97OnaiZhEtMmrXImgpruBTqzkVvQ7geS9GyB54blTItkN/i+vYsJTIsq4vZLrcfyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748251759; c=relaxed/simple;
	bh=Xe3vi7ENNMH1j/u/5pu4GOZqnQeAC5v0Ldme1+1Y8pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lH2HW3PW90s6syy5wUHv2e6+xZdjnGmkndu1F1gs9eYxyYulujZHveXSVZXtDRoQ7t7zd3MuUN+DRdM4TIe2qMgUt2ZmGIXH50er4oIBsPKVMMomvQH3TPeB4O1MiRq2+ElmLpt4wbtKspeB9w0uXDZbIzU/vlJliAv4fCBEKCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iNZYxPFJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iNZYxPFJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748251756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IMZoildo8uZCd/Eo0gESUyxMqAeWKWWm7Nj0lUCDNuY=;
	b=iNZYxPFJP4fLwiqPeZUfJ+Y8ByG7VoM7mjueJ27/+rYI/hR+2kUMfu+IMasNswYYjKTAlz
	LV8w9FYg3cF9JSMjfMhpjInhhMi7QBRgNPUJQ0OVBgrYUjgE8FYgTtgGordGgL7j6TtRJ2
	othLkxGDO8TdpVPKYkU6DPFkZCt9cV4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-plMLEDhkMuaesnPfBZg5tQ-1; Mon, 26 May 2025 05:29:14 -0400
X-MC-Unique: plMLEDhkMuaesnPfBZg5tQ-1
X-Mimecast-MFC-AGG-ID: plMLEDhkMuaesnPfBZg5tQ_1748251753
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442f90418b0so10922215e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748251753; x=1748856553;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IMZoildo8uZCd/Eo0gESUyxMqAeWKWWm7Nj0lUCDNuY=;
        b=CDluvzdaa9cIREPoZWmiN1n7jlizXoN6RhQqEh9v6ED0x/XgAn7JuP1dKaCvyiAHp9
         c1AKagIs/dmoCV6LEPXnJX1Adae1DSILIrRycptqbi83waDHeQ2cS12wUMyEznaKJZog
         aGabOOHuwUFLS1GQdvFgkvNAoWaXfyWtEZyv3wsQea3lJ4Q20Dwf6Hu8lqyXiUoc2pd4
         Ef/p1LmtEw4uiCqPyirS13jpmINV5gcBJnsze0W5u6W3vK/bBMwYwxWCl+07vMn9Ma/X
         iR2CB2jGXpkdOZUmmRqQS9Ye3YtYn/PqFCOsRDModjZGqt3aX+WoGL0q7XcIj86Lg5w/
         vrkg==
X-Forwarded-Encrypted: i=1; AJvYcCWKUNdraVsrwyQyLDWJPam5IXnz5xwVlxCuWO/hrDXZlRJ3pAsF5X38M/3SQKCpRyQJgSsHIo0+DG6z4gs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNFWJ7DXqNBDVUxy2CzxzahIIhoQr15HwC+0MhYZH5EaHI+JyO
	bSckIQHOC7EWF0WpDuMyjVzuYPv+z4eUHz051lWwj3B4rgVCF1XjaRmVcTbwf6+54P+wflj0FNc
	2/w5VdXtWaTPY7Aw/gqxYgBly101a2JBlO8IZlx975CdwqwwmkQSInsvwwdDRR9C7sA==
X-Gm-Gg: ASbGnct9NO9HQwpfD3jqi5aX5JOFdTydSOeMSC9LrUoV5bXysWyz0V9fySk6uUZNpSt
	EQbBzzYhrGr649K9zEHASInn2ZYb+WHgeUOaSDXB5O1x+T0mEif3PmrVbGiwYtzDidu3pziQyhK
	FN65kYgdu22vyprC8fhyALsYYd8XzP8OfKBo2K9+7mO882mpyd76gT7X9h/ivl3Z0oZwA4VhHJ6
	aCGXtl6rspZPz9rpAzqqw0IyX7TCyX+98rSD+6IahxM0THn3clO9XhAjSexE7tCY5PsN8VvA9I+
	mN4bdGhQhDLypt6C4MxpfHnNWcANn3nWa152OqsR9aKTujthPT8DhkH1+PPzblJKh1uCP25uQ+t
	u8RzEnPJ7zF1HMeTmfrMsRWFNKMnVG/otN/gOHrg=
X-Received: by 2002:a05:600c:4f52:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-44c919e1684mr75482405e9.14.1748251752795;
        Mon, 26 May 2025 02:29:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTunjhfmdiMmCnUy4TVsNn3Xc64kFhImUqJVrq64nA5IfjlCoeJDr+2370sEhKOY96qYgXxw==
X-Received: by 2002:a05:600c:4f52:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-44c919e1684mr75482085e9.14.1748251752380;
        Mon, 26 May 2025 02:29:12 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:6500:e1c1:8216:4c25:efe4? (p200300d82f196500e1c182164c25efe4.dip0.t-ipconnect.de. [2003:d8:2f19:6500:e1c1:8216:4c25:efe4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f23bfe80sm227992765e9.20.2025.05.26.02.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 02:29:11 -0700 (PDT)
Message-ID: <dbc7c66b-24c9-49f4-8988-a7eec1280ca8@redhat.com>
Date: Mon, 26 May 2025 11:29:09 +0200
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
 <382839fc-ea63-421a-8397-72cb35dd8052@redhat.com>
 <FF2F9A08-9BD8-4207-901D-AC9B21443BF6@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <FF2F9A08-9BD8-4207-901D-AC9B21443BF6@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.05.25 19:30, Zi Yan wrote:
> On 22 May 2025, at 13:21, David Hildenbrand wrote:
> 
>> On 22.05.25 18:38, Zi Yan wrote:
>>> On 22 May 2025, at 12:26, David Hildenbrand wrote:
>>>
>>>> On 22.05.25 18:24, Zi Yan wrote:
>>>>> On 22 May 2025, at 12:11, David Hildenbrand wrote:
>>>>>
>>>>>> On 21.05.25 10:02, Bharata B Rao wrote:
>>>>>>> Currently the folios identified as misplaced by the NUMA
>>>>>>> balancing sub-system are migrated one by one from the NUMA
>>>>>>> hint fault handler as and when they are identified as
>>>>>>> misplaced.
>>>>>>>
>>>>>>> Instead of such singe folio migrations, batch them and
>>>>>>> migrate them at once.
>>>>>>>
>>>>>>> Identified misplaced folios are isolated and stored in
>>>>>>> a per-task list. A new task_work is queued from task tick
>>>>>>> handler to migrate them in batches. Migration is done
>>>>>>> periodically or if pending number of isolated foios exceeds
>>>>>>> a threshold.
>>>>>>
>>>>>> That means that these pages are effectively unmovable for other purposes (CMA, compaction, long-term pinning, whatever) until that list was drained.
>>>>>>
>>>>>> Bad.
>>>>>
>>>>> Probably we can mark these pages and when others want to migrate the page,
>>>>> get_new_page() just looks at the page's target node and get a new page from
>>>>> the target node.
>>>>
>>>> How do you envision that working when CMA needs to migrate this exact page to a different location?
>>>>
>>>> It cannot isolate it for migration because ... it's already isolated ... so it will give up.
>>>>
>>>> Marking might not be easy I assume ...
>>>
>>> I guess you mean we do not have any extra bit to indicate this page is isolated,
>>> but it can be migrated. My point is that if this page is going to be migrated
>>> due to other reasons, like CMA, compaction, why not migrate it to the target
>>> node instead of moving it around within the same node.
>>
>> I think we'd have to identify that
>>
>> a) This page is isolate for migration (could be isolated for other
>>     reasons)
>>
>> b) The one responsible for the isolation is numa code (could be someone
>>     else)
>>
>> c) We're allowed to grab that page from that list (IOW sync against
>>     others, and especially also against), to essentially "steal" the
>>     isolated page.
> 
> Right. c) sounds like adding more contention to the candidate list.
> I wonder if we can just mark the page as migration candidate (using
> a page flag or something else), then migrate it whenever CMA,
> compaction, long-term pinning and more look at the page.

I mean, all these will migrate the page either way, no need to add 
another flag for that.

I guess what you mean, indicating that the migration destination should 
be on a different node than the current one.

Well, and for the NUMA scanner (below) to find which pages to migrate.

... to be this raises some questions: like, if we don't migrate 
immediately, could that information ("migrate this page") actually now 
be wrong? I guess a way to obtain the destination node would suffice: if 
the destination node matches, no need to migrate from that NUMA scanner.

In addition,
> periodically, the migration task would do a PFN scanning and migrate
> any migration candidate. I remember Willy did some experiments showing
> that PFN scanning is very fast.

PFN scanning can be faster than walking lists, but I suspect it depends 
on how many pages there really are to be migrated ... and some other 
factors :)

-- 
Cheers,

David / dhildenb

