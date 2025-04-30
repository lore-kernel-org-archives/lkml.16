Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B7B1DE891
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 21:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746047471; cv=none; b=E44LYnqve5/mHYPyWuBe8HjRKCvQ0JtpLJl4/zG5o/FXFOd7p3h55evBX8GWnoVUuEtvYmII5deTkNhn0kmkPlJxStCR/vI0cpRzuvkiUORRxZryFmd/sZhXeOT1mXGJM2OG0BaW2gbuMgrIXb1HClkOmhx5KHXu+HSbm08Y6gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746047471; c=relaxed/simple;
	bh=mAruXNpxsF7elIiW8MhkP+zHJmm6rxfkLruHbpQWc3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qSkawrJkmtzrNzlLuqHe+VlMf/t1O/OXjAX7rPuJ+iUjDlTuy0CoSocv/lNlKywQUEykM7+UhUjo3F11XZRS1ObiKoAgQFFT2/DhJJUMm8VN8+GzOK/UK9g5YsgTGuXDN06d/rwyCrS9RfIeA0OQLRhRExc758Ca3+AwR2NDlqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N9Q3sOXM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N9Q3sOXM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746047469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MJwnu/1ECDUV4vAsfHu+1tvoPDbq6UAWsPh7WXrqxcM=;
	b=N9Q3sOXMWTR8iW9epDVnACbGALv5JdVrIwkuDrQxI5AkkefCW/c6npIjHrzHdlPw2RPXqV
	z5K+67PRa+ZIcmyUyi3N3tFMDI9+WYgD/ZSymXowB77qgWCdJbxQrURpMiOeh5TMsuUTUS
	OIthqw4ToriznDIUW17vg/1AgiCV7Y4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-UxUemqDNPmydaD76fu33qg-1; Wed, 30 Apr 2025 17:11:06 -0400
X-MC-Unique: UxUemqDNPmydaD76fu33qg-1
X-Mimecast-MFC-AGG-ID: UxUemqDNPmydaD76fu33qg_1746047465
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-440a4e2bad7so6376095e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746047465; x=1746652265;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MJwnu/1ECDUV4vAsfHu+1tvoPDbq6UAWsPh7WXrqxcM=;
        b=VPOlog/ozjzU0tD7TdmDSPiS/yuctVckeBDEF+7KiKUAUSEnBiQ8qowgheEYDkO5iA
         SFZg5r+DQsCEthsF8QkTKeV5vwd6lUNs0Qp9f7jDHnajqa0YIkxcWz0Wi+a8iZ4eWV5i
         pwHUKHbWDd69r/zYPECcZe+KPA55oI+t+Ev/eeeMfR5miZtszDIq4bVUAKBeyTSLDqyU
         3z1yT4kUBT3ZJw0Em8DSHeHaUYHNX5ei9QhQkT+JDWPDzC7wpRZB3aWhtYvCx7JIoeF/
         qAoTfWQ5r8r0TTKdyQPSNjfT/NRj3i1UfHxnbsrCcDvvQ4fIqtemsSBHNHkKCoxBwQai
         rjAA==
X-Forwarded-Encrypted: i=1; AJvYcCVuJDawwYGFzBjp102aVkB1q2KmjH/wuA6X4AUxVRy/XoyntJytRB5+Cr4u32Up0unfjfdB9SeVv1Ekr8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWS5pAELuqpZ+vGZUMKTnGouQxc9+d2v4PlOUajXlzWpVlR/LC
	cBRlsTyA8bVg5wn3ppeaERoepSpRB2NRxIz809+J77dBbPLNSN/fcHcdATknaMTxOOB5x5fKSC+
	zsie3Aiv11V2UW2cSU1o27RIQOwfdIErb4pNR5yLuPHHr9RAjnJBb0znja+6COw==
X-Gm-Gg: ASbGncvm3qGAwmTzynt60bVmpEy7ikletJCHRYUNFqDug97g7VLl21fOKcXErZe2PxG
	/BsLSWiU3AksD9waRaeyqfNesQVnjGfy0zug82n+99QT4QHKn/rfW4kFMwryNgz9+bh0q1dFmel
	XldAiaKej0Wg+JFl93zzkEkkNzazGcK2EMVFZ4pmK88IRdS5z6BjiN18aRE41ylKGD6K3AA2OlX
	oNY38SccUzt11WqYqa5XusTtN3gUVGOE7+qBtaHnk3guKQN6OtRUwiOJ5elIsskmsrLDWFQYw6u
	hHcXBs/Md25MaSrcLDVO66v6uJGqxVWFxIbui1vUcA3kdyfcbNqlQKdXDBNgyoO+qZPj6ME8eyR
	fzcaO4CmiSHuqDsx0Hh6Ujbd/OSHQt/CUN38iLxg=
X-Received: by 2002:a05:600c:c041:b0:43d:fa5f:7d30 with SMTP id 5b1f17b1804b1-441b5cb808emr6119325e9.16.1746047465237;
        Wed, 30 Apr 2025 14:11:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHICN3glWXodUAuzMyW/G6kCxTWxvHSd0KflJIRihQl632hNSkeVXqO3Rswqc6b/h177HP3A==
X-Received: by 2002:a05:600c:c041:b0:43d:fa5f:7d30 with SMTP id 5b1f17b1804b1-441b5cb808emr6119075e9.16.1746047464758;
        Wed, 30 Apr 2025 14:11:04 -0700 (PDT)
Received: from ?IPV6:2003:cb:c745:a500:7f54:d66b:cf40:8ee9? (p200300cbc745a5007f54d66bcf408ee9.dip0.t-ipconnect.de. [2003:cb:c745:a500:7f54:d66b:cf40:8ee9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2bb3f34sm35735235e9.19.2025.04.30.14.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 14:11:04 -0700 (PDT)
Message-ID: <19908a46-feaf-4bbb-b41c-ef5b7d72343a@redhat.com>
Date: Wed, 30 Apr 2025 23:11:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] mm: move folio_index to mm/swap.h and remove no
 longer needed helper
To: Kairui Song <kasong@tencent.com>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>,
 Chris Li <chrisl@kernel.org>, Yosry Ahmed <yosryahmed@google.com>,
 "Huang, Ying" <ying.huang@linux.alibaba.com>, Nhat Pham <nphamcs@gmail.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-kernel@vger.kernel.org
References: <20250430181052.55698-1-ryncsn@gmail.com>
 <20250430181052.55698-6-ryncsn@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250430181052.55698-6-ryncsn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.04.25 20:10, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> There are no remaining users of folio_index() outside the mm subsystem.
> Move it to mm/swap.h to co-locate it with swap_cache_index(), eliminating
> a forward declaration, and a function call overhead.
> 
> Also remove the helper that was used to fix circular header dependency
> issue.
> 
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>   include/linux/pagemap.h | 20 --------------------
>   mm/gup.c                |  1 +
>   mm/memfd.c              |  1 +
>   mm/migrate.c            |  1 +
>   mm/page-writeback.c     |  1 +
>   mm/swap.h               | 18 ++++++++++++++++++
>   mm/swapfile.c           |  6 ------
>   7 files changed, 22 insertions(+), 26 deletions(-)

[...]

>   bool isolate_movable_page(struct page *page, isolate_mode_t mode)
>   {
> diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> index 20e1d76f1eba..9ff44b64d3d6 100644
> --- a/mm/page-writeback.c
> +++ b/mm/page-writeback.c
> @@ -41,6 +41,7 @@
>   #include <trace/events/writeback.h>
>   
>   #include "internal.h"
> +#include "swap.h"

I wonder if we should just have it in mm/internal.h instead?

In any case

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

