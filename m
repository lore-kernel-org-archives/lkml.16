Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0097B27FD4C
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 19:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748634309; cv=none; b=I8ljLzq5Q2TrzYkLXwrhk9F+afNbxADl/owsZlaj99MXOxvqHGAudSFyAhSaGJuPgrbf0bEZekw7qt1McoiKPKj3PJ6mP8bif/Vs6Fu5HB4gD94xIvRfRVR5NcbAgeR57MCZw7HAmIw7SHY+ok2NlKs7QP2KNijmrsGNymMCrlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748634309; c=relaxed/simple;
	bh=QUP4+3key0rGJVO+OqXwuqw4wcW9VIxch0UdSdHjxyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K0nsWnlRmkiLGiy4It0S4Yx6OsjDanfRuxXHbNVAma5kKJmS03JNyQRkLzmUh0jUbD2lbON5V02foIRDbOB4XLfL+U9IQrqIwEeHW68lIhfRvPN0ca3nnxDibaVx2O5Bkr0Inf7qFJ9UtxWXJunYy5ridUllV9b9Rh7Cgyo/Mf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JrU3z0wr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JrU3z0wr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748634303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZRqve2ShJj6s8atlnxGCBZwI5cUhNeTG6R1A7acnoJ0=;
	b=JrU3z0wrqVDxKWWeGryPQplqqagbu365804EKxOhtT8ASXk4RaCbk60LmVkCNGaq9Ged19
	UGAqT5IJtG2/WkeFCw8vGdhtamWJm39qhYiYX55n/M851J9d5UwXUglfTG5zjBIZbPCF6P
	6o9nS3+qu6n4JAryrD+6hxwac5TOh6U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-UmaHJ-lPO8KEjW_qTcZFaA-1; Fri, 30 May 2025 15:45:02 -0400
X-MC-Unique: UmaHJ-lPO8KEjW_qTcZFaA-1
X-Mimecast-MFC-AGG-ID: UmaHJ-lPO8KEjW_qTcZFaA_1748634301
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4fb87fa4aso227034f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 12:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748634301; x=1749239101;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZRqve2ShJj6s8atlnxGCBZwI5cUhNeTG6R1A7acnoJ0=;
        b=cLUhGOfm7CIvPopwQlV0PtlC/WMiO6JZU/DCpR9r0ssupeTP2YjaYr2NFzRUVu4zz/
         3krqvEKoOyDVxVlquN6FxzJxYboufTxIJY6XJcGThALKPa3izE7IevOZc2TKvsFYYo/U
         uBLFmyF0ME0cOur54/Q8zs4h2Hm9XfigpOEXQSgBBniPLKbOf/l367/bTihYXftOi7L0
         3GPhR0csEEAfTlwsM5+GlrhhlT0OLZDOy5GKOQktD9NxdsO/mUMlVYGOKLx3zeGJkUKR
         djjWeJgrA0DejbOTYSMMsO252Hv2S8vx9ZI+5+v7VmrAvisqMSJDEbeByNKXu5C8vpFn
         nZAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbdkdN5ZFeGPhfcuW58p7kN7NtcE7ldtCyVh7CsagViD01RmgIjg3xsh1/B/L/hrFwPixCmbxJIkicFiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNqs1krDb3te6NSnBvYSu0pJULP8bE1TjDXg1amfVqZC7fMZjQ
	h3imtRY9QlLevJMynS8w5Og3GEMhDOrUn2sulkhyj/g9umMukNg6Uplr1Spe9tB5aroNIl17aV6
	/E1MUtO0yB1FOY/B/+M12Qou8SSy+cZOlImNgm1gqsuT+4ELxYgdkjUb83d5MfWHxkg==
X-Gm-Gg: ASbGncvEo7/UN4JvTrdWXZRT+j49zgePZFbjqcC7ieD+MQNQFEVHMWUxelqus9Y9C2W
	8exQOmrgaAj282iXTPgMIno7NE+BocljTO7FX7gfmXsOmA2YRj0obyMkGLD4EE1ppREWXeyz3rE
	/07DLYIt4coJLfu2/wbY1Us4ztYtCfKQkfCAMToqa6z8ZhrRTYKuD+4TIrrIwLZL5f0SDWCMvqq
	8+lgQT7l3YYMzVwhJwS6AEow3Lxc1KAyg3U6vzlFaxMglbXw8QYf+wiAXdJuoo/5JZvj7AX3cUN
	iV7QNKbLCKnVpa1xLx2PmblHXukm0W9ef5nn/tepxMmVE93qe1J6CsAp8IU78HFjueOJWi1dpWM
	o6HC8lzJxWHX6QIVwI6pmx+5FC5JaLM8AxICwcb9U+/H07Oz+/A==
X-Received: by 2002:a05:6000:2303:b0:3a4:d8b6:ca3f with SMTP id ffacd0b85a97d-3a4f7a364d6mr3297115f8f.30.1748634301059;
        Fri, 30 May 2025 12:45:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcq73TSLNYigRIrC2SIsbitcIED+ifB67UIfErx5dqGK4kFD9jtYZ2g3II5GD954wrKOxsDg==
X-Received: by 2002:a05:6000:2303:b0:3a4:d8b6:ca3f with SMTP id ffacd0b85a97d-3a4f7a364d6mr3297107f8f.30.1748634300638;
        Fri, 30 May 2025 12:45:00 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f03:5b00:f549:a879:b2d3:73ee? (p200300d82f035b00f549a879b2d373ee.dip0.t-ipconnect.de. [2003:d8:2f03:5b00:f549:a879:b2d3:73ee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73f01sm5509207f8f.45.2025.05.30.12.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 12:45:00 -0700 (PDT)
Message-ID: <8a8f5b77-3564-454b-930c-63ccddda4a2a@redhat.com>
Date: Fri, 30 May 2025 21:44:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] mm/page_alloc: add support for initializing
 pageblock as isolated.
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
References: <20250530162227.715551-1-ziy@nvidia.com>
 <20250530162227.715551-4-ziy@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250530162227.715551-4-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.05.25 18:22, Zi Yan wrote:
> MIGRATE_ISOLATE is a standalone bit, so a pageblock cannot be initialized
> to just MIGRATE_ISOLATE. Add init_pageblock_migratetype() to enable
> initialize a pageblock with a migratetype and isolated.
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> ---

[...]

>   	set_zone_contiguous(zone);
>   }
> @@ -1127,7 +1129,8 @@ int mhp_init_memmap_on_memory(unsigned long pfn, unsigned long nr_pages,
>   	if (mhp_off_inaccessible)
>   		page_init_poison(pfn_to_page(pfn), sizeof(struct page) * nr_pages);
>   
> -	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_UNMOVABLE);
> +	move_pfn_range_to_zone(zone, pfn, nr_pages, NULL, MIGRATE_UNMOVABLE,
> +			false);

Nit: Likely indentation suboptimal?

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

