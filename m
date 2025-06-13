Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BD879F5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749821931; cv=none; b=QMRGoOXFaBTjilt+RPpA+CHh1GLuvNRmJVMKKO2e17mSkkptDD9cs0+u2mXFmxSpzEa7P51QJY4yVfir0f5DkZIeHLVSdTSvh6/z8hoRMsdvLFn4nTUUCoAlCIXuhPd8Bl8q9rwQsxPoO5r1JmN/fC7JBOTheF6SWk+MaJu0Qes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749821931; c=relaxed/simple;
	bh=tqC7wSft1NA2BPEW39gbcx+zJB1l4b9bPjKz45aDUAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M72L18dqPb0oqYwanYzO3Trp5XY//PApqatIhMS8nUX0+5JH4E6B5iyzLOesftcgiUy9L6FF2gLvxuGJmCw1VvtQaBo/JXVLyzJDrcdTVhdZIqKPWPlk5Nz7jts3g4NQik9k2KCTgh17BNxS/122fG6oRsjo1r5GBig10G58c1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YHv68eu+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YHv68eu+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749821928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gA+fyTDhlNNImNCJ4jABZvRjAPCgbHPkzMh2Vk4M9w4=;
	b=YHv68eu+/ts3km52WqYKONMQPsfJUoMtECnHKMw2020awcbhLQwudwcnJYuikFwp9PqiE0
	RMSNbc0ryigaXT6MCdZnyinUYQaH9AIboWzuLjuS4JsMBB+PXBWJWr97fl+Y7tilmoVbWP
	X0V2NKjH9l4aCy/Hm0te0N2IU0cfPD8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-iZY4gAZ7PX-BhD-cDYzD7A-1; Fri, 13 Jun 2025 09:38:47 -0400
X-MC-Unique: iZY4gAZ7PX-BhD-cDYzD7A-1
X-Mimecast-MFC-AGG-ID: iZY4gAZ7PX-BhD-cDYzD7A_1749821926
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43eed325461so12706205e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749821926; x=1750426726;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gA+fyTDhlNNImNCJ4jABZvRjAPCgbHPkzMh2Vk4M9w4=;
        b=CYMDBASBUC+XLR6HQuUaWD/cC6nwTibjaM5kDmt2/+WmcaT/3sutlEbJ6QeoGSo6J7
         hELHexchTWPEsBOEBhhVUSkPaMpgJhute32I+oH8sGE0yxSa7OBCapdV/0fl6UiWprqN
         gV68+TOa5AE1JHpXpWZ/kw8t/PRZVkNIfRmVtIsIobLk1eMHUe3dAyUSvRlDSKYwCLbq
         YHeOT9tnTphNAzTqXGz0o/uKO3eVRe4tiFqFd0g14hCF46d0YlfhA7ZtPaEvPpSV5Pfn
         fLdvwcvJ1nqv4d5Op6wK2exJhF3Wm2BKNzJODzIED7q7T8M5ZXwdb16yUJwz/nT83+R5
         lVKA==
X-Forwarded-Encrypted: i=1; AJvYcCVVUM5JE5+C3M2aO/7e759PTY/j2OcWQnJN+NHm830SslqFmdHz9Eaq2fIthOy8AFFa4X9r4IUXeBuUFRI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlTC5U/shNLroPFCVh3bvP1do9hK0b3qu5zTsPPSo+Vb2mm3sC
	HMcBj3YdtnkpHmkawonJ+6/yI/yZu+f+gfcwLtx1PQaEOntWuHnET2v/QkMCFzsSKabyD5cXedN
	SAau7Ddtjbmh0SJ6ZSOaCvm0a6MgNKtCrtRVDUzNeJIGScpRcGQSP2Crnuz93FTwxTw==
X-Gm-Gg: ASbGncsl3jV+3k7q62Gkbm6N9PvyS6LakIVLpwec32WgNDYoCF48N1ezqi6weUVys8k
	s+ZwTTX3bjNik7VkcTpE4iLe4YQMAycHx9JXEuuZLXg0ie34MGFdwxqDkUzfGBHHeFUPsqvigW3
	+y5Ye5Jr+PhVp24ewuUco5RHOdaPS/8dNUqlIDm3Kg5Bsay5hse164Qs+NaFU1fPXGj2ZpfSGaA
	Wcv3/0UuHxVwnm6Xbr0gKmnWLjg9b4YMwCCGfebjWDJI+3Xego8xODeEcAlx3Uf1zDk7ke7hIoI
	f6P2YlzpyKICRmkBfPPVUBHCxCZtRxIYhPvmd9c96HkQW0zh46KK
X-Received: by 2002:a05:600c:821a:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-45334b63134mr26911675e9.22.1749821926089;
        Fri, 13 Jun 2025 06:38:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPc0rAqrtm8Mfy8P9qTOpKk4v0Ra18xaU23rpSwVHpxhe/VL2TcmbeQhBrzEnWo85AfNh6Yg==
X-Received: by 2002:a05:600c:821a:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-45334b63134mr26911485e9.22.1749821925755;
        Fri, 13 Jun 2025 06:38:45 -0700 (PDT)
Received: from [192.168.3.141] (p57a1a50c.dip0.t-ipconnect.de. [87.161.165.12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453305a0d9dsm46813075e9.21.2025.06.13.06.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 06:38:45 -0700 (PDT)
Message-ID: <c885e39c-d58a-42c9-816a-a80a25ae79a4@redhat.com>
Date: Fri, 13 Jun 2025 15:38:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: huge_memory: fix the check for allowed huge orders in
 shmem
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <529affb3220153d0d5a542960b535cdfc33f51d7.1749804835.git.baolin.wang@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <529affb3220153d0d5a542960b535cdfc33f51d7.1749804835.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.06.25 11:12, Baolin Wang wrote:
> Shmem already supports mTHP, and shmem_allowable_huge_orders() will return
> the huge orders allowed by shmem. However, there is no check against the
> 'orders' parameter passed by __thp_vma_allowable_orders(), which can lead
> to incorrect check results for __thp_vma_allowable_orders().
> 
> For example, when a user wants to check if shmem supports PMD-sized THP
> by thp_vma_allowable_order(), if shmem only enables 64K mTHP, the current
> logic would cause thp_vma_allowable_order() to return true, implying that
> shmem allows PMD-sized THP allocation, which it actually does not.
> 
> I don't think this will cause a significant impact on users, and this will
> only have some impact on the shmem THP collapse. That is to say, even though
> the shmem sysfs setting does not enable the PMD-sized THP, the
> thp_vma_allowable_order() still indicates that shmem allows PMD-sized collapse,
> meaning it might successfully collapse into THP, or it might not (for example,
> thp_vma_suitable_order() check failed in the collapse process). However, this
> still does not align with the shmem sysfs configuration, fix it.
> 
> Fixes: 26c7d8413aaf ("mm: thp: support "THPeligible" semantics for mTHP with anonymous shmem")
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
> Note: this general change is suitable to be split out as a bugfix patch
> based on the discussions in the previous thread[1].
> 
> [1] https://lore.kernel.org/all/86bf2dcd-4be9-4fd9-98cc-da55aea52be0@lucifer.local/
> ---
>   mm/huge_memory.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index d3e66136e41a..a8cfa37cae72 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -166,7 +166,7 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
>   	 * own flags.
>   	 */
>   	if (!in_pf && shmem_file(vma->vm_file))
> -		return shmem_allowable_huge_orders(file_inode(vma->vm_file),
> +		return orders & shmem_allowable_huge_orders(file_inode(vma->vm_file),
>   						   vma, vma->vm_pgoff, 0,
>   						   !enforce_sysfs);
>   

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

