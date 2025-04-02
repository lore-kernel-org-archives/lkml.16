Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7BC23A981
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743607179; cv=none; b=Lo2I86cGb7MYdY+ps8SEHaWjlkFoZVLDXtORDUrmM1KiGedrv4qinx/AeMnPuAr7Ge2yXAKvX2LbcZkP3R61LmKEXD+cPp3CWHOXLFyUqWqu3v2HeAGCQOkCcM1OECCu/khefGQPQISso1zJzYKxyKnueZEYivfW+Q/2d/byNBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743607179; c=relaxed/simple;
	bh=Zo8hcA3vx5w6bifiIbfn9e1HvOZ8O7UzOJw85qTdbWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQxTnL51NyY4XHizaloTJiMDPJCbc+vk+JtwnKmhDCUMsUeGIQ6oQfd0RGNMUzD5QIoTOQkxzxqlSmWPmXk1P/tfMNzOlf+Rybthmva28pT6CwXn6tBKkzZU5b4hS190LEF0mcZhjCLTUZOQNhT43yBIu+z9mg56koI00bxPnh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B2DZ7SzF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B2DZ7SzF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743607176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zkO75VreSZu1lFdypQ+CJZAvR0Zh4kHAiVcMIutv8kg=;
	b=B2DZ7SzF2+/9gRBU1Oy6QEFPEYDkuw+QRIzmVHj5ltxEmwQEOePm7HQ5dpEPv+lobyKVeo
	LpYtjo0fIG12zSNvq4+RxGcXFzaWEke5pixxUYreGruS+4VX5x6CrY3hNTmyuULgNCjU4Q
	aNYty8aqaKEByxGuYOKBiKU44FxFSDU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-842axEJkMYOQf_YyCSrmKg-1; Wed, 02 Apr 2025 11:19:35 -0400
X-MC-Unique: 842axEJkMYOQf_YyCSrmKg-1
X-Mimecast-MFC-AGG-ID: 842axEJkMYOQf_YyCSrmKg_1743607174
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso41870445e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607174; x=1744211974;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zkO75VreSZu1lFdypQ+CJZAvR0Zh4kHAiVcMIutv8kg=;
        b=AbMKPUxPz7FtH1u1WIrHpEH1bHdeKvzVdV+dSNraDH7ZvzG8kv34IGbw/KYXg5NBCF
         3rM8wuUl38m+ebhqLvkeX/JKj4cSdcLwH5vmF3rUahpt3R/aZ1L5m2MfisLdyHtR10aM
         d0jvI4wrQ0zaCsjT+tPdun5noE/f4RYBcwgiJQb8vIYTtnOttW0PYa5UF1i67veVABjF
         OQXMgmxgygHvjsMPW64arDvsGp0DDfmoPK46TunCsK0iz2g9Lh8jd43Pgtmzfn0yi35E
         KxrGnUsqAFye25m3b2sT7cloEIWPfWdiJx2NyHD+ezDIc75mg3NVN1bFpLFQgrO1+3YJ
         E66Q==
X-Gm-Message-State: AOJu0Yy5qaAXP3lWpgl4uR8cY038kOJL+cVbHAPYt1JXc0b3bSVmiXxw
	6m7KhLdQCLtdkHe4j6uI/kTJ5Mt3DZYBpAQDb3CPaguPcUTP5pLp4u/DrTKyp/mTOOlz973t8sN
	p3rt/H3AFebGLLwSs6LzCqwFTzwHqiTGMDloLZbDsNSUIjR6SE84tBxBgolOClg==
X-Gm-Gg: ASbGncsCJ8hZvzr9n1JhkPMiCsahy75lA+mvWnmiaL+G92ONl3c1Y/vLsSgyFUXEA0P
	1tIgPJ5ojb/8tGRgSaSMSP4uVTnSJyhcFlAvg/H47weHj8koaGynyj9V8Mti+AJiwmgxd/d35d1
	d6AG+zudlNphkw0OR17/tguE87rRnFXHryA2REIYMff+MOLkXJdRWKXeWxQZyEO76DNP3TJH5DX
	2oUFmxzxQvl8Li+f935wnwsPygB7/SwKNJOlwIGgi21P8qHT1C77Br8NeUl341GxhIIfY4cYM1C
	nQfc869ZltENKRqpIBFKMBt7VFB8U+D/bx8nkDVscQmaKZpQiCW+P8AUz55DZ6TtUnC2/D5Jk4q
	Od9YXDZ79FxIEjtz/2WlkNsr3TatSA/ciMhvgrltU
X-Received: by 2002:a05:600c:8705:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-43ea7c4e749mr79640095e9.5.1743607173722;
        Wed, 02 Apr 2025 08:19:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPjbS94qju7di3RJO/b8w+vD3z2FiXdzQcWefg1kxfHCUqLYRK+ZRy0vabOEwZIF6pnSxHoA==
X-Received: by 2002:a05:600c:8705:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-43ea7c4e749mr79639805e9.5.1743607173344;
        Wed, 02 Apr 2025 08:19:33 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70f:cd00:4066:4674:d08:9535? (p200300cbc70fcd00406646740d089535.dip0.t-ipconnect.de. [2003:cb:c70f:cd00:4066:4674:d08:9535])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb619133dsm24497405e9.26.2025.04.02.08.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:19:32 -0700 (PDT)
Message-ID: <46f62096-03ed-47fc-a522-64cb2bfeb361@redhat.com>
Date: Wed, 2 Apr 2025 17:19:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 xingwei lee <xrivendell7@gmail.com>, yuxin wang <wang1315768607@163.com>,
 Marius Fleischer <fleischermarius@gmail.com>, Ingo Molnar
 <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Xu <peterx@redhat.com>, Liam Howlett <liam.howlett@oracle.com>
References: <20250325191951.471185-1-david@redhat.com>
 <abd1c60c-e177-4468-b097-f637bda6ff3c@lucifer.local>
 <f1544453-7bab-4e65-a6f9-d93aaedb8314@redhat.com>
 <54b3a9c3-f39f-4b58-9695-d4303341ec3d@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <54b3a9c3-f39f-4b58-9695-d4303341ec3d@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.04.25 14:31, Lorenzo Stoakes wrote:
> TL;DR is I agree with you :P I'm not sure where to put R-b tag given you sent a
> fix-patch, as this is obviously smatch/clang-broken as-is so feels wrong to put
> on main bit.

I'll respin! :)

> 
> I guess I'll put on fix-patch and Andrew? Are you taking this? If so maybe from
> there you can propagate?

[...]

> 
> If that handles it then fine, let's just init to 0.
> 
>>
>> So this should be working as expected? No need to add something on top that
>> makes it even more ugly in the caller.
> 
> Yes, agreed, if this is already being handled in the one hideous place let's
> make it hideous there only.
> 
> But maybe a comment...?

I can add that that function handles the need for actual untracking 
internally.

[...]

>>>> +
>>>> +	/*
>>>> +	 * Duplicate the PAT information for the dst VMA based on the src
>>>> +	 * VMA.
>>>> +	 */
>>>> +	if (get_pat_info(src_vma, &paddr, &pgprot))
>>>> +		return -EINVAL;
>>>> +	rc = reserve_pfn_range(paddr, vma_size, &pgprot, 1);
>>>> +	if (rc)
>>>> +		return rc;
>>>
>>> I mean it's a crazy nit, but we use ret elsewhere but rc here, maybe better
>>> to use ret in both places.
>>>
>>> But also feel free to ignore this.
>>
>> "int retval;" ? ;)
> 
> Lol, 'rv'?
> 
> Maybe let's leave it as is :P

I think "ret" is used in the file, so I'll use that.

> 
>>
>>>
>>>>
>>>> +	/* Reservation for the destination VMA succeeded. */
>>>> +	vm_flags_set(dst_vma, VM_PAT);
>>>> +	*pfn = PHYS_PFN(paddr);
>>>>    	return 0;
>>>>    }
>>>>
>>>> +void untrack_pfn_copy(struct vm_area_struct *dst_vma, unsigned long pfn)
>>>> +{
>>>> +	untrack_pfn(dst_vma, pfn, dst_vma->vm_end - dst_vma->vm_start, true);
>>>> +	/*
>>>> +	 * Reservation was freed, any copied page tables will get cleaned
>>>> +	 * up later, but without getting PAT involved again.
>>>> +	 */
>>>> +}
>>>> +
>>>>    /*
>>>>     * prot is passed in as a parameter for the new mapping. If the vma has
>>>>     * a linear pfn mapping for the entire range, or no vma is provided,
>>>> @@ -1095,15 +1108,6 @@ void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
>>>>    	}
>>>>    }
>>>>
>>>> -/*
>>>> - * untrack_pfn_clear is called if the following situation fits:
>>>> - *
>>>> - * 1) while mremapping a pfnmap for a new region,  with the old vma after
>>>> - * its pfnmap page table has been removed.  The new vma has a new pfnmap
>>>> - * to the same pfn & cache type with VM_PAT set.
>>>> - * 2) while duplicating vm area, the new vma fails to copy the pgtable from
>>>> - * old vma.
>>>> - */
>>>
>>> This just wrong now?
>>
>> Note that I'm keeping the doc to a single place -- the stub in the header.
>> (below)
>>
>> Or can you elaborate what exactly is "wrong"?
> 
> Ah ok maybe I just missed this. I was asking whether it was wrong, and this is
> why maybe you are removing (perhaps, not very clearly :)

Ah, sorry. Yes, it's just deduplicated to be adjusted in the other copy :)

[...]

>>> Can I say as an aside that I hate this kind of hook? Like quite a lot?
>>>
>>> I mean I've been looking at mremap() of anon mappings as you know obv. but
>>> the thought of PFN mapping mremap()ing is kind of also a bit ugh.
>>
>> I absolutely hate all of that, but I'll have to leave any cleanups to people
>> with more spare time ;)
> 
> Lol well... maybe at some point I will find some for this... when things get
> ugly enough I find that I make the time in the end ;)

We're kind-of attaching metadata to a VMA, that is not directly linked 
to the VMA. And the duplication of a VMA cannot handle that, so we defer 
copying of that metadata. Hm ...

-- 
Cheers,

David / dhildenb

