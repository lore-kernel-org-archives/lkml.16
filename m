Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CBA5103F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 22:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743546435; cv=none; b=AftBviQDQ2cMuE5OMrtDVsc6sNjMxKy50eI7fksKZLptQY1JvKwi+JC0ZHRwVFDeLIO1LudjUsJmbFgPSiwjnxaA5WanPy6NzrqgX93gcwImoISb3ZxSkcmLtxQxm2Ze06Z6rVnm5di4MoSvXkmHfT+rnKGfQNZLELjZ6IUPOCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743546435; c=relaxed/simple;
	bh=v/g9zwh3OzwnTLMnGe1Vm4twb5YtumkJJRU+R4HT89w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h1B3noI0q+a87Mgc8btXCJXwKLlDauYKp5OxXiiSqZF2CgQNUsnQpOOFMuOJsnKqpDIW3J0p8cEj0VFbEAZ/2+ZFq/+gQB2km8cShlRAGRJ2YP1xxfdfTwlMucv3CpZedEckT9cxHDaG09OzElkr6AhLnXYlpCthHOVXL9NueWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cJK1QrJw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cJK1QrJw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743546432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rEfaUporEJdMtOjtaAta+61j+hvqxkmfjY7Q+CDNSWY=;
	b=cJK1QrJwuvnGHGoUIFo1yEDijfXLQef+nc97wa94QVoa0H92l3hmiM0Tdho1u85RGfW02X
	LZ05LdpRU2ML1TOrTc4Vrk5I/2t+dmO7ctni7hNXqrf27fSw0Xaia0McIhPJ6lLXapb9Ss
	J7NJdICFR0AOiIP4urFbcTTTGXkjUbo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-LI4snRHDMlCiiskoEMCyBQ-1; Tue, 01 Apr 2025 18:27:10 -0400
X-MC-Unique: LI4snRHDMlCiiskoEMCyBQ-1
X-Mimecast-MFC-AGG-ID: LI4snRHDMlCiiskoEMCyBQ_1743546430
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43bc97e6360so34177335e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 15:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743546429; x=1744151229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rEfaUporEJdMtOjtaAta+61j+hvqxkmfjY7Q+CDNSWY=;
        b=purGcgXnXbmuQGO9LlXD9954RIdeFoU9/uR3egb7YgSrS6zrpvmpb2/OKxxw1rZjbg
         Z+o6xqqOY8UFnRuDzFJ9oK1F+ySiNW4IaaH3MLVj418sQeCZDCBOvz7EuqWuqySeog58
         m1O6ZNSTQh4B7Rd0M+dtlx9N0OM6/C/0YOHsCHxRXjTUfDHmRDQmDZZizAkPpdf6Gylm
         Tdna1B1peQWsAXgv21TEcUmr1u6Tsk5jIWn1RiZ6/qPTxft+YgbRuZQjeeDVdrTAHLmt
         zV7L1w6FJUmj7fGsSRH933bOogLz2seMcJaRGo6tc/i+OtznQTWDC5uhplKgMLUabE9G
         WdFA==
X-Forwarded-Encrypted: i=1; AJvYcCUzPEWxudDz8LzXurd6Fxo7jWlLai74H84yhc5hlImusqiwVoXrKthDAzm6fSFhTxY948XRfGbZn/hMa8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjIw6kJGVZX6IkDY1mGnML6KbDxfL64ZsnmWzsFCnuEjhYYeRw
	S5S/hfk8Ttdg1qMfAgHq5CB6WLxejHlrsU4hz3h3cnen/IeafZmxwaWr5FQYCvx2dQkDEE7V8SH
	8fY+ZZyHp+hASMx6lvGCzoALIYIR190wUYi00/afTyJ6OR5ZRu62t8ijfzC8ItlupCClRUA==
X-Gm-Gg: ASbGncuy1Pcf1rTifvu0FALet7N8YIEudIucWKIcwBHQWhOyA9sGPBlQ7CJqshh01mc
	cS4VJb9aBXTY79yrQZcgWmxvjuECQZd+/j+h1q8X+Cm3vu/9VCk1uLsLFV/KDjjk5DPuwXH9Oog
	yZkS8FlfQogYZe//iHEc/XPdEkVdhQpo7fILOq8BAk6GS2wTWoqiDHF9cUXnCNbuXiflNoRbuBs
	b1bmJm6tnT2J92hGcJm9qr0X7IT8z1sZJY/p3Z74FhCTIKEUD8CVy0+y84dm0qY+P7d3VDP/nsz
	luXcQJTHaI40JCy0dYeQdj69hwehc43RuxL28oHOj+Gt2rY1Cpwpgz0=
X-Received: by 2002:a05:600c:1c97:b0:43c:eeee:b706 with SMTP id 5b1f17b1804b1-43ea9d8dc29mr38348005e9.24.1743546429315;
        Tue, 01 Apr 2025 15:27:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmNO0N3qfaT9LYTWddsRxRxiZUgNapeHyB1i0Kb5nmUn/nYEF/e2sPAkDX5eBfLm1QHONpgw==
X-Received: by 2002:a05:600c:1c97:b0:43c:eeee:b706 with SMTP id 5b1f17b1804b1-43ea9d8dc29mr38347855e9.24.1743546428877;
        Tue, 01 Apr 2025 15:27:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fcd3d7sm1973685e9.12.2025.04.01.15.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 15:27:08 -0700 (PDT)
Message-ID: <ed68d414-ddbc-4472-9663-e6728a1f1eef@redhat.com>
Date: Wed, 2 Apr 2025 00:27:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/8] drm/i915/gem: Add i915_gem_object_panic_map()
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250401125818.333033-1-jfalempe@redhat.com>
 <20250401125818.333033-5-jfalempe@redhat.com> <Z-wmxijRKQiZFyup@intel.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <Z-wmxijRKQiZFyup@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/04/2025 19:47, Ville Syrjälä wrote:
> On Tue, Apr 01, 2025 at 02:51:10PM +0200, Jocelyn Falempe wrote:
>> Prepare the work for drm_panic support. This is used to map the
>> current framebuffer, so the CPU can overwrite it with the panic
>> message.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>
>> v5:
>>   * Use iosys_map for intel_bo_panic_map().
>>
>>   drivers/gpu/drm/i915/display/intel_bo.c    |  5 ++++
>>   drivers/gpu/drm/i915/display/intel_bo.h    |  1 +
>>   drivers/gpu/drm/i915/gem/i915_gem_object.h |  2 ++
>>   drivers/gpu/drm/i915/gem/i915_gem_pages.c  | 29 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/display/intel_bo.c      | 10 ++++++++
>>   5 files changed, 47 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_bo.c b/drivers/gpu/drm/i915/display/intel_bo.c
>> index fbd16d7b58d9..ac904e9ec7d5 100644
>> --- a/drivers/gpu/drm/i915/display/intel_bo.c
>> +++ b/drivers/gpu/drm/i915/display/intel_bo.c
>> @@ -57,3 +57,8 @@ void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj)
>>   {
>>   	i915_debugfs_describe_obj(m, to_intel_bo(obj));
>>   }
>> +
>> +void intel_bo_panic_map(struct drm_gem_object *obj, struct iosys_map *map)
>> +{
>> +	i915_gem_object_panic_map(to_intel_bo(obj), map);
>> +}
>> diff --git a/drivers/gpu/drm/i915/display/intel_bo.h b/drivers/gpu/drm/i915/display/intel_bo.h
>> index ea7a2253aaa5..5b6c63d99786 100644
>> --- a/drivers/gpu/drm/i915/display/intel_bo.h
>> +++ b/drivers/gpu/drm/i915/display/intel_bo.h
>> @@ -23,5 +23,6 @@ struct intel_frontbuffer *intel_bo_set_frontbuffer(struct drm_gem_object *obj,
>>   						   struct intel_frontbuffer *front);
>>   
>>   void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj);
>> +void intel_bo_panic_map(struct drm_gem_object *obj, struct iosys_map *map);
>>   
>>   #endif /* __INTEL_BO__ */
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> index a5f34542135c..b16092707ea5 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> @@ -692,6 +692,8 @@ i915_gem_object_unpin_pages(struct drm_i915_gem_object *obj)
>>   int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj);
>>   int i915_gem_object_truncate(struct drm_i915_gem_object *obj);
>>   
>> +void i915_gem_object_panic_map(struct drm_i915_gem_object *obj, struct iosys_map *map);
>> +
>>   /**
>>    * i915_gem_object_pin_map - return a contiguous mapping of the entire object
>>    * @obj: the object to map into kernel address space
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> index 8780aa243105..718bea6474d7 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> @@ -355,6 +355,35 @@ static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
>>   	return vaddr ?: ERR_PTR(-ENOMEM);
>>   }
>>   
>> +/* Map the current framebuffer for CPU access. Called from panic handler, so no
>> + * need to pin or cleanup.
>> + */
>> +void i915_gem_object_panic_map(struct drm_i915_gem_object *obj, struct iosys_map *map)
>> +{
>> +	enum i915_map_type has_type;
>> +	void *ptr;
>> +
>> +	ptr = page_unpack_bits(obj->mm.mapping, &has_type);
>> +
>> +
>> +	if (!ptr) {
>> +		if (i915_gem_object_has_struct_page(obj))
>> +			ptr = i915_gem_object_map_page(obj, I915_MAP_WB);
>> +		else
>> +			ptr = i915_gem_object_map_pfn(obj, I915_MAP_WB);
> 
> WB mapping would require clflushing to make it to the display.
> Is that being done somewhere?

Yes, it's done in intel_panic_flush() in patch 5, otherwise the panic 
screen is not displayed.

> 
>> +
>> +		if (IS_ERR(ptr))
>> +			return;
> 
> What happens when the mapping fails?

In intel_get_scanout_buffer(), the iosys_map is cleared before calling 
this function. Then it checks iosys_map_is_null(), and returns an error 
if it is.
I can add a comment, or I can change the function type to return an int, 
  that would probably be cleaner.

> 
>> +
>> +		obj->mm.mapping = page_pack_bits(ptr, I915_MAP_WB);
>> +	}
>> +
>> +	if (i915_gem_object_has_iomem(obj))
>> +		iosys_map_set_vaddr_iomem(map, (void __iomem *) ptr);
>> +	else
>> +		iosys_map_set_vaddr(map, ptr);
>> +}
>> +
>>   /* get, pin, and map the pages of the object into kernel space */
>>   void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
>>   			      enum i915_map_type type)
>> diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
>> index 27437c22bd70..c68166a64336 100644
>> --- a/drivers/gpu/drm/xe/display/intel_bo.c
>> +++ b/drivers/gpu/drm/xe/display/intel_bo.c
>> @@ -59,3 +59,13 @@ void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj)
>>   {
>>   	/* FIXME */
>>   }
>> +
>> +void intel_bo_panic_map(struct drm_gem_object *obj, struct iosys_map *map)
>> +{
>> +	struct xe_bo *bo = gem_to_xe_bo(obj);
>> +	int ret;
>> +
>> +	ret = ttm_bo_vmap(&bo->ttm, map);
>> +	if (ret)
>> +		iosys_map_clear(map);
>> +}
>> -- 
>> 2.49.0
> 

