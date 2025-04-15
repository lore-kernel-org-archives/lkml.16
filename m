Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B5028F51D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744714027; cv=none; b=NxVwPtAf1B7N2ScZfQ+6zAfB3uG177C0B28b+f6MwxOSF3EIeoalnX5MSI2lmUIy3nVAktu+QvqXnzwIqxum3YkZjHxqT7tZ/J/95Cmc2xpszmTxQaj4mz6a/lb3uYmUHfiU7QWb6w7Tm7bt6drqWfDEVIoryIJFBmfQF6V3rSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744714027; c=relaxed/simple;
	bh=ipSHxuq9PryPSm58V/zG3S2ksaEkX5Xf9jUTByC06Bc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tv2KCgOoovVg06erH3cI/tztsvt/jOLKeF8XZC+cQgpB6jji/plDwm3dmsAYBIJuEcH8JAtKiNwYY88NC2BkZWd14l2iJ5WU2rJfjw8dwr9JYnGfMGpJvDbWJgEc9BmYWR1XAwhVs2MKbf/wBNdUrdCBpe4DXeUqdQJXkiD4gtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QyhohY+g; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyhohY+g"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-549b116321aso6305859e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744714024; x=1745318824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7EaxcguEM3rJbY1RIVvFAlZVp9grS7NZ2N0I7IWJKeo=;
        b=QyhohY+gSjBLhIa/6DzmPXOqFNcy2KAUgKlN28AigU9so4/i/57E8XQfODRnA6A+2o
         dWKii/kQ99FKyqyzXpOqeGFmDs+XayesTJI/68uKTtq94OD0WfCv3D0xUDge62DAGvA1
         JpTh9uYrgwpZAK+2ws4TyMvN1GbNK6jpHshBeIrnz2D74/kr1vW5EOUnMI7dl0wy5xYu
         DZVhePyc7tpQLHW13Z5eVsILom1/LffS2HRFTRBlXWIBVxkn8V/QtIm3QS/1+sVzG+4q
         TBLUd9LfM19Op8WTpTPRMSGmRrO8iYHbntnc/pZoaVP8M/q4UfF2cdpApsdo+4SieqTx
         O4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744714024; x=1745318824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EaxcguEM3rJbY1RIVvFAlZVp9grS7NZ2N0I7IWJKeo=;
        b=iGT+Cy3cMJx1/6eoKr2xpeJzfH3Wuxq2Mt+tWG2ZS33GJmpGQ0g1j56S1xx9Whj/Sh
         d40wqDmyWQg07DqrqHTbP4ytNEhER3F72YlAJah+DLjJ4ZzHXnYgFQcHvJ6+gvf2oYZH
         WJP69Nmnf93C4IQYFjMRZVb61AUfpZWDijnJr5yEIApTu/lLt25Qx8eTIQ8COHWxgJmQ
         suamd1+tEgcP5pFtthQycbfVFrSIzwJIox475ZkGjmLukA2xVmYwOmpru9wnzaScrKI0
         OIAaezMXGK38cgIu2S7AhtLDIToN7vhKJKdc1iy+Si4YO6786/eIeoJwk6vy+0H5PKyi
         JFmw==
X-Forwarded-Encrypted: i=1; AJvYcCU3JVkOiJAXyTLVNwAa60U2t/oLgGKMdO77ar24QnX+t0U2C8Vun/jMUqVDIr9ICLIaonu55DiDZG7SJQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1kcYtKNYBbORMc5yrD3bOjjGrPMy3TynDboNkUK62Chehvhnm
	ZUyudl8y6ynGuEIPIBotuYFC0/VXT2TuwW/+BBKSEoFrIvbGEYS0
X-Gm-Gg: ASbGncsOUNXv91rGtH1oKTrJZhagYeMdBo6NJ1Xwo5izqpTA8ug/QMitd+irZ4hb382
	OIDfpnIgsxzrh0aVjzGq41VIxBFPUmXT16PYLdbMcJs3KXg/xLdjFvNo2artZfCQv4+vuQH3zXa
	4JaxiyiWXrXZRTRLlUNpVuFStV+H0UWdJ592FMLuTgcp5HUDjfaDR+RK6oWkNxIqBVpEEvwh7qe
	gfAcWZypQcYJ/VyRpOkyCm9+oZ4UURC2uqrAMmgeI2J4SY7JuhxXdgBCFkdo+mZnWvdVJGXBiCE
	5C72en+dddT43Y7XtznEqL0bpwaZ7WS6bbSdfxlQNQ5RtJs87MXgH0ktnbuy2Jh5rkY2
X-Google-Smtp-Source: AGHT+IHYak+E+5q483HjsGOLaiHh16gPhmjBX5yXJX9pbtSJr9Ts0hG4ikjxr86NGfabxz7MIzRV6A==
X-Received: by 2002:a2e:be14:0:b0:30b:a92c:7dd9 with SMTP id 38308e7fff4ca-310499ff63dmr47915501fa.17.1744714023594;
        Tue, 15 Apr 2025 03:47:03 -0700 (PDT)
Received: from pc636 (host-90-233-217-52.mobileonline.telia.com. [90.233.217.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f779asm21455651fa.91.2025.04.15.03.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:47:03 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 15 Apr 2025 12:47:01 +0200
To: Baoquan He <bhe@redhat.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, urezki@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] mm/vmalloc.c: change purge_ndoes as local static
 variable
Message-ID: <Z_45JSbKPq8eI3am@pc636>
References: <20250415023952.27850-1-bhe@redhat.com>
 <20250415023952.27850-2-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415023952.27850-2-bhe@redhat.com>

On Tue, Apr 15, 2025 at 10:39:48AM +0800, Baoquan He wrote:
> Static variable 'purge_ndoes' is defined in global scope, while it's
> only used in function __purge_vmap_area_lazy(). It mainly serves to
> avoid memory allocation repeatedly, especially when NR_CPUS is big.
> 
> While a local static variable can also satisfy the demand, and can
> improve code readibility. Hence move its definition into
> __purge_vmap_area_lazy().
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  mm/vmalloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 6ee7fc2ec986..aca1905d3397 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2128,7 +2128,6 @@ static DEFINE_MUTEX(vmap_purge_lock);
>  
>  /* for per-CPU blocks */
>  static void purge_fragmented_blocks_allcpus(void);
> -static cpumask_t purge_nodes;
>  
>  static void
>  reclaim_list_global(struct list_head *head)
> @@ -2261,6 +2260,7 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end,
>  {
>  	unsigned long nr_purged_areas = 0;
>  	unsigned int nr_purge_helpers;
> +	static cpumask_t purge_nodes;
>  	unsigned int nr_purge_nodes;
>  	struct vmap_node *vn;
>  	int i;
> -- 
> 2.41.0
> 
Well. I do not have a strong opinion here. But right, it is only
used inside the function.

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
