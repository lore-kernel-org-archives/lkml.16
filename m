Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4932D7816
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534760; cv=none; b=lK+tHSEz5OYNvjG88v+OwjZtmqWGSsXUf5Sjr6TzgL6NV8HmrA52eLVvFEbqJTO0wm0szjAINexSAWDFhbKng5v4QKDHZ14xdJY6FNp7v3dVNABUb7HvG60PMl59xruFige5Bi9GLWm+q9XkVASissYuhw9vPZxe2sMSD+BT5cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534760; c=relaxed/simple;
	bh=1HlNgER/XeQXBjN56DjmSg6J8Ics8lRrooUZJ1Ctn1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n0rj7mLrqI+OoGd2rJf1QM3dGlJ7r9hkOmcSAlspJ6LEpNwOltImnaL2oAYRW3pZjvYZFt3Ok2yEXqq+Vhwsu4cRuN6GKeU/VwgX19N44ha2KhvsrlNATtSNFCcwAy1EEguvzKDyUJiEhi9eREBCI2IzbRAzUXHzxBeGf2Yc3X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SNRuaIpX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SNRuaIpX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751534758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=s6q17pOTAS+Aiy8If5kHz5lqdvEtm3PVC1LWhYJmRb4=;
	b=SNRuaIpXpczo6eFCBJX5XkVONXjUa1DoaHKbqIBv/hx6gjQLzHCDaahWxTogUGvSh88mNS
	K4Q73tUl76PsZbaajh0mElNcB5ADxaXlGFDr+V2G1Qs+ticq1spyZOPDTBQhlD1Ly7s3F+
	f0uFwywKE/C6Vv9jKV1XFUOxECGSGyc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-tC-je5-TPDCwl_FWpB8PCA-1; Thu, 03 Jul 2025 05:25:55 -0400
X-MC-Unique: tC-je5-TPDCwl_FWpB8PCA-1
X-Mimecast-MFC-AGG-ID: tC-je5-TPDCwl_FWpB8PCA_1751534755
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ade57fec429so411822566b.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 02:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751534754; x=1752139554;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s6q17pOTAS+Aiy8If5kHz5lqdvEtm3PVC1LWhYJmRb4=;
        b=ZKoGlqb4q/iOYJUalzJGHSbjjHLXTcUiwM9kt8CWb9FzXBwV7AZa1tEt5ofRbq4vL3
         vv1GPDcJlt/EXkLcHKspNSNjbB3NPsYBgVA3idInr2z0nWG3fJEt59x2DH0fMHHi5MPH
         mFFqi0Of66DFA8+MsMaxoxlXpvAYgkOxPEQsA6EW5m2faMPl8FaUFY2v157j1hOV+yqm
         FK4ZM8N3j2lc/duJB9yP35KkYWgzFfr0yIdDsi+AvXtGnU+kiQfpgXzzQnjHzBo603/c
         8RICs0FsmhTy6zJU/g9DfHXAdP5xmRmRhkzOnY8q6N7x20v3M7NAnytRKPB5pmmNNYrx
         gniA==
X-Forwarded-Encrypted: i=1; AJvYcCV9sgbDl73+v0leecIHVWxGyKl6RxE0yhlib3BzicYyh1eheEMRPduSNYsAJHED5Qfa7XUaYTIH3a7eKkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx69uZdoWUnUR7rT2oukmavPw35hfitVmPsOXH2KtLZtb66ZGUV
	oN4HFLOYijMamZTtwBn/ZI3Oh3jkykOyEKgbkRhoItHq8Ur9iMePNGsDQuBy/ElX0wi2VuEF32t
	oG2ZdeztS0NejqBPmBNkiSbkQohJJEEK6yV5bJBcz2tHyPV9dqdRnPxmlD4yfLdgu9w==
X-Gm-Gg: ASbGncuzAUetQsbEodYMMdYSSqqWxj8L6Z1Bpfyw7Ic+BOVeTRl/OJ1QJ+yeanVykyU
	/GGsQkOmGOVO89jGBwE9oCyRmcCq8IIM+bljH7P7HrOYmDSZg79FS71o94QR04QV5lcsg6YLklB
	me7f6SPfr45mQM6xjRxgZSDBV6F7YMu7ordGwMg+D9oWAT5LLQcaMZ137jEOaLgohJV9jrNdmci
	U8iXiNuD+r0C2mdsaMANPE6RIa70ZF4eD/99Xcr0vhgv/nlEvAoIaofy5C0FT34MXaxiDdpEgjk
	ri2DlXm+/UJ2+ogk8tqFq8INfWe+mYaQgYgUSW/HwcK2
X-Received: by 2002:a17:907:96a8:b0:ae3:6390:6acc with SMTP id a640c23a62f3a-ae3c2c02390mr674330266b.27.1751534754444;
        Thu, 03 Jul 2025 02:25:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtmPFeANToxNNWeQfF+J5Mvm+KGWp4JHbXAKl88BArudgSXqMBW2KfeHvr/5KiHrw8wQPaRA==
X-Received: by 2002:a17:907:96a8:b0:ae3:6390:6acc with SMTP id a640c23a62f3a-ae3c2c02390mr674327466b.27.1751534753911;
        Thu, 03 Jul 2025 02:25:53 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bea1sm1229554266b.146.2025.07.03.02.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 02:25:53 -0700 (PDT)
Message-ID: <1d82c930-be52-4983-9fd7-099df487eb48@redhat.com>
Date: Thu, 3 Jul 2025 11:25:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] khugepaged: Reduce race probability between migration
 and khugepaged
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250703054823.49149-1-dev.jain@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250703054823.49149-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.07.25 07:48, Dev Jain wrote:
> Suppose a folio is under migration, and khugepaged is also trying to
> collapse it. collapse_pte_mapped_thp() will retrieve the folio from the
> page cache via filemap_lock_folio(), thus taking a reference on the folio
> and sleeping on the folio lock, since the lock is held by the migration
> path. Migration will then fail in
> __folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
> such a race happening (leading to migration failure) by bailing out
> if we detect a PMD is marked with a migration entry.
> 
> This fixes the migration-shared-anon-thp testcase failure on Apple M3.
> 
> Note that, this is not a "fix" since it only reduces the chance of
> interference of khugepaged with migration, wherein both the kernel
> functionalities are deemed "best-effort".
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
> 
> v1->v2:
>   - Remove SCAN_PMD_MIGRATION, merge into SCAN_PMD_MAPPED (David, Anshuman)
>   - Add a comment (Lorenzo)
> 
> v1:
>   - https://lore.kernel.org/all/20250630044837.4675-1-dev.jain@arm.com/
> 
>   mm/khugepaged.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 1aa7ca67c756..3fdefc4f4984 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -941,6 +941,15 @@ static inline int check_pmd_state(pmd_t *pmd)
>   
>   	if (pmd_none(pmde))
>   		return SCAN_PMD_NONE;
> +
> +	/*
> +	 * The folio may be under migration when khugepaged is trying to
> +	 * collapse it. Migration success or failure will eventually end
> +	 * up with the PMD still pointing to a PMD-order folio, so return
> +	 * SCAN_PMD_MAPPED.

Nit: the last part (, so return ..) is obvious from the code.

I would have written

/*
  * The folio may be under migration when khugepaged is trying to
  * collapse it. Migration success or failure will eventually end
  * up with a present PMD entry again.
  */


Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

