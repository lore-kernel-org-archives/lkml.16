Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26819476
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745312136; cv=none; b=PU2zq7e2KdaecI/vTWLKnVNUbO6JZqJviOxQUVd7rkNN5efavT1vsOcf4Jokjk9CoFSFEkZ95rKtD6v/G6uxNweEs5xmxOKHHXlRA6jyG2xrD2/fsAhzkj8OX5aO+RrjVqj22j9kkO9/4qMobDVvVYkhaJilrss35elvbpcvKk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745312136; c=relaxed/simple;
	bh=apmG9Ti+LUOUlMvj36joc1Vfm0KCtgUOrR5fmRRqMb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NSrjxK4DUzy1q0HQYFtxR9QWoGy37C0tIWvZDKNxGRQevtHrAqpwjajOmQhqW7GWr5sSWi5i+ZcU4x3tT9EsMDVFIv/7zjkk5r7I+KVhQGnlYRGh/62W0MNA6mwbtmhYayICRnNCMQZLJgBvI9LxwqH+A1+RZvLCrChxKKn4Vdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D/Q7lTrP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D/Q7lTrP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745312133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=FbWJxYFOS3dMWsbwevhBr+w4wPLn+GsH/1Y8Jh+O8nc=;
	b=D/Q7lTrPgfLIqeyHRVRxRj667FsNkbYbjG15+m+QCb0IGZE0hOvoLGSjK/hipJPL9RoOTF
	GUMHYv2WdZs33Ric2I13b+xfjwdJRATFL3tCAxSZ1D15IYHEViRqsVCbaWinki2BUTse/w
	UUoDFAzFS4cv0yYcKivavF1MVq4IU5Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-AE6beaXXPSWOqkrKIwh7GA-1; Tue, 22 Apr 2025 04:55:31 -0400
X-MC-Unique: AE6beaXXPSWOqkrKIwh7GA-1
X-Mimecast-MFC-AGG-ID: AE6beaXXPSWOqkrKIwh7GA_1745312130
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cf3168b87so22867505e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745312130; x=1745916930;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FbWJxYFOS3dMWsbwevhBr+w4wPLn+GsH/1Y8Jh+O8nc=;
        b=sF7jJgcthdV87q3oEZ7M4v3xgYD7VuTOwNng/T0mXkDp27w12fkk4sYxzvLwyrX8IL
         3UdtOvGYI2IBveXdzpZFCPsFVuZlF35K48HNZef83QRCJ40gmGnU8qSKnQlbQzlDki5E
         Q6bRDiWCxcj/IeQGosVZVu9bxhOSK9R70EAuI0Xb2rnShnRAjbj6AfRqaREEwzpl8nU4
         ywPVkHVfVgFSnpcDAijF7wxsYJHS7GzVntjlfRzNXsTz0pU4RVDMxqobSa1yG578iaLR
         9IRhcuD814c7wCoy5VHjMizEg6fwAlsXSsonMe3gbbKhGFiDI2cQv8OSFJ3/RT+K1YKI
         zyAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLcmMxalcRhs1NNWErMrACwyZB2VoaQxo4XOqiMtfxXdBzU1km2M/lblSTn/GsEYxyPXqUkC7v3+43Sho=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6/GMUwQ8x+XDg5WvFWtQQBOy3QH8QWmxBlMSd+Buzi3/ULp1w
	3H48gLxjMLo6sOWGwQbezSRuV6u1llqA+tpWPanvbsOL1eNmd8SBYiOMi81DnwmN/rnZdFTiC/S
	yRegYGMrBx2n1XDlXVv+AoN5aGFf+5YtUaxK6Vfp0oFeGq0ZYeamrX1LnCVTC+A==
X-Gm-Gg: ASbGncuHVU8tT7LI2ExVypgXNvXJf/x5WAtb9d2dD229gxcHnLyli3TsuYu0lZCUM9o
	NKu9ScTyDphtzVOt71iO3dCk9NeB1PI7uFL/i6PEhVSV/C2TxtHWyx66YX/XSWDOtgzfIJkM9BR
	4q2eVWk0PFpE/MZ2dduvGshM1P+nzufbERHHS998sM+/jgXDw+IOT3O1IoVMPP1odiV/Jp2p16K
	QZeMFb8WtBfMqNFndWgVVzvdy7AouL+QwnRJIfvmto+pR2llCHQAk0k/DLbN6A4sJssWrTcGq+h
	T9ujX55hBAjWdiDlXkfMdjF0qL0X65zQnVB0m3gjtYHA+qocRldYF83NjcZQ/v/vawWnhXzpi/+
	yMWa6Z5k3CYVOBSDbznUed5VDmAlNxvOo5zBC
X-Received: by 2002:a05:6000:1846:b0:39c:11c0:eb98 with SMTP id ffacd0b85a97d-39efbae03admr11392510f8f.39.1745312130543;
        Tue, 22 Apr 2025 01:55:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh812NpY0rNiiPhLtMX5eqP/y9lOo7am7/163nBGkdkwzKGo3ci23gaf9u8r73f/4f4DcsOQ==
X-Received: by 2002:a05:6000:1846:b0:39c:11c0:eb98 with SMTP id ffacd0b85a97d-39efbae03admr11392479f8f.39.1745312130173;
        Tue, 22 Apr 2025 01:55:30 -0700 (PDT)
Received: from ?IPV6:2003:cb:c731:8700:3969:7786:322:9641? (p200300cbc73187003969778603229641.dip0.t-ipconnect.de. [2003:cb:c731:8700:3969:7786:322:9641])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433354sm14703096f8f.32.2025.04.22.01.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 01:55:29 -0700 (PDT)
Message-ID: <9b76db16-75a1-412a-8a94-28768ea56a1e@redhat.com>
Date: Tue, 22 Apr 2025 10:55:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] mm/hugetlb: Refactor unmap_hugepage_range() to
 take folio instead of page
To: nifan.cxl@gmail.com, muchun.song@linux.dev, willy@infradead.org
Cc: mcgrof@kernel.org, a.manzanares@samsung.com, dave@stgolabs.net,
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Fan Ni <fan.ni@samsung.com>, Sidhartha Kumar <sidhartha.kumar@oracle.com>
References: <20250418170834.248318-2-nifan.cxl@gmail.com>
 <20250418170834.248318-3-nifan.cxl@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250418170834.248318-3-nifan.cxl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.04.25 18:57, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>
> 
> The function unmap_hugepage_range() has two kinds of users:
> 1) unmap_ref_private(), which passes in the head page of a folio.  Since
>     unmap_ref_private() already takes folio and there are no other uses
>     of the folio struct in the function, it is natural for
>     unmap_hugepage_range() to take folio also.
> 2) All other uses, which pass in NULL pointer.
> 
> In both cases, we can pass in folio. Refactor unmap_hugepage_range() to
> take folio.
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>
> Reviewed-by: Muchun Song <muchun.song@linux.dev>
> Reviewed-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
> ---
> v2:
> Picked up Reviewed-by tags;
> 
> v1:
> https://lore.kernel.org/linux-mm/aAHUluy7T32ZlYg7@debian/T/#m7ba630d783e08ae708453279579093d481c6e721
> ---
>   include/linux/hugetlb.h | 2 +-
>   mm/hugetlb.c            | 7 ++++---
>   2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index a57bed83c657..b7699f35c87f 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -128,7 +128,7 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
>   int copy_hugetlb_page_range(struct mm_struct *, struct mm_struct *,
>   			    struct vm_area_struct *, struct vm_area_struct *);
>   void unmap_hugepage_range(struct vm_area_struct *,
> -			  unsigned long, unsigned long, struct page *,
> +			  unsigned long, unsigned long, struct folio *folio,
>   			  zap_flags_t);
>   void __unmap_hugepage_range(struct mmu_gather *tlb,
>   			  struct vm_area_struct *vma,
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index b5d1ac8290a7..3181dbe0c4bb 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6039,7 +6039,7 @@ void __hugetlb_zap_end(struct vm_area_struct *vma,
>   }
>   
>   void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
> -			  unsigned long end, struct page *ref_page,
> +			  unsigned long end, struct folio *ref_folio,
>   			  zap_flags_t zap_flags)

Oh, and now I realize that you call it "folio" above and "ref_folio" here.

Can we just rename it to "folio" consistently or is there a reason to 
use the weird "ref_" prefix?

-- 
Cheers,

David / dhildenb

