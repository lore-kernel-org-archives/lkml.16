Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63692202996
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748423026; cv=none; b=e9M9HgX1Yaapwrrl7M98jeUVoRjVsdI7h5pcK806BjXDKXRZnbko/CeoDuR0wNstIaLHiWU15GoUudt1CdxZxpcH105s/Gbth1engHCbiUiT4vcONFRQVdpgE3NMd0ck6bgDGCE1+MVPem1XkNe/iae2ht2ZeQa6zgw5gWqtpWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748423026; c=relaxed/simple;
	bh=Ihf96Jf9emlxTAsFz/QMxZBnHIPBcwSzHnWS2+MKpSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kn0a920WQjT5iviZEAM1dfeRP3BBLZAU3IMWWESk84Bi7g1/Xf60mTqFigiKLVsDT8inQfzRPltJ35SA9Yj7DAO9DzSPFZ0WvRdS5W6v6/rEZ2g72Rttyxw+bqUoE6cH2w1zV5ZVO/gJ07enPcA2OHhd2MY3hoJAGvvNArKutfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fo7bfkzP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fo7bfkzP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748423023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9uc45Svc1W6nrhUpVJMAGcmamvYOihc8Tgxl1943pLA=;
	b=Fo7bfkzPHDy+69NYqVAsgQmCtemqkfgX57INUf+ltDKfOhJHOk1Vq20nyKrebK2I2Uj7fE
	MkZC/CqnNH/GuS/we0lKZrutfaSwgjXQ3R/SR6Z0DEd1vyK/vO+bLoDKmaQ7Czad+3eOh3
	R1jiBuTug6Oc1gdjQ6mJIszvD+9m0So=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-E7Qa5zcrOhan9Ap2FESprQ-1; Wed, 28 May 2025 05:03:41 -0400
X-MC-Unique: E7Qa5zcrOhan9Ap2FESprQ-1
X-Mimecast-MFC-AGG-ID: E7Qa5zcrOhan9Ap2FESprQ_1748423021
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a35ec8845cso1965384f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 02:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748423020; x=1749027820;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9uc45Svc1W6nrhUpVJMAGcmamvYOihc8Tgxl1943pLA=;
        b=pUiJmLPyURxCxdBnKlsm96WbrPiTiRi/fmzWilCQgroOmkyrEJfJC0ATbI/41QcMfM
         z3JmEKVv/mvrzyh9zMDVa/wGcWevthkNsQl7IkaR8px8XgmZSDt35Ll94By7mmR/UiRJ
         0+NJyAtC0NXpK4VQu26b+9JPL/ARvZkci5oYU8wsVZ3WDHI1bP4gvDpvgD07u+iMeVoB
         /QF/rwhPYsyCgPw49Wo7H1jPf5PoZq9VEwWnTCQx+n3sLO0x3fuC7i121Kx6Cx7+d/Aj
         bow7adQhTYTT1Iywc8B86pQyzJrrxP9qMbzoAh2ABpeoIoal4EnHxZvwgW1ITXmfsB0j
         KdTg==
X-Forwarded-Encrypted: i=1; AJvYcCXx64E5FrX4glMS0apT5SAShrzESA3rgiAibrK3KkKc4Uy+EwzEXyWdMweu2c11HOQh1GDmE8dFfCJQp0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdW+atv0AtjV04DtY5zsuSDPYGjUMHXxachqmg6vaRkMYN7MCs
	JpPgiLA3E8LjUsPttXUpY7QTnCmtz8xl0FJZ79hf00mRtaeDcPBNWsrcddyYdv+LCckqUbN1iUc
	9dtQQ877JUE/SKDPHBh7zLaTCoPJavGx2lgV2u3cmbWUuxaYXDbi2joqumx+vwgrWpA==
X-Gm-Gg: ASbGncv4+XikVHV7dMQZV75WIX70cLYGBez2xrWosZqJCLVfVWLwReXMXhiWxBAnPxr
	mxCPPdsIzpae8ZEMDVyNPM2pJBnN/dan9r5a9tZlFZkkOY/HQBDUGHj/NFwbGH3s2dVqeO3ogV9
	9znJ0qPJHcuNzpC1GaC4l5xPZ001i0+1A2v4vcVTRsYWjo0Euj9YhOKBpbqMu7nOhMjMLJS+wDq
	zBB03VNhUl63JLE/eF7xL8o5ZMF2IqDvnajmUE9rqVTn3L0R/pfutnvZUkxOZ5Rdel1vwXyZfB1
	jRuugibWOk77FhChB8RiNmtYBTr8lcB+M5NtTERni2p0cgQMa6q/oEHFbozko1t9cjN/8kJIV18
	zztz4mUhqJ7SgvpljuuiwEnx6TNm3rufDP0vcuTU=
X-Received: by 2002:a05:6000:4312:b0:3a4:dc0a:5c0a with SMTP id ffacd0b85a97d-3a4e957be2dmr1397984f8f.44.1748423020477;
        Wed, 28 May 2025 02:03:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/FFPCB6RPiUlD6SK7Uvhb6FaRvTdWdlGF2T5R9hZ0YO2drr0+Pok+YZzB60DfLfzkVn3Uqg==
X-Received: by 2002:a05:6000:4312:b0:3a4:dc0a:5c0a with SMTP id ffacd0b85a97d-3a4e957be2dmr1397947f8f.44.1748423020066;
        Wed, 28 May 2025 02:03:40 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f30:ec00:8f7e:58a4:ebf0:6a36? (p200300d82f30ec008f7e58a4ebf06a36.dip0.t-ipconnect.de. [2003:d8:2f30:ec00:8f7e:58a4:ebf0:6a36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eacd8edfsm886493f8f.79.2025.05.28.02.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 02:03:39 -0700 (PDT)
Message-ID: <cba0155e-d2b9-41fa-bc51-f3738ae73cff@redhat.com>
Date: Wed, 28 May 2025 11:03:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
To: Pu Lehui <pulehui@huaweicloud.com>, Oleg Nesterov <oleg@redhat.com>
Cc: lorenzo.stoakes@oracle.com, mhiramat@kernel.org, peterz@infradead.org,
 Liam.Howlett@oracle.com, akpm@linux-foundation.org, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, pulehui@huawei.com
References: <20250521092503.3116340-1-pulehui@huaweicloud.com>
 <62b5ccf5-f1cd-43c2-b0bc-f542f40c5bdf@redhat.com>
 <afe53868-5542-47d6-8005-71c1b3bec840@huaweicloud.com>
 <13c5fe73-9e11-4465-b401-fc96a22dc5d1@redhat.com>
 <4cbc1e43-ea46-44de-9e2b-1c62dcd2b6d5@huaweicloud.com>
 <20250526154850.GA4156@redhat.com>
 <06bd94c0-fefe-4bdc-8483-2d9b6703c3d6@redhat.com>
 <57533126-eb30-4b56-bc4d-2f27514ae5ad@huaweicloud.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <57533126-eb30-4b56-bc4d-2f27514ae5ad@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27.05.25 15:38, Pu Lehui wrote:
> Hi David,
> 
> On 2025/5/27 2:46, David Hildenbrand wrote:
>> On 26.05.25 17:48, Oleg Nesterov wrote:
>>> Hi Lehui,
>>>
>>> As I said, I don't understand mm/, so can't comment, but...
>>>
>>> On 05/26, Pu Lehui wrote:
>>>>
>>>> To make things simpler, perhaps we could try post-processing, that is:
>>>>
>>>> diff --git a/mm/mremap.c b/mm/mremap.c
>>>> index 83e359754961..46a757fd26dc 100644
>>>> --- a/mm/mremap.c
>>>> +++ b/mm/mremap.c
>>>> @@ -240,6 +240,11 @@ static int move_ptes(struct pagetable_move_control
>>>> *pmc,
>>>>                   if (pte_none(ptep_get(old_pte)))
>>>>                           continue;
>>>>
>>>> +               /* skip move pte when expanded range has uprobe */
>>>> +               if (unlikely(pte_present(*new_pte) &&
>>>> +                            vma_has_uprobes(pmc->new, new_addr,
>>>> new_addr +
>>>> PAGE_SIZE)))
>>>> +                       continue;
>>>> +
>>>
>>> I was thinking about
>>>
>>>      WARN_ON(!pte_none(*new_pte))
>>>
>>> at the start of the main loop.
>>>
>>> Obviously not to fix the problem, but rather to make it more explicit.
>>
>> Yeah, WARN_ON_ONCE().
>>
>> We really should fix the code to not install uprobes into the area we
>> are moving.
> Alright, so let's try this direction.
> 
>>
>> Likely, the correct fix will be to pass the range as well to
>> uprobe_mmap(), and passing that range to build_probe_list().
> 
> It will be great. But IIUC, the range we expand to is already included
> when entering uprobe_mmap and also build_probe_list.

Right, you'd have to communicate that information through all layers 
(expanded range).

As an alternative, maybe we can really call handle_vma_uprobe() after 
moving the pages.

uprobe_write_opcode() should detect that the uprobe is already installed 
(verify_opcode() will return 0) and just return.

-- 
Cheers,

David / dhildenb

