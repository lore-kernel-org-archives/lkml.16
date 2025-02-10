Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33208F49
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739175644; cv=none; b=a24rQ4UMZbyBJLQQOXWJMtLZTzKs0W6iNLFogijleU5rZw5zoAaR5MamAWCpawiyaK84aJtPY1ZDeXH0CZ/RRWio99ev55lSIWXjar8BANjsrKAkbII8+fkl7BgemOd+IKbCYzsnPky66gJu+jrAa4xg+ttXbmnlJlRTX6LCOPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739175644; c=relaxed/simple;
	bh=fHwwnAyqCvxGazMlOjh/KUmNCeyElKKTI2EHfcqQ+u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqxF/mM3Be+SWjcEMZ1ltlE6YERAUJwJ8RaR61WYPNB3u+YR6xDbh2yI7kdfeggs1KQ1xoGqVM4CWZlUYEaCuTsabAtVf9NgnMhje/rh/yBFxnw1yufA9qLrlasgF+/2yVsLuBhtU12HAo5GuSaB5I3RESGsWqYy47mp6xzXBX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDdllKFG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDdllKFG"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21f6d2642faso38811035ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 00:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739175642; x=1739780442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HlXh4wu9iFzn8SVgmfPWzDAbPI5SiGvT8kTEw+L9Ggc=;
        b=DDdllKFGdLB3KHtyqjntotsn14bUlioomu53TLHhxavq04ieF/E20ZgOf3fVg0S+uu
         lOkBws0wQB189vlyA3DXRgnt9VxJQ6EdnWJPMkU4J4eabLFYOrdq6l9yqdmyBL+3lcqU
         tVnUSH/cPoqPOnhBJ4GnzG/2R65xnsMXBYbACctXUk+sCbg2o/szdOjUUzbKyZsh1Yle
         bb/wi/q/3oz8T6OFEjP8n2TvWcfN/1uT5YB6e8Iv/XMTFWWEjlygtax1IAybSKw0nMYF
         GlYwIcUSPIOFuBhfqlRv9MFd5yZEpL88MRpYLe6vYs80KFuvT+8NCRLefTfOyDadV7jT
         YKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739175642; x=1739780442;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlXh4wu9iFzn8SVgmfPWzDAbPI5SiGvT8kTEw+L9Ggc=;
        b=h6EYISjDJQByLQ8JUJ3baZ36yvPb5yPOvxvXD1I0ruXD6AygwtjjPpDk6uvj91zLss
         p1hHrIjDtwhw7GfEzkyth2b7+LzNn0bhx8hbwTMEjjQG2zFqBcT6zvVNd/NJIGuItFhj
         Om4QsZF4Q3sLaN5Sw/Lk1N3L1u/zbC8ld8UVSyR6EN6PDZfPWrR+XEiwD2wnqvVIOjm1
         3o64XtE3bv5eU6RaMZxrK6Bpmdntzw4n0wYeL6BtrHRLxy+bSKneylsiInQlat5ErPHj
         O0MgOL98leDO1xn9wPQ6Owk8iCo5xviJMRExES262nj7hIIgd5xR+09k9mp9CrAr04q+
         4cIw==
X-Forwarded-Encrypted: i=1; AJvYcCVgaCOHeArmbhRoEY5r+XQzYeU3bJ1xwwU8rtFhhFEo8/Fye86sA37fxynyuhjn2Hma7qApi2uJ3W9HXXg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz78TmLXdVnIs/QjP9NhmhXq8pB8AO0p9yBdiNy2LqzJtehpoJ3
	KZiBJAYhGJ9QKAm2Q17klqQ8SXsFD48lLVLWeAXxo635Vh4KeQVt
X-Gm-Gg: ASbGncs1Agwkzw5yvjqJoT4UwkSR7+TPZd6VMJWSYd2byjicOZpdj6/RrHOYB5dJn3j
	g3DQAunPsQsX+v2/fYVQv+VDkwSGa5KGLZcCLBIzjMAiR3P/GMGVWRbrN5YlUBwv7wo0C8in30D
	xFJdN5ZXXsoVbKwK6lAkj865tIbfBm5i3ttuBVBydcKcivOifcijinQL13arICu03rC0J3V5xgf
	AGFhv5D32F/fLI97ACTqvDpWdtfBgnEAI9Hxl7fE1UAFwdJ9I1SchXljsVL3KspOqNze6vwTH55
	WMVBWrpAb42W6tSUTN5OOQZc5m8MqVVE
X-Google-Smtp-Source: AGHT+IG7ENWZhUOWMiQkJKsUTRXJJbBxJsRsKLOyisj8+R4EtrbAchUJfLHYvefAeqd7WL7OaNcArQ==
X-Received: by 2002:a17:902:ef49:b0:216:725c:a12c with SMTP id d9443c01a7336-21f4e6a0174mr193490635ad.9.1739175641887;
        Mon, 10 Feb 2025 00:20:41 -0800 (PST)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:83e6:5a50:60c5:d373])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687edbesm72739965ad.177.2025.02.10.00.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 00:20:41 -0800 (PST)
Date: Mon, 10 Feb 2025 16:20:37 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: pgtable: Ensure pml spinlock gets unlock
Message-ID: <Z6m21Rzv6H16oG-U@vaxr-BM6660-BM6360>
References: <20250208184928.219960-1-richard120310@gmail.com>
 <b70f663f-5b72-41dd-bae4-14808a87f262@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b70f663f-5b72-41dd-bae4-14808a87f262@bytedance.com>

On Mon, Feb 10, 2025 at 12:05:05PM +0800, Qi Zheng wrote:
> 
> 
> On 2025/2/9 02:49, I Hsin Cheng wrote:
> > When !start_pte is true, the "pml" spinlock is still being holded and
> > the branch "out_pte" is taken. If "ptl" is equal to "pml", the lock
> > "pml" will still be locked when the function returns.
> 
> No. When start_pte is NULL, the ptl must also be NULL, so the ptl and
> pml will not be equal.
> 
> > 
> > It'll be better to set a new branch "out_pte" and jump to it when
> > !start_pte is true at the first place, therefore no additional check for
> > "start_pte" or "ptl != pml" is needed, simply unlock "pml" and return.
> > 
> > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > ---
> >   mm/pt_reclaim.c | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/mm/pt_reclaim.c b/mm/pt_reclaim.c
> > index 7e9455a18aae..163e38f1728d 100644
> > --- a/mm/pt_reclaim.c
> > +++ b/mm/pt_reclaim.c
> > @@ -43,7 +43,7 @@ void try_to_free_pte(struct mm_struct *mm, pmd_t *pmd, unsigned long addr,
> >   	pml = pmd_lock(mm, pmd);
> >   	start_pte = pte_offset_map_rw_nolock(mm, pmd, addr, &pmdval, &ptl);
> >   	if (!start_pte)
> > -		goto out_ptl;
> > +		goto out_pte;
> >   	if (ptl != pml)
> >   		spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
> > @@ -68,4 +68,8 @@ void try_to_free_pte(struct mm_struct *mm, pmd_t *pmd, unsigned long addr,
> >   		pte_unmap_unlock(start_pte, ptl);
> >   	if (ptl != pml)
> >   		spin_unlock(pml);
> > +	return;
> > +
> > +out_pte:
> > +	spin_unlock(pml);
> >   }

Hi Qi,

Thanks for your kindly review!

> No. When start_pte is NULL, the ptl must also be NULL, so the ptl and
> pml will not be equal.

Since this is the case, we don't have to do any addtional check for
"start_pte" and "ptl != pml", we can be sure that only the second check
will be true so we can unlock "pml" without the redundant check, that's
my understanding, what do you think?

Best regards,
I Hsin Cheng


