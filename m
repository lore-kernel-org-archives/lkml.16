Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807E121A433
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750758467; cv=none; b=RnUpSxMZNOfGIcYbitOuVwc6M/gr2cvrZ0oxuyVaqnpCvtDXFYGu7Zcn1TBJJxjOQ5ujfCB5NN0l3vObDTnhQvP0sTDDnF8KGqgiHVYJSagW3wOV+ZgnxfXmI+ofiIqqqzI1QjqIJstZQ9GeRyA0CjDdluFTQaBXoGzmajhKg84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750758467; c=relaxed/simple;
	bh=/jSuHh2C38f1M1bPCzkjiFFc2048REs7I9oM3oF6Xfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kh9LwmK1yFXj5sC7i5+GjwIq4N1MoFYa5KIxecEdMSnYbIO5bCmQTl1+VvaM5tnYbUdGkVEm/vjXh2PzkyybQpxISL5Ka9jd0HSAbsxR+R4HL7pdJpzisMKfKMFMbD8C/jYblFM77kBQiOtnVDZv2iafaxyAdpOZvU1D71awwBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K/DR5rnn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K/DR5rnn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750758464;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0z8HYNkIOI4XU46KLX1GRdmm2pMYnqtBqt1KaAKwMBw=;
	b=K/DR5rnn5eihSvQ5/sGB1iLjKB2YbWG8Ft4DjQ7GmSIRvR4hcqv5VDXC4QkzIhk/KrOBvV
	jDeLtv2r/k6AQOUlkhGlKgkvzXt4F1oBvLtnq4E55XUCGacf5V6j/evC/U/taQkKnkdZVF
	t25fUmzuSgmKO0hxhw3+QURIDt0vWJw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-wMz6kCCwPq-Ft4OGU5SGFA-1; Tue, 24 Jun 2025 05:47:42 -0400
X-MC-Unique: wMz6kCCwPq-Ft4OGU5SGFA-1
X-Mimecast-MFC-AGG-ID: wMz6kCCwPq-Ft4OGU5SGFA_1750758461
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451deff247cso28638535e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750758461; x=1751363261;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0z8HYNkIOI4XU46KLX1GRdmm2pMYnqtBqt1KaAKwMBw=;
        b=nJQ79k8brPWoO4JLDsA4z8v3ABgBUTFXI8Kw3UYZQT+7BrWOrbGKhS2mTQa/D2cIfU
         zutbteopeMYew2NP9G8SWjp3DrfxOSPKVRwxNBFxizrekzgwG5g0mAas7XIsGR/nbVDQ
         KhWPDLb7Wz9rO+aY58vBDwfVSad80WTo+errJPX+lVNHa7gw1kc8DHDWxFH6vh072jCV
         H+ugfS03sMpiLwZe0tZGtcSxVlNw8E+xfC5sqU3waoP6NGSQ4Cn25tcB8z6/T0eLIOaJ
         GN1sy+iGCUZNlNIqL3h7UT6RZh79+sxBAmsUKk6hVE0XP7kpZhYpOVPN1VMryVXXu0LD
         FJ0w==
X-Gm-Message-State: AOJu0YyI/IOggnr6zULy3BNoOey6TaOYl3yyZP1kDb4OGRRXbKxBKz88
	nGVrSXSGWkgCyWZ/qRWyGyqLaA29SsCH1z1YKSKnYWd8diYLNmeOo0akGxIcobXthvy8y4YuCl3
	Pa8QwyMxKyufiDzT0Ps0EihcWKs7EwkgY56XR+uc8F2TC6XHsIf5SxJv0IVKgDp3Rig==
X-Gm-Gg: ASbGncuD5CRy9BOtQJmfCbUqZXHlwLRvrPKVkLkUiuEXvPk/oHcSvlPbC7MPGEXQr04
	/2lt4a0mtSorKpfje3C8IKl6Nz3oOktzWBvDs8SMzmw4iEXAdDkEFCojZIBw+nKjy7bdWWxYHFa
	/DUFzMaOFe2rEavrv3QoYrSQ/AWAj11VXUoi0C7d8PNBIBrJ+JeYV10SHWXFWi2VOSRuyd3fsiL
	TV2mV8iE+YxPuoIstz31uH2q8YXH7UGOAV3dH06PYp0y8FLOWoUIAgARE/HULUlQq8v/90VeUvI
	OY+x4UKwGZ6UpUEWgqWp+YSHKYSHRsT3Nfsc8l/olkdkDCOQtg4djF0=
X-Received: by 2002:a05:6000:288f:b0:3a4:ce5c:5e8d with SMTP id ffacd0b85a97d-3a6e720662fmr2319349f8f.20.1750758461038;
        Tue, 24 Jun 2025 02:47:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8djLFNnDpeZNIigPUeQ9PHBQioRlBc2lnCxuo0cWEFFhY9HSOm6C0+7jAYWjZOihkWEhWXg==
X-Received: by 2002:a05:6000:288f:b0:3a4:ce5c:5e8d with SMTP id ffacd0b85a97d-3a6e720662fmr2319293f8f.20.1750758460552;
        Tue, 24 Jun 2025 02:47:40 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f67c4sm1506569f8f.62.2025.06.24.02.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 02:47:40 -0700 (PDT)
Message-ID: <c6a6059d-460b-4f7c-8976-f05b0a58b5e1@redhat.com>
Date: Tue, 24 Jun 2025 11:47:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: page_ext and memdescs
To: Matthew Wilcox <willy@infradead.org>, Bharata B Rao <bharata@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Jonathan.Cameron@huawei.com, dave.hansen@intel.com, gourry@gourry.net,
 hannes@cmpxchg.org, mgorman@techsingularity.net, mingo@redhat.com,
 peterz@infradead.org, raghavendra.kt@amd.com, riel@surriel.com,
 rientjes@google.com, sj@kernel.org, weixugc@google.com,
 ying.huang@linux.alibaba.com, ziy@nvidia.com, dave@stgolabs.net,
 nifan.cxl@gmail.com, xuezhengchu@huawei.com, yiannis@zptcorp.com,
 akpm@linux-foundation.org
References: <20250616133931.206626-1-bharata@amd.com>
 <20250616133931.206626-4-bharata@amd.com>
 <aFAkkOzJius6XiO6@casper.infradead.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aFAkkOzJius6XiO6@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.06.25 16:05, Matthew Wilcox wrote:
> On Mon, Jun 16, 2025 at 07:09:30PM +0530, Bharata B Rao wrote:
>> diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
>> index 76c817162d2f..4300c9dbafec 100644
>> --- a/include/linux/page_ext.h
>> +++ b/include/linux/page_ext.h
>> @@ -40,8 +40,25 @@ enum page_ext_flags {
>>   	PAGE_EXT_YOUNG,
>>   	PAGE_EXT_IDLE,
>>   #endif
>> +	/*
>> +	 * 32 bits following this are used by the migrator.
>> +	 * The next available bit position is 33.
>> +	 */
>> +	PAGE_EXT_MIGRATE_READY,
>>   };
>>   
>> +#define PAGE_EXT_MIG_NID_WIDTH	10
>> +#define PAGE_EXT_MIG_FREQ_WIDTH	3
>> +#define PAGE_EXT_MIG_TIME_WIDTH	18
>> +
>> +#define PAGE_EXT_MIG_NID_SHIFT	(PAGE_EXT_MIGRATE_READY + 1)
>> +#define PAGE_EXT_MIG_FREQ_SHIFT	(PAGE_EXT_MIG_NID_SHIFT + PAGE_EXT_MIG_NID_WIDTH)
>> +#define PAGE_EXT_MIG_TIME_SHIFT	(PAGE_EXT_MIG_FREQ_SHIFT + PAGE_EXT_MIG_FREQ_WIDTH)
>> +
>> +#define PAGE_EXT_MIG_NID_MASK	((1UL << PAGE_EXT_MIG_NID_SHIFT) - 1)
>> +#define PAGE_EXT_MIG_FREQ_MASK	((1UL << PAGE_EXT_MIG_FREQ_SHIFT) - 1)
>> +#define PAGE_EXT_MIG_TIME_MASK	((1UL << PAGE_EXT_MIG_TIME_SHIFT) - 1)
> 
> OK, so we need to have a conversation about page_ext.  Sorry this is
> happening to you.  I've kind of skipped over page_ext when talking
> about folios and memdescs up to now, so it's not that you've missed
> anything.
> 
> As the comment says,
> 
>   * Page Extension can be considered as an extended mem_map.
> 
> and we need to do this because we don't want to grow struct page beyond
> 64 bytes.  But memdescs are dynamically allocated, so we don't need
> page_ext any more, and all that code can go away.
> 
> lib/alloc_tag.c:struct page_ext_operations page_alloc_tagging_ops = {

In this case, we might not necessarily have an allocated memdesc, for 
all allocations, though. Think of memory ballooning allocating "offline" 
pages in the future.

Of course, the easy solution is to not track these non-memdesc allocations.

> mm/page_ext.c:static struct page_ext_operations page_idle_ops __initdata = {

That should be per-folio.

> mm/page_ext.c:static struct page_ext_operations *page_ext_ops[] __initdata = {

That's just the lookup table for the others.

> mm/page_owner.c:struct page_ext_operations page_owner_ops = {

Hm, probably like tagging above.

> mm/page_table_check.c:struct page_ext_operations page_table_check_ops = {

That should be per-folio as well IIUC.

-- 
Cheers,

David / dhildenb

