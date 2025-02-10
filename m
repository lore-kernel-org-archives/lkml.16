Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A281C4A02
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182379; cv=none; b=BjXyzxLIvkImPRKRf1YENQqw3wzhgyrJ+L8TxsO+4+mvnh2CDz9D0vgKGcRxPLS4S9EZhgu7KI0ipBggRjYSsYAsMTE8kF8qdvQBNxDPlF37E6O4NSzG7LyksiGZQLu+pTiUE263pFg/0+OoNh2MdpB9O+wOkytqUV/zsDJfELk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182379; c=relaxed/simple;
	bh=+xJ+pPH3QFl9GtjmWGRkmWIESGEkqSpTUg/7/G/v7Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j3OvEAEIBguTONkRsWlvxFKqcInVdBpfIvQY4P7LmJheDz+qUivueKPmv+d4Lu+Gj6zNzR2uNMOB0d9aY7p6cLp1S80hCqAwFgBBRhznH/vQu4S1W0W+jKNXuz/YeEpHI/hVKZllIAd+Urq7a2x+aFQ1zlCdXHaXw650pAA0Evs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIUaYhBT; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIUaYhBT"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fa5af6d743so1893820a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739182376; x=1739787176; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tFn4UHKKr9XPx0URdc5uNtF2TrkHu6xcH3JJm9xjq/o=;
        b=AIUaYhBTcZZ6i8iGHgwesB15gJSG5QO1yMsMdxdh4KXvpf+FT2GDu7iGFa7QxiLb+y
         7vVWAThP4e9T1+HDncITjjaSolZpSUVUvlGRn9162jnOZrEST0+cxYfWtgRJKDnra24d
         ncI7N+FFquyGF9KG6LIZDKdwhtUkB+/gQEE0KOm3ffkHqhhFffPoPX32v1x1KWxcDzTt
         X3P8m6OhsSkDg1urjw2PvDvQlm8SspdaM73QkOIh86mYZbqZwkWFMh2yZ/+CqKxAdrtU
         hkCNsPfCIjfmzhnlSylLWf6QylYRocEFxpQ/YIBVLTVWLfYjMz7//KFjU0LawTvZ+GCD
         covQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739182376; x=1739787176;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tFn4UHKKr9XPx0URdc5uNtF2TrkHu6xcH3JJm9xjq/o=;
        b=TVpQS01WB5Nlqk2+dFF0Z20Y0/pwnz4wDIFleS/Zs+2zii5d3wfGWle7rSELmE6gd7
         +UjOPCcrqeSsr1ZG+UWFxizjxWD+cSbwWU+4wsQt+9I2YtHhZU2KQ6eYq3Tema2jagdN
         29aJkl49Te3MIviog88rSnVClfNyDMY4EEHb4LVivfXYMqR/boqVNkn1XoisGSqzUilI
         IjSaOEm+XT5niNI4sjtPHOp4Vq9F1JGD51UWmqAN2naK1jxO9MQXLbn5TYyYppB7l2AL
         96UnwJ9BRIvyn/IvYlrXdMjF8pKwbQQ2avm21y9GB+envt846lmwZgzk3d+IbLW1tApA
         PUvg==
X-Forwarded-Encrypted: i=1; AJvYcCUr3PJ8sZtFGajr80ddpA7nBRcuK6Ol0rbLZROEjnYIJdnnTOuW2PvrM0CzOUa6EBKKP7dqlCsyPm9xzJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIoyQuGSmAZXRcbizotdZlpoj7VseTX3n9plb7sDCsnfeXqLA+
	Az8w54tRdQxYevBSjFabAC6VZICmQ/xSuu43LeXbNw946f37oFsOU15VH0Gw
X-Gm-Gg: ASbGncuxC+wwGlHfMJeBaLWhfDcZ/hyaVi/tr3Nq/noMDbndiOCzqz2NV2Ua4c5Cmfz
	STZmrXDj0SQ2/wlOr55BuICn56W2gzPqWhnytCRDOfTPYfmpIYQlhhhQaBom3QCx1HmGElbfVHV
	K1XdpXtpyolNefG/Jq2f8lMUZwylCef0hmfjX0juMyirAtLnNDcNMC+phChWTvShH7wKorVAKrQ
	25QXLshoccSi+R3SifDy+aK9Cs7IuNJDO00u3zGsra2E8jgHJNPJyTxuAd9zkIBjC9GirwqKMiy
	iWmMfF24YcG++rXnqcOk5MflaOLvtUpO
X-Google-Smtp-Source: AGHT+IHvaivavOz7PALWmUfBd2SwUocU0pAOAWkCvUDckwmmZ/da7ocSxotKp4Wa6wHL4T8yUOipew==
X-Received: by 2002:a17:90b:2bd1:b0:2f8:4a3f:dd2d with SMTP id 98e67ed59e1d1-2fa2406f6e9mr20518623a91.15.1739182375888;
        Mon, 10 Feb 2025 02:12:55 -0800 (PST)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:83e6:5a50:60c5:d373])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a6fe28sm8269019a91.26.2025.02.10.02.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:12:55 -0800 (PST)
Date: Mon, 10 Feb 2025 18:12:50 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: pgtable: Ensure pml spinlock gets unlock
Message-ID: <Z6nRIriSSJesFQDj@vaxr-BM6660-BM6360>
References: <20250208184928.219960-1-richard120310@gmail.com>
 <b70f663f-5b72-41dd-bae4-14808a87f262@bytedance.com>
 <Z6m21Rzv6H16oG-U@vaxr-BM6660-BM6360>
 <e5d5bafc-7809-42c2-ba8d-554b9667d00c@bytedance.com>
 <4524511c-d685-4af6-9de9-4f15f7dcfe05@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4524511c-d685-4af6-9de9-4f15f7dcfe05@bytedance.com>

On Mon, Feb 10, 2025 at 04:42:13PM +0800, Qi Zheng wrote:
> 
> 
> On 2025/2/10 16:31, Qi Zheng wrote:
> > 
> 
> [...]
> 
> > > > > 
> > > > > diff --git a/mm/pt_reclaim.c b/mm/pt_reclaim.c
> > > > > index 7e9455a18aae..163e38f1728d 100644
> > > > > --- a/mm/pt_reclaim.c
> > > > > +++ b/mm/pt_reclaim.c
> > > > > @@ -43,7 +43,7 @@ void try_to_free_pte(struct mm_struct *mm,
> > > > > pmd_t *pmd, unsigned long addr,
> > > > >        pml = pmd_lock(mm, pmd);
> > > > >        start_pte = pte_offset_map_rw_nolock(mm, pmd, addr,
> > > > > &pmdval, &ptl);
> > > > >        if (!start_pte)
> 
> Maybe we can return directly here:
> 
>             if (!start_pte) {
> 		spin_unlock(pml);
>                 return;
>             }
> 
> > > > > -        goto out_ptl;
> > > > > +        goto out_pte;
> > > > >        if (ptl != pml)
> > > > >            spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
> > > > > @@ -68,4 +68,8 @@ void try_to_free_pte(struct mm_struct *mm,
> > > > > pmd_t *pmd, unsigned long addr,
> > > > >            pte_unmap_unlock(start_pte, ptl);
> > > > >        if (ptl != pml)
> > > > >            spin_unlock(pml);
> > > > > +    return;
> > > > > +
> > > > > +out_pte:
> > > > > +    spin_unlock(pml);
> > > > >    }
> > >

I've send a new patch stating for this change and change the title,
because pml will sure get unlocked, we just prevent the redundant
branches.

Best regards,
I Hsin Cheng
