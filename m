Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA47742AA5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745547336; cv=none; b=dKuOeYkf39c3dBYFma6/hfGvDeMMYxX1oDb+/WUltisXazgqRLLH1DUXREPWwj7y/PpRcbg4l2RCPMCudSooEaFAnlhzaNnxMSmZV/8jfLsCSRzKgtrmpSu+HhZGNS0Bv/HFLb3cMSqsse+OakvvuZYXMutsJoIw9xVVTgw7kqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745547336; c=relaxed/simple;
	bh=c+MeKZSECjvZGJrBH9cgxMygC8mpb5MUZDEn3oLaRk4=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Rel5tcGOYoQnrIUw3715rzy5ZeEUeuHcjXAd4f0VvNavRFnvGy4IJrLJ2tpZD+KXsrG0Ydyc268VbYQWNpcSNDmhjlfjjUGMnau2K+gbnGV64n4nr6E8tp+Cq5aH9ZIGoGLfgjc94kyVauU0g8EeFmIcINglhUMgUA5yICrzeM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gKrdOTeY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gKrdOTeY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99738C4CEE3;
	Fri, 25 Apr 2025 02:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745547335;
	bh=c+MeKZSECjvZGJrBH9cgxMygC8mpb5MUZDEn3oLaRk4=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=gKrdOTeYlgJ33eACTcOzqWwCkxouez8RUD+GiyAR19KtT5qkO6AVjohyLGmEZMEOG
	 9G4kpR9O+AoQXwEBX6VzoEAzoK5cHbd7XZ72QaUhly69EKSuXMWQ1CqDD28QKgXm73
	 51DDuE0AxT2JeF1CufJpI/wX/EyeMfH91n3ELFLCTxpjd1W1yVgXK9XIr54sfsf702
	 IIbKkeCV4mPEdRWBbb+d5rGM2wakpllCbPXi6Hwj7GHRlP/RuqSQVOmegdp6dzr7kD
	 TE+8Hs/Y3ZTb3Sqca4Y5Vottmy0dLrW/+EDFMQgF0Uw/XLEpBNVEixNnIMOH1MWClT
	 sOCQ8Tj4HixgA==
Message-ID: <894ca2d3-e680-4395-9887-2b6060fc8096@kernel.org>
Date: Fri, 25 Apr 2025 10:15:31 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, hsiangkao@linux.alibaba.com, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
To: Sandeep Dhavale <dhavale@google.com>, linux-erofs@lists.ozlabs.org,
 Gao Xiang <xiang@kernel.org>, Yue Hu <zbestahu@gmail.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>
References: <20250423061023.131354-1-dhavale@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250423061023.131354-1-dhavale@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/23/25 14:10, Sandeep Dhavale wrote:
> Currently, when EROFS is built with per-CPU workers, the workers are
> started and CPU hotplug hooks are registered during module initialization.
> This leads to unnecessary worker start/stop cycles during CPU hotplug
> events, particularly on Android devices that frequently suspend and resume.
> 
> This change defers the initialization of per-CPU workers and the
> registration of CPU hotplug hooks until the first EROFS mount. This
> ensures that these resources are only allocated and managed when EROFS is
> actually in use.
> 
> The tear down of per-CPU workers and unregistration of CPU hotplug hooks
> still occurs during z_erofs_exit_subsystem(), but only if they were
> initialized.
> 
> Signed-off-by: Sandeep Dhavale <dhavale@google.com>
> ---
> v3: https://lore.kernel.org/linux-erofs/20250422234546.2932092-1-dhavale@google.com/
> Changes since v3:
> - fold z_erofs_init_pcpu_workers() in the caller and rename the caller
> 
>  fs/erofs/zdata.c | 61 +++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 45 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
> index 0671184d9cf1..647a8340c9a1 100644
> --- a/fs/erofs/zdata.c
> +++ b/fs/erofs/zdata.c
> @@ -291,6 +291,9 @@ static struct workqueue_struct *z_erofs_workqueue __read_mostly;
>  
>  #ifdef CONFIG_EROFS_FS_PCPU_KTHREAD
>  static struct kthread_worker __rcu **z_erofs_pcpu_workers;
> +static atomic_t erofs_percpu_workers_initialized = ATOMIC_INIT(0);
> +static int erofs_cpu_hotplug_init(void);
> +static void erofs_cpu_hotplug_destroy(void);
>  
>  static void erofs_destroy_percpu_workers(void)
>  {
> @@ -336,9 +339,40 @@ static int erofs_init_percpu_workers(void)
>  	}
>  	return 0;
>  }
> +
> +static int z_erofs_init_pcpu_workers(void)
> +{
> +	int err;
> +
> +	if (atomic_xchg(&erofs_percpu_workers_initialized, 1))
> +		return 0;
> +
> +	err = erofs_init_percpu_workers();
> +	if (err)
> +		goto err_init_percpu_workers;
> +
> +	err = erofs_cpu_hotplug_init();
> +	if (err < 0)
> +		goto err_cpuhp_init;
> +	return err;
> +
> +err_cpuhp_init:
> +	erofs_destroy_percpu_workers();
> +err_init_percpu_workers:
> +	atomic_set(&erofs_percpu_workers_initialized, 0);
> +	return err;
> +}

- mount #1				- mount #2
 - z_erofs_init_pcpu_workers
  - atomic_xchg(, 1)
					 - z_erofs_init_pcpu_workers
					  - atomic_xchg(, 1)
					  : return 0 since atomic variable is 1
					  it will run w/o percpu workers and hotplug
  : update atomic variable to 1
  - erofs_init_percpu_workers
  : fail
  - atomic_set(, 0)
  : update atomic variable to 0 & fail the mount

Can we add some logs to show we succeed/fail to initialize workers or
hotplugs? As for mount #2, it expects it will run w/ them, but finally
it may not. So we'd better have a simple way to know?

Thanks,

> +
> +static void z_erofs_destroy_pcpu_workers(void)
> +{
> +	if (!atomic_xchg(&erofs_percpu_workers_initialized, 0))
> +		return;
> +	erofs_cpu_hotplug_destroy();
> +	erofs_destroy_percpu_workers();
> +}
>  #else
> -static inline void erofs_destroy_percpu_workers(void) {}
> -static inline int erofs_init_percpu_workers(void) { return 0; }
> +static inline int z_erofs_init_pcpu_workers(void) { return 0; }
> +static inline void z_erofs_destroy_pcpu_workers(void) {}
>  #endif
>  
>  #if defined(CONFIG_HOTPLUG_CPU) && defined(CONFIG_EROFS_FS_PCPU_KTHREAD)
> @@ -405,8 +439,7 @@ static inline void erofs_cpu_hotplug_destroy(void) {}
>  
>  void z_erofs_exit_subsystem(void)
>  {
> -	erofs_cpu_hotplug_destroy();
> -	erofs_destroy_percpu_workers();
> +	z_erofs_destroy_pcpu_workers();
>  	destroy_workqueue(z_erofs_workqueue);
>  	z_erofs_destroy_pcluster_pool();
>  	z_erofs_exit_decompressor();
> @@ -430,19 +463,8 @@ int __init z_erofs_init_subsystem(void)
>  		goto err_workqueue_init;
>  	}
>  
> -	err = erofs_init_percpu_workers();
> -	if (err)
> -		goto err_pcpu_worker;
> -
> -	err = erofs_cpu_hotplug_init();
> -	if (err < 0)
> -		goto err_cpuhp_init;
>  	return err;
>  
> -err_cpuhp_init:
> -	erofs_destroy_percpu_workers();
> -err_pcpu_worker:
> -	destroy_workqueue(z_erofs_workqueue);
>  err_workqueue_init:
>  	z_erofs_destroy_pcluster_pool();
>  err_pcluster_pool:
> @@ -644,10 +666,17 @@ static const struct address_space_operations z_erofs_cache_aops = {
>  
>  int z_erofs_init_super(struct super_block *sb)
>  {
> -	struct inode *const inode = new_inode(sb);
> +	struct inode *inode;
> +	int err;
>  
> +	err = z_erofs_init_pcpu_workers();
> +	if (err)
> +		return err;
> +
> +	inode = new_inode(sb);
>  	if (!inode)
>  		return -ENOMEM;
> +
>  	set_nlink(inode, 1);
>  	inode->i_size = OFFSET_MAX;
>  	inode->i_mapping->a_ops = &z_erofs_cache_aops;

