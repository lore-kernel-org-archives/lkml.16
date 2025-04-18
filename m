Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B1120A5CA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744972720; cv=none; b=gXIR+VwB0aKRdMzKTUZ45MRAo8HFFIIhXPZWtwafkLyxPD8WyWI2G9BmGb5sBjGq8K0z4nKBOd9GZ+RXn3iXNwLl+I+Pp3+GukLwWGVzK/eIFmB72aUdACwRYj42G+iyTTYufgtaxJsbMKS2wHXiRgablbSQK1Yy7aFjw3MCKXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744972720; c=relaxed/simple;
	bh=P2ndCj108Vy+3UlnreqaRW5SxyX6GqRZmxUmdDAHx/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rT9Ko4nu5HhujSzAdhztkYRYMktdyHZve7jq9xNsa80U1vMEAMN2QxmMXzvv+NSNYhPf83VXplq82JROYNSuQoAlVqQNw0x8NmEaSOg7WOPau9cKYzQnB67LKMnAjRYr8fm0ybpTxt4ePo7Ar7UAbZlZcHh/oFYjk4mtnJnNnJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bf0BU9dw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bf0BU9dw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744972717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=/aNfSyhKjVQEb782o1IDS6xvFTRwJ4+tUGq3ftPoOh4=;
	b=Bf0BU9dwm/3bAU0ohXsmhgq6NvHeykvgrjoMrL3kk/ok0qaU84ZEMN8mtgvSkm8ZmhhiPt
	cED/iyTbQfD+CF3kPA/fsXybnEoU5hP0CrGc+dCr8T9+ldCTDu4SqqbA9V8rtIsYb1YfWO
	ls+7NmTi2zqv5FBcTurxNj+IzLzg/Wk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-PFQdX92fMyCrjnNQ9Pl6uA-1; Fri, 18 Apr 2025 06:38:36 -0400
X-MC-Unique: PFQdX92fMyCrjnNQ9Pl6uA-1
X-Mimecast-MFC-AGG-ID: PFQdX92fMyCrjnNQ9Pl6uA_1744972715
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39143311936so654751f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 03:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744972715; x=1745577515;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/aNfSyhKjVQEb782o1IDS6xvFTRwJ4+tUGq3ftPoOh4=;
        b=pD+ROjMuw+aWEu/vcRZe/DWjtKjlVN00ZNdX9kNIvQs0XtZphXPWY808hLnXPJ46HA
         KIHm4a8QFzCXwcCTryARrQ97jyN9GVj9tCbSl/thFUrsJt+R7v3HgJ+3zeLqGjluRam4
         uvlndCOCcRy2uAVZM/dzYfADZtExHcWQzCEQ2qC7HNsfr2M5/6F2TGZNv5Aw0VUrYbRj
         X8Gyd3yO3LkLnhnPBqn3bXIk779iNJw5pXaSX/PisRuW3dJaTVn+6UZH8yZJ9JdjVlp7
         RZPcunBaN4M4uf1RI05iUL6SBVGFqJNgyCu2sh8ru9sd4yjWWhVB3PsGZpBLyc8hRg7t
         kwSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx11WH46/fvxkj5lbJ7h/vOaXmLBeHNbakEiFr1spw4L24QAor2bjUJPX6Bfa3gSxbuIkY5CpG/PKaiLE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXry7rqmw84Fg8PIL2TP5Fq8eTu/GXgRzqz+l/G9kParr9Z483
	8m+bvu1xrFUnA44FDEtWATkjxMDyXaebWI667FlqUEG+i/lPCNHl74vOkCnl2Qb6WbDYzWt+KOq
	QKXoDy6Gr7eWhM8xw3vpGJlHvjRXHzmqa15+x6UMxiDi1wlPaJQueLcZKOLVcFw==
X-Gm-Gg: ASbGncttN33RhJ+fXnT1t9plb3eypyLCpRY2vZMGZjUhinMuvMmYXE1EAJ+zvSG/Iwj
	OFHJ2kuHMdpcPsbl4J22gyZXxh3TCATNbKZqmdThXl7mtR5yc2FVezxgB9l8t+LI84gZlxqlyZt
	XJcfXN3dAahUpjiU+WQMDHMuNReknau1tGhK6+zck+RiIT1xXpF0UHITdNiHlVZhqOVN+E+pdZ6
	mm1CwQ453bH62EypNUmv2QoNJ7jrISY4KYZMS4/NeJeixu3aj6h1wu9bZ+YDTo8F759/TJ7/Kla
	8/YqM/0t2KvJv/rDoIEHIkHQ+F50gMYGhGxRx16vIciP4OWXBoh3PCnWKDspq+yzgLjSxgx84fx
	DPWpklCQafdyuHiSAEXdoVBsLOcBZiT8cXNAx+O8=
X-Received: by 2002:a05:6000:2911:b0:390:fdba:ac7 with SMTP id ffacd0b85a97d-39efbb058a3mr1764671f8f.51.1744972715057;
        Fri, 18 Apr 2025 03:38:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdldEs4oBZMIiplVdHAWEDG5nshhWWpBHcNSsUuHWTg/9jYidiZpEKN9W6zNrB41wlwJ/xDA==
X-Received: by 2002:a05:6000:2911:b0:390:fdba:ac7 with SMTP id ffacd0b85a97d-39efbb058a3mr1764657f8f.51.1744972714714;
        Fri, 18 Apr 2025 03:38:34 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70e:6700:cada:5396:a4f8:1434? (p200300cbc70e6700cada5396a4f81434.dip0.t-ipconnect.de. [2003:cb:c70e:6700:cada:5396:a4f8:1434])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d6db10csm17021015e9.27.2025.04.18.03.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 03:38:34 -0700 (PDT)
Message-ID: <413657ae-8271-4a5a-9507-e9161d1f08c2@redhat.com>
Date: Fri, 18 Apr 2025 12:38:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm/rmap: add CONFIG_MM_ID guard for
 folio_test_large_maybe_mapped_shared()
To: Lance Yang <ioworker0@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Mingzhe Yang <mingzhe.yang@ly.com>
References: <20250417124908.58543-1-ioworker0@gmail.com>
 <20250417150237.ba3bbb3f55f992c692932841@linux-foundation.org>
 <CAK1f24nCWXgOonOpiJ0mEk+-rvGt4WN20yri+wi6-eMf3rf=4w@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <CAK1f24nCWXgOonOpiJ0mEk+-rvGt4WN20yri+wi6-eMf3rf=4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18.04.25 09:26, Lance Yang wrote:
> Hi Andrew,
> 
> Thanks for taking the time to review!
> 
> On Fri, Apr 18, 2025 at 6:02 AM Andrew Morton <akpm@linux-foundation.org> wrote:
>>
>> On Thu, 17 Apr 2025 20:49:08 +0800 Lance Yang <ioworker0@gmail.com> wrote:
>>
>>> Add a compile-time check to make sure folio_test_large_maybe_mapped_shared()
>>> is only used with CONFIG_MM_ID enabled, as it directly accesses the _mm_ids
>>> field that only works under CONFIG_MM_ID.
>>>
>>> ...
>>>
>>> --- a/include/linux/page-flags.h
>>> +++ b/include/linux/page-flags.h
>>> @@ -1232,6 +1232,8 @@ static inline int folio_has_private(const struct folio *folio)
>>>
>>>   static inline bool folio_test_large_maybe_mapped_shared(const struct folio *folio)
>>>   {
>>> +     /* This function should never be called without CONFIG_MM_ID enabled. */
>>> +     BUILD_BUG_ON(!IS_ENABLED(CONFIG_MM_ID));
>>>        return test_bit(FOLIO_MM_IDS_SHARED_BITNUM, &folio->_mm_ids);
>>>   }
>>>   #undef PF_ANY
>>
>> I don't get it.  Sounds like we're adding a compile-time check to check
>> for a compilation error which would have happened anyway.
>>
>> If folio_test_large_maybe_mapped_shared() is only used with
>> CONFIG_MM_ID enabled, then do
>>
>> #ifdef CONFIG_MM_ID
>> static inline bool folio_test_large_maybe_mapped_shared(...)
>> {
>> }
>> #endif
>>
>> ?
> 
> Hmm... we considered using '#ifdef CONFIG_MM_ID' for
> folio_test_large_maybe_mapped_shared(),
> but since this function should never be called without CONFIG_MM_ID
> enabled, compile-time errors might be the way to go -- and a compile-time
> check here does the trick ;)

Yeah, I deliberately used plenty of IS_ENABLED to avoid a #ifdef mess 
all over the place.

Maybe clarify in the patch description that we want to prevent the 
function from getting used without CONFIG_MM_ID, and we don't want to 
use #ifdef because then we'd have to add even more #ifdef in callers 
that use IS_ENABLED(CONFIG_MM_ID).

-- 
Cheers,

David / dhildenb

