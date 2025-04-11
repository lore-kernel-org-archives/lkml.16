Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D843928F936
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744360655; cv=none; b=npaTJpqcVHB6dsxpqUWWDtFL6wp4hz/uw6yBn9Ba702c59Vl/5sa7P703ABbXDvnN5EdulZoQxt4oi+GM9peGQKMuJMXujwxzzTBTvd7CvnJ8xVXF7LNDniLmVvp77rVPVyjC4QXqintj+iExafnecSze9yNvcnohBmAAINzz6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744360655; c=relaxed/simple;
	bh=c0SN2cmlSRibJUhXnObd7lG8PnIaNfQ8ttuK6ETBMRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=C0zwMwkl62A0GhHg1mQemhSF5KFw/ojxuryCTt+BQyBdVZB/VNJ5aPTDGemVP61nusI7k3OMkHWyRRkCMNxysfZjaFmkpTVETbLxsWwZwqitXEGz2DP7CPbZhxPZYMTKzlUWh7OjefdtESct5UPwTO3jwe+YLD4ibfzjT+XLMqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P6uJcl6w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P6uJcl6w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744360649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=JLslcSIDe5LlgtBN6zquly6cspPZPxoniRKKH+HI3wY=;
	b=P6uJcl6wTXnkIlF86vONUffxDaACuPg3sD+z9XXFWXII8RaUFxWc7tm4aa5HKoZKHuD3cm
	BeXgfNW4cAXGh3QA1b2PcWht/uqP5FTqSeV7vpBRuQuJVsmt0ACOXIz9Zr/udvWgnpKxnE
	COZ9jEM3LcWWXIW4c75uiClYaOic0b4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-9MtFhv6SOR6-pzyhGcpVjg-1; Fri, 11 Apr 2025 04:37:26 -0400
X-MC-Unique: 9MtFhv6SOR6-pzyhGcpVjg-1
X-Mimecast-MFC-AGG-ID: 9MtFhv6SOR6-pzyhGcpVjg_1744360640
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39c1b1c0969so1128631f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744360639; x=1744965439;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:cc
         :from:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JLslcSIDe5LlgtBN6zquly6cspPZPxoniRKKH+HI3wY=;
        b=JWjJtNfUPHTRKNZrFj+eVLfnv/CeLfigel+ESD8oaF/Px7j8lXBPCzxPYSO9ncCAo4
         nXqGQhtkYU6FQqNVT+ecmlj+Z5GKDePkBNKCK33iYPbhSERx9/SaPT/g7uxVD+UVtfxG
         nQhWzSb/vy/BeB6a91COFSDStiAfwColg05AfgdoiQsdCj1hafF8w3oP3CTc5fYRbYsz
         XmP9n1jlMJyeYewG1nHrCjo7Bk4+ybt8OWdksszv5s3Rjw2utng4ARlppI9KU7CSY8Mh
         yL1LzuJJ72I17zKk3Bz3AHAgld2VOZU6DVkdWpCPWkCubQhFgQOoupXqvZ2NOkhsNIEw
         H5RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDcYhvRa/haUfLhQqT4zd22/SJ/0H4qzJyoIS4X2RzyWzVjhW9Ju6bIXkKPmja0VJr8NT+NRXHYYkBLIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNbR1cELgA3UIZSzGIPFjgtaVQnEMTUfrd6GTzM/xvU7ehKj8Q
	0EW8TAomHnJnCVf1HkW39fe8DjPKI8htxFUrDxXLyA1OEakxTScETnc9yxnaU2suqkwU5Ulj7z5
	DYwMpjxBEpmBCY8iEbcFE36gCNIOzZgwcUECWI57x5cZrmtVqnZNj/bGL75PnCA==
X-Gm-Gg: ASbGncuRIiJszlfUdFZGm7uknr+3rlNv+aWpmaxy3QbD05jyOkoWrwMaky81YU9i0jC
	nE+49hCxg5ZIyXcQSfPAvbrqkjzpEA9FjY3puodP+XSjdIkCLTJO+2itGdqFORi1eATBuPCOPys
	O+j7e4eE1Lbzm8EfvnYKcZmZxC8uORlK0hIZsry5wsRUTY+ds0+YrtA7yuRjqhevPxrunl8T2uX
	+2cWJ33MQRKALj3c3WHdCSfycc7ZCBVykKo0HzmvXGRIheG8cvUoRAYfMPkmMviMLNWFXfm5QZ1
	Sx6de9dse3SQ3qcAnkVvG20B94d/djr3n4//jntkpqUY14RUF4+UQWrza/tKYyVn3ENrWkvQeco
	+WMDSzv4Fm3ezS5LeimzMliHLCK2aRUtqK9sb
X-Received: by 2002:a5d:584b:0:b0:390:de33:b0ef with SMTP id ffacd0b85a97d-39ea644020dmr1231849f8f.30.1744360639567;
        Fri, 11 Apr 2025 01:37:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFy/nxOARvXAgp07ONVwaKQG7V6q2L0VxkCLDReSCXO28buDSxhWR/BAmHdCLtwrV6dKAUbOg==
X-Received: by 2002:a5d:584b:0:b0:390:de33:b0ef with SMTP id ffacd0b85a97d-39ea644020dmr1231822f8f.30.1744360639093;
        Fri, 11 Apr 2025 01:37:19 -0700 (PDT)
Received: from ?IPV6:2003:cb:c726:6800:7ddf:5fc:2ee5:f08a? (p200300cbc72668007ddf05fc2ee5f08a.dip0.t-ipconnect.de. [2003:cb:c726:6800:7ddf:5fc:2ee5:f08a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cb29sm1309748f8f.76.2025.04.11.01.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:37:18 -0700 (PDT)
Message-ID: <6e1a9ad5-c1e1-4f04-af67-cfc05246acbc@redhat.com>
Date: Fri, 11 Apr 2025 10:37:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] fs/dax: fix folio splitting issue by resetting old
 folio order + _nr_pages
To: Alistair Popple <apopple@nvidia.com>
References: <20250410091020.119116-1-david@redhat.com>
 <qpfgzrstgtyus3jkzrdpwxg2ex7aounhwca65bxwlqxws2drhk@op362gbaestm>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 nvdimm@lists.linux.dev, Alison Schofield <alison.schofield@intel.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox
 <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>,
 Alistair Popple <apopple@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <qpfgzrstgtyus3jkzrdpwxg2ex7aounhwca65bxwlqxws2drhk@op362gbaestm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(adding CC list again, because I assume it was dropped by accident)

>> diff --git a/fs/dax.c b/fs/dax.c
>> index af5045b0f476e..676303419e9e8 100644
>> --- a/fs/dax.c
>> +++ b/fs/dax.c
>> @@ -396,6 +396,7 @@ static inline unsigned long dax_folio_put(struct folio *folio)
>>   	order = folio_order(folio);
>>   	if (!order)
>>   		return 0;
>> +	folio_reset_order(folio);
> 
> Wouldn't it be better to also move the loop below into this function? The intent
> of this loop was to reinitialise the small folios after splitting which is what
> I think this helper should be doing.

As the function does nothing on small folios (as documented), I think 
this is good enough for now.

Once we decouple folio from page, this code will likely have to change 
either way ...

The first large folio will become a small folio (so resetting kind-of 
makes sense), but the other small folios would have to allocate a new 
"struct folio" for small folios.

> 
>>   	for (i = 0; i < (1UL << order); i++) {
>>   		struct dev_pagemap *pgmap = page_pgmap(&folio->page);
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index b7f13f087954b..bf55206935c46 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -1218,6 +1218,23 @@ static inline unsigned int folio_order(const struct folio *folio)
>>   	return folio_large_order(folio);
>>   }
>>   
>> +/**
>> + * folio_reset_order - Reset the folio order and derived _nr_pages
>> + * @folio: The folio.
>> + *
>> + * Reset the order and derived _nr_pages to 0. Must only be used in the
>> + * process of splitting large folios.
>> + */
>> +static inline void folio_reset_order(struct folio *folio)
>> +{
>> +	if (WARN_ON_ONCE(!folio_test_large(folio)))
>> +		return;
>> +	folio->_flags_1 &= ~0xffUL;
>> +#ifdef NR_PAGES_IN_LARGE_FOLIO
>> +	folio->_nr_pages = 0;
>> +#endif
>> +}
>> +


I'm still not sure if this splitting code in fs/dax.c is more similar to 
THP splitting or to "splitting when freeing in the buddy". I think it's 
something in between: we want small folios, but the new folios are 
essentially free.

Likely, to be future-proof, we should also look into doing

folio->_flags_1 &= ~PAGE_FLAGS_SECOND;

Or alternatively (better?)

new_folio->flags &= ~PAGE_FLAGS_CHECK_AT_PREP;


... but that problem will go away once we decouple page from folio (see 
above), so I'm not sure if we should really do that at this point unless 
there is an issue.

-- 
Cheers,

David / dhildenb

