Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E8B158218;
	Sun, 20 Apr 2025 21:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745183279; cv=none; b=oYf91fwFLE7RiXZ5jZxRMS659V16s7IRUdBrNN23utMCIUL4oOwSi9TsTrMlFq9Mbrvlh2aQeWpzwTfBjWLa8pgGcJzON+qBjiX4Gzsjg07SqL3HgAjVkhJgSt/b15qEevlg1bTdQ3A8M8RXVUB4Zb790/jqnasUjFJaVUR915Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745183279; c=relaxed/simple;
	bh=jnfN/yETuQM9TPVDOvaU8IS8oqMugDy5Wob05rlDJ8M=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CFpzDVJYFycu6ifWp7Bf5CxE1fGFrAdD88sWIJLv0yauN8+pveVC3WYGKWP2/iK5fUjSMyrxx+xUD5eZTfdd6zyJZnXYD60DTTyiqVD0QZ+lTm7IHpRYzV+FPtHSjzPmn/S1mr3JbEy4syPrxswl1w3OmXBQZhNUCHTp+UJDYFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GQBSdIzd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GQBSdIzd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7B2C4CEE2;
	Sun, 20 Apr 2025 21:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745183279;
	bh=jnfN/yETuQM9TPVDOvaU8IS8oqMugDy5Wob05rlDJ8M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GQBSdIzd6C3GPSthGTZENs7007kCQHh2D8/03/XuOXO18Lr+SLPAJA31nxkELzDkS
	 Eo27CllHSH/La4mCfyKcillpPprUiY2ZFbG5QOfOnFdHaZBrfKekF+WOPv5FbGKJdz
	 VRfwa97Gk0CDAqr/hesNFyMMDMtHsbOxcErrKJ3Y=
Date: Sun, 20 Apr 2025 14:07:58 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: linux@treblig.org
Cc: andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
 corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] relay: Remove unused relay_late_setup_files
Message-Id: <20250420140758.601ae8abaa03aacb33ce7084@linux-foundation.org>
In-Reply-To: <20250418234932.490863-1-linux@treblig.org>
References: <20250418234932.490863-1-linux@treblig.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 19 Apr 2025 00:49:32 +0100 linux@treblig.org wrote:

> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> The last use of relay_late_setup_files() was removed in 2018
> by commit 2b47733045aa ("drm/i915/guc: Merge log relay file and channel
> creation")
> 
> Remove it and the helper it used.
> 
> relay_late_setup_files() was used for eventually registering
> 'buffer only' channels.  With it gone, delete the docs that
> explain how to do that.   Which suggests it should be possible
> to lose the 'has_base_filename' flags.
> 
> (Are there any other uses??)
> 

For some reason get_maintainer points at Al and Andy for relay.c but my
mental rolodex thinks "Axboe".

Jens, does this look OK?

> ---
>  Documentation/filesystems/relay.rst |  10 ---
>  include/linux/relay.h               |   3 -
>  kernel/relay.c                      | 111 +---------------------------
>  3 files changed, 1 insertion(+), 123 deletions(-)
> 
> diff --git a/Documentation/filesystems/relay.rst b/Documentation/filesystems/relay.rst
> index 04ad083cfe62..292ba8492aeb 100644
> --- a/Documentation/filesystems/relay.rst
> +++ b/Documentation/filesystems/relay.rst
> @@ -301,16 +301,6 @@ user-defined data with a channel, and is immediately available
>  (including in create_buf_file()) via chan->private_data or
>  buf->chan->private_data.
>  
> -Buffer-only channels
> ---------------------
> -
> -These channels have no files associated and can be created with
> -relay_open(NULL, NULL, ...). Such channels are useful in scenarios such
> -as when doing early tracing in the kernel, before the VFS is up. In these
> -cases, one may open a buffer-only channel and then call
> -relay_late_setup_files() when the kernel is ready to handle files,
> -to expose the buffered data to the userspace.
> -
>  Channel 'modes'
>  ---------------
>  
> diff --git a/include/linux/relay.h b/include/linux/relay.h
> index 72b876dd5cb8..b3224111d074 100644
> --- a/include/linux/relay.h
> +++ b/include/linux/relay.h
> @@ -159,9 +159,6 @@ struct rchan *relay_open(const char *base_filename,
>  			 size_t n_subbufs,
>  			 const struct rchan_callbacks *cb,
>  			 void *private_data);
> -extern int relay_late_setup_files(struct rchan *chan,
> -				  const char *base_filename,
> -				  struct dentry *parent);
>  extern void relay_close(struct rchan *chan);
>  extern void relay_flush(struct rchan *chan);
>  extern void relay_subbufs_consumed(struct rchan *chan,
> diff --git a/kernel/relay.c b/kernel/relay.c
> index 5ac7e711e4b6..c0c93a04d4ce 100644
> --- a/kernel/relay.c
> +++ b/kernel/relay.c
> @@ -452,7 +452,7 @@ int relay_prepare_cpu(unsigned int cpu)
>  
>  /**
>   *	relay_open - create a new relay channel
> - *	@base_filename: base name of files to create, %NULL for buffering only
> + *	@base_filename: base name of files to create
>   *	@parent: dentry of parent directory, %NULL for root directory or buffer
>   *	@subbuf_size: size of sub-buffers
>   *	@n_subbufs: number of sub-buffers
> @@ -465,10 +465,6 @@ int relay_prepare_cpu(unsigned int cpu)
>   *	attributes specified.  The created channel buffer files
>   *	will be named base_filename0...base_filenameN-1.  File
>   *	permissions will be %S_IRUSR.
> - *
> - *	If opening a buffer (@parent = NULL) that you later wish to register
> - *	in a filesystem, call relay_late_setup_files() once the @parent dentry
> - *	is available.
>   */
>  struct rchan *relay_open(const char *base_filename,
>  			 struct dentry *parent,
> @@ -540,111 +536,6 @@ struct rchan_percpu_buf_dispatcher {
>  	struct dentry *dentry;
>  };
>  
> -/* Called in atomic context. */
> -static void __relay_set_buf_dentry(void *info)
> -{
> -	struct rchan_percpu_buf_dispatcher *p = info;
> -
> -	relay_set_buf_dentry(p->buf, p->dentry);
> -}
> -
> -/**
> - *	relay_late_setup_files - triggers file creation
> - *	@chan: channel to operate on
> - *	@base_filename: base name of files to create
> - *	@parent: dentry of parent directory, %NULL for root directory
> - *
> - *	Returns 0 if successful, non-zero otherwise.
> - *
> - *	Use to setup files for a previously buffer-only channel created
> - *	by relay_open() with a NULL parent dentry.
> - *
> - *	For example, this is useful for perfomring early tracing in kernel,
> - *	before VFS is up and then exposing the early results once the dentry
> - *	is available.
> - */
> -int relay_late_setup_files(struct rchan *chan,
> -			   const char *base_filename,
> -			   struct dentry *parent)
> -{
> -	int err = 0;
> -	unsigned int i, curr_cpu;
> -	unsigned long flags;
> -	struct dentry *dentry;
> -	struct rchan_buf *buf;
> -	struct rchan_percpu_buf_dispatcher disp;
> -
> -	if (!chan || !base_filename)
> -		return -EINVAL;
> -
> -	strscpy(chan->base_filename, base_filename, NAME_MAX);
> -
> -	mutex_lock(&relay_channels_mutex);
> -	/* Is chan already set up? */
> -	if (unlikely(chan->has_base_filename)) {
> -		mutex_unlock(&relay_channels_mutex);
> -		return -EEXIST;
> -	}
> -	chan->has_base_filename = 1;
> -	chan->parent = parent;
> -
> -	if (chan->is_global) {
> -		err = -EINVAL;
> -		buf = *per_cpu_ptr(chan->buf, 0);
> -		if (!WARN_ON_ONCE(!buf)) {
> -			dentry = relay_create_buf_file(chan, buf, 0);
> -			if (dentry && !WARN_ON_ONCE(!chan->is_global)) {
> -				relay_set_buf_dentry(buf, dentry);
> -				err = 0;
> -			}
> -		}
> -		mutex_unlock(&relay_channels_mutex);
> -		return err;
> -	}
> -
> -	curr_cpu = get_cpu();
> -	/*
> -	 * The CPU hotplug notifier ran before us and created buffers with
> -	 * no files associated. So it's safe to call relay_setup_buf_file()
> -	 * on all currently online CPUs.
> -	 */
> -	for_each_online_cpu(i) {
> -		buf = *per_cpu_ptr(chan->buf, i);
> -		if (unlikely(!buf)) {
> -			WARN_ONCE(1, KERN_ERR "CPU has no buffer!\n");
> -			err = -EINVAL;
> -			break;
> -		}
> -
> -		dentry = relay_create_buf_file(chan, buf, i);
> -		if (unlikely(!dentry)) {
> -			err = -EINVAL;
> -			break;
> -		}
> -
> -		if (curr_cpu == i) {
> -			local_irq_save(flags);
> -			relay_set_buf_dentry(buf, dentry);
> -			local_irq_restore(flags);
> -		} else {
> -			disp.buf = buf;
> -			disp.dentry = dentry;
> -			smp_mb();
> -			/* relay_channels_mutex must be held, so wait. */
> -			err = smp_call_function_single(i,
> -						       __relay_set_buf_dentry,
> -						       &disp, 1);
> -		}
> -		if (unlikely(err))
> -			break;
> -	}
> -	put_cpu();
> -	mutex_unlock(&relay_channels_mutex);
> -
> -	return err;
> -}
> -EXPORT_SYMBOL_GPL(relay_late_setup_files);
> -
>  /**
>   *	relay_switch_subbuf - switch to a new sub-buffer
>   *	@buf: channel buffer
> -- 
> 2.49.0
