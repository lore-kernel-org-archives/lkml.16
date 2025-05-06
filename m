Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F42B28DF2A
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 03:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746502227; cv=none; b=in5FVrawaQak5PRpfxAW+xwGjM5LcrKNmI/LOFRtsHkxuFf/3bC259hlcBaW1VVZFccl91ND8zoJ6wkZoxGIg7j3Rhc6C/wvg8U3KcYYGipqvyKXuHnUHURrpQMsIyv+TaqFP6GeEloaNb5eeD8ettpoEOkebdqoxSkEx4k6MX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746502227; c=relaxed/simple;
	bh=uQ2m9taISz9kgdzKcaOZy7/AGaZmKNDvMtyrnRVo8Ek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EaEG2HI4WX6Pk3HMYCmzcOu+notbOisfOpop8yoZDGZjEwEjqrF1PQ0FNuJdqaSjeiUqr7LrCph2W3d0rc9oSTwMc0bJ0HtEydr1j7yaF+jwtPiFvh5S8cVFzMYnPV6xFj0ehQiwej5FvmLmaC2YHE8hsYTRt3OENGI66qvlWEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=WGln8P2b; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="WGln8P2b"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746502215; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=qVR8T8FmyXrwS8bihvMwLtX38nPsMBJYh/Ep2JgBEjU=;
	b=WGln8P2btndWqDmvzk/Wd109WtLZOxO1+o/6HxAjtgveEcEMzmGzfS/9jHnQLqWof+miirVxRxXMNUdKt1NcnE/ZSJYJHcZEfz4T6vJ6XeoejH033KbRlWnC9oKZQERUC+p8goop3k/PUpcUJDJSIL52JQ8d4dGv0yEyP7z2IN4=
Received: from 30.221.130.226(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WZJNpx4_1746502214 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 06 May 2025 11:30:15 +0800
Message-ID: <8de6a220-45a3-4885-890f-0538522e620c@linux.alibaba.com>
Date: Tue, 6 May 2025 11:30:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
To: Sandeep Dhavale <dhavale@google.com>, linux-erofs@lists.ozlabs.org,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org
References: <20250501183003.1125531-1-dhavale@google.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20250501183003.1125531-1-dhavale@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sandeep,

On 2025/5/2 02:30, Sandeep Dhavale wrote:
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
> v4: https://lore.kernel.org/linux-erofs/20250423061023.131354-1-dhavale@google.com/
> Changes since v4:
> - remove redundant blank line as suggested by Gao
> - add a log for failure path as suggested by Chao
> - also add success log which will help in case there was a failure
>    before, else stale failure log could cause unnecessary concern
> 
>   fs/erofs/zdata.c | 65 ++++++++++++++++++++++++++++++++++++------------
>   1 file changed, 49 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
> index 0671184d9cf1..a5d3aef319b2 100644
> --- a/fs/erofs/zdata.c
> +++ b/fs/erofs/zdata.c
> @@ -291,6 +291,9 @@ static struct workqueue_struct *z_erofs_workqueue __read_mostly;
>   
>   #ifdef CONFIG_EROFS_FS_PCPU_KTHREAD
>   static struct kthread_worker __rcu **z_erofs_pcpu_workers;
> +static atomic_t erofs_percpu_workers_initialized = ATOMIC_INIT(0);
> +static int erofs_cpu_hotplug_init(void);
> +static void erofs_cpu_hotplug_destroy(void);

We could move downwards to avoid those forward declarations;

>   
>   static void erofs_destroy_percpu_workers(void)
>   {
> @@ -336,9 +339,45 @@ static int erofs_init_percpu_workers(void)
>   	}
>   	return 0;
>   }
> +
> +static int z_erofs_init_pcpu_workers(void)

How about passing in `struct super_block *` here?
Since print messages are introduced, it's much better to
know which instance caused the error/info.

> +{
> +	int err;
> +
> +	if (atomic_xchg(&erofs_percpu_workers_initialized, 1))
> +		return 0;
> +
> +	err = erofs_init_percpu_workers();
> +	if (err) {
> +		erofs_err(NULL, "per-cpu workers: failed to allocate.");
> +		goto err_init_percpu_workers;
> +	}
> +
> +	err = erofs_cpu_hotplug_init();
> +	if (err < 0) {
> +		erofs_err(NULL, "per-cpu workers: failed CPU hotplug init.");
> +		goto err_cpuhp_init;
> +	}
> +	erofs_info(NULL, "initialized per-cpu workers successfully.");


Otherwise it looks good to me know.

Thanks,
Gao Xiang
