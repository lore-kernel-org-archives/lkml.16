Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D51D2798E6
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745856910; cv=none; b=sMvcxyL2iErYjNdI2ulKSQmZi94yoouitEHlAa1uoM8hTmT/YvWHYASUpa2I1gA0bfmEa8GOFUqBmonV3uAha/iPnOj/GhhSt32dClPBt6M1O/Kz3x+j+1aPZiSf949IJEg3ibujO5xsD7udh3dFMKzXcVeQCiF4sByyMJuFo3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745856910; c=relaxed/simple;
	bh=Rq9gbpQXJ9fZGX8usBgFaaJ8SOHAqKL50LuYqNIUibM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DdYkVJue0hDlhVWEE7pF2xuL1EP/7Bz/N5w729Zvjip1GeH9qzRRmbT4ACJqk5vhMtVYe12oi966cTNJmLe2gYAwY9fhChz2kxdyoJrIi3+/ksccd6YJJVAQJ+O0Q+d1I/Z9zWOFdZNcipVvNIGY+esAJdN3/TaqVb+gaAJVKPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=if/7w/vw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="if/7w/vw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745856904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mjJ99tBsBuWDC/A8a87VaJBRW/3oANaQLfcx6YawuMA=;
	b=if/7w/vwQmNUKtBkxqXDS9x2WjWuzZgYvu8cT1lcRSAtdZnl3IMLdp36WpSl4yKSQJjHkb
	XiPeXuufho7kRbxHTkqKuxqXcSziyFjZbFAMie+dfxwaA06j2PKGIW2P3vWkNBIAHhYEyv
	287jUEZk+jN3ngLKvK54OBsO5FV/kYA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-jAfgEWwaME2xiLVFk4taoQ-1; Mon, 28 Apr 2025 12:15:03 -0400
X-MC-Unique: jAfgEWwaME2xiLVFk4taoQ-1
X-Mimecast-MFC-AGG-ID: jAfgEWwaME2xiLVFk4taoQ_1745856902
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so24923685e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745856902; x=1746461702;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mjJ99tBsBuWDC/A8a87VaJBRW/3oANaQLfcx6YawuMA=;
        b=EXPXJvzG1hr2hRtFnxKktiCYxt5k356vGE19nfiV72tZD/XspJOIGRRUe6S7O0Lm8p
         ekfS8LY5pdQln1dZZwcrnWetx+gn6gQ/5wRsfbV12s/P4ePRNyYyY873Xl0SOfopmDyx
         sotsGQ65RTxLzTP/a3vDxXgW9dM4iFtdg0BgPrI8kPf00YNXxLXnqxEpXPf16tOuPrRl
         chzASoHrlOffTcRu7gSquxLqWPMMBBxAcSvn61n0TWmecguJfdkc81YU8GYKkTC2TiRJ
         upa6MLDfG2RZ3p2zl32AqZ9vQbWqy9mOgadmjaos6rzw261xqW2fLe81I0+2jzn2NHB7
         HZZQ==
X-Gm-Message-State: AOJu0Ywed2q+9V7pOzu+jABpA/pXaiVoKQ47jKV1deHbmzSdeZH7ehjf
	l3bIOIIR+6xvFrDq2h6Q/Sw0yXtDopiROEF0jH4n0/NLGDX3eFqt/U/0/loXZePjc/p7cCvlPgZ
	nabVo2fW0+vLU8dGUIR4U05saOP768E+eFq9roMV9+SjfcvMaETZBAA/GJ9ZyVw==
X-Gm-Gg: ASbGncv0qt3EFloafTZ/mGEq4cWYBDVy/akksQ1P5Xh9j+E7kTX5W+T7t32C2w+pgPW
	iX0Rx/lWILVVB7kiCTaMxItHBUVIdcyDWrQzVqb1RA4Ic3E2RZl1QsWv0y6/8SP8KMqmmJqol+X
	yoUBgCtNK2QLLJEvATgLGY4v66yurpZw4JCt7nCGJ/meNcLVT2SnT7RcleoJf0/4TZOiVxayQzK
	DL0EYTAX1Af6AqLqKRAtfHJXQ5UdgeZtxU0Ubbzhn/ZHi7wSCyfagubz/AFSw0oFiXDorz8VvkZ
	TQVTfzctRyPZpuZKGOp9wOFejPITVVP/iu0iUz9n326dsuyV6xQ8HJ2pUL3IxpJe3cnuZANVrQc
	6AJhtx1JnreF2T6G1n0/zLb4gDjqT2l1DW1MByg==
X-Received: by 2002:a05:600c:4f81:b0:43c:efed:732c with SMTP id 5b1f17b1804b1-440ab8722e8mr62094635e9.28.1745856902016;
        Mon, 28 Apr 2025 09:15:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHf7xoVWGe8POH6/bAu4Zm1T2P/Ns6FQlhV/6P/Tg1uN3kkn8wReO0mmLvPeggLU1mpCqiyHw==
X-Received: by 2002:a05:600c:4f81:b0:43c:efed:732c with SMTP id 5b1f17b1804b1-440ab8722e8mr62094425e9.28.1745856901631;
        Mon, 28 Apr 2025 09:15:01 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f32:c200:9add:4a7a:46aa:f740? (p200300d82f32c2009add4a7a46aaf740.dip0.t-ipconnect.de. [2003:d8:2f32:c200:9add:4a7a:46aa:f740])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2e00d8sm159297655e9.35.2025.04.28.09.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 09:15:01 -0700 (PDT)
Message-ID: <d9b32bb8-fe69-48d2-9b9b-c1a4af231f93@redhat.com>
Date: Mon, 28 Apr 2025 18:14:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/11] mm/io-mapping: track_pfn() -> "pfnmap tracking"
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
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
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-12-david@redhat.com>
 <07a780ee-b2fa-4eb3-a340-175d7c18a0fe@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <07a780ee-b2fa-4eb3-a340-175d7c18a0fe@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.04.25 18:06, Lorenzo Stoakes wrote:
> On Fri, Apr 25, 2025 at 10:17:15AM +0200, David Hildenbrand wrote:
>> track_pfn() does not exist, let's simply refer to it as "pfnmap
>> tracking".
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> LGTM, so:
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
>> ---
>>   mm/io-mapping.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/mm/io-mapping.c b/mm/io-mapping.c
>> index 01b3627999304..7266441ad0834 100644
>> --- a/mm/io-mapping.c
>> +++ b/mm/io-mapping.c
>> @@ -21,7 +21,7 @@ int io_mapping_map_user(struct io_mapping *iomap, struct vm_area_struct *vma,
>>   	if (WARN_ON_ONCE((vma->vm_flags & expected_flags) != expected_flags))
>>   		return -EINVAL;
>>
>> -	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
>> +	/* We rely on prevalidation of the io-mapping to skip pfnmap tracking. */
>>   	return remap_pfn_range_notrack(vma, addr, pfn, size,
>>   		__pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
>>   			 (pgprot_val(vma->vm_page_prot) & ~_PAGE_CACHE_MASK)));
>> --
>> 2.49.0
>>
> 
> However this doesn't apply after commit b8d8f1830bab ("mm/io-mapping:
> precompute remap protection flags for clarity"), so will need a rebase :)
> seems this was cleaned up to separate the __pgprot() bit from the
> remap_pfn_range_notrack().

Yeah, I reviewed that just today. Trivial conflict :)

Thanks!

-- 
Cheers,

David / dhildenb

