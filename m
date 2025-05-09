Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96693230D14
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 14:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746802711; cv=none; b=XiB9wBpUjc8kHDbo4Jv7qKgulYUUnL5zzITI+jsuzMOai0D20aTd2Cl6P9OrNGGkESvYzvtZ1FfmJIyoRXcmXl3B8DRdJRO5evGyauyjCD9yo9u3ueqFcVLTyQCOg0OgeKWQ9PHBW6USXAq7V+q0llfqjAO6av80FgDFzhUz1EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746802711; c=relaxed/simple;
	bh=A2IbgU+Ecz9SB7f6DCI8RAR+fmjOrn/4GOWN5h69Als=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YlQxk4JSu7YMRJAiW80dBsQPXK/Qth7WpjWMlBZ1BWJM7l0+L+Zcha9dYSHvvhte6OHvC2g9KRWwYHpVn/KQ5nN86uH4gZwctrmFO4ktT3gQ8mcSA1RK41gAFJQMG64oJvpJ5UyjrRUvGaP8WBK/WHEzxRjMkKB+Fut9RlsdaCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qr+CPI3y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qr+CPI3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746802708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0TIOKEOXFEdBeMFSYSpw/lLdLicglZ7MeqiXtplqHbE=;
	b=Qr+CPI3yeSUGUhBsuT6+kfNJY55eYfAUmdeYlUSbjqbmiEU9zFlkGwxVtt4j/XB1OqcaEk
	0AEK3oSGctidj9ZI3j1gD9ByNje/Kdjc4to7AtagO9hJbkmhkYVkXd60g/qsiVHJz2TCKO
	/QZFSq3m9iRMA3XQlenqCHCxShmdlV8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-V_-Zx5MnPpu3ujSLiPiagQ-1; Fri, 09 May 2025 10:58:27 -0400
X-MC-Unique: V_-Zx5MnPpu3ujSLiPiagQ-1
X-Mimecast-MFC-AGG-ID: V_-Zx5MnPpu3ujSLiPiagQ_1746802706
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so10537615e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 07:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746802706; x=1747407506;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0TIOKEOXFEdBeMFSYSpw/lLdLicglZ7MeqiXtplqHbE=;
        b=shenHl9oNuAUT66wx+j4t+PAxTIM/qz0mKcpMXGd+nF07zu42AVeDZnPGkylfwkepP
         3dJog1dm3RjzvAacp6ODBbjzIZpCS+I6KyuLsAOBga7+WjFhXNhMcmo0xErqdrosAy+M
         EZZYoLbQy0VuM2/N0Xy3vIXNgYuTzZVWydJzq0LjEij8fXgEy7ZGLhB+UBA9/XEdMj9L
         klc/Larqf63rzelHmMaVMC//EaCzvhDZqnXzD6LkQxqMiAFJQOd0H08JLfbwQrgA0dkJ
         UiuIboXuTC8HPFYnvEwLZJQCbaceme6jO9BfMmKx+CYMNoomzQ3xUMpewINccilpgutb
         butA==
X-Forwarded-Encrypted: i=1; AJvYcCVkw6k1RLY7PPZR3tNmyPS15kKm3cqp00wol9+s902ASKHFe9jFh+BKamGV5ApVFwTDd29coKviUCCGkQE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9063e1s/HWuougTzQry4zrDFaahv6Hmlw0bFqUWZxNe6kdV70
	GD6f5mdmG32R9dQOfwoFP4thcXDoCPV49AAYmu0Kw+j2CW/Igcv4BxPRf3ws2aNIpCc0UHldkwZ
	dNpJwGy7ctldwI7sVn1C+uokMQb5/VUkukwzps/aEJowTGlw5EjmZVdUAEyIifw==
X-Gm-Gg: ASbGncsyu4pxpojHdV/NPqH4lub+gY6qFO800A8DeWVZDdcff74CptPeemjJDnSTX+1
	kwS75q9tO9ZcnZZMXQlkCgLD9G99v9h1D1O5RDnvFgt7mGN/dM2zL9P3/b0Oe+ysRc9VbNh+YOR
	jNqs2lnBOxIVI9hihL9OQEF77T8LcFbFtEdCxTaI1F4KGWRZWSRRPg0To7iIBn9c3eevxdrrzQl
	posLaxHhDuSlZLjsiiCq3XAGn9G+o3ra7/XmDXV3L8hY6zqRRhWO+f9/9U5Q7Uv9WtpnVb05WGd
	0oiJgFPTth4VVDt8Oc6Uip31VC224NWwjLPmRUDLtWt9aFGwLuLMQZpMqFk4J30jpD9xJ+UPm90
	g2KSP1u0vcnqSO1AK0POWnKt5oz72PqOIxSiQDRI=
X-Received: by 2002:a05:6000:2506:b0:3a0:a0e5:d28b with SMTP id ffacd0b85a97d-3a1f6421ecemr3169220f8f.3.1746802705974;
        Fri, 09 May 2025 07:58:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4EkgKSa0Fw3sSGWFnxTkwSyIT42PNLGghxyEMA9R5N53xefutA8VnoC5Gw5yOM4hfwiqTqw==
X-Received: by 2002:a05:6000:2506:b0:3a0:a0e5:d28b with SMTP id ffacd0b85a97d-3a1f6421ecemr3169199f8f.3.1746802705607;
        Fri, 09 May 2025 07:58:25 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f45:5500:8267:647f:4209:dedd? (p200300d82f4555008267647f4209dedd.dip0.t-ipconnect.de. [2003:d8:2f45:5500:8267:647f:4209:dedd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfd6sm3445854f8f.4.2025.05.09.07.58.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 07:58:25 -0700 (PDT)
Message-ID: <239471b5-12fe-4bad-a6e1-e9f0ad195ab5@redhat.com>
Date: Fri, 9 May 2025 16:58:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: khugepaged: convert set_huge_pmd() to take a
 folio
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 willy@infradead.org
Cc: hannes@cmpxchg.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <bc3d4638747e8141133676069336d868c2b2d360.1746795452.git.baolin.wang@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <bc3d4638747e8141133676069336d868c2b2d360.1746795452.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index b04b6a770afe..aca66e7f4fd9 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1467,7 +1467,7 @@ static void collect_mm_slot(struct khugepaged_mm_slot *mm_slot)
>   #ifdef CONFIG_SHMEM
>   /* hpage must be locked, and mmap_lock must be held */

^ that comment probably needs some love.

>   static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
> -			pmd_t *pmdp, struct page *hpage)
> +			pmd_t *pmdp, struct folio *folio)
>   {
>   	struct vm_fault vmf = {
>   		.vma = vma,
> @@ -1476,13 +1476,12 @@ static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
>   		.pmd = pmdp,
>   	};
>   
> -	VM_BUG_ON(!PageTransHuge(hpage));
>   	mmap_assert_locked(vma->vm_mm);
>   
> -	if (do_set_pmd(&vmf, hpage))
> +	if (do_set_pmd(&vmf, &folio->page))
>   		return SCAN_FAIL;
>   
> -	get_page(hpage);
> +	folio_get(folio);
>   	return SCAN_SUCCEED;
>   }
>   
> @@ -1689,7 +1688,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>   maybe_install_pmd:
>   	/* step 5: install pmd entry */
>   	result = install_pmd
> -			? set_huge_pmd(vma, haddr, pmd, &folio->page)
> +			? set_huge_pmd(vma, haddr, pmd, folio)

Wondering why we are not passing in the folio+page pair in here as well. 
I assume in the foreseeable future this code will not be able to work 
with folios large than PMDs?

Apart from that LGTM.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

