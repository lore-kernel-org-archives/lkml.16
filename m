Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40592744D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 12:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748952925; cv=none; b=bSeANQRDN9E9PS9GDzOUj+XEPjM1vUu7M1erDRvtnQv2Okitp7F3eapiFmIN+SfRnn61TujJhaDP/cp+MIV0a2frhtKIwfTkGMnvP1T431DLP04njkfLJOZk5z62ExrX2gzVzR8fSho4h06OaLh+e/AFfhoJTpDCf9X8+or1rAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748952925; c=relaxed/simple;
	bh=Gx9zGZsE5PgxVIjkvOukU6sQCQHBbVJg4M/tkfsRGUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dCYv8f676wc0A9/ggUqQ7R4mmefzOHXaAYNoLxfZcW4hLVti3R5nEPSDA8BEz2IdPM7T4DUDw0209bFIHIj/Ic3ZkDKrzKJ1nDiYJCjvDqlWggtK9BuX/IB/ML8H5Yk5D1Mc+FYVgs+8O/e3VAhbSLvINSM5PIdJPr6zIgdPzEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GGWU+uWo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GGWU+uWo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748952922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TasztSvEy0KptHyXQjrgiaCFMzH0ysJYTfsnvkcKii8=;
	b=GGWU+uWo+22dfIphcRl/nkOE1q3QCF0RYgDkbin1gjno5i2857F2N/RBJqi/wk1vBJlSwO
	GOFmFDhBAV5l4plKo7BReVEUejelzOBODDcTXoctwCSu1TO1inCuJVmVOOGG4aqLcnxY1T
	ehsncg/1kTOpqGOvmwVnlTBIK26b/vo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-hUA4nxN0OqmtcS_IrWq22A-1; Tue, 03 Jun 2025 08:15:20 -0400
X-MC-Unique: hUA4nxN0OqmtcS_IrWq22A-1
X-Mimecast-MFC-AGG-ID: hUA4nxN0OqmtcS_IrWq22A_1748952919
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-442e0e6eb84so35450775e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 05:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748952919; x=1749557719;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TasztSvEy0KptHyXQjrgiaCFMzH0ysJYTfsnvkcKii8=;
        b=ntPkEfi00pD86ZymM3I/PvywKgD9tndcSdxn0iiizZ97N9BJ+MnznT+GxhKPDxIh1W
         yRsgTWZo1RUuPFbgyQd3rxCAa+RTW72+WWin2x1hH/1UYT0c2TgDgD/dMyg8fmxMuaXZ
         ucWTH66nC+5efeN1Cin/2VnnhK2dIz8ATHwLgjDvPRmlBHsey2kcadiPLshMyacnXFq/
         1qogTYOKp+lllSgFq+xDduad0gR4WGAdZZe3++0TOq51NFdSSGdfjcsxHWE7vr6vpH+P
         pAt0WN7gtFJETZer9cpm0gJ0zzLVSgzyVlMxiDA7z+ydu5kqxBYTH80m3fA+T1NVXge7
         A2dA==
X-Forwarded-Encrypted: i=1; AJvYcCV1t8G7/pLNJAvdZdLOEEMtqjDp4ZSV7Hxshpp68EWyYv4ecqRttNqb15DjE0e1KKnJS7u1cpeaDoAqFFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdkcEQvFCKGTpWdqL3ERoCaKgsPXVR8QptEup0BzDTQqWKYm7R
	k+kNG+Aa9VrM8+/CiLMGDBIcQyPdGJj8WIdxGmPL1YnuaewSb5zec0FTReJLN9uwLId0Ed7lPOQ
	NKtfa3v58vdeRl11GGhVGP/WSGcSKgSQccW/guTKIjICsQ7rpf9YnNyjKFwKIstNIiQ==
X-Gm-Gg: ASbGnctPAvhmsySMUWCwqArTOoox3wOrqA1HxAyiW3E2B47lms6cRM74SScjpeqq3fw
	B0z9Cf65mGiyc4cEGO58W+RSMNlEWLN4oFm2gXwK5KvtehWL47jCuo+13GuLfDJMedLc9u69IyR
	Fsz92lXgO95+oMnzpaUuTXs+ArvktobFKjoHbgiw+jPzsjl9bVNr5eV+XF5uHSzBkUWXgp0RKU3
	/4wR/uFzktWcQD/4LD1h3EpagfzF2r0q6Yj3iN/3ifLI46sYYv6VBBfEnWCOYJb/1hSrNY8nEBm
	WYMIhGTfAtfoF6oPl1OR09uu4k2V2fQDfPtyZ9po3gtUb8m0t3T53kb2+43Sgg/RnwOYGwkAt+Y
	/3aozyVg6vhLgrjDluOsMNhwM2tEvK3f+tXrHvrw=
X-Received: by 2002:a05:600c:8b68:b0:440:6852:5b31 with SMTP id 5b1f17b1804b1-450d651182fmr193445135e9.10.1748952918988;
        Tue, 03 Jun 2025 05:15:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiHaGOk8I+UeX8+pvGCa89rKh+KLPclMDESQfssTO2f3GKAiDIyMQLwhS6/fd1DVCtRLsNiA==
X-Received: by 2002:a05:600c:8b68:b0:440:6852:5b31 with SMTP id 5b1f17b1804b1-450d651182fmr193444655e9.10.1748952918541;
        Tue, 03 Jun 2025 05:15:18 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f0d:f000:eec9:2b8d:4913:f32a? (p200300d82f0df000eec92b8d4913f32a.dip0.t-ipconnect.de. [2003:d8:2f0d:f000:eec9:2b8d:4913:f32a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8000d45sm159598675e9.25.2025.06.03.05.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 05:15:18 -0700 (PDT)
Message-ID: <0003a78b-e66f-41a5-9244-89c2c430cfa4@redhat.com>
Date: Tue, 3 Jun 2025 14:15:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] mm: madvise: use walk_page_range_vma() for
 madvise_free_single_vma()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Barry Song <21cnbao@gmail.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Barry Song <v-songbaohua@oppo.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>,
 Lokesh Gidra <lokeshgidra@google.com>,
 Tangquan Zheng <zhengtangquan@oppo.com>
References: <20250603013154.5905-1-21cnbao@gmail.com>
 <7bd57eba-42a0-4bf3-8632-b91c401b7316@arm.com>
 <CAGsJ_4y3zWS_rHY4=WWuA9BANYwR=r-j9nrfiX2TAQwuo11JdA@mail.gmail.com>
 <bd61e018-5fbb-4aac-8672-0c16254ba09e@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <bd61e018-5fbb-4aac-8672-0c16254ba09e@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03.06.25 11:41, Lorenzo Stoakes wrote:
> On Tue, Jun 03, 2025 at 08:47:04PM +1200, Barry Song wrote:
>> On Tue, Jun 3, 2025 at 6:11 PM Dev Jain <dev.jain@arm.com> wrote:
>>>
>>>
>>> On 03/06/25 7:01 am, Barry Song wrote:
>>>> From: Barry Song <v-songbaohua@oppo.com>
>>>>
>>>> We've already found the VMA before calling madvise_free_single_vma(),
>>>> so calling walk_page_range() and doing find_vma() again seems
>>>> unnecessary. It also prevents potential optimizations for MADV_FREE
>>>> to use a per-VMA lock.
>>>>
>>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>> Cc: David Hildenbrand <david@redhat.com>
>>>> Cc: Vlastimil Babka <vbabka@suse.cz>
>>>> Cc: Jann Horn <jannh@google.com>
>>>> Cc: Suren Baghdasaryan <surenb@google.com>
>>>> Cc: Lokesh Gidra <lokeshgidra@google.com>
>>>> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
>>>> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
>>>> ---
>>>>    mm/madvise.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/mm/madvise.c b/mm/madvise.c
>>>> index d408ffa404b3..c6a28a2d3ff8 100644
>>>> --- a/mm/madvise.c
>>>> +++ b/mm/madvise.c
>>>> @@ -826,7 +826,7 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
>>>>
>>>>        mmu_notifier_invalidate_range_start(&range);
>>>>        tlb_start_vma(tlb, vma);
>>>> -     walk_page_range(vma->vm_mm, range.start, range.end,
>>>> +     walk_page_range_vma(vma, range.start, range.end,
>>>>                        &madvise_free_walk_ops, tlb);
>>>>        tlb_end_vma(tlb, vma);
>>>>        mmu_notifier_invalidate_range_end(&range);
>>>
>>> Can similar optimizations be made in madvise_willneed(), madvise_cold_page_range(), etc?
>>
>> Yes, I think the same code flow applies to madvise_willneed,
>> madvise_cold_page_range, and similar functions, though my current
>> interest is more on madvise_free.
>>
>> Let me prepare a v2 that includes those as well.
> 
> FWIW Dev makes a great point here and I agree wholeheartedly, let's fix all such
> cases...
> 
> As an aside, I wonder if we previously didn't do this because we hadn't
> previously exposed the walk_page_range_vma() API or something?

IIRC, yes:

commit e07cda5f232fac4de0925d8a4c92e51e41fa2f6e
Author: David Hildenbrand <david@redhat.com>
Date:   Fri Oct 21 12:11:39 2022 +0200

     mm/pagewalk: add walk_page_range_vma()
     
     Let's add walk_page_range_vma(), which is similar to walk_page_vma(),
     however, is only interested in a subset of the VMA range.
     
     To be used in KSM code to stop using follow_page() next.


-- 
Cheers,

David / dhildenb

