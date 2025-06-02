Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1A41C3BEB
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 19:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748894317; cv=none; b=RprkDGj4UYaRG3X0jVbNqXo9pml/4wDbB+RdmVxYT4dO65miHGb8pp2PCNH1oW6s9P/2I8z4xgFzOx7nEM1aKgGmprXFKCwnrxwR/EPPmMBiVo2d3KtfwqCdkBM473kOEIDG1yuUbIE2rhhNBJ/o7SP8h9J8xX5b0G2j1E97BLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748894317; c=relaxed/simple;
	bh=iilPU59a+F2zVbjQqib9uJ1LFD99+rz1NGYgqCCm1ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GjJnJo/mYe9w9R8cx9MypElUM+cNZcFHM5mRKJoSHL3wA3BqXd0gCJv5Yugqxl7Y8lNzNFWJN2KQoML/LVEOQWM6l1jREJFkQQhfC2MTmXHe49ukyfgAfJY6Key+OyFJt/Hs623/LHcXjfgXJLJLOwC4678BB038joJ1TmCwhuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H5XSYNao; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H5XSYNao"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748894314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yXwmfqOSMmu7gi2nZDdGi9t5LkJaG+o3VB1UCoHTcFQ=;
	b=H5XSYNaoQ+dTHFcI4nBheptaQoAEJuCESIMJwgLkOBz7UDWrDC1DUPpSUS629Hipzo/7oC
	TVrtjJIj+4a7pwdKFKC+plq+BK2q9CRs+UN9+TH51ri2TaoTqvdD6xdEy6aqcHI/bXIvmb
	n14Nw8nKZkISqzFFLFYpwcaEuB36DCk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-b0tiqHrwOYm_sE5vJsE46Q-1; Mon, 02 Jun 2025 15:58:32 -0400
X-MC-Unique: b0tiqHrwOYm_sE5vJsE46Q-1
X-Mimecast-MFC-AGG-ID: b0tiqHrwOYm_sE5vJsE46Q_1748894311
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so29403975e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 12:58:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748894311; x=1749499111;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yXwmfqOSMmu7gi2nZDdGi9t5LkJaG+o3VB1UCoHTcFQ=;
        b=b8fIkeCSSov/2kN0IpGQebOQ+0S5nXHErCJo0mwJPq/ZO3UN9wQ7evhW2sM4NHg/08
         H1I9kEj+kicN06QcOtvbi3dcx/BmvdLYMbxGFoa2DZbxDngpT+2jEufC9KAoDzZ2q5ap
         cd86Dj38XJSDOIlz9VOmX97gbnGd95t2mMIIWwDT/Bl2yyLv397mM/OtlRIYA4e67RvC
         4w7kbJr4m8qdba1y2b8cQwspkHitojE4npBPwDAllKC5tgtMS5uIqDWupOwMhr+3EP2T
         4QlT568sM+jbiQStSpH+qvQM7YqspF2KGinPx57RnCqetOm0lWrjTQeflwgZlsLyqErh
         HxvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYVEToqRZh8OmLUuCIz2QimhFNrs1BWf8EF4tmuJl3Bv0PjbOeGS9+nHgP9LRf2LOM5sweE26tVSrcrZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk0U9R6/DboqZmRz1rXjc8aVpnVOiu0rrqK2wgZnb1+Ts6KpgX
	3o7sxM4QhfH99Xv+i6p0R+VIkr/AqB/hEfw28CKJMdcyIk/jgwdZgvrqlxFtjlvrBhWVrfD7Vdi
	YAnXVEC1JIJg5GOAol/tL0buJVcHJ6M5MwAuKM7e6pNGKj/fRvS5THPfjCAqA+J90yg==
X-Gm-Gg: ASbGnctZMzfUmFBEhPs/8ZkwtISzxxJlklOFD6L9UJlws1CHkRGySwiH4azvdjjKb2w
	KEOlqE57qS+G3eiQh77vhyo+C5ZGKxffhu8XXL1Ph2U36jILsYnsGdO4UbnG6yyOLofYQFKJ7mz
	YyRD5Wbks/Rz5QeswI2iuWdTgS61ZdwVYKeIdoJYohS4wT3Y+CMJZagiPK5PyEtJik1J7pM2vGS
	z0uVX+IqNPNYtLD1Yhy/yASq+99e+ArnSD180YxHo+eVOWht2445HGkIckHstgjaDCK3+S8S2Ca
	4mFBHCI9gUNhlDYqAKELGMeNUDaKrXEvclOEqEnZMFrEvwfm3cOE/FAYIi+xljt+p5XnpQS0Ur7
	oblBuOeUXR+Zer7+FmxtNce6OMxEgRAOIfZxrm3s=
X-Received: by 2002:a5d:5885:0:b0:3a4:d939:62fc with SMTP id ffacd0b85a97d-3a4f89bf4f1mr9961726f8f.22.1748894311483;
        Mon, 02 Jun 2025 12:58:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+h18BWJl8oFL1SjCQZA3ubfO6tk99p1t6/++sfvt6gXNpNYL350EOirPnllvr8dya7g1b7w==
X-Received: by 2002:a5d:5885:0:b0:3a4:d939:62fc with SMTP id ffacd0b85a97d-3a4f89bf4f1mr9961708f8f.22.1748894311133;
        Mon, 02 Jun 2025 12:58:31 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f34:a300:1c2c:f35e:e8e5:488e? (p200300d82f34a3001c2cf35ee8e5488e.dip0.t-ipconnect.de. [2003:d8:2f34:a300:1c2c:f35e:e8e5:488e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b96fsm15756390f8f.8.2025.06.02.12.58.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 12:58:30 -0700 (PDT)
Message-ID: <a81cd48e-6e02-4366-b88e-4ba31d4a3c5d@redhat.com>
Date: Mon, 2 Jun 2025 21:58:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/madvise: handle madvise_lock() failure during race
 unwinding
To: SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Jann Horn
 <jannh@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, Vlastimil Babka <vbabka@suse.cz>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@kernel.org,
 Barry Song <21cnbao@gmail.com>
References: <20250602174926.1074-1-sj@kernel.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250602174926.1074-1-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.06.25 19:49, SeongJae Park wrote:
> When unwinding race on -ERESTARTNOINTR handling of process_madvise(),
> madvise_lock() failure is ignored.  Check the failure and abort
> remaining works in the case.
> 
> Fixes: 4000e3d0a367 ("mm/madvise: remove redundant mmap_lock operations from process_madvise()")
> Cc: stable@kernel.org
> Reported-by: Barry Song <21cnbao@gmail.com>
> Closes: https://lore.kernel.org/CAGsJ_4xJXXO0G+4BizhohSZ4yDteziPw43_uF8nPXPWxUVChzw@mail.gmail.com
> Signed-off-by: SeongJae Park <sj@kernel.org>
> ---
>   mm/madvise.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 8433ac9b27e0..5f7a66a1617e 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1881,7 +1881,9 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
>   			/* Drop and reacquire lock to unwind race. */
>   			madvise_finish_tlb(&madv_behavior);
>   			madvise_unlock(mm, behavior);
> -			madvise_lock(mm, behavior);
> +			ret = madvise_lock(mm, behavior);
> +			if (ret)
> +				goto out;
>   			madvise_init_tlb(&madv_behavior, mm);
>   			continue;
>   		}
> @@ -1892,6 +1894,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
>   	madvise_finish_tlb(&madv_behavior);
>   	madvise_unlock(mm, behavior);
>   
> +out:
>   	ret = (total_len - iov_iter_count(iter)) ? : ret;

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

