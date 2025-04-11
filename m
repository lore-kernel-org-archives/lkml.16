Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E0D1E7C07
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 17:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391631; cv=none; b=gg1iybE5mg5qFm80o/MgztDtFaFoVxWOcBy6hFEeLL2lBn+hSdhMRwcJBjPAyOFRBZYjL9sTusbRyH5grjUlK1JKH4j7Q34tdykQZ+9P4g/sbFiHZcYM59cqg3lXzbZlQlWUsXHkXQq77Hytrs2i7pJialllhgVEYAjF5rVfPUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391631; c=relaxed/simple;
	bh=zH/0sIli93wZ6ILHuU5fEjNVP5CrnyvbfusxXFTbRXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vea1euhZvNlTGXo9acw/JucQ3aV2kBe+EzHdcbxnfjsucCxl72fyKiGhbgBJkn/8q/KrJAx4vKpllbqSBokShx2jXm0//j5xWL84Udfha1ANHiw8SEDj3/7cS7TafpqV5xvIrP0yeh+CrETJWjovP5iscwHU/VLR0I35hQPfeqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BUbUoJ4W; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BUbUoJ4W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744391628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=neywMREG3kC+bngOS26dPsNzqIJnBC57g6tNRxTe/TM=;
	b=BUbUoJ4WYDsgI18QkIsKwBGwwHugR94rE44IDM2LMu1Z39tAG8HzIrTMmrYYEcSvb8NA7o
	xzwL8tZJvNflHVHUL3R30hab27EZzpC9jgpro9o2glRKLXy6k8fw4ohspPDg22MpBqUaet
	BNGo49XY+WZna0cj8KmPq4RNE9NpszY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-7t_9QATJOWaUKangBUWEEQ-1; Fri, 11 Apr 2025 13:13:46 -0400
X-MC-Unique: 7t_9QATJOWaUKangBUWEEQ-1
X-Mimecast-MFC-AGG-ID: 7t_9QATJOWaUKangBUWEEQ_1744391625
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf327e9a2so19884015e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744391625; x=1744996425;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=neywMREG3kC+bngOS26dPsNzqIJnBC57g6tNRxTe/TM=;
        b=BhSX5+ULVokxkobMuRbMzaQZnpJF2ILby7svEog6X0xGl1CISc0StrUuRxuWs9cIEt
         le5cnVNDoxzzTDsjbOhuMhAOaSVqOr7ow4M6WCZ/CrmDhP2rp7FVzZmMtHA+OPd0aC61
         WR0xE7bGkZU+HE9XUItsrtPsw9VYGVP6IW77dX6A2e1fmuFJjKScBXAvJIqCfGugJ/lR
         i138bnBwrOc8YS+pTo5vUiMRASiIRCLrQTW6p2Dgw6SyxvWf4sSrnGNZiEXVKqyYWTcS
         UlIeJ5kWc0nnpJrjvIyW54mGzsa3oYlNHzU/geHJ0wU98hV6xSYIozGHJUkJ4tNNcH56
         dcWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUx75L9jXeKCbzQnuB4o6HJ3JRhG0+IWC3PjG0fiUDlS96OK6krxTCyvsFzhn5ZHLmTDak5YMNeEFNuZo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9jb+QjegWgGnv0WrxSPfhv9cQGp5+9NBlJXhsULMERCtfdchx
	eAbzC7TNcXGLYMs6Z1NVK1XysXCQr8LTtZf4jiaMVFJ5cIoW53T7OxY1h6DAvgaKbRJn7/4KHcD
	GgecT67rhpDfVtk6zExIgHnO/PgMR6MNw200Ip9GrPVY34b6YJvjgMJ00T1pYaQ==
X-Gm-Gg: ASbGnctdfzmH5CDyJPCbjRv6+YDJguP0H5P0HbAQBnPYFATd6opi66rRFS01R1J9Nh5
	OsQmK80Exu8ciUibQyPiBzBrsBflczHYBQHi6gbMW24MxD07GQKsUAYaNEM15D7ahh2yA7P9DVd
	mGSdytjWKL/XeAuyQdrh89SmMgHAkKgFp+Q9RAW5mgWy9/ATBXKwYbRNuguWiJEt9zJyIvUE2Pk
	oVGlVDyuKikmmhDE+4XKg7aTu8mwHZ0AJQAwfV6SRQLraDgDSkKbAo7IYMiqDRB+362c5HdnEkX
	h4paUmgMZr+z4zS7CEhQyWsFUQxcgrMq9AOVF/IZwDULrjeXCufMei9EbFsZn0qpNytXo0UJqpx
	GjLHj4JxbOTXbx0SCwF1i1ionFJadbKH+C1GB
X-Received: by 2002:a05:6000:4285:b0:390:f9a5:bd79 with SMTP id ffacd0b85a97d-39ea5207243mr3240519f8f.26.1744391625171;
        Fri, 11 Apr 2025 10:13:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5z9WPEm/LW3FUIiwo3WmsMkOxZZVOwmdjiMfPK51RUb5ALU9dZOgsH2MHB5VMYrn9P+iZ6Q==
X-Received: by 2002:a05:6000:4285:b0:390:f9a5:bd79 with SMTP id ffacd0b85a97d-39ea5207243mr3240493f8f.26.1744391624722;
        Fri, 11 Apr 2025 10:13:44 -0700 (PDT)
Received: from ?IPV6:2003:cb:c726:6800:7ddf:5fc:2ee5:f08a? (p200300cbc72668007ddf05fc2ee5f08a.dip0.t-ipconnect.de. [2003:cb:c726:6800:7ddf:5fc:2ee5:f08a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445515sm2536028f8f.89.2025.04.11.10.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 10:13:44 -0700 (PDT)
Message-ID: <5a7d427c-c729-47c7-b851-9c49a30af279@redhat.com>
Date: Fri, 11 Apr 2025 19:13:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm,hugetlb: Allocate frozen pages in
 alloc_buddy_hugetlb_folio
To: Matthew Wilcox <willy@infradead.org>
Cc: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
References: <20250411132359.312708-1-osalvador@suse.de>
 <f0373427-b4e8-4612-b668-980d93febe26@redhat.com>
 <Z_kldseGr033Hqny@casper.infradead.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z_kldseGr033Hqny@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.04.25 16:21, Matthew Wilcox wrote:
> On Fri, Apr 11, 2025 at 03:44:31PM +0200, David Hildenbrand wrote:
>> I assume htlb_alloc_mask() will always include _GFP_COMP.
> 
> static inline gfp_t htlb_alloc_mask(struct hstate *h)
> {
>          gfp_t gfp = __GFP_COMP | __GFP_NOWARN;
> 

I checked that as well and actually meant to say the I assume that we 
will here always have __GFP_COMP because the gfp_mask we get here will 
always be derived from htlb_alloc_mask().

>> But semantically, it might be wrong: __folio_alloc() will in the memdesc
>> world also make sure to allocate the memdesc, __alloc_frozen_pages() not.
>>
>> Maybe one would want a __alloc_frozen_folio() .... @willy?
> 
> This is fine.  Yes, it'll need to be modified when we get to the
> separately allocated memdesc, but there's a number of places that
> cast the freshly allocated page to a folio, and I'll have to come up
> with a way to catch them all.

Okay, thanks for clarifying.

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

