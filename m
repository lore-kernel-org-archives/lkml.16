Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A701D514E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745824887; cv=none; b=KD9wxAed9Jq58vWXwBSvJ3r4GMux/4jZClP0WG2LLaJhQPD5N+Ij4LvmO3s9sZ0hW0I+Ap2RFqq7u8i3xJlkh6Aba1bfvxBnZgq0lUhuoFxIqmm1MhGvP1zMpyN2vouEqZwRwcllv+xy1v2SQmepbkB1U8lwuHf7UvJtVv9/3Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745824887; c=relaxed/simple;
	bh=9kU6emaXBp4injs62gvKL0Mb5x3U6Zc6yMnEeseG7+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uvWxulGWe9JUkG2MFQB6QQDPM5nYBQTF89Cy/kPGdwoBl0SUiAsnd8oct6FyjfoVMP8mtITvk6Fzp+hKPW0z7JIJxUlEBFWVf6rrTJI7OhF5uFajdx9oXv+4YmevKa+a9nDk70HSjBI1cd3DZq3n/PbRwbdRKdQX1+z2nnCA9yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VYi7gAMV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VYi7gAMV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745824884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iEbmqg7PxxL61F93dafb5OmtTZxeAKgQMmNRWlTSj7w=;
	b=VYi7gAMVgxYqsFI3GLWXe/D91WtoOE+eLOB8PU6jW6PlEJzgrawY3snnv1qUd/X5XvkjNI
	kYgG64ZyaUqbQMWIbru1L465c1hkdQ4ayOlloHV6oGKhykoGjd9y9WAzO0Savnd7yKUlkY
	N8dyy3Kzuzv6Kx1TuwjvT/nOa2CvxIQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-Bj_iXaB1P7WwODDxmlLONQ-1; Mon, 28 Apr 2025 03:21:22 -0400
X-MC-Unique: Bj_iXaB1P7WwODDxmlLONQ-1
X-Mimecast-MFC-AGG-ID: Bj_iXaB1P7WwODDxmlLONQ_1745824882
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d734da1a3so19797715e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 00:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745824881; x=1746429681;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEbmqg7PxxL61F93dafb5OmtTZxeAKgQMmNRWlTSj7w=;
        b=togzfuP+TBYahl+Zo1fanL88+uR9X/R3iC4oM66nDZHXTfUCOpVs1babtiNWMZ6h/c
         qDbBpm5PnauiMD7sdaGaWxs7D8Osqa+jbHxcoNxk2iVCtaJRzH6bd5oak15ayBPQlFC5
         Ewyo/G6+dcF6ZQH09T6vnMASgZ1/zdvJZfeY7hiS091rQGk+JECciZaxJ5q8NTcoHLjC
         46088ABDIs2Obb3v/KcHKQeMVKaAlQphlD9a6mqUzdOEtg08Ki9WzT1J9imiiZRFKYkU
         /sFcAwg0eeSVE8Bw7fXqOXTnE5QOYos/d7/EzxcIt1IIpTy+poWSP/Dtbm8cv0GTOsVG
         lpcA==
X-Gm-Message-State: AOJu0Yw6c7TRbBd4vBeZOgomFEpYdfPGdKMm34DGQY06GnO6/f6hcu7G
	atDwgZDHTqHwdxGOOqZ05ciVFlWNkLP9UacKWqSTIwtZmD7ruDzwhiQkS1Z7x4svXF1QAyfAuRo
	HXSWKqob7bzfVYGq2mI79flubt4wOkqaR4xT/BKobqqlRhuGhJXZ2+Rpn9L+uEUkdkGXyTQ==
X-Gm-Gg: ASbGncu0GA7bujRv+gnE5APWf/1VMMMmHcoMJAxaJC9MtVzOH6yGA2fiXp59LHN+eO5
	LkShU3X+RnT8WWfX8dqj2pjFr/cRPoLZyBF/EqFwo49bGiA6t6++D02Qe9aH2ZccrHnW+fO5d5a
	IFLD18JtwxOTqWGbvXwEyU658gNYdIyGnU25y1OSOtCrwdvoKZtTLKpHfFR9ooW82uefh6p7uDJ
	AtIszdaPJgK1GMv4cJDJP39qsRg5LmSyOmvjxUvUUNSmzENgoy4/iH88I/EDTtH5ThlDFsC1N6m
	V3DoULJE0XAyntcx5r0BmqCUg6bq3TRDfpjb13lcK3phUN3mZFeVmd6V83IC15O1OJMaoGl9g0p
	SCNiI6E0r0tLajaqjuUsOUkU4xkcrXDNl4z48l8Q=
X-Received: by 2002:a05:600c:4509:b0:43c:f8fc:f69a with SMTP id 5b1f17b1804b1-440ab77d34amr64664105e9.4.1745824881542;
        Mon, 28 Apr 2025 00:21:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEb+NfnUSeGTbIn7uCSc7PsyDAalTHMS5AOTDwK2EqVc/dsElIS2TcnE7A5EH8HnZ5aPpDkcg==
X-Received: by 2002:a05:600c:4509:b0:43c:f8fc:f69a with SMTP id 5b1f17b1804b1-440ab77d34amr64663905e9.4.1745824881232;
        Mon, 28 Apr 2025 00:21:21 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea? (p200300cbc72fea002f00e7e58875a0ea.dip0.t-ipconnect.de. [2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a538f4aasm113133215e9.38.2025.04.28.00.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 00:21:20 -0700 (PDT)
Message-ID: <0c2a0d93-bde9-48ec-bfb4-0a0747857f7e@redhat.com>
Date: Mon, 28 Apr 2025 09:21:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mm/debug_page_alloc: improve error message for
 invalid guardpage minorder
To: Ye Liu <ye.liu@linux.dev>, akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rppt@kernel.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, harry.yoo@oracle.com,
 riel@surriel.com, vbabka@suse.cz, liuye@kylinos.cn
References: <20250427100442.958352-1-ye.liu@linux.dev>
 <20250427100442.958352-3-ye.liu@linux.dev>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250427100442.958352-3-ye.liu@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.04.25 12:04, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> When an invalid debug_guardpage_minorder value is provided, include the
> user input in the error message. This helps users and developers diagnose
> configuration issues more easily.
> 
> No functional change.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>   mm/debug_page_alloc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/debug_page_alloc.c b/mm/debug_page_alloc.c
> index d46acf989dde..6a26eca546c3 100644
> --- a/mm/debug_page_alloc.c
> +++ b/mm/debug_page_alloc.c
> @@ -23,7 +23,7 @@ static int __init debug_guardpage_minorder_setup(char *buf)
>   	unsigned long res;
>   
>   	if (kstrtoul(buf, 10, &res) < 0 ||  res > MAX_PAGE_ORDER / 2) {
> -		pr_err("Bad debug_guardpage_minorder value\n");
> +		pr_err("Bad debug_guardpage_minorder value: %s\n", buf);

I would guess everybody setting that should know how to find easily out 
what they tried to set, but in any case

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

