Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08249189915
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 08:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744880023; cv=none; b=jCUhGkG44MBgex1NwQ6mtamFD3Shoe37O6B0hYesos6yXL8gFr3PnvPQYGX5fIwnaWD7PY8uBdUOAdw/A2NiOEr4UwpWwKfMcuFGlhjTH84gHhHsk7rr0U2M/LIe2UYvILulzi27Auk/N4Pwhvx32bl0jykGpq6hB2Wd+TKtQG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744880023; c=relaxed/simple;
	bh=oMpvdnhVSFI42rXYINqHK5Zp/NlGm2d5SH1LI8k38d4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G5h9zXmNIF0FPKEwhuUVhA7yuGj3lfJ+JGXcEbhoFS2h4okw9bvVkqzlqtmnyBngNtrNvLglWbTreG8M73CKu9hDBStAIKG17bCAJDh8AWFOfcXopuR4sPJALMbWre5j9Pla0Vd+kVfbusS37RKnZeVc0GaWyFGTtp60BnRj0Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A4cRn1Dp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A4cRn1Dp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744880018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2kcBUk+4DG24R7NWggEQqL2bJ9ND3sIVqeV/+ijvsxk=;
	b=A4cRn1DpdR5MkzWFH64TBxkSqNUXOdfsgZrM8DWt5zgl12cCKTmhlzhGFzYfxvN1OYpAKd
	fhuib7L65r9E4FxyJtmqiWdOEZutVUFzEmJN75fMjxlgkgNLExa+LyAdhH78GBRbAmhgD9
	rWarNgDIootPi9eAejZjuALxDpRez0g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-ZB7g391GPJmt6Yrz83hqPw-1; Thu, 17 Apr 2025 04:53:36 -0400
X-MC-Unique: ZB7g391GPJmt6Yrz83hqPw-1
X-Mimecast-MFC-AGG-ID: ZB7g391GPJmt6Yrz83hqPw_1744880015
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43947a0919aso4535205e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 01:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744880015; x=1745484815;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2kcBUk+4DG24R7NWggEQqL2bJ9ND3sIVqeV/+ijvsxk=;
        b=ZUkJgNw/E3stVD2j7u4RibINYGpOm+TxdUQHcg/07UtGbm3JMDkkT2EyqSjrZJ9OmD
         oGe/RTNwRPUXZr6BdWlH/DcbZSS6xhLT7x3R57beG8mRlpeH6u0yHTuqIUVQG3u+ouPk
         3QJBm+M0Orz/VUKRYE1762GceQftDO175guFVkg/olZ7CEc3GZrLQSUyhEqhE9U2B+Px
         vEmqwO6p2NttowCoy1DgCHUf/oxQlAb7t3TSvqzd3rLOs5A9YtAuZFbH0EewTK8Tn9D4
         HfRY67lX7s5bRfi3KwTx9vUwylFb03UgVVks033Bw0lKwQza8qHtd4eQsNw0twWqqJXO
         Ndbg==
X-Forwarded-Encrypted: i=1; AJvYcCXiHW5LkUEIqU6iqXRXlJSn4BjC9HIy+fVUpAUDQ4jVDzufUdFLCehQPNNK0q2gPCRw67Yfxda18E6XMqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsclmMU4Xl4ufBETWmhIdAIIl/TZpYR+0gGP0pAKXUTJfl0Q2T
	rgmrFcTyFc3Ct038PdrWsLZ+/PAoeaJ030RJyaWMcLUatmLmYIe1hBM76s5JPFOJeLkiAccgdtr
	zmpDgi7qPYsDpRcNcNyxyXigX/l5Qg8EAVYWpFahTBTTZl+uwYlrH5Dl7lxlXcg==
X-Gm-Gg: ASbGnct4TymedTxl6Mcyb6bVnzehgs6KpPSK51xGeNsECvFetWCEJpAEEjvnT+Cf5Df
	7Btx1TOj3le/N3JkoUntrX9gzXTzvYy0QDW7EJRIxCOu3qUl5G8t7KWJoSB3v0lsjqOe7Gqj3up
	N4/e2inVbiWIsLgTD4mdpgmvfL25+EMbsn3Y5Fp6MZxDI7OWwI9MqRca2x2vzkMBjL+N/Rri2aj
	nMbmRLvrNWSjyafd2/FbU78N/hy7sYYIC3vDybeBja/13J6nCD+q+/HtKxCmGZLOlpiUoZdpTDk
	CPYqKKNuXYndslvD7lNcaliNCTMpssJw5qIWPX6tDfkkomzZAR1NlecZf65fLdvfua6WRy+Ip98
	lN8QVhuULAkDl9NrGJ+/fc6F7H+rlIR5VUUU0fD4=
X-Received: by 2002:a05:6000:2911:b0:399:6dc0:f134 with SMTP id ffacd0b85a97d-39ee5bad76emr4417354f8f.51.1744880015521;
        Thu, 17 Apr 2025 01:53:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5Uu4tAaLEIMtFSpIuJeYTdSbse7O/x8D/VwTGmbvp7qCwHj0XgUSnmP6/rEoiRUYPbKRewg==
X-Received: by 2002:a05:6000:2911:b0:399:6dc0:f134 with SMTP id ffacd0b85a97d-39ee5bad76emr4417333f8f.51.1744880015159;
        Thu, 17 Apr 2025 01:53:35 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:2700:abf9:4eac:588c:adab? (p200300cbc7062700abf94eac588cadab.dip0.t-ipconnect.de. [2003:cb:c706:2700:abf9:4eac:588c:adab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9640fdsm19242804f8f.7.2025.04.17.01.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 01:53:34 -0700 (PDT)
Message-ID: <eb71267a-80ce-49f9-a475-5260df607458@redhat.com>
Date: Thu, 17 Apr 2025 10:53:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add reverse mapping section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>
References: <20250417084904.16806-1-lorenzo.stoakes@oracle.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250417084904.16806-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.04.25 10:49, Lorenzo Stoakes wrote:
> Separate out the reverse mapping part of memory management and assign
> appropriate maintainers and reviewers.
> 
> David has long been invovled in work with the reverse mapping and continues
> to do so, so is well suited to maintain this area of the kernel.
> 
> I have a lot of experience working with the anonymous reverse mapping and
> continue to work in this area, and also have good knowledge of the walking
> code and code related to VMAs.
> 
> This helps people identify who to ask for help, and also additionally makes
> life easier in review.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>   MAINTAINERS | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d834514a047..4f6d09c3fd9d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15499,7 +15499,6 @@ F:	include/linux/mm_*.h
>   F:	include/linux/mmzone.h
>   F:	include/linux/mmu_notifier.h
>   F:	include/linux/pagewalk.h
> -F:	include/linux/rmap.h
>   F:	include/trace/events/ksm.h
>   F:	mm/
>   F:	tools/mm/
> @@ -15539,6 +15538,18 @@ F:	mm/page_alloc.c
>   F:	include/linux/gfp.h
>   F:	include/linux/compaction.h
> 
> +MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>
> +M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> +R:	Liam R. Howlett <Liam.Howlett@oracle.com>
> +R:	Vlastimil Babka <vbabka@suse.cz>
> +R:	Harry Yoo <harry.yoo@oracle.com>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +F:	include/linux/rmap.h
> +F:	mm/rmap.c
> +
>   MEMORY MANAGEMENT - SECRETMEM
>   M:	Andrew Morton <akpm@linux-foundation.org>
>   M:	Mike Rapoport <rppt@kernel.org>
> --
> 2.49.0
> 

Acked-by: David Hildenbrand <david@redhat.com>

Let me CC Rik and Hugh, if they also have interest + capacity.

-- 
Cheers,

David / dhildenb

