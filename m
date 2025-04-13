Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED8C17A305
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 20:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744574753; cv=none; b=IqpxvPS9v8pN2hfiGLvyFtYkxoBiDG+alrxVDrcpkHm71iMW5x6RgOffKs01tvJcumZPBi8ZIS2U2JIAAy4D4ImniHFoGNZhARGIN+Ob041RYIj/DdPjamOLT17HbqX4zbg35QPkuElqS3Bbh8PxqHbqCZGMwpAyeWuDSuL3Ghw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744574753; c=relaxed/simple;
	bh=2mdYX/2GVIgDd+Po4gWQNViRS76n/C4qNnW05RfESvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NIcT8Z8h0wWOAgpdmRUT9Fk2+HSmWpVv+A2Rkqbj0G4VSFSX5DFDh17HTlNbSGgYLTl2I61dYfZA5S6le4YoSO8pTPtdVHlNiTkxBmtf4ipQjibF4fSDZeuFsKorQmibkUR8p/ylMi2wFVhTEnjS5AjevhEmgfmkMPieAE7QfcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BWCV7/gf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BWCV7/gf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744574750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=26kQaqxmClrkmqimyK/pAn0V/eLIFLyRyoGwKGCOpj0=;
	b=BWCV7/gf+01ePG9hHR7OXIm556zanibNap8ulCE7FVqofE+TmqYPshdEVPuIeTvdI5xYAM
	X47IIZUF+xw7kT5NM5/Irh5+ZDId/LirE64Nb9xv7qEq+L4agH2LI1xjCoJqbMNeI6fJW5
	EGasV2mnKY7sTJgleFZms9E+2Q4eSV8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-QUlKDJXlNzmbmeUpe3X_8A-1; Sun, 13 Apr 2025 16:05:48 -0400
X-MC-Unique: QUlKDJXlNzmbmeUpe3X_8A-1
X-Mimecast-MFC-AGG-ID: QUlKDJXlNzmbmeUpe3X_8A_1744574747
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so30998155e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 13:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744574747; x=1745179547;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=26kQaqxmClrkmqimyK/pAn0V/eLIFLyRyoGwKGCOpj0=;
        b=dKCAGlAWyvVVQ+GsHJuZBtILBdul6n6+IhLEPN/JWGDA8sDAfNeOaAuPztm8Q4UXpm
         maY0Tzs3FJy/b02Gwykjs3o1ms2xsEgT+6hlguDBL6a0fs7KJT0bIuC9HDGXNuhV2IQL
         qACMHL1RsaoTz7sELLF6qYRXCqd32Pj0Sgg6wh97tFMyRpCJDYOejPn+RdG7q2iwDeN2
         xaN1TezL74Rm1/hHwxmD+vSOiNa5zt7ek7N8tbkGCD8+69owouiNiHrAyQ7aV92hSbrv
         Hiamg7nnJfsEFz6MxVjGamJS2sVip9T+nnf5EDhdBUVM+hAemXtr/PLzPr55EXuH62/H
         0MXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtTl4ks0Ds0nTZ3KIGhB9f2idrjvE35wAgHhZMK7tR+mPnCGoS+Fj2vQVDtODOEoIy5PZOzMr5wr+9VJU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJQYg+F8BT1mxFc7J00PtA9KVwBeYGnpIssjUmC7QaknS2G2A7
	zJf+ap6ypwvaXkSaETIHpB6QXgLn9f3l+g3BvB/Dq1w8Zp7/xtrgXFKqC8fCwEwYdqfsPWg/sE7
	bZn8choCK2BwzHnA0HtvGX1Az3i77WlnUZnie/urH0XXVDdYnQH/7jlpE4wd08A==
X-Gm-Gg: ASbGncvYI3Tagl5BiZQBVd5Ew+D/4c+7dNHch911+n9iPIk3nvytjAt2JWx9jtEEpxw
	lCKbl9aP2Z+h4HRVbpxuIUEKWSsYbOFpVREMeuhYiQu+5vkIWzlVHTJTedwfcvz6kEsS2caXR3Z
	Pf/obsdRdr3wfLjlclo3JI9FtRiYbpDsRbNzdzY775jRzr7Pc+65Eel0YpNTRQ5reaM1Wyoxh4V
	RGBHr+mp4rVemfqXQXupH9lAGT9Ps21MEipOm4RCvDVEOCKGVugaic52P/4mxvY6mdD1dbXn+5D
	fjOop67ardJDSY/o6gcJy8ldZbl+r3P2032vIIwGZPkBajswKQMEHPFmXFWhxUfxGOMemgVTm2t
	MdBXFuiJlLZmPl3/z8gN4h/KiDbWyX08FtfX4hM0=
X-Received: by 2002:a5d:5989:0:b0:391:3915:cffb with SMTP id ffacd0b85a97d-39eaaec7870mr8568035f8f.43.1744574747470;
        Sun, 13 Apr 2025 13:05:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj0NxM0N0abRhomL8K4YcFkTrVF5uys1Aj1DUWE1g435wGfrkYysdjnFb/nCc5L8Ln6JHViw==
X-Received: by 2002:a5d:5989:0:b0:391:3915:cffb with SMTP id ffacd0b85a97d-39eaaec7870mr8568027f8f.43.1744574747090;
        Sun, 13 Apr 2025 13:05:47 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338dc13sm159877575e9.3.2025.04.13.13.05.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 13:05:46 -0700 (PDT)
Message-ID: <c7aee943-2802-4a41-8e3e-e80f45e80dec@redhat.com>
Date: Sun, 13 Apr 2025 22:05:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm: Introduce free_folio_and_swap_cache() to replace
 free_page_and_swap_cache()
To: nifan.cxl@gmail.com, willy@infradead.org
Cc: mcgrof@kernel.org, a.manzanares@samsung.com, dave@stgolabs.net,
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 will@kernel.org, aneesh.kumar@kernel.org, hca@linux.ibm.com,
 gor@linux.ibm.com, linux-s390@vger.kernel.org, ziy@nvidia.com,
 Fan Ni <fan.ni@samsung.com>, "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
References: <20250413042316.533763-1-nifan.cxl@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250413042316.533763-1-nifan.cxl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.04.25 06:22, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>
> 
> The function free_page_and_swap_cache() takes a struct page pointer as
> input parameter, but it will immediately convert it to folio and all
> operations following within use folio instead of page.  It makes more
> sense to pass in folio directly.
> 
> Introduce free_folio_and_swap_cache(), which takes folio as input to
> replace free_page_and_swap_cache().  And apply it to all occurrences
> where free_page_and_swap_cache() was used.

Patch title should better be

"mm: convert free_page_and_swap_cache() to free_folio_and_swap_cache()"

and similarly adjust the patch description. Thanks!

Acked-by: David Hildenbrand <david@redhat.com>


-- 
Cheers,

David / dhildenb

