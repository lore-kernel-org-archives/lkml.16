Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB1D221703
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744050841; cv=none; b=G4yEtLnftFvWEULoK0fqivAnjCW+tyy8evja/smjryosUJNhUwyeuvXlhhYBcMdc0H2HcAfpKq/P6xHtaD4aoclb51y1BheO4EGecJuQcwuiYiFOOe8rGsHBRp8xRdAHmIxp6XI9eQZsdzuXDlSZSoGmeyzYZpIqgazhQ7u7o9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744050841; c=relaxed/simple;
	bh=tjoKfJ97tr+c9G2S5iYObeOQNm80k87Kxndsv/JV9yU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZoeiNf7LZFFbE8A5IrkgqHoJo7aYuEk1p62zFuc0yIur6lrJYokFKRqNAaSYrU8SiaIam6nnqTSdDculpWWs7zlAN9kkgwPz5OfGveQhvtvOdjGA0+2T4TmkgDsNMml4Ruo3evBcSPSQtLq8SLiqSpQ1CBKfeIMtvLEhZkgSaFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iBgTxcJT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iBgTxcJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744050838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3+09NZkHFq8f3X25M6QS/1Uwvt5iZdFtU0tu/KyOEi4=;
	b=iBgTxcJTrVwkA3voNt23yxTKqNcQkfmUGIUm1/LKSDIcxBFZRUK+Y99AvwQL0s63ZkzXDv
	6nKWTH4QCQ8yAccM2qeyKl1jFVOmiMHS/QlJ2D9yuXQLbMAo/kK5MgDEhQib4UaVCJlnx/
	mUzYqFwZFD59oC0HiuMMjRgOHSJINPo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-WVrglLAUMNCQbnbCS5skfQ-1; Mon, 07 Apr 2025 14:33:56 -0400
X-MC-Unique: WVrglLAUMNCQbnbCS5skfQ-1
X-Mimecast-MFC-AGG-ID: WVrglLAUMNCQbnbCS5skfQ_1744050835
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ce245c5acso59278675e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 11:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744050835; x=1744655635;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3+09NZkHFq8f3X25M6QS/1Uwvt5iZdFtU0tu/KyOEi4=;
        b=Ds31yiOHaI7ogi6TVclgM954RlaYwD4TUJxri6OykNWxzynCKZ88G55No0pS+wT38F
         N/EfvXtPReHvt3ZJHvmB4GEAMLBxORzz54etKeOTn3XSIqzyNtv/BoU8sxcZH1g9MU+E
         GGDbw+gGspSPgMvMfozRysx/4k8zcdfoZMRcOiFAevzhWxvq7OUcNgOO1ELZDogs+55v
         mJrBlTJc94Jv/cve4aanomioDBJHEpu7VsvI3w9ZhnIBVsWglOKhzSAbNvDa2WMimi1i
         9s9G1KVCVucX3Q4Bx9us4SJFmFWXjZyHJfAmCEHVVG8MnPvDdWsyIF1fQfCpi0boNq29
         Oe2A==
X-Gm-Message-State: AOJu0Yyr6JbSguF7yZJ3ni6IbM27wGJrcpvUDWDw5EXNlUGBBOq2kUlk
	dxdJawGI3vDEmokzSdkOhDazBk8BmdhFJ5xmbWNdaA3sHE5E6dFRRxFbazMITUqi+alsVsL4r23
	CyLg2t6Uv00pvijmxTRGIJWiTGyVYIo14qm1uM2YsPLBaPVIMS9L8NndAttwg+Q==
X-Gm-Gg: ASbGncsIw5z/mZrnXpoKpBVMU6lQel5Pu50tBPjfm5NZgidzjdDzxcMjfPCA3v50T+d
	DlNpI/RqM5lgxC2EDl8h0QxqUKBW666gNNh0rBstsGG7+vi3039RgMeRARyH3XV3ORQeZRMBStx
	Z2L2IXiAaE+36WXSdCokQNeUA/X0jU8U3T4JMgp3++hyf+i8JCUg6TrvlcIps372cbAwyyvnjEe
	U77eLoJoYqOmryEjbi5/eQV48pI2U0jjBdMY+Jw7hT9osZM/yCbIHHpPlzVaDs4acYCRTopF1pm
	WFj71ByOu4hWQLmY0zSL1FKHXfc2Y5zVtefQahNdqPDMPky0II4PLKB6gjIvkyUAK8rFFsFD9Jf
	TeNQ6AwVexANmWa2c7eJbspv5i61b6737SH4sHMSwC4E=
X-Received: by 2002:a05:600c:8711:b0:43d:2230:300f with SMTP id 5b1f17b1804b1-43ed07ad502mr147444875e9.0.1744050835456;
        Mon, 07 Apr 2025 11:33:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFx3M9MnkdUDVlpzDHWjQL1m8tGUcUm4RwESzADjltVHLzy61DWYaNXlYqSwxIrffiWikauaA==
X-Received: by 2002:a05:600c:8711:b0:43d:2230:300f with SMTP id 5b1f17b1804b1-43ed07ad502mr147444595e9.0.1744050835015;
        Mon, 07 Apr 2025 11:33:55 -0700 (PDT)
Received: from ?IPV6:2003:cb:c738:3c00:8b01:4fd9:b833:e1e9? (p200300cbc7383c008b014fd9b833e1e9.dip0.t-ipconnect.de. [2003:cb:c738:3c00:8b01:4fd9:b833:e1e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364a0c7sm137141685e9.29.2025.04.07.11.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 11:33:54 -0700 (PDT)
Message-ID: <12196206-16b0-4913-b087-1f59ff808603@redhat.com>
Date: Mon, 7 Apr 2025 20:33:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86/mm/pat: (un)track_pfn_copy() fix + improvements
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Rik van Riel <riel@surriel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20250404124931.2255618-1-david@redhat.com>
 <Z_K5uW2eu7GInRxs@gmail.com>
 <630caa8e-2ee2-4895-9e4e-8bf2fa079100@redhat.com>
 <Z_QCYzEJXTnd97Sf@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z_QCYzEJXTnd97Sf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.04.25 18:50, Ingo Molnar wrote:
> 
> * David Hildenbrand <david@redhat.com> wrote:
> 
>> On 06.04.25 19:28, Ingo Molnar wrote:
>>>
>>> * David Hildenbrand <david@redhat.com> wrote:
>>>
>>>> We got a late smatch warning and some additional review feedback.
>>>>
>>>> 	smatch warnings:
>>>> 	mm/memory.c:1428 copy_page_range() error: uninitialized symbol 'pfn'.
>>>
>>>> -	if (!(src_vma->vm_flags & VM_PAT))
>>>> +	if (!(src_vma->vm_flags & VM_PAT)) {
>>>> +		*pfn = 0;
>>>>    		return 0;
>>>> +	}
>>>
>>>>    static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
>>>>    		struct vm_area_struct *src_vma, unsigned long *pfn)
>>>>    {
>>>> +	*pfn = 0;
>>>>    	return 0;
>>>>    }
>>>
>>> That's way too ugly. There's nothing wrong with not touching 'pfn'
>>> in the error path: in fact it's pretty standard API where output
>>> pointers may not get set on errors.
>>
>> We're not concerned about the error path, though.
> 
> Sorry, indeed, not an error path, but the !VM_PAT path above - but
> still a similar argument applies IMHO.
> 
>>> If Smatch has a problem with it, Smatch should be fixed, or the false
>>> positive warning should be worked around by initializing 'pfn' in the
>>> callers.
>>
>> We could adjust the documentation of track_pfn_copy, to end up with the
>> following:
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index e2b705c149454..b50447ef1c921 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -1511,8 +1511,9 @@ static inline void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
>>   /*
>>    * track_pfn_copy is called when a VM_PFNMAP VMA is about to get the page
>> - * tables copied during copy_page_range(). On success, stores the pfn to be
>> - * passed to untrack_pfn_copy().
>> + * tables copied during copy_page_range(). Will store the pfn to be
>> + * passed to untrack_pfn_copy() only if there is something to be untracked.
>> + * Callers should initialize the pfn to 0.
>>    */
>>   static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
>>                  struct vm_area_struct *src_vma, unsigned long *pfn)
>> @@ -1522,7 +1523,9 @@ static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
>>   /*
>>    * untrack_pfn_copy is called when a VM_PFNMAP VMA failed to copy during
>> - * copy_page_range(), but after track_pfn_copy() was already called.
>> + * copy_page_range(), but after track_pfn_copy() was already called. Can
>> + * be called even if track_pfn_copy() did not actually track anything:
>> + * handled internally.
>>    */
>>   static inline void untrack_pfn_copy(struct vm_area_struct *dst_vma,
>>                  unsigned long pfn)
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 2d8c265fc7d60..1a35165622e1c 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -1361,7 +1361,7 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>>          struct mm_struct *dst_mm = dst_vma->vm_mm;
>>          struct mm_struct *src_mm = src_vma->vm_mm;
>>          struct mmu_notifier_range range;
>> -       unsigned long next, pfn;
>> +       unsigned long next, pfn = 0;
> 
> Ack.
> 
> I hate it how uninitialized variables are even a thing in C, and why
> there's no compiler switch to turn it off for the kernel. (At least for
> non-struct variables. Even for structs I would zero-initialize and
> *maybe* allow a non-initialized opt-in for cases where it matters. It
> matters in very few cases in praxis. And don't get me started about the
> stupidity that is to not initialize holes in struct members ...)
> 
> Over the decades we've lived through numerous nasty bugs for very
> little tangible code generation benefits.

Ok, let me resend with that. (I'll still tag it as a fix due do the 
weird UB scenario when passing uninitialized values to a non-inline 
function ...)

-- 
Cheers,

David / dhildenb

