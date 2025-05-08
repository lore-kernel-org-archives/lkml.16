Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6B427D771
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 16:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746720829; cv=none; b=KZ3CR28p3x6TdpZ0+ohspE45fUdR/ryOB6p9EIIqjri6mNSYfGVKMBZcBuWSAZscFY/Aj274jTyNmvwCXP23aFyEh2yx94lvK7krTq3hYGlkfA2036jR8b3b87WsVnoyNfDl31M5EdaFQyzydd92IyG15YTYvlGRSIoi8BJ/Jwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746720829; c=relaxed/simple;
	bh=tfDOPvEPcClOn/dbpViJZAb89XmDcCZ3JOLot4c/T28=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bIcOtrzbbf1kDnVKJGxFg+iJzsnbWF/qUBEivXwLT+RZrLMJGFrkD2vQnGLBGYqW+ULuZwxmp9nVyavKGtvUK3BR8GqWL4Zkoo57pnGMW7j+SRMydzTwPiLxNf3iYoNBUrPbF9doW5VZ8fmfQf7rqSf1EivMoNrDiuKSccNjbnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzJC0sk9; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzJC0sk9"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5499c5d9691so1386734e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 09:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746720826; x=1747325626; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GFej/CPQ8o9iXNIiNBt2KYGS35drif/WrqoV7iS2MvI=;
        b=RzJC0sk9+5He3UEzBSxcFieCBlugaLyztZLJmvp8LlvqI1zk0pJ+GWnw6kuRw33yuG
         xYDK+GltPuXraXkCDHOZ10pshrKOhfDwAru6a2tb8YCKfZFm80ysOErjhFN48ttDwGf3
         2obReDiqwsE9HempZ5nwZ63/Cgb/jUdxen1zbMp/4PoX3eYhupAsmrOF5b0YQEFjlqw/
         IrjJs15phjFylWRJAPSJNitVo/s6t7TMliDhOUMGpE7HBhB3a9PNv99glGswX0q+Ib2+
         6dNTL7DvxxVC6lsn+QI8aas5tuH6L4yG9UeeaCnekon4KhHVMeRzI8z3T93nU5DE70ou
         F3zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746720826; x=1747325626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFej/CPQ8o9iXNIiNBt2KYGS35drif/WrqoV7iS2MvI=;
        b=kQMBUE++4IzjU1mqgIj/5TSOGSZaSa4MQF7csweOEi2UvSB+LmUqLRPDGto4s5wC1w
         3VfDvDasgCG/PHPy6CQ2N/larMHs4CCGTS5LXuf7EJkZhLO3C/MuRGaYWx/iZCOvBADQ
         PwTncbLeSBlZvf47LkPjahvwIfTypIqz2bTJgZF96dhc/4jwm1cGFN0+vEhiXIg5zi2i
         pkPuzKT2hLQu2fEOf5tQ3SnNS99mTHrKENx3jLdSgatF2LXO6k6iQ9f4Ake8hThH+wQH
         JtWQSPLUhiaid+7upoCnVjXnPMeqyv+Ra/OukfDYHC08qDnhEpymrfAdp0KLinEX6XM5
         fgQw==
X-Forwarded-Encrypted: i=1; AJvYcCU6ONR5mhl4f9cMa9dRU/eJXUT+pTYhS1e1W5H/4qk2xDWq2J+oQ40S/CZhohhdEAgZ8ndLL5jHEJgNiUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR/ZQqrD4Y8KgVsIyqCl+UOoInp8p3nrIzX7X50mXv7OMgTwwL
	LsdFeAmvgyJFFovWrXbAiHypNx8n16MpQeUxM6fglWUDw7sZSO9g
X-Gm-Gg: ASbGncsKu2FGJVn4da2kxESJ/Tyrq1OrYx94DOpSmEnEqSS7El1vRuCh/OCL73zR/l7
	xLipF53SywMScjP2dkP1x3zP5xLyLqqyzOwkVWBXE915hcf2aFSB9CULtg1JZrOiN7umqsqDCQ1
	xxWCAbE+kA4ne2KE8/Fa1lCVfpeUD9j8cmeNalwbNRWHGZTZL7AbH1ZBc/c5kMs5AGkRPuZuoke
	+wDrAqz9BT+mY7XwY/PyiI/b3LQ16Hi9QeRnSUU50Kfur27itIhbaH8IqccZ/IFoKLYB94E8i9e
	NNkH+1lR8qvd5PUzQOgk+sCWi5b6VVziX/LE/damuHrlb1V0Cj/lORRbY0Kyf3RHDoeu
X-Google-Smtp-Source: AGHT+IGgD65560HzL/6PBv9voSzw0VRFSOIhsSLY/0ISrjJf8HmXevLYzW7ZEZQnDyYOAqLc3LxiHw==
X-Received: by 2002:ac2:4e0e:0:b0:545:ea9:1a1f with SMTP id 2adb3069b0e04-54fb95fc290mr2417920e87.25.1746720825317;
        Thu, 08 May 2025 09:13:45 -0700 (PDT)
Received: from pc636 (host-95-203-26-194.mobileonline.telia.com. [95.203.26.194])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fd0esm9428e87.6.2025.05.08.09.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 09:13:44 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 8 May 2025 18:13:42 +0200
To: Jeongjun Park <aha310510@gmail.com>
Cc: akpm@linux-foundation.org, urezki@gmail.com, edumazet@google.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] mm/vmalloc: fix data race in show_numa_info()
Message-ID: <aBzYNsvccLZVxcV5@pc636>
References: <20250508160800.12540-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508160800.12540-1-aha310510@gmail.com>

On Fri, May 09, 2025 at 01:07:59AM +0900, Jeongjun Park wrote:
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
> v5: Change heap to be allocated only when CONFIG_NUMA is enabled
> - Link to v4: https://lore.kernel.org/all/20250508065558.149091-1-aha310510@gmail.com/
> v4: Change the way counters array heap is allocated, per Andrew Morton's suggestion.
>     And fix it to call smp_rmb() in the correct location.
> - Link to v3: https://lore.kernel.org/all/20250507142552.9446-1-aha310510@gmail.com/
> v3: Following Uladzislau Rezki's suggestion, we check v->flags beforehand
>     to avoid printing uninitialized members of vm_struct.
> - Link to v2: https://lore.kernel.org/all/20250506082520.84153-1-aha310510@gmail.com/
> v2: Refactoring some functions and fix patch as per Eric Dumazet suggestion
> - Link to v1: https://lore.kernel.org/all/20250505171948.24410-1-aha310510@gmail.com/
> ---
>  mm/vmalloc.c | 62 ++++++++++++++++++++++++++++------------------------
>  1 file changed, 34 insertions(+), 28 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 3ed720a787ec..866f18766dfc 100644
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
> @@ -4962,8 +4963,12 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
>  	struct vmap_node *vn;
>  	struct vmap_area *va;
>  	struct vm_struct *v;
> +	unsigned int *counters = NULL;
>  	int i;
>  
> +	if (IS_ENABLED(CONFIG_NUMA))
> +		counters = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
> +
>  	for (i = 0; i < nr_vmap_nodes; i++) {
>  		vn = &vmap_nodes[i];
>  
> @@ -4979,6 +4984,11 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
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
> @@ -5013,7 +5023,9 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
>  			if (is_vmalloc_addr(v->pages))
>  				seq_puts(m, " vpages");
>  
> -			show_numa_info(m, v);
> +			if (counters)
> +				show_numa_info(m, v, counters);
> +
Let's execute it for NUMA only.

>  			seq_putc(m, '\n');
>  		}
>  		spin_unlock(&vn->busy.lock);
> @@ -5023,19 +5035,13 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
>  	 * As a final step, dump "unpurged" areas.
>  	 */
>  	show_purge_info(m);
> +	kfree(counters);
Let's execute it for NUMA only.

>  	return 0;
>  }
>  
>  static int __init proc_vmalloc_init(void)
>  {
> -	void *priv_data = NULL;
> -
> -	if (IS_ENABLED(CONFIG_NUMA))
> -		priv_data = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
> -
> -	proc_create_single_data("vmallocinfo",
> -		0400, NULL, vmalloc_info_show, priv_data);
> -
> +	proc_create_single("vmallocinfo", 0400, NULL, vmalloc_info_show);
>  	return 0;
>  }
>  module_init(proc_vmalloc_init);
> --

You are so fast :)

--
Uladzislau Rezki
