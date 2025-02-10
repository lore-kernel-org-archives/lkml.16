Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BCF1C07C4
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739176940; cv=none; b=AyeTXfwcjPaZ2wy9NPG/2yciN04D5PTp9vnvMTLubeyw1ErXOQwZ7Hjo5J71INywrdh5HdsBhyYB3pYvCWMhwMfoAD3VOFGb3uKTwiX6YY6jj2sGvWo2epLojd50IzsaCdIYr6aeh8SAynG+NlAEP/C5JL4E1FpIifvTKZDp8Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739176940; c=relaxed/simple;
	bh=s3EzbJ2aw9HPaJowakCsCi0YPKQtWiBGwEN0PEj6whk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=EIU6AqhfUxvvpxhaKjcwN+C984E6bbIXEOylB5h6mBjE9wfJL46s3rTmGTQVFT4mJGi6Cwb2Lqu/40a9gAp/I+pC3meC1BIatW2fVOHyEsweMQgw7FSCt+Z925JXXwFp2oM6XS8xm6yBMZ4ej+BIbKNI98GC0nkcZRZmno4eHWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ZHKdIddK; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ZHKdIddK"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f44e7eae4so61206095ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 00:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739176938; x=1739781738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k5AVryFW7jIKC9PMx3aJa7fd2zlXZtgnjt/bCXgEFJA=;
        b=ZHKdIddKNnM281O7FGlQ9kSKSx6mJClOw7nbRsJLNBtKzkEGkvbxDuNHWSmj3ukSsv
         9qSfW8pPcp+FdZPZXv3XWXmFRTBS+GgHp3FPlXdfqJz+NzQi8P41A9z3XzjxffB8TGy+
         DdPOEWuKcY3h0sqI/xgxxHnQzFViTju8Qc61i78WAd6z5DuWQN4qT9TztFuxqjVDr7oD
         B0thH10tOw6veDq7UtbNkvZbTY+AqXaqkKckNXLRcTktuQ+iEWQe0gtYOCz7Tr+HDqun
         9VtSzxixvzuj7Thyz3ZRAMgtvV8Uwj3mUCLTNKgMfMJ+addtYNL9oDan7aal8zuoM2SB
         t4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739176938; x=1739781738;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k5AVryFW7jIKC9PMx3aJa7fd2zlXZtgnjt/bCXgEFJA=;
        b=aTx16sJyI6EJASP3XUnoGB0jpwv9xscYfb+VmOpcwk0vSv8GXFBflHv+9cpZu41vI0
         sFxwy80dy3i3vKfn8hlpKiDxmEtTSKya+uEEBqAKFdsZHOC2d9S1wOPCQxQZ83bY717f
         Q4RqIWHvsKdxVK34TruZnBFQ/0XUZ5k4j8u/+6k2MMPIz3g0nOh0Lej5PRFDamY+MRDq
         mE8eIVie+aaihm8DWnyloJNOVDKWrDueiETKjtP4/ohjrzLZPDFBmcOuM6PK2eG+91KB
         geKOodKaeCmE1arBJR6WDXKd47c6ikHGvDMJ7IJBZb/E8ppgqq0Msz8Q9cVyd7HEx62E
         eRUA==
X-Forwarded-Encrypted: i=1; AJvYcCU6rVeII7yvQQuv3ghcO7rQ2QMP2BMGwte2Kq+ulOplZsLwMGnWiYEi8SFhdkzIAXVeY2s+UQ5oMT4MoKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAiReN91YCQEU0lPhQLwE8mRi//Yg0rjjt/8OX2oop8xaB8004
	TtUesCfjgPY7Um70Q7NzYO3K3m/PQmTjb7JEnoXWAJvHErMd82vd7ZT4nrNwazO3ifZYiplKviM
	X
X-Gm-Gg: ASbGnctlh/JkPChIZUE5kmafymwLl8OfU0iHH6OTShDDeyDqvEjwdPvtIcl6Y2pEHAB
	W95sHCiS2519tO5UQruA7jMnF0mPY9BU5XXSd1Bn7zx57Fj9NBUZ+kAVLdFCH/M15svBFuz2wlN
	3Xz+xDiBZ+Mll4leSbbBB/p0yRzqZ68iRhNwespd3gH/ZfKGIKvHuxLUR4EpzuG3fg9dFcCxSat
	+o8xFxvjteEiNNSZettev+q3ojJC04Gg/C7IXm70P0bXu67v2qwpd4buXZuFAWRCICrmOJBOH4v
	YTqZLxuLo0eq6Yza09DNQ4Bf+lZxRsCnwnQGMIm83A==
X-Google-Smtp-Source: AGHT+IFrJ9iyF+ehnd+p5RcTFw9uzH3Jjv3cVTTZFS7lEPb+BTW4LASNKEREzJVE7UzugL6gSYLHqQ==
X-Received: by 2002:a17:903:2311:b0:215:acb3:3786 with SMTP id d9443c01a7336-21f4e6e649dmr224221095ad.19.1739176937709;
        Mon, 10 Feb 2025 00:42:17 -0800 (PST)
Received: from [10.84.150.121] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368b6024sm73039775ad.231.2025.02.10.00.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 00:42:17 -0800 (PST)
Message-ID: <4524511c-d685-4af6-9de9-4f15f7dcfe05@bytedance.com>
Date: Mon, 10 Feb 2025 16:42:13 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: pgtable: Ensure pml spinlock gets unlock
Content-Language: en-US
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250208184928.219960-1-richard120310@gmail.com>
 <b70f663f-5b72-41dd-bae4-14808a87f262@bytedance.com>
 <Z6m21Rzv6H16oG-U@vaxr-BM6660-BM6360>
 <e5d5bafc-7809-42c2-ba8d-554b9667d00c@bytedance.com>
In-Reply-To: <e5d5bafc-7809-42c2-ba8d-554b9667d00c@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/2/10 16:31, Qi Zheng wrote:
> 

[...]

>>>>
>>>> diff --git a/mm/pt_reclaim.c b/mm/pt_reclaim.c
>>>> index 7e9455a18aae..163e38f1728d 100644
>>>> --- a/mm/pt_reclaim.c
>>>> +++ b/mm/pt_reclaim.c
>>>> @@ -43,7 +43,7 @@ void try_to_free_pte(struct mm_struct *mm, pmd_t 
>>>> *pmd, unsigned long addr,
>>>>        pml = pmd_lock(mm, pmd);
>>>>        start_pte = pte_offset_map_rw_nolock(mm, pmd, addr, &pmdval, 
>>>> &ptl);
>>>>        if (!start_pte)

Maybe we can return directly here:

             if (!start_pte) {
		spin_unlock(pml);
                 return;
             }

>>>> -        goto out_ptl;
>>>> +        goto out_pte;
>>>>        if (ptl != pml)
>>>>            spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
>>>> @@ -68,4 +68,8 @@ void try_to_free_pte(struct mm_struct *mm, pmd_t 
>>>> *pmd, unsigned long addr,
>>>>            pte_unmap_unlock(start_pte, ptl);
>>>>        if (ptl != pml)
>>>>            spin_unlock(pml);
>>>> +    return;
>>>> +
>>>> +out_pte:
>>>> +    spin_unlock(pml);
>>>>    }
>>
