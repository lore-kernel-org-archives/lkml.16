Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A049A1E5219
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 07:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749021941; cv=none; b=kgTM4S3rDKnnHjrMuNUEr+niG0e0awzmPKMn/STI6wMur/A2kT9lz9Ewhen+DJdAX1WEfB/nELuoEJNkDR016ppgZG9eqJm152/tGmBZDg8WH04mVt0oMw6KvU5plZFk9/Qy6U0GtI7jiTWN9R5AhIpgyJ+rVApyqL7EV3ulGy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749021941; c=relaxed/simple;
	bh=1t7qv+A6Nz7eR1m21oOGQ5Dl0LE/sq7hDSCBZWr7i4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=r+Pk+zFBbnzgW7CKMdLgsLml0nB+nJ272MkrO6eFL4xvbrjJaMRzcMKhKbVCUdXfY5hk2uHJMYfMT/x5gfZ9wEC270fBns0MLN7gVSmnTWXOw4vJ4VQGW1yutb5BvuW4MvxR2zRFHEv76HJWG4/TX154lE13qK7KXqd0qcSiP2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOoHc9Ex; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOoHc9Ex"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-ad891bb0957so1143589066b.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 00:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749021938; x=1749626738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NTJBF0zlkgV8NEXSrbX9kCVJQCiDuy34QKFs0Z6aUcI=;
        b=TOoHc9Ex8fyUBf0lFt+zZfdFQtunYveaovDd1YjlmH2Bje1sW10+QQkMHTs2QVauyc
         5facKSht+gIr7uShlGJkulMIoJiFWntuSq8LoKMOQvtcbuVqalRwayW0eZR805V5swhJ
         D2WLOG+dHfW+0G9Lu5Xmxdx8jg/6z6ejoFef8uA4G24oVT3ZSnQ7JlxQbe2siB1VTdsX
         +//v7bakKA99oAT7T+xWgrO/A7haJEqL0+uKs6JJg6LNIymijtCs+/RXIQKoeY+K99NG
         vQ84o2BJzyezExe4fonMSqMpsDf0fSjOgX6UeKErcU2YiH25Z0FEes8pcX4cLUOyidE/
         Nhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749021938; x=1749626738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NTJBF0zlkgV8NEXSrbX9kCVJQCiDuy34QKFs0Z6aUcI=;
        b=m7UxjMagV4O+i4kH5/0I1QkLMJyG7FAL210ytX6BunS6ZAO06+u2YGlAed4LZtApDn
         58G8ttXsOeNFdC/5zM7DALx7RJZsKSOlZsORSuaNZnBmzvhPJRbG3wx8aIoUZqniKYQQ
         Eo/RW/tGUd/cBGceQJywYI/Rg/2e1EboeOJyik6Qn9qAuv43icc5WIugIGZ9+ebho1M2
         7zp0oMmXlj9r63uH4uAUgAVzacNLz01qybI9iNvN42/5VYzxOfr+A0iHrbHKdfUmFqqu
         2Dz9f+cMBzwnMBnAwxYFuDuvMlYapKvJFURCw6vxTv8XK2yha8nfnCcs7i4bCmpVjXUR
         svYw==
X-Forwarded-Encrypted: i=1; AJvYcCUIDUfqmqlYf0VQu4wX1ePEiOyW3Exj2YATJP2HL8w8y1PyM/jaeBw2Ei+A/qw8FEqe7uYT48roG0JyR2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm4qxW7v/nq1xomQwc7h97R3xieopPfaBrn1LfFsUuIuo3PeVX
	uVHt6vvrU+rdmdnvefdwTJ2s7USNg9dO9yqKGc8oS8LTWCPbrny7Nlmz8MMA2YYr
X-Gm-Gg: ASbGncs/sx2EhegaSQA795hqbb1GNxeu+Zk4alsLy21kSMXOm3xiWNeOtypq3Pm/Efm
	cxuPRZH4NOW+GZdUKO+v9Khwi+MmylcVzIILiv6/3hfzY70BFbBGkNl6beOpB3Sg35VM52RbFdg
	bGnqVsIYpHYTsW7EfXJbmlbdwYo7dwmVOTWc6N6zZGqtBZ2tzBKphKiNOiXkvL6Xc2vSZFS0n7x
	Y8vD8HCFAGqtaJAC8N/XUqW9SDCqqpUmrFAkBTlYDu6X3seDqNoVUElgIhq2SjG5MKFtD56eH04
	v++YdR83yRYArreb0BDMCoDhCe87o6CqX7iLafaiG38+lEOd8yQh8JCNJbvU7bQu6bjbA1P5X5e
	24aw+uWGjaARxiMYs8xwGbF5ZbGa9DOMco6/PvyCf5txSX4hrg6oQ7Pg=
X-Google-Smtp-Source: AGHT+IG4Kf5PhViqrLF+eMTC6S3fFHKzxFILRhsMk0cH0xe64tF6PCWmM4fnkEoQaNioUD5GKNphdw==
X-Received: by 2002:a17:907:7248:b0:ad5:27b6:7fd1 with SMTP id a640c23a62f3a-addf8cf6f62mr159077866b.17.1749021937474;
        Wed, 04 Jun 2025 00:25:37 -0700 (PDT)
Received: from [26.26.26.1] (97.81.207.35.bc.googleusercontent.com. [35.207.81.97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad39ef6sm1054395466b.154.2025.06.04.00.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 00:25:36 -0700 (PDT)
Message-ID: <5fed2452-ae2a-4fca-8483-85ecf645ec1b@gmail.com>
Date: Wed, 4 Jun 2025 15:25:42 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] iommu/vt-d: Remove the redundant logic in
 first_level_by_default()
To: "Tian, Kevin" <kevin.tian@intel.com>,
 Ethan Zhao <haifeng.zhao@linux.intel.com>, "Wang, Wei W"
 <wei.w.wang@intel.com>, "baolu.lu@linux.intel.com"
 <baolu.lu@linux.intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "jroedel@suse.de" <jroedel@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>
References: <20250523081056.223082-1-wei.w.wang@intel.com>
 <01e5d0a9-715a-48d4-a2a4-2a0b5d99149b@linux.intel.com>
 <BN9PR11MB5276CFBD4CF795CCB3ADCD1B8C66A@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Language: en-US
From: Ethan Zhao <etzhao1900@gmail.com>
In-Reply-To: <BN9PR11MB5276CFBD4CF795CCB3ADCD1B8C66A@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/29/2025 2:11 PM, Tian, Kevin wrote:
>> From: Ethan Zhao <haifeng.zhao@linux.intel.com>
>> Sent: Thursday, May 29, 2025 1:48 PM
>>
>> 在 2025/5/23 16:10, Wei Wang 写道:
>>> This original implementation included redundant logic to determine
>> whether
>>> first-stage translation should be used by default. Simplify it and
>>> preserve the original behavior:
>>> - Returns false in legacy mode (no scalable mode support).
>>> - Defaults to first-level translation when both FLTS and SLTS are
>>>     supported.
>>>
>>> Signed-off-by: Wei Wang <wei.w.wang@intel.com>
>>> ---
>>>    drivers/iommu/intel/iommu.c | 10 +---------
>>>    1 file changed, 1 insertion(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
>>> index cb0b993bebb4..228da47ab7cd 100644
>>> --- a/drivers/iommu/intel/iommu.c
>>> +++ b/drivers/iommu/intel/iommu.c
>>> @@ -1366,15 +1366,7 @@ static void free_dmar_iommu(struct
>> intel_iommu *iommu)
>>>     */
>>>    static bool first_level_by_default(struct intel_iommu *iommu)
>>>    {
>>> -	/* Only SL is available in legacy mode */
>>> -	if (!sm_supported(iommu))
>>> -		return false;
>>> -
>>> -	/* Only level (either FL or SL) is available, just use it */
>>> -	if (ecap_flts(iommu->ecap) ^ ecap_slts(iommu->ecap))
>>> -		return ecap_flts(iommu->ecap);
>>> -
>>> -	return true;
>>
>> The function works like a digital circurt has 3 single bit inputs  sm,
>> flts, slts and one bit output ret.
>>
>> so the true value table of the orignal function looks like
>>
>>      sm   flts   slts    ret
>> a   0     x     x      false
>> b   1     1     0      true
>> c   1     0     1      false
>> d   1     1     1      true
>> e   1     0     0      true
> 
> 'e' is actually wrong. We should not return true when the 1st level
> cap doesn't exist.

If so, this patch should mention it fixes such case with fix tag, not
  "removing the redundant logic with the same behavior".


Thanks,
Ethan
> 
>>
>>> +	return sm_supported(iommu) && ecap_flts(iommu->ecap);
>>
>> And the true value table of this new one looks like
>>
>>      sm  flts slts    ret
>>
>> f   1     1     x      true
>> g   1     0     x      false
>>
>> h   0     1     x      false
>> i    0     0     x      false
> 
> so this table is correct.

