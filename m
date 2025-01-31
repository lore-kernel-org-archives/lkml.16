Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5197716D9C2
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738321611; cv=none; b=mrg/pESpWP0buSaDASVXLvGPqwzErPoCig1bW/HozvzI8CsnVP08/khn/bT5KqCuKEmdKAb+BVzpyntBiYHaUfR+oRlxyofUodrdRhQhSjcfwS3K33/iWO1UHnaAr6FrsMv2HkF+ieqLPZgf/Z4telGAglD/FlEcLdW7YPJS8co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738321611; c=relaxed/simple;
	bh=EhKxccw+KrNEmwKAZl5iYNarDJa/NhZHorApl4nCTKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pzjOsBxpj6JFAO7eBr0O5sOgnbSHVQVgsDfKjPhxwOh6zOFWWAlRZv12ahaJuS5wuWZE9uAoE9y1PHb11MFOvM1M4ZVly4WnCe4UGwiCWp9b+HakhODKY0mirVC26OIQOkfZaQpW0k8WYC1Xw5CfvV+aJ9tnpjeWo0mcaKzKRo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UjiXCco3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UjiXCco3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738321609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ptBTE/j9Ief471JDveY+5Ixgr7ekpcVIWvNqXG+KHaU=;
	b=UjiXCco3lIkYZMANt/kP86DxjvjaSfPJit+43bJAzyCszruV3eFoHWhC0KuC9GoirhWhTn
	wcN31bxL4gzx0XIy7cX+8awYRJebKuwwwGsD8hOYqKXBElYiPhMUJ2BqQb+4rwwDJLZUwo
	MKSVd15aUVIV4eUHRnNjB5oDghM0R3I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-CojMeg5lPy62Lfpj1FfY4A-1; Fri, 31 Jan 2025 06:06:47 -0500
X-MC-Unique: CojMeg5lPy62Lfpj1FfY4A-1
X-Mimecast-MFC-AGG-ID: CojMeg5lPy62Lfpj1FfY4A
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4388eee7073so13218875e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 03:06:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738321606; x=1738926406;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ptBTE/j9Ief471JDveY+5Ixgr7ekpcVIWvNqXG+KHaU=;
        b=qLX0usF+GuqMyfD86Lf7QSicf/E6uCPjE9de3UnoSmQl8POk7Si6i/XW+5GDt8JVFQ
         E3gEymY/0IayqCgy1LpzxauFNZ6itexl7JHVTaHbgRjrWYX1ETBrrRV9eqdgPdnurUoq
         II0dY2Bh4iQ+QiUFp40qs/TXa3qh+x3jW4r/ZrGtMvkaL7eMP2vLHfzCVCDSUh3csqWP
         tUpKkY5Ud4aWzrqMoBv1UpkFQ9GJnu7oUBRvxfsK+wZo2D1fYcgNO8i1kr7s8txNp8+E
         dpImA8B7WwCTH2ht96WQNaBHS8s44VtRD3FAWpUaePpX1xwb7Z/VnUQodam32kjfGlpn
         cDzA==
X-Gm-Message-State: AOJu0YykeoYIsUcntMpbfmU+l+SFlqyLu1c2c03fAGHq9MvpSIgkOelk
	nOz9MPYgVOdnqooMMK2nKx1Q/F//6Z/KR31G7DIQHrlntHoAMCL13ZcJvaN0G4pRoZjBQqZGMBz
	ECbPSSMlUwUtzkL3QDWGyVoz1GhsUzFYxGIyZt2apoozeKK9wBoMT5y7iMQzOuQ==
X-Gm-Gg: ASbGnctPHkf21wwY09hff+uc+mg7lxWQxk4rJ4vxinLQXO7k6Lu1OdSBRVfPUdSlZX4
	xMX4ZmTQJR0TMKmqKtI8lsoZx7sFL+y5ojxVCWdvnzh+uecV2xSicCnEbTZbW4p9RAR/0MUABSn
	aJ0G6mSPV+8RmpyU1A1SoizTEd3XVg138QK1235mVVFazvTdL0qtMm+oew9c8SdPR9n+M/Efxbq
	nCEzwE6SLA0Bp66aYZn2dL12G4xQtRmITyvNjPgBmUOz8FCjMsr5Wa9+UFKlQh4UimaTjQNqG5j
	YVnbHfp2u8kweHobmWQ77a6l9vASQ8OGKnwnUG4GLo5/TqmrghfGzHfggVxyjmXx58IpK6zg1eL
	xcaFDB5RqsEDJYSr5EsmRonK1BX5tqPm4
X-Received: by 2002:a05:600c:1c9b:b0:434:fc5d:179c with SMTP id 5b1f17b1804b1-438e1705f38mr61309855e9.13.1738321606661;
        Fri, 31 Jan 2025 03:06:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvI25JKGadHoBsKNpaNligj01qj4xJdVU/Z3aCpJkv3iDtFRRerBqry12mhnck6BMQkG+OlA==
X-Received: by 2002:a05:600c:1c9b:b0:434:fc5d:179c with SMTP id 5b1f17b1804b1-438e1705f38mr61309445e9.13.1738321606312;
        Fri, 31 Jan 2025 03:06:46 -0800 (PST)
Received: from ?IPV6:2003:cb:c70a:1c00:b8d4:bc62:e7ed:ec0e? (p200300cbc70a1c00b8d4bc62e7edec0e.dip0.t-ipconnect.de. [2003:cb:c70a:1c00:b8d4:bc62:e7ed:ec0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438d7b5eaecsm59983415e9.3.2025.01.31.03.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 03:06:44 -0800 (PST)
Message-ID: <cab05891-cfce-4d64-a05f-b90038d5ee9f@redhat.com>
Date: Fri, 31 Jan 2025 12:06:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/12] mm/page_vma_mapped: device-private entries are
 not migration entries
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-8-david@redhat.com>
 <baraw2czilsofpedok3jtxxshfaxjrmef6u42pitibtcst6mel@scoukpiwnvvc>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <baraw2czilsofpedok3jtxxshfaxjrmef6u42pitibtcst6mel@scoukpiwnvvc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31.01.25 00:36, Alistair Popple wrote:
> On Wed, Jan 29, 2025 at 12:54:05PM +0100, David Hildenbrand wrote:
>> It's unclear why they would be considered migration entries; they are
>> not.
> 
> Yeah, I agree that doesn't seem right. I suspect I was initially modelling
> device exclusive entries similar to migration entries but obviously went too
> far. So thanks for fixing:
> 
> Reviewed-by: Alistair Popple <apopple@nvidia.com>

Thanks ... fixing all the wrong use of "device-private" in the 
subject+description ... not sure what my mind was doing there.

It's all about "device-exclusive" of course.

-- 
Cheers,

David / dhildenb

