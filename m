Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A5B295523
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751530975; cv=none; b=s/6ICzZ8orHJkFizx11sujvrnv4Rz+1a0dmGj+djOIngby1YAKMmwsBBrpreOjbWeMrkb/tdeovHzcPZFgttwV/qDbJvus1d3cjx/2yeGKOBWTF28ExKnJD3VqjRLBteSnF6MTjvNlkaYZxt7DYJ39M9Kv3Qb811d/Od8EONmTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751530975; c=relaxed/simple;
	bh=fkApeLoHJlSPDyrpIaiq+irh9GDIbCiY6N9OZ8gvgjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AM66tGEDrVj3Adqgwgl1Rkyf2Zqa2tPDs2ypPFx9BX8VmeKAzLBypEWghLifR0LhvV7vXGbFCZ29iyOLEFkNvzU/p3ZDL3VHc5WNtPCqDMdpoX2f9+h/hZLFjQnTQEAQ53iIuHB+8IDInIAiMvpBGO46dHkrScLxvx27y18rMJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KgfnrQ6t; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KgfnrQ6t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751530972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KYpFfvKW2RercEZQpg1SNT5BfLo7zmWLgpj+5gTTpN8=;
	b=KgfnrQ6tfqf0yUiTLV7tBLEbgRi/iImdsWi3u7+sAQRss0ZhOlmpEqpG1S037IN3Jh0+I7
	sLipmQLfl1Zp139bUEeVtQ0v0o6r+YM6PRVhw4sX5LPM/rHms5PfH5KdTCjdnQPqYeqCWs
	ZYfq7jTpz1/yiDsv5JQWV4wB0znXtck=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-G-Gjrc_qPLawmfYgZlNzfQ-1; Thu, 03 Jul 2025 04:22:51 -0400
X-MC-Unique: G-Gjrc_qPLawmfYgZlNzfQ-1
X-Mimecast-MFC-AGG-ID: G-Gjrc_qPLawmfYgZlNzfQ_1751530970
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-607c91a207dso5686463a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 01:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751530970; x=1752135770;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KYpFfvKW2RercEZQpg1SNT5BfLo7zmWLgpj+5gTTpN8=;
        b=HGtrNQELAH3oSm+sTYVgkyY47B/FRoGljgvv8bvs4WbXTZdgguaFw79oPc1/2G0QoT
         NHLkyDXZYuIMZePVwLaYf4JSKLUp4BoCoMYPL5CzETg4pvDucnIfbjMhR8ET6oKK02G3
         RtdVOg3PlYB6jaD/0WHjjVwgkqdKor2jYMlUCLfKnNA0dXpeyd9mAX7rBYn9RQsbTORv
         eccNQjJ8VoKM6rVIZRRGIfVSzWK5rldOeKhoSWxAJIDzkMMHFIAOWYDxnkCMkMdKqy9j
         M8Hbdnv3SFIBXLYVDe32DXUsDhaTREU8hZYttc08tu9fIDa811SUFCqSxPmhFroofkqP
         LRRA==
X-Forwarded-Encrypted: i=1; AJvYcCVVdlTxxBPSBIx6SdsOfFWBOjQ5wO+Sp45w2Pzw7myXgxrd55297KlPyPc1ricu7I4F7RYL6Rs45VS8LPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YySslyoHGajZ05BZZfNMVu9KIC2kSuW7uQGyG53pQ70C7BaAHhL
	VJ7bPY5aRNjatmPf0PNiZKG32kf2Flv4OraC8vUnlqZg6Gzu847cyFn+ZM8G8tNZluIwDO6BdJz
	HeqSE8MyKxkdxpTx/YqFYV+KXQVqystMXEge4VMNmscHzar3iLjlQEU20HYhDLS/fjA==
X-Gm-Gg: ASbGncuteLeO6wODIzhMq6U1FcXsI9lX+EIMN+QI5GcdyX9utv5//zmXlS4ndrl5nOg
	UCyqNC0vji6nr58rQbIujZ/0aB91vzGqtFW+dz/paWk5vSOqwhCIueDzvVkucraOx+ZFAZb90uA
	inMPZvOL+4u4B6lKuu/VyavnLSKatp7Gvsz4CZlUqCDO40JsFJVECGlpZCuwV8y+4TqFJnEzhy5
	QnFd4E19T4bTXnJSNT09KUD37SycHhfLvLyohIy4wGNRDRDn6Kaa2AU+gttgmBbk243+6mj1u+u
	q9qj+8oK65glRNo9P89LmgL6kJGme4iaKl69vnevM38q
X-Received: by 2002:a50:8e06:0:b0:5f3:26bb:8858 with SMTP id 4fb4d7f45d1cf-60e53501392mr4145177a12.34.1751530969967;
        Thu, 03 Jul 2025 01:22:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYBLPgAFvDtBC/I1fllFZ9rSog1RbY0fvUJDtRq94F3z27LoabcavFxet7p3CYLH6sIuCqCw==
X-Received: by 2002:a50:8e06:0:b0:5f3:26bb:8858 with SMTP id 4fb4d7f45d1cf-60e53501392mr4145162a12.34.1751530969452;
        Thu, 03 Jul 2025 01:22:49 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8292076csm10002557a12.32.2025.07.03.01.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 01:22:48 -0700 (PDT)
Message-ID: <d73f0591-e407-4350-9ddd-dc05ff571a8d@redhat.com>
Date: Thu, 3 Jul 2025 10:22:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] mm/selftests: Fix split_huge_page_test failure on
 systems with 64KB page size
To: Aboorva Devarajan <aboorvad@linux.ibm.com>, akpm@linux-foundation.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, shuah@kernel.org,
 pfalcato@suse.de, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, donettom@linux.ibm.com, ritesh.list@gmail.com
References: <20250703060656.54345-1-aboorvad@linux.ibm.com>
 <20250703060656.54345-5-aboorvad@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250703060656.54345-5-aboorvad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.07.25 08:06, Aboorva Devarajan wrote:
> From: Donet Tom <donettom@linux.ibm.com>
> 
> The split_huge_page_test fails on systems with a 64KB base page size.
> This is because the order of a 2MB huge page is different:
> 
> On 64KB systems, the order is 5.
> 
> On 4KB systems, it's 9.
> 
> The test currently assumes a maximum huge page order of 9, which is only
> valid for 4KB base page systems. On systems with 64KB pages, attempting
> to split huge pages beyond their actual order (5) causes the test to fail.
> 
> In this patch, we calculate the huge page order based on the system's base
> page size. With this change, the tests now run successfully on both 64KB
> and 4KB page size systems.
> 
> Fixes: fa6c02315f745 ("mm: huge_memory: a new debugfs interface for splitting THP tests")
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>
> ---
>   .../selftests/mm/split_huge_page_test.c       | 23 ++++++++++++++-----
>   1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
> index aa7400ed0e99..38296a758330 100644
> --- a/tools/testing/selftests/mm/split_huge_page_test.c
> +++ b/tools/testing/selftests/mm/split_huge_page_test.c
> @@ -514,6 +514,15 @@ void split_thp_in_pagecache_to_order_at(size_t fd_size, const char *fs_loc,
>   	}
>   }
>   
> +static unsigned int get_order(unsigned int pages)
> +{
> +	unsigned int order = 0;
> +
> +	while ((1U << order) < pages)
> +		order++;
> +	return order;
> +}

I think this can simply be

return 32 - __builtin_clz(pages - 1);

That mimics what get_order() in the kernel does for BITS_PER_LONG == 32

or simpler

return 31 - __builtin_clz(pages);

E.g., if pages=512, you get 31-22=9

> +
>   int main(int argc, char **argv)
>   {
>   	int i;
> @@ -523,6 +532,7 @@ int main(int argc, char **argv)
>   	const char *fs_loc;
>   	bool created_tmp;
>   	int offset;
> +	unsigned int max_order;
>   
>   	ksft_print_header();
>   
> @@ -534,32 +544,33 @@ int main(int argc, char **argv)
>   	if (argc > 1)
>   		optional_xfs_path = argv[1];
>   
> -	ksft_set_plan(1+8+1+9+9+8*4+2);
> -
>   	pagesize = getpagesize();
>   	pageshift = ffs(pagesize) - 1;
>   	pmd_pagesize = read_pmd_pagesize();
>   	if (!pmd_pagesize)
>   		ksft_exit_fail_msg("Reading PMD pagesize failed\n");
>   
> +	max_order = get_order(pmd_pagesize/pagesize);
> +	ksft_set_plan(1+(max_order-1)+1+max_order+max_order+(max_order-1)*4+2);

Wow. Can we simplify that in any sane way?

> +
>   	fd_size = 2 * pmd_pagesize;
>   
>   	split_pmd_zero_pages();
>   
> -	for (i = 0; i < 9; i++)
> +	for (i = 0; i < max_order; i++)
>   		if (i != 1)
>   			split_pmd_thp_to_order(i);
>   
>   	split_pte_mapped_thp();
> -	for (i = 0; i < 9; i++)
> +	for (i = 0; i < max_order; i++)
>   		split_file_backed_thp(i);
>   
>   	created_tmp = prepare_thp_fs(optional_xfs_path, fs_loc_template,
>   			&fs_loc);
> -	for (i = 8; i >= 0; i--)
> +	for (i = (max_order-1); i >= 0; i--)

"i = max_order - 1"

>   		split_thp_in_pagecache_to_order_at(fd_size, fs_loc, i, -1);
>   
> -	for (i = 0; i < 9; i++)
> +	for (i = 0; i < max_order; i++)
>   		for (offset = 0;
>   		     offset < pmd_pagesize / pagesize;
>   		     offset += MAX(pmd_pagesize / pagesize / 4, 1 << i))


-- 
Cheers,

David / dhildenb

