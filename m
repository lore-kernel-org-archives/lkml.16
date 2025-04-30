Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D792749FA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038618; cv=none; b=kPdcFhqd68eJhM7j1qFIf5XcaSNDPCim9SYlG6R7VO4BnUiPePuUmtIpmnj5MPD00Ih7qOLxO1Xi0qOJAjUPcEvSnwWx1V0nPGwSD4VeFS1SSmFGOMVOhGBjGg6B/fJy6eOje71TboF72LNSPv47MpRb9heF9T/cAqwTWg5CneQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038618; c=relaxed/simple;
	bh=4Awb9L0LWd8ypaWla0ly7W2pVvCWX/tbJExV9uierUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YH9tZVCp7gusAL17tYCFvwjeX6L3CT0mOQdHP119dI9XU+w8TMe1IgTwp1Z622rrom752/rEvd4nfohHykxm/GWH+ajT6j0bDMvrMldByhvf4zRlDT/ytOpnFUv0J6yxWHZZZfGjSUFbP7PrQILVInyM1cu/u85xvXs6ybiH6Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hGSSpwBz; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hGSSpwBz"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2240aad70f2so45275ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746038613; x=1746643413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YSWWaf/UzHHSDRZCR4uQmA3xPhxxDqCwDLVbFgPt8us=;
        b=hGSSpwBzaWobVKl2JERgsjFahBAfMoB6ydMcgdKSqRsBPt4T7G7sV2TlIHxI6Zr3mB
         oFpQXwXvu+/8R58BJQdmFqZK9dBcrCp4slhhsHBnGVHbSqSZa6lBruVCxRcR+UWYZf05
         JI84SAamLBz06Vk/63i23LjoOMYf92xkTgqw05quq01oKiIpMUAp1jseHIWLiMyNfFlf
         B+X1K2z39wSXwlshgKN438lNSjA6drdG8kOM2zn4N5TZvXaioTuHZF6UWjfNQQi4pAUd
         Iwa8aJICEwFAKOZpG5rCYALgogd0yu8PrDZ6oZwUEY53THK1+TK+T9poi57q3hziDpS8
         dEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038613; x=1746643413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSWWaf/UzHHSDRZCR4uQmA3xPhxxDqCwDLVbFgPt8us=;
        b=cP72LnglLkTLwRU7xIMgw/i7Fxr2asA++pCQbOMYugRn8YFf7uS3Tx5su7Fmk4fL4r
         h4+XFEMwYQ8/HbCNghWNGiIUNMIPzgd9iI/Er7alj7q9GrYWFtNV6KG+6clyMDnQUkuY
         kp5pg9mIqv1zTB2of5dASytg1Dbn4clNcqlJK5F1og0z0Cq3/RU/8Da5I3tVhbNRm5qq
         pMNxJj5euunLoxwRrNyZ/JI1HkHn2MrxD9LLkX0p9So0zXKPu2EcTuU5Rzz1RbzAWbb6
         +CF2uK5lEFsg51jCra+ArnfmZ9KYJKs/MiwVrsH6CjoREqz3Fo+zdzYZP6m1fKv2+PZQ
         NEXg==
X-Forwarded-Encrypted: i=1; AJvYcCWwUrwqbWmxnOuChyS9ZmILOIxDA1bWZJPc3tRXqOoSWZ31Yw/mA49D8ug7f0+p/hX1O9V4AD/Pu0t5nxM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6ExT2lJIw2C+NajXrhBGBxSK72mPVW0wkiutw0HH6bQy0yR6d
	cQnYIn+k+CeE/+04dEg2Db4Kzjk9a1JhJ0J60HpjMAc/dkeEn/1JhmSX/QpJyA==
X-Gm-Gg: ASbGncurUpl/PIuWda0h5Ty2Q2AcQGzqX0R/Ood9zvAyG1gPGHCl7lqHlUAwdNGkm+4
	klDIqYAy3X+nmSojMxAuOHhiiFEig7i6z4a97Pcf4xeJxahoijk3ROPGMo550XaE2b/8pw/56DE
	M9xe29qVyxdAFJZrLBojpkfs8OYJA0ZJn2jgAW92T63Wd9pJe+y5wz2Y903MkTmyJGladyyUxV8
	AwqJds7otrtTuBJThkFYfcDf1VFAQmm4DMpmMZ5Vdc7mimqjcXJd6IWTRBzMgOFK3rcYLehToWx
	Yo4TI4+KDc96k03ReQ5AS0d0I/pXyfbiZ3hJ47nhXnJf+ggJmSTRX7ri9C0jk/leP7TOMp07P6e
	R
X-Google-Smtp-Source: AGHT+IGFDLlrdIolxV4xwSSdA4Xtl+MXOYZSowz1RuO3nojE80IGBv4zGjVXA0FCDFjsA30mCp5m9w==
X-Received: by 2002:a17:902:ccc9:b0:22c:33b4:c2ed with SMTP id d9443c01a7336-22e03de8fbbmr350365ad.26.1746038612926;
        Wed, 30 Apr 2025 11:43:32 -0700 (PDT)
Received: from google.com (152.33.83.34.bc.googleusercontent.com. [34.83.33.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7613sm125431085ad.143.2025.04.30.11.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 11:43:32 -0700 (PDT)
Date: Wed, 30 Apr 2025 18:43:28 +0000
From: Carlos Llamas <cmllamas@google.com>
To: "Tiffany Y. Yang" <ynaffit@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH 2/2] binder: Create safe versions of binder log files
Message-ID: <aBJvUOeznP_4PHDq@google.com>
References: <20250327220225.3180998-3-ynaffit@google.com>
 <20250327220225.3180998-4-ynaffit@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327220225.3180998-4-ynaffit@google.com>

On Thu, Mar 27, 2025 at 10:02:26PM +0000, Tiffany Y. Yang wrote:
> Binder defines several seq_files that can be accessed via debugfs or
> binderfs. Some of these files (e.g., 'state' and 'transactions')
> contain more granular information about binder's internal state that
> is helpful for debugging, but they also leak userspace address data
> through user-defined 'cookie' or 'ptr' values. Consequently, access
> to these files must be heavily restricted.
> 
> Add two new files, 'state_hashed' and 'transactions_hashed', that
> reproduce the information in the original files but use the kernel's
> raw pointer obfuscation to hash any potential user addresses. This
> approach allows systems to grant broader access to the new files
> without having to change the security policy around the existing ones.
> 
> In practice, userspace populates these fields with user addresses, but
> within the driver, these values only serve as unique identifiers for
> their associated binder objects. Consequently, binder logs can
> obfuscate these values and still retain meaning. While this strategy
> prevents leaking information about the userspace memory layout in the
> existing log files, it also decouples log messages about binder
> objects from their user-defined identifiers.
> 
> Use the kernel's raw pointer obfuscation to hash these values before
> they are output to the existing binder seq_files. Additionally, create
> a new binder log file, 'ptr_translations', to allow privileged users
> to access the map between the original values and their hashes.

Likely this last ptr_translation thing was leftover from a previous
version? If so, please drop on next version.

> 
> Signed-off-by: Tiffany Y. Yang <ynaffit@google.com>
> ---
>  drivers/android/binder.c | 103 +++++++++++++++++++++++++++++----------
>  1 file changed, 77 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index d963a7860aa3..a9e433ad12a7 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -6380,7 +6380,7 @@ static void print_binder_work_ilocked(struct seq_file *m,
>  				      struct binder_proc *proc,
>  				      const char *prefix,
>  				      const char *transaction_prefix,
> -				      struct binder_work *w)
> +				      struct binder_work *w, bool hash_ptrs)
>  {
>  	struct binder_node *node;
>  	struct binder_transaction *t;
> @@ -6403,9 +6403,14 @@ static void print_binder_work_ilocked(struct seq_file *m,
>  		break;
>  	case BINDER_WORK_NODE:
>  		node = container_of(w, struct binder_node, work);
> -		seq_printf(m, "%snode work %d: u%016llx c%016llx\n",
> +		if (hash_ptrs)
> +			seq_printf(m, "%snode work %d: u%p c%p\n",
>  			   prefix, node->debug_id,
> -			   (u64)node->ptr, (u64)node->cookie);
> +			   (void *)node->ptr, (void *)node->cookie);
> +		else
> +			seq_printf(m, "%snode work %d: u%016llx c%016llx\n",
> +				   prefix, node->debug_id,
> +				   (u64)node->ptr, (u64)node->cookie);
>  		break;
>  	case BINDER_WORK_DEAD_BINDER:
>  		seq_printf(m, "%shas dead binder\n", prefix);
> @@ -6430,7 +6435,7 @@ static void print_binder_work_ilocked(struct seq_file *m,
>  
>  static void print_binder_thread_ilocked(struct seq_file *m,
>  					struct binder_thread *thread,
> -					bool print_always)
> +					bool print_always, bool hash_ptrs)
>  {
>  	struct binder_transaction *t;
>  	struct binder_work *w;
> @@ -6460,14 +6465,16 @@ static void print_binder_thread_ilocked(struct seq_file *m,
>  	}
>  	list_for_each_entry(w, &thread->todo, entry) {
>  		print_binder_work_ilocked(m, thread->proc, "    ",
> -					  "    pending transaction", w);
> +					  "    pending transaction",
> +					  w, hash_ptrs);
>  	}
>  	if (!print_always && m->count == header_pos)
>  		m->count = start_pos;
>  }
>  
>  static void print_binder_node_nilocked(struct seq_file *m,
> -				       struct binder_node *node)
> +				       struct binder_node *node,
> +				       bool hash_ptrs)
>  {
>  	struct binder_ref *ref;
>  	struct binder_work *w;
> @@ -6475,8 +6482,13 @@ static void print_binder_node_nilocked(struct seq_file *m,
>  
>  	count = hlist_count_nodes(&node->refs);
>  
> -	seq_printf(m, "  node %d: u%016llx c%016llx hs %d hw %d ls %d lw %d is %d iw %d tr %d",
> -		   node->debug_id, (u64)node->ptr, (u64)node->cookie,
> +	if (hash_ptrs)
> +		seq_printf(m, "  node %d: u%p c%p", node->debug_id,
> +			   (void *)node->ptr, (void *)node->cookie);
> +	else
> +		seq_printf(m, "  node %d: u%016llx c%016llx", node->debug_id,
> +			   (u64)node->ptr, (u64)node->cookie);
> +	seq_printf(m, " hs %d hw %d ls %d lw %d is %d iw %d tr %d",
>  		   node->has_strong_ref, node->has_weak_ref,
>  		   node->local_strong_refs, node->local_weak_refs,
>  		   node->internal_strong_refs, count, node->tmp_refs);
> @@ -6489,7 +6501,8 @@ static void print_binder_node_nilocked(struct seq_file *m,
>  	if (node->proc) {
>  		list_for_each_entry(w, &node->async_todo, entry)
>  			print_binder_work_ilocked(m, node->proc, "    ",
> -					  "    pending async transaction", w);
> +					  "    pending async transaction",
> +					  w, hash_ptrs);
>  	}
>  }
>  
> @@ -6510,6 +6523,7 @@ static void print_binder_ref_olocked(struct seq_file *m,
>   * @m:          struct seq_file for output via seq_printf()
>   * @node:       struct binder_node to print fields of
>   * @prev_node:	struct binder_node we hold a temporary reference to (if any)
> + * @hash_ptrs:  whether to hash @node's binder_uintptr_t fields
>   *
>   * Helper function to handle synchronization around printing a struct
>   * binder_node while iterating through @node->proc->nodes or the dead nodes
> @@ -6520,7 +6534,7 @@ static void print_binder_ref_olocked(struct seq_file *m,
>   */
>  static struct binder_node *
>  print_next_binder_node_ilocked(struct seq_file *m, struct binder_node *node,
> -			       struct binder_node *prev_node)
> +			       struct binder_node *prev_node, bool hash_ptrs)
>  {
>  	/*
>  	 * Take a temporary reference on the node so that isn't removed from
> @@ -6538,7 +6552,7 @@ print_next_binder_node_ilocked(struct seq_file *m, struct binder_node *node,
>  	if (prev_node)
>  		binder_put_node(prev_node);
>  	binder_node_inner_lock(node);
> -	print_binder_node_nilocked(m, node);
> +	print_binder_node_nilocked(m, node, hash_ptrs);
>  	binder_node_inner_unlock(node);
>  	if (node->proc)
>  		binder_inner_proc_lock(node->proc);
> @@ -6548,7 +6562,7 @@ print_next_binder_node_ilocked(struct seq_file *m, struct binder_node *node,
>  }
>  
>  static void print_binder_proc(struct seq_file *m, struct binder_proc *proc,
> -			      bool print_all)
> +			      bool print_all, bool hash_ptrs)
>  {
>  	struct binder_work *w;
>  	struct rb_node *n;
> @@ -6563,7 +6577,7 @@ static void print_binder_proc(struct seq_file *m, struct binder_proc *proc,
>  	binder_inner_proc_lock(proc);
>  	for (n = rb_first(&proc->threads); n; n = rb_next(n))
>  		print_binder_thread_ilocked(m, rb_entry(n, struct binder_thread,
> -						rb_node), print_all);
> +						rb_node), print_all, hash_ptrs);
>  
>  	for (n = rb_first(&proc->nodes); n; n = rb_next(n)) {
>  		struct binder_node *node = rb_entry(n, struct binder_node,
> @@ -6571,7 +6585,8 @@ static void print_binder_proc(struct seq_file *m, struct binder_proc *proc,
>  		if (!print_all && !node->has_async_transaction)
>  			continue;
>  
> -		last_node = print_next_binder_node_ilocked(m, node, last_node);
> +		last_node = print_next_binder_node_ilocked(m, node, last_node,
> +							   hash_ptrs);
>  	}
>  	binder_inner_proc_unlock(proc);
>  	if (last_node)
> @@ -6589,7 +6604,8 @@ static void print_binder_proc(struct seq_file *m, struct binder_proc *proc,
>  	binder_inner_proc_lock(proc);
>  	list_for_each_entry(w, &proc->todo, entry)
>  		print_binder_work_ilocked(m, proc, "  ",
> -					  "  pending transaction", w);
> +					  "  pending transaction", w,
> +					  hash_ptrs);
>  	list_for_each_entry(w, &proc->delivered_death, entry) {
>  		seq_puts(m, "  has delivered dead binder\n");
>  		break;
> @@ -6771,7 +6787,7 @@ static void print_binder_proc_stats(struct seq_file *m,
>  	print_binder_stats(m, "  ", &proc->stats);
>  }
>  
> -static int state_show(struct seq_file *m, void *unused)
> +static void print_binder_state(struct seq_file *m, bool hash_ptrs)
>  {
>  	struct binder_proc *proc;
>  	struct binder_node *node;
> @@ -6783,16 +6799,38 @@ static int state_show(struct seq_file *m, void *unused)
>  	if (!hlist_empty(&binder_dead_nodes))
>  		seq_puts(m, "dead nodes:\n");
>  	hlist_for_each_entry(node, &binder_dead_nodes, dead_node)
> -		last_node = print_next_binder_node_ilocked(m, node, last_node);
> +		last_node = print_next_binder_node_ilocked(m, node, last_node,
> +							   hash_ptrs);
>  	spin_unlock(&binder_dead_nodes_lock);
>  	if (last_node)
>  		binder_put_node(last_node);
>  
>  	mutex_lock(&binder_procs_lock);
>  	hlist_for_each_entry(proc, &binder_procs, proc_node)
> -		print_binder_proc(m, proc, true);
> +		print_binder_proc(m, proc, true, hash_ptrs);
>  	mutex_unlock(&binder_procs_lock);
> +}
> +
> +static void print_binder_transactions(struct seq_file *m, bool hash_ptrs)
> +{
> +	struct binder_proc *proc;
> +
> +	seq_puts(m, "binder transactions:\n");
> +	mutex_lock(&binder_procs_lock);
> +	hlist_for_each_entry(proc, &binder_procs, proc_node)
> +		print_binder_proc(m, proc, false, hash_ptrs);
> +	mutex_unlock(&binder_procs_lock);
> +}
> +
> +static int state_show(struct seq_file *m, void *unused)
> +{
> +	print_binder_state(m, false);
> +	return 0;
> +}
>  
> +static int state_hashed_show(struct seq_file *m, void *unused)
> +{
> +	print_binder_state(m, true);
>  	return 0;
>  }
>  
> @@ -6814,14 +6852,13 @@ static int stats_show(struct seq_file *m, void *unused)
>  
>  static int transactions_show(struct seq_file *m, void *unused)
>  {
> -	struct binder_proc *proc;
> -
> -	seq_puts(m, "binder transactions:\n");
> -	mutex_lock(&binder_procs_lock);
> -	hlist_for_each_entry(proc, &binder_procs, proc_node)
> -		print_binder_proc(m, proc, false);
> -	mutex_unlock(&binder_procs_lock);
> +	print_binder_transactions(m, false);
> +	return 0;
> +}
>  
> +static int transactions_hashed_show(struct seq_file *m, void *unused)
> +{
> +	print_binder_transactions(m, true);
>  	return 0;
>  }
>  
> @@ -6834,7 +6871,7 @@ static int proc_show(struct seq_file *m, void *unused)
>  	hlist_for_each_entry(itr, &binder_procs, proc_node) {
>  		if (itr->pid == pid) {
>  			seq_puts(m, "binder proc state:\n");
> -			print_binder_proc(m, itr, true);
> +			print_binder_proc(m, itr, true, false);
>  		}
>  	}
>  	mutex_unlock(&binder_procs_lock);
> @@ -6901,8 +6938,10 @@ const struct file_operations binder_fops = {
>  };
>  
>  DEFINE_SHOW_ATTRIBUTE(state);
> +DEFINE_SHOW_ATTRIBUTE(state_hashed);
>  DEFINE_SHOW_ATTRIBUTE(stats);
>  DEFINE_SHOW_ATTRIBUTE(transactions);
> +DEFINE_SHOW_ATTRIBUTE(transactions_hashed);
>  DEFINE_SHOW_ATTRIBUTE(transaction_log);
>  
>  const struct binder_debugfs_entry binder_debugfs_entries[] = {
> @@ -6912,6 +6951,12 @@ const struct binder_debugfs_entry binder_debugfs_entries[] = {
>  		.fops = &state_fops,
>  		.data = NULL,
>  	},
> +	{
> +		.name = "state_hashed",
> +		.mode = 0444,
> +		.fops = &state_hashed_fops,
> +		.data = NULL,
> +	},
>  	{
>  		.name = "stats",
>  		.mode = 0444,
> @@ -6924,6 +6969,12 @@ const struct binder_debugfs_entry binder_debugfs_entries[] = {
>  		.fops = &transactions_fops,
>  		.data = NULL,
>  	},
> +	{
> +		.name = "transactions_hashed",
> +		.mode = 0444,
> +		.fops = &transactions_hashed_fops,
> +		.data = NULL,
> +	},
>  	{
>  		.name = "transaction_log",
>  		.mode = 0444,
> -- 
> 2.49.0.395.g12beb8f557-goog
> 

Other than minor nit, feel free to add:

Acked-by: Carlos Llamas <cmllamas@google.com>

Regards,
--
Carlos Llamas
