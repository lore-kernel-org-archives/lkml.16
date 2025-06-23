Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6B18F49
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687798; cv=none; b=r3uPTjO6eplvr+VpGt5dnM4gAtqzdH0Rit4ZDBYHRRq3p3r/oJmIfloGUkjpLPH8k3Xrp92zz8mQuj9W+vwo+f1Ye+9br0Mc4gWq8PzUrzg3TL4Pg+BbsZLhghmvnFXVzB03TJ1c9xRPIaYE3xJiX1d1u2H3YHNTYl8ho/GFOks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687798; c=relaxed/simple;
	bh=/KxAmxIOT4sV1rSW3ta7Y+SNHJnA/PsIxsI5bpB4x1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZE/5YmId196Vnr9MRgwPVqRsjRJ9oWIHFmtLUjyii9Z05YDMUIjXKgW489FAdojBMLgyRJiwlQcW31d4WfrgYyZ9u0KyXlAC4dS39usUvq8QFDeUDacgklPL/7uH/5fxVToNOqZuQgH0HOEQKboGHctxrDHbfyyT+5u7P6UF1jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WpP4+kcs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WpP4+kcs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750687795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fU/eXGbkp3rKuzXlI+aQj0bKJDTEpXSWfQHeLkuQF+c=;
	b=WpP4+kcsNAY1lweMRpMdEuLadEytVjVcbbIfBmMBuuOzLMqNLSEG9vMQVVlx4z/BQNWoy8
	0DInmaEuT00GsCNGMYvS8kzl7AHDleyo2n0ZLN+GkozmH2KhfE33GJQAKefZHp6DCB38rr
	tbRfxSNiQ0sLXXZ6wbVXysZAkZ3djeQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-R-TFGfiSMnmIcgcpzgfh1g-1; Mon, 23 Jun 2025 10:09:54 -0400
X-MC-Unique: R-TFGfiSMnmIcgcpzgfh1g-1
X-Mimecast-MFC-AGG-ID: R-TFGfiSMnmIcgcpzgfh1g_1750687793
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45311704d1fso27079055e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687793; x=1751292593;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fU/eXGbkp3rKuzXlI+aQj0bKJDTEpXSWfQHeLkuQF+c=;
        b=nF7dlJO0lE41NcstP71kX+P+sPBq4moLTNl5Dep7VkVi+EttT5F3ThBQvxAchJ6uo8
         iHt5+R2fyG4mTluAK85d/37zV+/6QYvMFWroa3PuE3yf7iNQ+MQdU9NHIi83y4bWrZDE
         2/DXI3OmKxuSqWzA5vEYFnNANKFoJ1STIJ4LJ/sPKqAfI77mod6rzBCunBGsrvrrfHlZ
         NEcpsZJ7UVuKgqaOZLV1sC0kQ5Sr9Mzf1ol+EWFhH68P8D7jCONRsaK4LypsTRMy+Xx9
         fF5tif9gjJA3Qr3GL4uYLlXwxqhkAwOCdboGCiv75PCqWaqyFdeoJU0vDkjK+Z1yzKmi
         /BeA==
X-Forwarded-Encrypted: i=1; AJvYcCW6C7oOCKxai3OcTU3UqkpXjvcwRC+oRBwwgWp7p2xftZD0bUEPQZ640qyapC3amgLw8G4tBUo+vECYOMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZiR6AH07dQvxuO0c+nUu9cmaooRndmv1DkzH64BhWfX56LJvz
	CcVhLy2i8kK1x+rvPKvxXKKdE1X+lJOrLddgece1XwLJkRIbEoXnlXA/vwnpbdexVITs++kjslo
	i65idUoRmeztYgc6xJA9V6yot6JqDeEoS1pIX+9OG7GsqihrW++DUq7tM+yI6ht+pk1xx7aJayX
	v3
X-Gm-Gg: ASbGnctxTyKcA+ZmMO9UVggU/wgvfO8piQN32yxTJ0SgkIBt7t9U9O4U3rWAOMBc2G6
	dH/zMIUcW7nNZ+b+ivAok6swdK7wPxwJhRUiQ+CeJ7ezjhDYy2bhobaTENIGmSP5xjgjk5AqA9v
	nTdJhThvQE+hQTGGV7c0nYwHc/6Rh/wtE/NXjnkglITHcceIi2QGWPgPK5OpiFlfjxLr7PEyRop
	cLJexrJQTSPrpeSWdiIkirWr5VH5zfEEuus4Ux5I1+qlG0PH6zvS/iKKpCNi/q/N/HZiC5LrLJP
	XF7eyTZrPCa2s6GwJy0av1HzwJf+IqwxnwDTNj4udL5KuQYCJj3Fz8+1j02YOMHhJ13Xo6li0+B
	kFWwbagrSnQaMpr2J+J9zHI8pUi3f4AuRxkhB+jjcBCRyfUX0GA==
X-Received: by 2002:a05:600c:c48e:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-453659c3bbamr96209715e9.1.1750687793267;
        Mon, 23 Jun 2025 07:09:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGa2vbMZNuJPSi8HRpIM8Gidj4Pkak/D89pC4T1P1Q8CIk99VA8TjZO10VvYA/54eGMCXMow==
X-Received: by 2002:a05:600c:c48e:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-453659c3bbamr96209475e9.1.1750687792910;
        Mon, 23 Jun 2025 07:09:52 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ef6edbesm144055485e9.20.2025.06.23.07.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 07:09:52 -0700 (PDT)
Message-ID: <45d66a0c-a5ed-4894-999c-0ed5b732ebb0@redhat.com>
Date: Mon, 23 Jun 2025 16:09:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] mm,hugetlb: Change mechanism to detect a COW on
 private mapping
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>,
 Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250620123014.29748-1-osalvador@suse.de>
 <20250620123014.29748-2-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250620123014.29748-2-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>   
> -	/*
> -	 * hugetlb_wp() requires page locks of pte_page(vmf.orig_pte) and
> -	 * pagecache_folio, so here we need take the former one
> -	 * when folio != pagecache_folio or !pagecache_folio.
> -	 */
> +	/* hugetlb_wp() requires page locks of pte_page(vmf.orig_pte) */
>   	folio = page_folio(pte_page(vmf.orig_pte));
> -	if (folio != pagecache_folio)
> -		if (!folio_trylock(folio)) {
> -			need_wait_lock = 1;
> -			goto out_ptl;
> -		}
> -
> +	folio_lock(folio);
>   	folio_get(folio);

Just realized that this won't work for this patch here, as we are 
holding the PTL.

In patch #2 you do the right thing.

-- 
Cheers,

David / dhildenb

