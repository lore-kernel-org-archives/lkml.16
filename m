Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244A81F4297
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 21:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748986080; cv=none; b=j+ZA8ctK4e/qiamxNyytApvcYDQmZUuM3bSNIW4G/O2WjPnVCjfF1Z5Hs3jY5roCg4S4LFfaylt5QrIfYtZMJcZ4ARcHoZcUU9s2DfrvhkOFO4kHA+8NNUdWCGax4alGAVEpAC8CHqipdkpywqafqJt/bMSkKUkP+pOuIwsA0RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748986080; c=relaxed/simple;
	bh=kBbsOdyLRDtX93tHNEp6n59ScyRkPya9LB/MNA6+LtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h8Kntu+EnSqm5X9AZNA8Uve1jUGWu55oORHHFeItciE9e1o24V5i899kC3xN/dW01hEvC6BQmWjVhLCTabCEO18rDD6jNS+y8r+pKaZbf6I6IPNJRpe1MNx9M34NJRz0WLC0qvo3CCWp2Ux9LfCSFEOY3BT+Ul3yMe/kEqOrxHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jPlUAVAD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jPlUAVAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748986077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CFl8Z5zpVsLk82X+sczguuxuJrSvuXlYSUtFRBPD8vc=;
	b=jPlUAVADXPSxRm76bKMWlxdUgqVPI0hQm+aize52b+++YnyXB+aTC9NtTXwV6AN8Rzsn6Z
	3EKC6vsa5Mq0my23nw/VMwx1A1rw9kMYbuH08AneH4AFjV8/LilgK+0Xq2o8VV2wY4T1hS
	4mUlo0SaUhzzJd16glzqh7+QHNRvlQE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-nyU_grVUO8yyq3LRePW5Vg-1; Tue, 03 Jun 2025 17:27:56 -0400
X-MC-Unique: nyU_grVUO8yyq3LRePW5Vg-1
X-Mimecast-MFC-AGG-ID: nyU_grVUO8yyq3LRePW5Vg_1748986075
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450db029f2aso21552765e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 14:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748986075; x=1749590875;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CFl8Z5zpVsLk82X+sczguuxuJrSvuXlYSUtFRBPD8vc=;
        b=HrEWFdulUxrIKhW4AByJgkQTXdq8X1gQCQXj4NOD/qGswTMou8qUYhTAUM9E8Ipn6V
         s+z9/4CRwpgaOqfNnobTggwg+5gL5KHlv0D2j0XyQs6pmtmwQUHCelfA5eswKoPZ8Qop
         EI6jU86bWR4BlzoJGtBkXEGaMu1THs7OMfbuNHqTkmMH7yG/2ElGq/uB7wvpWC6ykQ/O
         GjcTdkBBoOmYaKJC0nhzivipeXbp5N3pKcovPehu58iVSTKsXQ4vfT2Wikh8bGMWs++a
         4EI1EuJGA2oso9mqLxWwFh0gTp8Ni46jVjCmMCL/Cj8Y6/q1pRKkwNDRb3hx4ycoAHPC
         uKdg==
X-Forwarded-Encrypted: i=1; AJvYcCXU2JILgCNAGosWB+yg0EtqLFvnScAGhXTTKVVLu7ft7u8owFcXXlvVqPRTiomCf/y+LP+flCb8s+L77f0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8r7DaFXfpL4bIyAEb7QrEohi7THLx6HS/z05ZMl9PBit0h9/O
	9HEJZQTBfbIjoNfb/JNBiVuEtZYgjiibAx1hcODsOcE8taXww7TNTW9muUnfxVcopFB6n39txC9
	XR5benYlESsDIiE7xky2cVWsSVY8tGmaCBt9zqrty/yeywjeeFut8fl/EsoUpko9Lvg==
X-Gm-Gg: ASbGncuZ/KOs3kxUpfg3ZtQKc0aiObkcYmOn131ykioFitYM53C8lBFdAlT3zw74xYU
	DI/eCmidSNeUKvxg329d02SuyBYFOi7jktoobkiS07QXR2H54vu+CuIIakfc/1IjuYgHiG/HwUu
	YT4PY+kX9ajDfM/Tm6Zhh7DWxQiq5VzMTYufNLjy3bhJA60VgHh1yLuU94yQYCSXPmgPgNBcA8Y
	195c4J3TKaWfZZnv8KYpjidwTQvxFVv0VzkIpDYi6OPZm42EeVkpt+dbWBcyhhLOo4Lf9PNk5fq
	nKbRP4XL9v4YcKaIuKgJhnNsS2Vze5GmULb5kthbXNPPo8wXtQ4epaZl/N4RDwD9r5VtTZoeY7W
	XXkNRKjOF0K9i362yvjyIxIGE3BR6oaj2a6Oad/0=
X-Received: by 2002:a05:600c:4f8b:b0:450:d37d:7c with SMTP id 5b1f17b1804b1-451f0b105d0mr1729795e9.21.1748986075467;
        Tue, 03 Jun 2025 14:27:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENSDbSQ6NSwSfZoU79WaytPfnSJbzMWyUTJ6KwFvkHxNGfQ4XrRdJP7uyAd5N+iV77fH+Gkw==
X-Received: by 2002:a05:600c:4f8b:b0:450:d37d:7c with SMTP id 5b1f17b1804b1-451f0b105d0mr1729615e9.21.1748986075128;
        Tue, 03 Jun 2025 14:27:55 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0d:f000:eec9:2b8d:4913:f32a? (p200300d82f0df000eec92b8d4913f32a.dip0.t-ipconnect.de. [2003:d8:2f0d:f000:eec9:2b8d:4913:f32a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451e57bcb99sm25751735e9.2.2025.06.03.14.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 14:27:54 -0700 (PDT)
Message-ID: <d0980772-0533-4ce4-83f1-9ad057a6725e@redhat.com>
Date: Tue, 3 Jun 2025 23:27:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/6] mm/page_isolation: remove migratetype parameter
 from more functions.
To: Zi Yan <ziy@nvidia.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang
 <richardycc@google.com>, linux-kernel@vger.kernel.org
References: <20250602235247.1219983-1-ziy@nvidia.com>
 <20250602235247.1219983-7-ziy@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250602235247.1219983-7-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.06.25 01:52, Zi Yan wrote:
> migratetype is no longer overwritten during pageblock isolation,
> start_isolate_page_range(), has_unmovable_pages(), and
> set_migratetype_isolate() no longer need which migratetype to restore
> during isolation failure.
> 
> For has_unmoable_pages(), it needs to know if the isolation is for CMA
> allocation, so adding PB_ISOLATE_MODE_CMA_ALLOC provide the information.
> At the same time change isolation flags to enum pb_isolate_mode
> (PB_ISOLATE_MODE_MEM_OFFLINE, PB_ISOLATE_MODE_CMA_ALLOC,
> PB_ISOLATE_MODE_OTHER). Remove REPORT_FAILURE and check
> PB_ISOLATE_MODE_MEM_OFFLINE, since only PB_ISOLATE_MODE_MEM_OFFLINE
> reports isolation failures.
> 
> alloc_contig_range() no longer needs migratetype. Replace it with
> a newly defined acr_flags_t to tell if an allocation is for CMA. So does
> __alloc_contig_migrate_range(). Add ACR_NONE (set to 0) to indicate
> ordinary allocations.
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> ---

Thanks!

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

