Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DBE1D5154
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747748043; cv=none; b=GM4trRPU3sYyo4W+9I6Ta17K07VsgPal8kYncgwFIA3PcYc2I93PWQRx5jZBMKDMZHuEGgA1tLKUeLahSXnyuAr8joQdfUHg+Yq3gSnm2nT751Ua+uSS9LIdGskOH2xrF/mPbZGygcZS08tpWL0xYYOcDwQTc9DzlyY8fRQDZpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747748043; c=relaxed/simple;
	bh=LPQ8Pd67eUR4zs7Q8x83ZqzzcaSk54eeUSCFjRiZ8us=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i03x5HKChui+yDqv4rXo8fQ40hVYAYJAG13tlZTUFMhwGcY8ZzUIaHHXIhuWo9u+RC+AQdsMHhbvX/f5PGJxiRD/4tT2JYwyDO5gqjJcnLlN8rdi8/9pwUOERJ+Ajv1XGbqmIn/hQOlLeHRw3LejY2LJr+VpXyG80aDWKW0VzT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BuzpT08c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BuzpT08c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747748040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZvrVleLHbWUbDbJvC/4ec8XsoUrqYxnQdvsBDJcmG54=;
	b=BuzpT08ceikWB352T/T1AdM2nm+POc2+sCyXUETPCr11VhvEkq5E8uRkrt1U/cxy/d9ogr
	iWm0F0cMr96cZROFpqUGg4On+k+abeO3zZCXcLm1NA6dPI9280mwhSXiwKvVfYywMeQI99
	FAY8qztCjaCzza2GjbPFt1ccUr8xyiw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-mGIWst-zPV6eEzbhCw3VZA-1; Tue, 20 May 2025 09:33:59 -0400
X-MC-Unique: mGIWst-zPV6eEzbhCw3VZA-1
X-Mimecast-MFC-AGG-ID: mGIWst-zPV6eEzbhCw3VZA_1747748038
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43eed325461so32879735e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747748038; x=1748352838;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZvrVleLHbWUbDbJvC/4ec8XsoUrqYxnQdvsBDJcmG54=;
        b=em4GH/dX66WCCD3rjF2a/iyr1cU3imciMoV8kn+rqW21KNee3GmzylWMKyaEv1hYOy
         UGX//oegVrwldL8pO10uhedKa/DWRylb9Q2+dOJrjp4yWAifZ0hicIL/ksQevi0RMe9u
         fyOrlfXVJyXjWA+Hq6UYlb4xnTBsM9q3xKCfNchzadZihmfhKOIwKnw3eTatIVTLMnlG
         BE4SzllD/mV4U3Nyyy/MGWx0dX7I1kS62yDWw3meZOg61vdaJGEQOXenJlbbyb085ybN
         JS+pZxzb2hpe9IUrJPYW1NUYf7SvmZqGXspliNShPXFbCHoxrk7WEURtbOrxoRxH6Dja
         TROg==
X-Forwarded-Encrypted: i=1; AJvYcCU1yoeyUMXeql8AcipR2WjOQSZv4alYZIG2pizEg8H0Tc4E+hkxxttIHXXA1hYTL7Ld6ecjZS+JjNs2s04=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk/0We9NHawhWtn5oGbw33yS/f7o7XqduHdGxm4Lox8jE45OfJ
	YSBwCOK0Dcn2hLCRm3f4kv73ER2NsTcoSl/BimGntCmqJyxmQSKI9DpC+UbmadcRZ4FUStdIRBt
	2vGJp/WtlfcOdbDcpETPjpqwN3R0GtjuzTc4Z1rOdCDshrnwuoxugtw5MWa1b+jicXw==
X-Gm-Gg: ASbGncurvfJalvGRGeee+yEnxZfWAHEW7AKAQuTDaFK1EDWKGe16U2QHFxZX/0q+GKG
	4w7JsuibNJ3m9V3VXdAhmWa5iIbSggXTQSsLpOl3Qw0YmpHyC22tDVLc4s1e9tWXUu0c2EmjDTh
	Za0Z71NqccFwjXoZEbjucVVw06OjinncMPtyjg7IrzN8n4GVJjjaEwy1NGGpHCqd/TlXRIgjNKQ
	qrJXQPGkUXVVZJXjaGKxuPpA+2XE/YqzjySGLUYEuntGUrGlCSkf1gEETWJ6h1fYyfNSaFuA+E5
	zq2N1/NXjguloQ9JpbVnnEa/Db0tByAAIGpceo90nbEobNpF2x4jx5XQPcPbJgCwzlWRGVDFwgU
	zbsRwXOzSve/fjApNHE18pi7vIB/5bQLbXoZt9tQ=
X-Received: by 2002:a05:600c:4e0f:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-442feff05c2mr154272315e9.13.1747748038099;
        Tue, 20 May 2025 06:33:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEehEJLTNffE8P65ifVRL8Op7ZXqW+dKnfDVJM0xJJSmO8Ylf0MmtSYgO9dD1aVF2a8qcGGUw==
X-Received: by 2002:a05:600c:4e0f:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-442feff05c2mr154271885e9.13.1747748037731;
        Tue, 20 May 2025 06:33:57 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f28:7c00:a95e:ac49:f2ad:ab84? (p200300d82f287c00a95eac49f2adab84.dip0.t-ipconnect.de. [2003:d8:2f28:7c00:a95e:ac49:f2ad:ab84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef0ab8sm31378915e9.13.2025.05.20.06.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 06:33:57 -0700 (PDT)
Message-ID: <39861ba3-078e-40ad-bb9e-43baff981ac9@redhat.com>
Date: Tue, 20 May 2025 15:33:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Make MIGRATE_ISOLATE a standalone bit
To: Zi Yan <ziy@nvidia.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang
 <richardycc@google.com>, linux-kernel@vger.kernel.org
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <fed40607-edcd-4338-85ae-7656a374728b@suse.cz>
 <FCED1CCE-B9A9-4B8B-9319-B1002848AC3B@nvidia.com>
 <794d741f-44ac-4cd8-97e8-091f12387f39@redhat.com>
 <0A1FA061-9E8E-4E86-A479-EFA9FF083D4F@nvidia.com>
 <43ab8a08-b577-4e6d-8920-1761ffbc01fc@redhat.com>
 <EDDFDB5C-2C2E-49E8-95CA-A1663C33EA7A@nvidia.com>
 <f090ac45-6758-483b-b289-d6aaabf2dc98@redhat.com>
 <7AE9C2E9-2EC8-42E3-A3A5-3E4458796A51@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7AE9C2E9-2EC8-42E3-A3A5-3E4458796A51@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.05.25 15:31, Zi Yan wrote:
> On 20 May 2025, at 9:20, David Hildenbrand wrote:
> 
>>>> if a page gets freed while the pageblock is isolated, it cannot get added to the list of an owner easily.
>>>
>>> Right. In theory, it is possible, since when a MIGRATED_ISOLATE page is freed,
>>> __free_one_page() can find its buddy and add the freed page to its buddy's
>>> buddy_list without performing a merge like current code. But it needs a new
>>> code path in __add_to_free_list(), since it is not added to the head nor the
>>> tail of a free list.
>>
>> But what if the whole pageblock gets freed in a single shot (IOW, there is no buddy to lookup the list for?).
> 

And thinking about it, another problem is if a page gets freed that has 
no buddies.

> You are right. This means when MIGRATE_ISOLATE is removed, the global
> MIGRATE_ISOLATE free list stays.

Right. We could just have that one separately from the existing array.

-- 
Cheers,

David / dhildenb

