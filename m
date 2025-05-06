Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4733B27C150
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 11:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746532546; cv=none; b=IPzPBdGN6BpCU2qUqyK2zRWHnPUSJec6IXjrpl3Yl/e1di6QDsqZF5g4J9ug+qpJX+3vaESNyLX5qnwOCfdb+TM/GlD3jqnWHYqWX2zyAnpWqIA565rwI3sC8op5StGdDoHjr74wYksR+G3B+gm1oZ1XylUJ6HK/qMd9YC6/Gcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746532546; c=relaxed/simple;
	bh=Ju78M2uASabNhZvnSg+EamWDDI7twx0IX8YzmrF1b3U=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqvU9K/STf1qBNKw2rc3nkz9dWQ+rgoQhTfj80i192tkh/e/RN9VX4GR8rM//E2aepI6bxMkRAaySW8H3EucDYvEvrITDFMUlBh5HhVTEalqo2tPQL0p4MN+OHGjpSFIXs4hCskSDUib5uAXsBa+4aJTT8CXG+ZWTqAydzK+4Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4zMR8zo; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4zMR8zo"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30bf1d48843so50084891fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 04:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746532542; x=1747137342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Crh33s5odmDcmUH7zaHEyWwCZ73pPpLq4AVQUaMDOP4=;
        b=Y4zMR8zoYFJqSMqENUmTxS5T4UmRBd2UC00colgeX7TNUGhk9CE8xElWocNttoXHnZ
         zlxMDoAlaLqLXOA8Dhp/wa8Uj4Z/yv+BQdPTK2euKG6xfclgBiCyRbE2gCRD9FZH5ZyI
         Fqz2u3q+yNimN+b0v6Gkh04zKNMpPfraQDbcO3FW6bavlNhiZOwzCRtf7tdkrfWCa0iy
         5g1mp7xnXLgUyWwEFun42sq3diDKaSk9R+PyR1qda1Ue3tXG7SepygUawSw9LeSwMBdE
         n2VChTq98Xnz4bB92Q9MOjr2ssnbExRmcZhGsrrhUEQPC7WcIjFWD+VoIHsiepy29Mud
         hOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746532542; x=1747137342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Crh33s5odmDcmUH7zaHEyWwCZ73pPpLq4AVQUaMDOP4=;
        b=t6biZVXT6N3Dgd50ADZfOE2z8SzAd3h5nROPnVscWfIYFB2Aw8I+jTAfU87M7fpep8
         xlHA4+4HinDOWpJE9xLayBH8UJXoEejyhVtSZxPndOYAM1P8bDpYruYe7xS5pOUl0uzb
         6yCdb3zIt+2oUZasv3Mm1Iv1VbzL5Wb0q9ZTBXKN+PA9F75HxkP8EPIxw7j0ey2TDMiA
         CjXOcneqtmdRssHYJX8O5G7TpCezii/CZ15SybIVYTWZxAyVSpfyUMd6r7+TBEDQ3kAt
         8wFo4fjTpaBeXXE2z9qhBZxbXEzEBNwok1IgAnphYvW8NTs5TV5zyFBXsr93wew3WxmB
         4bQA==
X-Forwarded-Encrypted: i=1; AJvYcCXnn5W0ZCf6S6j9o+nUXrpvXb0AzbKbnLWAQtKCVo+7IoDaeTsGGBVbi5ljdEuTV7IpaZDwp4lX2fjtX/o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3p8O6GXYSsNJbrlS9Vc1xFsBBOIts49oupnIg7Kv8j4C3/8cT
	Es2K6wGNstV7ekA0pzVENuX9ZlGyG1c4hWJ3HRZRIDoBVFQClR8Y
X-Gm-Gg: ASbGncsFHEBYNSYnKjvGPOHgp1C0khHROh9+cQxY/2IVMayD80ouebk3S2gqPGvRDMj
	3aRTOODktoxOI1skT9GBX/CaAhN6Mq8UxC2ae9s2phdU3TgQGN2mGFDmuq/TBCNJaixJSvg92cy
	8P7LKslkI2JQHcC+Nfn/kxsvtex6FFNbCakVs7Vppf8idoAprLlc2Hm4v7kJncVr/Ly+TShOBnK
	kyDMINSs0lfm5J2QVWt7sWxz7CRSJPJvpMNTnsLzs9xj5BoX0eCtn1mW56ZgXgsK2M3Ls2wysK+
	hIqKYh8kow+sKopkzlkWL2IoZ91qr9Pwb6fRLebySjJKozebAZXWgN91WgpigGQFsXP0ITMZdNa
	qH+0=
X-Google-Smtp-Source: AGHT+IGVVspd/1uOxqE6l9hGFvhjEDKvNt/3J+RFEmbCQXyzg7F2oN/Dg1ndiK5dW2/9Z4+UR9isfw==
X-Received: by 2002:a2e:7019:0:b0:30a:2a8a:e4b5 with SMTP id 38308e7fff4ca-3235201a3c7mr26588281fa.27.1746532541900;
        Tue, 06 May 2025 04:55:41 -0700 (PDT)
Received: from pc636 (host-95-203-26-253.mobileonline.telia.com. [95.203.26.253])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202a89f33bsm21226421fa.72.2025.05.06.04.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:55:40 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 6 May 2025 13:55:38 +0200
To: Jeongjun Park <aha310510@gmail.com>
Cc: akpm@linux-foundation.org, urezki@gmail.com, edumazet@google.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/vmalloc: fix data race in show_numa_info()
Message-ID: <aBn4uqA7hnLBH2kL@pc636>
References: <20250506082520.84153-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506082520.84153-1-aha310510@gmail.com>

On Tue, May 06, 2025 at 05:25:19PM +0900, Jeongjun Park wrote:
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
>  new_sync_read fs/read_write.c:489 [inline]
>  vfs_read+0x5b4/0x740 fs/read_write.c:570
>  ksys_read+0xbe/0x190 fs/read_write.c:713
>  __do_sys_read fs/read_write.c:722 [inline]
>  __se_sys_read fs/read_write.c:720 [inline]
>  __x64_sys_read+0x41/0x50 fs/read_write.c:720
>  x64_sys_call+0x1729/0x1fd0 arch/x86/include/generated/asm/syscalls_64.h:1
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xa6/0x1b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> write to 0xffff88800971fe30 of 4 bytes by task 8287 on cpu 1:
>  show_numa_info mm/vmalloc.c:4934 [inline]
>  vmalloc_info_show+0x38f/0x7e0 mm/vmalloc.c:5016
>  seq_read_iter+0x373/0xb40 fs/seq_file.c:230
>  proc_reg_read_iter+0x11e/0x170 fs/proc/inode.c:299
>  new_sync_read fs/read_write.c:489 [inline]
>  vfs_read+0x5b4/0x740 fs/read_write.c:570
>  ksys_read+0xbe/0x190 fs/read_write.c:713
>  __do_sys_read fs/read_write.c:722 [inline]
>  __se_sys_read fs/read_write.c:720 [inline]
>  __x64_sys_read+0x41/0x50 fs/read_write.c:720
>  x64_sys_call+0x1729/0x1fd0 arch/x86/include/generated/asm/syscalls_64.h:1
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xa6/0x1b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> value changed: 0x0000008f -> 0x00000000
> ==================================================================
> 
> According to this report, there is a read/write data-race because m->private
> is accessible to multiple CPUs. To fix this, instead of allocating the heap
> in proc_vmalloc_init() and passing the heap address to m->private,
> show_numa_info() should allocate the heap.
> 
> One thing to note is that show_numa_info() is called in a critical section
> of a spinlock, so it must be allocated on the heap with GFP_ATOMIC flag.
> 
> Fixes: a47a126ad5ea ("vmallocinfo: add NUMA information")
> Suggested-by: Eric Dumazet <edumazet@google.com>
> Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> ---
> v2: Refactoring some functions and fix patch as per Eric Dumazet suggestion
> - Link to v1: https://lore.kernel.org/all/20250505171948.24410-1-aha310510@gmail.com/
> ---
>  mm/vmalloc.c | 50 +++++++++++++++++++++++++-------------------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 3ed720a787ec..a5e795346141 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -4914,28 +4914,32 @@ bool vmalloc_dump_obj(void *object)
>  #endif
>  
>  #ifdef CONFIG_PROC_FS
> +
> +/*
> + * Print number of pages allocated on each memory node.
> + *
> + * This function can only be called if CONFIG_NUMA is enabled
> + * and VM_UNINITIALIZED bit in v->flags is disabled.
> + */
>  static void show_numa_info(struct seq_file *m, struct vm_struct *v)
>  {
> -	if (IS_ENABLED(CONFIG_NUMA)) {
> -		unsigned int nr, *counters = m->private;
> -		unsigned int step = 1U << vm_area_page_order(v);
> +	unsigned int nr, *counters;
> +	unsigned int step = 1U << vm_area_page_order(v);
>  
> -		if (!counters)
> -			return;
> +	counters = kcalloc(nr_node_ids, sizeof(unsigned int), GFP_ATOMIC);
> +	if (!counters)
> +		return;
>  
> -		if (v->flags & VM_UNINITIALIZED)
> -			return;
> -		/* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
> -		smp_rmb();
> +	/* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
> +	smp_rmb();
>  
> -		memset(counters, 0, nr_node_ids * sizeof(unsigned int));
> +	for (nr = 0; nr < v->nr_pages; nr += step)
> +		counters[page_to_nid(v->pages[nr])] += step;
> +	for_each_node_state(nr, N_HIGH_MEMORY)
> +		if (counters[nr])
> +			seq_printf(m, " N%u=%u", nr, counters[nr]);
>  
> -		for (nr = 0; nr < v->nr_pages; nr += step)
> -			counters[page_to_nid(v->pages[nr])] += step;
> -		for_each_node_state(nr, N_HIGH_MEMORY)
> -			if (counters[nr])
> -				seq_printf(m, " N%u=%u", nr, counters[nr]);
> -	}
> +	kfree(counters);
>  }
>  
>  static void show_purge_info(struct seq_file *m)
> @@ -5013,7 +5017,10 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
>  			if (is_vmalloc_addr(v->pages))
>  				seq_puts(m, " vpages");
>  
> -			show_numa_info(m, v);
> +			if (!(v->flags & VM_UNINITIALIZED) &&
>
I think it makes sense to move the VM_UNINITIALIZED check before:

<snip>
			v = va->vm;

			seq_printf(m, "0x%pK-0x%pK %7ld",
				v->addr, v->addr + v->size, v->size);
<snip>

because it can be still un-initialized, thus flags like "nr_pages", etc
will not be valid.

Any thoughts? It has nothing to do with a patch, because it fixes other
race issue and what i propose might well be a separate patch if we agree.

Thanks!

--
Uladzislau Rezki
