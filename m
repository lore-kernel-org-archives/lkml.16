Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BC51A83F8
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747664137; cv=none; b=SZD9kImJHHwmLZA69y7pfCanypzKXTJ7Y8DpevVX0Zbcb3n4cCWXyRvgaqN/Kko/vmzZlpJiLJdguZAG3HbLSBHUAvM96uYggEmPIl3udOVk7Kmn8uUQau2ruFBuLQi/vH42pvvWtMYvaY0EF/Nscke+fJ9s89+0/dHoY3kNdlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747664137; c=relaxed/simple;
	bh=ujRI2zK4jy3x5IpdAtAU+7YFeQk+xv5gL9yvAg23iic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sgkT6PvUNx9hkIe+wZKxV3kiWj2VOWlus7PEBwQq+SoKI/Zda8D96hMP44ITN5+WCv8me8cfmKxCoFV5Qheys7rRYNP+/pU3JB6yI8IzqGICqNJH0aXoueG0mLxnUW7RPH0MxLVGzYSJZFwvyVTMI5Z0Anz0zpTOpjyHGdaH8gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q9Iif7bI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q9Iif7bI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747664132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jnnZgbkWp4UhyO3kcdg4VVGSHvC+ot/B7Ex+qTnzEtU=;
	b=Q9Iif7bIVjDNlogOSAo/qaNmj9ey59wKlbQgme6pJOr+LRK3B2KKWwZDH/SsolD08nE6ow
	XECXgQMkMtJES5etU6DIDOopAMAhReE5PLi0OOy7JPn9uL5Zdt/f5QoLcaDfEEirS0KK70
	iZjG0mqf5ieDFBQceI8sNRwuETrKTFg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-Ea4BosCDOOWX9ShcQ2FR4A-1; Mon, 19 May 2025 10:15:31 -0400
X-MC-Unique: Ea4BosCDOOWX9ShcQ2FR4A-1
X-Mimecast-MFC-AGG-ID: Ea4BosCDOOWX9ShcQ2FR4A_1747664130
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a364d121ccso303932f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 07:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747664130; x=1748268930;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jnnZgbkWp4UhyO3kcdg4VVGSHvC+ot/B7Ex+qTnzEtU=;
        b=fDM53bJmCrnNSXBkBOUMKY0UUeiy6C5Ttjen3ygheLFf/zrp7S+f0UTW6xEtHC/3UL
         6RPFLlGLkFvoBHd2iHvXlzZt6FbMCpHQlAUCZv1Lwh0lgkthHVBUmNdZibqJsICxEi3V
         xVVG++jqmVmOWAPiTxqV1ZkNltByq3jkKKJF60YR0/7R3CWd0vRntDVrJK9gNYrePBlD
         R5G5Mk39drjxCJm6sQMq7E2MeCTxmzqzfnoOYn2UQirthmSBUrnXX/XFU1Duo9RYjJcn
         /Z1mizgZUsWoacxTKxGGg+go8Y+/5tNedTDodrFILh3VuIe1wHXZ+WIH3oa24SXkaJgS
         kRMg==
X-Forwarded-Encrypted: i=1; AJvYcCUP3gbOlyMXrAa0lU3pP9V/uAIjvPpLWUx2EPGtXxvyrfVYbA+JCB25/UT57snDKRKMMC0nXcmD2uY4q7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLeWPmZzLgs3eRtRha9uam8AZe+zZKMb9OW5+McC7NYhbG2+J0
	uU76C6xD/IXMvykk3xspKy7mMEGVM1i3XTAANYHaz0/7g5YtfUzfBXkVCJwuhQiiuXcm6sIg1mN
	FXUN61mDO/23IsR0Lcycv1kmoTFDHSIQuRW5UsAPQIC9mBwVF/UG+Kg5bv5I0Kaxw2Q==
X-Gm-Gg: ASbGncvl161CNviCpxuqARWI6O1AjpeGMFpxgJ/OixMnzMU3aPRmhY/W4qgA4Dh+BpP
	ayOgSa8lo2HRcVkC7Tr/6ROL8IYInvjdewnzfg6dQ7ywY8FPTlAua9AwSOGFzkBeD6MCzrBp+bZ
	a9SDTYuyGVxvzqzoKicSbNnoS8cbYA7x74pSpwh3aj2R0hLeT9aWubeXk2MrZK/3//vNz/vi9qu
	XLdTo4GGYCAqeXyPtPn8elGwPuSN3RxmahYiWT6MncUSd9Tboks3br7LQRIGzA5B2WKaCefDR2y
	4Tn9gEVBgunjvEd+ag8X5+efnuiguGbLKJSAd6g1jVgjqIL/lofIX+GAnsuBSHPXC7zBcNu0YEk
	pKMbY/sd9BHuvoq8RFkorB1dmQOR2Evx8qi+v6jU=
X-Received: by 2002:a05:6000:2503:b0:3a3:7336:fa63 with SMTP id ffacd0b85a97d-3a37336fbcemr2109905f8f.18.1747664130031;
        Mon, 19 May 2025 07:15:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/tXwK8+oG22Ge9wGN8Yf59a1WYPVLniiosBbQPZHOaDQaSlZJqu6irAvI7QTUg7iUfqlfPA==
X-Received: by 2002:a05:6000:2503:b0:3a3:7336:fa63 with SMTP id ffacd0b85a97d-3a37336fbcemr2109858f8f.18.1747664129605;
        Mon, 19 May 2025 07:15:29 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3c:3a00:5662:26b3:3e5d:438e? (p200300d82f3c3a00566226b33e5d438e.dip0.t-ipconnect.de. [2003:d8:2f3c:3a00:5662:26b3:3e5d:438e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5abaesm13043464f8f.39.2025.05.19.07.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 07:15:29 -0700 (PDT)
Message-ID: <794d741f-44ac-4cd8-97e8-091f12387f39@redhat.com>
Date: Mon, 19 May 2025 16:15:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Make MIGRATE_ISOLATE a standalone bit
To: Zi Yan <ziy@nvidia.com>, Vlastimil Babka <vbabka@suse.cz>
Cc: Oscar Salvador <osalvador@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang
 <richardycc@google.com>, linux-kernel@vger.kernel.org
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <fed40607-edcd-4338-85ae-7656a374728b@suse.cz>
 <FCED1CCE-B9A9-4B8B-9319-B1002848AC3B@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <FCED1CCE-B9A9-4B8B-9319-B1002848AC3B@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.05.25 02:20, Zi Yan wrote:
> On 17 May 2025, at 16:26, Vlastimil Babka wrote:
> 
>> On 5/9/25 22:01, Zi Yan wrote:
>>> Hi David and Oscar,
>>>
>>> Can you take a look at Patch 2, which changes how online_pages() set
>>> online pageblock migratetypes? It used to first set all pageblocks to
>>> MIGRATE_ISOLATE, then let undo_isolate_page_range() move the pageblocks
>>> to MIGRATE_MOVABLE. After MIGRATE_ISOLATE becomes a standalone bit, all
>>> online pageblocks need to have a migratetype other than MIGRATE_ISOLATE.
>>> Let me know if there is any issue with my changes.
>>>
>>> Hi Johannes,
>>>
>>> Patch 2 now have set_pageblock_migratetype() not accepting
>>> MIGRATE_ISOLATE. I think it makes code better. Thank you for the great
>>> feedback.
>>>
>>> Hi all,
>>>
>>> This patchset moves MIGRATE_ISOLATE to a standalone bit to avoid
>>> being overwritten during pageblock isolation process. Currently,
>>> MIGRATE_ISOLATE is part of enum migratetype (in include/linux/mmzone.h),
>>> thus, setting a pageblock to MIGRATE_ISOLATE overwrites its original
>>> migratetype. This causes pageblock migratetype loss during
>>> alloc_contig_range() and memory offline, especially when the process
>>> fails due to a failed pageblock isolation and the code tries to undo the
>>> finished pageblock isolations.
>>
>> Seems mostly fine to me, just sent suggestion for 4/4.
> 
> Thanks.
> 
>> I was kinda hoping that MIGRATE_ISOLATE could stop being a migratetype. But
>> I also see that it's useful for it to be because then it means it has the
>> freelists in the buddy allocator, can work via __move_freepages_block() etc.
> 
> Yeah, I wanted to remove MIGRATE_ISOLATE from migratetype too, but there
> is a MIGRATE_ISOLATE freelist and /proc/pagetypeinfo also shows isolated
> free pages.

The latter, we can likely fake.

Is there a reasonable way to remove MIGRATE_ISOLATE completely?

Of course, we could simply duplicate the page lists (one set for 
isolated, one set for !isolated), or keep it as is and simply have a
separate one that we separate out. So, we could have a 
migratetype+isolated pair instead.

Just a thought, did not look into all the ugly details.

-- 
Cheers,

David / dhildenb

