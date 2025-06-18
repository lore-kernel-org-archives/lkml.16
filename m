Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E0C198A2F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750234854; cv=none; b=BSBms4Mx8sm69nAVl5MPgGmMzAu/0W5jN2sQ5O4gzPTZhT4A7tAyX3+Ki6qdzK70pqKlo1zLNfDwGPTka5lEFf2kCyDSOozmaMn/ohKJ5Cg03cHT6yUO5ElRAe/jmcA68RRWzv3/6K6vi5DCrSDyB08N6EbwoMmMYlzYYRAVu3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750234854; c=relaxed/simple;
	bh=j/cmGic9C1esUWQoErNEm5HmeHtI1O9Ix32eRobxcj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ca+Dmkr2GjHSYaPfV8eLPrbarIrs8MFjrr+42FMCEO5YPRYnE8BNxo/4SU4ZseagKFawgRfjW3S5yznN7DHGgAgsS31itTH20dHGZgZ9juCFEgbP1gF1dVqyaAoRMULbW1J9IqDxTNDcP2/VZwU0EpgCTVCI5EFJGI+WfeWkCck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JW5n5uBt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JW5n5uBt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750234850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LBhYV9k9KeT6OsgTMg9dQH6Ku3lWlrWw3bTdhHVaJvs=;
	b=JW5n5uBtXncMVVpYOwXaPSkeFTRbdFbnod0sfR1MXDgEbPQPJ3h5tkIQvSFMEZY0XVSbdZ
	uQcIrb7cS3j8DSivuiZJ7qoilckvVbBPgX7WMbLMhhjb9Ik6HzNFm7xk11TwKomhjX3nYd
	vO6djq3VDnrsk8okoKOItfL7ChvMvpw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-vY5nbFBLM0S3V2pUKfHgHA-1; Wed, 18 Jun 2025 04:20:49 -0400
X-MC-Unique: vY5nbFBLM0S3V2pUKfHgHA-1
X-Mimecast-MFC-AGG-ID: vY5nbFBLM0S3V2pUKfHgHA_1750234848
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45311704d1fso37222965e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750234848; x=1750839648;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LBhYV9k9KeT6OsgTMg9dQH6Ku3lWlrWw3bTdhHVaJvs=;
        b=rvj6jHi3hpsLJVCVHAjazN+TmLwi+y6cyxEwpFtUgJsDFAun6zqfdP3qGa6+KCJxAs
         UCri3qdvlThI8cSal1PqqmlMt4+h73UOwYOeLdMcgnHB/CDxEGYBFcIi1wfEBdDOS7Up
         YGNfaI2zKUt4DXZcwng7p+DbOJprjnOGKbqRbEclw3wXydu3jSBiuvZWYpvfYnShJcn9
         zi47T3vf8RU6lFE2+DcV1YrcbfyfFzmscJaL8Q5rYCax9jV/P/G63AG2QF+iFn1GoCr1
         rHq0YsF4llqugkR8gv3fcOTkTFjUjGtP1I2M1qlq6ROr9D4QjFz2VgD5nxGa0uMXsx2m
         oFyA==
X-Forwarded-Encrypted: i=1; AJvYcCUHvOgVaYoHqe1JjmTo9dEUz5nidPwoivPVAckCp0PwJkcVRGmNt7DdInewwzVcDNMO21MxqHT1EgESS14=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnZmYi0DNh6TIQ+hRAf0Yo5rX32l8bCXFdCC/Wu5GcnYN8Exl+
	8Bw1BLNEjuZU27Whjox61fIf4cQ01b8UUAmAQ58LA/lg5KcZWxmrOvFlF8tq0Yb6tCHonNzp4l+
	bY0AFaU/FjYGTs6CsZAaZmkFQzZM166ZhcYz8OpB6lWXhW9tt07xkBYfQl4x3cpD27w==
X-Gm-Gg: ASbGncsNKCME/4A0Fr0S3rQxsdFLKFWPBVXSjKRfnOW+8BaJlyHHiV0KD9H1jyQziMo
	exvCJnYX0H6ko3g94hX0edx0DRTsAUdQbNebENA0AEy+5LbeiC7G6Blx9Uwc43DIqtr6R46Js9Z
	0DZEDQ3wAus7bCSNsEQVajdZKOrDS+eZpkSoMA1Z+T63wDNjz10SKYgmxZQ4ooGI8gNnJkw1yzz
	GJHID/IAlC4VA9pHVGOGYQs0eydZZN54EoFKPcjhIGzxW7M7AFbgAmmtvqTFJqeifUrfW4TBPSJ
	/HdlyaAMG9Y74ExRqDjnE7mTXErCKfBsiY8pf145koo+Fg9ruBoFt50typCrNFohGx/o+yleJ5M
	zKbdx3hpQBzRehfhqB32QqIlCw7io5Yz8t7n23hGgFgMaOE4=
X-Received: by 2002:a05:600c:3513:b0:453:a95:f086 with SMTP id 5b1f17b1804b1-45343d2c0c4mr141770245e9.12.1750234847967;
        Wed, 18 Jun 2025 01:20:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyZwcfG8Crxxelq6mFOYe2ppW5H6yz4v1Ci/xgNUQ8CxoknbuH/NzdmMPo6KHsgWenCeTQyg==
X-Received: by 2002:a05:600c:3513:b0:453:a95:f086 with SMTP id 5b1f17b1804b1-45343d2c0c4mr141769695e9.12.1750234847518;
        Wed, 18 Jun 2025 01:20:47 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2d:2400:4052:3b5:fff9:4ed0? (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b79f45sm16165095f8f.101.2025.06.18.01.20.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 01:20:47 -0700 (PDT)
Message-ID: <c485543e-8450-448e-9db3-d459f2096496@redhat.com>
Date: Wed, 18 Jun 2025 10:20:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] gup: introduce unpin_user_folio_dirty_locked()
To: lizhe.67@bytedance.com, jgg@ziepe.ca
Cc: akpm@linux-foundation.org, alex.williamson@redhat.com,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 peterx@redhat.com
References: <20250617152210.GA1552699@ziepe.ca>
 <20250618062820.8477-1-lizhe.67@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250618062820.8477-1-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.06.25 08:28, lizhe.67@bytedance.com wrote:
> On Tue, 17 Jun 2025 12:22:10 -0300, jgg@ziepe.ca wrote:
>   
>> Weird, but I would not expect this as a general rule, not sure we
>> should rely on it.
>>
>> I would say exported function should not get automatically
>> inlined. That throws all the kprobes into chaos :\
>>
>> BTW, why can't the other patches in this series just use
>> unpin_user_page_range_dirty_lock? The way this stuff is supposed to
>> work is to combine adjacent physical addresses and then invoke
>> unpin_user_page_range_dirty_lock() on the start page of the physical
>> range. This is why we have the gup_folio_range_next() which does the
>> segmentation in an efficient way.
>>
>> Combining adjacent physical is basically free math.
>>
>> Segmenting to folios in the vfio side doesn't make a lot of sense,
>> IMHO.
>>
>>   drivers/vfio/vfio_iommu_type1.c | 35 +++++++++++++++++++++++++++++----
>>   1 file changed, 31 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
>> index e952bf8bdfab..159ba80082a8 100644
>> --- a/drivers/vfio/vfio_iommu_type1.c
>> +++ b/drivers/vfio/vfio_iommu_type1.c
>> @@ -806,11 +806,38 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
>>   				    bool do_accounting)
>>   {
>>   	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
>> -	long i;
>>   
>> -	for (i = 0; i < npage; i++)
>> -		if (put_pfn(pfn++, dma->prot))
>> -			unlocked++;
>> +	while (npage) {
>> +		long nr_pages = 1;
>> +
>> +		if (!is_invalid_reserved_pfn(pfn)) {
>> +			struct page *page = pfn_to_page(pfn);
>> +			struct folio *folio = page_folio(page);
>> +			long folio_pages_num = folio_nr_pages(folio);
>> +
>> +			/*
>> +			 * For a folio, it represents a physically
>> +			 * contiguous set of bytes, and all of its pages
>> +			 * share the same invalid/reserved state.
>> +			 *
>> +			 * Here, our PFNs are contiguous. Therefore, if we
>> +			 * detect that the current PFN belongs to a large
>> +			 * folio, we can batch the operations for the next
>> +			 * nr_pages PFNs.
>> +			 */
>> +			if (folio_pages_num > 1)
>> +				nr_pages = min_t(long, npage,
>> +					folio_pages_num -
>> +					folio_page_idx(folio, page));
>> +
>> +			unpin_user_folio_dirty_locked(folio, nr_pages,
>> +					dma->prot & IOMMU_WRITE);
> 
> Are you suggesting that we should directly call
> unpin_user_page_range_dirty_lock() here (patch 3/3) instead?
> 
> BTW, it appears that implementing unpin_user_folio_dirty_locked()
> as an inline function may not be viable for vfio, given that
> gup_put_folio() is not exported.

The compiler seems to properly inline like before, so I think we can 
keep that. @Jason correct me if I am wrong.

-- 
Cheers,

David / dhildenb

