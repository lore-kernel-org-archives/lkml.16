Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFB9152E02
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745852336; cv=none; b=hbggqy8KVJyptreSwVtGb3s4btS6M4SPAhmMCMQ7Zcvb4+gth7GlhoyA0lRD6gxFv+hyvKbHEsmS151wCXMCx7x7jzyTjtdHSyjddrSNbWlQ0eymKmNsZbJV+cfFdCWKPZl9Y+bBwNpLfDUk0U1cr9emifyRHWml2LZKGQS4ACc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745852336; c=relaxed/simple;
	bh=Zyg8E2XFv1bqoGJ7VDhVPtN4yBHqR0Zdcb8EuS/jYLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XNtk2v8ZbC/RpgmcqCfn7FLGfa+Lxve6VyS7VMpO4hP2O77xeYQkZGRpMx1E6biGEH8pTVeZqZeIjB2Qvtv2fn7dK6NhybD4ho8CogSC1QWyx4RodBJRIk/SlL8s/JSmjYgYqSlIQ7FX9+CF6QO8mUheBqabaJAFQb1/TRPkmbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S5Z94jUI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S5Z94jUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745852332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZueFCsiWmtBLjUIDAe8gB/TP0vcIsNZuwUGWaemypnE=;
	b=S5Z94jUIR+pUDKvrcc7DTyBY9OS7RnjTw+0IO1LiT5RFIcsCoFh09slobtKAMnE5h6iqE5
	lLMn+xhyeMMOshzwykJoCbtLrLqYSoP/0wlbFYKXF4Cttm5ICNz9KohkDvW1BuhVl2QNOe
	7mF6aBapnkAiCwG7Xq4w//Y3h+x9hZY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-tSCwMDj7M1ypfCcAda0pmA-1; Mon, 28 Apr 2025 10:58:50 -0400
X-MC-Unique: tSCwMDj7M1ypfCcAda0pmA-1
X-Mimecast-MFC-AGG-ID: tSCwMDj7M1ypfCcAda0pmA_1745852329
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39131f2bbe5so1264779f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745852329; x=1746457129;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZueFCsiWmtBLjUIDAe8gB/TP0vcIsNZuwUGWaemypnE=;
        b=H4tHxyEME4I1L1zobLVOW5ry2NurzJZSZsAM302u00P5qvCwY0sgMpjQjaqx4/3HcE
         Zje5n4IfoMQQDe1vId1UBHwNCZY2UCAKCD6DHL8JPtFuSthDN7gSNJbwfyqVFwoB+zdF
         rTyPLb66MLO4TORAwjoHXn3iPymlTESknf0XJxiprA7Tm3kCAHrfBK+7wZptr4ZezOtz
         S4GmhiwhDHBM9O3bgVr4TJaPCl8qwBs5o29gAiw3cV6VlpLFBzMFu5di2IvNQJRbh2sA
         n0/ODIUwAcjdw04ReBhuTTs8ZbpnTvZakRZyejRNwECXZRcIKqtKzeDYfh6VZXm5bjaY
         EyWA==
X-Gm-Message-State: AOJu0Yx55km+1np6wqy0MhRA4oF1W9jiQ7sevNzgdB7VVtI1NINanDV/
	7YgVlXFaVMTtJZPWCBttWaS35uJfRz4i/kR5whHepNtnLdPXejbT0BqU9g5f54r287cv/ZPkDsr
	XM21lOllL8yZlGc6CUt43JuwEoD1sehlXXK3N/n1DxJQbNGhWl49LyEbXwYJWIA==
X-Gm-Gg: ASbGncvMBvkG5WQVwyji8IEmZUXfVnO05xUy3CYqEeAuK1XtyvDFVzYGuBhk12dbLJO
	UsO9QlTv1JHJemMcuFFboHAYyOHuqWWdrdF+FC8fw3eu/piDX8eErA7agRHAzKi0dBaEY6hHpaE
	zmRFN/BS8vctN5TO+MGpkGQAKa5LdHCAQrWKsgAqL7qQICpsnqgOfk8D2loGYzdigYtkCiO8jtw
	Uqn/6farqR2RBPigqsaZsbjg55Qk5nIUwzB0mGMJjBdkuJo2DUE9kHvo3Iq9n/2N1jJEh/5s4o1
	SYDzoD8Vf6a0jWIbBTRtszFUjL/Gcd96Xo26PjHTigszU6tohulUWSpeBVRtxwMdF7YxwUMrAx+
	ABD/mN+2YDhPo6NWLCRJHWSH6u7S9en4j6/bZXw==
X-Received: by 2002:adf:ef92:0:b0:39e:dbb0:310f with SMTP id ffacd0b85a97d-3a0894a000amr84717f8f.39.1745852328896;
        Mon, 28 Apr 2025 07:58:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsVRyRmMhRe7AXqWmE0IFCWHOcELnrH9GO+DsOTYX9TpA0nCwFGcKMCVu8PvFBW69BDzN0Qw==
X-Received: by 2002:adf:ef92:0:b0:39e:dbb0:310f with SMTP id ffacd0b85a97d-3a0894a000amr84696f8f.39.1745852328507;
        Mon, 28 Apr 2025 07:58:48 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f32:c200:9add:4a7a:46aa:f740? (p200300d82f32c2009add4a7a46aaf740.dip0.t-ipconnect.de. [2003:d8:2f32:c200:9add:4a7a:46aa:f740])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8da58sm11505210f8f.15.2025.04.28.07.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 07:58:47 -0700 (PDT)
Message-ID: <75998f7c-93d2-4b98-bb53-8d858b2c108e@redhat.com>
Date: Mon, 28 Apr 2025 16:58:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/11] mm: convert track_pfn_insert() to
 pfnmap_sanitize_pgprot()
To: Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org, Dave Hansen
 <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-3-david@redhat.com> <aAvjJOmvm5GsZ-JN@x1.local>
 <78f88303-6b00-42cf-8977-bf7541fa45a9@redhat.com> <aAwh6n058Hh490io@x1.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aAwh6n058Hh490io@x1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>> What it does on PAT (only implementation so far ...) is looking up the
>> memory type to select the caching mode that can be use.
>>
>> "sanitize" was IMHO a good fit, because we must make sure that we don't use
>> the wrong caching mode.
>>
>> update/setup/... don't make that quite clear. Any other suggestions?
> 
> I'm very poor on naming.. :( So far anything seems slightly better than
> sanitize to me, as the word "sanitize" is actually also used in memtype.c
> for other purpose.. see sanitize_phys().

Sure, one can sanitize a lot of things. Here it's the cachemode/pgrpot, 
in the other functions it's an address.

Likely we should just call it pfnmap_X_cachemode()/

Set/update don't really fit for X in case pfnmap_X_cachemode() is a NOP.

pfnmap_setup_cachemode() ? Hm.

> 
>>
>>>
>>>> + * @pfn: the start of the pfn range
>>>> + * @size: the size of the pfn range
>>>> + * @prot: the pgprot to sanitize
>>>> + *
>>>> + * Sanitize the given pgprot for a pfn range, for example, adjusting the
>>>> + * cachemode.
>>>> + *
>>>> + * This function cannot fail for a single page, but can fail for multiple
>>>> + * pages.
>>>> + *
>>>> + * Returns 0 on success and -EINVAL on error.
>>>> + */
>>>> +int pfnmap_sanitize_pgprot(unsigned long pfn, unsigned long size,
>>>> +		pgprot_t *prot);
>>>>    extern int track_pfn_copy(struct vm_area_struct *dst_vma,
>>>>    		struct vm_area_struct *src_vma, unsigned long *pfn);
>>>>    extern void untrack_pfn_copy(struct vm_area_struct *dst_vma,
>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>>> index fdcf0a6049b9f..b8ae5e1493315 100644
>>>> --- a/mm/huge_memory.c
>>>> +++ b/mm/huge_memory.c
>>>> @@ -1455,7 +1455,9 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
>>>>    			return VM_FAULT_OOM;
>>>>    	}
>>>> -	track_pfn_insert(vma, &pgprot, pfn);
>>>> +	if (pfnmap_sanitize_pgprot(pfn_t_to_pfn(pfn), PAGE_SIZE, &pgprot))
>>>> +		return VM_FAULT_FALLBACK;
>>>
>>> Would "pgtable" leak if it fails?  If it's PAGE_SIZE, IIUC it won't ever
>>> trigger, though.
>>>
>>> Maybe we could have a "void pfnmap_sanitize_pgprot_pfn(&pgprot, pfn)" to
>>> replace track_pfn_insert() and never fail?  Dropping vma ref is definitely
>>> a win already in all cases.
>>
>> It could be a simple wrapper around pfnmap_sanitize_pgprot(), yes. That's
>> certainly helpful for the single-page case.
>>
>> Regarding never failing here: we should check the whole range. We have to
>> make sure that none of the pages has a memory type / caching mode that is
>> incompatible with what we setup.
> 
> Would it happen in real world?
 > > IIUC per-vma registration needs to happen first, which checks for 
memtype
> conflicts in the first place, or reserve_pfn_range() could already have
> failed.
 > > Here it's the fault path looking up the memtype, so I would expect 
it is
> guaranteed all pfns under the same vma is following the verified (and same)
> memtype?

The whole point of track_pfn_insert() is that it is used when we *don't* 
use reserve_pfn_range()->track_pfn_remap(), no?

track_pfn_remap() would check the whole range that gets mapped, so 
track_pfn_insert() user must similarly check the whole range that gets 
mapped.

Note that even track_pfn_insert() is already pretty clear on the 
intended usage: "called when a _new_ single pfn is established"

-- 
Cheers,

David / dhildenb

