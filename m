Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E1C1D5178
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 07:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739259961; cv=none; b=BgVQ9fC162b6T0t2Pg4IQp5nbzewpOitODXfSgc14jZ3OUJ/AGGOG21g73WRkHErmtLRGxYz9wJre/hVVInGRyy29X3hC0QJ5RMb0mn0zHAW1fEXCKpcgNGHlgMK8xJtqNB93cUvPn3yghHp/I9mtQBp8pKG//pfw8Xkv8V6WIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739259961; c=relaxed/simple;
	bh=l70dV0fwM/MtX+SOVxSPnUeUqygN+N4OhUJhmrXWyjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=psFOV4au5K5Z8fIqQKptdkE5lzDEx+34Zuliv+53Pd4bc3hOp7vCcUTDE43IqBY7SLvHY3lF70J+8q32GxwA7Ry5B1N/aWmd80l3uw9dHXxt0Flxtj+DJgS/A4q+dTn8Ejd7xRp9IoIUlikvthiiPHy9SYc+Z5DnbSs+rToHy/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=EPZyjApe; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="EPZyjApe"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21f49837d36so58802745ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 23:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739259959; x=1739864759; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YSAKHucokt7qfKmNQyIV/wNLM0zYjyzDQ14qjRlnafk=;
        b=EPZyjApegUiwm3h2g4unNYgGWm/CDnZB20PFcXYDRXx3pSMgeA/XXwxyEqtGdaX0p6
         zeIpqM9b9pMi6m31h0UZDVWrwPVUyURDIimub/pH9bauAsfqjJawedXoRxacuVJFoROT
         tyBlnu9JJ9PYPxTyrbAjf4dsm5IRrVcwXl33XSWO+9gohBv2rwi3PB1DqyQJHT+iYPzC
         7kqd807i50GHOxnZOH9pFPEmJNuh+SWnIvZXhJNS8dvETyblvAsTOKrU+tss8xo8M8eY
         5rUS+QlPYzG8yxrTwJw9Y6H1sMUfGsTxruEWfORGAPd5g/gXeFd/rYEyIiHcVvISz2+t
         UMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739259959; x=1739864759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YSAKHucokt7qfKmNQyIV/wNLM0zYjyzDQ14qjRlnafk=;
        b=g5047zuAoq+g9UDDArsoO/gU0eZ3nn8KyuSf7M3aiKyXMs7+w4XAtXaPV67gHSo6ob
         anFcvMdoxjuWMNyek+50GHPKhOFJsD8ThWy1rDnZBcULxIN80kXvZEtGj97Au7ivrUfC
         NvBSXvgRtyAkq0d5qn2uNA8EAAoIPzG82bLDjhKadrTY+RyUWU5/c+u6tj87wrKd0uql
         GAUtB2QK67GS/abB51GdTp2rXaMyvg87gHi0YY+dmAjv5heL+7OtQdX2bHdVoooEgh/8
         lvtkfxzlBAMoVaAqzxp0U7pG85plSZeN8gh4J0JLy7YRdGwTE9hqT9dXPr1532u3LViX
         /RGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkNZi5NW+5J4NFr75nmOEWB/hENzmeJCYJC8LH1ZuSNOM21nazugep265cGJ5neB4YflWeaWC8/bS2XuA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMK3FYGuips6KolVUMvRKdX5SnutvQTpZBA49004vdrfSbBMhc
	zqzV5cuIk/tgRBw7mA85b5NKSMGjLJPxl41VmqJHydMXzy/QXVrujsVUSI01Yws=
X-Gm-Gg: ASbGnctsxudxcR2B5+BKUGLoTV5mPdVw/z+PH750nJqeOvxB6nOsMgevdX3NT0A9US1
	GbTyXtbI/oz6No9DJTxlSp3chhvHksYiwvbz0QvdZvOpFHXQvqT/q/uOYNmOpjzvjqISgrYkilV
	BcTM3LGLsjeDrVUbqCceGwD5pwrAI/GY+1WZM8h6N8eaMBrsauDhxKo/fbhVjA3eTV7SleSu9Vz
	2SZJZk0UKjvi+YNXpgshXr3VBo9l44nJ22ZkbQA2BW6gfA2ySHe1VbACraw7tNQ/TBYgmJ8Chkc
	lphWuilcNHg500t+/DVg/ocpZHr+FGHNOCVKCQxD/A==
X-Google-Smtp-Source: AGHT+IFW6xSaUDrAWCZSPou2nD+/XK4bxqsbZZDruwD3E7NNexOes8n+tG2fP46G3dcaSbDR2HAwGA==
X-Received: by 2002:a17:902:ea0d:b0:21d:dae6:d956 with SMTP id d9443c01a7336-21f4e6e1eb8mr275512905ad.24.1739259959260;
        Mon, 10 Feb 2025 23:45:59 -0800 (PST)
Received: from [10.84.150.121] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36510e58sm90654975ad.10.2025.02.10.23.45.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 23:45:58 -0800 (PST)
Message-ID: <616b5fdd-0f15-485a-b5fd-cdd6d7fc9d45@bytedance.com>
Date: Tue, 11 Feb 2025 15:45:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm/mmu_gather: remove unused __tlb_remove_page()
Content-Language: en-US
To: Baoquan He <bhe@redhat.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, peterz@infradead.org,
 linux-kernel@vger.kernel.org
References: <20250211034348.39531-1-bhe@redhat.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250211034348.39531-1-bhe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/2/11 11:43, Baoquan He wrote:
> Nobody is using __tlb_remove_page() now, clean it up.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>   include/asm-generic/tlb.h | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
> index e402aef79c93..9ae4ca02f29f 100644
> --- a/include/asm-generic/tlb.h
> +++ b/include/asm-generic/tlb.h
> @@ -489,12 +489,6 @@ static inline void tlb_remove_page_size(struct mmu_gather *tlb,
>   		tlb_flush_mmu(tlb);
>   }
>   
> -static __always_inline bool __tlb_remove_page(struct mmu_gather *tlb,
> -		struct page *page, bool delay_rmap)
> -{
> -	return __tlb_remove_page_size(tlb, page, delay_rmap, PAGE_SIZE);
> -}
> -
>   /* tlb_remove_page
>    *	Similar to __tlb_remove_page but will call tlb_flush_mmu() itself when

                    ^
                    please update this too

Otherwise:

Reviewed-by: Qi Zheng <zhengqi.arch@bytedance.com>

>    *	required.
