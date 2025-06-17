Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED01B218AA0
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153798; cv=none; b=ZxKSLw5uAe5vaCTdI8WrcJzeYWnQxmXRqaf6AnexwHXTUxH1lCI6FEik/qW82S5/TCvzcxNrqapiKjiQ94sGnIzyl+kIIx/hjrfln2gRbUyv84+TiEl8Rk2EkNDRgBD/NtHk99nEeLYLU5sMt30kDj6uynoWvymnGrlF8v4k7Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153798; c=relaxed/simple;
	bh=y9PWU5GUxhjJggeZ2t0v/qrg4XfMxZpcGntNLDW1ll0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B3yg6XM1EJc3PZikQney66Di0mhkGcGEHWq6643ErwZ1WrpgejKhrw1aJa5zH+gW4Cgx3sn/2/wEz61X65zAwAj+jbw/mJdMOAe6RicT1kQ0dlgBqvxIA9KNYWAKg1ybkR9ErOzRYMBJ3FUaHj4uoSZbxtGc5HiWdyN2TxoASiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UVllxpjf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UVllxpjf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750153796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lg0mFUm80r9X0igLB1pMrSxygF5fgmEE/5oZN4jlRBc=;
	b=UVllxpjfq4NTLOAeZ8pKi1d44tGpr94rfVasZwcZRIqB+4O33UEfA7h8CIzS2DLvGhZSEl
	JPvl7Ay/8+0ErqemkOdcLwr5z8aFIv85IoT3LvKrSkYCGY9siy1w+G5VsScinvCme/MfXD
	Myq1PzFVmEQC3rlGxBUdpeuwXR6seI8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-WfHqdoyhNjaBV4HTeBq59Q-1; Tue, 17 Jun 2025 05:49:24 -0400
X-MC-Unique: WfHqdoyhNjaBV4HTeBq59Q-1
X-Mimecast-MFC-AGG-ID: WfHqdoyhNjaBV4HTeBq59Q_1750153763
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4530ec2c87cso28193605e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153763; x=1750758563;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lg0mFUm80r9X0igLB1pMrSxygF5fgmEE/5oZN4jlRBc=;
        b=R/ZDRhLIEEA5fmWYlW1q2eRR+1xkPs/1Q28rqj0pFQofQyhQp4jswap+PUqjN3J5J1
         zVY9q2kMqw5klDHBiPubzO6kvhCfLe3NV2KxjUToyvZ3WoQK7UEa52ks6ErJl8hR5Fd0
         b33JB000d8wC0kXXJ4O0QbLnfIUX2eaMwUYpcSpW8Qpj82wdc5EmHAwHsmx4QAF7lzbR
         DR4mmRlT8PRTwFmftExzeqULgkJRc7+V7uQnHm/Zie6lZqUmK2DektIyQpEa+3YyFE95
         6a0OkVg/VIp0I0GFkCOlEEH3ezUMw0TuVYUbcJmqQVrozq/opteIwG9oWVMQKbBLsoZX
         c8wg==
X-Forwarded-Encrypted: i=1; AJvYcCXjespQI/SXEVyLnIwgzviLtXNoIOKjxpavvKGLIUkFQXS/+lfo+7g4gPRB4lS7FYp8cAxlxJs0ZvX0WRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlHA+WO6b675032bP+DZeM9CPhAcheEi3+WmciB+hp5fmlFQNm
	/xS+3L5r3t9nss+u3VY1eedbmKBPqTzar+/UmbedhrEjie/yr/k/bhiuksHqU1JnmhBDO1+yc2L
	C+To60+8YfWM8twdUCeManNaRsqXqaDC+73uQGFPeffIgI8dfxkg+O7ByHQVIFt3W2aHXX47tPB
	mP
X-Gm-Gg: ASbGncvoxk+tqKQWTTmWxtQkvtO7Mn6IvrvFuNysW5+QMk7Zuse2BNgBHvkyWAy8UTI
	Pt6zwovu9gLlQFca8goER/TVKdHSkv37Mv6aaip9NdtmtSryrsjbORDUcJMwFolMuOauAbiPzT5
	5nQXglAP/C6dXNv+LTt767wb7DuYmi7A1C0ZPQ0/8Z9iXDAIS2uRKyMSR//ye+xwKMteIZofoGr
	Xax9Oep5TMQFJlS27jSbYV3KxdqJIqta6kxQH/82l7w0JQV7BYtkQoH/Xq/qb8hAA4lblY34fNW
	HOs8aHFuqUGaP5PXvpQsxvQYsoW3rRWRVfd/B01/X7u8mBmIYHU6bI2rDneGqyfl+DP2g4ns2VG
	0gSODS0VggScUmLxufuM6mwdJv8rEU26Wtzy6GgnKnPwrelY=
X-Received: by 2002:a05:600c:8b66:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-4533ca71c4cmr120176285e9.9.1750153763449;
        Tue, 17 Jun 2025 02:49:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXZNQ8PD9qufR5L3UGiEianFrRGislf+YnSmpb1KcTqInns51iN3qzkWWM7hMwKXRBlIkEGg==
X-Received: by 2002:a05:600c:8b66:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-4533ca71c4cmr120175955e9.9.1750153763021;
        Tue, 17 Jun 2025 02:49:23 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a578510edcsm9430995f8f.8.2025.06.17.02.49.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:49:22 -0700 (PDT)
Message-ID: <6bb233ef-5e56-4546-b571-6a5f052d8b45@redhat.com>
Date: Tue, 17 Jun 2025 11:49:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/14] mm/huge_memory: Remove pXd_devmap usage from
 insert_pXd_pfn()
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
 dan.j.williams@intel.com, jgg@ziepe.ca, willy@infradead.org,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@Groves.net,
 m.szyprowski@samsung.com
References: <cover.8d04615eb17b9e46fc0ae7402ca54b69e04b1043.1750075065.git-series.apopple@nvidia.com>
 <67bc382c49ed8b165cfbd927886372272c35f508.1750075065.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <67bc382c49ed8b165cfbd927886372272c35f508.1750075065.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.06.25 13:58, Alistair Popple wrote:
> Nothing uses PFN_DEV anymore so no need to create devmap pXd's when
> mapping a PFN. Instead special mappings will be created which ensures
> vm_normal_page_pXd() will not return pages which don't have an
> associated page. This could change behaviour slightly on architectures
> where pXd_devmap() does not imply pXd_special() as the normal page
> checks would have fallen through to checking VM_PFNMAP/MIXEDMAP instead,
> which in theory at least could have returned a page.
> 
> However vm_normal_page_pXd() should never have been returning pages for
> pXd_devmap() entries anyway, so anything relying on that would have been
> a bug.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> 
> ---
> 
> Changes since v1:
> 
>   - New for v2
> ---
>   mm/huge_memory.c | 12 ++----------
>   1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index b096240..6514e25 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1415,11 +1415,7 @@ static int insert_pmd(struct vm_area_struct *vma, unsigned long addr,
>   		add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PMD_NR);
>   	} else {
>   		entry = pmd_mkhuge(pfn_t_pmd(fop.pfn, prot));
> -
> -		if (pfn_t_devmap(fop.pfn))
> -			entry = pmd_mkdevmap(entry);
> -		else
> -			entry = pmd_mkspecial(entry);
> +		entry = pmd_mkspecial(entry);
>   	}
>   	if (write) {
>   		entry = pmd_mkyoung(pmd_mkdirty(entry));
> @@ -1565,11 +1561,7 @@ static void insert_pud(struct vm_area_struct *vma, unsigned long addr,
>   		add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PUD_NR);
>   	} else {
>   		entry = pud_mkhuge(pfn_t_pud(fop.pfn, prot));
> -
> -		if (pfn_t_devmap(fop.pfn))
> -			entry = pud_mkdevmap(entry);
> -		else
> -			entry = pud_mkspecial(entry);
> +		entry = pud_mkspecial(entry);
>   	}
>   	if (write) {
>   		entry = pud_mkyoung(pud_mkdirty(entry));


Why not squash this patch into #3, and remove the pmd_special() check 
from vm_normal_page_pmd() in the same go? Seems wrong to handle the 
PMD/PUD case separately.

But now I am confused why some pte_devmap() checks are removed in patch 
#3, while others are removed in #7.

Why not split it up into (a) stop setting p*_devmap() and (b) remove 
p*_devmap().

Logically makes more sense to me ... :)

-- 
Cheers,

David / dhildenb

