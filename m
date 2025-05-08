Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DF126280F
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 18:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746727347; cv=none; b=WKJrV/0lRNt59nI9y7gv0v9cB25eo1Qn0immkhF/immK8BbbZA9fbPi0quprukiDgpsmhrQqKZ5W3o+z+ZaHhFmwXeaNmk7pe9XBsLx9tupJf/i2XYr9kwUkI2BOWZkEJuGt70se8xhfR0hBMEiJUmng5eVZUXbTrVOjyS5Q4ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746727347; c=relaxed/simple;
	bh=6r0MPiv/X9Qh6ZOujAKpfzG9P4sK4ESaGFvrB4VEsnE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6O5frtdFog53aWzXbveM9Pe9rdd14IyYmnOHoexIZeSUhoDk5gW8Wp3BdApW+44qW6PwzXTqtL2B85vOrbeH06edi72u5EL1nJQqfWBC8/mrYyeTZJEhOwYQHe1W91akLZ3i1NrcCY7Hp4vDpLl7bi0TK2u2Ryt71+czG6kkSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfl2Jt5b; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfl2Jt5b"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54b1095625dso1423982e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 11:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746727344; x=1747332144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aDqVjOVDSbrGoztVpPa8Pvok27RW/0weN3Ylqs8Sf+Q=;
        b=gfl2Jt5bgxZcrdV9EpnU9n32rTlBeuo5XQMKmiEWT9bsdywNZRmMht0CBCQqZW+wgu
         6cy+4vpwqjfDnyVldLTP1fm9H2P6recqocgAYcBzvKCtQcfXhIYvzvOQhPi/YgHtakwP
         hKq1xBvn2xI4Azj0SMnES1LIVkxOz2/NqUhhome/3fR5blSJTGQy8wALnHRW5hxQjUpZ
         7rJmrgW8jVWHiNC0ew9XdaKSgJhq3ZF8s7fuMxOeyAvVpCzsKbCJ4TsQ4Yvxxsu0W+1j
         KSdx1bEPDWEuJ0hqVQyZjInqCZCrsXSH9XVulyQbXztipC1t4973Xu0Zj9xaWloV18V1
         HxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746727344; x=1747332144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDqVjOVDSbrGoztVpPa8Pvok27RW/0weN3Ylqs8Sf+Q=;
        b=IT/8IV+t99gMkRArjVz0Tbu9XJeeMl9btgosKBSkCzv1oENY5VCrwWlXAyC8SP9o7h
         8EBhGGbnthBZjgm+eBA8ZADwu7u7aKg9SE4e3nzOcnsnRXGeJReqOfixsW0R3eYGJbn4
         vuRkD03rWSMwD6oLcDtSrJOdT11f96F1ScI8qxPYTH7mObTta/yCvHF91bQ+lW/+eGa0
         GcCs8uiLs3Ax8Pct97wt/YBVfw4U7BlUOLOuXgFUdLJCxB7xAscwKg6Qmpj00Tsrvxvc
         N6ukpUHuxawcrrjxBWz3s8hMlFNtlM30xKSTguT83bGtRNKcFlQ/rrbDcxeIXDeuQ5BZ
         MZlw==
X-Forwarded-Encrypted: i=1; AJvYcCV2lH95mI+1ONunGKUVXWJaqL1QG0VsCrB/CEhBuR2Qf71QBbJKazVjVNdhQwhhK8bIULuZm96DjR6hvcg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt7sIvqDMSN8sE88mlbOnfQvDuK7i5hdKgXUtx41i3TTNzGBGb
	ThAIq7Uc/ToPsuJJ4J2DwgVS2U0cH+NZiaEKdDyB1iN/3+sRoRJX
X-Gm-Gg: ASbGncuHtwzG9Bi75Ojscpljh+tUtyp1Dw6twCwYjp3UyGe6Jf1qoZpAbkis+Zkw9iP
	IaDfsGCdioxFXTuWysA1ifbB7Ei8ftdYiZgiM13iNfwidwePup5B5q92zYg9ApGvyxMqAlcXhUn
	pmmNiPRZ0RpwzauKInh3zu1fLdP88USAs6eVTk4AbeO9kbzkz3Mt+gDxVTths/0THoIt/hEs4/v
	Jes+3or78Mo13UpCcTc7BslAbbf0TmOTuFcg1p7SlB+AjpH3xj03vNrlliZ7kkAiIf70KdeETC8
	+UKExnkGbU5hnMDnUw90NXGMDT0Rdtg2bSLClrgErU6zWqpg0aXp8XPeVojcyhLvAYtu
X-Google-Smtp-Source: AGHT+IH3iDwoZGOTMx60shDHlSpyXpsXIVI3ahXbHvH2slyiPOeQMmeYRrq2OdjvDtsUUeTqUyyOUw==
X-Received: by 2002:a05:6512:3c9d:b0:54f:c3c3:beb8 with SMTP id 2adb3069b0e04-54fc67dab4amr50740e87.46.1746727342218;
        Thu, 08 May 2025 11:02:22 -0700 (PDT)
Received: from pc636 (host-95-203-26-194.mobileonline.telia.com. [95.203.26.194])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64cc3f3sm33580e87.216.2025.05.08.11.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 11:02:21 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 8 May 2025 20:02:18 +0200
To: Jeongjun Park <aha310510@gmail.com>
Cc: Jeongjun Park <aha310510@gmail.com>, akpm@linux-foundation.org,
	edumazet@google.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] mm/vmalloc: fix data race in show_numa_info()
Message-ID: <aBzxqiX7unwAqVCY@pc636>
References: <20250508165620.15321-1-aha310510@gmail.com>
 <aBzuh0qb1UPrT86s@pc636>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBzuh0qb1UPrT86s@pc636>

On Thu, May 08, 2025 at 07:48:55PM +0200, Uladzislau Rezki wrote:
> On Fri, May 09, 2025 at 01:56:20AM +0900, Jeongjun Park wrote:
> > The following data-race was found in show_numa_info():
> > 
> > ==================================================================
> > BUG: KCSAN: data-race in vmalloc_info_show / vmalloc_info_show
> > 
> > read to 0xffff88800971fe30 of 4 bytes by task 8289 on cpu 0:
> >  show_numa_info mm/vmalloc.c:4936 [inline]
> >  vmalloc_info_show+0x5a8/0x7e0 mm/vmalloc.c:5016
> >  seq_read_iter+0x373/0xb40 fs/seq_file.c:230
> >  proc_reg_read_iter+0x11e/0x170 fs/proc/inode.c:299
> > ....
> > 
> > write to 0xffff88800971fe30 of 4 bytes by task 8287 on cpu 1:
> >  show_numa_info mm/vmalloc.c:4934 [inline]
> >  vmalloc_info_show+0x38f/0x7e0 mm/vmalloc.c:5016
> >  seq_read_iter+0x373/0xb40 fs/seq_file.c:230
> >  proc_reg_read_iter+0x11e/0x170 fs/proc/inode.c:299
> > ....
> > 
> > value changed: 0x0000008f -> 0x00000000
> > ==================================================================
> > 
> > According to this report,there is a read/write data-race because m->private
> > is accessible to multiple CPUs. To fix this, instead of allocating the heap
> > in proc_vmalloc_init() and passing the heap address to m->private,
> > vmalloc_info_show() should allocate the heap.
> > 
> > Fixes: a47a126ad5ea ("vmallocinfo: add NUMA information")
> > Suggested-by: Eric Dumazet <edumazet@google.com>
> > Suggested-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> > Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> > ---
> > v6: Change CONFIG_NUMA to must be check before doing any work related to the counters array.
> > - Link to v5: https://lore.kernel.org/all/20250508160800.12540-1-aha310510@gmail.com/
> > v5: Change heap to be allocated only when CONFIG_NUMA is enabled
> > - Link to v4: https://lore.kernel.org/all/20250508065558.149091-1-aha310510@gmail.com/
> > v4: Change the way counters array heap is allocated, per Andrew Morton's suggestion.
> >     And fix it to call smp_rmb() in the correct location.
> > - Link to v3: https://lore.kernel.org/all/20250507142552.9446-1-aha310510@gmail.com/
> > v3: Following Uladzislau Rezki's suggestion, we check v->flags beforehand
> >     to avoid printing uninitialized members of vm_struct.
> > - Link to v2: https://lore.kernel.org/all/20250506082520.84153-1-aha310510@gmail.com/
> > v2: Refactoring some functions and fix patch as per Eric Dumazet suggestion
> > - Link to v1: https://lore.kernel.org/all/20250505171948.24410-1-aha310510@gmail.com/
> > ---
> >  mm/vmalloc.c | 63 +++++++++++++++++++++++++++++-----------------------
> >  1 file changed, 35 insertions(+), 28 deletions(-)
> > 
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 3ed720a787ec..c1ea9713a1c0 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -3100,7 +3100,7 @@ static void clear_vm_uninitialized_flag(struct vm_struct *vm)
> >  	/*
> >  	 * Before removing VM_UNINITIALIZED,
> >  	 * we should make sure that vm has proper values.
> > -	 * Pair with smp_rmb() in show_numa_info().
> > +	 * Pair with smp_rmb() in vread_iter() and vmalloc_info_show().
> >  	 */
> >  	smp_wmb();
> >  	vm->flags &= ~VM_UNINITIALIZED;
> > @@ -4914,28 +4914,29 @@ bool vmalloc_dump_obj(void *object)
> >  #endif
> >  
> >  #ifdef CONFIG_PROC_FS
> > -static void show_numa_info(struct seq_file *m, struct vm_struct *v)
> > -{
> > -	if (IS_ENABLED(CONFIG_NUMA)) {
> > -		unsigned int nr, *counters = m->private;
> > -		unsigned int step = 1U << vm_area_page_order(v);
> >  
> > -		if (!counters)
> > -			return;
> > +/*
> > + * Print number of pages allocated on each memory node.
> > + *
> > + * This function can only be called if CONFIG_NUMA is enabled
> > + * and VM_UNINITIALIZED bit in v->flags is disabled.
> > + */
> > +static void show_numa_info(struct seq_file *m, struct vm_struct *v,
> > +				 unsigned int *counters)
> > +{
> > +	unsigned int nr;
> > +	unsigned int step = 1U << vm_area_page_order(v);
> >  
> > -		if (v->flags & VM_UNINITIALIZED)
> > -			return;
> > -		/* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
> > -		smp_rmb();
> > +	if (!counters)
> > +		return;
> >  
> > -		memset(counters, 0, nr_node_ids * sizeof(unsigned int));
> > +	memset(counters, 0, nr_node_ids * sizeof(unsigned int));
> >  
> > -		for (nr = 0; nr < v->nr_pages; nr += step)
> > -			counters[page_to_nid(v->pages[nr])] += step;
> > -		for_each_node_state(nr, N_HIGH_MEMORY)
> > -			if (counters[nr])
> > -				seq_printf(m, " N%u=%u", nr, counters[nr]);
> > -	}
> > +	for (nr = 0; nr < v->nr_pages; nr += step)
> > +		counters[page_to_nid(v->pages[nr])] += step;
> > +	for_each_node_state(nr, N_HIGH_MEMORY)
> > +		if (counters[nr])
> > +			seq_printf(m, " N%u=%u", nr, counters[nr]);
> >  }
> >  
> >  static void show_purge_info(struct seq_file *m)
> > @@ -4962,8 +4963,12 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> >  	struct vmap_node *vn;
> >  	struct vmap_area *va;
> >  	struct vm_struct *v;
> > +	unsigned int *counters;
> >  	int i;
> >  
> > +	if (IS_ENABLED(CONFIG_NUMA))
> > +		counters = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
> > +
> >  	for (i = 0; i < nr_vmap_nodes; i++) {
> >  		vn = &vmap_nodes[i];
> >  
> > @@ -4979,6 +4984,11 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> >  			}
> >  
> >  			v = va->vm;
> > +			if (v->flags & VM_UNINITIALIZED)
> > +				continue;
> > +
> > +			/* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
> > +			smp_rmb();
> >  
> >  			seq_printf(m, "0x%pK-0x%pK %7ld",
> >  				v->addr, v->addr + v->size, v->size);
> > @@ -5013,7 +5023,9 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> >  			if (is_vmalloc_addr(v->pages))
> >  				seq_puts(m, " vpages");
> >  
> > -			show_numa_info(m, v);
> > +			if (IS_ENABLED(CONFIG_NUMA))
> > +				show_numa_info(m, v, counters);
> > +
> >  			seq_putc(m, '\n');
> >  		}
> >  		spin_unlock(&vn->busy.lock);
> > @@ -5023,19 +5035,14 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
> >  	 * As a final step, dump "unpurged" areas.
> >  	 */
> >  	show_purge_info(m);
> > +	if (IS_ENABLED(CONFIG_NUMA))
> > +		kfree(counters);
> >  	return 0;
> >  }
> >  
> >  static int __init proc_vmalloc_init(void)
> >  {
> > -	void *priv_data = NULL;
> > -
> > -	if (IS_ENABLED(CONFIG_NUMA))
> > -		priv_data = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
> > -
> > -	proc_create_single_data("vmallocinfo",
> > -		0400, NULL, vmalloc_info_show, priv_data);
> > -
> > +	proc_create_single("vmallocinfo", 0400, NULL, vmalloc_info_show);
> >  	return 0;
> >  }
> >  module_init(proc_vmalloc_init);
> > --
> LGTM:
> 
> Reviewed-by: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
> 
> Thank you!
>
Also one thing i have just noticed. The "Fixes tag" should be updated to
this: Fixes: 8e1d743f2c26 ("mm: vmalloc: support multiple nodes in vmallocinfo")

the below one should not be blamed:

Fixes: a47a126ad5ea ("vmallocinfo: add NUMA information")

Thanks!

--
Uladzislau Rezki
