Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D05150981
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 04:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739160312; cv=none; b=lMMexDJKI2C1aJyOUwTHkzDrkjs/XE7sZp5kyNkajxPNDm9o62ktZyaGERlxqA0B/6stndDifwH5V3Uywu+dqYxsU4JdYrePc9FEP42PK0QyxJTRLkC4djVyXAlKCg0b2MRViv+yNg+lQ8aPV4eqXZ3lF3Bp06HW1d3vs75OwRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739160312; c=relaxed/simple;
	bh=z2Aq6I2Wd9JpsEc3K3sdw+AYy6SOb/GqdMyiFwYTpqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YYsHPtMgaKDKdU1d8IEUDV3RkxKMq8kh+gCyxNyoUhY4pB5u1edQ7q3aoChMyPunjwiF/2NJrJLvMYHhqWQ9w5Hsstfna4RZXKsWCfclZUXbjf9rBpVN5xNXrRVPA768e7TuaUQZl7eu5ud4Io5nM+nkO5S4xKo0Q73P2yPt41Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=e5FL2JJa; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="e5FL2JJa"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21c2f1b610dso96195795ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 20:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739160310; x=1739765110; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+QI2d1ZhDcLWDmDwgN20LSaHFGdwN7o3BKj3Rl8G8JY=;
        b=e5FL2JJa0sg1So1vZtxwMgjCd/zzywKPm6shwy1osC+uZcNkzk02Ej32OScQrVQoLS
         wAQAg8w3SGwy4HYpkqrj+fBdvkqK/UJPvnMaHu/aaPUC3nTDkeynJq6011cVGMOcLh9A
         +3uOQwxPjBi7Lmg8Lf5IGsp8C2RWmccMPGPolwRTZvGsGWtjB0z4uorNAYadVs2yvSfF
         RxLCHhnXv7R1DBBB83i5J6mAckg27ws5z97slZsR794JXh2BZOViBkjLBJEUPX/zS6aq
         Gp2UFReIEuOJd3NuZysxlWuQMyz45XbSN5fqN/QvoYNV7+cyTP0OtwvU/OB/MJpyKqs4
         ZFQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739160310; x=1739765110;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+QI2d1ZhDcLWDmDwgN20LSaHFGdwN7o3BKj3Rl8G8JY=;
        b=T+oJEf0kKjTH8b0gRxuFIQNZeyNpKACgKmjfh2M8lDx+bVYvXKkWYDeyigetJpx4E2
         SnrBH0fcHxyyRPmKO/fOvWTJjHj4ZxIqKuDwymZ4mlfDqqpp0qtO/SSMRRs+/QK1w3Pk
         MJB/GVh7eQhlm6AtPdViYPbzGIMZVEEkNrTTrWJrDRACYs3Ot6vL56qGA0Xupr+J5X0X
         OFFL61+2vcRh4t3E2cSfa69ppfCHTSpoKW1Mz/6OjioXYnLe7J+d2fGnu6Z8FIb1zSca
         dwrXNUNlL4lz+Dvpe8ZbZmFuhk8CUSw2kJnl4+LfeNAF15UYR7ZKYfXb3t87PDZMLiqW
         owMg==
X-Forwarded-Encrypted: i=1; AJvYcCV9MFm/rA4XkLNuKy7VrPS+cP/SWx/brBGFspAibP47xR0x4IyaumD2ZYztwituPUJZzvsAscqxC2wCibE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAT7WB6iF6UCvZtkD8WMrnv99pZyzTPbJASGi4ndlQGrRUtg4U
	d5Yv1G8oV/5JM+RPUbXFjAW1cXN3zuWoQTpLaWyD4FaVJdXqms/zlS/PkbdogRM=
X-Gm-Gg: ASbGncvNfYl8YtPbHGj5o/287ncfyZCgEqP/gFPpaN8oMujbdlJ4jLs/l2/LroIJdLO
	9i7Zsr8djfb/lC8xy1lcf7yoeDnH4n8vJ/I26xlscRkquSouy16A0K7yeN/g/6O2xYNeqrPWxeo
	60gQvFZksNpneoCOhAaE5bUoRzkS9WHYSgAnpD79TvZ1aavMMQfszxqY8OpRQB34jOgTQ5P5bm1
	xbFyj13d4zdDdVmdQkRZkwmgJ7WBpVVA2hxR9GgPLlMqMsoqKT8gREs++LiNWMYUJBq18Jlp2A4
	oIKb/VmpVx5vDvtl4cmuhOShE6HmJH02DjHxAjPF2g==
X-Google-Smtp-Source: AGHT+IFFrxY09D0WUvxEWnATaPx0lzJ6U889AvkZtWcFokxd4h5asyTt248mIDYlLOHnVE6iLtniHQ==
X-Received: by 2002:a05:6a21:8cc2:b0:1e1:a9dd:5a58 with SMTP id adf61e73a8af0-1ee03b129eemr24343506637.30.1739160310332;
        Sun, 09 Feb 2025 20:05:10 -0800 (PST)
Received: from [10.84.150.121] ([203.208.167.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-730733d401esm3220704b3a.105.2025.02.09.20.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 20:05:09 -0800 (PST)
Message-ID: <b70f663f-5b72-41dd-bae4-14808a87f262@bytedance.com>
Date: Mon, 10 Feb 2025 12:05:05 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: pgtable: Ensure pml spinlock gets unlock
Content-Language: en-US
To: I Hsin Cheng <richard120310@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250208184928.219960-1-richard120310@gmail.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250208184928.219960-1-richard120310@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/2/9 02:49, I Hsin Cheng wrote:
> When !start_pte is true, the "pml" spinlock is still being holded and
> the branch "out_pte" is taken. If "ptl" is equal to "pml", the lock
> "pml" will still be locked when the function returns.

No. When start_pte is NULL, the ptl must also be NULL, so the ptl and
pml will not be equal.

> 
> It'll be better to set a new branch "out_pte" and jump to it when
> !start_pte is true at the first place, therefore no additional check for
> "start_pte" or "ptl != pml" is needed, simply unlock "pml" and return.
> 
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> ---
>   mm/pt_reclaim.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/pt_reclaim.c b/mm/pt_reclaim.c
> index 7e9455a18aae..163e38f1728d 100644
> --- a/mm/pt_reclaim.c
> +++ b/mm/pt_reclaim.c
> @@ -43,7 +43,7 @@ void try_to_free_pte(struct mm_struct *mm, pmd_t *pmd, unsigned long addr,
>   	pml = pmd_lock(mm, pmd);
>   	start_pte = pte_offset_map_rw_nolock(mm, pmd, addr, &pmdval, &ptl);
>   	if (!start_pte)
> -		goto out_ptl;
> +		goto out_pte;
>   	if (ptl != pml)
>   		spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
>   
> @@ -68,4 +68,8 @@ void try_to_free_pte(struct mm_struct *mm, pmd_t *pmd, unsigned long addr,
>   		pte_unmap_unlock(start_pte, ptl);
>   	if (ptl != pml)
>   		spin_unlock(pml);
> +	return;
> +
> +out_pte:
> +	spin_unlock(pml);
>   }
