Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9621991B8
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 15:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746199914; cv=none; b=Woa8mAGb1X9Nh5Y354+A6KP0CEUI9stGdGKgEghOwyhDNG7W9TtGASzACL5DbXng4Id+sqvoIPa29QfgXnVOwgbp25JziTKbU92tF0vsVkzKT4qJQimCwQfbrjDQ2aL2L+fZPZicpIyM8y31UFgEt6ctYm3a7SawSzpJmynxg9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746199914; c=relaxed/simple;
	bh=JpxLmURCuj3alrBPtN3GglsjWmWJzl73/AdPQR+bWLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fjSDu6WGx0g15f0AMMTep4tpZLjZuRSn9ch1iEqZIdHsOp4TmXDuEKjtnrjKpqbvmwz6qzT5fJPRQSK0mstCdC18KrSFTMtzYOV/2oRXOBTOiLbnrbW0DVlI46bDV8xRR5CfCE9IDnRUHLF3YpveioOHKDeL5S89Ucz3LQ1O5cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gyKSWKOq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gyKSWKOq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746199911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jM8M6akj52fCQHHjXX1/nsZvwbcymr7x1EGpLLdZdRo=;
	b=gyKSWKOqP4uLnebtLqw1aFbxEhh1XEYr5QoKpoPiCkik3lZgmbS6cyJw5Bf7WyDVDDHC3v
	o6bML0BgKm8KLksdkehSZI3UGOYlLkS+T/m3FhBsPK9AHOJh+A7c9c+RFyAk12EdyC8QJS
	k03MfQcVl5C9NmlPkAJUN/TBygPFIvw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-nmuh_mXIM7uOveivIeGNIQ-1; Fri, 02 May 2025 11:31:50 -0400
X-MC-Unique: nmuh_mXIM7uOveivIeGNIQ-1
X-Mimecast-MFC-AGG-ID: nmuh_mXIM7uOveivIeGNIQ_1746199909
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so13251525e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 08:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746199909; x=1746804709;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jM8M6akj52fCQHHjXX1/nsZvwbcymr7x1EGpLLdZdRo=;
        b=P9IYjsHWl2fJ+ASDIeW7cENH+3lDRk3mksCFMIpD8G54OlJXPe2iBim2gdyH6rWNGd
         lTUxICXLmMyiiJ1cARWGvlnOCVDCLsd2siH7OHNG14gZIKaIhti9kcsB9g0CRm5ezpTF
         3mMVZlSi+ekFcffm/PWZwGBmT/Ad/h1vkOl4qawP+aROZjwLqhfUOD8vlqLp/U9PYIAt
         wmob23+X3PH8gUlYTCvTC18IYIHzmUCHshWAwur+qbpgAB1DBt55Fppu1fcywiXpE775
         F1tWkl7F3T192DL9uLO1m/8bhrbAoO/auqPMqZTQoBFrDJeRNy7F5E+aglQP7RIeUXTl
         3Wfw==
X-Forwarded-Encrypted: i=1; AJvYcCWDU8XCvdEako9uo24gdJHEm4Lf0jjCMsGe0WMQ0kykvnivHIo4yhPnDqiN1DeUj7OsL8DjoeMVR2Hkac8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnI89RGmLiB4G5v2JKyX/DkDHVd6h/0U/JnCHuxXuYgEQCuCnY
	o0BDYuhthgWANaIcMXofrnQ2DnBR/N/xaTtpUUqOI33oIhXOeBpshBE5/Sk7qfyWN4w9U0HRg1J
	uHTjEjoFh9EIGoZW7vpkySLJc+H233Q8DqROKh0wUEMpV4PE11lxDaaBsKnexOw==
X-Gm-Gg: ASbGnctqGxEhKB9hY77Gc4BAcVRuUi4W8p2aW2qHxJqwvJmJNDjyYrbKFuDooOs76p9
	8p5OK8IBkQNDvE1a48DicM8Vk8b4XoL2CXX4pgfT1GtW4NDwfxE6B7wr1gT7GZwGOjlPGQMRuyi
	tsGV9vQo2f+C2x7TF3Euw+fVNzpzEuwKQXMcKYXey4Y6THR4j87gxTou9ya9Fwm89T3paIN9S/c
	cqiBTrvtw9sTO0i7jUvOYYU6+FGCUwyRtwqouePEYEx2fgoSdqxgfKbqa7eeXIju8xfTO16ll7J
	2hBnYALa+TBprFmgdTV0bXdCf5pDTVFIJ4ESUOfGznG3yoc5CdLRzyWWhyoMG3pglqrIdKuRZ8j
	fheOzDee4Tphm1ucGh+6L7Ykcfd0ZG+xiPzWbbfY=
X-Received: by 2002:a05:600c:a368:b0:43c:f969:13c0 with SMTP id 5b1f17b1804b1-441bbf37f2bmr27033295e9.29.1746199909397;
        Fri, 02 May 2025 08:31:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEvYzEZlLwr2sfu3x5hwxFQiu1NtDm78iDWETxYBo0k9U7Y9unR1MHkU940jUVDxeM2iTskQ==
X-Received: by 2002:a05:600c:a368:b0:43c:f969:13c0 with SMTP id 5b1f17b1804b1-441bbf37f2bmr27032725e9.29.1746199908975;
        Fri, 02 May 2025 08:31:48 -0700 (PDT)
Received: from ?IPV6:2003:cb:c713:d600:afc5:4312:176f:3fb0? (p200300cbc713d600afc54312176f3fb0.dip0.t-ipconnect.de. [2003:cb:c713:d600:afc5:4312:176f:3fb0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2aecc20sm93468795e9.13.2025.05.02.08.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 08:31:47 -0700 (PDT)
Message-ID: <a34c844d-b44f-411c-b5d7-8e38a50b0b05@redhat.com>
Date: Fri, 2 May 2025 17:31:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Re: [PATCH v3 3/6] mm: shmem: add large folio
 support for tmpfs
To: Daniel Gomez <da.gomez@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 akpm@linux-foundation.org, hughd@google.com, willy@infradead.org,
 wangkefeng.wang@huawei.com, 21cnbao@gmail.com, ryan.roberts@arm.com,
 ioworker0@gmail.com, da.gomez@samsung.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, Eero Tamminen <eero.t.tamminen@intel.com>
References: <cover.1732779148.git.baolin.wang@linux.alibaba.com>
 <035bf55fbdebeff65f5cb2cdb9907b7d632c3228.1732779148.git.baolin.wang@linux.alibaba.com>
 <aBEP-6iFhIC87zmb@intel.com>
 <ac8cbd8d-44e9-4a88-b88b-e29e9f30a2fd@linux.alibaba.com>
 <aBIHYqzar5J8uxGO@intel.com>
 <cxwpgygobg6wleoeezbowjhmid4mdhptzheqask44ew37h2q24@kryzkecuobbp>
 <57dc4929-268b-4f3f-a0f8-43d6ec85974f@linux.alibaba.com>
 <72978e3a-ee67-47d4-b06d-e911bc5d57ff@redhat.com>
 <exl3dpqh7oqhdd3afo3gvainumqw6j4ebfifkyeqkqvf36yxlh@pcuhdqanuy32>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <exl3dpqh7oqhdd3afo3gvainumqw6j4ebfifkyeqkqvf36yxlh@pcuhdqanuy32>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02.05.25 15:10, Daniel Gomez wrote:
> On Fri, May 02, 2025 at 09:18:41AM +0100, David Hildenbrand wrote:
>> On 02.05.25 03:02, Baolin Wang wrote:
>>>
>>>
>>> On 2025/4/30 21:24, Daniel Gomez wrote:
>>>> On Wed, Apr 30, 2025 at 02:20:02PM +0100, Ville Syrjälä wrote:
>>>>> On Wed, Apr 30, 2025 at 02:32:39PM +0800, Baolin Wang wrote:
>>>>>> On 2025/4/30 01:44, Ville Syrjälä wrote:
>>>>>>> On Thu, Nov 28, 2024 at 03:40:41PM +0800, Baolin Wang wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> This causes a huge regression in Intel iGPU texturing performance.
>>>>>>
>>>>>> Unfortunately, I don't have such platform to test it.
>>>>>>
>>>>>>>
>>>>>>> I haven't had time to look at this in detail, but presumably the
>>>>>>> problem is that we're no longer getting huge pages from our
>>>>>>> private tmpfs mount (done in i915_gemfs_init()).
>>>>>>
>>>>>> IIUC, the i915 driver still limits the maximum write size to PAGE_SIZE
>>>>>> in the shmem_pwrite(),
>>>>>
>>>>> pwrite is just one random way to write to objects, and probably
>>>>> not something that's even used by current Mesa.
>>>>>
>>>>>> which prevents tmpfs from allocating large
>>>>>> folios. As mentioned in the comments below, tmpfs like other file
>>>>>> systems that support large folios, will allow getting a highest order
>>>>>> hint based on the size of the write and fallocate paths, and then will
>>>>>> attempt each allowable huge order.
>>>>>>
>>>>>> Therefore, I think the shmem_pwrite() function should be changed to
>>>>>> remove the limitation that the write size cannot exceed PAGE_SIZE.
>>>>
>>>> To enable mTHP on tmpfs, the necessary knobs must first be enabled in sysfs
>>>> as they are not enabled by default IIRC (only THP, PMD level). Ville, I
>>>> see i915_gemfs the huge=within_size mount option is passed. Can you confirm
>>>> if /sys/kernel/mm/transparent_hugepage/hugepages-*/enabled are also marked as
>>>> 'always' when the regression is found?
>>>
>>> The tmpfs mount will not be controlled by
>>> '/sys/kernel/mm/transparent_hugepage/hugepages-*Kb/enabled' (except for
>>> the debugging options 'deny' and 'force').
>>
>> Right, IIRC as requested by Willy, it should behave like other FSes where
>> there is no control over the folio size to be used.
> 
> Thanks for reminding me. I forgot we finally changed it.
> 
> Could the performance drop be due to the driver no longer using PMD-level pages?

I suspect that the faulting logic will now go to a smaller order first, 
indeed.

... trying to digest shmem_allowable_huge_orders() and 
shmem_huge_global_enabled(), having a hard time trying to isolate the 
tmpfs case: especially, if we run here into the vma vs. !vma case.

Without a VMA, I think we should have "mpfs will allow getting a highest 
order hint based on and fallocate paths, then will try each allowable 
order".

With a VMA (no access hint), "we still use PMD-sized order to locate 
huge pages due to lack of a write size hint."

So if we get a fallocate()/write() that is, say, 1 MiB, we'd now 
allocate an 1 MiB folio instead of a 2 MiB one.

-- 
Cheers,

David / dhildenb

