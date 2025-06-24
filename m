Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D2F27AC3C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750766765; cv=none; b=vEZP0Ozafea9v54G4SWMxIfxQpLcWK+HfJF7orv9FsFHfFh3/upDye2oP72+mcygnZsUrHvQWwbJT9+e+O02CEgwzpNuY70ikmUFMi3fJUGTaH9yw+LfQgGRGc7CsCjfHgmT9l9h7Y/XcTmFEKuS7jt1LdzcGOo6HzSLbzD55/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750766765; c=relaxed/simple;
	bh=cRmpRfemqqA/+yXgtDpnfKpTjig+icCUPqTL/uuKBy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tLWiDJCtk6HV9twrtNKBJQWAtvDOvoXZQXzYimrZCSP/L2ZvaZ7KU8It7nRWxYAL3akuIFtZqcpN7HnR7ucq1nMBMXPZ7SBFI2GVlH9tzY6+nTYM7KUUdK63q5eVOVMCgpgkn6bFd602NWjva/1/dohjLpTCL5UB5oDE2wGPHsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T2RiHJhs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T2RiHJhs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750766762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+uT2QrEu3JBacOK9/mwO5Vgn+kaJFcPAQ/50NYPay6A=;
	b=T2RiHJhstKrDLHGP3Ua7OCXWd+gxMm+x0aGR/4zXR6bxt6FlsvCMwaZaLOG5WN5GBZKYy0
	S18fLd1qXHjzzl7OQBv3c7rBCmXFtco/PMd1UKwx94SzZB0dgUakhDbZY1hEc6udIqqZzv
	W5sj+Kbj6OShVGRaSVqsXarBBT/Y9rM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-Dyz6Wj9vODy5LByDO_ws0g-1; Tue, 24 Jun 2025 08:06:00 -0400
X-MC-Unique: Dyz6Wj9vODy5LByDO_ws0g-1
X-Mimecast-MFC-AGG-ID: Dyz6Wj9vODy5LByDO_ws0g_1750766759
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-452ff9e054eso1873955e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750766759; x=1751371559;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+uT2QrEu3JBacOK9/mwO5Vgn+kaJFcPAQ/50NYPay6A=;
        b=ISUpwf/ONeofp2LKSnqKdq0GSVDKaa9bb54u7LluW01+dhsbzsfJQCNQspo/zMOFw+
         9EGDI9qBjeTBfI+juDHRhw33wQRTHkOROKjJRr3Bq2uj/cAOoz1NoMEUDRHlHZZXDR3F
         ReZUQqd4cc4EJZrE9irRWBlRjhlQ/8qVqgsIOTZXBPEhICm139J0qNNOETYi8Fa2Jh65
         wr4cB5h20GraLKpeHRgDfySNKgEbLbyfl3YyOpscEw7NeiPdmUQoSNm1cY+x7eFaK8Zt
         eDTdXULh1/kk0K1h+rlYAINPLaT8hhyw/0CgvM+APyl9IlhNBZ+ZWR1i7fdfOhwm32Nr
         WJCw==
X-Forwarded-Encrypted: i=1; AJvYcCWrPYdBB+wDIyax3sLN62WJQZXi1j5e+i0fr9Y5eLUUA19ar9eMV/eI3zkozW+Ms1rxwQW2zDH6AFD84a4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK6WMbs1cwARR4VC39n1Rf0jhOj5l3rz73RFdtTVrNfGV623Zp
	7xvznxpb1AMHSOK5CidpjDIbiAvHkotP4v5yJeFAUYXzQsFYe6e/dViaIXhtxTmnjOaZdXcvs76
	oiywFiUoYSsfX9SlNXj0slansU6jrx57zYMqnR3jCFFbI9TTS1Qwyo+ve/74M9fyASw==
X-Gm-Gg: ASbGncvGef5gyCewHBuIq/0usorW2F9rosL12Mez+58Gobi7Mojn3pzsBBvZxkou30D
	jeBM0F3YctRBjmuQLqtTmq30jUWphX8MwM/gav5Kx5cKRVujDAy2N2fuJPX3w4WSwPhzuSGYcR/
	jcBR0mYtQx/caKQWckpNesF4t2LDIXLPzr6h2Mxe1HrMXOfN+JzouF7RQvDblOn5rvsCj06r2zA
	gx/KlHqOFWgWDQgwYX/eOxvZ0qJprfCj5HdzEaOLvcpF44dxhK9p8JchX448SSIZ8Ig044/qvCd
	CLLZtcyr/+7oVdHB9LQ5j/lYK1XHIpJe0Ph00Jhm6vIOsrEXnP1C9IM=
X-Received: by 2002:a05:600c:1546:b0:453:1058:f8c1 with SMTP id 5b1f17b1804b1-45365392159mr156614385e9.3.1750766759239;
        Tue, 24 Jun 2025 05:05:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELryh1kt+1zAYTxf1LpvxqF7CDIIWxDENNxcO8+DQqC72gxoFR9I0jUhp/amk23QomNeU7aA==
X-Received: by 2002:a05:600c:1546:b0:453:1058:f8c1 with SMTP id 5b1f17b1804b1-45365392159mr156613545e9.3.1750766758614;
        Tue, 24 Jun 2025 05:05:58 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4537ab293d8sm32060615e9.28.2025.06.24.05.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 05:05:58 -0700 (PDT)
Message-ID: <08ace5ea-ca09-4506-8ebd-016e8061c51b@redhat.com>
Date: Tue, 24 Jun 2025 14:05:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Pedro Falcato <pfalcato@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Suren Baghdasaryan <surenb@google.com>, Matthew Wilcox
 <willy@infradead.org>, Rik van Riel <riel@surriel.com>,
 Harry Yoo <harry.yoo@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Jakub Matena <matenajakub@gmail.com>, Wei Yang <richard.weiyang@gmail.com>,
 Barry Song <baohua@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <7e51e1e2-7272-48d5-9457-40ab87ad7694@redhat.com>
 <b65dd020-5e02-4863-8994-def576e3d3dd@redhat.com>
 <76zi626uk53dtfzmezzt6cfz45ansam2gpcumddqxnipnw5jkh@qwfzoxgi255b>
 <68d8c7ad-aea0-4556-be63-9b67d70e4386@redhat.com>
 <58560256-58da-4fa6-a953-d2c4695ffba8@lucifer.local>
 <tc466z77itm7qps5exnelcp57dabnvn2gtd2tigutaivulmowh@4n74ymr5yxtg>
 <c1586ce3-e354-4b8d-aaa4-5f9899faae88@lucifer.local>
 <5ff81ef9-e755-4a75-bcce-92c4a4d1da6e@redhat.com>
 <7ae2e19c-10f6-4121-bc15-dd07c11b197a@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <7ae2e19c-10f6-4121-bc15-dd07c11b197a@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>>>
>>>> Or: separate but maybe awful idea, but if the problem is the number of VMAs
>>>> maybe we could try harder based on the map count? i.e if
>>>> map_count > (max_map_count / 2), try to relocate anon.
>>>
>>> Interesting, though that'd make some things randomly merge and other stuff not,
>>> and you really have to consistently do this stuff to make things mergeable.
>>
>> Yes, I'd prefer if we can make it more predictable.
>>
>> (Of course, the VMA region size could also be used as an input to a policy.
>> e.g., small move -> much fragmentation -> merge, large move -> less
>> fragmentation -> don't care. Knowing about the use cases that use mremap()
>> of anon memory and how they might be affected could be very valuable. Maybe
>> it's mostly moving a handful of pages where we most care about this
>> optimization?).
> 
> I think fundamentally there are two problems:
> 
> 1. Unexpected VMA fragmentation leading to later mremap() failure.
> 2. Unnecessary VMA proliferation.
> 
> So we could fix 1 with a 'allow multiple VMAs to be moved if no resize'
> patch.

Yes. Which might end up easier (well, okay, different level of 
complexity, at least not messing with folio->)

And of course the relocate anon stuff is about 2.
> 
> In theory we could combine it, but things could become complicated as then
> it's mulitple VMA/anon_vma merges.

Yes.

-- 
Cheers,

David / dhildenb

