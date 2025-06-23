Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ED929DB7F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 17:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750700107; cv=none; b=HgTCjKf0pT1t0SVTCRJTfCum4mtcCwfIB/QC083R7ySeKwxMU2MobBl2ALYRxhijrRlJ4KXHKXF4kbKLvO8Aol6XoRXs7361qmpPIpN7kLZ1v4XGdgHFk8gQQA1tCEo6nz41XtfjCrQrjwNwIO3zfnLkSq42sqZGBmh0/Si5c60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750700107; c=relaxed/simple;
	bh=LOqVGbeo7rT7wwEOd4c46poGIVDr1wnrLY8SfnORcS8=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OWnrpmW0eXWKZvOkXKgq+FXm4QoGB5rRTI+yqCUoCGcMJ7qRfskCiBHGUX1K2nE+ZSoVqy34QBkANjBQDrTFK6x2hYmzB4sp5RXfXxXv5mH2H9Kg27Z+eTBwiQc3q+wLusORqTm5kvClcohaJh7eVHwS4w5UEgZmJcJPaR4+i3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W1Ns9KBv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W1Ns9KBv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750700104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+XKCCE8ByAcuWkMmcHnqnNYuyeiFijdRsxiQQ4L/7zk=;
	b=W1Ns9KBvCI862nh5bVRQGXzU1z9AfDHTL+rBbWaA8SHM4IwRcgcN3akbPqh8EwbkzI6uHd
	a38bcQeMruGhneLebFUf/hlhp4quZc6TbPcZJqa3KDDZyXAhlZWldfsYUmICoM6tloj1zg
	VzLswlgTJ/jtvqRQuEw5ZjbMxkKZBLI=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-MPrbiylIPLKMHknRVmL2yA-1; Mon, 23 Jun 2025 13:35:03 -0400
X-MC-Unique: MPrbiylIPLKMHknRVmL2yA-1
X-Mimecast-MFC-AGG-ID: MPrbiylIPLKMHknRVmL2yA_1750700102
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748f13ef248so3552169b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750700102; x=1751304902;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+XKCCE8ByAcuWkMmcHnqnNYuyeiFijdRsxiQQ4L/7zk=;
        b=lsvxO2tk/TWlmWljrQACx99FG+kw3p+qJTx+PnGOjDMAUYHfF+ibgqsxSKI3KcgniT
         9xOBmmbJX9YtVLh3kpD/+BDnWnLhpS9SMoJXXuYbC/eupHKdy9LPl7TmwJouLg4ggtFR
         kofFbfeu5fYdl8AhNolIHNjqbWjawsBSiCxlexk9okpe66F1NGB0oCWx8bOPgyONLfVB
         EtH9XpmpYts3R0/8NAS6OPuKf+UzUz9AsEor4pBCp+gEHNfXGcXTlWDTi93qDFgcPFBT
         DJEFDppRrcTARWCF2mHfHncqXax2UtcwePOB336RUhz7t1x2LMDyLvS7P37L5W+tuFDA
         ZGfg==
X-Forwarded-Encrypted: i=1; AJvYcCVr1dDkAuAEUstBXNGG0zEnbAtZC/a+rC6xkpbSWe4CqgOpfSLGPjYfr4/jGOKrs1+YbNzJYDBh/ZxBclc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6uV2xV9q6BoPOQztvIGVBVhhXdOxi9a4irr0SAS2QpRwLCvEj
	EHmJcU/9DU8aE1PKWIJ7UTv69mX351+tTwcSA4YF0PDvU6JvxbEhhURfuud9zQzKYGCTHpPIoL4
	0eVg9lrcV1IUDoPyVlnOzpcjySk38WzA+ZYtzHP00gLQGyGCD9g2teC+Tm8H4hHhIkuYtXCdZ4V
	Wh
X-Gm-Gg: ASbGncuuHia4cMvMDXCbmZBYZgdviI+8HWOuV9sf5St6GReswEDv6SnaNjKzfEdExL/
	yShkXDslNPLvwuc4DlgeiJFpGNui9H7lAo0d8D7IvMY0R/wGkSUn/Oj1X39bwvTzB9vHCi+j0Rp
	70sOkh5N+3MZyeSD9SEE5N+8mTa0/JkO6FRasuiceF3s3xtsd0iQ070S/VzOnvlC44XFZyCggSn
	Hze/EIJyWeWgnW5g27QWR4XRPpx182+gqb1fSBljzVNpsp+WRBfYKf3lTiW6vQErpBF5VdHiCSi
	YEeXxhWJvUPZk/qNqFMrjDpDDMX7BmSCfxo93AsEWdwUAVI7U5SID+IsKKDw7uNr1Fzr
X-Received: by 2002:a05:6a00:4b56:b0:748:3a1a:ba72 with SMTP id d2e1a72fcca58-7490d74c28dmr19935655b3a.20.1750700101668;
        Mon, 23 Jun 2025 10:35:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEd4Xr/Gmik69PP8z4NeqoH7Gizd+Vt/rPaMuz/d85B1Gq1YBjwPJRCKzQNLPLWjtpzRoTxXg==
X-Received: by 2002:a05:6a00:4b56:b0:748:3a1a:ba72 with SMTP id d2e1a72fcca58-7490d74c28dmr19935613b3a.20.1750700101274;
        Mon, 23 Jun 2025 10:35:01 -0700 (PDT)
Received: from ?IPV6:2601:600:947f:f020:85dc:d2b2:c5ee:e3c4? ([2601:600:947f:f020:85dc:d2b2:c5ee:e3c4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46b0a3sm9000566b3a.21.2025.06.23.10.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 10:35:00 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <3bf95ee2-1340-41b1-9f5c-1563f953c6eb@redhat.com>
Date: Mon, 23 Jun 2025 13:34:58 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/27] sched/isolation: Introduce housekeeping per-cpu
 rwsem
To: Frederic Weisbecker <frederic@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>,
 Marco Crivellari <marco.crivellari@suse.com>, Michal Hocko
 <mhocko@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>
References: <20250620152308.27492-1-frederic@kernel.org>
 <20250620152308.27492-3-frederic@kernel.org>
Content-Language: en-US
In-Reply-To: <20250620152308.27492-3-frederic@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/20/25 11:22 AM, Frederic Weisbecker wrote:
> The HK_TYPE_DOMAIN isolation cpumask, and further the
> HK_TYPE_KERNEL_NOISE cpumask will be made modifiable at runtime in the
> future.
>
> The affected subsystems will need to synchronize against those cpumask
> changes so that:
>
> * The reader get a coherent snapshot
> * The housekeeping subsystem can safely propagate a cpumask update to
>    the susbsytems after it has been published.
>
> Protect against readsides that can sleep with per-cpu rwsem. Updates are
> expected to be very rare given that CPU isolation is a niche usecase and
> related cpuset setup happen only in preparation work. On the other hand
> read sides can occur in more frequent paths.
>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>

Thanks for the patch series and it certainly has some good ideas. 
However I am a bit concern about the overhead of using percpu-rwsem for 
synchronization especially when the readers have to wait for the 
completion on the writer side. From my point of view, during the 
transition period when new isolated CPUs are being added or old ones 
being removed, the reader will either get the old CPU data or the new 
one depending on the exact timing. The effect the CPU selection may 
persist for a while after the end of the critical section.

Can we just rely on RCU to make sure that it either get the new one or 
the old one but nothing in between without the additional overhead?

My current thinking is to make use CPU hotplug to enable better CPU 
isolation. IOW, I would shut down the affected CPUs, change the 
housekeeping masks and then bring them back online again. That means the 
writer side will take a while to complete.

Cheers,
Longman

> ---
>   include/linux/sched/isolation.h |  7 +++++++
>   kernel/sched/isolation.c        | 12 ++++++++++++
>   kernel/sched/sched.h            |  1 +
>   3 files changed, 20 insertions(+)
>
> diff --git a/include/linux/sched/isolation.h b/include/linux/sched/isolation.h
> index f98ba0d71c52..8de4f625a5c1 100644
> --- a/include/linux/sched/isolation.h
> +++ b/include/linux/sched/isolation.h
> @@ -41,6 +41,9 @@ static inline bool housekeeping_cpu(int cpu, enum hk_type type)
>   		return true;
>   }
>   
> +extern void housekeeping_lock(void);
> +extern void housekeeping_unlock(void);
> +
>   extern void __init housekeeping_init(void);
>   
>   #else
> @@ -73,6 +76,8 @@ static inline bool housekeeping_cpu(int cpu, enum hk_type type)
>   	return true;
>   }
>   
> +static inline void housekeeping_lock(void) { }
> +static inline void housekeeping_unlock(void) { }
>   static inline void housekeeping_init(void) { }
>   #endif /* CONFIG_CPU_ISOLATION */
>   
> @@ -84,4 +89,6 @@ static inline bool cpu_is_isolated(int cpu)
>   	       cpuset_cpu_is_isolated(cpu);
>   }
>   
> +DEFINE_LOCK_GUARD_0(housekeeping, housekeeping_lock(), housekeeping_unlock())
> +
>   #endif /* _LINUX_SCHED_ISOLATION_H */
> diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
> index 83cec3853864..8c02eeccea3b 100644
> --- a/kernel/sched/isolation.c
> +++ b/kernel/sched/isolation.c
> @@ -18,12 +18,24 @@ static cpumask_var_t housekeeping_cpumasks[HK_TYPE_MAX];
>   unsigned long housekeeping_flags;
>   EXPORT_SYMBOL_GPL(housekeeping_flags);
>   
> +DEFINE_STATIC_PERCPU_RWSEM(housekeeping_pcpu_lock);
> +
>   bool housekeeping_enabled(enum hk_type type)
>   {
>   	return !!(housekeeping_flags & BIT(type));
>   }
>   EXPORT_SYMBOL_GPL(housekeeping_enabled);
>   
> +void housekeeping_lock(void)
> +{
> +	percpu_down_read(&housekeeping_pcpu_lock);
> +}
> +
> +void housekeeping_unlock(void)
> +{
> +	percpu_up_read(&housekeeping_pcpu_lock);
> +}
> +
>   int housekeeping_any_cpu(enum hk_type type)
>   {
>   	int cpu;
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 475bb5998295..0cdb560ef2f3 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -46,6 +46,7 @@
>   #include <linux/mm.h>
>   #include <linux/module.h>
>   #include <linux/mutex_api.h>
> +#include <linux/percpu-rwsem.h>
>   #include <linux/plist.h>
>   #include <linux/poll.h>
>   #include <linux/proc_fs.h>

