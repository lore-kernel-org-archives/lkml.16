Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3703227C16A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750773937; cv=none; b=O76La3JHdWMHGp+u4lZ48keAE//QKanfYID2iEA7DFfuE9e6M9D3Gl+n8r4GnwobxoKVnJE6EWvf+rn2bZEDWGEbXVBrj6yX1VVDGlxEWy4PKMXbMkbsXfpdAbacMQN7OQCZdfsCNsZsT5a9YL0c9x1GsU4t1y5Vltk0dXCD6Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750773937; c=relaxed/simple;
	bh=4bZjGhJ96viCoMiV1pyOq5RDsNiNHRbB3JksGx2DIYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wh/RfNWsxtIQngnYLj191iy1EXVilqPZ6JRfLSC0fXJa1mBeMDBoY/JhtlH7oQFiB7JPCuzZYEYUO1KEISTNAn08a804sU9q0rrMR1WX1VgwPgfp1CQvWunvXq1s92H89m8OKTaNUW4IkxWInCwXPttgq72KUK7WoNw3X2pSQVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=coyXKaEY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="coyXKaEY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750773934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MQW0eK7tbkiGyxI7eA1J0NuZ3Ps4H74rdH6AEE3ZoPo=;
	b=coyXKaEYxWeiYwGSH1/wdNHExOdZEZyZ7lQmFb85/mKwHVbz42ZxCRHd/xpPyYk+9MeTVX
	M6lT7ePeZZqC9EzYh144SA9yYVNbN5TqkIFr3bN5N/nEpWNFSU9sdEeSUuQEHxV0HAYIrl
	tfqv8keJSzQyL4kNMsm/uKG1Wcfu8mk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-be1MNFt8PbOQI51jwx1XfQ-1; Tue, 24 Jun 2025 10:05:32 -0400
X-MC-Unique: be1MNFt8PbOQI51jwx1XfQ-1
X-Mimecast-MFC-AGG-ID: be1MNFt8PbOQI51jwx1XfQ_1750773932
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso30015655e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773931; x=1751378731;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MQW0eK7tbkiGyxI7eA1J0NuZ3Ps4H74rdH6AEE3ZoPo=;
        b=dVkvSBDWF5/OGPMqU+38c1OKK49HnKgsHLfPI3GOtaSlsW8CEJw25CAEXWc4hiSVo4
         zr/mn3u8KGKtER3igp7E8+HBVhi/psV+yQbdlgQdYUZEKxityVqssY8RBNU5s3Gc99UH
         KvnhqxHfxiKFMQQWIzYy220Xk6HXg3Vn1vkMohrAHsyKHLTPSY2hhbTq9z17aFpWOMXQ
         kbeNJqoYqsL9N8r1vHDuODPP4WFpA0onTk+/B1cfPUZROa7Ag7GsoMYIePm6naBplm0B
         G+rLJsRMS5/65wd0mEOcQIlspami/SyhnDVglSD6RseQqrclLuSDzl9sacoSFxu4OIBy
         s9Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVa6uMBNetE+loQ9uQ1caOAlyXtpYOyzenmpuAMEhPhVbWcpp7ycHyFRQZjGM8xm8thUPPWJ7obwhjdIZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUTPT+zmlq8v5rWvW9EfsM35W9jJ8cuq3AqL87CSYZNeVImzh+
	oGGGQYISLWt9wfZfpmBgasuZQZK31OPql2f/MESkEHouiPMtKN8jmtgr2BA0xbYTtGu2taOxa/I
	epRhyWmKjx2CviVHXjdkyC5ckoPEODdTH4YxLoz/bq6MEMXObUwCuMjpQH5hgZ6w12A==
X-Gm-Gg: ASbGnctw4wLDe0qktH9ww7DSIHhQa05KbXeQwgf4TYqQyjzAyFgnXZMxil9QAp8E+ZH
	OnPGPnuWqoWiYWJP3MhQbSJz9DE89WjvQUA5KrCgT273TdJJwwttPrqNWHMU7NOhYlpBxh4Miqy
	rsy72K7iUJEqoURWh469KCTk6ByayTyyf25f9YpLUwDW5ZJoENuxxRg5qobmzjXrH/Fr0nc7ZUO
	ZMITRLe5v7nSrkVvzzpnBNVF5/GvSHObbDHtPcfDRmL/xM42m2EdmdLcw5QwsYLPFBoeSZZMiJt
	+fGiubqFd0RyySiJYfjPgnJfUvKb9p2RTqiMTpHYzJqQ9aLWs5fcba4=
X-Received: by 2002:a05:600c:3ac4:b0:453:79e8:e92d with SMTP id 5b1f17b1804b1-4537b73c382mr31458925e9.5.1750773930107;
        Tue, 24 Jun 2025 07:05:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrEIYWGGUY2XiJL8RsTY7jPeq9BLAiJ+iRwPOvCsahaMmy9zMudkVKGN36xyHiujmJ2yf6LQ==
X-Received: by 2002:a05:600c:3ac4:b0:453:79e8:e92d with SMTP id 5b1f17b1804b1-4537b73c382mr31458225e9.5.1750773929267;
        Tue, 24 Jun 2025 07:05:29 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45372252583sm79847235e9.5.2025.06.24.07.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 07:05:27 -0700 (PDT)
Message-ID: <c6240a90-e02a-4ae2-b144-4fbf82aca6ce@redhat.com>
Date: Tue, 24 Jun 2025 16:05:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] mm, madvise: move madvise_set_anon_name() down the
 file
To: Vlastimil Babka <vbabka@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Colin Cross <ccross@google.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250624-anon_name_cleanup-v2-0-600075462a11@suse.cz>
 <20250624-anon_name_cleanup-v2-3-600075462a11@suse.cz>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250624-anon_name_cleanup-v2-3-600075462a11@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.06.25 15:03, Vlastimil Babka wrote:
> Preparatory change so that we can use madvise_lock()/unlock() in the
> function without forward declarations or more thorough shuffling.
> 
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>   mm/madvise.c | 64 ++++++++++++++++++++++++++++++------------------------------
>   1 file changed, 32 insertions(+), 32 deletions(-)
> 
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 7e8819b5e9a0f183213ffe19d7e52bd5fda5f49d..cae064479cdf908707c45b941bd03d43d095eab6 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -133,38 +133,6 @@ static int replace_anon_vma_name(struct vm_area_struct *vma,
>   
>   	return 0;
>   }
> -
> -static int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> -		unsigned long len_in, struct anon_vma_name *anon_name)
> -{
> -	unsigned long end;
> -	unsigned long len;
> -	struct madvise_behavior madv_behavior = {
> -		.mm = mm,
> -		.behavior = __MADV_SET_ANON_VMA_NAME,
> -		.lock_mode = MADVISE_MMAP_WRITE_LOCK,
> -		.anon_name = anon_name,
> -	};
> -
> -	if (start & ~PAGE_MASK)
> -		return -EINVAL;
> -	len = (len_in + ~PAGE_MASK) & PAGE_MASK;
> -
> -	/* Check to see whether len was rounded up from small -ve to zero */
> -	if (len_in && !len)
> -		return -EINVAL;
> -
> -	end = start + len;
> -	if (end < start)
> -		return -EINVAL;
> -
> -	if (end == start)
> -		return 0;
> -
> -	madv_behavior.range.start = start;
> -	madv_behavior.range.end = end;
> -	return madvise_walk_vmas(&madv_behavior);
> -}
>   #else /* CONFIG_ANON_VMA_NAME */
>   static int replace_anon_vma_name(struct vm_area_struct *vma,
>   				 struct anon_vma_name *anon_name)
> @@ -2109,6 +2077,38 @@ static inline bool is_valid_name_char(char ch)
>   		!strchr(ANON_VMA_NAME_INVALID_CHARS, ch);
>   }
>   
> +static int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> +		unsigned long len_in, struct anon_vma_name *anon_name)
> +{
> +	unsigned long end;
> +	unsigned long len;
> +	struct madvise_behavior madv_behavior = {
> +		.mm = mm,
> +		.behavior = __MADV_SET_ANON_VMA_NAME,
> +		.lock_mode = MADVISE_MMAP_WRITE_LOCK,
> +		.anon_name = anon_name,
> +	};
> +
> +	if (start & ~PAGE_MASK)
> +		return -EINVAL;
> +	len = (len_in + ~PAGE_MASK) & PAGE_MASK;
> +
> +	/* Check to see whether len was rounded up from small -ve to zero */
> +	if (len_in && !len)
> +		return -EINVAL;
> +
> +	end = start + len;
> +	if (end < start)
> +		return -EINVAL;
> +
> +	if (end == start)
> +		return 0;
> +
> +	madv_behavior.range.start = start;
> +	madv_behavior.range.end = end;
> +	return madvise_walk_vmas(&madv_behavior);
> +}
> +
>   int set_anon_vma_name(unsigned long addr, unsigned long size,
>   		      const char __user *uname)
>   {
> 

Personally, I would squash that into #4, given that #4 is pretty small ;)

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

