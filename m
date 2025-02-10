Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D311B425A
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739177965; cv=none; b=f1TPioiD18InhO4ct9TYJ39N3t3D7BOw3kqmeiwV8rpPBf4C4WuAJ2aFIWz+BuEOS6Co3Wg/CRl9mzdA/kCHU8vdCUKfvwSd3USPnh/ETS474Bh+u0zBnUQR7XNkH907I0qPG9ZZsK31K2qJAutyY84JKfGveGhab7+IRvbfh0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739177965; c=relaxed/simple;
	bh=ktCZVxsM0fD1x59ALUygdH79WIh7ptg4qefM/jd53Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ebi4hJ0MBQ5V4Q0DKKDUFt0VI73SpmnsVI7rK8pIFTy5PILz2jKTSFyxh0YmkjQjCWpZHX1yHCz1mDyJqSiZUHg7tIUbfcB9fTTgg20Cwzzk8Pw3OsgT+KZkHBIug6EQnVU8QXdon2F/Jgnd5Ou/wQeore70oOkIiAyUnRc2tWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pbs73Emu; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pbs73Emu"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f818a980cso15094245ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 00:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739177963; x=1739782763; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V0FOdeNN8xEA771wgYDIWAiBn8a2qFfFqcNYmlhYwUY=;
        b=Pbs73EmuXTnKCGzcaRhcoYmyqY9K9q2hUzkzdhhOXMxOpFAqcUTaVMXiHuNyKgDQ93
         tjC9XdrSOE/cZ9/7/woOdPLwLieirvJaXttdHOs/xwCRAFmIFmev5m4XUXRvOyX42mEN
         050pejkWW8NBLas8POmIy0vaqxUAjbmivm5qcuh8P5ziy36AzN6T4iKAN3OCyOe/EPLR
         3pNQWhRJw37gZ2ynqQhbD+0lVjzya3gwJ4awK3W1ID1SICTONyJ0ACRPtVdTrKTRZL7b
         cRoK/tmqEIosAUw4V4Mlb7nZkQ2As92ZJermd01wf5Zn8t9aO0M+9v6S9NSwm1YDX59F
         4c3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739177963; x=1739782763;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V0FOdeNN8xEA771wgYDIWAiBn8a2qFfFqcNYmlhYwUY=;
        b=lLsGyiDKfxX9ImH8t/T/QWT9McJylOQyDd0WCIBHJgXrGUCNKxlZkhEw56+kciThvE
         QDkIUnot8dVVySj2NyjQR+NI6aMWT2A4c+ewmQ5Ldsejwm8qVUHIcHTkKRC45Sj2Ztn8
         N9RA+JHbHK4DBp0jiJ+LOl9ZYe7QQwk76DP2otQs/StMckHy5RxujXXhFH4j6XI1Nmnr
         WFEcYWIsCcJ8rHriTK0B07b64w5qbQbH3UdTj4ZeL5qDC1zkF7/EH1AFr0ySq/uBhni4
         8MiHRh3E0zhCMWZatE/sxLMlg9ASYyTfChZeYQy9oqC4h9dc+kWX8/ceHrsvvYu38rhc
         qarw==
X-Forwarded-Encrypted: i=1; AJvYcCVdW08fASQV0uBU6J1wU1LO/8tCUonwdyNoWiTetB9qgHOJ0Z7CC4MgYBbPwxtRJANK8EDYc3DE80UcS2I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww3wjNDdKDYE2Yymn7dnpKeO87ijcv49buw/qGTfMzrwJfqTAP
	j+CR1cBlZQ9BMrila5+iqXrEXWPXZ7kFoUEIii3J6ocS0+zJ8JKMZW2cOc8+
X-Gm-Gg: ASbGncuw0f1bufZHI4fuK+4+An0/fF4sC9WcYY1bT0YSZF+W09V/5Cxu9OjwNYod/yE
	ojc99P4HGrugn4bfOWA7kWHz+iqb8eBECJgox3ZmdScSt5lZrG/vEBOcc9F4PKl+CxvTggsoii9
	KcYOtgkBb4JIkNz1G8xXMIdtGU0FUULh8I+4HDa7JHlOeVJIF0NBMV00QwJspVkxvLOjqxkbmMQ
	agK7PvW/dJRGNKtKziRzaLMYq/mtihT8/V4iC1fYXoGcMWuPvitYan1Em6yrKKsB+2gvhwWOV99
	6ggQiRTxLUMbqPnRXUo1EgOOHf6zSAnN
X-Google-Smtp-Source: AGHT+IFASvhac+YpuX5T0KXy41OzK3q+6qgA4rC3Ayz2rGb68mM3SVOAwCo3OKKQ5X0mreUc5GFsvA==
X-Received: by 2002:a17:903:2345:b0:216:6fb5:fd83 with SMTP id d9443c01a7336-21f4e716972mr179450335ad.29.1739177963406;
        Mon, 10 Feb 2025 00:59:23 -0800 (PST)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:83e6:5a50:60c5:d373])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650ce16sm73639075ad.9.2025.02.10.00.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 00:59:22 -0800 (PST)
Date: Mon, 10 Feb 2025 16:59:19 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: pgtable: Ensure pml spinlock gets unlock
Message-ID: <Z6m_55VAsY13GcHh@vaxr-BM6660-BM6360>
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

Hi Qi,

> Maybe we can return directly here:
>
>             if (!start_pte) {
>               spin_unlock(pml);
>                 return;
>             }

Ahh that's right I think it's better than adding another label,
it doesn't even need to jump.

Should I send patch v2 for it or wait for the maintainer's review
first?

Best regards,
I Hsin Cheng

