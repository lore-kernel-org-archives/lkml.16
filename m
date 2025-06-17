Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101502C18A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750136428; cv=none; b=ntWEYJEo2R7jqYRaBGDkymXzlLqnb3zAYaopTi3zclxQcIsrmsOaf7/sO3mN8nufrp5YcxGxw1AIS4omftWl0FvzfclWYAM9hS1bfdyb+2VArCa2kWQnU0DKSFkdUJ4vgMxVBA+xMVzX6U46EDQKJfg9NmA7Qf2623w2mLaZDYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750136428; c=relaxed/simple;
	bh=V+Z9viGW2mQHUgAQAM4wmU9u5Q1wfMoJw+aGoGLrovI=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kwyIGzeqZX4RK5O1a5SNyAuidS8CUOlJr7Xl/blySnoxojhwleJKKMavCoHtF4rhm2ORdFCLmlvMtM8IjniDh9498C+X6fZl2FfD514NMtEj7xemdSFpcXk1UV/saEha40TNDOD1R1y4tWjjmDrpilMwkZTmnBuxpEhlkbdk3aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cARlHsoc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cARlHsoc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750136424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1NyyrjVp7x7bd0ZYGuL5yez7PypbZT8ag8gXavULDWU=;
	b=cARlHsocE57LT+oNcw7ny5KYFCEMXjk2/Q12JMHyPcngN29KFs08YpnwlywlMfMbA246nG
	xa4St/lsGsxUQVaLGw2wE+wgKDrV0cW9e5txSVcoP3PgZADG/hW0yGb1ANEj2iAq8PzW6A
	2yqUkcqaarVcoulsd5pP9BNw1U9BRvo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-T_tOuXE5MQunv9WluzSEjQ-1; Tue, 17 Jun 2025 01:00:22 -0400
X-MC-Unique: T_tOuXE5MQunv9WluzSEjQ-1
X-Mimecast-MFC-AGG-ID: T_tOuXE5MQunv9WluzSEjQ_1750136422
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d099c1779dso910300685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 22:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750136422; x=1750741222;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1NyyrjVp7x7bd0ZYGuL5yez7PypbZT8ag8gXavULDWU=;
        b=fj6JMlrOn65ymksQy8CKU/+yw9DeZBJ5s11nDE0bXl/5IJCA6+biXmY9uh9RXNIlxT
         jGCW5QebvLsxyCLANJXGJDxHr9ZEi0i6Hp9Tim7Xwdwd5kNs43dakK0CFX2Wyxf5yufi
         jecWKWL8uFkhZSkolpXlHeSZbCE9nEvDvidZ4p+fChO92B0Bt2HmaPp52pNHbTcOV0Nn
         Rg1BwwEFBVrQWW1Xq6X9diSCnVJMxAhx6Wv5hl5i/LkWuJByvVqkYoxQjBoaPP4av6pP
         E+JW1KBGBVyTZHAYO/5JOOJUxeDq105GEHBTFIOFnnKwBcquUxQ2jTWsyJYpYzg853dD
         qK/A==
X-Gm-Message-State: AOJu0YwwMNr4t5gqGe0Nxd6KBHm6VbgNyGs5AvnUWyFu6yCVB8Yj1Gcb
	ojf+VwOrc06Ahz2fvF7z298YOhszJTQLsnulNGbSGEBDjeV55z8g3AFiDqU6IAABbnLOVWngoKH
	gqj9n983eaAKGdl6WBrTInEX0RWogDMrKABy2CfXb/yTj4iEEg1wmVqR4NkvPRCIrXQ==
X-Gm-Gg: ASbGncvNb5OJpq2Woa6QxJM6R5O3TZUi5skBYM/zWpRz1hMhWwCxoZ+eLIaF9LNcJys
	E1qKLeb2fr7wCee4D3pLgTz1aEG57R4TrOEXGSCGnG5DhbGJUnDb1FpATb/9w0lgFvI8hIJ3myn
	Rf7TDeMlTCspIU8rgEK5YDGOFFdVhIeMsVbI+th+oxeWfYxLQDtEGyN7fxpPP+wCS46JqOsicu5
	V8rL604JxM7tjNI8j92Vn6HW0/edThCicTA/bDD8QTmgKht9n8KUkPgGOhcdqykFGv8DqGLHJO1
	51cqj0DJSI4lRhJZXQ==
X-Received: by 2002:a05:620a:1b90:b0:7c5:49e3:3347 with SMTP id af79cd13be357-7d3c6cdfc36mr1906793585a.35.1750136421892;
        Mon, 16 Jun 2025 22:00:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWt3mL2iPG6Mtb+S9nFMv063s+W6wfyZG0t6TruzJS9fy8nsWTcjT0oQazpLajvLMysHRzBQ==
X-Received: by 2002:a05:620a:1b90:b0:7c5:49e3:3347 with SMTP id af79cd13be357-7d3c6cdfc36mr1906788585a.35.1750136421520;
        Mon, 16 Jun 2025 22:00:21 -0700 (PDT)
Received: from [192.168.21.4] ([4.8.26.34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8dce5d3sm609299885a.16.2025.06.16.22.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 22:00:20 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <407f7b2b-cb60-4cd6-be4f-8ad335ad2e38@redhat.com>
Date: Tue, 17 Jun 2025 01:00:19 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] workqueue: Initialize wq_isolated_cpumask in
 workqueue_init_early()
To: Chuyi Zhou <zhouchuyi@bytedance.com>, tj@kernel.org,
 jiangshanlai@gmail.com
Cc: linux-kernel@vger.kernel.org
References: <20250617044216.1401878-1-zhouchuyi@bytedance.com>
Content-Language: en-US
In-Reply-To: <20250617044216.1401878-1-zhouchuyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/17/25 12:42 AM, Chuyi Zhou wrote:
> Now when isolcpus is enabled via the cmdline, wq_isolated_cpumask does
> not include these isolated CPUs, even wq_unbound_cpumask has already
> excluded them. It is only when we successfully configure an isolate cpuset
> partition that wq_isolated_cpumask gets overwritten by
> workqueue_unbound_exclude_cpumask(), including both the cmdline-specified
> isolated CPUs and the isolated CPUs within the cpuset partitions.
>
> Fix this issue by initializing wq_isolated_cpumask properly in
> workqueue_init_early().
>
> Fixes: fe28f631fa94 ("workqueue: Add workqueue_unbound_exclude_cpumask() to exclude CPUs from wq_unbound_cpumask")
> Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
> ---
>   kernel/workqueue.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/workqueue.c b/kernel/workqueue.c
> index 97f37b5bae669..9f91480758288 100644
> --- a/kernel/workqueue.c
> +++ b/kernel/workqueue.c
> @@ -7767,7 +7767,8 @@ void __init workqueue_init_early(void)
>   		restrict_unbound_cpumask("workqueue.unbound_cpus", &wq_cmdline_cpumask);
>   
>   	cpumask_copy(wq_requested_unbound_cpumask, wq_unbound_cpumask);
> -
> +	cpumask_andnot(wq_isolated_cpumask, cpu_possible_mask,
> +						housekeeping_cpumask(HK_TYPE_DOMAIN));
>   	pwq_cache = KMEM_CACHE(pool_workqueue, SLAB_PANIC);
>   
>   	unbound_wq_update_pwq_attrs_buf = alloc_workqueue_attrs();

Right, the wq_isolated_cpumask isn't initialized properly. Thank for 
fixing that.

Reviewed-by: Waiman Long <longman@redhat.com>

