Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C4022D794
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747748091; cv=none; b=gFDhuvKQKbaYdUj6vGJ9vOUu0NG7IdAZi2L8croXjE7GrNckpOTIBVTNrtd8/aseS4nJa0cpzs/RokmkTHpjmYwkVo7Zg3L868keMMK0jUjkJKZYFtK/WYrPjv6WmBQOHYHeVrn8qCZptBV2FPTdXOv+Sne4YgpCjhQMtFkD4oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747748091; c=relaxed/simple;
	bh=R5VbzDJWzrc3ZxG7WARI+XrXckegfKN14c/Dy6mUB68=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bfkUgCIu4idqapUDRZW+uzl7sJ1sBMyHzPp6z3JhVgmL477O8MmFHu7ROjDhWpoUYcMc5NBmC91cZWAWeGULGslxKkBTPwznib0NdnOwid1HAHLGZbY8HepkDfUzBKv62/Rp+La8VbbPmswooeTZ9OjajMvqWyRw/5VVbfiC8/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JArgLAYh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JArgLAYh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747748089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zPdd0kG+A0mBSYOTCTXbGwKBOQupNoZqnxcvyos/Qtc=;
	b=JArgLAYhHDxTUBNgluYhsk0lAcefVlv8jlBFzycFrlmoHuJsEeIGIAR7UjMqG5nXKhNaDm
	8te0aD/W9wPen2GGVm9IR4k535G6uZZVkHeHSznBryGvGIgBiAy/QFKMVBl3WuOriIx0u3
	ku8JqSNlFYF4pLosrxDWxM969R6IAo8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-WOhr29HOPYK0YTcgZ0DhGA-1; Tue, 20 May 2025 09:34:45 -0400
X-MC-Unique: WOhr29HOPYK0YTcgZ0DhGA-1
X-Mimecast-MFC-AGG-ID: WOhr29HOPYK0YTcgZ0DhGA_1747748085
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c790dc38b4so1019325585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747748085; x=1748352885;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zPdd0kG+A0mBSYOTCTXbGwKBOQupNoZqnxcvyos/Qtc=;
        b=INSYDOnoi0uuds8PnGWxVj+aiOCIOUpZv5tuFJUp1oO7oJNqMdzwuMS3iURvzAbSEF
         txp+qCLuWCRUFyWAxH4QaCfGkhDNM/TbfV4J0M0b8Typp+DQ7z8j+EZKlPA4Qxg0zqe1
         DWPcAI/ihdXsucBedVe2aIrmhxYrgT5VvMfULMNCfSEeI503t5XQVoNIbAtAcVXGZOq/
         csQo/VG0FbQ1cuuB8S98GQb4rrZIz8H6WjF2OSETmLbuWYNHwinCeNxSl2iWbnIkrQpd
         QkenX2ACz2f2UpO+04QexMgJiB9Pb7+bRNuLitcyjzpupIczXvPhgad0idhHfVgbkPbd
         WMng==
X-Forwarded-Encrypted: i=1; AJvYcCUvk47Y4/ynIieFUBQuK47DZLrnOWKMu4VJHxXePE8TG8EfBeN+8xC2KO9MURMSoGm4rrFnVhEoVwl/y7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl7NvLD1v4nZxFSrH/o6AQFq4g38qR5j6/iIeW+2hbCv0tSp+7
	4r1MfWW2lTC9LjLdqBDf81+ponrbx+jwbd5caiiPG0XTd7tUu9dedleoreQ49Mkm3/l6zAdhVhT
	abY3qiGCo3tPUpTXhP+hogsMyZ3S0as9n4N3lj4MWGfM4zGEmP4S4WJklJ23z863M9w==
X-Gm-Gg: ASbGncvW5RBopStQKwYIE+Z1nOT+DEAx/zeJJK0cUjvdBXJpwECqIbP308uhY9S6prh
	eEF8UvINtYWVIPvCMhY2QDlRj0ffHBx5YC4QC/NAzAgPpUhTMyEQNs00yWGKsSkPzTzGg0sbuCl
	aES9d1BahLCJ9/MxQywsoyesmqw3RoCP0uEOMyKUTtBnfonJ4ZFQqijrGLl2QwAmF9KlR8fFRKs
	DfEXMXhRNP3+OvhIZoARhybU901zeYlhqdxNbue5DJQ0bVFf4IyuXvULh3cQnV+Xx41/duKOXa7
	asKyTnszfOS/iPbeucQ4Fli6wrn+CJpHq3kL/I4eBDst0dVGrVfVZEY=
X-Received: by 2002:a05:620a:2892:b0:7c5:9480:7cb4 with SMTP id af79cd13be357-7cd46af8d25mr2512086385a.9.1747748085204;
        Tue, 20 May 2025 06:34:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQL2KB+rwh53zo4Wgg3ScYG1+9jtH2wb4ybzSByGI2RDMfJa/SzjeXrDk8HgE9LBFKy6qW6g==
X-Received: by 2002:a05:620a:2892:b0:7c5:9480:7cb4 with SMTP id af79cd13be357-7cd46af8d25mr2512082385a.9.1747748084686;
        Tue, 20 May 2025 06:34:44 -0700 (PDT)
Received: from ?IPV6:2601:188:c180:4250:627d:9ff:fe85:9ade? ([2601:188:c180:4250:627d:9ff:fe85:9ade])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468cd124sm730874585a.100.2025.05.20.06.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 06:34:44 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <8029d719-9dc2-4c7d-af71-4f6ae99fe256@redhat.com>
Date: Tue, 20 May 2025 09:34:42 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpuset: introduce non-blocking cpuset.mems setting option
To: Zhongkun He <hezhongkun.hzk@bytedance.com>, tj@kernel.org,
 hannes@cmpxchg.org
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 muchun.song@linux.dev
References: <20250520031552.1931598-1-hezhongkun.hzk@bytedance.com>
Content-Language: en-US
In-Reply-To: <20250520031552.1931598-1-hezhongkun.hzk@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/19/25 11:15 PM, Zhongkun He wrote:
> Setting the cpuset.mems in cgroup v2 can trigger memory
> migrate in cpuset. This behavior is fine for newly created
> cgroups but it can cause issues for the existing cgroups.
> In our scenario, modifying the cpuset.mems setting during
> peak times frequently leads to noticeable service latency
> or stuttering.
>
> It is important to have a consistent set of behavior for
> both cpus and memory. But it does cause issues at times,
> so we would hope to have a flexible option.
>
> This idea is from the non-blocking limit setting option in
> memory control.
>
> https://lore.kernel.org/all/20250506232833.3109790-1-shakeel.butt@linux.dev/
>
> Signed-off-by: Zhongkun He <hezhongkun.hzk@bytedance.com>
> ---
>   Documentation/admin-guide/cgroup-v2.rst |  7 +++++++
>   kernel/cgroup/cpuset.c                  | 11 +++++++++++
>   2 files changed, 18 insertions(+)
>
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> index 1a16ce68a4d7..d9e8e2a770af 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -2408,6 +2408,13 @@ Cpuset Interface Files
>   	a need to change "cpuset.mems" with active tasks, it shouldn't
>   	be done frequently.
>   
> +	If cpuset.mems is opened with O_NONBLOCK then the migration is
> +	bypassed. This is useful for admin processes that need to adjust
> +	the cpuset.mems dynamically without blocking. However, there is
> +	a risk that previously allocated pages are not within the new
> +	cpuset.mems range, which may be altered by move_pages syscall or
> +	numa_balance.
> +
>     cpuset.mems.effective
>   	A read-only multiple values file which exists on all
>   	cpuset-enabled cgroups.
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 24b70ea3e6ce..2a0867e0c6d2 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -3208,7 +3208,18 @@ ssize_t cpuset_write_resmask(struct kernfs_open_file *of,
>   		retval = update_exclusive_cpumask(cs, trialcs, buf);
>   		break;
>   	case FILE_MEMLIST:
> +		bool skip_migrate_once = false;
> +
> +		if ((of->file->f_flags & O_NONBLOCK) &&
> +			is_memory_migrate(cs) &&
> +			!cpuset_update_flag(CS_MEMORY_MIGRATE, cs, 0))
> +			skip_migrate_once = true;
> +
>   		retval = update_nodemask(cs, trialcs, buf);
> +
> +		/* Restore the migrate flag */
> +		if (skip_migrate_once)
> +			cpuset_update_flag(CS_MEMORY_MIGRATE, cs, 1);
>   		break;
>   	default:
>   		retval = -EINVAL;

I would prefer to temporarily make is_memory_migrate() helper return 
false by also checking an internal variable, for example, instead of 
messing with the cpuset flags.

Cheers,
Longman

