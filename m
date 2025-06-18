Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178482EBDEF
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750261127; cv=none; b=jjCuvoWS7Ub3Wn3McQuJnEDWkft7xVsOTVHvXx5IW0P1SioWFCIC2QzCQJJoc2Fb7u+2hOLOss98I2ObyRlUlEUi/ejgqJZtjlk5HzXlmKqObcubmtxtgRrUi5RMldgQsf+fRc8OSgUYLgOjJj1kqOkOSYgqmNtlkz6YYkA772E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750261127; c=relaxed/simple;
	bh=/nKlmYUV71JBUi+OdyojY/NuYUzKwCMfI6S09TmahfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Zfglue+Y+EgbXtFrCCsMy5tzqsqxGM7BM9bzSkkmXEquwSx4BYUNmrQgMa1pRm2jNBy8BxnJya6LFUnW7DRqhTrpN6M7GrAzZIuZOd6Hak9zxn9hwOlIQCVHX5smCD4DHnoOV7ELByJUDGoKiu+8QuNc0+9kWWFHAoP6DPShPBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gaO+qqXL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gaO+qqXL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750261123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wt0S9Wn9Dl5xj40Pf2ZHj9QLP9iw6mygzm/57GhRi3o=;
	b=gaO+qqXL5N07x4imfF4t4yxUhtkNKMwRqmNzGcEVD5BvbCTVj9B0c+fRYt9zSLGLa1EefI
	CqAQ9qv82pC0QtqpWIlhH0qOJi/Suk9imcwIaj2ZEJivSg3E4n3JnBaE0/0ujsFwbzSZw6
	WCXwjV/zGDGBLskvDOCPLxdtb6waBXU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-zHKr6DCVNBOAbls6mE8vKQ-1; Wed, 18 Jun 2025 11:38:41 -0400
X-MC-Unique: zHKr6DCVNBOAbls6mE8vKQ-1
X-Mimecast-MFC-AGG-ID: zHKr6DCVNBOAbls6mE8vKQ_1750261121
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4e9252ba0so3605625f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750261120; x=1750865920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wt0S9Wn9Dl5xj40Pf2ZHj9QLP9iw6mygzm/57GhRi3o=;
        b=qXIvyEPnm2dvHES41/xkijHYnstz/YNmEOttNSNBkYMSxD6NlK9fnDpNWowEOTWGuj
         g3LE+3ZgzgqyZV/NNuwuD5JdUxPxI5/UbtSfCzoW3VmB4rG0iUinOxG755wXnMAXIOy1
         c2l9IUHpwMUgIy4HpCqFZeoL160YoxRaAKVnXuGMWiQMRN0EPJ/v/aHg6r5DP62mK7h2
         yjIWFgDG8SZc4uiLTsaoQACQyBHQsu9svHR4+aSU099HxAUGfpIXIUOOawfQczca1l3A
         NzZe3ptMwNQC47pO4gpR7zEHvK3BHr+UyfJtgfaIM3aFO3bH2NlbgIIxfIg61wgofYYu
         hcSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP15NrD1ZlRJHK55mgOeczpeR8alIJOhbhTsWoPPVvFYwTkdTUvPAtnk4d+j9w3evQ+Bngqcfj2B1S8fk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGe2JGfjq6b6xgBi1t9htd9fD1PbA7w2bfV4ZtQLIfsiBMwSYN
	GyQzT0wZCLlXjjFAD/HnfUhGk0TRKQFVvQzuqmGoA7j00swfZo+2OwJR7idQt7xSrsA55W0IRtn
	5aQbseCTyB3KfxkEsV6enDYCIav8ej0CmK8NnLL61rdFTNoE/M+2OUjfTvtvMlsRZEMpewvQRpQ
	==
X-Gm-Gg: ASbGncsVBsPwl/jaaZCOk5kTHXsxgv/K01AvmSlHiv1c1kZMsKbdx0or4gdfVKsF0eB
	7NJpe5o3ifuoxryRAz4f9q/8gkXYNTVFGY7aX24xr925U6i8qA/F4RZOLdoYI/IJFkS1XHZw28q
	JZgbzqbEvRNGGEY/p9xJWXNwNvMBLH38a92cgQvmYYLdtSeNiMAXy70/HwFvNg2VFIrq6PuB/to
	LdA5DfTP8/K1BmOh+MyRHCMmSVynKv1y4lzqsCabbnjm9Sy5z/KxZ8MiqP9Ivp6WGMwX+HFIp3g
	geQm22xexkXhh6aRlsv2tQxM6bv96ktPzCbeaVqsY5AXPVjzfjeztm0rp/wUAA==
X-Received: by 2002:a05:6000:144d:b0:3a4:dc32:6cbb with SMTP id ffacd0b85a97d-3a5723a2637mr15974390f8f.31.1750261120260;
        Wed, 18 Jun 2025 08:38:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEi/PvSi28W64wEB4MqlKtyFp25jrX3SumPTWri+fBnNlbZYYas7D3NWBiwU0dt/UK1fnYB0w==
X-Received: by 2002:a05:6000:144d:b0:3a4:dc32:6cbb with SMTP id ffacd0b85a97d-3a5723a2637mr15974361f8f.31.1750261119745;
        Wed, 18 Jun 2025 08:38:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62? ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e97ac4asm961405e9.3.2025.06.18.08.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 08:38:39 -0700 (PDT)
Message-ID: <ca3f14ec-554b-4ed8-9fe1-9561d59d7f5a@redhat.com>
Date: Wed, 18 Jun 2025 17:38:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 05/10] drm/ttm: Add ttm_bo_kmap_try_from_panic()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250618094011.238154-1-jfalempe@redhat.com>
 <20250618094011.238154-6-jfalempe@redhat.com>
 <c44f4194-69e5-41bf-bbc6-2e399be2b627@amd.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <c44f4194-69e5-41bf-bbc6-2e399be2b627@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/06/2025 15:55, Christian König wrote:
> 
> 
> On 6/18/25 11:31, Jocelyn Falempe wrote:
>> If the ttm bo is backed by pages, then it's possible to safely kmap
>> one page at a time, using kmap_try_from_panic().
>> Unfortunately there is no way to do the same with ioremap, so it
>> only supports the kmap case.
>> This is needed for proper drm_panic support with xe driver.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Preferred through drm-misc-next, but feel free to merge it through every branch you want if it makes thinks easier for you.

Thanks, I will see if I can get the whole series through drm-intel-next, 
or if I can merge #1 and #5 first in drm-misc-next.

Best regards,

-- 

Jocelyn


> 
> Regards,
> Christian.
> 
>> ---
>>
>> v8:
>>   * Added in v8
>>
>> v9:
>>   * Fix comment in ttm_bo_kmap_try_from_panic(), this can *only* be called
>>     from the panic handler (Christian König)
>>
>>   drivers/gpu/drm/ttm/ttm_bo_util.c | 27 +++++++++++++++++++++++++++
>>   include/drm/ttm/ttm_bo.h          |  1 +
>>   2 files changed, 28 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> index 15cab9bda17f..6912e6dfda25 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>> @@ -377,6 +377,33 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
>>   	return (!map->virtual) ? -ENOMEM : 0;
>>   }
>>   
>> +/**
>> + *
>> + * ttm_bo_kmap_try_from_panic
>> + *
>> + * @bo: The buffer object
>> + * @page: The page to map
>> + *
>> + * Sets up a kernel virtual mapping using kmap_local_page_try_from_panic().
>> + * This should only be called from the panic handler, if you make sure the bo
>> + * is the one being displayed, so is properly allocated, and protected.
>> + *
>> + * Returns the vaddr, that you can use to write to the bo, and that you should
>> + * pass to kunmap_local() when you're done with this page, or NULL if the bo
>> + * is in iomem.
>> + */
>> +void *ttm_bo_kmap_try_from_panic(struct ttm_buffer_object *bo, unsigned long page)
>> +{
>> +	if (page + 1 > PFN_UP(bo->resource->size))
>> +		return NULL;
>> +
>> +	if (!bo->resource->bus.is_iomem && bo->ttm->pages && bo->ttm->pages[page])
>> +		return kmap_local_page_try_from_panic(bo->ttm->pages[page]);
>> +
>> +	return NULL;
>> +}
>> +EXPORT_SYMBOL(ttm_bo_kmap_try_from_panic);
>> +
>>   /**
>>    * ttm_bo_kmap
>>    *
>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>> index cf027558b6db..8c0ce3fa077f 100644
>> --- a/include/drm/ttm/ttm_bo.h
>> +++ b/include/drm/ttm/ttm_bo.h
>> @@ -429,6 +429,7 @@ int ttm_bo_init_validate(struct ttm_device *bdev, struct ttm_buffer_object *bo,
>>   int ttm_bo_kmap(struct ttm_buffer_object *bo, unsigned long start_page,
>>   		unsigned long num_pages, struct ttm_bo_kmap_obj *map);
>>   void ttm_bo_kunmap(struct ttm_bo_kmap_obj *map);
>> +void *ttm_bo_kmap_try_from_panic(struct ttm_buffer_object *bo, unsigned long page);
>>   int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map);
>>   void ttm_bo_vunmap(struct ttm_buffer_object *bo, struct iosys_map *map);
>>   int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo);
> 

