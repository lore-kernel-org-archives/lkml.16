Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADF5EEB3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744972817; cv=none; b=U5HzfhTGyyYZ0oKv+FYXTtT0vq22MmsAyiI0G/i1Fsc7Iz9laLbEy596ax3mZEG4tjfuf2gHOJjZxpJqnzF79tqaJKDG0WQP2KJAM5GewUjYy/9dZJdDBUdU+ixTbFN+EbiSk3vPL1NXF5aNccMH+sUqfkuM76gkjzmC1JiRzaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744972817; c=relaxed/simple;
	bh=+2DaVy6YxkYsnknxWmh1L6lGhShmyYusbgOlwsoAk6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DA2ZFCUxw1AkwoNZEZu+5fT18QoIu9f7bkPrKz93OMPybPmx7zZ+RTVmCacudpkpONO2gIAHdNAHb3yJGeR8ZRx6DrIlUtthZuPXPdrTezyb8ZlXMj5HVU3wwqXmUVIUofzgoi2qSqyX8VAne8uwCnGoEKPbUMsqp6/rkBD/Blg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZDSCPsYe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZDSCPsYe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744972814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xPUlDnCCyGdj+WaGQ0gbXoHojvgutpUMexLIgSLwGMI=;
	b=ZDSCPsYecuP/DOLoabBZ1jUjxbS6Sy92imF/wz2Dq6uXFlyRuNjyAJ0iZhfeBwg4sEhPJ2
	jOLgZeAELOUoqL3p2x3GhzqWTbfa0HOarRUuEapE9nZHQxJBu+czLY6o0hefnuA0qWd2XO
	WCq6qSSarAQ/pGn8+MjVolFAP+Dzd9Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-zww6R3VjPRak03qxMd5rXA-1; Fri, 18 Apr 2025 06:40:13 -0400
X-MC-Unique: zww6R3VjPRak03qxMd5rXA-1
X-Mimecast-MFC-AGG-ID: zww6R3VjPRak03qxMd5rXA_1744972812
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-440667e7f92so7276325e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 03:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744972812; x=1745577612;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xPUlDnCCyGdj+WaGQ0gbXoHojvgutpUMexLIgSLwGMI=;
        b=gZhBjclGqDVXPDafsPGuJEeWltAWtTHpZGSO+nnxi1rzcvwEHiR1r8bJVNPw319vyt
         pfw/IOZnSwZm2THuqRyqoefOuv4qS72YX0datQiPBXABiFSoj5rQXenajkFXxd7TPpWr
         j6K4PLN9bXMtCY44mfs+jVoaNbEw6CYOF8wMxuauSLOrjLPwq8wcd6L2pg/67KTBC4bT
         DJPgpcHZXrqme9isvSLYL2w3573q0wqfQZKGJqfjqzB9P7ZG0eM4sj3+E/bGQzsaPfXO
         Xa5dzBbwe6pXXkPUL2j257GSmKR9yiLr8p7qhFbHOcrXJyDwgYx/ErpqOWC5HGuFQ8K+
         iMFA==
X-Gm-Message-State: AOJu0YwnsoP9szz4057JqTE5/zXZjK3GT20g2EQhPARcDLthgMTv8mAy
	RbyUCxBeZbPCd6cAJ3LCJxdkvuQWu/xGp8LJvo6wgCUa9JHjxR1FrzsfOFIFLjHpRnOSVjnlRPj
	GmiTuN68zbCY34TpaZrSW+EorCmOK3ZrZXv7DrrQanV5vZ23W2lSrlkm3NuGIZQ==
X-Gm-Gg: ASbGncssrNcpeGxhg5kjlWLGOHpbCLr2ePWsefqL4oQZGv7WFmdlzQnqPXiPMGY32W4
	0ezcP7NDWPebS0JTJKQCFhpCaQhjPJAnLRYuF1QhOoCvx/uxQQYr+H7OvxcZjMLc3osKIrdQlJ+
	tG310eOUVSERjPuoxLs/BTpzffVW5VGuF+9dMvox064zlTy32i3OMOPw1lT28h/zEXUs9+Z9i1L
	9mdiwwxk8lpDFHENOpOXofKGvDgpY/8i3nhK68Wz981A28Xpg6mMG/dQ+yxDk2tKF3le8nVt956
	poN6DvYnKw2YU2OiAHTXGgfi/lvLdVOZDmGD/xxtL8Wm15OIwjciEe6fOtVCp6BV8rKUB6cZBGB
	mkJ8EYv53Rv6oXVJrWXrJGX7E3RKD463vWOd0ixw=
X-Received: by 2002:a05:6000:402b:b0:38b:d7d2:12f6 with SMTP id ffacd0b85a97d-39efba2c999mr1668733f8f.2.1744972812055;
        Fri, 18 Apr 2025 03:40:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7QkJxXK0IVmm+2E5K/7fEzuE4NJzadCM2M6LeP36yeDc+bOjhp+9VaNgLtNmRx8aZF+UFFQ==
X-Received: by 2002:a05:6000:402b:b0:38b:d7d2:12f6 with SMTP id ffacd0b85a97d-39efba2c999mr1668715f8f.2.1744972811692;
        Fri, 18 Apr 2025 03:40:11 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70e:6700:cada:5396:a4f8:1434? (p200300cbc70e6700cada5396a4f81434.dip0.t-ipconnect.de. [2003:cb:c70e:6700:cada:5396:a4f8:1434])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5d6f86sm17022605e9.35.2025.04.18.03.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 03:40:11 -0700 (PDT)
Message-ID: <9490ed5c-f6e0-40f3-839b-7b3a5decb5f4@redhat.com>
Date: Fri, 18 Apr 2025 12:40:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm/rmap: rename page__anon_vma to page_anon_vma
 for consistency
To: Ye Liu <ye.liu@linux.dev>, akpm@linux-foundation.org,
 nao.horiguchi@gmail.com, linmiaohe@huawei.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, harry.yoo@oracle.com,
 riel@surriel.com, vbabka@suse.cz, liuye@kylinos.cn
References: <20250418095600.721989-1-ye.liu@linux.dev>
 <20250418095600.721989-2-ye.liu@linux.dev>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250418095600.721989-2-ye.liu@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.04.25 11:55, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Renamed local variable page__anon_vma in page_address_in_vma() to
> page_anon_vma. The previous naming convention of using double underscores
> (__) is unnecessary and inconsistent with typical kernel style, which uses
> single underscores to denote local variables. Also updated comments to
> reflect the new variable name.
> 
> Functionality unchanged.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>   mm/rmap.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 67bb273dfb80..b509c226e50d 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -789,13 +789,13 @@ unsigned long page_address_in_vma(const struct folio *folio,
>   		const struct page *page, const struct vm_area_struct *vma)
>   {
>   	if (folio_test_anon(folio)) {
> -		struct anon_vma *page__anon_vma = folio_anon_vma(folio);
> +		struct anon_vma *page_anon_vma = folio_anon_vma(folio);

I'm extremely confused why this should not simply be called "anon_vma". 
Why do we need the "page" in here *at all* ?

-- 
Cheers,

David / dhildenb

