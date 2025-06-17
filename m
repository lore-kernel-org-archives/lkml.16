Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE88220297C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750187035; cv=none; b=Acm5rgKvOcEqh9d/kvaMyP543adlHR6+0xhD9kQufryMPZmf5qhL2EQTm6K7J/hnP2Nue5Nj/9Q/0wSaeSpYYSCA3sZC56YKprrjMPky2rSWb5xhP7NZxW3Qc19VP1HpLGdBNHWYSqjn0jaTv0GlGt5Bc+ctS2jpvbZpnZxoRNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750187035; c=relaxed/simple;
	bh=wwOYibFG+0lc4A/gtOOt61sduDspvlNz8GZmN+PC6dk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kfmtYO0Il9EGePij/f8KAuV2z+UCYBeIjA57M/fJKFKYGqX6et6Hw072k+u04bpPVUprfG6nn5JHDS9xBLNCIGgZR5fHJViLVJVXv17a1AWK/3X6kfJh6Jj1ersTi3ePCinPvVe2DOCfb6WVvKGAvopKXVX+oZAZQ/Ao2aOoI2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cavMUKDf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cavMUKDf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750187032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=APmLizck+xWiMMK/9wwlTCNkq9CY0MJkhFk3I3onfsA=;
	b=cavMUKDfadL+l3J4B31uCNmrKWgkPDcRou8xa3V+39eoVphBUb+jMk5NggRXZoJD7uBI5x
	esm3bClc/PgoO+/Rkl5s6K5ZluGqdgE7rS58b4sYHKtbp/6BVDAfxgx3+uxbkMNG/OQv1L
	eCsV47giYq87kUSzzkB6OR4CiePQumk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-6hSi6jyjPeO7emom7cys3g-1; Tue, 17 Jun 2025 15:03:51 -0400
X-MC-Unique: 6hSi6jyjPeO7emom7cys3g-1
X-Mimecast-MFC-AGG-ID: 6hSi6jyjPeO7emom7cys3g_1750187030
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451ecc3be97so30182205e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750187030; x=1750791830;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=APmLizck+xWiMMK/9wwlTCNkq9CY0MJkhFk3I3onfsA=;
        b=jdJYiF0E7rC1ah9pndEJ+RNmbkT/e89z+VNu6In7XoV7XsocMZb33NOzo1RratE3TY
         we6zPmlm9ddUop0v+Hzvu688sdcwcvJWf8RvChtSz1ZguJSQUjySMocpRgPqy2OiaC5+
         Yg85MCaz8eQsD96Fp2Yn6EtK4oPgE6PDOLgZC0DTrsOZ46HqlQK1GEghxJ/WAEhE9Jay
         4i8Pp5Y/9u8TXLk72VedMAECNV2AC22iBRCRqfMwpkpED8fGvmcZ7xxOm1xTx4O1QrbW
         ulTqbG5uBGBrB3hTZlQR7D9logDrhnuDm4pVyuH3bJtJ3NlvTxOJco8YYMeQA18PCs/o
         8ffg==
X-Forwarded-Encrypted: i=1; AJvYcCVAurp0R66H9FhP6OimnrcjH71MugwaU30XUdWzKnWAHuTKs3YdvZlsqMfvPA5hXkP0O/THXEo8lFhLMjI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzilF3v596YwzldMV0/SOhlJBj7HlNJcTLqwV4zATnvIs6wnPsI
	gyjx9674FhzRsh7dZfo28/0Ey6iCP7BgfTwPlGAsIClkqxOX2qJF5P/kUs/n0j4X9BM3AeLW0ED
	oDHI1RrAsj8V4dTzyFyDVrXN0jZq6bYpxOIbxzTMJjaFTl+zX/JeeQga7IB2fXWYCQQ==
X-Gm-Gg: ASbGncsdxMq87vz9dJfLd9eKtgHz5QSHzL9BV7bpLmPVGtjgDnmTSFuPU6VbJCiu0+2
	yMUBPmFeB1vf0BXEUDtZWyziniGr40dxlGTCdAkqpsZuHU0PdW8hsLm0+SHkeAdWNSdVFxwbWac
	43SmUUETo0ErXAoiXUsRFVC1cRJ2xX8JaYzwEUaVIvE66ZlKMwNJJNXi7oW6/KllaQSFB5nnksI
	iIZH/xvGBKzTMypP9WllJz/OsWZJDbuAnC2LeOBWascTrQnfx6Y+BGXMb2VvJ7nyVzcnJzU4mQv
	n+HhwUWoPLNyK9/LMzFudaspC8ycObjbA8UGaOu3Vu5UGln6ZX+Kg2fVR/qMPkvnGWfNEsAFB40
	TelDJ/Y2iXDzHdB/OmtfRGD32Rb5DU+88zpmeRyH97/aFVO0=
X-Received: by 2002:a05:600c:6097:b0:442:f482:c432 with SMTP id 5b1f17b1804b1-4533caa11ecmr150256955e9.18.1750187029982;
        Tue, 17 Jun 2025 12:03:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFL6ImA2UU6jpdyVeBNK3EdkZb1tdRvZ2FM1i3UsxlNpHfOcIuOvhidIRSiKHB6ZPekQkc8RA==
X-Received: by 2002:a05:600c:6097:b0:442:f482:c432 with SMTP id 5b1f17b1804b1-4533caa11ecmr150256565e9.18.1750187029622;
        Tue, 17 Jun 2025 12:03:49 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e22460bsm194107705e9.6.2025.06.17.12.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 12:03:49 -0700 (PDT)
Message-ID: <42f132ca-63bb-4d21-95cc-9281d95f71f7@redhat.com>
Date: Tue, 17 Jun 2025 21:03:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update maintainers for HugeTLB
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>, Vlastimil Babka <vbabka@suse.cz>,
 Peter Xu <peterx@redhat.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250617185910.471406-1-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250617185910.471406-1-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.06.25 20:59, Oscar Salvador wrote:
> Change my role to Maintainer as I am quite involved in HugeTLB development,
> and will be more so with the upcoming HugetLB-pagewalk unification, so I
> would like to help Munchun take care of the code.
> Besides, having two people will help in offloading some pressure.
> 
> Also add David as a Reviewer since he has quite some knowledge in the field
> and has already provided valuable feedback.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> ---
> I also asked Peter Xu to become a R, but I think he is currently too busy to
> commit to that, but he was happy to be CCed instead :-).
> I already talked to Munchun and he agreed.
> ---
>   MAINTAINERS | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4243612aa7ee..7b274ce8a872 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10975,7 +10975,8 @@ F:	include/linux/platform_data/huawei-gaokun-ec.h
>   
>   HUGETLB SUBSYSTEM
>   M:	Muchun Song <muchun.song@linux.dev>
> -R:	Oscar Salvador <osalvador@suse.de>
> +M:	Oscar Salvador <osalvador@suse.de>
> +R:	David Hildenbrand <david@redhat.com>
>   L:	linux-mm@kvack.org
>   S:	Maintained
>   F:	Documentation/ABI/testing/sysfs-kernel-mm-hugepages

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

