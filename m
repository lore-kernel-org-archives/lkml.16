Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB11217C98
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744808536; cv=none; b=bZkWDtc0YhU6e2UMOMFR2BCjIhR1wqkwb5c4A0lbjLA7oQZIRgBbD4B8KI0MnM+V4vwcT9fYc39DD5lxEYkeo7uXK71witMlKaYdYq1fmut+yPPaI1y/evLZ6G5njNQmPejylO4Y2iePX25B62SswvBqdbf8s8v7SmaiyYfmOww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744808536; c=relaxed/simple;
	bh=u0R/dZsHxx2IX2pKJbAU7pMJuDlIfyaWybcON6nDxYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tpY9jS7IzAmohlPciqqbCPXdg09FU52nUxUmvfDli+EkPk4u2GlEPbEcXlxRh9g+ZFnhdt3E7SaV6SEkWClTEmd6IsYuTTE49/tQLjR1tQ/4l/j1vAilP0Kn1KJZ79MoeA5DXKMIsezYYbpR8vNi20zCmycFa1Tx/AMbTUQQ+i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ch/rM4uO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ch/rM4uO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744808533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zz9ao4pfRt8feLcsmoEt9sM98Tq2tuye6ACsqAEj5WQ=;
	b=ch/rM4uOCSULM0wLvXTwDRQing8BBFTRVFEkH70LBTCsdMjuof1QA/5yPhuYfnMcqwywrn
	9QrcbXj13HYGqYGViOZq+cGJw9uEPfiqYzxb3LZIDQ+8plvfjAAVwZThQb/S3ksZ9A4Y8V
	/cRcHXio9v2C/J7BL8jtFLv+RdGeOgk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-489-ZGBVZPIcNL6CB86b7YIUJQ-1; Wed, 16 Apr 2025 09:02:12 -0400
X-MC-Unique: ZGBVZPIcNL6CB86b7YIUJQ-1
X-Mimecast-MFC-AGG-ID: ZGBVZPIcNL6CB86b7YIUJQ_1744808531
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so44494015e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744808531; x=1745413331;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zz9ao4pfRt8feLcsmoEt9sM98Tq2tuye6ACsqAEj5WQ=;
        b=TCy0ya5TxYbGZjMAUzY81IEh98h9s6YqtDY+GM08W4O8wv8psw0LofupH8n41tWbWh
         DDfC3ACEV2H7S2YaQ0Qry7k4j6vdyGOo1n/d85dGm+H2CT5fcGDq2gkJ0ydF2FwJj8IM
         nKQybKq80zMfEZYHsNf+oSBAlvL/aToxI35OyDr/ryKVf/ndJ6JsFoxTecIbCuOI9SfY
         S5ieJNP5XIG4PPRxcB2SHtYTOh3iHAOeQxC3tJltcGUbTwy8AUzMWibuOt1omeSsdL6p
         xR7xdj0RMeldESDOE8h8B9LkFsNdIMpOmV81Qbl4OxrqcrrXkIu6cpG64gxCCmrBWKKB
         Z12A==
X-Forwarded-Encrypted: i=1; AJvYcCVQ09N7MM9uJzjPyAbUy15Cg15B7Dromzc4scKJ46SZh4eHQ5HvwB4yCSZKEWvgFPmQ7m1lYipmA9M2JHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSTT0FSQyH3vVjbnPW9ul8fW1v4NKUklJmfCZZKi0x5URF9Xih
	/TShVjtwxRRezf+2Y0ijcDxpFRYeA2iV1BaTp8K+fMcY4KC6RbWo62snzDtMIsiO0dMVvxpQ6DY
	yC1DFm636lrcF/h8KdAMxN+iliWjHyjYWi5j2RmkrLqo5bBs0t0qF3f656FZvww==
X-Gm-Gg: ASbGncsWeLy5rzuVOzM8jhfsdpiFAbtMHZaOyH2GvQm99IRZT3jPKWHJ0ienIViCqcI
	pG3vpeP63Uu7Wlk8tt2crh16FE+lMRycXwef1nYl172lviIrsXXric3wIqhmL9VIQcUh/f1FV2J
	bFJxBSDbcDapr7snQt7FJqJJmXiGxNApzXkK3C7zXunOhgiFm8ACPZzpb+wLqhuKo9kER1ohAuI
	Lf4yKDKOlaCPKaKtu1dkqKjbU3tDs5FW5LUzpT8ESImrQaOfKsZ7lq8MFwM3Ft+RLazYqRm7MMJ
	y1PEiigZIhP/dgnEZaCDDETogleXnJIwWTSVpYWx56CvDfbZIBWLvjPoePyZCdaqzX1LOZkL1GN
	qDhGn9Afr0Kc/hYR6KG+8GTKeLIDH8y86+HgVPA==
X-Received: by 2002:a05:600c:b8c:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-4405d61c914mr21884175e9.13.1744808530949;
        Wed, 16 Apr 2025 06:02:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhIbxqCJvVl/OZOqAG2wUi1ln16TCcknWgM8WbMugYmsqaFj3oyayfzk/fvAEhyfwJe48+qw==
X-Received: by 2002:a05:600c:b8c:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-4405d61c914mr21883445e9.13.1744808530212;
        Wed, 16 Apr 2025 06:02:10 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445708sm17297552f8f.96.2025.04.16.06.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 06:02:09 -0700 (PDT)
Message-ID: <2595106e-aa4a-4140-8f6a-05348497e2ee@redhat.com>
Date: Wed, 16 Apr 2025 15:02:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/rmap: Move anon_vma initialization to anon_vma_ctor()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Ye Liu <ye.liu@linux.dev>
Cc: Harry Yoo <harry.yoo@oracle.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, Ye Liu <liuye@kylinos.cn>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>
References: <20250415092548.271718-1-ye.liu@linux.dev>
 <Z_5C7YNDwZ4pdwQn@harry> <0696eaac-943f-4116-b682-f9b15de6aeaf@linux.dev>
 <fde494a5-f5bc-4d5b-ae73-9fe2106e966c@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <fde494a5-f5bc-4d5b-ae73-9fe2106e966c@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16.04.25 14:59, Lorenzo Stoakes wrote:
> +cc David, Liam
> 
> On Wed, Apr 16, 2025 at 09:34:30AM +0800, Ye Liu wrote:
>>
>> 在 2025/4/15 19:28, Harry Yoo 写道:
>>> On Tue, Apr 15, 2025 at 05:25:48PM +0800, Ye Liu wrote:
>>>> From: Ye Liu <liuye@kylinos.cn>
>>>>
>>>> Currently, some initialization of anon_vma is performed in
>>>> anon_vma_alloc(). Move the initialization to anon_vma_ctor()
>>>> so that all object setup is handled in one place.
>>>>
>>>> Signed-off-by: Ye Liu <liuye@kylinos.cn>
>>>> ---
>>> NACK unless the patch explains how the object's initial state
>>> ('constructed state') is preserved between uses.
>>>
>>> anon_vma_ctor() is a slab constructor. That means it is called only once
>>> when a slab (folio) is allocated, and not called again when an anon_vma
>>> is allocated from an existing slab (folio). In other words it is not called
>>> everytime an object allocated via kmem_cache_alloc() interface.
>> Thank you for the feedback. You're absolutely right — I misunderstood
>> how the slab constructor (ctor) works. I had assumed it would be called
>> every time an object is allocated via kmem_cache_alloc(), but I now
>> realize it is only called once when a new slab is initialized, not on
>> every object allocation.
>>> This patch looks very dangerous to me and makes me question whether you
>>> tested it before submission.
>>>
>> Appreciate you catching this — and yes, I'll test it more thoroughly
>> before submitting other patches.
>>
>> Drop it.
>>
>> Thanks,
>> Ye
>>
> 
> I agree with Harry's assessment, also this is something that needs to be cc'd to
> other developers - I am more generally working on anon_vma at the moment and
> this is vma-adjacent even if slab-ish :)

I stumbled over this patch on linux-mm and agreed with Harry's 
assessment as well. :)

-- 
Cheers,

David / dhildenb

