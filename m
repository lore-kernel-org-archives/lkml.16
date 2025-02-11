Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F53E17580
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739256596; cv=none; b=lIDCkugNx6AF9MVmD/EC0c1q9BDMEOJGOQqONc3vy7Rvqftgjy+4/j1C8o6nYKN0kV7bXnNxarANDAaBUPsOEBsIYhTCAtTnAH351vxOuq6cXss8Y/+sEOKuet4PYCSLFaoPX5bkiHU3GpFtYNFAd8I+yURgv/s4xwsP0vA1vyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739256596; c=relaxed/simple;
	bh=syxvgG5aSnC8BCCHXiQpmK+NzFSFF2mmtQIstQO7Ny4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTC1X6FFnsLPc2K4cgkgmzKVGxhlucBfLYLel5bUuA6+DrORj/EGC7jgV606MgbzMMboAE8dFv7IxUkCkv5u+B8o4+iIm9iR9ziY6iWxQuQIsMFbZE5TtE4bHLzE11kANcW+yArihhf1EAMWFbe4CCQVML9sVmJ9kZEwsucAPEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ty9SX9WF; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ty9SX9WF"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2fa0f222530so9539433a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739256594; x=1739861394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jQOokKLxPPJM6wkKIyHNLd9+Pp9b+5LPfnGgoWXuDn0=;
        b=Ty9SX9WF8GbXU/0R0PMCr11VD1MgDpLYlaeA3qu5Oe1gZ+AIm3TYP5h116rXaOGw24
         TYqnXO+Q0QxP7OfQ33NTo9ZUuDVXJbmOA4w1GoonMdjqsn979zKIsP44w4bgeJU7nikx
         GowZzZAVDr+2jmuo3qZ+teA1x4OJdOAUSSn06Oqj3ctn1XYjvyA/GfpI9TdA+miydqfX
         N9/nuPs0/Gowc6h8HG2fmz8Oq8upeHPH4D0yOlTbg2rgfuXpilOV7ZW6qL7M/k7JHg8x
         QK2eO24Xx7SDKHBhFrU9vWNFH16YlUJClLFfH6jLmnpBe0dH/gED8FZDmeuYAmLIBlRo
         Kzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739256594; x=1739861394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQOokKLxPPJM6wkKIyHNLd9+Pp9b+5LPfnGgoWXuDn0=;
        b=DCA7etJlGaTW8TrNdPsCCeHgZsZqAnpr7YJKNpQxXvjsDlSoTpOEz1TH8EXUe//umL
         RmQWzjIonEO5rBpMBzY7Xs/T7u9qWLEtHEBiEAYTo65by6qcHN+jiYC5PvxyoSZKWsI7
         WNTcuaHp0K4c702NF74VWYNbZ6MZd68xn4fwJkISQ7v3JPmOS4iZbo2lpwauTMzYWygr
         wcX8DahB0n/NL7nF4/A/0yeHDRwtYbd1ScFBzChciBrLBm9axI6nMsjOMo0tDx/wg4fj
         WxhMsTYa8bY31p1tivAohHa+VWQoh9TQc0kKw6IBUi+i8rUZKmiXi6Sl3qOdpsvYP1al
         wg1A==
X-Forwarded-Encrypted: i=1; AJvYcCXng7vB8ox+rW+kCljgqbsA3hk/2LCI/0iQgnFfVBnBcbvZG0vMftj7UI0E7ALb/7ZtQ9bGvqPHoHcw8F0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB16wAHx0IYNanTPuvDl2ILpYHu5eCH0GGgNF3m/lu5chc8vGD
	EYx/gmk9iro4x0deMu6qfsEj0fOly/JEM09iFUmgYQjXkd5l3clt
X-Gm-Gg: ASbGncu5tmwIdsRDMcblGaGJFR8puBJFdGlVrU92Wl1g755jtOUb/E87F3tpaIwIXS0
	MBXtJyDXXfMXMFVAKCR3URbCMECY9eyoXWxCnHpFFlg9pR4LKhthOGXtewuLWzkB9FGcZ5t7j8b
	VihOqEOKvvo7exZgHHj7scSOOMsnNbNurovI1fcWUGqsRXLhumrEHFDFzhUC/xXgNuZ4DFPnbZi
	rDAFPBu+srBLKYkh7CtwZGksPhs9afW6BbVcJFa7FQx8435niNyRIfwZWEQOo/BZ2su8Y4abeYD
	RQxwUWwsDE+2mPxyqKf8FZdARFPq8OPA
X-Google-Smtp-Source: AGHT+IELNtolGFaYMulFUWYPjjW//WyLogewZKFix2NRrSze94DwcLWMxwaZlSsSi+L9DGHnQVbi/Q==
X-Received: by 2002:a05:6a00:91a5:b0:730:7771:39c6 with SMTP id d2e1a72fcca58-73077713aecmr17656232b3a.8.1739256594295;
        Mon, 10 Feb 2025 22:49:54 -0800 (PST)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:fb40:c00e:5259:b412])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7308a05f754sm3552633b3a.153.2025.02.10.22.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 22:49:52 -0800 (PST)
Date: Tue, 11 Feb 2025 14:49:47 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: zhengqi.arch@bytedance.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH] mm: pgtable: Unlock pml without branches when !start_pte
Message-ID: <Z6rzC5MGG8xrjnnF@vaxr-BM6660-BM6360>
References: <20250210100948.312130-1-richard120310@gmail.com>
 <20250210163736.ed1c93a44a47e39820fb8d85@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210163736.ed1c93a44a47e39820fb8d85@linux-foundation.org>

On Mon, Feb 10, 2025 at 04:37:36PM -0800, Andrew Morton wrote:
> On Mon, 10 Feb 2025 18:09:48 +0800 I Hsin Cheng <richard120310@gmail.com> wrote:
> 
> > When !start_pte is true, the branch for "start_pte" in "out_ptl" label
> > section is surely false, and "ptl != pml" must be true since "ptl" is
> > NULL in this case.
> > 
> > It means both branches in "out_ptl" are redundant, only one thing to be
> > done is to unlock "pml", make it directly unlock "pml" and return in
> > this case.
> 
> Hopefully the compiler will skip the `if (start_pte)' test.
> 
> Generally, we try to avoid multiple function return points.  We could do
> 
> --- a/mm/pt_reclaim.c~mm-pgtable-unlock-pml-without-branches-when-start_pte
> +++ a/mm/pt_reclaim.c
> @@ -43,7 +43,7 @@ void try_to_free_pte(struct mm_struct *m
>  	pml = pmd_lock(mm, pmd);
>  	start_pte = pte_offset_map_rw_nolock(mm, pmd, addr, &pmdval, &ptl);
>  	if (!start_pte)
> -		goto out_ptl;
> +		goto out_unlock;
>  	if (ptl != pml)
>  		spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
>  
> @@ -67,5 +67,6 @@ out_ptl:
>  	if (start_pte)
>  		pte_unmap_unlock(start_pte, ptl);
>  	if (ptl != pml)
> +out_unlock:
>  		spin_unlock(pml);
>  }
> _
> 
> but that's really ugly.


Hi Andrew,

Thanks for your review!

>       if (ptl != pml)
> +out_unlock:
>               spin_unlock(pml);
>  }
> _
>
> but that's really ugly.

I agree. Would you be so nice to suggest some test method for me so I
can try to test how much benefit we can get from this?

If the case happens frequently enough I think it might be worth it?

Best regards,
I Hsin Cheng
