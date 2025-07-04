Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A90321E5E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615791; cv=none; b=X/FMALOLjn2Xmq7XiCQNHKpYUqZt5FFs1lbiVa2a0bnRJ1JUYxx/GWQCHeQqhlmKOAdowt7+UOzYEFWgnzjf0/MXNgrOnQ08g/PyYX9YBxIEwIJC8sBkD9D+KAKNJB3T2kRHV2HLy+3Zprf7zTTe0KSNx1wS/EnhRaQyU+dXCaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615791; c=relaxed/simple;
	bh=Cx8GCnQwlVs+0cZzdmyltfEszaQtvN1psdzaOH+jcGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aszgxqoMYYVXp2hDMb7blznpBFr2+U0592KBYkbPb3CWSt1nNn4ppf1wHBfGHV/If7pdo3P6q37rsjF8yblkSNKpWJoa7If4RPtkezDgpPAROaFh8YldLRwNYlBfVOvDkzPSdFxj79icKoACqARATc7Df/fJle+RCICMFQL6RmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D8YQGTaI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D8YQGTaI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751615787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0uaRp4EpGhUSeziv02wWzTYB6IodAtLkWURM9ee31dI=;
	b=D8YQGTaITpy+WILjnOCGy4g/t9cZmfSvxm6nZDrdIgtQXCegRJtj2Loe6JpQ2ZqXM467oC
	KPMrO39BLSH7z07ErxWRv6Q9qrWtm9LdP2i2GnG9FzVOOWdp0PBdhTUFmnMEXAuoEMBY4J
	+L3dI6WuA9mq725R5zrAjrYdrf/v0D4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-tJIL5kY3NaqbkWSNcBjkVg-1; Fri, 04 Jul 2025 03:56:26 -0400
X-MC-Unique: tJIL5kY3NaqbkWSNcBjkVg-1
X-Mimecast-MFC-AGG-ID: tJIL5kY3NaqbkWSNcBjkVg_1751615785
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d64026baso2464125e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 00:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751615785; x=1752220585;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0uaRp4EpGhUSeziv02wWzTYB6IodAtLkWURM9ee31dI=;
        b=t8ogBDGXFbJ1/phxX8syzPT0YBhe9d1msF/4m/lWbTW4+r3RgKFwvH0QXOA1GVkEml
         UAU9COc13Ggjb0VrISlV6Yo4irnQt6DIGd0lcUMr5ZGXiHTmOSGcOuZMjypkboOVFRRo
         pIq5SPssxNTX6QRRgSu0eyNoFWJX20bn92m0lUwG4hx+z5uNvgu042cfsaANlJqYZDvc
         qkX/Z6+C0ZO3zR8EYmLNDmERyhU/VDTjzVv7b6kJF8AYnlejGZnPoNrsrrlNfSNaPvu7
         +kIw2+iHTLyRzxZSUSVSNeWs+p8u3WGaLPHqA33csgWPpPI5ryAih0N+HxKRdnnot+AL
         eaeA==
X-Forwarded-Encrypted: i=1; AJvYcCVCkVoNYcq33awSbBcOmQCTnjAKqjS85OnbmUL9xA4oYTGoRBalap/0i6v/RSnQB5kOn9DOLgRERlrGMQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNDAeJUcPj1qjMzGoMp3dJof9c4xqP26flh5QVOoDrhI2atgL3
	P8U+WPurtu3VU/z4fCv5j23eU6oRaTGQm5Ft6q3tTewJ8Q9Z+spJ8qi3DGfjV9Nf5EyveQgyfnF
	zQqwYO6sMwSXTd81Jt6zaACWURweYRt9NLkbaE6Npf1QK1Cj+8EolzjOrLzZXAvtWpg==
X-Gm-Gg: ASbGncvPHdSy+PDt3s5l3x7H0Clkrrm0XHWGEu1BEMFaTffSeHBPQi5okmqd5uwQVN5
	251ORX/9jkBdP07UrgJFLaqjK8D6RxsTNe0umVcaOesWL1eVxYMAgbZJ9QEp1qS0lIMhQOtowgr
	lm5y9RgGCDwFW/qAFmivEME4Suehjw5sO3BnaDW0JwyB/og3adkNI9Zc6C/LU7lgoovLNLck5bv
	fiivWZYRfmiGdVS009g1OCUnFHePn8IGw7VEzPTGBcuzYS95fshcDFfe/i4UefuYOynivzwUrS1
	O1847ikF2kESXlePrVRbsGYLceXJLezBBiPH14n4JoX+oBEb7MYPMh+uWgaW0AU3IhPvJDEnBSf
	pAUQfKAjCrFZaRPymu6fe06WuYPk6PkoXqp9bDc5Q06fKuzU=
X-Received: by 2002:a05:600c:3e1a:b0:454:aba2:c332 with SMTP id 5b1f17b1804b1-454b3187c22mr14015515e9.29.1751615785170;
        Fri, 04 Jul 2025 00:56:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5QPrWj7L9jFsdKgPgTH8F2oFmdewm+dCoh4A6AxVtHkNOjPG73CwemCQhmtK/JCTNeSmafg==
X-Received: by 2002:a05:600c:3e1a:b0:454:aba2:c332 with SMTP id 5b1f17b1804b1-454b3187c22mr14015215e9.29.1751615784694;
        Fri, 04 Jul 2025 00:56:24 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:5500:988:23f9:faa0:7232? (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47285c9f9sm1807879f8f.93.2025.07.04.00.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 00:56:24 -0700 (PDT)
Message-ID: <97d3993c-12aa-4917-9bbd-d9c94fbda788@redhat.com>
Date: Fri, 4 Jul 2025 09:56:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] mm: introduce num_pages_contiguous()
To: lizhe.67@bytedance.com, alex.williamson@redhat.com,
 akpm@linux-foundation.org, peterx@redhat.com, jgg@ziepe.ca
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250704062602.33500-1-lizhe.67@bytedance.com>
 <20250704062602.33500-2-lizhe.67@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250704062602.33500-2-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.07.25 08:25, lizhe.67@bytedance.com wrote:
> From: Li Zhe <lizhe.67@bytedance.com>
> 
> Function num_pages_contiguous() determine the number of contiguous
> pages starting from the first page in the given array of page pointers.
> VFIO will utilize this interface to accelerate the VFIO DMA map process.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>

I think Jason suggested having this as a helper as well.

> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> ---
>   include/linux/mm.h | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 0ef2ba0c667a..1d26203d1ced 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -205,6 +205,26 @@ extern unsigned long sysctl_admin_reserve_kbytes;
>   #define folio_page_idx(folio, p)	((p) - &(folio)->page)
>   #endif
>   
> +/*
> + * num_pages_contiguous() - determine the number of contiguous pages
> + * starting from the first page.


Maybe clarify here here:

"Pages are contiguous if they represent contiguous PFNs. Depending on 
the memory model, this can mean that the addresses of the "struct page"s 
are not contiguous."


> + *
> + * @pages: an array of page pointers
> + * @nr_pages: length of the array
> + */
> +static inline unsigned long num_pages_contiguous(struct page **pages,
> +						 unsigned long nr_pages)
> +{
> +	struct page *first_page = pages[0];
> +	unsigned long i;
> +
> +	for (i = 1; i < nr_pages; i++)
> +		if (pages[i] != nth_page(first_page, i))

if (pages[i] != nth_page(pages[0], i))

Should be clear as well, so no need for the temporary "first_page" variable.

Apart from that LGTM.

-- 
Cheers,

David / dhildenb

