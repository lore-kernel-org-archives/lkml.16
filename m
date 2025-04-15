Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F1C2DFA44
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744730746; cv=none; b=Y+ManeueOLG49XBB4iUqnhGWiQqkU0T96FzZaLMyW6eMMyPzB2CkKHv9q46r2cC2C4vJP1ELHbRSCrpWeRaqn95ZoQWzxxu1WUhAa2vaDRsRA6/8/MUzJHs97FunG6AFFfSTOiUj7lAz9G6WIEFUj4qL7fZY9Yvm3Y8GjsvfLGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744730746; c=relaxed/simple;
	bh=eJ5TV/yiJNMP/oV6PwgCCwBzHVr7SCmO8zpWQrpheZA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNSHm5AAyPRXGmCYiWtzSHwf/Cmkp7dU4XXTOHv1wzzlHk8hohWul07Dmdl3jjcaYRZGrAG31ezgGogmcrhMCmBApgJv3xyrbhndlIXMop4ChvPuYS4uTvzwThH2IY2sTFXwqIvNpea6tF2B+YXhWMvBbuqGgzcZRjsnwxJ4F+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZEZDOBR; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZEZDOBR"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54993c68ba0so7100566e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744730742; x=1745335542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=caCzhh025qvO/bkRjuZEttwiNhcUgLhjeVjQBL91Qmk=;
        b=nZEZDOBRL6Qq0QQ831VXmIk/7l92bdpNLT4NoNhCcG/5uT2C+H61fxjU9cQhP7WFQX
         75N2fB3dZulgJ60yytOwScnDl8A668QNcey2FnaOuwntGDFz4aUz4Mhk8dAP2trUa6mP
         tcWFrzlWm/YvOMJ5UoQ8om6fjbCglNCjk5Itg1S+5OJ5N8rj1Eb17spupSmOMOsrGLhJ
         2XOGCco5sp/dfXB1u0RImaeZ9Q9ZaoglVg2mwxjDw7Gd0DuMKXurMoL31v3i+8wjtP6E
         vQJRMalhOarNqjXLDJR/i/FgheBExJmSotak31que0iDZcleIJ/bn0fD1/cazbRKXOx2
         2Cfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744730743; x=1745335543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caCzhh025qvO/bkRjuZEttwiNhcUgLhjeVjQBL91Qmk=;
        b=HHwhvuGg2gps7Cr85mgHpcrPKgVpxiYhGVyFiIlhrq94B8L/l07GBS3P8JCxQcMv6Q
         giwS5wazoR9Z5RDa21Zbx904v7FXb4q3bFk56Fri2VkzoO6vDNLT3YEZAMyBiTfroKJe
         bjcM5IJ8xm5jW4UQ53a5cbudECbe3xDgvTn1IL2/Wbw0qHpg9hKK+iTvDytn9YYuXY4/
         kiVz2p8ooU1ifWtKFH4b425eEYj5pPWVTpkQ21FLhTrXEjhVQ4ogZeK5RDfSBh/bcjIK
         fXBS3vb6/urF/L01mgNDKBtO/ii5yTazP3b9EKq9QOi4OPsDJ66H1OpyD98/znmOOIRL
         Jfmw==
X-Forwarded-Encrypted: i=1; AJvYcCV+B0R9ddJA8xZZdDfUlD+HZ3MirrAUTLTvOWhnnslAx+YrwolZBr0TYhCH5GKT68y0ir1pGUhrVn5pVo0=@vger.kernel.org
X-Gm-Message-State: AOJu0YznRRHUXxh+BMijVSOUqM7FvUTc6jkWiBCgYw0Zocr5Y2bPJ7vA
	zamesq2UAwih2QaSG+QWfJGKxlT6AV5jkBi2MdDNXNrqhamQpbth
X-Gm-Gg: ASbGnct+GTaoM3caN4AJBD4VPJJo+/3StZ0uyx+Os0+/LuQpviDhn4b0XtZ3D9LCcfV
	lz35tFUE4Uu7PVjKKvOdAanrxrXtLKxtjJnlh2VEPL8dFP/M0anOdpVu7g4xqb1ExYhqF62i1mO
	IyuQxNvXXVZynC4DZk2alkAZc9V1FHzEjsfaSy41Bgjv5w67XQWvmTgesG3MgPBA+GAcjwoD4le
	vSM3i7ibxuQIufeD7/EvGlThAQdj4qAO4aolgkgYpic27wHWrBLjKE0yhDCbiGhsyWYlJHFAT3G
	RbxChBGPo7AmQNb8RQvwARwclcgXOU9sPgvwWBr4z4kyEbqsl48z1CjRjukmn4vrX7qb
X-Google-Smtp-Source: AGHT+IHtTzOVSFETAUI11D2B7sQ8XlHAucdVyO3RfPAl6V4IVSz8VSSholwW0WzIMUxqTf4V++GMbA==
X-Received: by 2002:a05:6512:2385:b0:549:903a:1c2 with SMTP id 2adb3069b0e04-54d452d98bbmr4705640e87.49.1744730742180;
        Tue, 15 Apr 2025 08:25:42 -0700 (PDT)
Received: from pc636 (host-90-233-217-52.mobileonline.telia.com. [90.233.217.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d51ffa1sm1426337e87.228.2025.04.15.08.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 08:25:41 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 15 Apr 2025 17:25:39 +0200
To: Baoquan He <bhe@redhat.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, urezki@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] mm/vmalloc.c: find the vmap of vmap_nodes in reverse
 order
Message-ID: <Z_56cxJLgnfYK9yY@pc636>
References: <20250415023952.27850-1-bhe@redhat.com>
 <20250415023952.27850-3-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415023952.27850-3-bhe@redhat.com>

On Tue, Apr 15, 2025 at 10:39:49AM +0800, Baoquan He wrote:
> When finding VA in vn->busy, if VA spans several zones and the passed
> addr is not the same as va->va_start, we should scan the vn in reverse
> odrdr because the starting address of VA must be smaller than the passed
> addr if it really resides in the VA.
> 
> E.g on a system nr_vmap_nodes=100,
> 
>      <----va---->
>  -|-----|-----|-----|-----|-----|-----|-----|-----|-----|-
>     ...   n-1   n    n+1   n+2   ...   100     0     1
> 
> VA resides in node 'n' whereas it spans 'n', 'n+1' and 'n+2'. If passed
> addr is within 'n+2', we should try nodes backwards on 'n+1' and 'n',
> then succeed very soon.
> 
> Meanwhile we still need loop around because VA could spans node from 'n'
> to node 100, node 0, node 1.
> 
> Anyway, changing to find in reverse order can improve efficiency on
> many CPUs system.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  mm/vmalloc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index aca1905d3397..488d69b56765 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2436,7 +2436,7 @@ struct vmap_area *find_vmap_area(unsigned long addr)
>  
>  		if (va)
>  			return va;
> -	} while ((i = (i + 1) % nr_vmap_nodes) != j);
> +	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
>  
>  	return NULL;
>  }
> @@ -2462,7 +2462,7 @@ static struct vmap_area *find_unlink_vmap_area(unsigned long addr)
>  
>  		if (va)
>  			return va;
> -	} while ((i = (i + 1) % nr_vmap_nodes) != j);
> +	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
>  
>  	return NULL;
>  }
> -- 
> 2.41.0
> 
It depends. Consider a below situation:

             addr
              |
        VA    V
  <------------>
<---|---|---|---|---|---|---|--->
  0   1   2   3   0   1   2   3

basically it matters how big VA and how many nodes it spans. But i
agree that an assumption to reverse back is more convinced in most
cases.

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
