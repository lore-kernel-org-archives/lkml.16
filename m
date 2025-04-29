Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4A3EEAA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918378; cv=none; b=Ym0ivKU1byeoqwtfrpgb6f0V2bUCbfsdvN5RjKKGpBIzGgkXEUA4sNlMIWjqYlx3HqXXW4BOTGTfKcYEsRsYUS6k52Rss3brxXDl4GEHX/zILSOBWmfE0W3RDNXl/67e5Nq2yJDo0tlsilbUlZSSEcKlBMpbucuRY3dQ19n58ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918378; c=relaxed/simple;
	bh=6JvESbpRVxIYKeaVP0zlGLqAKSzpwncLjUMrWwgWEHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FDMNCBCCj4/20poP2kQf9+Jf3JdB5mdnSm8RokHFrpmYLZet0EzeDDZqhIbEJB4tmVjvlGxgL3NP+Md31kK3QsMsrzxERpPJDIO/WkJXleahU0Ak95tHQ4fGPe952c2ftZdmFsAvT6sAMu00C6TVIxGwyRiQ/WcGsz5GZXTVkfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DESTQ1tA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DESTQ1tA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745918375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ntwleF0FJ9CC762cUGTggs8PS8FomkuxI5oL0NEGw1s=;
	b=DESTQ1tAkeCewXF1hhuuK99sC1cVydwuty6bu7MjjiCs+y/vAwhV1838jOg/kokQJy0ZuX
	cMSeXJExg8xg1tqvgxPDsJ9IFpN6QupxUprG/RkeaboHPf9p4una+9oDAZ71wooDXvLi3n
	r/UY+S6yYrfTc0ZhCcTu45XeRgvftfs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-RpQy_l81OYuIULr5K5Qa-A-1; Tue, 29 Apr 2025 05:19:33 -0400
X-MC-Unique: RpQy_l81OYuIULr5K5Qa-A-1
X-Mimecast-MFC-AGG-ID: RpQy_l81OYuIULr5K5Qa-A_1745918372
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39ee57e254aso2666199f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918372; x=1746523172;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ntwleF0FJ9CC762cUGTggs8PS8FomkuxI5oL0NEGw1s=;
        b=AFa4HvJ2sSssrYUsFIA1+Kt+UXbSBdaLwt+RPNoC3iZ1XKiV9GZXFnTMzTeN8Jruug
         R2Qq+wbn8S6VBXwgy4sDV/iwmVkuZpzLznnIkvHAxetaTUfDdYs6AHBZYfaekO5kxML7
         bJEDU6DEUI4H2Zyy+ZYEvbkCnl7J9CKFnILKD3+s134ndLp/CDU7AZixupbgsnZGHUyB
         kdUxXyjVek6Yz/ftQWmFo0O3ngJf3bRqUBDxHdFVX8ZXcEQcBqwHSboIRCpqWAF8Qs5c
         U0xow3SHxEQt3eKUWC2DGvOCpJrq+K6HORtPT14F/CEK1Yc4S4RtrM4LHWLlIuvptsIC
         X6hA==
X-Forwarded-Encrypted: i=1; AJvYcCVANesveF8VPdjKufS2oxsOULhgA9Z8l4ZaGm07to8UI7awr8MRlhh/DxH67D9lBm0Yw+4DRG+9khGailA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm20G66UDW/pLWdwSSpqYT4NPQatv84B/gx8T9//tzwZBpXbzY
	fM/BNkU8M7o9UkZVh9j/Uy3lco6XvpNs3MzyEONJCkSCqjOULWw6NUEZQKjz4WHDrqIsbbQwWRL
	6r5VJCvKcpTuxUnW7dImOxYNLrJIlQFGK6Ayk4arH/TrTSqb+BrarE0fbNBSfjQ==
X-Gm-Gg: ASbGnct8s+79maBK7NzWTIh0+e6RBuwAzmj/6VLuIOqDKt5TZqLgOI9PfjsbzJYMnpX
	GJLmqL6M9etwiCi/gVafOOKFqi1aN9/KgFaH7npuDLpHJuLsNIct8nA89eZTxIV0Ig/jbIXiaud
	nHoMsehbeHptJFBDjxjYnahWd+B1YRc5fhUNZYbZB9eI1w8xDcObz3I0o3pGgBERtAxYRdm8i9z
	L1BpWZ+VeXF+FnDn6Xvvc2OjEUEegMwdLkQhjAmNxggUvIrV2QOD/LA3q/wP3ttQt28yj1SALYa
	D6NarDRHu9DopS0deQHVpn4HNxA9dzrEuNvq04xCqUwPnMdkZ5Au0fZrnAQv/pvUYpbB+hfZRAG
	VqXyAJ+yxkBsLC6MaNjt9swBQ2/v6xTzfzunU6yY=
X-Received: by 2002:a5d:5888:0:b0:39f:4591:32bd with SMTP id ffacd0b85a97d-3a08ad46e8emr1499768f8f.34.1745918372372;
        Tue, 29 Apr 2025 02:19:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJXM/BXGCU8UpZr4p6oVQgqq+V2FSJ/lkBP36jdCgXf4fmHFinYxCqBefOh3t374kwrG7LcQ==
X-Received: by 2002:a5d:5888:0:b0:39f:4591:32bd with SMTP id ffacd0b85a97d-3a08ad46e8emr1499730f8f.34.1745918372002;
        Tue, 29 Apr 2025 02:19:32 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73b:fa00:8909:2d07:8909:6a5a? (p200300cbc73bfa0089092d0789096a5a.dip0.t-ipconnect.de. [2003:cb:c73b:fa00:8909:2d07:8909:6a5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e460b2sm13560519f8f.70.2025.04.29.02.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 02:19:31 -0700 (PDT)
Message-ID: <25dcf969-e479-4d4a-a95c-0e83706af99e@redhat.com>
Date: Tue, 29 Apr 2025 11:19:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] mm: Batch around can_change_pte_writable()
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org
Cc: ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, anshuman.khandual@arm.com, peterx@redhat.com,
 joey.gouly@arm.com, ioworker0@gmail.com, baohua@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, namit@vmware.com, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-7-dev.jain@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250429052336.18912-7-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>   #include "internal.h"
>   
> -bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
> -			     pte_t pte)
> +bool can_change_ptes_writable(struct vm_area_struct *vma, unsigned long addr,
> +			      pte_t pte, struct folio *folio, unsigned int nr)
>   {
>   	struct page *page;
>   
> @@ -67,8 +67,9 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>   		 * write-fault handler similarly would map them writable without
>   		 * any additional checks while holding the PT lock.
>   		 */
> -		page = vm_normal_page(vma, addr, pte);
> -		return page && PageAnon(page) && PageAnonExclusive(page);
> +		if (!folio)
> +			folio = vm_normal_folio(vma, addr, pte);
> +		return folio_test_anon(folio) && !folio_maybe_mapped_shared(folio);

Oh no, now I spot it. That is horribly wrong.

Please understand first what you are doing.

-- 
Cheers,

David / dhildenb

