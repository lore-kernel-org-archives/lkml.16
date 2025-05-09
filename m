Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA7A278E60
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746782174; cv=none; b=nir+j7BtFSJL7/gl8UraRsABE58haWXxNUuEUIFBDJNqvqbGSoil0AHzy60skej7IpwKFmXpV2QoSCAHipj/jmsApP/gbi1mO4JV7pZEX+/PrgRMmbSgxAOaiel+Ci/QaLVYSIZAgqI3NJM60X0kt4yPZ6yUZ5MEa0mFXtbV8OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746782174; c=relaxed/simple;
	bh=DzdR3yho6JGbbQZjnApVUh5/NNgpyD1bEhSi135GoyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j5q4HQCSKFtzB9bNgUb20EzHPEvDUGBlsuciXuygz4TtTRljD2vqwiOAMQogm0LCztBkUC+B3Pph9SQrU2rytzJmIQWuVKZH5njY7tLm/Q9dRqS+c08+xnmvRQYl9T2O0pM2akZ24tDQAZn1nOl5DYpjk7kjZQdbuNbnJxwHLmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PqkwGTdh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PqkwGTdh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746782171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=O50KC8poIn0AkdXO4SOPXeacSJBmsTouUfEw4SHP0HE=;
	b=PqkwGTdh9iCsKYI05UoFzT4eft3OGFy+J/jhMTGqtURNquJX5Pk10w3haJfOuLEHnejKS+
	G9GVnAvoBZvSwmFDR+6vaCXFWK7Ngrj21eBExolFiPr1XEMQuP3aU32aBYm4SVZs18ssNh
	zeXhzSpJmBMZmlIl7KUjbiKXyzz2qhg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-Ge37d9JdOM-DoA9oKkBhZA-1; Fri, 09 May 2025 05:16:10 -0400
X-MC-Unique: Ge37d9JdOM-DoA9oKkBhZA-1
X-Mimecast-MFC-AGG-ID: Ge37d9JdOM-DoA9oKkBhZA_1746782169
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a1f6c5f54cso237089f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 02:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746782169; x=1747386969;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O50KC8poIn0AkdXO4SOPXeacSJBmsTouUfEw4SHP0HE=;
        b=guN+ntSH92gHE6ygYRDoO5N4Z452LyTo9tSBTRjF9k/y65NqJq0g+xVPbSHZeVaw/Z
         eCSOSwoINsPsm0l8PQWgaWEyhQ6VGKqY6BjdLY2bokuEGlb2o7xLQiHvq24KV3d2ATG1
         D3KffpCBkyzlsOWlgampcRl+74qbIzvUNdc0Pyq8gw9J9vCA7jjQ4FD8d8CzR6Gx1HuZ
         2p899k0qwx425jEOQCdOgUuSoYDLlzO2wRqitw2Taq2eWHF+ZhPt9YqKgMyueKewAIHe
         t/H4c3DODu5xQkNluOmyJ7Xzb1yQ6D7rQcS33xtCWojBWYnVK2ZfJwP4qSj2894wgrBS
         moww==
X-Forwarded-Encrypted: i=1; AJvYcCUEtrr2EVHidmrTDtzLejsn/ebitJuvh0ln2jtLM7qgrecNHpMfnIdnHQEF4XE+9aLFG5os21Im9DJWTv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YydCMYUGtOaNkJJlbaheDWYg0KgA3dSqUGMDGbP7+RmkT5iS+5o
	Leli+W0aZTGrZIYoWzh+PsUH7W0ZB5wm9kAj3oWyuHoFrqqId0WF37CL9sJ7a3HEHktCLpWLISm
	lNIjSJzTkAdxxMtMyYA4YDXjrm9mn+T0zXj/dZ80cI4oeCht8EuKEGAaqhj3qKg==
X-Gm-Gg: ASbGncsnspiMmPzJfresanC60HhkVzMjPmDW0Z5EfJCvxl9zWxSSsIkIbPBv1UNN4Uw
	omZ+PG9s3JFmJh/DY0j/wPM/ASqtiBzJ+h9jiHyxDhI81XEfMWgPzNognxlPNSjJV1Isdg3ihw9
	T/egP/YJ6sBElTgXw0Ou/aCXilRhtMXpK1GGlAkJcFUaM3lD+ggzdSzSnlymUVCbhdzN589xcm0
	m1Z2gosBf3PSPQKUDEK6AIBigJ4O64aZqDEf6A/ToWCTXVPs6zP+Wben3Yb97RU0xJTHquKaE44
	AgiZ2At7nmpl07TunVyEUoSA95g56cgPK7/gj6Oh5S4snNyefnKMfURGjXND63AgZiTrnOT/WdA
	6Fcp9UdDB/orvGwk8cqExkj/BEJprO2qAZ0hTnuY=
X-Received: by 2002:a5d:59ac:0:b0:397:5de8:6937 with SMTP id ffacd0b85a97d-3a1f64a4b57mr2149455f8f.41.1746782169283;
        Fri, 09 May 2025 02:16:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpI1ETBmNUmD+2lZouKEgBiUCjLKGmWUAe31bT4cFadKl7DqoBsUiIB1JaibPip6PYQmoKmQ==
X-Received: by 2002:a5d:59ac:0:b0:397:5de8:6937 with SMTP id ffacd0b85a97d-3a1f64a4b57mr2149430f8f.41.1746782168899;
        Fri, 09 May 2025 02:16:08 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f45:5500:8267:647f:4209:dedd? (p200300d82f4555008267647f4209dedd.dip0.t-ipconnect.de. [2003:d8:2f45:5500:8267:647f:4209:dedd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5b9sm2644007f8f.91.2025.05.09.02.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 02:16:08 -0700 (PDT)
Message-ID: <900a8898-0666-4639-9a0a-7e602eed275f@redhat.com>
Date: Fri, 9 May 2025 11:16:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mm: Add generic helper to hint a large folio
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, peterx@redhat.com, ryan.roberts@arm.com,
 mingo@kernel.org, libang.li@antgroup.com, maobibo@loongson.cn,
 zhengqi.arch@bytedance.com, baohua@kernel.org, anshuman.khandual@arm.com,
 willy@infradead.org, ioworker0@gmail.com, yang@os.amperecomputing.com
References: <20250506050056.59250-1-dev.jain@arm.com>
 <20250506050056.59250-3-dev.jain@arm.com>
 <887fb371-409e-4dad-b4ff-38b85bfddf95@redhat.com>
 <b104b843-f12a-4382-a05f-53e2e35bdcb0@arm.com>
 <0979ce4e-d316-477c-872e-d3f9e47690e5@redhat.com>
 <b4e092c4-8388-471f-948d-f0b5828efed3@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <b4e092c4-8388-471f-948d-f0b5828efed3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.05.25 07:25, Dev Jain wrote:
> 
> 
> On 08/05/25 4:25 pm, David Hildenbrand wrote:
>>
>>>> (2) Do we really need "must be part of the same folio", or could be just
>>>> batch over present
>>>> ptes that map consecutive PFNs? In that case, a helper that avoids
>>>> folio_pte_batch() completely
>>>> might be better.
>>>>
>>> I am not sure I get you here. folio_pte_batch() seems to be the simplest
>>> thing we can do as being done around in the code elsewhere, I am not
>>> aware of any alternate.
>>
>> If we don't need the folio, then we can have a batching function that
>> doesn't require the folio.
>>
>> Likely, we could even factor that (non-folio batching) out from
>> folio_pte_batch().
>> The recent fix [1] might make that easier. See below.
>>
>>
>> So my question is: is something relying on all of these PTEs to point at
>> the same folio?
> 
> Hmm...get_and_clear_full_ptes, as you say in another mail, will require
> that...
> 
>>
>> [1] https://lkml.kernel.org/r/20250502215019.822-2-arkamar@atlas.cz
>>
>>
>> Something like this: (would need kerneldoc, probably remove "addr"
>> parameter from folio_pte_batch(),
>> and look into other related cleanups as discussed with Andrew)
> 
> I like this refactoring! Can you tell the commit hash on which you make
> the patch, I cannot apply it.

Oh, it was just on top of my private version of [1]. It should now be in 
mm-new (or mm-unstable, did not check).

But as raised in my other mail, get_and_clear_full_ptes() might be 
problematic across folios.


-- 
Cheers,

David / dhildenb

