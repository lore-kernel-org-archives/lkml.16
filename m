Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4F3DF58
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745380863; cv=none; b=aPkWIDP7mptMgrZZOJRfW7/CJDU0XgyWp3m9e/Ew0K6haoAEs6twB/W7TtTmkZVV1RWiazIS1OH8o/3unt8NR48ymMXvYrW2+T2A6NqQo83JxpzazN0kRPJ8WftY4DhEwC+Wf6sbQElbkt/akOSQefW+yZPmlzXNagT+okXyxwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745380863; c=relaxed/simple;
	bh=1zpcTxB5BY+F4goTrfKKU/Ro8A2FGSEg4P+XuFObdac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MHury1fAqWd3+XUi46QrnnvGIeofwpKfSPtO4fSLDayDV+oNaWkXCsdD92W3QEaXH1zycXw/u4duZjO4jBI+OtEureT/TgPRel2eg2A6oBZ7sAoGmBUVGilipa7XwGiZeAcIJux4ihF/WhyhIMnk0hDbA6+ugC07aPtQcYPLcck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=q8oZC0zN; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="q8oZC0zN"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1745380851; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=QciegOL47TkkCG+QP7o5Gjgw8odD30EiR0x2AoVa48I=;
	b=q8oZC0zN3WbQNjSySlTxiHUhl1/zAaZHTZPNHA9AmgwGjLd4u4Yv+z9kST07GmTo6J9r5iw2xy8bhiKGxi2mZ4y/ZsNm/DEVfwP7sSRqkD82EsPk8BPoXyjUXMxV7P3U6DL/QcWcSKHuUgeinXVnK6bD7RNPfpa5avMlroI4ZrE=
Received: from 30.221.131.33(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WXsrHkZ_1745380850 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 23 Apr 2025 12:00:50 +0800
Message-ID: <7a433a6f-4c35-493c-94a7-0f925ed52230@linux.alibaba.com>
Date: Wed, 23 Apr 2025 12:00:50 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
To: Sandeep Dhavale <dhavale@google.com>, linux-erofs@lists.ozlabs.org,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org
References: <20250422234546.2932092-1-dhavale@google.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250422234546.2932092-1-dhavale@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sandeep,

On 2025/4/23 07:45, Sandeep Dhavale wrote:
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
> v2: https://lore.kernel.org/linux-erofs/20250402202728.2157627-1-dhavale@google.com/
> Changes since v2:
> - Renamed functions to use pcpu so it is clear.
> - Removed z_erofs_init_workers_once() declaration from internal.h as
>    there is no need.
> - Removed empty stubs for helpers erofs_init_percpu_workers() and
>    erofs_destroy_percpu_workers().
> - Moved erofs_percpu_workers_initialized under
>    CONFIG_EROFS_FS_PCPU_KTHREAD as further cleanup.
> 
>   fs/erofs/zdata.c | 65 ++++++++++++++++++++++++++++++++++++------------
>   1 file changed, 49 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
> index 0671184d9cf1..e12df8b914b6 100644
> --- a/fs/erofs/zdata.c
> +++ b/fs/erofs/zdata.c
> @@ -291,6 +291,9 @@ static struct workqueue_struct *z_erofs_workqueue __read_mostly;
>   
>   #ifdef CONFIG_EROFS_FS_PCPU_KTHREAD
>   static struct kthread_worker __rcu **z_erofs_pcpu_workers;
> +static atomic_t erofs_percpu_workers_initialized = ATOMIC_INIT(0);
> +static int erofs_cpu_hotplug_init(void);
> +static void erofs_cpu_hotplug_destroy(void);
>   
>   static void erofs_destroy_percpu_workers(void)
>   {
> @@ -336,9 +339,44 @@ static int erofs_init_percpu_workers(void)
>   	}
>   	return 0;
>   }
> +
> +static int z_erofs_init_pcpu_workers(void)

I think you could just fold it in the caller.

> +{
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
> +	erofs_destroy_percpu_workers();
> +err_init_percpu_workers:
> +	atomic_set(&erofs_percpu_workers_initialized, 0);
> +	return err;
> +}
> +
> +static int z_erofs_init_workers_once(void)

and rename it as `z_erofs_init_pcpu_workers()` since
initializing once is just an internal implmentation.

> +{
> +	if (atomic_xchg(&erofs_percpu_workers_initialized, 1))
> +		return 0;
> +	return z_erofs_init_pcpu_workers();
> +}
> +

..

>   err_pcluster_pool:
> @@ -644,10 +670,17 @@ static const struct address_space_operations z_erofs_cache_aops = {
>   
>   int z_erofs_init_super(struct super_block *sb)
>   {
> -	struct inode *const inode = new_inode(sb);
> +	struct inode *inode;
> +	int err;
>   
> +	err = z_erofs_init_workers_once();
> +	if (err)
> +		return err;


Then just call
	err = z_erofs_init_pcpu_workers();
	if (err)
		return err;
here.


Otherwise it looks good to me.

Thanks,
Gao Xiang
