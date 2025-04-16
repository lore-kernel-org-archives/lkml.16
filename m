Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215002DFA36
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744810226; cv=none; b=DFHg3HuQn/Xoewny0WKeAjLZwLVcQ+XB1nIWNmgkA6Tpxtz4YFi+Z1+nJ+HQsgxwIc5Gm4gJJVaHyBLNjbtd/ptA0ZNiSqeZsXGHf387lU+zcdXEoGRSLiFvLHYskf7euIOrzUZzNytmeG0e+YhkEESXB+8MglsEfbZUF06sonI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744810226; c=relaxed/simple;
	bh=RrZDOQRuaw9s4hWpaPaqWi2CmO5PjAVU9QkoJZqvHnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CO5Dgej13Prr6Ofx06ISV6JzFU43ZbsnHh1FYT4kN3oSaOhKUGJlq86n7W8v579z2g5k0VtUp75sEnuDxQb1IO51cRveDH3dho1MwrZXcbN06MI/scrvIO4votXi12+rBgVqrrpf2qDCI2d2PuY5wztiNXDeWpmgjKxXImrv/tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VK9N/H81; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VK9N/H81"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso3971516f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744810221; x=1745415021; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ruWeQ/jZWWsGDt0cFTUwwu/ek8FIbyqNmdK4Y6AKtkE=;
        b=VK9N/H814NYk+aqh0sObE0rvROC+ytzDqZHNBTIVFSnC9IXM5dbh78Ytqj8fg/ZpPa
         yjFKRPTFcikanSY3WMbCiB3KBb2X0PYUi+f/TInP+NqPKVa1B/2Zf3WKHaGgDHf1eGCe
         e2ovvMaAiFDFSpFgDQQ5CWbpPklrtpU63b6+X11V/cKO82hGMXnF0p24B3iBGcpJY8xh
         FnmF9tfFudYAhv0+gXtWFUWIhQUxrvvNTDPmEFDy4w6/NQlKup+ppX3qu1eMUo9nlHVk
         VjrqFepxVB/UAY8z/Ly+ipc61K/fZAaWty8wr9joEXeC1H0OxohUFDkowIdZilkFZMPn
         NJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744810221; x=1745415021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruWeQ/jZWWsGDt0cFTUwwu/ek8FIbyqNmdK4Y6AKtkE=;
        b=DEUuWw+Ipf9vn1bHpLM+eISkDJkSmdq4RKFtAa42s0S4l3EAUEz0SFE0pcjq0HO9NA
         LEEzuVvkY4+JR8Gw1DfAU+Ybj7rEyhVuPIF1PXuVTA3gVlClZU2SRymCo+7vvUsJDSgw
         TVwe+f9ZijPfiLy3R2BKHdy9n3N9e/+bDI9CcvEXV5ptdfOPGxozoRBpFgvhroV+7VoQ
         WrHHM5drIwOJ3JZihd66qj/S3+8hUkNmF5E+lgUk27W4X3UVab/5wCmKcCC9HBs+JHEd
         u00VmlVlQTAlja4ZUUDQd3KU6hDAgFU44tAlTNyPQGt18DSj66PQPFgbHiA4VxJ5+VYO
         EV9g==
X-Forwarded-Encrypted: i=1; AJvYcCUtp/UPO0zTX7GULHB/nELVHARH/3EQH50CzS6zRkxwthRiIxLem2ygsDsUJDtH90aswjI4sCrT6vNuPHo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/3knMDdJJoTjflI2uUlAYDcVuWuckLkwgmiPq4uF+zr2vZ5PX
	jdd8+VtRu1Tjl7amOlGSMgNrssMZD4ACHBl+CpZQea8Pp8JbxW6dvdzSenkD
X-Gm-Gg: ASbGnctUylW1wYf0cBmnrOho3CPyCwdllewSs6Hw8Qww3LvqovrSD5iXAT//klz8E0L
	4KK6K/r9BVyjAAzABeAsBrJ2cJiMlBWGU0uRPTXP2zmnyvVuuZPNXdN5WbyI7tI8NmKcNmD0xHT
	tFX4oSGJ4hbuZW7eQHCBrRlZPBX0rLtK65jTmRikmitUHPkgSBtL3o/kmjPU6j/1rX4sLhSM30g
	tNY0yymlUYq0P2AnCgKDGZnPEpqbdSUVqHn6Ca7n+WkudtuB8j0JFBSXIOhZKtoKRKZtztx/oAd
	ZkGTssb9rlpsEPDlEF3ZmQI7s0lhO/WGTuUCSML/jroZQ3mGffAHwbQm
X-Google-Smtp-Source: AGHT+IFzmENLvdzlwYIkpGRVUJfIxITPwHNn33jm2bA5qWx5kSthdB1+apT3RE3+Bt7w9e8+fZ+Zvw==
X-Received: by 2002:a05:6000:420d:b0:39c:2b28:604a with SMTP id ffacd0b85a97d-39ee5bb0c8fmr1481397f8f.50.1744810221095;
        Wed, 16 Apr 2025 06:30:21 -0700 (PDT)
Received: from f (cst-prg-69-220.cust.vodafone.cz. [46.135.69.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b50b897sm21303505e9.26.2025.04.16.06.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 06:30:20 -0700 (PDT)
Date: Wed, 16 Apr 2025 15:30:12 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Ye Liu <liuye@kylinos.cn>
Subject: Re: [PATCH] mm/rmap: Move anon_vma initialization to anon_vma_ctor()
Message-ID: <uexsqnlz4pytffffy7i3do7lyn42x7z7ftb45dff7r5333rvmy@ufdjo5em6pp4>
References: <20250415092548.271718-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250415092548.271718-1-ye.liu@linux.dev>

On Tue, Apr 15, 2025 at 05:25:48PM +0800, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Currently, some initialization of anon_vma is performed in
> anon_vma_alloc(). Move the initialization to anon_vma_ctor()
> so that all object setup is handled in one place.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  mm/rmap.c | 27 ++++++++++-----------------
>  1 file changed, 10 insertions(+), 17 deletions(-)
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 67bb273dfb80..9802b1c27e4b 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -89,22 +89,7 @@ static struct kmem_cache *anon_vma_chain_cachep;
>  
>  static inline struct anon_vma *anon_vma_alloc(void)
>  {
> -	struct anon_vma *anon_vma;
> -
> -	anon_vma = kmem_cache_alloc(anon_vma_cachep, GFP_KERNEL);
> -	if (anon_vma) {
> -		atomic_set(&anon_vma->refcount, 1);
> -		anon_vma->num_children = 0;
> -		anon_vma->num_active_vmas = 0;
> -		anon_vma->parent = anon_vma;
> -		/*
> -		 * Initialise the anon_vma root to point to itself. If called
> -		 * from fork, the root will be reset to the parents anon_vma.
> -		 */
> -		anon_vma->root = anon_vma;
> -	}
> -
> -	return anon_vma;
> +	return kmem_cache_alloc(anon_vma_cachep, GFP_KERNEL);
>  }
>  
>  static inline void anon_vma_free(struct anon_vma *anon_vma)
> @@ -453,8 +438,16 @@ static void anon_vma_ctor(void *data)
>  	struct anon_vma *anon_vma = data;
>  
>  	init_rwsem(&anon_vma->rwsem);
> -	atomic_set(&anon_vma->refcount, 0);
> +	atomic_set(&anon_vma->refcount, 1);
>  	anon_vma->rb_root = RB_ROOT_CACHED;
> +	anon_vma->num_children = 0;
> +	anon_vma->num_active_vmas = 0;
> +	anon_vma->parent = anon_vma;
> +	/*
> +	 * Initialise the anon_vma root to point to itself. If called
> +	 * from fork, the root will be reset to the parents anon_vma.
> +	 */
> +	anon_vma->root = anon_vma;
>  }
>  
>  void __init anon_vma_init(void)

As was pointed out by Harry this changes behavior: by shifting to ctor
you make it only happen once instead of every time anon_vma_alloc() is
called. By extension this assumes ->refcount is 1 and so on. By any
chance did you assume ctor executes every time kmem_cache_alloc() is
called?

When making changes of the sort I find it beneficial to place debug-only
asserts in place of moved code at least during development.

So in particular in this case I would add checks like these:
	
VM_BUG_ON(anon_vma->num_children != 0);

and so on.

Then on a kernel compiled with DEBUG_MM this would validate the expected
value is in place and blow up early and loudly if not.
