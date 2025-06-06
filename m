Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A321E8854
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749194435; cv=none; b=Kc/7QjOkFWvkYdZqHfEkRWTSC3Tn3l9uF+FM8vPmmpaXV7X9XBoiJX90I7WiCCXynMGnM5/kP+LOTNO6H6SiLhy0zz0NugwKE8CdmTxP0GOEurnIBRP2AbpFA4qXYWhrs5rP9Ft6+ITmNURjXCcJdGRnbNBTCxBzDCeR0/76lYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749194435; c=relaxed/simple;
	bh=TS2/RBxdXWTSr7d34M4oa+rI3fYA1I3VcClmb+zdC8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rnenXgRW40XdZgdhJ8p0hks2TkAlIdHG1XPw7+0wGLpGNs6yqZ+wL0PXIpsppYW0Qi3IhgGsRheGxGkJJhrQD2m7/+8hvSUsZPQEgfngHJT2e6i5y8uu/Q+gM85qURUDDJkQ2QOodn7t5p/xys+3qWBsKJsArH2kGCWz24OmIJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dFRfQj8s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dFRfQj8s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749194432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+Kg/pGgbCZY0p2MdowJKiMYqtmP+0g3HBKjir8OK9HY=;
	b=dFRfQj8s9lR4jhJ3QGzyhpCq1yZChmyxCXn0EkpvMaJX5G6ULde0QZE1hTvM86/SHYxVkj
	hrztQTdn9kHVyLzOiPzxNNhWsEPDQqdclm+TZIGaI+jWxhLHtJqp9aEoVZhk9qxQDk3wo+
	r02Xfcvd2Tk62dsgRX3ewETBkW/weg8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-iB8m961IO86nDg6HJQA7xA-1; Fri, 06 Jun 2025 03:20:31 -0400
X-MC-Unique: iB8m961IO86nDg6HJQA7xA-1
X-Mimecast-MFC-AGG-ID: iB8m961IO86nDg6HJQA7xA_1749194430
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39ee4b91d1cso1436679f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 00:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749194430; x=1749799230;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+Kg/pGgbCZY0p2MdowJKiMYqtmP+0g3HBKjir8OK9HY=;
        b=v2bsDRxHt8EhGtNWeMzWRdk2ImL7imteS0ZEIomINkFMCorN9T2xSLjAR3AxtehCtE
         9qvhZndCxmvOXWWQie7jzWKiB4Hi/pO3VDV7hNfXrZCN27unC2jANnlhQdZH4JT9k9lq
         qg6RPvbj7+eKe+M9TzwsAOM4gbAS7k5uBKh+myCfYU7xb4Hze4fEgMbYIIXB54Hm/GbR
         xxx/UTfRcJ9/fG3v9gIYYcFryETxmTWZNQPjvvn7TWlr0733tG4LRAYs1ifDmqI9sMbp
         eVmKLjhFbNHKEDSSh2/PuUHy9wRvWeKDbB2jhAp7jWEKAZjDFzuxh5J+TMiZTG8ZbN0b
         KXeg==
X-Forwarded-Encrypted: i=1; AJvYcCX5DzrJ17Eyywf0J8mrvnA9R6Yzn+Xf8/MsoOtWioBTB2PXtfzuCXqOK89Pze9x+SJDTMUaxJmQiEGPSf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzizfDJvtm8Aa6UDcpCAAnvNU7DZP9AHa7bgbHZvkk+PlVV2YPL
	G7eTwb00c/Pdh0w+GKLD49tOutgTjFiSmPNxOacnZNj0W+QSK+D9MJXXOUCOVyXAqDtPkYeSmyD
	gyQXY5XYLLborOtG+CWysTpMxY3GHFHC+SjDT7JKUW2YefDtHvbIrXUwhTy+UB4lkBA==
X-Gm-Gg: ASbGncte8y+yVoOsMbV3MuOnGuaMkjGjmzOwr+8JwirnMpCXamr75Fj/HZgfOujBwRr
	NyDfpJI+BQhXKjIzNd+2KmJNiJgyX6jRCF1H8kBDuyUuM2z2ks469dD1eqcn0kigwIRE4/yWTn9
	p43ZyCG272tvplP1wjJ6imTweTCRVzZmctmyf4LE3/Eq+ioXuMToj0PlJo+N1cnPkeFU1uAR+Iy
	5Nbuai5mJUr2j1n2BsIlhRMHjkv5/dvJtiOGy6dEANMaYOC8bPhGXOwv/SemeegmlL6r+7hyBjF
	GuEIOV3levD5f1YYJfEQ8BPg02UCUIcY7q7kUj8wiVw=
X-Received: by 2002:a05:6000:400c:b0:3a5:23c6:eeee with SMTP id ffacd0b85a97d-3a531434352mr2024365f8f.21.1749194430308;
        Fri, 06 Jun 2025 00:20:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5k/AquggtuchaIssI2veVvLixuf65PQwvbysEAdp918AAJ2mzqX4NeQCbMnkEe69PujO9Dg==
X-Received: by 2002:a05:6000:400c:b0:3a5:23c6:eeee with SMTP id ffacd0b85a97d-3a531434352mr2024335f8f.21.1749194429851;
        Fri, 06 Jun 2025 00:20:29 -0700 (PDT)
Received: from [192.168.3.141] (p57a1a6a5.dip0.t-ipconnect.de. [87.161.166.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5322ae43fsm1054006f8f.25.2025.06.06.00.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 00:20:29 -0700 (PDT)
Message-ID: <0030581f-d50a-48f4-86f5-58e7883f705d@redhat.com>
Date: Fri, 6 Jun 2025 09:20:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] PM: Optionally block user fork during freeze to
 improve performance
To: Zihuan Zhang <zhangzihuan@kylinos.cn>, rafael@kernel.org,
 len.brown@intel.com, pavel@kernel.org, kees@kernel.org, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, akpm@linux-foundation.org,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250606062502.19607-1-zhangzihuan@kylinos.cn>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250606062502.19607-1-zhangzihuan@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06.06.25 08:25, Zihuan Zhang wrote:
> Currently, the freezer traverses all tasks to freeze them during
> system suspend or hibernation. If a user process forks during this
> window, the new child may escape freezing and require a second
> traversal or retry, adding non-trivial overhead.
> 
> This patch introduces a CONFIG_PM_DISABLE_USER_FORK_DURING_FREEZE

Not sure if a Kconfig is really the right choice here ...

> option. When enabled, it prevents user processes from creating new
> processes (via fork/clone) during the freezing period. This guarantees
> a stable task list and avoids re-traversing the process list due to
> late-created user tasks, thereby improving performance.

Any performance numbers to back your claims?

> 
> The restriction is only active during the window when the system is
> freezing user tasks. Once all tasks are frozen, or if the system aborts
> the suspend/hibernate process, the restriction is lifted.
> No kernel threads are affected, and kernel_create_* functions remain
> unrestricted.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>   include/linux/suspend.h |  8 ++++++++
>   kernel/fork.c           |  6 ++++++
>   kernel/power/Kconfig    | 10 ++++++++++
>   kernel/power/main.c     | 44 +++++++++++++++++++++++++++++++++++++++++
>   kernel/power/power.h    |  4 ++++
>   kernel/power/process.c  |  7 +++++++
>   6 files changed, 79 insertions(+)
> 
> diff --git a/include/linux/suspend.h b/include/linux/suspend.h
> index b1c76c8f2c82..2dd8b3eb50f0 100644
> --- a/include/linux/suspend.h
> +++ b/include/linux/suspend.h
> @@ -591,4 +591,12 @@ enum suspend_stat_step {
>   void dpm_save_failed_dev(const char *name);
>   void dpm_save_failed_step(enum suspend_stat_step step);
>   
> +#ifdef CONFIG_PM_DISABLE_USER_FORK_DURING_FREEZE
> +extern bool pm_block_user_fork;
> +bool pm_should_block_fork(void);
> +bool pm_freeze_process_in_progress(void);
> +#else
> +static inline bool pm_should_block_fork(void) { return false; };
> +static inline bool pm_freeze_process_in_progress(void) { return false; };
> +#endif /* CONFIG_PM_DISABLE_USER_FORK_DURING_FREEZE */
>   #endif /* _LINUX_SUSPEND_H */
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 1ee8eb11f38b..b0bd0206b644 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -105,6 +105,7 @@
>   #include <uapi/linux/pidfd.h>
>   #include <linux/pidfs.h>
>   #include <linux/tick.h>
> +#include <linux/suspend.h>
>   
>   #include <asm/pgalloc.h>
>   #include <linux/uaccess.h>
> @@ -2596,6 +2597,11 @@ pid_t kernel_clone(struct kernel_clone_args *args)
>   			trace = 0;
>   	}
>   
> +#ifdef CONFIG_PM_DISABLE_USER_FORK_DURING_FREEZE
> +	if (pm_should_block_fork() && !(current->flags & PF_KTHREAD))
> +		return -EBUSY;
> +#endif

fork() is not documented to return EBUSY and for clone3() it's 
documented to only happen in specific cases.

So user space is not prepared for that.

-- 
Cheers,

David / dhildenb

