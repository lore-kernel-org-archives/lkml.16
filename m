Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C962D1F40
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750773861; cv=none; b=hEFv+ZWKW92XtQvZmTWBbzYkZGKxI+Ckhxip1NBWDhBbvaq9xcMtEZUsKohuUiAIgf8xc9ukaLultkaNE4emdA7f9ZFAg5j5fyy1LerMhws1wKJf4Zr5ci0PYB6NNK2zMb75rVezQTHjZEppM5/HDbT51VZRwSZ+opGjYgTP+TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750773861; c=relaxed/simple;
	bh=5cCUZ+J83oBjEvi6FoP2y1bGNm2BVHD/+p4u9OoMxJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tn2UHXCyfAiEIodl/YwNIxdDbB5vP5W3sFqXQqxfTue2MI6CfniQS0vQacuv03/z2GSAqxP0Ttu8zr7w4WswFbgyWETir+KLhe3GK8P4nFPKBXJABoRDsCIpaJtD101wF3sxMow4gtRxBjxK8LgTCUyGFb12SfDlRLvi+u4gSaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DxdtVxkU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DxdtVxkU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750773858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=L55FhFc14NLD41++dvoFb1hFZ0+5DHax3bZGFlvVybU=;
	b=DxdtVxkUhmRWoHjdrBNCTN7wb7hUiVZoZhpHrBau20uFu3ti+Punr5sQyJBKhIRnKKAPkH
	UAQVy22LCxAT41BJkVDBNV7UCkM+g1frdT8NtyFrwfgAug+6sQg6V/lKfjGZnNxDTbRg0v
	CAB3y1eZFpsNE/d3CmGTvKU+n5l/SFQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-y1pU5zTiNuygBFs2Xe0CnQ-1; Tue, 24 Jun 2025 10:04:17 -0400
X-MC-Unique: y1pU5zTiNuygBFs2Xe0CnQ-1
X-Mimecast-MFC-AGG-ID: y1pU5zTiNuygBFs2Xe0CnQ_1750773856
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a6df0c67a6so1918744f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773856; x=1751378656;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L55FhFc14NLD41++dvoFb1hFZ0+5DHax3bZGFlvVybU=;
        b=mteA2oAZSTW/rNZEfwQeB8ne3EJ+mV+r3sT5GSKbNtQdJsAXobCLMhv+0nBf2EA4mY
         KiKT2ZWesVD4qCmv2xuwaw8/cnfVgBrZSDjcpU0VOzfwNsvLiKX7WbNz3+6CQc3eNFa4
         Gtzr62gp8YBPLGPc8jnbAqPWUTGK/rXtWrBVtk+cROXElLT9lLJzqUgJAGfqMehKyyny
         eqaT7QTzw2TGvVhFzq1ZY2DEu/+lwlexnokmGHuYVNOnVeSt7/A8m1rKokFY5uJBQFx7
         qfBckLcLo/Zho/1bbLafWcW/MhBwMrLFFOs1e2meApqT1LPabyUnO54ev7owtM1ojPf4
         I5fA==
X-Forwarded-Encrypted: i=1; AJvYcCWIZRsDawsxPY4KfeKP/GO/qLfi2EQPYja0IMyAqwdhtS7TQ/eXLBiLyVci2HEsL46/bVR+4HItf6wdEIc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyycwdf2x8XgxEJyFfClzxb/VD35jUWAtLi8/ky4Im+o+WNCORC
	Ihl/xpk0ypwo1F7vmdwONQz8oTDRyU6j1EUYUuDXD56q0FeKc81Mm1cCMTgW1c3jvNvA4nssY9Y
	TgQVvnjpVZgFn356iBzEITHk1N3KcV4ndMprdPqz4OWyLMCiSm4FpKoLtJ40c9VGvAg==
X-Gm-Gg: ASbGncs17yIXxnEbyYEPO5jg7jpg98JhDgwW0BGXyBby+Z1s+wm+RLwOyo8wRQudvSN
	NZhk0nEnUQJ6aObqa0lJh/kbKeUQF5gyKsmtph26Uk0HFgSYDQ+mtq5MSfFf0KKA9cCNhDkGAuI
	mVs4VBNP39YD1IEYfBGG0YcnKN/RsITxINBHgxTj+vG8BBooyMc0dsUcDON9cCIlzg3E38jdOtJ
	rLfX4qV5Wipe7ZEGCOhQJd/UL6ciyljbwtSaWtjCNy3nIYa57C+Mtn0mtsFMsvuw2h190LiYrdH
	QUmVboBZlbIFbWY6vhrH68Aq0sFUsdqNzC3f1fjBidimusHULA9/J2c=
X-Received: by 2002:a5d:5889:0:b0:3a3:66cb:d530 with SMTP id ffacd0b85a97d-3a6d12eafdemr13759129f8f.23.1750773855631;
        Tue, 24 Jun 2025 07:04:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSeGAby8Hut56XyCf3nBP9LMY8KiVvMon0t0DL84MwY0qTNqCkMzHlgF4ar32wiMR2Bi/mCQ==
X-Received: by 2002:a5d:5889:0:b0:3a3:66cb:d530 with SMTP id ffacd0b85a97d-3a6d12eafdemr13759057f8f.23.1750773854870;
        Tue, 24 Jun 2025 07:04:14 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e811450bsm2077263f8f.97.2025.06.24.07.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 07:04:14 -0700 (PDT)
Message-ID: <5f5b83ae-8482-4eea-9df0-55871c30375b@redhat.com>
Date: Tue, 24 Jun 2025 16:04:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] mm, madvise: extract mm code from prctl_set_vma()
 to mm/madvise.c
To: Vlastimil Babka <vbabka@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Colin Cross <ccross@google.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250624-anon_name_cleanup-v2-0-600075462a11@suse.cz>
 <20250624-anon_name_cleanup-v2-2-600075462a11@suse.cz>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250624-anon_name_cleanup-v2-2-600075462a11@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.06.25 15:03, Vlastimil Babka wrote:
> Setting anon_name is done via madvise_set_anon_name() and behaves a lot
> of like other madvise operations. However, apparently because madvise()
> has lacked the 4th argument and prctl() not, the userspace entry point
> has been implemented via prctl(PR_SET_VMA, ...) and handled first by
> prctl_set_vma().
> 
> Currently prctl_set_vma() lives in kernel/sys.c but setting the
> vma->anon_name is mm-specific code so extract it to a new
> set_anon_vma_name() function under mm. mm/madvise.c seems to be the most
> straightforward place as that's where madvise_set_anon_name() lives.
> Stop declaring the latter in mm.h and instead declare
> set_anon_vma_name().
> 
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>   include/linux/mm.h | 14 +++++++-------
>   kernel/sys.c       | 50 +-------------------------------------------------
>   mm/madvise.c       | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++--
>   3 files changed, 58 insertions(+), 58 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 0e0549f3d681f6c7a78e8dfa341a810e5a8f96c1..ef40f68c1183d4c95016575a4ee0171e12df9ba4 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -4059,14 +4059,14 @@ unsigned long wp_shared_mapping_range(struct address_space *mapping,
>   #endif
>   
>   #ifdef CONFIG_ANON_VMA_NAME
> -int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> -			  unsigned long len_in,
> -			  struct anon_vma_name *anon_name);
> +int set_anon_vma_name(unsigned long addr, unsigned long size,
> +		      const char __user *uname);
>   #else
> -static inline int
> -madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> -		      unsigned long len_in, struct anon_vma_name *anon_name) {
> -	return 0;
> +static inline
> +int set_anon_vma_name(unsigned long addr, unsigned long size,
> +		      const char __user *uname)
> +{
> +	return -EINVAL;
>   }
>   #endif
>   
> diff --git a/kernel/sys.c b/kernel/sys.c
> index adc0de0aa364aebb23999f621717a5d32599921c..b153fb345ada28ea1a33386a32bcce9cb1b23475 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -2343,54 +2343,14 @@ int __weak arch_lock_shadow_stack_status(struct task_struct *t, unsigned long st
>   
>   #define PR_IO_FLUSHER (PF_MEMALLOC_NOIO | PF_LOCAL_THROTTLE)
>   
> -#ifdef CONFIG_ANON_VMA_NAME
> -
> -#define ANON_VMA_NAME_MAX_LEN		80
> -#define ANON_VMA_NAME_INVALID_CHARS	"\\`$[]"
> -
> -static inline bool is_valid_name_char(char ch)
> -{
> -	/* printable ascii characters, excluding ANON_VMA_NAME_INVALID_CHARS */
> -	return ch > 0x1f && ch < 0x7f &&
> -		!strchr(ANON_VMA_NAME_INVALID_CHARS, ch);
> -}
> -
>   static int prctl_set_vma(unsigned long opt, unsigned long addr,
>   			 unsigned long size, unsigned long arg)
>   {
> -	struct mm_struct *mm = current->mm;
> -	const char __user *uname;
> -	struct anon_vma_name *anon_name = NULL;
>   	int error;
>   
>   	switch (opt) {
>   	case PR_SET_VMA_ANON_NAME:
> -		uname = (const char __user *)arg;
> -		if (uname) {
> -			char *name, *pch;
> -
> -			name = strndup_user(uname, ANON_VMA_NAME_MAX_LEN);
> -			if (IS_ERR(name))
> -				return PTR_ERR(name);
> -
> -			for (pch = name; *pch != '\0'; pch++) {
> -				if (!is_valid_name_char(*pch)) {
> -					kfree(name);
> -					return -EINVAL;
> -				}
> -			}
> -			/* anon_vma has its own copy */
> -			anon_name = anon_vma_name_alloc(name);
> -			kfree(name);
> -			if (!anon_name)
> -				return -ENOMEM;
> -
> -		}
> -
> -		mmap_write_lock(mm);
> -		error = madvise_set_anon_name(mm, addr, size, anon_name);
> -		mmap_write_unlock(mm);
> -		anon_vma_name_put(anon_name);
> +		error = set_anon_vma_name(addr, size, (const char __user *)arg);

At first I thought whether passing current->mm as an argument might make 
it clearer on what we actually operate. But then, "anon_vma" might give 
a good hint.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

