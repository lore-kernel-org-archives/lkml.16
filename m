Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8C114B950
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744766541; cv=none; b=F5pHGcSysGgqaHZAcxnbJy18xEh6f9giNOp0Fu9mo3YVe1KtKdbHlEShpK+cIEGbGeBDk00DQ5aX2/T0Ihh7XfH2XrXBtnJkEzmU+7eps+CiO4zvWjkkD+3nGF6ml4kCfZT7MOAHnWcy87ZrYImh9Ac5SeDklpvq51A2tKl8TB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744766541; c=relaxed/simple;
	bh=AMWQxp2pL96fP/AbKLFV7G4sCV0QYAkLQfIyL+jVfW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LsQAMIXVAtFuffQ3uoMHCqI+CcZLeY7O8JLUsE2sCi9OgXVd8oPV5+V5uDV/pR38q9uNLysh9SezCKU30mIzvSkcuWTA2fqOSzj2FAi6Shv6bZD+f+elPGAzAr1S7m1jiNnaSIRfalnajQuHsL9uGw8/JGJwaNtfxyLyaOZrIo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=gouRYW3e; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="gouRYW3e"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744766528; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=S+gSHUgnZJkpNQEKAUzU8Rgqjm+4Add/shFYdufCnCM=;
	b=gouRYW3eaLXC6zT/J8d2R70PHTbSH4jnu0djuAqRju4bWHIQI1b760BJ0swypvKWNUQ1P57y0a/rKehZxtx3N/m2cPX1oFPQLIFCnhXX9Ct39CRUmMie+1gDlbQViUyOz/9qaEQkh9ad0JBbKDlDCFYOh5ZIxcA5E7u/P9Ptiz4=
Received: from 30.134.100.0(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WX6j.0Y_1744766526 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 16 Apr 2025 09:22:07 +0800
Message-ID: <a1e86463-3427-4715-a4a2-0ef88cca6135@linux.alibaba.com>
Date: Wed, 16 Apr 2025 09:22:06 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
To: Sandeep Dhavale <dhavale@google.com>, linux-erofs@lists.ozlabs.org,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org
References: <20250402202728.2157627-1-dhavale@google.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250402202728.2157627-1-dhavale@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 2025/4/3 04:27, Sandeep Dhavale wrote:
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
> v1: https://lore.kernel.org/linux-erofs/20250331022011.645533-2-dhavale@google.com/
> Changes since v1:
> - Get rid of erofs_mount_count based init and tear down of resources
> - Initialize resource in z_erofs_init_super() as suggested by Gao
> - Introduce z_erofs_init_workers_once() and track it using atomic bool
> - Improve commit message
> 
>   fs/erofs/internal.h |  2 ++
>   fs/erofs/zdata.c    | 57 ++++++++++++++++++++++++++++++++++-----------
>   2 files changed, 46 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
> index 4ac188d5d894..bbc92ee41846 100644
> --- a/fs/erofs/internal.h
> +++ b/fs/erofs/internal.h
> @@ -450,6 +450,7 @@ int z_erofs_gbuf_growsize(unsigned int nrpages);
>   int __init z_erofs_gbuf_init(void);
>   void z_erofs_gbuf_exit(void);
>   int z_erofs_parse_cfgs(struct super_block *sb, struct erofs_super_block *dsb);
> +int z_erofs_init_workers_once(void);
>   #else
>   static inline void erofs_shrinker_register(struct super_block *sb) {}
>   static inline void erofs_shrinker_unregister(struct super_block *sb) {}
> @@ -458,6 +459,7 @@ static inline void erofs_exit_shrinker(void) {}
>   static inline int z_erofs_init_subsystem(void) { return 0; }
>   static inline void z_erofs_exit_subsystem(void) {}
>   static inline int z_erofs_init_super(struct super_block *sb) { return 0; }
> +static inline int z_erofs_init_workers_once(void) { return 0; };

Why we need this? I think it's unused if decompression
subsystem is disabled.

>   #endif	/* !CONFIG_EROFS_FS_ZIP */
>   
>   #ifdef CONFIG_EROFS_FS_BACKED_BY_FILE
> diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
> index 0671184d9cf1..75f0adcff97b 100644
> --- a/fs/erofs/zdata.c
> +++ b/fs/erofs/zdata.c
> @@ -11,6 +11,7 @@
>   
>   #define Z_EROFS_PCLUSTER_MAX_PAGES	(Z_EROFS_PCLUSTER_MAX_SIZE / PAGE_SIZE)
>   #define Z_EROFS_INLINE_BVECS		2
> +static atomic_t erofs_percpu_workers_initialized = ATOMIC_INIT(0);
>   
>   struct z_erofs_bvec {
>   	struct page *page;
> @@ -403,10 +404,44 @@ static inline int erofs_cpu_hotplug_init(void) { return 0; }
>   static inline void erofs_cpu_hotplug_destroy(void) {}

I wonder those helpers are still needed since we have
z_erofs_init_pcpu_workers().

>   #endif
>   
> -void z_erofs_exit_subsystem(void)
> +static int z_erofs_init_workers(void)

I think we need to rename it as
`static int z_erofs_init_pcpu_workers(void)`

>   {
> -	erofs_cpu_hotplug_destroy();
> +	int err;
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
>   	erofs_destroy_percpu_workers();
> +err_init_percpu_workers:
> +	atomic_set(&erofs_percpu_workers_initialized, 0);
> +	return err;
> +}
> +
> +int z_erofs_init_workers_once(void)

I'd like to inline them into z_erofs_init_super().

> +{
> +	if (atomic_xchg(&erofs_percpu_workers_initialized, 1))
> +		return 0;
> +	return z_erofs_init_workers();
> +}
> +
> +static void z_erofs_destroy_workers(void)

z_erofs_destroy_pcpu_workers()

> +{
> +	if (atomic_xchg(&erofs_percpu_workers_initialized, 0)) {

	if (atomic_xchg(&erofs_percpu_workers_initialized, 0))
		return;

> +		erofs_cpu_hotplug_destroy();
> +		erofs_destroy_percpu_workers();
> +	}
> +}
> +
> +void z_erofs_exit_subsystem(void)
> +{
> +	z_erofs_destroy_workers();
>   	destroy_workqueue(z_erofs_workqueue);
>   	z_erofs_destroy_pcluster_pool();
>   	z_erofs_exit_decompressor();
> @@ -430,19 +465,8 @@ int __init z_erofs_init_subsystem(void)
>   		goto err_workqueue_init;
>   	}
>   
> -	err = erofs_init_percpu_workers();
> -	if (err)
> -		goto err_pcpu_worker;
> -
> -	err = erofs_cpu_hotplug_init();
> -	if (err < 0)
> -		goto err_cpuhp_init;
>   	return err;
>   
> -err_cpuhp_init:
> -	erofs_destroy_percpu_workers();
> -err_pcpu_worker:
> -	destroy_workqueue(z_erofs_workqueue);
>   err_workqueue_init:
>   	z_erofs_destroy_pcluster_pool();
>   err_pcluster_pool:
> @@ -645,6 +669,13 @@ static const struct address_space_operations z_erofs_cache_aops = {
>   int z_erofs_init_super(struct super_block *sb)
>   {
>   	struct inode *const inode = new_inode(sb);
> +	int err;

	struct inode *inode;
	int err;

	err = z_erofs_init_workers_once();
	if (err)
		return err;
	inode = new_inode(sb);
	...

> +
> +	err = z_erofs_init_workers_once();
> +	if (err) {
> +		iput(inode);

To avoid such unnecessary iput() here...

Thanks,
Gao Xiang
