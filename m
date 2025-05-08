Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4FC1F9ED2
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 12:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746708722; cv=none; b=gTrCEEdXaMk1m29o4KhvrtYsnODutXEottPh6YWPdHZRCp7cW4u6IFFbK/mCS3j62M0gaEiMRZLvNAAgy97twJz6AQVY5whg7ONvsnDqini6GzeA/Mnnp8/vaMdL3vpxYg/r4BlSuXgYwUaZLcdIh71KQ0zP8zeZ8dNn1Zw+BWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746708722; c=relaxed/simple;
	bh=BI30KhG5ZsU0PefxOdgETS+WM913EdYeJeN+hZznJTc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVXK4yuLbWnD5AqfrN8QzCF696zdHuv+oIT6y6tYWYgXUl90HnPOYCFVhfw+w8C+fexbf3t8QZvOzQJgIgOSEFDJZnryv/a2XXX2TbP/FuzFu2LcA5OGVqX1qsXwXy/XWvQ+JaURkn7BePhJK2PrNAN/KdZXgDt4E4/q8scVVKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Za6ji0+y; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Za6ji0+y"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30db1bc464dso8855021fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 05:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746708719; x=1747313519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QXefnNocNyDT4tS5Nw3ri7gt0drxJ7YJmnY8ne5PsBs=;
        b=Za6ji0+yWpimknl7XA97s+7FB0PpJ8j8qc6UJERrmQvBkc7ZbJ3xjnhvcgd7vO7pCB
         gMlbTxxPkrDcOHecPcrjwhLpEWlOqZch+WZ4HbLzpBkjnLGQWJPyiQbwKIGT0BM1krCv
         qnF8XJmJuGDFTeKyn9k5suJC7kxG6740KLSGxb0T6z5fbOFB6d6krjw8sM0gsHLJS15q
         3lXS454/UdQQYCQq1GYY+xvjyZDRlKC8+LpyrFTQU4ERQL24QjVTmexsdce1uYZxCFK6
         u6spUjF/7d9+fAG21G+kGvgJUvqtbbKlITR80It2FUSfQbMBm+3zvlBTyZx3K2OKY0n0
         ePsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746708719; x=1747313519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXefnNocNyDT4tS5Nw3ri7gt0drxJ7YJmnY8ne5PsBs=;
        b=QDei5FbYJ9DJ8XrqfNYd/7Xq6/duKY1TJzBX42O65T4tOI73ZwNAAtds+MI4DxRsPc
         8AJAb0RPOZtbSozLf77NozTSL6R5+BGR3HVfGmqxVs0/u3/HUvJByDCcPs0JHUHk1C2j
         1sloPvk9epB2p36X+N2nmdsrPUg4LxaO887d4n+j0czwzc6bY4hUMsg4zftbgUrxfz4Z
         8p1cNfSe9oRoZYzxl88h0NQTXiM+J06Z8Ax/+bfeurefSRszU/BREExYGazpZ0bXTNbk
         /y25KLkXognd0A8OMnJ1evM8CktSE+aaoM9e2lE65mB+xxtLuiddAiZEza/HD+KmhL7p
         y8ZA==
X-Forwarded-Encrypted: i=1; AJvYcCX3pJSPMUKxLZJiybOq+GHodQsMYdzmKgnQR4uWWm/dRz/uwcBzepTmL/BmKsOvV98cbUflTAVFCdKdNG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBlS5neuHdhXLXUnFWUG15Zt046cLq8i7fmUlBj2IQDfEcplad
	WPCoajMeZuj2OIdrwN28ZqqtDi5wYdK300nWqMpnDKsqN2r5TFU2
X-Gm-Gg: ASbGnctRG5nQPyMMatxWIXTlfu8LArkbhvGwWtg40N/rd3fxZ4m7IWVUkokXRLCiu1l
	D4+9FhPQE+kaw6DS3a3jPaGebk3TmgI934gnnlXEmUnmzdyWBgl1GJ0/n8iwwugyRqjFuXrU07o
	ELfp6qWABXEfrw0QD7bkIkORzOUJp2AH0aHXOm1fP1gSZkQoCGl/tRibSA51YjbaUSIt5PiPfYA
	7KmMDSXLkoePqwQDM7jwjZD7lNEjV+2/98PaluTmsJ+T3GPFHt6pjKoOLvdUgbqqc+Jny/Ih+cy
	yoLa98GOt5fPZmq2bRazgCSmDu9PFaPMKF9I5vdN5Ne94fi1U2Zistv8qn3OIIpJRibO
X-Google-Smtp-Source: AGHT+IHsWRESsWBmiaAZR1ixPOXPanFcaeReOQUZMb4KYciPQ/LFJTScYcG69m+8oKvuu5nvXnPyhw==
X-Received: by 2002:a05:651c:154b:b0:30d:626e:d031 with SMTP id 38308e7fff4ca-326ad33cf28mr33057001fa.33.1746708718564;
        Thu, 08 May 2025 05:51:58 -0700 (PDT)
Received: from pc636 (host-95-203-26-253.mobileonline.telia.com. [95.203.26.253])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32128ddfc71sm23334391fa.20.2025.05.08.05.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 05:51:57 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 8 May 2025 14:51:55 +0200
To: Jeongjun Park <aha310510@gmail.com>
Cc: akpm@linux-foundation.org, urezki@gmail.com, edumazet@google.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mm/vmalloc: fix data race in show_numa_info()
Message-ID: <aByo6wgsvkxTg1fI@pc636>
References: <20250508065558.149091-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508065558.149091-1-aha310510@gmail.com>

On Thu, May 08, 2025 at 03:55:58PM +0900, Jeongjun Park wrote:
> The following data-race was found in show_numa_info():
> 
> ==================================================================
> BUG: KCSAN: data-race in vmalloc_info_show / vmalloc_info_show
> 
> read to 0xffff88800971fe30 of 4 bytes by task 8289 on cpu 0:
>  show_numa_info mm/vmalloc.c:4936 [inline]
>  vmalloc_info_show+0x5a8/0x7e0 mm/vmalloc.c:5016
>  seq_read_iter+0x373/0xb40 fs/seq_file.c:230
>  proc_reg_read_iter+0x11e/0x170 fs/proc/inode.c:299
> ....
> 
> write to 0xffff88800971fe30 of 4 bytes by task 8287 on cpu 1:
>  show_numa_info mm/vmalloc.c:4934 [inline]
>  vmalloc_info_show+0x38f/0x7e0 mm/vmalloc.c:5016
>  seq_read_iter+0x373/0xb40 fs/seq_file.c:230
>  proc_reg_read_iter+0x11e/0x170 fs/proc/inode.c:299
> ....
> 
> value changed: 0x0000008f -> 0x00000000
> ==================================================================
> 
> According to this report,there is a read/write data-race because m->private
> is accessible to multiple CPUs. To fix this, instead of allocating the heap
> in proc_vmalloc_init() and passing the heap address to m->private,
> vmalloc_info_show() should allocate the heap.
> 
> Fixes: a47a126ad5ea ("vmallocinfo: add NUMA information")
> Suggested-by: Eric Dumazet <edumazet@google.com>
> Suggested-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> ---
> v4: Change the way counters array heap is allocated, per Andrew Morton's suggestion.
>     And fix it to call smp_rmb() in the correct location.
> - Link to v3: https://lore.kernel.org/all/20250507142552.9446-1-aha310510@gmail.com/
> v3: Following Uladzislau Rezki's suggestion, we check v->flags beforehand
>     to avoid printing uninitialized members of vm_struct.
> - Link to v2: https://lore.kernel.org/all/20250506082520.84153-1-aha310510@gmail.com/
> v2: Refactoring some functions and fix patch as per Eric Dumazet suggestion
> - Link to v1: https://lore.kernel.org/all/20250505171948.24410-1-aha310510@gmail.com/
> ---
>  mm/vmalloc.c | 61 ++++++++++++++++++++++++++++------------------------
>  1 file changed, 33 insertions(+), 28 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 3ed720a787ec..112df5a86106 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3100,7 +3100,7 @@ static void clear_vm_uninitialized_flag(struct vm_struct *vm)
>  	/*
>  	 * Before removing VM_UNINITIALIZED,
>  	 * we should make sure that vm has proper values.
> -	 * Pair with smp_rmb() in show_numa_info().
> +	 * Pair with smp_rmb() in vread_iter() and vmalloc_info_show().
>  	 */
>  	smp_wmb();
>  	vm->flags &= ~VM_UNINITIALIZED;
> @@ -4914,28 +4914,29 @@ bool vmalloc_dump_obj(void *object)
>  #endif
>  
>  #ifdef CONFIG_PROC_FS
> -static void show_numa_info(struct seq_file *m, struct vm_struct *v)
> -{
> -	if (IS_ENABLED(CONFIG_NUMA)) {
> -		unsigned int nr, *counters = m->private;
> -		unsigned int step = 1U << vm_area_page_order(v);
>  
> -		if (!counters)
> -			return;
> +/*
> + * Print number of pages allocated on each memory node.
> + *
> + * This function can only be called if CONFIG_NUMA is enabled
> + * and VM_UNINITIALIZED bit in v->flags is disabled.
> + */
> +static void show_numa_info(struct seq_file *m, struct vm_struct *v,
> +				 unsigned int *counters)
> +{
> +	unsigned int nr;
> +	unsigned int step = 1U << vm_area_page_order(v);
>  
> -		if (v->flags & VM_UNINITIALIZED)
> -			return;
> -		/* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
> -		smp_rmb();
> +	if (!counters)
> +		return;
>  
> -		memset(counters, 0, nr_node_ids * sizeof(unsigned int));
> +	memset(counters, 0, nr_node_ids * sizeof(unsigned int));
>  
> -		for (nr = 0; nr < v->nr_pages; nr += step)
> -			counters[page_to_nid(v->pages[nr])] += step;
> -		for_each_node_state(nr, N_HIGH_MEMORY)
> -			if (counters[nr])
> -				seq_printf(m, " N%u=%u", nr, counters[nr]);
> -	}
> +	for (nr = 0; nr < v->nr_pages; nr += step)
> +		counters[page_to_nid(v->pages[nr])] += step;
> +	for_each_node_state(nr, N_HIGH_MEMORY)
> +		if (counters[nr])
> +			seq_printf(m, " N%u=%u", nr, counters[nr]);
>  }
>  
>  static void show_purge_info(struct seq_file *m)
> @@ -4962,8 +4963,11 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
>  	struct vmap_node *vn;
>  	struct vmap_area *va;
>  	struct vm_struct *v;
> +	unsigned int *counters = NULL;
>
Setting NULL can be dropped.

>  	int i;
>  
> +	counters = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
"if (IS_ENABLED(CONFIG_NUMA))"? If no NUMA, allocating and freeing sounds
like without any reason.

> +
>  	for (i = 0; i < nr_vmap_nodes; i++) {
>  		vn = &vmap_nodes[i];
>  
> @@ -4979,6 +4983,11 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
>  			}
>  
>  			v = va->vm;
> +			if (v->flags & VM_UNINITIALIZED)
> +				continue;
> +
> +			/* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
> +			smp_rmb();
>  
>  			seq_printf(m, "0x%pK-0x%pK %7ld",
>  				v->addr, v->addr + v->size, v->size);
> @@ -5013,7 +5022,9 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
>  			if (is_vmalloc_addr(v->pages))
>  				seq_puts(m, " vpages");
>  
> -			show_numa_info(m, v);
> +			if (IS_ENABLED(CONFIG_NUMA))
> +				show_numa_info(m, v, counters);
> +
>  			seq_putc(m, '\n');
>  		}
>  		spin_unlock(&vn->busy.lock);
> @@ -5023,19 +5034,13 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
>  	 * As a final step, dump "unpurged" areas.
>  	 */
>  	show_purge_info(m);
> +	kfree(counters);
>
Maybe check for NULL before and IS_ENABLED(CONFIG_NUMA)?

--
Uladzislau Rezki
