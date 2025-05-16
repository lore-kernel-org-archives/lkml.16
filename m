Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB69205502
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 11:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747394665; cv=none; b=vE0L/Wix1MZiJZhY+MhUiZzhDCOLT8Ee7IwMAX8l9nQfQ7U7P2XaCTqrBXOXbB0t0r+gFlpnWdpV4VoXl+WtSPw9pKrICGpsmqRid2b0mtNi+Mux9hWuLxKl3GGIQ+47tYhxzRKr0zS0io4Pe1tnuwxowoJIUuA72hfeV2baFG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747394665; c=relaxed/simple;
	bh=jQP1pnOprXUwt0tijnckEd9rfdYhpNlyLu0SOkhTh5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AMyxMH1EXd48g/julhCnxMwR1lO/ISxBy9NhKITtrcrfBGPJ/yJ5JxBw2XekKeB5wiTu/f3Z/TuJ64nXBp7XjwHxI7jibeqrvrKO4x+kzSDuliKduLFMBmiPC6HpsAbNqt/d3yYW4A189PVvI4RSDK0B3dKXHpAcOAuptOAENiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i8/4z+1x; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i8/4z+1x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747394662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5CeGhcoalkCiRBD5Dh2QJQGoIoNoVyW9oUyPObGCVyU=;
	b=i8/4z+1xrvaZ/BnKmfpRzVFAzUB9RuOCU6wycmaaPpDU9YPCdewDGEekePA+G3ymxM68ZH
	sZPeyOIs7/Vx7NC/T3fV2uLXdDMSOJPcolOluXPdLIk2RQBA0W2kFULx8X5qyVAsr3OIQA
	b0Pbdv3rRTCa+aAiv++45PsX1HVWOUI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-edRrEnfhMYai9Cp7K6_MoA-1; Fri, 16 May 2025 07:24:21 -0400
X-MC-Unique: edRrEnfhMYai9Cp7K6_MoA-1
X-Mimecast-MFC-AGG-ID: edRrEnfhMYai9Cp7K6_MoA_1747394660
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf3168b87so10794465e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 04:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747394660; x=1747999460;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5CeGhcoalkCiRBD5Dh2QJQGoIoNoVyW9oUyPObGCVyU=;
        b=TN0Ib/ikKgM0OJOlG0FzXnh0DF9OJgddwEBl3h7OYkwvnQsE8bC9GDKpDKesnn7na2
         WgDDVGxUoDsyEWhBzFL64/ApPfl2u96igZ3YCiA5Bugjbc5zP/JXG20GG0Lffuj+KT5L
         5vIXs209SK/+7GabINK2ah8j1tO6WCNhxV3KweEm4IMPaIdGiAl4O5rrL1h9iUvhQK5p
         Pi8xg7mh9J0c4ENI7Q7tC5YCA248kQIn+SPefze1C6pAb598B1wWJ9Ce6zzie7oWuXZ3
         QH1x5jYnHU+6jH+Wj9KoloFdS8LzQ43bjWxVRfkJlJYKZtYYom/Gl6tkXSYszlfxV1fE
         ZF4A==
X-Forwarded-Encrypted: i=1; AJvYcCW6oVGpTXGKW/lCrcA5LxarJJnE/qwUijiJt4SHtag1fFD2DUzjdNx1FtPlP4MNZzhFOX+ezQwkI6jk+aA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0yRgSbFDxmlM3YHMZA3nE7WdgsQAC8+rvRLWbyOre9bQgXS2n
	n4/kpfrajdgDt7QIpk6H4PpM48mhO0v64BmllAYZTXa7uHyEQpOEbuSJdU6do5YQlZZTLE42+cy
	MvJ8zwhWGcIz2Bhtr9dyweiQ6LyTFRkTwQBZz4nRoimrHmYvRkp4NBiblQJhAKt+r/g==
X-Gm-Gg: ASbGnctf4vRI/zCdzxsQ9KTZDgJtkdXakDnnfQl1Fnz2leXAZ68c2bMJOTXEptWl/wg
	C6OXdYzLU+ChP8NBs5YYB4vMICVRfetPvF5maX0eegy65+RXDMuuBxQVgRAiHIjDOmSP5vwtlXN
	1PCNOzvvLFc5qgLznGmVzlDMWNjdizI6iFBieGTHhBsQFAwJuO/vXlk7sI6R3wNf71ckDJFj4SD
	B8JaOqJFPtnFyP08sVo5YTRlg/Y7St9WVFaXJrDqC/4SYG7NvgocwZnHFTYtf0QpVEgMjnDsoUi
	u98Uc7K59CHcE8SVpWPBLzs1efHBKSaJsFKwb4j0ru30DYttcQI5OF6YncyBphrmBixqAf8vevZ
	aNyucYJMr54c47zPUZ4BcRF1fUOGtMSITzdM6P2k=
X-Received: by 2002:a05:600c:35c8:b0:441:d43d:4f68 with SMTP id 5b1f17b1804b1-442fd63c6b7mr34276785e9.15.1747394660421;
        Fri, 16 May 2025 04:24:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFazKZM6MNCASQkRETRXEk1OXkFxsOav8YosRbDcJ0GaU1XHyulDBu1J46n9FJq5xeSunXT0w==
X-Received: by 2002:a05:600c:35c8:b0:441:d43d:4f68 with SMTP id 5b1f17b1804b1-442fd63c6b7mr34276335e9.15.1747394659986;
        Fri, 16 May 2025 04:24:19 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f47:4700:e6f9:f453:9ece:7602? (p200300d82f474700e6f9f4539ece7602.dip0.t-ipconnect.de. [2003:d8:2f47:4700:e6f9:f453:9ece:7602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd583f07sm29331245e9.31.2025.05.16.04.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 04:24:19 -0700 (PDT)
Message-ID: <d8a7644b-6ec5-48bd-9789-cb5017075690@redhat.com>
Date: Fri, 16 May 2025 13:24:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Usama Arif <usamaarif642@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <ddc0dd46-8541-4d4a-ac59-287e11e1d3ff@gmail.com>
 <02ead03b-339b-45c8-b252-d31a66501c39@lucifer.local>
 <3a2a329d-2592-4e31-a763-d87dcd925966@redhat.com>
 <8ea288f2-5196-41f9-bd65-e29f22bb29e8@lucifer.local>
 <5f77366d-e100-46bb-ac85-aa4b216eb2cf@redhat.com>
 <cbc95f9b-1c13-45ec-8d34-38544d3f2dd3@lucifer.local>
 <8f0a22c2-3176-4942-994d-58d940901ecf@redhat.com>
 <1a175a2c-8afa-4995-9dec-e3e7cf1efc72@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <1a175a2c-8afa-4995-9dec-e3e7cf1efc72@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.05.25 12:57, Lorenzo Stoakes wrote:
> On Fri, May 16, 2025 at 09:45:17AM +0200, David Hildenbrand wrote:
>> On 15.05.25 22:35, Lorenzo Stoakes wrote:
>>> On Thu, May 15, 2025 at 09:12:13PM +0200, David Hildenbrand wrote:
>>>> On 15.05.25 20:08, Lorenzo Stoakes wrote:
>>>>> On Thu, May 15, 2025 at 06:11:55PM +0200, David Hildenbrand wrote:
>>>>>>>>> So if you're not overriding VM_NOHUGEPAGE, the whole point of this exercise
>>>>>>>>> is to override global 'never'?
>>>>>>>>>
>>>>>>>>
>>>>>>>> Again, I am not overriding never.
>>>>>>>>
>>>>>>>> hugepage_global_always and hugepage_global_enabled will evaluate to false
>>>>>>>> and you will not get a hugepage.
>>>>>>>
>>>>>>> Yeah, again ack, but I kind of hate that we set VM_HUGEPAGE everywhere even
>>>>>>> if the policy is never.
>>>>>>
>>>>>> I think it should behave just as if someone does manually an madvise(). So
>>>>>> whatever we do here during an madvise, we should try to do the same thing
>>>>>> here.
>>>>>
>>>>> Ack I agree with this.
>>>>>
>>>>> It actually simplifies things a LOT to view it this way - we're saying 'by
>>>>> default apply madvise(...) to new VMAs'.
>>>>>
>>>>> Hm I wonder if we could have a more generic version of this...
>>>>>
>>>>> Note though that we're not _quite_ doing this.
>>>>>
>>>>> So in hugepage_madvise():
>>>>>
>>>>> int hugepage_madvise(struct vm_area_struct *vma,
>>>>> 		     unsigned long *vm_flags, int advice)
>>>>> {
>>>>> 	...
>>>>>
>>>>> 	switch (advice) {
>>>>> 	case MADV_HUGEPAGE:
>>>>> 		*vm_flags &= ~VM_NOHUGEPAGE;
>>>>> 		*vm_flags |= VM_HUGEPAGE;
>>>>>
>>>>> 		...
>>>>>
>>>>> 		break;
>>>>>
>>>>> 		...
>>>>> 	}
>>>>>
>>>>> 	...
>>>>> }
>>>>>
>>>>> So here we're actually clearing VM_NOHUGEPAGE and overriding it, but in the
>>>>> proposed code we're not.
>>>>
>>>> Yeah, I think I suggested that, but probably we should just do exactly what
>>>> madvise() does.
>>>
>>> Yes, agreed.
>>>
>>> Usama - do you have any issue with us switching to how madvise() does it?
>>>
>>>>
>>>>>
>>>>> So we're back into confusing territory again :)
>>>>>
>>>>> I wonder if we could...
>>>>>
>>>>> 1. Add an MADV_xxx that mimics the desired behaviour here.
>>>>>
>>>>> 2. Add a generic 'madvise() by default' thing at a process level?
>>>>>
>>>>> Is this crazy?
>>>>
>>>> I think that's what I had in mind, just a bit twisted.
>>>>
>>>> What could work is
>>>>
>>>> 1) prctl to set the default
>>>>
>>>> 2) madvise() to adjust all existing VMAs
>>>>
>>>>
>>>> We might have to teach 2) to ignore non-compatible VMAs / holes. Maybe not,
>>>> worth an investigation.
>>>
>>> Yeah, I think it'd _probably_ be ok except on s390 (which can fail, and so
>>> we'd have to be able to say - skip on error, carry on).
>>>
>>> We'll just get an -ENOMEM at the end for the gaps (god how I hate
>>> that). Otherwise I don't think MADV_HUGEPAGE actually is really that
>>> restrictive.
>>>
>>> That would simplify :)
>>>
>>> But I still so hate using prctl()... this might be one of those cases where
>>> we simply figure out we have no other choice.
>>>> But when you put it as simply as this maybe it's not so bad. With the
>>> flags2 gone by fixing this stupid 32-bit limit it's less awful.
>>>
>>> Perhaps worth seeing what an improved RFC of this series looks like with
>>> all the various bits fixed to give an idea.
>>
>> Yes.
>>
>>>
>>> But you do then wonder if we could make this _generic_ for _any_ madvise(),
>>> and how _that_ would look.
>>>
>>> But perhaps that's insane because many VMAs would simply not be suited to
>>> having certain madvise flags set hmm.
>>
>> Same thinking. I think this is rather special.
>>
>> In a perfect world not even the madvise(*HUGEPAGE) would exist.
>>
>> But here we are ... 14 years (wow!) after
> 
> This feels like the tale of the kernel :)
> 
>>
>> commit 0af4e98b6b095c74588af04872f83d333c958c32
>> Author: Andrea Arcangeli <aarcange@redhat.com>
>> Date:   Thu Jan 13 15:46:55 2011 -0800
>>
>>      thp: madvise(MADV_HUGEPAGE)
>>
>>
>>
>> (I'm surprised you don't complain about madvise(). IMHO, prctl() is even a
>> better interface than catch-all madvise(); a syscall where an advise might
>> not be an advise. I saw some funny rants about MADV_DONTNEED on reddit at
>> some point ... :) mctrl() would have been clearer, at least for me :D )
> 
> No I prefer madvise() massively, I mean yes in a way it's hacky, but prctl() is
> the ultimate hack.
> 
> So as an interface it's actually kinda fine like 'virtual range X-Y, advise ZZZ
> about it'.
> 
> (as for naming haha maybe you have a point actually, the 'advice' bit
> has always been strange... :)
> 
> But.
> 
> The actual set of advice is bloody hideous and confusing and I've seen
> first hand userspace people get very, very confused about what each thing
> does. The naming is horrible, overloaded, overwrought.
> 
> And the weird behaviour with gaps is also horrible...
> 
> So there's lots to moan about there, but saying prctl() is somehow superior
> to the true evil of prctl() is far too far :P

Haha :)

> 
> I mean take a look at https://man7.org/linux/man-pages/man2/prctl.2.html
> 
> Things like:
> 
> 	PR_SET_MM
> 	PR_SET_VMA
> 
> Are super worrying...

Don't get me wrong. I like the concept of prctl(), but not whatever 
weird stuff we squeezed in there. And there is *a lot* of weird stuff in 
there that probably shouldn't exist.

Similar to madvise(), where we squeezed in a lot of stuff ... but that 
ship has sailed.

Looking forward to hearing what your magic thinking cap can do! :)

-- 
Cheers,

David / dhildenb

