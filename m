Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B68218ACA
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748595032; cv=none; b=OjtFqvwlCsKcFV8FiDKY+YdfYyzGBG6/nhB2DYahS3tPXuqxxflAu8PkA92IPPzJcJcZUUclZ2wHTMb7xrVNKM2Dlbd1hZyLkpNloxWD+srWNsiP7h1OGMUd23LbKZ2HYu4RTJDhpkzaFXV8HPs43epf2h0Qv8Ymz3hWDaGODMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748595032; c=relaxed/simple;
	bh=Tbqc8hLPMrW47kJKXZ3VaiSdYPfB1sAgTwJs14fpnqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mFng6WHzhj8X4EnStgcUvdsL1rEw5f10htm9G9DyrqloYn8bZYO/Q5FfLasXattPFglcmymMDPut5rhZ6gFiCYG810dYyBd8rmII3o3Lhs97rk1RGsU5Xqyi5M+VSoq2yNqBW+NVlAmp+/sBWk830XPTY/Dl+s4aV+S6xP/wyS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TVJayZrJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TVJayZrJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748595029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=L0+8r+h5VJZKyWcv1fSQdLPCY66hBJlKTv4UFpyXBK8=;
	b=TVJayZrJod8uBz5QqvTSaAl50R3znbbEsqdRT3Ti/Q+bpVBuhrigkAJkuO4f/e4oEe1NXw
	GNbIIDJcPCyal5Emfp+Qjq6mlTpyAxHkRR016EgSKWkeslRx2+Or96MjyXkyW0hAH+3Gst
	vEsVCwvzVExHmSJ8D3yaZMojHcNoaBE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-X66WavRWM3eyLXXSNbY0tQ-1; Fri, 30 May 2025 04:50:28 -0400
X-MC-Unique: X66WavRWM3eyLXXSNbY0tQ-1
X-Mimecast-MFC-AGG-ID: X66WavRWM3eyLXXSNbY0tQ_1748595027
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a367b3bc13so749389f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 01:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748595027; x=1749199827;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L0+8r+h5VJZKyWcv1fSQdLPCY66hBJlKTv4UFpyXBK8=;
        b=hKfsCqFDh5+NMcFbPbxK5u6rsvmyQRBzdqwNozTjvGUCQofe7IHq8ea4YErsDPEYh4
         iy50NVnXlZXtzdWhleTt2n8AkC7BUEj/MW4NKfEC8iFueQVB+ErMtRXhBKMGJ6mdAkOE
         dWQhquBHbWojzVo+8ww54h296BYaKU2xVfOyRfWSL+nnH5KKW/lDdWyn0p77b65su5wA
         6t8yMzZCmQZmszopacPO5H73LgMVTeCztiar3UGAry4TuMkNr+zbVJ5ihvGXys3zhDFA
         irUoQ26LKYb80JFtbrFAbYXQpsi13UX8XbhCQ6UCPmmkswRnWenJo2GMlF2xsoSPK8+3
         vrCg==
X-Forwarded-Encrypted: i=1; AJvYcCVWuV8oQCt8rWrUu754WwqW85mu8AXd4Sh5gvJmUoSvyi47iOlE08Knp+bGJCVJlcm73jt++bOKKAQlH1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwazO8WK/Ndo5hzfENwjPcN2LaMUFBc70YnjdgQlWpcZXbcbuGD
	KW+n3DjEgyS/g/GyhwYVMtjPy0wZeuAV159wKrqhChdpr0zGqVNAMJin7I6wkiMrUXtvN73WiNk
	6BZpCm+Dlb8Ugz9tf81OvceHrs7Bp8thI9wj+igDWVZWud2J6+OLrvtUBPPj7xSFlgg==
X-Gm-Gg: ASbGnct6hm/SLajjKdv++j3WUZwsGBASgyrL66NmPOP1qIpRvtANUTrFypMqVHWQQ+E
	FINiPEezEDA/pT9g9MqQe2GxpsnYPUKJLQElRMB3bgHINmDJ8NFFuHRqV7dbq412VZc8lQwyeSf
	oaqh8qsDSoE6OdPHcPM6ZhUafHMz+WIOQ3lH1pMV3bPyLJevisIVcF5CM7qCWJ/er98b22ajKfw
	BO0p8V2Xay+AG2/ByB7hTTnTyNYoQuQjBW5LZcuxioRCsh80SWaSV2cWI+/0MliRHEw69rmIDvN
	i3QR1YooOEGVkQ0Nw6CifvnblgLyKj/AXJbbA9f2BHORAa/owIRh5ZFI5grmWOOrMjdUoGaFVip
	b5GXs7BJFilLcewL5cNjM+fbqisBBA9TLsibKTMg=
X-Received: by 2002:a05:6000:3112:b0:3a4:bac3:2792 with SMTP id ffacd0b85a97d-3a4f7a3dc11mr1778328f8f.4.1748595027201;
        Fri, 30 May 2025 01:50:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHn1gr3Osd9HyyalCFGtczxVvHmWzyW6PptnSQ10SjPGM6h42L5/AfeMh2GjoihBYKi6RlQw==
X-Received: by 2002:a05:6000:3112:b0:3a4:bac3:2792 with SMTP id ffacd0b85a97d-3a4f7a3dc11mr1778304f8f.4.1748595026810;
        Fri, 30 May 2025 01:50:26 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f03:5b00:f549:a879:b2d3:73ee? (p200300d82f035b00f549a879b2d373ee.dip0.t-ipconnect.de. [2003:d8:2f03:5b00:f549:a879:b2d3:73ee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fc2725sm11823505e9.37.2025.05.30.01.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 01:50:26 -0700 (PDT)
Message-ID: <172df994-7f24-4fbb-876c-4fab22937177@redhat.com>
Date: Fri, 30 May 2025 10:50:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Pu Lehui <pulehui@huaweicloud.com>, Oleg Nesterov <oleg@redhat.com>,
 mhiramat@kernel.org, peterz@infradead.org, Liam.Howlett@oracle.com,
 akpm@linux-foundation.org, vbabka@suse.cz, jannh@google.com,
 pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 pulehui@huawei.com
References: <62b5ccf5-f1cd-43c2-b0bc-f542f40c5bdf@redhat.com>
 <afe53868-5542-47d6-8005-71c1b3bec840@huaweicloud.com>
 <13c5fe73-9e11-4465-b401-fc96a22dc5d1@redhat.com>
 <4cbc1e43-ea46-44de-9e2b-1c62dcd2b6d5@huaweicloud.com>
 <20250526154850.GA4156@redhat.com>
 <06bd94c0-fefe-4bdc-8483-2d9b6703c3d6@redhat.com>
 <57533126-eb30-4b56-bc4d-2f27514ae5ad@huaweicloud.com>
 <cba0155e-d2b9-41fa-bc51-f3738ae73cff@redhat.com>
 <956124be-c73c-4023-9edd-25372f3f865a@huaweicloud.com>
 <ccf359b0-8baa-4209-b2c3-75e3813ca804@redhat.com>
 <b2dd29b0-aa12-4cb7-9c05-d3a998f7b0da@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <b2dd29b0-aa12-4cb7-9c05-d3a998f7b0da@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30.05.25 10:41, Lorenzo Stoakes wrote:
> On Fri, May 30, 2025 at 10:33:16AM +0200, David Hildenbrand wrote:
>> On 29.05.25 18:07, Pu Lehui wrote:
>>>
>>> On 2025/5/28 17:03, David Hildenbrand wrote:
>>>> On 27.05.25 15:38, Pu Lehui wrote:
>>>>> Hi David,
>>>>>
>>>>> On 2025/5/27 2:46, David Hildenbrand wrote:
>>>>>> On 26.05.25 17:48, Oleg Nesterov wrote:
>>>>>>> Hi Lehui,
>>>>>>>
>>>>>>> As I said, I don't understand mm/, so can't comment, but...
>>>>>>>
>>>>>>> On 05/26, Pu Lehui wrote:
>>>>>>>>
>>>>>>>> To make things simpler, perhaps we could try post-processing, that is:
>>>>>>>>
>>>>>>>> diff --git a/mm/mremap.c b/mm/mremap.c
>>>>>>>> index 83e359754961..46a757fd26dc 100644
>>>>>>>> --- a/mm/mremap.c
>>>>>>>> +++ b/mm/mremap.c
>>>>>>>> @@ -240,6 +240,11 @@ static int move_ptes(struct
>>>>>>>> pagetable_move_control
>>>>>>>> *pmc,
>>>>>>>>                     if (pte_none(ptep_get(old_pte)))
>>>>>>>>                             continue;
>>>>>>>>
>>>>>>>> +               /* skip move pte when expanded range has uprobe */
>>>>>>>> +               if (unlikely(pte_present(*new_pte) &&
>>>>>>>> +                            vma_has_uprobes(pmc->new, new_addr,
>>>>>>>> new_addr +
>>>>>>>> PAGE_SIZE)))
>>>>>>>> +                       continue;
>>>>>>>> +
>>>>>>>
>>>>>>> I was thinking about
>>>>>>>
>>>>>>>        WARN_ON(!pte_none(*new_pte))
>>>>>>>
>>>>>>> at the start of the main loop.
>>>>>>>
>>>>>>> Obviously not to fix the problem, but rather to make it more explicit.
>>>>>>
>>>>>> Yeah, WARN_ON_ONCE().
>>>>>>
>>>>>> We really should fix the code to not install uprobes into the area we
>>>>>> are moving.
>>>>> Alright, so let's try this direction.
>>>>>
>>>>>>
>>>>>> Likely, the correct fix will be to pass the range as well to
>>>>>> uprobe_mmap(), and passing that range to build_probe_list().
>>>>>
>>>>> It will be great. But IIUC, the range we expand to is already included
>>>>> when entering uprobe_mmap and also build_probe_list.
>>>>
>>>> Right, you'd have to communicate that information through all layers
>>>> (expanded range).
>>>>
>>>> As an alternative, maybe we can really call handle_vma_uprobe() after
>>>> moving the pages.
>>>
>>> Hi David,
>>>
>>> Not sure if this is possible, but I think it would be appropriate to not
>>> handle this uprobe_mmap at the source, and maybe we should make it clear
>>> that new_pte must be NULL when move_ptes, otherwise it should be an
>>> exception?
>>
>> Yeah, we should ay least document that if we find any non-none pte in the
>> range we are moving to, we have a big problem.
>>
>> I think the main issue is that vma_complete() calls uprobe_mmap() before
>> moving the page tables over.
> 
> Well vma_complete() is not _normally_ invoked before moving page tables,
> it's mremap that's making things strange :)
> 
> That's why I think my suggested approach of specifically indicating that we
> want different behaviour for mremap is a reasonable one here, as it special
> cases things for this case.
> 
> However...
> 
>>
>> If we could defer the uprobe_mmap() call, we might be good.
>>
>> The entry point is copy_vma_and_data(), where we call copy_vma() before
>> move_page_tables().
>>
>> copy_vma() should trigger the uprobe_mmap() through vma_merge_new_range().
>>
>> I wonder if there might be a clean way to move the uprobe_mmap() out of
>> vma_complete(). (or at least specify to skip it because it will be done
>> manually).
> 
> ...I would also love to see some means of not having to invoke
> uprobe_mmap() in the VMA code, but I mean _at all_.
> 
> But that leads into my desire to not do:
> 
> if (blah blah)
> 	some_specific_hardcoded_case();
> 
> I wish we had a better means of hooking stuff like this.
> 
> However I don't think currently we can reasonably do so, as in all other
> merge cases we _do_ want to invoke it.

"all other" -- not so sure.

Why would we invoke uprobe when merging VMAs after mprotect, mremap, 
madvise, ordinary mremap where we are not mapping anything new but just 
... merging VMAs?

Really, we need to invoke uprobe only when adding new VMAs or extending 
existing VMAs -- mapping new file ranges some way.

Or am I missing something important?

-- 
Cheers,

David / dhildenb

