Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA98132117
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 02:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743388709; cv=none; b=eteZ1ZdSGlK9xatZMAy1MT23mwGnDNiYVv3HMENAHQvCU9nCYaO3QPYFfnCIzaGf4uzUsWG/qxVTageB5TAWuz16euGp14NDyQ205e73dvfBbMOMPUMfvg85ebuiL9gZByio81Di7+wu/otkse9Sy3x3jS0gtw0FdDglzGPqJ6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743388709; c=relaxed/simple;
	bh=kPoAxxxTiRT5+MBN0F1WxtMWBiflIm2ZOI+uMysaA3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c9uRLSXLL3XrJ6zqUnaVKFmZ9UVEuipYJYN5ckIYpHL47kBxLfM352PFUS6lUS/o9buUZ8hLHaHH06tA5Kob8YmXFVVY+EVHHRO+lymdhVb013ONrkPr/0AJRDfvGEhuFd8WPCh6els4Zqo5rYf/CnbzBAb0S26kmlyj/K57jms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=mqhwXO/q; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="mqhwXO/q"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1743388703; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=m+t0zh/r59QNdGb12b76vwfxj7WeH46XCXDtQa2X+p4=;
	b=mqhwXO/qBM0D1gALObBeAAeMO2MhXjBpjuM44So25jH+1B7MzCaaBruYJ5FHNcg9XHgco56G8jFBKLI1j4dByO3E/x8vDp5bSdkoY6ox9fzue3BwDw/yAlzKEuDzzhXmSbQKTOFYZvNPDK2QR+7Iksl5td04i7hFYsFFcxBAYQU=
Received: from 30.221.130.198(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WTOlX-D_1743388702 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 31 Mar 2025 10:38:22 +0800
Message-ID: <45548d9e-4cfa-476d-9eaa-b338f994478c@linux.alibaba.com>
Date: Mon, 31 Mar 2025 10:38:21 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
To: Sandeep Dhavale <dhavale@google.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-erofs mailing list <linux-erofs@lists.ozlabs.org>,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>
References: <20250331022011.645533-1-dhavale@google.com>
 <20250331022011.645533-2-dhavale@google.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250331022011.645533-2-dhavale@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sandeep,

On 2025/3/31 10:20, Sandeep Dhavale wrote:
> Defer initialization of per-CPU workers and registration for CPU hotplug
> events until the first mount. Similarly, unregister from hotplug events
> and destroy per-CPU workers when the last mount is unmounted.
> 
> Signed-off-by: Sandeep Dhavale <dhavale@google.com>
> ---
>   fs/erofs/internal.h |  5 +++++
>   fs/erofs/super.c    | 27 +++++++++++++++++++++++++++
>   fs/erofs/zdata.c    | 35 +++++++++++++++++++++++------------
>   3 files changed, 55 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
> index 4ac188d5d894..c88cba4da3eb 100644
> --- a/fs/erofs/internal.h
> +++ b/fs/erofs/internal.h
> @@ -450,6 +450,8 @@ int z_erofs_gbuf_growsize(unsigned int nrpages);
>   int __init z_erofs_gbuf_init(void);
>   void z_erofs_gbuf_exit(void);
>   int z_erofs_parse_cfgs(struct super_block *sb, struct erofs_super_block *dsb);
> +int z_erofs_init_workers(void);
> +void z_erofs_destroy_workers(void);
>   #else
>   static inline void erofs_shrinker_register(struct super_block *sb) {}
>   static inline void erofs_shrinker_unregister(struct super_block *sb) {}
> @@ -458,6 +460,9 @@ static inline void erofs_exit_shrinker(void) {}
>   static inline int z_erofs_init_subsystem(void) { return 0; }
>   static inline void z_erofs_exit_subsystem(void) {}
>   static inline int z_erofs_init_super(struct super_block *sb) { return 0; }
> +static inline int z_erofs_init_workers(void) { return 0; };
> +static inline  z_erofs_exit_workers(void);
> +
>   #endif	/* !CONFIG_EROFS_FS_ZIP */
>   
>   #ifdef CONFIG_EROFS_FS_BACKED_BY_FILE
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index cadec6b1b554..8e8d3a7c8dba 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -17,6 +17,7 @@
>   #include <trace/events/erofs.h>
>   
>   static struct kmem_cache *erofs_inode_cachep __read_mostly;
> +static atomic_t erofs_mount_count = ATOMIC_INIT(0);
>   
>   void _erofs_printk(struct super_block *sb, const char *fmt, ...)
>   {
> @@ -777,9 +778,28 @@ static const struct fs_context_operations erofs_context_ops = {
>   	.free		= erofs_fc_free,
>   };
>   
> +static inline int erofs_init_zip_workers_if_needed(void)
> +{
> +	int ret;
> +
> +	if (atomic_inc_return(&erofs_mount_count) == 1) {
> +		ret = z_erofs_init_workers();
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
> +static inline void erofs_destroy_zip_workers_if_last(void)

Do we really need to destroy workers on the last mount?
it could cause many unnecessary init/uninit cycles.

Or your requirement is just to defer per-CPU workers to
the first mount?

If your case is the latter, I guess you could just call
erofs_init_percpu_workers() in z_erofs_init_super().

> +{
> +	if (atomic_dec_and_test(&erofs_mount_count))

So in that case, we won't need erofs_mount_count anymore,
you could just add a pcpu_worker_initialized atomic bool
to control that.

Thanks,
Gao Xiang
