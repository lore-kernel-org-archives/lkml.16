Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8293914B092
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751467240; cv=none; b=h/b63sbDyRqvIZGuhngdFC67Bv6RCHCSHpH3dDCLWwpG7iVLOmCyGI9jHW+WjUtByRWnsr/+36kjZNXejsHqBXJxNdy6hkVRYuqswA0HgfFM2ZkhZ/EwAsDGgVIVmo3ubhXU2SC5Fta4BqK/d434fCXB6Qa2AyxlW6kfnt8CCBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751467240; c=relaxed/simple;
	bh=ReqKfa5AlmTidy/PT9gnjPGdA/hUOShi9jY7g/HPztg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QE3q3sgCG9gnRF2IpIfr/xup4oykRArV9ejfQZOVj2qyahp5UmqMJJ/wwZy/T4UeFEqAmukE8YkhJBXYwntpXrQtI5cRTsHZEJPCjgSHviB/uN0Ds28HpLnkPRIS1v1pYS/SQrEqRZt1x8BXWjNF+b0RO7quuNMdBl4LnEzcfMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TgeDq7Lx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TgeDq7Lx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751467237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Hg5lB23m7WPuzqr3OHikhga/fPQ+cKPr7iSIzg3xU6A=;
	b=TgeDq7LxwA9J1pA0aWqsC9TlBkXOWhLTw7miG9YRQY/A2GBazcd4O1KyZKIlCJODO4wlfW
	YbWriO8KPkfgwqa7G9lVlqgRvpQHS8/PywDfpox2Lyr9Z1S7ZJUKCnZIjHsBKqSbtcCbK3
	+pqD/pMQXBCZyc29f9LCqBxFkdbf510=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-Ojzyuf39M_-dwydaaDWVEA-1; Wed, 02 Jul 2025 10:40:35 -0400
X-MC-Unique: Ojzyuf39M_-dwydaaDWVEA-1
X-Mimecast-MFC-AGG-ID: Ojzyuf39M_-dwydaaDWVEA_1751467233
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-453a5d50b81so21024625e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 07:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751467233; x=1752072033;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hg5lB23m7WPuzqr3OHikhga/fPQ+cKPr7iSIzg3xU6A=;
        b=cQaW0Fxxsh5uYAuyRSBMA7CJu4dch70gPxYmAVB7aEW7in53e8yjvuRyJY3NKcxKJ0
         HeBmlLb8/vYj13gXmMsXVkS9Kymsj0PMLx8mh9INParFnIZ793+AORSkqRSUI2deG2bf
         U5XwDZNbIOvBhRPZLEu30NdBS9y2mHfLK1SJhHS495wSx+FNaov1VpB0aIvok1JxxE08
         rjo0DGvcbi6M82Daqfj0w5NxMwsZe81iMp2NFpayk2GWeVYl+SQQzJhzEApLG6pjPCkY
         ybVR7tLyL0i+TcQ+0nNTbYN0SkzOVLfr6m6T6fJqQ0nP211pTVZwrHuI1FkHfrULTTlk
         G6kA==
X-Gm-Message-State: AOJu0YzyP9zpqo+Fw4rpI/zQ7uxN4gEGr2HSKL8SKSkJ1kJ8PM+A44oD
	lCNLYIAdo+lTQgTV5WhNFalyRbXYG93IMoPDqPVk1eOILlG1tqt2wGQ+g44zjI56A5qYucw5v2c
	PmrEOdJxuBvotyeli56OgqvAB8zxZqb5rC2Erm8jxZeILkEjbGoZGmluUE2X2LGZbDw==
X-Gm-Gg: ASbGnctyE8VPzypoR/x8ZXW4w5Wq/ggndL094Sb8zanCfJSkaAG67XF10Q5GQnJ+4oQ
	dMO0u718iEJjdwMPHSq/6vzNSwgjX/VWAq9NrSB4QRPUQjiXCS2upC1SVPAsfxJ4qb25fCeIu8o
	8lxE5GPxaJlW6TLxUxytCGGeVe6YblxFfhJdXB6UMOHQ0Z/GXdcnJTlrEDWw+kHY3Qq5N85+zmh
	k81EWg6QzXMfOeY3M54z5A1tQXlDaz0T+r7mzurLJpyWWt7cOzxNp/HfkRX0znddiwgpUgz76BR
	NV476Y9erf8tN0Y3R0aWQoWVzIRnQXPKaAi5idfEujurOIkDFweSUiI=
X-Received: by 2002:a05:600c:1c09:b0:43d:fa59:a685 with SMTP id 5b1f17b1804b1-454a3737d43mr32544255e9.33.1751467233195;
        Wed, 02 Jul 2025 07:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6YYN22MzNr+fR/PGtyiSJKmRHKfgu++F6yh97SVz8e8M7yP0kPwLbECiaMT1bm5RJjMuNkA==
X-Received: by 2002:a05:600c:1c09:b0:43d:fa59:a685 with SMTP id 5b1f17b1804b1-454a3737d43mr32543985e9.33.1751467232716;
        Wed, 02 Jul 2025 07:40:32 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e6214fsm16412820f8f.98.2025.07.02.07.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 07:40:32 -0700 (PDT)
Message-ID: <3f8d6f3f-f98b-4f90-95d5-f4a09d61c88a@redhat.com>
Date: Wed, 2 Jul 2025 16:40:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] mm: remove boolean output parameters from
 folio_pte_batch_ext()
To: Oscar Salvador <osalvador@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
 Lance Yang <ioworker0@gmail.com>
References: <20250702104926.212243-1-david@redhat.com>
 <20250702104926.212243-5-david@redhat.com>
 <aGU7axcql69-GRQI@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aGU7axcql69-GRQI@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.07.25 16:00, Oscar Salvador wrote:
> On Wed, Jul 02, 2025 at 12:49:26PM +0200, David Hildenbrand wrote:
>> Instead, let's just allow for specifying through flags whether we want
>> to have bits merged into the original PTE.
>>
>> For the madvise() case, simplify by having only a single parameter for
>> merging young+dirty. For madvise_cold_or_pageout_pte_range() merging the
>> dirty bit is not required, but also not harmful. This code is not that
>> performance critical after all to really force all micro-optimizations.
> 
> Seems a bit odd to me to have the dirty-young bit being treat as "one".
> You mention that this is done because the only user of it doesn't really
> care about dirty vs non-dirty and it's not harmful eitherway, so micro-optimizing
> this isn't worth at this moment.
> 
> But what if we grop another user which wants to make this distinction and
> where it matters dirty vs non-dirty/young vs not-young.
> Wouldn't be better to have it separated from the start?

I mean, it's easy to add later if ever required. :)

But more importantly, usually young+dirty is a moving target as HW can 
usually update it asynchronously.

So in the common case, you really have to rely on the young+dirty bits 
from get_and_clear_full_ptes(), and not on the current snapshot while 
the page remains mapped.

The madvise() use case is rather special in that sense.

-- 
Cheers,

David / dhildenb

