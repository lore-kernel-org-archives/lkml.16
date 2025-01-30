Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCD01E9B32
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 15:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738252765; cv=none; b=orz1RLnsK2TK5+aMhuBB3EyOByyUS+zmuDbhbgYZoMLg8U+dVg0Nvom8R1f4NzCwx8ND826arJVZJSCOTywu9ZM/onuRu6QmMqsKX6DPD6Wr+Qp7o0Y7XXROW5xOUM07v4LVhF0sBiR1DwVZZAm28uCFEcwWywj9+13+mWsQAMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738252765; c=relaxed/simple;
	bh=f2B99J7Yvz/7QhcJPIgqw2TAC22sA4fNZSH2XGXRO68=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VU6Wry2vnb+XBRQRpvGHJpjAzyB0JOiV3cA8kMtvPjRJWW/5g0FDJ2K+jOjU+j3cZeW1O9Vh0A/20ZrpvVfdf7xOW2QVLgqmMhygqbHtYdVgt2o1Bbn0AkCcgqwf5Xr3hz+phobbv/jOmaBTnuugGSWQxbRRT3GEU+6bwdh4bzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KFQLE0+x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KFQLE0+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738252763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=DsnUIxFI2s6Rz4ZTdh0EYdszbaLS5S9D8bAJj6V8Zjk=;
	b=KFQLE0+xwllXgNWe0mWuVPWjyLs4+z0poanetdkeErLALxAZqoVnMfPTHYqL3M92OhiHdt
	Qft+OLXyTiIEGyTrQlmG2+ESbrxP3coHXbnlZsJ3yUSw/S4yliRokhDggyXnf/hyH+XhsD
	WwCkGDLEfwUXbwcmPs38ZtNqcWxuj8Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-MLmkB8RaMP-E0L_T6_2vfQ-1; Thu, 30 Jan 2025 10:59:21 -0500
X-MC-Unique: MLmkB8RaMP-E0L_T6_2vfQ-1
X-Mimecast-MFC-AGG-ID: MLmkB8RaMP-E0L_T6_2vfQ
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43625ceae52so4983145e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 07:59:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738252760; x=1738857560;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsnUIxFI2s6Rz4ZTdh0EYdszbaLS5S9D8bAJj6V8Zjk=;
        b=dUq4GUhirVWq/GHJO+ZcdPbcDW7NDyLGa3rh1LFgfIyl69ufZbIOA9OPiNYqcIyGOk
         GRWj+GMjxO9Yz8LoQZqbtxIwp5WBLBUHdo+O/lmv8dlBdOSJpR0D0cSNTOxN+makozOn
         LmpZ35Lqn+ThGE8dhs4Cq51Bmo7tLCxv5OEwxz8fJEdLJliemdyBAE4LdWG+01UYJj9C
         iu5mIf1IDR5aPHqCEQ8LsM6b0obbXzhvhx75KmGRVuki1NDvutxGcOWCMbDcnLTppkRx
         IhgIV+sRd3DleTalrmhCp916E1Tqe1b/THzIPGVuqubi8ot9GSj+cX4GRy2utL61dz2M
         r9/w==
X-Forwarded-Encrypted: i=1; AJvYcCWOON9fbXT4RfDR7nOyNXicxPy2bnSR04CL3cd+Cp0EQq+BB0+dk33jW+nzmR7atA4b96hoIikLVV1JMdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX94NuCDvfN20Q3sRZzkahn9Iwo+hviW7tS6xCMdG9rfm5tF33
	Oobm3zm3pCGu+UlIwPys0gGh62gFWk+UBcJgj0Y5FX1tXnHz1mmug8cjo/nWtDlD4XgJTcoQdzV
	pRHvXIBiPEj4gP7qkU3S2JKNCXj2s2eY+qSXo2oGzoOHqhre6M4eTGB0xvZqo3w==
X-Gm-Gg: ASbGnctVL9zw82+2zpfPTpP3PFVWjeZn6/9pUpLeT5bbpWGwHEKKKVaPM8A946CTE8H
	wC35LLQPQ9RbobZASxKL82alpy+R634hS0jkFTCPLGnv6v0DtVbi0suLIrfqKSjAKXhjoJlWtnC
	tqPEWAI8IPX35KL9zGtcl9aA1++HvaRYyPEc4osWP6jLUOMXGmGY+a3ubWxoGDqWNiNXkbNTEdb
	SHctvnIq2etf/LpJhk7eMUiP3+uqw+GjuaMaC3TeCa293Belw3RFl67sOHFllRBSxs4e3Xo6QsW
	Y33jBvXqA5d2qmWNAunc4nl4V6UXnBGVsNRSyh817NtEGGDx3lyb9plAnZ+kl8wSKj5HPbyyTmE
	eoJVWlDAA8oVr8Wp05sJiH8eh6pOyZOYu
X-Received: by 2002:a05:600c:4e52:b0:434:9dfe:20e6 with SMTP id 5b1f17b1804b1-438dc3fc2b0mr67980895e9.23.1738252760154;
        Thu, 30 Jan 2025 07:59:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3rx1FCxTfK9dT4GZUYFii4gIoyAgygN9uLXGcwSeyv5w8U63P6tIrS8/LxKqXr0qRCsRl9g==
X-Received: by 2002:a05:600c:4e52:b0:434:9dfe:20e6 with SMTP id 5b1f17b1804b1-438dc3fc2b0mr67980555e9.23.1738252759687;
        Thu, 30 Jan 2025 07:59:19 -0800 (PST)
Received: from ?IPV6:2003:cb:c713:3b00:16ce:8f1c:dd50:90fb? (p200300cbc7133b0016ce8f1cdd5090fb.dip0.t-ipconnect.de. [2003:cb:c713:3b00:16ce:8f1c:dd50:90fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e245f41esm27323025e9.36.2025.01.30.07.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 07:59:18 -0800 (PST)
Message-ID: <9f59b475-232f-41d4-bd6f-7f84111062ac@redhat.com>
Date: Thu, 30 Jan 2025 16:59:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/12] mm/rmap: implement make_device_exclusive() using
 folio_walk instead of rmap walk
To: Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-5-david@redhat.com>
 <7tzcpx23vufmp5cxutnzhjgdj7kwqrw5drwochpv5ern7zknhj@h2s6y2qjbr3f>
 <Z5tI-cOSyzdLjoe_@phenom.ffwll.local>
 <54a55ff7-38c8-42c2-886f-d6d1985072a9@redhat.com>
 <Z5t34-0K9FJKVQe6@phenom.ffwll.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z5t34-0K9FJKVQe6@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>>>> Note that the PTE is
>>>>> always writable, and we can always create a writable-device-exclusive
>>>>> entry.
>>>>>
>>>>> With this change, device-exclusive is fully compatible with THPs /
>>>>> large folios. We still require PMD-sized THPs to get PTE-mapped, and
>>>>> supporting PMD-mapped THP (without the PTE-remapping) is a different
>>>>> endeavour that might not be worth it at this point.
>>>
>>> I'm not sure we actually want hugepages for device exclusive, since it has
>>> an impact on what's allowed and what not. If we only ever do 4k entries
>>> then userspace can assume that as long atomics are separated by a 4k page
>>> there's no issue when both the gpu and cpu hammer on them. If we try to
>>> keep thp entries then suddenly a workload that worked before will result
>>> in endless ping-pong between gpu and cpu because the separate atomic
>>> counters (or whatever) now all sit in the same 2m page.
>>
>> Agreed. And the conversion + mapping into the device gets trickier.
>>
>>>
>>> So going with thp might result in userspace having to spread out atomics
>>> even more, which is just wasting memory and not saving any tlb entries
>>> since often you don't need that many.
>>>
>>> tldr; I think not supporting thp entries for device exclusive is a
>>> feature, not a bug.
>>
>> So, you agree with my "different endeavour that might not be worth it"
>> statement?
> 
> Yes.
> 
> Well I think we should go further and clearly document that we
> intentionally return split pages. Because it's part of the uapi contract
> with users of all this.

Yes, see my reply to patch #3/

> 
> And if someone needs pmd entries for performance or whatever, we need two
> things:
> 
> a) userspace must mmap that memory as hugepage memory, to clearly signal
> the promise that atomics are split up on hugepage sizes and not just page
> size
> 
> b) we need to extend make_device_exclusive and drivers to handle the
> hugetlb folio case
> 
> I think thp is simply not going to work here, it's impossible (without
> potentially causing fault storms) to figure out what userspace might want.

Right, I added a link to this discussion in the patch.

Thanks!

-- 
Cheers,

David / dhildenb

