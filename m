Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E072147F5
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746726542; cv=none; b=E3kyRaLXNq+CCkOwjPKcw2dx3yzhyhNXr80MjCrGI2jfDRmZfDwBK8jC+XtXq3TeeEDkd5+4mKOpJ6fXaR0VGJBTRKaYEoKXrgx6ViwfZFVZqE8odWgk91ut8poGRFbtH9igCMOfzsWKg695almM2NxS39+6xlEhCS7ruY/kvIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746726542; c=relaxed/simple;
	bh=Pkvl0wtVMUyRk12ulSDqU5JmAJ9uj9cTrxAK/pbd3FE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axb8UEpHmRFtaGeKwpIHyWFiTWAUWPopx9Z2qC56o5Y+i4SX+wIdLUstNYxZPj5EFdqc3qYZFeMBhZ+x103Cex2eWU36Wy8Jzwv54ZCHMy1J3U89XOuXX1ffq+rNgT/AOyMukIemAWONF/+wqsxuuHZaI8Kbo4rBtCafVPOxn7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbPZsZrg; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbPZsZrg"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54b10956398so471932e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 10:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746726538; x=1747331338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RLVpkrLXml6z3gsyisKKJHxZUHvDSbaVwN7SOYZwBDU=;
        b=BbPZsZrg2RAyXm0X4MztXNI89u9U5U1wuH5RxkqApumZhl9wUyrRFyIdeSqREqxEDN
         I+yGzqyfNcZy0lr+cKBVU//x4eG0xWIPGtLuTB5L8qGe7xDeQYWZl1RI0KeQh76R5ahD
         c1rBkPNxeo4VJO+VfPpxQQcHLOk6TVgxMZwsnXz/l8RtL9tuOkiANqD3yQwz+m6jz/id
         5y7XMZ1J6/g1k5Qbk1Rw5mgw4cb4En3ZoVSpFWU+zCswWWDotRyCtyu3A4Pr0CVh3RcL
         xjQLhm2Lyc8vnRkLbBFzjYgJqHvkTrHA99/fL549lm0YaqeQd/QdBFcr67CuHP+fYX7k
         4b5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746726538; x=1747331338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RLVpkrLXml6z3gsyisKKJHxZUHvDSbaVwN7SOYZwBDU=;
        b=XrVbypFHnHGAev8NBb5BHDK+yX322kKNwVI7+ElqCRQjwId8EyTlJEp9rAU4WLu+2m
         QtV091W+e8RBaL3LTAGuo6zMOp19YkmmHesx7mmzFDq+NM1PLMK/d9iaO3vxVXqhkLmj
         x5+u65LlsSXQnXlKC0XPkVyk6/WtQtD+se7gjqYg0gGIqiQgJiRG24AcrJ+MxEma/dCy
         w5nuVHJoMSy+mACgayWpUVpUY6eF3nawYgRDo5waDJAyGbF240LqaSxFQco9FUn1WyVu
         MrBpHgXv+rZe3cM8Y/ZarhfZ9ev7bPAai3wq+sLNLCAcXOViNNUoAQsXP2AhXEfwMF3x
         5mig==
X-Forwarded-Encrypted: i=1; AJvYcCUlcElieXYzLycTg9qFn9Ac4HIXtVNNhgCzEyZoO51xnYtE2bN1H0a8s4HF5AiyEpukEHbtvDZanr7LVns=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS/anbcg1R/qMCsbgFGAYYWM6TEnO0R8NMkSV6ywj/h3Yy+L0K
	iM3OnAe5yqYPe7DeQe5VhPPHUicrGJAa4/Hp1XF1Tmcn4L0caWAC
X-Gm-Gg: ASbGncugTswhZwQ6eFjzWGDChshldGttcG78wqTuyx/QPmtu1rj7d4JlofNKXKMuqpJ
	iSXPy5DRk0IJBPN5uz170oKhlDt/BHFcDUJzcH2zXrmb/+p7Vsjc+KykLgjJYTMdi+DSixljEIg
	5FS4Z94iEV3+EoiErg0ixDx2DZwsUUx3l7Rc1WSgYlyap9uq5R6MLkWHRvYm/uv9LB22B72u8wQ
	7vUy4OwvSC8Wo3G5sATwVw5cYc4c9uS23VVMdTgbBkSPcQQd3Ug+/wJWJYfFWfVi/5sO/QOiokA
	lmJkwDYg5WeBimshQCWbTtEDFwqvEIAQsRUMOnFxxUbIqbW+DUs7xpaqXLmM76Uyh1aj
X-Google-Smtp-Source: AGHT+IHezibg8GmkS41ZH1NUhSUyDp2pWTDD5Cr9WM1wZKs3IJpCD+KsI2JrnLwYW9i6Hc+A6f/zsw==
X-Received: by 2002:a05:6512:6286:b0:549:4ca4:504a with SMTP id 2adb3069b0e04-54fc6758da9mr67120e87.4.1746726538038;
        Thu, 08 May 2025 10:48:58 -0700 (PDT)
Received: from pc636 (host-95-203-26-194.mobileonline.telia.com. [95.203.26.194])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64ce953sm30346e87.256.2025.05.08.10.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 10:48:57 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 8 May 2025 19:48:55 +0200
To: Jeongjun Park <aha310510@gmail.com>
Cc: akpm@linux-foundation.org, urezki@gmail.com, edumazet@google.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] mm/vmalloc: fix data race in show_numa_info()
Message-ID: <aBzuh0qb1UPrT86s@pc636>
References: <20250508165620.15321-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508165620.15321-1-aha310510@gmail.com>

On Fri, May 09, 2025 at 01:56:20AM +0900, Jeongjun Park wrote:
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
> v6: Change CONFIG_NUMA to must be check before doing any work related to the counters array.
> - Link to v5: https://lore.kernel.org/all/20250508160800.12540-1-aha310510@gmail.com/
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
>  mm/vmalloc.c | 63 +++++++++++++++++++++++++++++-----------------------
>  1 file changed, 35 insertions(+), 28 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 3ed720a787ec..c1ea9713a1c0 100644
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
> +	unsigned int *counters;
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
> +			if (IS_ENABLED(CONFIG_NUMA))
> +				show_numa_info(m, v, counters);
> +
>  			seq_putc(m, '\n');
>  		}
>  		spin_unlock(&vn->busy.lock);
> @@ -5023,19 +5035,14 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
>  	 * As a final step, dump "unpurged" areas.
>  	 */
>  	show_purge_info(m);
> +	if (IS_ENABLED(CONFIG_NUMA))
> +		kfree(counters);
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
LGTM:

Reviewed-by: "Uladzislau Rezki (Sony)" <urezki@gmail.com>

Thank you!

--
Uladzislau Rezki
