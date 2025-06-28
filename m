Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C051854
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 21:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751144447; cv=none; b=f0ckDjCDiIZ/+T57I1cAA5dYBm1bS9BwAiKgCNK9n+fOjarUc6cZfN2d/7LFZqYe29CQAI08Ykglpeyg33iacRx4zLU0Or186EylNwHNO77wUg5Wocrz0c5hN91QL9ivMbXvCs1r4BkhaWvb8E2DA7pb80qve/hmR9mLyrLRRU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751144447; c=relaxed/simple;
	bh=+KyNc9FYlS3JaW6WegESXDKYevuq1nQUqkblRd8HTMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KRkV0gTtHbtwGdPPNk1RYRw2vyKxA0MTCh/kFoRE6VZoeVvGCr7oxleAaT9UwtIU9S03aBjb2wEgGeJMTGLHtU/mxN5Qakk9Sj77Cz4CheBwlar5MsrgHr0AT8W72+pDualgRZ2OHnXf4dGvBEJPo/wzaL4X1j6hSHoCDVT6h/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ISYTr3O8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ISYTr3O8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751144444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Ckem1hed7Ei40PzTnHVkobiN0kGLw+sDbbq6rKfLtTo=;
	b=ISYTr3O861baz/kdHcYnGid393R1yfx7HXyfI+6lrFYnHb9qjubTQ5xMWSCdzT5+1EJ0kn
	GbK/7zH34rHBmrQE+/ZMGLKXVmU5Nixhoub2sCAeFHlcIFUDyLShSFiccqRbmjWpEY0xQZ
	ikcieuEuSm0mzeShvll3qW5TZOVsZHo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-s4kUnnK-OVqd1XgQa7bgyg-1; Sat, 28 Jun 2025 17:00:42 -0400
X-MC-Unique: s4kUnnK-OVqd1XgQa7bgyg-1
X-Mimecast-MFC-AGG-ID: s4kUnnK-OVqd1XgQa7bgyg_1751144441
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450db029f2aso13356185e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 14:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751144441; x=1751749241;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ckem1hed7Ei40PzTnHVkobiN0kGLw+sDbbq6rKfLtTo=;
        b=lipY7U6nBwdvuU/aRgYYEiyDfYAN74x2VyvKgGDQWcdEBtaBd5+6DhmdBxOmFgwk8g
         bcrJU8xbliwQKqk9yO5vn7Es33AukgTgW01PZf9iG4Bk79SoEyAO+lS1EQVLOojtN2dL
         HlwGsNsiqroGjdg2W9Y83z7Oe7bv9fEiEO4BwCi7ZPkcXe+lx4G5IxsDLK3asOarHgwn
         0CUnnc46iNhvsJTAFjDoSUHBdV5WwlX0edKMXWadweXM/AuDj9wA+u61iTcM8pV0jbga
         5r4w0xV7Hlohs3HBkkRmwPQawsERcQCkVxXnA9af8frrrS/8LQEacSkzVx/D3BEbi8c7
         2rpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG0H/TVbVHZH9vrZaX8s+H9Fv81ujdW23k0jfjSflmqozTTqwRU6cwydcUPzG0IcZY+2oeS5ZqCgX+WEY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+A2t+AWzWfM7mOkjBUGYJ2sPOp2C8w+Myq2O/a1m2MOIp06GX
	dQAfah2abLcsPs8jsqA8V7jBewDPOGscaJyZlaRtBVVVf8QvQ4VE2Rgfblk+ZxxGGTsMu+/I4LU
	JQaalh8J8nNoHCWj+RZmJPj3R2m/ZPtrUSD/ld1XKx+n9jthR1iLkj70ERFo1iNHHwA==
X-Gm-Gg: ASbGncsAC0g9N4U5u3jj+z3ueOrx3ki6H+Mu3Vs5iRmpQnBc0ybLFk0ZVvtC3ksL1vE
	LKZgkTUdQ+aqe4ePQZt4QzhBN5hXQifnKF8ssAs8VBNs9aHSgjGykr94ZNkKCjXqbFxU8J2uxtI
	4N6ectBJeOsl+5VHpbnXNzI+BDCGK3sGQ0nXAQd6F0NqcaG6bAOD6+TcTTCKyBHi9oqj+Jbxst7
	O9J4st5h/wYS5y5gjVao40fqVBgvz9ttuBNqaLpZSXuNMAJIEhcozdsF7phSYiDdo6gouzLbBl1
	svyUUFNMsR70T/gmj+GYPZO7WngVRoMpTQLccQXz6gltaoFnuYesw+SGkKhlA2ZuWNIz8xKeVaL
	Ufr0bWJ5iCdKyVqNB9J8Kbzr1Me1fZlDI8Ww5MpCLCBzlh4fjHw==
X-Received: by 2002:a05:600c:828f:b0:450:d00d:588b with SMTP id 5b1f17b1804b1-45392bc88damr66019825e9.9.1751144441283;
        Sat, 28 Jun 2025 14:00:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLMbvJy6XyhU9tTXu1AwvehwpfT4iCfPG9qMCsYYjS81F3a03uchNNQzop0l0AtEbcByTdIA==
X-Received: by 2002:a05:600c:828f:b0:450:d00d:588b with SMTP id 5b1f17b1804b1-45392bc88damr66019425e9.9.1751144440253;
        Sat, 28 Jun 2025 14:00:40 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2e:bb00:d726:3c13:7fcd:5990? (p200300d82f2ebb00d7263c137fcd5990.dip0.t-ipconnect.de. [2003:d8:2f2e:bb00:d726:3c13:7fcd:5990])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823b6d50sm120167105e9.30.2025.06.28.14.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 14:00:38 -0700 (PDT)
Message-ID: <cc846c55-0505-4ad6-9664-ac799d9c0226@redhat.com>
Date: Sat, 28 Jun 2025 23:00:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] mm: convert FPB_IGNORE_* into FPB_HONOR_*
To: Dev Jain <dev.jain@arm.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
 Ryan Roberts <ryan.roberts@arm.com>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-2-david@redhat.com>
 <5c3428c6-25be-4a94-811a-6bb6718f6c58@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <5c3428c6-25be-4a94-811a-6bb6718f6c58@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.06.25 05:37, Dev Jain wrote:
> 
> On 27/06/25 5:25 pm, David Hildenbrand wrote:
>> Honoring these PTE bits is the exception, so let's invert the meaning.
>>
>> With this change, most callers don't have to pass any flags.
>>
>> No functional change intended.
> 
> FWIW I had proposed this kind of change earlier to Ryan (CCed) and
> he pointed out: "Doesn't that argument apply in reverse if you want
> to ignore something new in future?
> 
> By default we are comparing all the bits in the pte when determining the batch.
> The flags request to ignore certain bits.

That statement is not true: as default we ignore the write and young 
bit. And we don't have flags for that ;)

Now we also ignore the dirty and soft-dity bit as default, unless told 
not to do that by one very specific caller.

> If we want to ignore extra bits in
> future, we add new flags and the existing callers don't need to be updated.

What stops you from using FPB_IGNORE_* for something else in the future?

As a side note, there are not that many relevant PTE bits to worry about 
in the near future ;)

I mean, uffd-wp, sure, ... and before we add a FPB_HONOR_UFFD_WP to all 
users to be safe (and changing the default to ignore), you could add a 
FPB_IGNORE_UFFD_WP first, to then check who really can tolerate just 
ignoring it (most of them, I assume).

-- 
Cheers,

David / dhildenb

