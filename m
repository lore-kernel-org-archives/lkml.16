Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B16E1F4736
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749109876; cv=none; b=FVsLmd0qnYrjwxdHC2OLv5qnZs2Y0hNHvHIW6jX+SNJvGNZHQvy6QtnYheFkZ95hXXp6hJjIY0Meqi2Fhx+qv/pb7+JsuiE9qgnx0P0zvOQTTrctYtEdLheacjrfDADh/ZpYPZemVuOM00vOENUAvWocckKznUtYqipRuMnWEJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749109876; c=relaxed/simple;
	bh=Lcw2/oR3ST9TFGPkVUPNOvOZmZpSDrB3YdIMC1QP2L8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nsKiPpDtL+ZkVEw/lHnWoTR6QbQnLqyDE7kM0gbn3fpywv4m2RAxJgOEFEGM3QTLSoP94tzosrI54+N3BI8O0m1+PQ9efMknQGBNnA3T6sJcmbIHu/P5x5uRYTHeC3zO27BIuDDHHhLB6Nn0oPtmKzz8TLAsNARBjsWAwj6VM3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aFN21FWH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aFN21FWH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749109870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tNvYJN/u2e7HUkQZm+DqJE+py35txakS1gvaoL6MlDk=;
	b=aFN21FWHka9N93Ei9jZ85BvZ/xElI0JoSgDr5qMEq2bNmvTt0M55Jrw3PQ7p5URTbcKqow
	8cLiRGme5uF2O2xxMWxeLComUkb4xOOnvYC8SH7IAVT8yafRHDjmamDuZ2lH6rWmAZhppo
	+qw/Xwa0mRH+FD0np+sVRlnQGxzarUg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-MaSFYngMMY-rarsaI7SY9w-1; Thu, 05 Jun 2025 03:51:09 -0400
X-MC-Unique: MaSFYngMMY-rarsaI7SY9w-1
X-Mimecast-MFC-AGG-ID: MaSFYngMMY-rarsaI7SY9w_1749109868
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451ac1b43c4so3715365e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 00:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749109868; x=1749714668;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tNvYJN/u2e7HUkQZm+DqJE+py35txakS1gvaoL6MlDk=;
        b=MOpuzlCN9wdzTZR6iwxQkW/BUcRIS9yh63zB/gYP0DeJWAm7D6znuHgurTsS8fVgI0
         5bUZgVLihjuEN5kxBCpBmO5Wu0VtWKBpJc5M6XDaGSHoUhE5CgZUbX0pKmwo9YLe52kI
         EDP/UYaB6AoZImFBp7KfTJOOutJ9MtiwF1PuidUVbZFRe6Vg1HLsD+WpoEReeJtIDj7e
         TU1One3jBpQWxuxQzg1Q94YyC/8uKKlmwh9xZGFsCPYay/jR80azZG9VYFq9LhDfxzED
         hjdUfZWT+nLaR1kO9xazY3Ip8oCZ3orcRytDHHldcN3G1PCBaofeHA4fFMk53AMAfhbh
         99+w==
X-Forwarded-Encrypted: i=1; AJvYcCX3zWaXxE+XcwFDmfnR7JpqrzazptoNJJwpC7NBk/xZ/8EJZk/5ts+rBltVZ8cDuylGO3GCFiqS5wdB050=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpBa7IbNwqarsVTPLyvoTaORWaWLXiCIaPdq747yga9d1jdwcJ
	x7B71OYacvY0r+7yr1fdULY9vitOofnzulvBAMd0wT881fE7jQlqH5MlPH//cqF0o8ElipRP+wn
	Uy/BLVu4JJvieZpjfhCkgnIUpAUkN5UBR+8qXw21TLrGXvbAU8PKjIJMwO1Wd8WAPOmr50mbMWA
	==
X-Gm-Gg: ASbGncs3nMLm1LHrHXEZbYEHluATWbXIj6Pg5RhxvgEZ+NaK6U43YkvzjErnP4bRETy
	TXIdkeW3yiwVVub/AbjsJ/IZR50w46BR6HZqt3QP+cBj++iD7wG8Prdj+ogdspF+96qli3zoaq/
	wpJ/l42XmZKabuwUBH0wWxZgGVfOy1O62q1DHaUqQQdV9GlroPD7/fuTZ0VnKhEhdj5qU7NlRPr
	W/tzxW8eq2M9wu6TLifLdd0FT5cuhRiLhEQpX/uAobHvPr7esJcG88KUsN4LEE8ilxS10mSFyfT
	pYfCuMmvMPC9MuW9T73lJsFvu7wKkM0NdS/l3YwxW8GQmCw33eElUfQHZ4uQ0ZjtzeshbmsyZSh
	FZNC3ejB+phIZ+rtwPP6xPxwhvOPs3mKZm9Ts
X-Received: by 2002:a05:600c:4ec6:b0:450:cc3d:6a03 with SMTP id 5b1f17b1804b1-451f0a64ebdmr50638155e9.7.1749109868124;
        Thu, 05 Jun 2025 00:51:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENWTTd3iu3beojcHtFz+lgH+jQcJTxJI8osjg48/g4lotqM1tkBXHSPzeGfzNO8J1N6GqTvQ==
X-Received: by 2002:a05:600c:4ec6:b0:450:cc3d:6a03 with SMTP id 5b1f17b1804b1-451f0a64ebdmr50637785e9.7.1749109867668;
        Thu, 05 Jun 2025 00:51:07 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2? (p200300d82f27ec004f4d0d38ba979aa2.dip0.t-ipconnect.de. [2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5253a7a2fsm2368776f8f.18.2025.06.05.00.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 00:51:07 -0700 (PDT)
Message-ID: <9b04871b-33fb-42cb-840b-88fdb6b93c48@redhat.com>
Date: Thu, 5 Jun 2025 09:51:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] gup: optimize longterm pin_user_pages() for large
 folio
To: lizhe.67@bytedance.com, akpm@linux-foundation.org, jgg@ziepe.ca,
 jhubbard@nvidia.com, peterx@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, dev.jain@arm.com,
 muchun.song@linux.dev
References: <20250605033430.83142-1-lizhe.67@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250605033430.83142-1-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.06.25 05:34, lizhe.67@bytedance.com wrote:
> From: Li Zhe <lizhe.67@bytedance.com>
> 
> In the current implementation of the longterm pin_user_pages() function,
> we invoke the collect_longterm_unpinnable_folios() function. This function
> iterates through the list to check whether each folio belongs to the
> "longterm_unpinnabled" category. The folios in this list essentially
> correspond to a contiguous region of user-space addresses, with each folio
> representing a physical address in increments of PAGESIZE. If this
> user-space address range is mapped with large folio, we can optimize the
> performance of function collect_longterm_unpinnable_folios() by reducing
> the using of READ_ONCE() invoked in
> pofs_get_folio()->page_folio()->_compound_head(). Also, we can simplify
> the logic of collect_longterm_unpinnable_folios(). Instead of comparing
> with prev_folio after calling pofs_get_folio(), we can check whether the
> next page is within the same folio.
> 
> The performance test results, based on v6.15, obtained through the
> gup_test tool from the kernel source tree are as follows. We achieve an
> improvement of over 66% for large folio with pagesize=2M. For small folio,
> we have only observed a very slight degradation in performance.
> 
> Without this patch:
> 
>      [root@localhost ~] ./gup_test -HL -m 8192 -n 512
>      TAP version 13
>      1..1
>      # PIN_LONGTERM_BENCHMARK: Time: get:14391 put:10858 us#
>      ok 1 ioctl status 0
>      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>      [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
>      TAP version 13
>      1..1
>      # PIN_LONGTERM_BENCHMARK: Time: get:130538 put:31676 us#
>      ok 1 ioctl status 0
>      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> With this patch:
> 
>      [root@localhost ~] ./gup_test -HL -m 8192 -n 512
>      TAP version 13
>      1..1
>      # PIN_LONGTERM_BENCHMARK: Time: get:4867 put:10516 us#
>      ok 1 ioctl status 0
>      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
>      [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
>      TAP version 13
>      1..1
>      # PIN_LONGTERM_BENCHMARK: Time: get:131798 put:31328 us#
>      ok 1 ioctl status 0
>      # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> ---
> Changelogs:
> 
> v2->v3:
> - Update performance test data based on v6.15.
> - Refine the description of the optimization approach in commit message.
> - Fix some issues of code formatting.
> - Fine-tune the conditions for entering the optimization path.
> 
> v1->v2:
> - Modify some unreliable code.
> - Update performance test data.
> 
> v2 patch: https://lore.kernel.org/all/20250604031536.9053-1-lizhe.67@bytedance.com/
> v1 patch: https://lore.kernel.org/all/20250530092351.32709-1-lizhe.67@bytedance.com/
> 
>   mm/gup.c | 37 +++++++++++++++++++++++++++++--------
>   1 file changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 84461d384ae2..9fbe3592b5fc 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2317,6 +2317,31 @@ static void pofs_unpin(struct pages_or_folios *pofs)
>   		unpin_user_pages(pofs->pages, pofs->nr_entries);
>   }
>   
> +static struct folio *pofs_next_folio(struct folio *folio,
> +				struct pages_or_folios *pofs, long *index_ptr)

^ use two tabs here

> +{
> +	long i = *index_ptr + 1;
> +
> +	if (!pofs->has_folios && folio_test_large(folio)) {
> +		const unsigned long start_pfn = folio_pfn(folio);
> +		const unsigned long end_pfn = start_pfn + folio_nr_pages(folio);
> +
> +		for (; i < pofs->nr_entries; i++) {
> +			unsigned long pfn = page_to_pfn(pofs->pages[i]);
> +
> +			/* Is this page part of this folio? */
> +			if (pfn < start_pfn || pfn >= end_pfn)
> +				break;
> +		}
> +	}
> +
> +	if (unlikely(i == pofs->nr_entries))
> +		return NULL;
> +	*index_ptr = i;
> +
> +	return pofs_get_folio(pofs, i);
> +}
> +
>   /*
>    * Returns the number of collected folios. Return value is always >= 0.
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
> +	struct folio *folio;
> +	long i = 0;
>   
> -		if (folio == prev_folio)
> -			continue;
> -		prev_folio = folio;
> +	for (folio = pofs_get_folio(pofs, i); folio;
> +			folio = pofs_next_folio(folio, pofs, &i)) {

As discussed, align both "folios" (using tabs and then spaces)

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

