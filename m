Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D983596B
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739176328; cv=none; b=pMfVc8oR0O34BCPm1K+F8xwCnI4s9TzRy4iZJ9WbC5c19Bno9aq6A3rOhJt63tMe0mG373zzUmeUqH8G2Vtp5X7WgwK5iIGsAB1NdvcE0LcSijfd3s5+oYWpEFk/zseacMMINkWomV7eQ9Z09b3uJncc7q8x9vNXNiwSe2grgtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739176328; c=relaxed/simple;
	bh=/EsZOcNIkpQuc3C0IjSM3JdLmGoYFCU2rhrAxfd8K4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gw0c2uzBXqbhYFkijK1lPU9qcTwS/WxL1FajJZZpKROi+ztGQQ9yqw2Jlb0LMcS+/n+edGqJGcOaZoJ2tuQ/oGiWe8Rr9senc4gdHw51sWHSnKQPSA+yYXNYb4N36BMjQisU1TViDTDCwtIdV1zbrC68XQMcOoKP9SCSl5FLBmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=hOJWinEN; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="hOJWinEN"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21f61b01630so33659675ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 00:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739176325; x=1739781125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OUcYToRhpuhHDr2Q17cbnKHMqCKY55p2oZxgfc3xS98=;
        b=hOJWinENVISpQEOuVOBzloMuFozU6oz2+Vc/EpbOvUY9kH/CXAKdppzBUmNDxojdw8
         W1ciZrmACvILtPywgKdv16B54ZPlMWqDRi8ZIESbYmsKdzyudGyamp43+XqQRM1uagD9
         RJElZDJttffxh4ia46pmGpWwrEV1MYlSZULdFcesspmzqlltI3d95z0fBxJLpLr3XmAW
         qxevwG1L5krUZ/5aX2IJOrEAs5arELrFjN5ZbP0k8tFqDA/B1+wofLO/SVhQK4hvgYWX
         Hb1iWEXa7suOILAY0zxzV69/9eN9g4l09Dt58l5/BAA7vqf87RD/WWSJVLOXTL48CEZc
         XQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739176325; x=1739781125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OUcYToRhpuhHDr2Q17cbnKHMqCKY55p2oZxgfc3xS98=;
        b=Beqj3emdUisI7FWcGn9Ub/Yy2MqVv9ketd1KYqhzdnbHmD/0tHuSyZLEdcr7xr9QlM
         Mg1ldc8Gg6VKDAUVBvRi6hninSKfO0BlLvyj8mwl/HcjCcrUApfAjbai3CeikLgdsXru
         XxjKPG0H+t+NKdAnA/Eqohj+BLsI37aRIkpkmy/UpRSXriQKoW2i0ASt8bkmwam0MUV2
         ukV7qdEzUQUj5PK93n0sK4Ytlz4YU+FDGlBUK9gro8fO2cUzoz511ipqQf6MWanxJC6s
         3dvMQhKO1VGd1M50Q9hhXTKcAZ/0n8COOZZtsNCkpMGxCsx3uzRAVXdj0t7XcvOlfCrV
         o/uw==
X-Forwarded-Encrypted: i=1; AJvYcCWwi6zMxllz7hs3qkjktKTmHOy0tWeI1PoGVu95rkmgaiojdrNpbsNQCa5TNncwZ32PmKJQzLDNtyO4rhw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzDnbpbmXq5ehv9rqUUFBLOqDS7tPO77HS5Bd54h0uk2dUbmD8
	/i+6O7Jmz/Zp0GxsKmmdutEHM/NLdYDJah3oSMH1jrZI1dQYZ+Z6LNBfEwFOygWYg3Nf7u7rPok
	G
X-Gm-Gg: ASbGncsFrauUADP5vs5Suchkty27zhlRcyrGgu/OlxyaZYuTS0/8bthhPi/sdr7XE/r
	+E0Ly0IPJfmF5AcbMgFb5GhtT4EwvXJsWOfu/kUrkJgNT6NNXz7YlQUZsoVAuFvVStpeBy3wGs2
	oRiL/jCBT3N+bbKb7aq3PkW/A+Y7o8r5WPcplzE7MiERyhMLZy8RGTR/yJBig/ne3AesWTxGKEg
	L3rEInzD5b4wQ6rkzr3PdHMdO62TN9M8ck5szPK+9/9dDqr9prUCxCs1RZoJML+0lBo42wQ6J18
	DP6haS6wnuB5Pe1/RkG7juRxf4HVL1cxGEDMG1JKiA==
X-Google-Smtp-Source: AGHT+IF6fZPOzbILUuM2rhW3U3R4xSndVBqQEShpK9A8O0NyscJ2fDBGKMKmXYk+t1ivHGlVzFHL4A==
X-Received: by 2002:a17:903:1a0c:b0:215:a303:24e9 with SMTP id d9443c01a7336-21f4f0efcb1mr206775945ad.3.1739176325072;
        Mon, 10 Feb 2025 00:32:05 -0800 (PST)
Received: from [10.84.150.121] ([203.208.167.149])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c68asm73373745ad.172.2025.02.10.00.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 00:32:04 -0800 (PST)
Message-ID: <e5d5bafc-7809-42c2-ba8d-554b9667d00c@bytedance.com>
Date: Mon, 10 Feb 2025 16:31:59 +0800
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
 <b70f663f-5b72-41dd-bae4-14808a87f262@bytedance.com>
 <Z6m21Rzv6H16oG-U@vaxr-BM6660-BM6360>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z6m21Rzv6H16oG-U@vaxr-BM6660-BM6360>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025/2/10 16:20, I Hsin Cheng wrote:
> On Mon, Feb 10, 2025 at 12:05:05PM +0800, Qi Zheng wrote:
>>
>>
>> On 2025/2/9 02:49, I Hsin Cheng wrote:
>>> When !start_pte is true, the "pml" spinlock is still being holded and
>>> the branch "out_pte" is taken. If "ptl" is equal to "pml", the lock
>>> "pml" will still be locked when the function returns.
>>
>> No. When start_pte is NULL, the ptl must also be NULL, so the ptl and
>> pml will not be equal.
>>
>>>
>>> It'll be better to set a new branch "out_pte" and jump to it when
>>> !start_pte is true at the first place, therefore no additional check for
>>> "start_pte" or "ptl != pml" is needed, simply unlock "pml" and return.
>>>
>>> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
>>> ---
>>>    mm/pt_reclaim.c | 6 +++++-
>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/mm/pt_reclaim.c b/mm/pt_reclaim.c
>>> index 7e9455a18aae..163e38f1728d 100644
>>> --- a/mm/pt_reclaim.c
>>> +++ b/mm/pt_reclaim.c
>>> @@ -43,7 +43,7 @@ void try_to_free_pte(struct mm_struct *mm, pmd_t *pmd, unsigned long addr,
>>>    	pml = pmd_lock(mm, pmd);
>>>    	start_pte = pte_offset_map_rw_nolock(mm, pmd, addr, &pmdval, &ptl);
>>>    	if (!start_pte)
>>> -		goto out_ptl;
>>> +		goto out_pte;
>>>    	if (ptl != pml)
>>>    		spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
>>> @@ -68,4 +68,8 @@ void try_to_free_pte(struct mm_struct *mm, pmd_t *pmd, unsigned long addr,
>>>    		pte_unmap_unlock(start_pte, ptl);
>>>    	if (ptl != pml)
>>>    		spin_unlock(pml);
>>> +	return;
>>> +
>>> +out_pte:
>>> +	spin_unlock(pml);
>>>    }
> 
> Hi Qi,
> 
> Thanks for your kindly review!
> 
>> No. When start_pte is NULL, the ptl must also be NULL, so the ptl and
>> pml will not be equal.
> 
> Since this is the case, we don't have to do any addtional check for
> "start_pte" and "ptl != pml", we can be sure that only the second check
> will be true so we can unlock "pml" without the redundant check, that's
> my understanding, what do you think?
Adding a label

vs

Redundant check in rare cases

Not sure if this is worth it. ;)

> 
> Best regards,
> I Hsin Cheng
> 
> 
