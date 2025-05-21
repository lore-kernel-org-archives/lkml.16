Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D58425C802
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747823132; cv=none; b=sRbyDffkFsmR9lNhnckLeyLZ764mGSFN6yoWiV/unZ2BfsTKc5cvj70L3v9JZN2sRF1t+BjpJWotuIzr0D8Wss2CVNBXO3TyeUKQzShF/07WmbrA1/5mQQQ5h7ltkB25fXAn8UXnBu8gV6mIldZFFBPiKSotakg4VoXGaCsNlg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747823132; c=relaxed/simple;
	bh=aNMA5GpZzY60QkMy/p2/ETXnXrwPpW/JHm5faOWS6ho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePf2C84G1A1P4Up5b9Eq+cHrTBu3o5EYiUrg/qoNSNLwh4qDNxkEI47uGEPhOi3jnTCUPiXwwPQ5PRIqLQVmilEDvK9sJaKg2SCL+BhtZbRkuMZdqhqFNBtUMaWeTP3MxvczOAScBLJDMhuSqUNq3bNA8Rbs5vCYJlq8nbAjlsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Go9oNXwe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Go9oNXwe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747823129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=OmRNDn9pMz2kvSgpRMSd6bVT5frXfvGrBhompz0Lfnw=;
	b=Go9oNXweidOYu+EIyHhIE1I2bmc2tqFZd3sv/KGo0yJh4UxbtHOQU3kbXgQnn2IYoF78fZ
	XAMbJkslxuwzYUveBFUdzOn6nhktB1S3yXN0MrXd7m0rKQCAgKuFLYDVFD1u2xwwu3paXb
	s3s1pdaMZTn/QD8zhfT3L+O2nCCOlds=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-8bBdDSyVN4eeWZ-O1Lhjaw-1; Wed, 21 May 2025 06:25:28 -0400
X-MC-Unique: 8bBdDSyVN4eeWZ-O1Lhjaw-1
X-Mimecast-MFC-AGG-ID: 8bBdDSyVN4eeWZ-O1Lhjaw_1747823127
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-442e0e6eb84so41614155e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 03:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747823127; x=1748427927;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OmRNDn9pMz2kvSgpRMSd6bVT5frXfvGrBhompz0Lfnw=;
        b=q/vXcibsItP0TKMBmjR5nRByITMyOyDK6RV159vKiAnn7MEYqy8EiBSifGUO3292tA
         NITKHMUs09wgOo3v07QHOW/54UavzIf2dzaZaYebl0VZv5LBsy4btv95fNCNlksr9Yt4
         xPU3dQF10VXHaZEYkRFlZxKGcZS7LJrtWwIE42sX7Ig77Wy5Q+C/mtx6tI21AfYB8mzx
         HODzW5+KHh/bwnBeIrbBHUYI/xP44aGMiAYKuWCiqxz+ow6of4nB8fbNebOQTvcqmVPC
         dJ+4vQ7ivabzp9VuadvBIlHEiOpw+qXohDziahhXD240ZoY0onoTOJhm52oysgmnS+YF
         jEVg==
X-Forwarded-Encrypted: i=1; AJvYcCW8NKZqKBM/SrkVqDNkXqn8HkbTtkUIxxNc669A3aZ67pxmXJgFdS+KHwF/uNAB7AmXqQg/E4gI2KVZBdI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw79E+bQ9JWATjXcQ8AmIzIHP/tH7y4KQ6DpQLHwyta8yf/VUK5
	f4+iNVgy4o3UGX0Cn0SwtfF0vLzR1aVUrnyqXieTi0zKng1j8vWnDWuBxAYYQrQOYKVTcI3RytG
	ryy+34P3zBN+5NxQlQJakNzGhhkJHSikuPVKKNAk13dLgb8K6LXsCz2XNFYoKmN5W3w==
X-Gm-Gg: ASbGnctaCphkp9oe9CQU4Jm513jxu5sv6QSXjMRWo1ytmc5/EezqnbQ+hcI/1kWgbNY
	yxp71692M3FOxnm/YX4XcvEJ3X7jNJ9MyYvo5NgVHpddSU7I/tHuXxePz1c8VlwMbvpd4is7goK
	7MeJtiITikf7X8KKZ/C2cSrmc9URkkrYq2XTUMGHpH9R5Bsizg9E4NMhIZJEjtMWoEXVR2ND5Il
	md5JjwIGURwt9sw2SMX4X9Gb9NtEdhq5ro99DC6DfobIG5cT3uzQsI2/FEj8LFs+1M8d5KxAEtM
	D4gfxnGZkejHTduMoiNPuLjNj4YvUtYTUICfD5923hhty0oI+CoMyN0fQiWHe8ylKbbqGOEWplG
	awyvIFiXNCFmYAV8HOX9Xbn1qplboP6WhnSF/mMw=
X-Received: by 2002:a05:600d:19:b0:442:f97f:8174 with SMTP id 5b1f17b1804b1-442fd6313f4mr138654595e9.18.1747823127364;
        Wed, 21 May 2025 03:25:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFK31hCOI4AspdeyWTmUBM6tm6OjfoTLQ56G1e4yH46eK8Cne2OwOfr7oe4xsHWdMwN9VP/Ig==
X-Received: by 2002:a05:600d:19:b0:442:f97f:8174 with SMTP id 5b1f17b1804b1-442fd6313f4mr138654385e9.18.1747823126926;
        Wed, 21 May 2025 03:25:26 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60? (p200300d82f259c00e2c76eb58a511c60.dip0.t-ipconnect.de. [2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f0552esm63045705e9.11.2025.05.21.03.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 03:25:26 -0700 (PDT)
Message-ID: <62b5ccf5-f1cd-43c2-b0bc-f542f40c5bdf@redhat.com>
Date: Wed, 21 May 2025 12:25:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
To: Pu Lehui <pulehui@huaweicloud.com>, mhiramat@kernel.org, oleg@redhat.com,
 peterz@infradead.org, akpm@linux-foundation.org, Liam.Howlett@oracle.com,
 lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com,
 pfalcato@suse.de
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, pulehui@huawei.com
References: <20250521092503.3116340-1-pulehui@huaweicloud.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250521092503.3116340-1-pulehui@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.05.25 11:25, Pu Lehui wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> We encountered a BUG alert triggered by Syzkaller as follows:
>     BUG: Bad rss-counter state mm:00000000b4a60fca type:MM_ANONPAGES val:1
> 
> And we can reproduce it with the following steps:
> 1. register uprobe on file at zero offset
> 2. mmap the file at zero offset:
>     addr1 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);

So, here we will install a uprobe.

> 3. mremap part of vma1 to new vma2:
>     addr2 = mremap(addr1, 4096, 2 * 4096, MREMAP_MAYMOVE);

Okay, so we'll essentially move the uprobe as we mremap.


> 4. mremap back to orig addr1:
>     mremap(addr2, 4096, 4096, MREMAP_MAYMOVE | MREMAP_FIXED, addr1);

And here, we would expect to move the uprobe again.

> 
> In the step 3, the vma1 range [addr1, addr1 + 4096] will be remap to new
> vma2 with range [addr2, addr2 + 8192], and remap uprobe anon page from
> the vma1 to vma2, then unmap the vma1 range [addr1, addr1 + 4096].
> In tht step 4, the vma2 range [addr2, addr2 + 4096] will be remap back
> to the addr range [addr1, addr1 + 4096]. Since the addr range [addr1 +
> 4096, addr1 + 8192] still maps the file, it will take
> vma_merge_new_range to merge these two addr ranges, and then do
> uprobe_mmap in vma_complete. Since the merged vma pgoff is also zero
> offset, it will install uprobe anon page to the merged vma.

Oh, so we're installing the uprobe into the extended VMA before moving 
the page tables.

Gah.

> However, the
> upcomming move_page_tables step, which use set_pte_at to remap the vma2
> uprobe anon page to the merged vma, will over map the old uprobe anon
> page in the merged vma, and lead the old uprobe anon page to be orphan.

Right, when moving page tables we don't expect there to already be 
something from the uprobe code.

> 
> Since the uprobe anon page will be remapped to the merged vma, we can
> remove the unnecessary uprobe_mmap at merged vma, that is, do not
> perform uprobe_mmap when there is no vma in the addr range to be
> expaned.

Hmmm, I'll have to think about other corner cases ....

-- 
Cheers,

David / dhildenb

