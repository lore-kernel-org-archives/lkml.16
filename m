Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0351EE014
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 07:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745133140; cv=none; b=ARErhS9b1fFxP83nVdDqDYl8qNq4iLyFmZNDXa+fyxEmjKlJJIBiqCnLS0zEE9IB9jkDF56bH7CLfwjzy6nndmfhPRV1Pw1/gVzguw9IfwooEnmGjU6qwcs1VCpjQVjVEyTZsjehZFZ8UH3mrnKcFGDP+x6JyVujiufwr7quaqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745133140; c=relaxed/simple;
	bh=OufFZD5sxlJrljkh5IjfUQLlgXMmfnk0hPCM7cykZwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4r/GyHmTIqpS29fHiz8qgguj5xYXBQiOzBEJhlQ/1oxy0n0Ps+jC9ZdIjC9xDKmLpe/+SYbelx0nV1p0+GwT3n/Ynco/SL8+v5y9vcRsk6WfufwAmJ3u61Z38MA6VHXMGNGgcZhSH4HHapRD6IH92eGGiHvcfkXAB5KQtG7d60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KPeZk3MZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KPeZk3MZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745133135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8NnHo6gVM5RhaIx46FHj1uUNshtsJUCoQlndeYBBppo=;
	b=KPeZk3MZMEzox/CO8tMKUvhG8Rng/UPR7mwvOurvbbgtUKz3TOm7KckR4YgsNXUxJJYbeP
	P6wn3g3aay7vVKcq0zqgTxlZuy94CkzFLzgOcODRDG9keoty+F42Dmu7gpHuzytC6rWsuY
	zaS8B7MAsDvj2wO6fk61VOaPzng7+kM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-4aL8BOwvOqeXTuLJjnuhRQ-1; Sun, 20 Apr 2025 03:12:13 -0400
X-MC-Unique: 4aL8BOwvOqeXTuLJjnuhRQ-1
X-Mimecast-MFC-AGG-ID: 4aL8BOwvOqeXTuLJjnuhRQ_1745133132
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so12076275e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 00:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745133132; x=1745737932;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8NnHo6gVM5RhaIx46FHj1uUNshtsJUCoQlndeYBBppo=;
        b=QnmGpl0+riU4P6drAYS0uVMI5s2jInv6QdQp8tPh4S6WvksZ/aLX/27x5Ex4zVErEu
         fRpuLf32DdtY0EsMSVLgZD3mER3QmMPyJkSZOpk50ad5x5JIuiCeduWFTG4DclMWpADQ
         SGRzXMRtfXQ80OD/LRT9tRF/RfnXoXz0AR9g1dMh8ec3xV8qn/OU4To6E7oYlD22hBBl
         eLa4Un5NzpShWsbkD/mML0cIO+vIMo7XYoICb+oAIbWv8s+E2tPbJequG8h7BlAUQ8mJ
         lhOCmxrHINkdD4HOtIj4kPj4Rs4iKUrmTL4J+LhGR3xF8sacZPUzjE+Tv865tUbE6+IF
         nRzA==
X-Forwarded-Encrypted: i=1; AJvYcCVB8yYRqHmYyg+HqHo8Pts6sM2c2Fyu1Od33KXny3DgGWA3jUhi7jHFtrm/KGem3HySgDCtJzjNgZU5bVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZMmk4+t/zGD0Sv0ckGvCQGEuAKj4EkY6Xm8tOGQAhuid1wgC1
	gu+c+UZ4lfvEI6L66WENfeVWm5AP5nzse7h5PMfDw+TntZLd4nlFFGT/gO65r2ulDKoRm+zy8SR
	XcrogS4o4P5r04+6TVns/fDvjsU+o++qrdtUQxrPELjI8s54j1/rgBIGsIC253w==
X-Gm-Gg: ASbGncu/wmco8TPvKZQ+w5pDtqxTOs30vZWm62G64ShfjHdZ8Q7Bc6YdtVdtKKUnJig
	9VdhWTeZiVdfqsr9c3tJscEpLMQvZVc9TVctBIMbXnplW5lQH9IeS+lbz2tKAiz2ilYZMZpFKN7
	utjf7ZTBOAGPKfHSZZjFouDVO8FImGqDYkDlOQBDpgZniTLrPIWN269GmacrIL/++yozPibZny2
	TW17ecU033SrkGteSsIuCXTK2ta+UO8zITvF9ZBURQ1Q3ehz9zdAnAvd8Xn3lcgxFy6N8o7JpyC
	jKjzb0AGmHlhLGOfEg/yW/9dXdFafKf+b1jIEyHwZK2eEFGU+vOAHViJ+mruIY8QCDlX1SLkJSX
	t76bBkjJSpMHW3zbnnf+tYXROWFmhfNwU6g==
X-Received: by 2002:a5d:64ae:0:b0:39c:1f10:ba54 with SMTP id ffacd0b85a97d-39efba5cc46mr7221874f8f.35.1745133132163;
        Sun, 20 Apr 2025 00:12:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFE93RDFzWpm1dGyZLC0kvwFkiUcIdTsYHRZz7DcaIGsRaN9my8UXFY4+drAZz1a83buC7Ryw==
X-Received: by 2002:a5d:64ae:0:b0:39c:1f10:ba54 with SMTP id ffacd0b85a97d-39efba5cc46mr7221857f8f.35.1745133131870;
        Sun, 20 Apr 2025 00:12:11 -0700 (PDT)
Received: from ?IPV6:2003:cb:c720:d600:1d90:f4:74d9:2c94? (p200300cbc720d6001d9000f474d92c94.dip0.t-ipconnect.de. [2003:cb:c720:d600:1d90:f4:74d9:2c94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43ca78sm7982886f8f.47.2025.04.20.00.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Apr 2025 00:12:11 -0700 (PDT)
Message-ID: <2e501e48-8604-4813-b76a-d467cad67f53@redhat.com>
Date: Sun, 20 Apr 2025 09:12:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm/rmap: optimize MM-ID mapcount handling with union
To: Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org
Cc: mingzhe.yang@ly.com, willy@infradead.org, ziy@nvidia.com,
 mhocko@suse.com, vbabka@suse.cz, surenb@google.com, linux-mm@kvack.org,
 jackmanb@google.com, hannes@cmpxchg.org, linux-kernel@vger.kernel.org,
 Lance Yang <lance.yang@linux.dev>
References: <20250420055159.55851-1-lance.yang@linux.dev>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250420055159.55851-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>   	/* Note: mapcounts start at -1. */
>   	atomic_set(&folio->_large_mapcount, mapcount - 1);
> diff --git a/mm/internal.h b/mm/internal.h
> index 838f840ded83..1505174178f4 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -772,8 +772,13 @@ static inline void prep_compound_head(struct page *page, unsigned int order)
>   		atomic_set(&folio->_nr_pages_mapped, 0);
>   	if (IS_ENABLED(CONFIG_MM_ID)) {
>   		folio->_mm_ids = 0;
> -		folio->_mm_id_mapcount[0] = -1;
> -		folio->_mm_id_mapcount[1] = -1;
> +		/*
> +		 * One-shot initialization of both mapcount slots to -1.
> +		 * Using 'unsigned long' ensures cross-arch compatibility:
> +		 * - 32-bit: Fills both short slots (0xFFFF each)
> +		 * - 64-bit: Fills both int slots (0xFFFFFFFF each)
> +		 */
> +		folio->_mm_id_mapcounts = -1UL;

Are we sure the compiler cannot optimize that itself?

On x86-64 I get with gcc 14.2.1:


;               folio->_mm_id_mapcount[0] = -1;
     3f2f: 48 c7 42 60 ff ff ff ff       movq    $-0x1, 0x60(%rdx)

Which should be a quadword (64bit) setting, so exactly what you want to achieve.

-- 
Cheers,

David / dhildenb

