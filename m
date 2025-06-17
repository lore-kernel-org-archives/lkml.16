Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F904229B28
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750150424; cv=none; b=UD14Hi8UEt6ccbRLMM3xq5PYU0eIO3SVwsQMo6kxNmtmLqYPlXqY8oZhvFo9bBTOvlzvb0Qgewx8O24VHV1rW8ll9VgBEJx3AZh7brWFKDsCrDZG96tiVHx35QovFSbKDgdawN9xTDv22+Bo6Om9ficT+0GXmSePVFiYGXS5ZP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750150424; c=relaxed/simple;
	bh=ItU+XsrGvipBI2A6JHV+/tTvLv1PHg7A90jssuw/vD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IrrFziH6I/bmta4z+Rhal4o+7WQTXATvvmkisZQoKAzDQC3eCpjWSOW//KXXurrAXrh08j2QAPSC9q17nsz0dp2bgHacldOhf7VluUY/9aPYh1oyyjt/MZqwng0cwB4FIovdkCzfol8U3IqHV2u4A1EgGtILR96yIt1LuQ8f/9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LD7EG5CY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LD7EG5CY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750150421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=n75ywC+lji4xWzIGfH5c6xT+JWa9B8/GOwQDyGCLmrU=;
	b=LD7EG5CYds7yKrMhYH6XAKiIza6SknpJasT/UpAHZVzsAMtOIGRgRzKJeEprCaVZmIxEru
	XDq3Jz5miwXyV8divUKwyw+a7UuOsh95da+N9gSXuaYsdzWo2xhVubnlhvstJAqRHrh8HL
	JDXpi2G/tXy5h44u2ONHX42pDQaADqs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-zRM-97UxN7-D9d14bhBmBw-1; Tue, 17 Jun 2025 04:53:39 -0400
X-MC-Unique: zRM-97UxN7-D9d14bhBmBw-1
X-Mimecast-MFC-AGG-ID: zRM-97UxN7-D9d14bhBmBw_1750150418
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4535011d48eso8802945e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750150418; x=1750755218;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n75ywC+lji4xWzIGfH5c6xT+JWa9B8/GOwQDyGCLmrU=;
        b=Mg7p1Y0pRx/iQhKPN8UV2iJ6q5nhwfyPe02bsk341owu2y8HJqvOkkkiAo5uwiEa1Y
         91bSkKGa9wkV4X1ZxoIoimQI0N9JM+P/BUga3c+CDoHNDTwgDBuMi+P8j5kL1QAXokzM
         RVpSzS/cfHMqEaJycmbGGVUa0Q2Y7G2Z1OMX3cjjzkvXa7LQoNQ8igziZAtHTBRjyvSd
         cIkUVLdmlCASmeUXPFGs+Uyb2mcppRg3WP/nJ39SIK8MeIv5j5Y9YxdO41pc0siwnEG2
         U+hlwhz8aaNLiVrwK8wHE6HtoWa0gGUK18x8a7UoL5+mUi/pe8KoVWgUttqc8qgqa1ot
         2bsg==
X-Forwarded-Encrypted: i=1; AJvYcCUNvJSupeVKgGlYY/sVGT79vI+spUU7iwYkOyxABG/HKxs+oonrFVJtl2RXhN4Yix8AyERKIXUFc0AkGhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzfCCGjHCEQ2K7a1BHlXWiHF0Sgnkl71Q54gzdxjnGO/KRgepq
	2XXgE2l7JcCsk+vtCTauopsxigwg6cuEAUFqj8hcVSReetX+RvOIY2tMUin6T62819xFnj4JfdL
	nhGJR2+Aas4KqrlwOlCiP4cYnriDz9i8qaYDHr2wWluoMv1KW6GBrlFVPnCoFzCxJNw==
X-Gm-Gg: ASbGnctwhD69n77T43Q5F1LbwVdwgRiFyzn/f3U7TjDBtj2Q5wkVyT4ZApX1FI04T8j
	XBbXVE5utPYK9JEANlo9xYYxJvD2ne8mCkrWwmWBQUhQuEqUx8s3YFulEuWNuaPmNzFT1ONGTc1
	kC+IoCRg40ob2w3hyksCfrRFud2bPIw3J49o5QeP3nbdblYVU0odXFizBZsidiXhxdzZ2q4frvE
	dyOyLMCuE234p3CY92WC2sZRveQ6Wf/+Jbs2+Bfhi2i0si9xojubhJZVrot0HGn2cJO+YvMBpK7
	yuaZh567BctOJ0RRl9muuTdef64Jj/Hl+at+z0gxnKnWJ3J1uAB+p3vIXAN5g/vZ1t5oxytp9SS
	jKoL3y+kjqAlAHw9ONq88PUD00PARPrHwYBhzlGjzN1Pi8yE=
X-Received: by 2002:a05:600c:4f95:b0:450:d01f:de6f with SMTP id 5b1f17b1804b1-4533ca84626mr137639955e9.15.1750150417659;
        Tue, 17 Jun 2025 01:53:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaDRw/RoX8w62e6UrALWobNFwwnltpG7zr7E+B0Avy/B0pg2MLhWkP+UcvizgaTW9pN1xW3g==
X-Received: by 2002:a05:600c:4f95:b0:450:d01f:de6f with SMTP id 5b1f17b1804b1-4533ca84626mr137639635e9.15.1750150417292;
        Tue, 17 Jun 2025 01:53:37 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c64esm174224305e9.7.2025.06.17.01.53.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 01:53:36 -0700 (PDT)
Message-ID: <cae9c6dd-650b-47d6-888c-1f3c8f5c2343@redhat.com>
Date: Tue, 17 Jun 2025 10:53:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm/madvise: initialize prev pointer in
 madvise_walk_vmas
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org,
 21cnbao@gmail.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 jannh@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Lance Yang <lance.yang@linux.dev>
References: <20250617020544.57305-1-lance.yang@linux.dev>
 <ab78f4ee-dfa4-4c49-8944-a67546a739ca@redhat.com>
 <e61a7aea-a87a-441f-809c-10acdfb82df4@lucifer.local>
 <f0a867eb-c66d-476d-8391-f8a4e9968c75@redhat.com>
 <9e80cea5-fa78-46a2-b2bd-2f3846c24a34@lucifer.local>
 <e174d4ae-9467-4fd7-906a-d575802aaecf@redhat.com>
 <8aa7932b-e30d-4025-8503-726e01bd7539@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <8aa7932b-e30d-4025-8503-726e01bd7539@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.06.25 10:50, Lorenzo Stoakes wrote:
> On Tue, Jun 17, 2025 at 10:38:07AM +0200, David Hildenbrand wrote:
>>>>>> 	vma = vma_modify_flags_name(&vmi, *prev, ...
>>>>>>
>>>>>> We should use Fixes: then.
>>>>>
>>>>> So no we shouldn't...
>>>>>
>>>>>>
>>>>>>
>>>>>> Acked-by: David Hildenbrand <david@redhat.com>
>>>>>
>>>>> Sure? :)
>>>>
>>>> Unless I am missing something important, yes :)
>>>
>>> This solution isn't correct as prev == NULL when prev != NULL is wholly
>>> incorrect.
>>
>> I am not able to understand what you mean :)
>>
>> I assume you mean, that we reach a point down in the callchain, where "prev"
>> is supposed to be set to something proper, but it would be "NULL".
> 
> I mean if you tell merge code 'hey the previous VMA is NULL' (same thing as
> saying 'hey this is the first VMA in the address space) and it isn't, bad things
> will happen (TM).
> 
>>
>> That would indeed require a different fix.
> 
> Yes this patch is wrong, sorry.
> 
>>
>> I wonder why we didn't trigger this case so far?
> 
> It's because it only happens since Barry's per-VMA lock logic...
> 
> 	if (madv_behavior && madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
> 		vma = try_vma_read_lock(mm, madv_behavior, start, end);
> 		if (vma) {
> 			error = visit(vma, &prev, start, end, arg);
> 			vma_end_read(vma);
> 			return error;
> 		}
> 	}
> 
> Otherwise, we look up the find_vma_prev():
> 
> 	vma = find_vma_prev(mm, start, &prev);
> 
> In madvise_dontneed_free() we always set *prev = vma _first_.
> 
> Let me suggest the better fix to Lance higher in thread so he sees :)
> 
> Not sure if a fixes is valid here given this isn't mainline yet, more so this
> should be squashed with barry's series?

If it's not in mm-stable yet, it can still be squashed, yes.

-- 
Cheers,

David / dhildenb

