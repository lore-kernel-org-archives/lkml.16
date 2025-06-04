Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DFC246775
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 08:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749024729; cv=none; b=sDZBchRkTIsxmXPc02dNBNVrD6NRunCbt7rAT2uo2jApLZ90lcB96O6WE55gay1hK/Ns4hJtqWm6muaKg9JzkyucizMosvZ0REEhqnibxUDGE0R2WiEILVlKIKebHuYxl49BQ/1+ExxkywJn6aFr0oXdc0npWxNPRyaMUGiJVXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749024729; c=relaxed/simple;
	bh=t8KeIKFB5yQ7SrkWbHIp/AM3ev/QqUKReUp0LCpI3IY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T2RWNhmvRxCUXpyofT1iSH43AaccfS5fnCP2Kr97xkgKXXIf+5CBP2zhCjX/kBcBV93yh3i59FLzO4G+tpDBN1uuWSw8K1ZUzX7e1ao48kcHg4nJTjABwPazcdiOl/hsrZJPkuBqKApZqCeihOl/2W1/XI8Xry4Aqa0y8pl811Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OSrEMNLX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OSrEMNLX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749024725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Q/oyWnHrsYxO2IOtFBYyqoAFyVJDzUogmyhp5eVWIF8=;
	b=OSrEMNLXiihZGnrB3nb28X0u9Ba9jT22l73jJqc4dyxFPEBtBiEyfLvVAA69WAhECFhrQX
	0aTsv9EJwkIU951Z5r55xbXZftt7w/MMstmIvrgTaK2gGedAksXsn0gLvL391tSYI60j4i
	b+hdF01k+XbT4eYLTd06li1PjF4vUoY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-YKbsjfFTPTqaFeJh5ZNK9A-1; Wed, 04 Jun 2025 04:12:04 -0400
X-MC-Unique: YKbsjfFTPTqaFeJh5ZNK9A-1
X-Mimecast-MFC-AGG-ID: YKbsjfFTPTqaFeJh5ZNK9A_1749024723
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f8fd1847so1956727f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 01:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749024723; x=1749629523;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q/oyWnHrsYxO2IOtFBYyqoAFyVJDzUogmyhp5eVWIF8=;
        b=kG0bY+FM4HyCNy6/HuVjaDWVXmlmRAhaVdj13Twwa4d69SiJ4rfsza/ynz6BwIFPSR
         2RCGQCdizE4mpBbQb5vuy90Jr921akDqLv/EFu8XzqFtwPJzU+EUWWU2+51LBfyNO6gv
         LwhphhAbUsgrGap2jLtzajm1T0szvnnFu3E9CRGeyj4MPtG2hFYfMiqmUSleO9WmH7cD
         PTSNxfoaQAtH4V8gFEKHuZEypjxQQ2X+aPFOcoW9kWcvmpBV7YjNvSjL/gQAUuqymn30
         Ktm2smjIkm2csSB3Wi3JyT+c+TkA07OpoO+TC1apr8WjoZnpNVg4MLKTbKcurNlAhFk0
         OTIg==
X-Forwarded-Encrypted: i=1; AJvYcCV1vIpR/bTFXnjrpjJo1qtdtJvp5lsIfdtdgCwN0m8R8RGyseK4Bre1M6fQtFe0K9snb/pWi3uP0HrScLI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9L3xraYHK9+r0Zn3KGKFghH/U76xoinRfG88QPoNrXqbqaCfk
	zrAs1bsdIZCgSivaseTowtOXXeMTDIABaTgP/H09OAruK7OUymoTN8upIa5smXswp4JenvwMmSi
	MOhW6yQa8Ot8Gjg+IelwDQRFkCCOYluoOsUyIgt1ZsUO5vvj+UNhWzQyhPwazs6jFMA==
X-Gm-Gg: ASbGncv49H+UzGB87FZ4+UUe0XBhDFfctaVhf2h7XBXootOhTm5u1r/GX8H6eRVbpGO
	8Qr0LF6edDZjXJMHXw1/IcWrymxuB9LPylsrE8qYJqODcjpQkXZ4AEGmnSW1Mvs4W6zMNLXIimH
	1pgctyWB4g3OFKs5R4KIHfbdn8IPJ7r82cGb9FEr3jAQGk8CWxcWtcolrkkQE4wTyYG1x1ZBF4M
	zGPGZpJUPx2YRg1smJhyTuHBOEvOKXFZ7tsB9QQnrqtf9lU0GLjn595f9nYU72cFJ8kRtw38TSv
	IiPBkvBwzHLDFhzEgfs1oZJX9CzZSyqBnqINwva+5pNbZW718n0fKMNfZ3l44kvk6hhyvYRcAdA
	+7zSvQo5iA1hQTQVBqaFatm4UktNpO2IDshXtRGk=
X-Received: by 2002:a05:6000:402a:b0:3a4:f939:b53 with SMTP id ffacd0b85a97d-3a51d95828amr1385004f8f.38.1749024723024;
        Wed, 04 Jun 2025 01:12:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGt9dIwbsj877kD59TvSQrz8WsOJWhY1mPM9yhJ0fJzZUKCo/KdtMaLdHCMhQdAh8eRiEshIQ==
X-Received: by 2002:a05:6000:402a:b0:3a4:f939:b53 with SMTP id ffacd0b85a97d-3a51d95828amr1384974f8f.38.1749024722557;
        Wed, 04 Jun 2025 01:12:02 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf? (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00a017esm20388061f8f.89.2025.06.04.01.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 01:12:02 -0700 (PDT)
Message-ID: <5023a912-1ee9-4082-8656-56e004623367@redhat.com>
Date: Wed, 4 Jun 2025 10:12:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gup: optimize longterm pin_user_pages() for large
 folio
To: lizhe.67@bytedance.com, akpm@linux-foundation.org, jgg@ziepe.ca,
 jhubbard@nvidia.com, peterx@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, dev.jain@arm.com,
 muchun.song@linux.dev
References: <20250604031536.9053-1-lizhe.67@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250604031536.9053-1-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.06.25 05:15, lizhe.67@bytedance.com wrote:
> From: Li Zhe <lizhe.67@bytedance.com>
> 
> In the current implementation of the longterm pin_user_pages() function,
> we invoke the collect_longterm_unpinnable_folios() function. This function
> iterates through the list to check whether each folio belongs to the
> "longterm_unpinnabled" category. The folios in this list essentially
> correspond to a contiguous region of user-space addresses, with each folio
> representing a physical address in increments of PAGESIZE. If this
> user-space address range is mapped with large folio, we can optimize the
> performance of function pin_user_pages() by reducing the frequency of
> memory accesses using READ_ONCE. This patch leverages this approach to
> achieve performance improvements.
> 
> The performance test results obtained through the gup_test tool from the
> kernel source tree are as follows. We achieve an improvement of over 70%
> for large folio with pagesize=2M. For normal page, we have only observed
> a very slight degradation in performance.
> 
> Without this patch:
> 
>      [root@localhost ~] ./gup_test -HL -m 8192 -n 512
>      TAP version 13
>      1..1
>      # PIN_LONGTERM_BENCHMARK: Time: get:13623 put:10799 us#
>      ok 1 ioctl status 0
>      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>      [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
>      TAP version 13
>      1..1
>      # PIN_LONGTERM_BENCHMARK: Time: get:129733 put:31753 us#
>      ok 1 ioctl status 0
>      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> With this patch:
> 
>      [root@localhost ~] ./gup_test -HL -m 8192 -n 512
>      TAP version 13
>      1..1
>      # PIN_LONGTERM_BENCHMARK: Time: get:4075 put:10792 us#
>      ok 1 ioctl status 0
>      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>      [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
>      TAP version 13
>      1..1
>      # PIN_LONGTERM_BENCHMARK: Time: get:130727 put:31763 us#
>      ok 1 ioctl status 0
>      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> ---
> Changelogs:
> 
> v1->v2:
> - Modify some unreliable code.
> - Update performance test data.
> 
> v1 patch: https://lore.kernel.org/all/20250530092351.32709-1-lizhe.67@bytedance.com/
> 
>   mm/gup.c | 37 +++++++++++++++++++++++++++++--------
>   1 file changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 84461d384ae2..57fd324473a1 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2317,6 +2317,31 @@ static void pofs_unpin(struct pages_or_folios *pofs)
>   		unpin_user_pages(pofs->pages, pofs->nr_entries);
>   }
>   
> +static struct folio *pofs_next_folio(struct folio *folio,
> +				struct pages_or_folios *pofs, long *index_ptr)
> +{
> +	long i = *index_ptr + 1;
> +
> +	if (!pofs->has_folios) {

&& folio_test_large(folio)

To avoid all that for small folios.

> +		unsigned long start_pfn = folio_pfn(folio);> +		unsigned long end_pfn = start_pfn + folio_nr_pages(folio);

I guess both could be const

> +> +		for (; i < pofs->nr_entries; i++) {
> +			unsigned long pfn = page_to_pfn(pofs->pages[i]);
> +
> +			/* Is this page part of this folio? */
> +			if ((pfn < start_pfn) || (pfn >= end_pfn))


No need for the inner ()

> +				break;
> +		}
> +	}
> +
> +	if (unlikely(i == pofs->nr_entries))
> +		return NULL;
> +	*index_ptr = i;> +
> +	return pofs_get_folio(pofs, i);

We're now doing two "pofs->has_folios" checks. Maybe the compiler is
smart enough to figure that out.

> +}
> +
>   /*>    * Returns the number of collected folios. Return value is always >= 0.
>    */
> @@ -2324,16 +2349,12 @@ static void collect_longterm_unpinnable_folios(
>   		struct list_head *movable_folio_list,
>   		struct pages_or_folios *pofs)
>   {
> -	struct folio *prev_folio = NULL;
>   	bool drain_allow = true;
> -	unsigned long i;
> -
> -	for (i = 0; i < pofs->nr_entries; i++) {
> -		struct folio *folio = pofs_get_folio(pofs, i);
> +	long i = 0;
> +	struct folio *folio;

Please keep the reverse christmas tree where we have it. Why
the change from "unsigned long" -> "long" ?

>   
> -		if (folio == prev_folio)
> -			continue;
> -		prev_folio = folio;
> +	for (folio = pofs_get_folio(pofs, 0); folio;
> +			folio = pofs_next_folio(folio, pofs, &i)) {

Please indent as

for (folio = pofs_get_folio(pofs, 0); folio;
      folio = pofs_next_folio(folio, pofs, &i)) {

But the usage of "0" and "&i" is a bit suboptimal.

for (folio = pofs_get_folio(pofs, i); folio;
      folio = pofs_next_folio(folio, pofs, &i)) {

Might be better.

-- 
Cheers,

David / dhildenb

