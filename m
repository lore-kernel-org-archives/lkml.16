Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0079B323D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 18:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749235003; cv=none; b=b1vf+BwS0thhrjbARJtSYEqYg/vhTmLvSh32h7xl3Rtt2GfrnW2Hrn+ypjeCEkHmBsT5R/ZJ5VC8mfPgMsnPZZr6xGsu5926YFz+YHFLwEubMN357qSwVIoxGx2kvUzG/3KxV4OnriaXK/tPDU+Ml0wGhGjzymB3bJf5JeEMoME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749235003; c=relaxed/simple;
	bh=KKvNnc6+ahTFeNIbwyjYowPgxH07+lHND4LVA1Z+Bww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dmAbEroRkxFg1+c6ItB5/ZgsCizn8ypJe87TtrEZlMt3oxLDofo0HnXih4jSYGe0mLScev9ymasYRPuH8G1561OzFKF0lbNjgj/jdASR1zGTzep+H0cPowQXnX0hMRWeyUOfDhH1DQTCYPywS/e3BLVfzqbsXxyoE2x4+wvN0GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CiUZ/TJo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CiUZ/TJo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749235001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ETXo+kNhv5Vh+fUDoc90IncohVidEafEgeEXooy5dQo=;
	b=CiUZ/TJo/gMewpBFo/VXohxBFjrOPLUdVrbvr+LnUl142znJ4Lng0jKs+qQ8w8M2Rd7IJ+
	amwqGTnjBrsFcewCzsOuFiaHdTYJBL23xTawHmQfu7CqnqlU0oe+uvjrm892PVVcyz/MDB
	jki3GyxFidgJgR4ehEnU79OO+G3JWlA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-PSOc8R_2O46ZmrL_1m5l3A-1; Fri, 06 Jun 2025 14:36:39 -0400
X-MC-Unique: PSOc8R_2O46ZmrL_1m5l3A-1
X-Mimecast-MFC-AGG-ID: PSOc8R_2O46ZmrL_1m5l3A_1749234998
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451ecc3be97so9602015e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 11:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749234998; x=1749839798;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ETXo+kNhv5Vh+fUDoc90IncohVidEafEgeEXooy5dQo=;
        b=KPd3JqRhWaCydUXa0CZCrVYCL1YvE1wCzGcVIwWbBnp4+l+v77y8aN9Uax2HlqbOT3
         TJ65I7JI9Y0NIgR0DEzpFzndj+MnTwof8f1ug2j82B2vIgQ/MaAnZ8tLhzoMSOV89LJJ
         JUIryPn5h3F9D8wImgb5w/KMO4OtDAUlojGs7FRhLb6W9HMKT9pEjaGAtK57Iq7tWOQG
         WFJRcC6N4UOD7VlbimZIvwnpQOglVUUIi3Ua0TpKi1pnPNqyj82LH7J9HKTyuXrogKca
         a4kRPUwjBU/TJNwdKV7YEb+m8Wz7SyyQgE4Pj9OoBAm1RCwZSeANyYa9yMubI5hFqO5H
         1zKw==
X-Forwarded-Encrypted: i=1; AJvYcCU7ARP4adJ89t16da5bsDmfF8ALTpesZwFQUDix7Af5SEQmmve1u7c/JLkvqdlIk7RQ9S44OOgsdcbWlyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZoc95qGPg4rx1nfcpeXgjL5rCWTycc/6e2MTYZl5dJtvSjmMM
	fN9ijaIuiKuOMwMKA8YusptpgpJZsjwgsLjL/XlSZ2F68J10KHw5MmpsM+KHkPvbjFganr/WtZ7
	pumQM601x/JXJLiQtowPCP+Sc2DW7zpE2Rh21qEbDYPja5zg/edXevJI9IE6tBJZ5vw==
X-Gm-Gg: ASbGncsMtO30xKXXiBcwDTKCDDlXH5FcuOOYoV7latCq2oYvaXambnmocoGHFw4KsIa
	hGEQc9GjZpn4nifAWOT7vT3DtsxfAYL2zPVfCrL7YURqA2fkLDRG8watVlfkPDHGfETBp6Oesx1
	YjmE5LNWiUBaeagD2qFMB7p9zbkSW4dYmyWf1ydboYgW+PDZ2g0hgXfJhPTOH6nJrVxSDZlqRw8
	R2Pqz3B6Z469DOLgiHyJkvGWwqxLRWQwmQQj7pE+pZu9cOv2FYphygqPkq5oG+0jr8MTs0gxf75
	akCDHtfqQF2ZyHsFXqUAANBSrXZm0PxuAZn7iQOV0+M1MGBLCZi/lnwOuWWZEYqjseZ2gitBVYy
	vMf7+zMrPSXYunGfie+gr4Sm0S+801gc=
X-Received: by 2002:a05:600c:3e84:b0:450:d00d:cc with SMTP id 5b1f17b1804b1-45201417068mr48055745e9.2.1749234998484;
        Fri, 06 Jun 2025 11:36:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4Ona8cC63T7ugk0ilSFASiLSAqyndxjm/MnJNHcFCOx0BTqY9MXZDy3OKqQOcNsnCIUG9QQ==
X-Received: by 2002:a05:600c:3e84:b0:450:d00d:cc with SMTP id 5b1f17b1804b1-45201417068mr48055465e9.2.1749234998104;
        Fri, 06 Jun 2025 11:36:38 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:9c00:568:7df7:e1:293d? (p200300d82f199c0005687df700e1293d.dip0.t-ipconnect.de. [2003:d8:2f19:9c00:568:7df7:e1:293d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f8ef98b1sm48644065e9.1.2025.06.06.11.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 11:36:36 -0700 (PDT)
Message-ID: <e0f17454-241c-4a88-be32-ea34d3769930@redhat.com>
Date: Fri, 6 Jun 2025 20:36:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
To: John Hubbard <jhubbard@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Peter Xu <peterx@redhat.com>
References: <20250604140544.688711-1-david@redhat.com>
 <aEFC_12om2UHFGbu@tiehlicka>
 <1a65d0e6-6088-4a15-9c19-537203fe655c@redhat.com>
 <aEKnSxHG8_BGj7zQ@tiehlicka>
 <e680a8f3-7b45-4836-8da7-7e7a0d2fcd56@redhat.com>
 <aEK_R93gihEn-xW6@tiehlicka>
 <50ff9149-2824-4e57-8d74-d8d0c063c87e@lucifer.local>
 <e5fa4a36-2af8-48e9-811e-680881c06b86@redhat.com>
 <1a7513cf-4a0a-4e58-b20d-31c1370b760f@lucifer.local>
 <e898e52e-a223-4567-9514-b4a021b5d460@nvidia.com>
 <72bb36f2-65b6-4785-af9d-5b1f8126fc78@lucifer.local>
 <2f866f12-2aa0-4456-b215-08ddc9b13b1e@redhat.com>
 <3dfbbd63-697d-42aa-8906-539d74df9123@nvidia.com>
 <44af8f5a-2d94-498b-a3e0-31f5dde74538@redhat.com>
 <5d0d0542-5994-49e1-820a-02fd7e7551c5@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <5d0d0542-5994-49e1-820a-02fd7e7551c5@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.06.25 20:31, John Hubbard wrote:
> ...
>>>>> David, what do you think?
>>>>
>>>> Well, in this patch here I deliberately want _ONCE for the unpin sanity
>>>> checks. Because if they start happening (IOW, now after 5 years observed
>>>> for the first time?) I *absolutely don't* want to get flooded and
>>>> *really* figure out what is going on by seeing what else failed.
>>>>
>>>> And crashing on VM_BUG_ON() and not observing anything else was also not
>>>> particularly helpful :)
>>>>
>>>> Because ... they shouldn't be happening ...
>>>>
>>>> (well, it goes back to my initial point about requiring individual
>>>> decisions etc ...)
>>>>
>>>> Not sure what's best now in the general case, in the end I don't care
>>>> that much.
>>>>
>>>> Roll a dice? ;)
>>>
>>> One last data point: I've often logged onto systems that were running
>>> long enough that the dmesg had long since rolled over. And this makes
>>> the WARN_ON_ONCE() items disappear.
>>
>> I think what would be *really* helpful would be quick access to the very
>> first warning that triggered. At least that's what I usually dig for ... :)
>>
> 
> These two use cases cannot be simultaneously solved, at least not
> perfectly.

I guess we'd have to store the first WARN data separately away, just 
like when tainting the kernel or so. Not sure.

Fortunately, since a VM_BUG_ON() case cannot ever happen,

I mean, also WARN and friends are for things that should never happen ... :)

-- 
Cheers,

David / dhildenb

