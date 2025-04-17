Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0515A21C162
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744879232; cv=none; b=JnFXgdEvliqORuizamFavFZtw+XeRF4QQMTlBNbpGQpEfhn+fCnlLAnAIT0abLRwRXgTHbgd2uV+y828G68zXKGITmQevct6BickThcKQHnColiVmxmV52HRGGMLtRArUFTbDrXj+ideJxYpFbTZS2SSHct2+CqqBJu3lVdV/o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744879232; c=relaxed/simple;
	bh=IAo3QNskL03rdP0A9AmyP8vjrsbCqugDP4tHh/BJV2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sq2+t2JtUfu72cAmD+dlvqmRx14YQnIh18jg/oB/oqph/jg2RcZl8m/IjZmolA6qP2mB4klnTJz19AxVIZJaVUV4MFQMYyrmhjfQH7Uh72mHB/QbNtMXTPdj5mT7GRUvsd1zUAXx6r/lbgVwUzaPeIko+0DU64F3a10wUOY4ZdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A2wfOquL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A2wfOquL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744879228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2HM15lSIcwJz1/Tn8IohqE330i22WhecFHOPITsT+xA=;
	b=A2wfOquLiwBizl77FWU1T40ejtYXyOeBGGPDETWO5yLRrp2hXoOD3aEuACxKLXx/cAx0R9
	gJ/bsnEukOdI14ggMy+iaE9VrUSEfOT9o0NL8Oy4/oaxcgWOHaHTZFYFiuV0VSgwJyAmqA
	v9mL9I+uYqFwum5MFJ5202Xdt53tAhY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-N59Deh8TN06mW7ccxYMzUQ-1; Thu, 17 Apr 2025 04:40:27 -0400
X-MC-Unique: N59Deh8TN06mW7ccxYMzUQ-1
X-Mimecast-MFC-AGG-ID: N59Deh8TN06mW7ccxYMzUQ_1744879226
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39d917b105bso260226f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 01:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744879226; x=1745484026;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2HM15lSIcwJz1/Tn8IohqE330i22WhecFHOPITsT+xA=;
        b=gG/VohyNrwcIbGlDI8WAgoQoZH1xTgBvKLUlMxMPIecIgv3PcYhAQfHKM29K8GNGbu
         Xojlj4S6GRuBB45w3kCTgx9nn6GV0tTIDdwmlqpcm/JV4mY4P5RgDyKlZH0IaBwFYK30
         GFXPtsLDGzUxoxEoETgAniyGyDon9G007ZoLEyA9L7w/gZKansjfLqHrGoAlNaJONKoa
         znLkigFd18hV81ozMeGPYkZpASSy2DUt5xfhomNZNldto9f5m9tKpenzA32y1gtB7pIR
         etl6T44S6jH8szNfZS53yxrSo2nrJUnsB5uVxbHA0x28tgTp8k5Ihafem+nwjVz6eLkb
         ZAlQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2jjZXJaFoDQe6zL/bgYLofVZO4TdA+A2GngZJJOOid6Rgb/cWESk7wQ9D0z1VyRwnmQHBFRWM/1/u4eo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYNDTpAHxpytl9DORfWpgOxvu/ZAbF1YChcZCfToE08ylgwbUU
	2Sd6SA2hKFDsgD+Wj14wabhCHnYBcBd31rgmVYCbnE77E1tbYONBxgZUWXEluCIJ3A72/XhYcnJ
	44NfteTo8J2ruK56GPetcp8Ce4d5ici2gGQXoPz/n/NLrXMJToELBYUk9Mbp1VQ==
X-Gm-Gg: ASbGnctY+CYXj7Vmky2LHIO5csHX2tcul4RCsSsZIeCTyCS1Ex7bC+4ORFaLtGpC6Z1
	8OXcQsPCAYEybtYXDamZcl5CKnw6mDAb7hJSvjchzyKXmN7xqTYsxcE/tIfAunJZqtGKdX87Enm
	8q/epJ8h/z4+l4AeqPUcvmGv2vXNDj9nVDcStwLdZnkUAru0l90oDg8+4Q09h8wZrxHn6Zv2kfl
	ZwGNqGlXLb9H5TyXRaPaLtGXtKiBu/SmZrA0RxQuYUvsSLLRj0ikEYBwBDy1XEA4qQnrKNgBVuK
	HonQH9FzlS5t6LH/xFPH4T83jJOhSVlCT3DrhmvsqZ71vHz979igzxNNNc+i42oBYqzcSrtK6kD
	uAMnS7w7vhe5kkomjLYDzgRpHjd6ZJdeYca8yLmo=
X-Received: by 2002:a05:6000:2911:b0:399:6dc0:f134 with SMTP id ffacd0b85a97d-39ee5bad76emr4379724f8f.51.1744879225956;
        Thu, 17 Apr 2025 01:40:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQeRaBf4AjgQTFoutEd6jXROHhB1GPjNf97Ew+mL54HY9MIlxAHk/+IocWI7W3ZkjJTLahOQ==
X-Received: by 2002:a05:6000:2911:b0:399:6dc0:f134 with SMTP id ffacd0b85a97d-39ee5bad76emr4379705f8f.51.1744879225578;
        Thu, 17 Apr 2025 01:40:25 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:2700:abf9:4eac:588c:adab? (p200300cbc7062700abf94eac588cadab.dip0.t-ipconnect.de. [2003:cb:c706:2700:abf9:4eac:588c:adab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ee3f12dc9sm4168115f8f.8.2025.04.17.01.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 01:40:25 -0700 (PDT)
Message-ID: <75dc1299-8a83-4ce8-a715-cf1a8d43e0f9@redhat.com>
Date: Thu, 17 Apr 2025 10:40:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/2] mm: export folio_expected_refs for JFS migration
 handler
To: Shivank Garg <shivankg@amd.com>, shaggy@kernel.org,
 akpm@linux-foundation.org
Cc: willy@infradead.org, wangkefeng.wang@huawei.com, jane.chu@oracle.com,
 ziy@nvidia.com, donettom@linux.ibm.com, apopple@nvidia.com,
 jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com
References: <20250417060630.197278-1-shivankg@amd.com>
 <20250417060630.197278-2-shivankg@amd.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250417060630.197278-2-shivankg@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.04.25 08:06, Shivank Garg wrote:
> Export folio_expected_refs() to allow filesystem-specific migration
> handlers like JFS metapage_migrate_folio to properly verify reference
> counts before migration.
> 
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---
>   include/linux/migrate.h | 1 +
>   mm/migrate.c            | 3 ++-
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index aaa2114498d6..cb31c5b1eb6a 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -60,6 +60,7 @@ struct movable_operations {
>   /* Defined in mm/debug.c: */
>   extern const char *migrate_reason_names[MR_TYPES];
>   
> +int folio_expected_refs(struct address_space *mapping, struct folio *folio);
>   #ifdef CONFIG_MIGRATION
>   
>   void putback_movable_pages(struct list_head *l);
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 6e2488e5dbe4..0f01b8a87dec 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -445,7 +445,7 @@ void pmd_migration_entry_wait(struct mm_struct *mm, pmd_t *pmd)
>   }
>   #endif
>   
> -static int folio_expected_refs(struct address_space *mapping,
> +int folio_expected_refs(struct address_space *mapping,
>   		struct folio *folio)
>   {
>   	int refs = 1;
> @@ -458,6 +458,7 @@ static int folio_expected_refs(struct address_space *mapping,
>   
>   	return refs;
>   }
> +EXPORT_SYMBOL_GPL(folio_expected_refs);
>   
>   /*
>    * Replace the folio in the mapping.

Can we make that an inline function instead, and add some documentation?

This function is only suitable if we know the folio is unmapped from 
page tables (no references from page table mappings: !folio_mapped()).

So when exporting this function we either

a) Need a clearer name

b) Should generalize it to consider folio_mapcount() etc, and lookup the
    mapping from the folio.

For your use case, a) might be easier. Maybe call  it something like 
"folio_migration_expected_refs" ?

-- 
Cheers,

David / dhildenb

