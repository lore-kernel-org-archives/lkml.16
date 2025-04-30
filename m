Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6276C14AD2D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038542; cv=none; b=qnDppSKGpImiCUBDwdIQkr7QsgnDG+Izr7s8Pu9Gy3hWq5aRatlsnu8sRCROqQoKA2+MmZV0cgAbh5dOfGf/hcIb22lxfI2h4nb967W+TrkTm5+4f08H3suDClt1jnpWK0qgPgrDxb6XctgpdnnbCTBdQ0N4KVzNlU9mSG1a8QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038542; c=relaxed/simple;
	bh=sWVpV07GkosTG4YtlqMJtrZTtaM1dl35llXbM9o7O8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDABAOsSxOsydYIPmQgQ41tk0SEm6oiNt/u14KNw7K/6aCmfZ+xn+g6PqkAw2T2mSgRzn4CkFhu0ATsYneOcqPz/2hxPTjVlJXEEi5TBPyqRhPwTc6UVQFSOZE0seNK9teZS971+YVAzJHPaCuHl6HzPHindOOPZHDipyaPDKrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kWqhMqX9; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kWqhMqX9"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2240aad70f2so45015ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746038538; x=1746643338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GsjOJiRQohVeKHYuSVlaQjbAdgiTiNRPO9Ov5+6OAak=;
        b=kWqhMqX98WB0l00Vhp9WEEaeb8lCYx7QMxg3mDmXBf0i2hCdcFTzICXDkFlciloaoY
         MJSlVrXR9CX/99fm2jVahmuvOPmNp/5mj264VO9QXJ3S1q6Y7kTXwdNXLGq171ruGldT
         /oAxaIhHboYqzTQmvLLY4yCJSoqqKjx7Ll5rjHJhTM1joPHcci5Z7LHvMjjkI2IfAD59
         AxYjeFWq3WjlteG+bkmR/cqK1+U9ASsuNZO8T2+ZZRuQ3aDbWIdwFqj1lhEvOfCHUMgh
         f3AaifYo1WKKAXks9C6ZCBiwNBBtiBmOvIyOJaw2BMH7sfjEP6SBDL1xslvdPT3pZ1zJ
         SA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038538; x=1746643338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GsjOJiRQohVeKHYuSVlaQjbAdgiTiNRPO9Ov5+6OAak=;
        b=NXP+R4atOx+LFVa310/GJIJw/1rIcNHzIE3cDPPX+EDJ6WEYFwWXsypv15Xne4wrkq
         9ko2UzyjxXKCBi4w0C/wK+t/TYTqm5+Bj0O+fTUTxIOp5wjl4qPJ9vhRNQsbO8NHvo3Z
         SmLCCFxsZQ+orWLFTGm1Rxw4CeDhtBa+GlWXA6gKHZ4F9oic5z+6MoUeEm7swT3zydFh
         5dPFuwfMlR2Td9nIE79/fKt0De8B6fPPaftw7+M11y9aiEIERTtrSKSFNAUXVAaTZZra
         nxCJd4CUrJ24Dh0giaqKv4GALHU0x7B7da/H+FPRTRdQjcmHMv7sf3QGQI54f52PyxKO
         6EaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9V1O1p7LzyBnAdM1BBDdbLgLzBAkNyKAuRNF6O6cLw+UM42u/wtm5nTNHdg2aPxOgkMIani6fad7x3oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUAnCDCGneXwA3pG1nYRlXKesbjq0zJYkYmcNyo7SWyCXeaf2M
	cdUZSn0TdgTs4tGs9Z2OA7sf5j6aoAIYeL8wbNc7EOLlFHHpt/iMHuJkhN0ZQg==
X-Gm-Gg: ASbGncvm1v/e+Ccol8rItQk9qdwzE7N3ax9jz2SIWPJsDIj3UcJ/PZlxQzKKSCKmk4B
	Vr73n8gZM22mmm/p4K0LLEdd8mJq/aK9zO7r+CQH5kpPkllVi3mfeQ3beXlcPFPJg/l0GvjaVWx
	4mvTFynK82dLG/ZSBe43ckacRlN97nEdtPP9jZ/spNmW7pc0YLyeIpLI24FtUEzFy+A2aXnKvuj
	ie9ZIqoksh2Ic2xefqjd35v6X5l35Wa3rVpPMQ+V20oR7/S5AUIXVoe2jCVutnqQYBIVmJXL60e
	S1o6CQ9WJsyRMvmkm/OSZeE3D/ltW5sOJuVk+T8VslPxQdPcm3pQWBuDL7ckH1CpHvQY6R2BIjp
	u
X-Google-Smtp-Source: AGHT+IE5MTly6WSsoVAOumLpcNaYTMtE8mlKb0MytfpG/Zqagx8s9Ig/Xkyr7qxG2qLIdlpkZJdbcw==
X-Received: by 2002:a17:902:c402:b0:224:a93:704d with SMTP id d9443c01a7336-22e03d05ac3mr343385ad.2.1746038538309;
        Wed, 30 Apr 2025 11:42:18 -0700 (PDT)
Received: from google.com (152.33.83.34.bc.googleusercontent.com. [34.83.33.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22dd9530465sm64007025ad.10.2025.04.30.11.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 11:42:17 -0700 (PDT)
Date: Wed, 30 Apr 2025 18:42:13 +0000
From: Carlos Llamas <cmllamas@google.com>
To: "Tiffany Y. Yang" <ynaffit@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH 1/2] binder: Refactor binder_node print synchronization
Message-ID: <aBJvBRPlh46j9Q9e@google.com>
References: <20250327220225.3180998-3-ynaffit@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327220225.3180998-3-ynaffit@google.com>

On Thu, Mar 27, 2025 at 10:02:25PM +0000, Tiffany Y. Yang wrote:
> The binder driver outputs information about each dead binder node by
> iterating over the dead nodes list, and it prints the state of each live
> node in the system by traversing each binder_proc's proc->nodes tree.
> Both cases require similar logic to maintain the global lock ordering
> while accessing each node.
> 
> Create a helper function to synchronize around printing binder nodes in
> a list. Opportunistically make minor cosmetic changes to binder print
> functions.
> 
> Signed-off-by: Tiffany Y. Yang <ynaffit@google.com>
> ---
>  drivers/android/binder.c | 114 +++++++++++++++++++++------------------
>  1 file changed, 63 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index 76052006bd87..d963a7860aa3 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -6377,10 +6377,10 @@ static void print_binder_transaction_ilocked(struct seq_file *m,
>  }
>  
>  static void print_binder_work_ilocked(struct seq_file *m,
> -				     struct binder_proc *proc,
> -				     const char *prefix,
> -				     const char *transaction_prefix,
> -				     struct binder_work *w)
> +				      struct binder_proc *proc,
> +				      const char *prefix,
> +				      const char *transaction_prefix,
> +				      struct binder_work *w)
>  {
>  	struct binder_node *node;
>  	struct binder_transaction *t;
> @@ -6430,7 +6430,7 @@ static void print_binder_work_ilocked(struct seq_file *m,
>  
>  static void print_binder_thread_ilocked(struct seq_file *m,
>  					struct binder_thread *thread,
> -					int print_always)
> +					bool print_always)
>  {
>  	struct binder_transaction *t;
>  	struct binder_work *w;
> @@ -6505,8 +6505,50 @@ static void print_binder_ref_olocked(struct seq_file *m,
>  	binder_node_unlock(ref->node);
>  }
>  
> -static void print_binder_proc(struct seq_file *m,
> -			      struct binder_proc *proc, int print_all)
> +/**
> + * print_next_binder_node_ilocked() - Print binder_node from a locked list
> + * @m:          struct seq_file for output via seq_printf()
> + * @node:       struct binder_node to print fields of
> + * @prev_node:	struct binder_node we hold a temporary reference to (if any)
> + *
> + * Helper function to handle synchronization around printing a struct
> + * binder_node while iterating through @node->proc->nodes or the dead nodes
> + * list. Caller must hold either @node->proc->inner_lock (for live nodes) or
> + * binder_dead_nodes_lock.

nit: kinda obvious but could you specify that these locks get released
and reaquired? only to be explicit about this functionality.

> + *
> + * Return:	pointer to the struct binder_node we hold a tmpref on
> + */
> +static struct binder_node *
> +print_next_binder_node_ilocked(struct seq_file *m, struct binder_node *node,
> +			       struct binder_node *prev_node)
> +{
> +	/*
> +	 * Take a temporary reference on the node so that isn't removed from
> +	 * its proc's tree or the dead nodes list while we print it.
> +	 */
> +	binder_inc_node_tmpref_ilocked(node);
> +	/*
> +	 * Live nodes need to drop the inner proc lock and dead nodes need to
> +	 * drop the binder_dead_nodes_lock before trying to take the node lock.
> +	 */
> +	if (node->proc)
> +		binder_inner_proc_unlock(node->proc);
> +	else
> +		spin_unlock(&binder_dead_nodes_lock);
> +	if (prev_node)
> +		binder_put_node(prev_node);
> +	binder_node_inner_lock(node);
> +	print_binder_node_nilocked(m, node);
> +	binder_node_inner_unlock(node);
> +	if (node->proc)
> +		binder_inner_proc_lock(node->proc);
> +	else
> +		spin_lock(&binder_dead_nodes_lock);
> +	return node;
> +}
> +
> +static void print_binder_proc(struct seq_file *m, struct binder_proc *proc,
> +			      bool print_all)
>  {
>  	struct binder_work *w;
>  	struct rb_node *n;
> @@ -6519,31 +6561,17 @@ static void print_binder_proc(struct seq_file *m,
>  	header_pos = m->count;
>  
>  	binder_inner_proc_lock(proc);
> -	for (n = rb_first(&proc->threads); n != NULL; n = rb_next(n))
> +	for (n = rb_first(&proc->threads); n; n = rb_next(n))
>  		print_binder_thread_ilocked(m, rb_entry(n, struct binder_thread,
>  						rb_node), print_all);
>  
> -	for (n = rb_first(&proc->nodes); n != NULL; n = rb_next(n)) {
> +	for (n = rb_first(&proc->nodes); n; n = rb_next(n)) {
>  		struct binder_node *node = rb_entry(n, struct binder_node,
>  						    rb_node);
>  		if (!print_all && !node->has_async_transaction)
>  			continue;
>  
> -		/*
> -		 * take a temporary reference on the node so it
> -		 * survives and isn't removed from the tree
> -		 * while we print it.
> -		 */
> -		binder_inc_node_tmpref_ilocked(node);
> -		/* Need to drop inner lock to take node lock */
> -		binder_inner_proc_unlock(proc);
> -		if (last_node)
> -			binder_put_node(last_node);
> -		binder_node_inner_lock(node);
> -		print_binder_node_nilocked(m, node);
> -		binder_node_inner_unlock(node);
> -		last_node = node;
> -		binder_inner_proc_lock(proc);
> +		last_node = print_next_binder_node_ilocked(m, node, last_node);
>  	}
>  	binder_inner_proc_unlock(proc);
>  	if (last_node)
> @@ -6551,12 +6579,10 @@ static void print_binder_proc(struct seq_file *m,
>  
>  	if (print_all) {
>  		binder_proc_lock(proc);
> -		for (n = rb_first(&proc->refs_by_desc);
> -		     n != NULL;
> -		     n = rb_next(n))
> +		for (n = rb_first(&proc->refs_by_desc); n; n = rb_next(n))
>  			print_binder_ref_olocked(m, rb_entry(n,
> -							    struct binder_ref,
> -							    rb_node_desc));
> +							     struct binder_ref,
> +							     rb_node_desc));
>  		binder_proc_unlock(proc);
>  	}
>  	binder_alloc_print_allocated(m, &proc->alloc);
> @@ -6696,7 +6722,7 @@ static void print_binder_proc_stats(struct seq_file *m,
>  	count = 0;
>  	ready_threads = 0;
>  	binder_inner_proc_lock(proc);
> -	for (n = rb_first(&proc->threads); n != NULL; n = rb_next(n))
> +	for (n = rb_first(&proc->threads); n; n = rb_next(n))
>  		count++;
>  
>  	list_for_each_entry(thread, &proc->waiting_threads, waiting_thread_node)
> @@ -6710,7 +6736,7 @@ static void print_binder_proc_stats(struct seq_file *m,
>  			ready_threads,
>  			free_async_space);
>  	count = 0;
> -	for (n = rb_first(&proc->nodes); n != NULL; n = rb_next(n))
> +	for (n = rb_first(&proc->nodes); n; n = rb_next(n))
>  		count++;
>  	binder_inner_proc_unlock(proc);
>  	seq_printf(m, "  nodes: %d\n", count);
> @@ -6718,7 +6744,7 @@ static void print_binder_proc_stats(struct seq_file *m,
>  	strong = 0;
>  	weak = 0;
>  	binder_proc_lock(proc);
> -	for (n = rb_first(&proc->refs_by_desc); n != NULL; n = rb_next(n)) {
> +	for (n = rb_first(&proc->refs_by_desc); n; n = rb_next(n)) {
>  		struct binder_ref *ref = rb_entry(n, struct binder_ref,
>  						  rb_node_desc);
>  		count++;
> @@ -6756,29 +6782,15 @@ static int state_show(struct seq_file *m, void *unused)
>  	spin_lock(&binder_dead_nodes_lock);
>  	if (!hlist_empty(&binder_dead_nodes))
>  		seq_puts(m, "dead nodes:\n");
> -	hlist_for_each_entry(node, &binder_dead_nodes, dead_node) {
> -		/*
> -		 * take a temporary reference on the node so it
> -		 * survives and isn't removed from the list
> -		 * while we print it.
> -		 */
> -		node->tmp_refs++;
> -		spin_unlock(&binder_dead_nodes_lock);
> -		if (last_node)
> -			binder_put_node(last_node);
> -		binder_node_lock(node);
> -		print_binder_node_nilocked(m, node);
> -		binder_node_unlock(node);
> -		last_node = node;
> -		spin_lock(&binder_dead_nodes_lock);
> -	}
> +	hlist_for_each_entry(node, &binder_dead_nodes, dead_node)
> +		last_node = print_next_binder_node_ilocked(m, node, last_node);
>  	spin_unlock(&binder_dead_nodes_lock);
>  	if (last_node)
>  		binder_put_node(last_node);
>  
>  	mutex_lock(&binder_procs_lock);
>  	hlist_for_each_entry(proc, &binder_procs, proc_node)
> -		print_binder_proc(m, proc, 1);
> +		print_binder_proc(m, proc, true);
>  	mutex_unlock(&binder_procs_lock);
>  
>  	return 0;
> @@ -6807,7 +6819,7 @@ static int transactions_show(struct seq_file *m, void *unused)
>  	seq_puts(m, "binder transactions:\n");
>  	mutex_lock(&binder_procs_lock);
>  	hlist_for_each_entry(proc, &binder_procs, proc_node)
> -		print_binder_proc(m, proc, 0);
> +		print_binder_proc(m, proc, false);
>  	mutex_unlock(&binder_procs_lock);
>  
>  	return 0;
> @@ -6822,7 +6834,7 @@ static int proc_show(struct seq_file *m, void *unused)
>  	hlist_for_each_entry(itr, &binder_procs, proc_node) {
>  		if (itr->pid == pid) {
>  			seq_puts(m, "binder proc state:\n");
> -			print_binder_proc(m, itr, 1);
> +			print_binder_proc(m, itr, true);
>  		}
>  	}
>  	mutex_unlock(&binder_procs_lock);
> -- 
> 2.49.0.395.g12beb8f557-goog
> 

Other than the minor nit feel free to add:

Acked-by: Carlos Llamas <cmllamas@google.com>

--
Carlos Llamas
