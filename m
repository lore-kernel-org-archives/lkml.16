Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6996B2D77E6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 13:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751637462; cv=none; b=IJ7+sbmAjymfQEj3Ztf0Ax+bNxseU/2O9iTCmxX/TdbbRY+YuzofFvWRq3LS02MneYAXbMy5CAIZswsYsaLItcAjGi/sTGJF+jSkcrsBkVBcWhpsURXEvkTeFQwbr9VOhCgkHxzZkRg3qgm0z5WRyQz97yUpIp1dHQg+SiDa7hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751637462; c=relaxed/simple;
	bh=9AiBcdtjRwo6HxUAL4Q5EAN5efoCq3iYuR6+iA0Sddg=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NEIoCknvBS2zZCSkvlAkePywGq5jXOf7WMEH690UXi6w6jn1i8ycL3hI2u7XZpwTfqubFh95WeuQi3ZRl1x87Qb+71OEnRsT0bSzX0etmaoOuThTzAxclCw0NO6tQSa/VyROnWNoS7WOCOct3WjrG0Ihe4mT0AYwEFjDh83hiCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DFPN7cnP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DFPN7cnP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751637459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mXC+Pbvv6wMd3kWlbuRF5FHReiHS9E94l/kQUP50cvc=;
	b=DFPN7cnP5QUPF820VIcTvAeXLU8esQjSqmZAdcPyvtb6sZJbVGse5y4w+mz97AZZMRajhY
	fajxw6aiS5ScqSleD1fUl/fkPw5qgn//MCoMXq+ZQr5tibFLVhvuaOao2zLhZN9piOPivd
	vgp4KMFiE34H9EKBd9ueayfmh/VovTE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657--2x8eTY7O3y7aTv_WasRdA-1; Fri, 04 Jul 2025 09:57:38 -0400
X-MC-Unique: -2x8eTY7O3y7aTv_WasRdA-1
X-Mimecast-MFC-AGG-ID: -2x8eTY7O3y7aTv_WasRdA_1751637457
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d399070cecso161962985a.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 06:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751637457; x=1752242257;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mXC+Pbvv6wMd3kWlbuRF5FHReiHS9E94l/kQUP50cvc=;
        b=I5JSseF55HTsAzjlXBzNOn/vMNekbD/DSEJ5T0Aoy6ap/j2Lc1hp4XLMAB4UU95FSZ
         r/2B+Ji2Zek946GZPEfTSTowJzlcI/Yh09Spkw7WF9Tufbq1bUzgHEHBVjKIfe9XS7IJ
         spqSvu8IGNT7xSHUNZgZT6kqwPD9KUGLAb0EE+8aH4qRFgp7yW13V6MSwS+MP14XxNvH
         hVIY90aJYlzntNt5s+aw4DNP43cLYiUgBwich6kFAUmSNj1gDrOl3NfMWusqmVLXPJz2
         Ljc6vPXre352Jv1hBJlN84wgv9LJhHHtryN6rvt6ewZeo8tzomjPxAuniaQt3wLEZXsG
         AAHg==
X-Gm-Message-State: AOJu0YyHmItv7SQX3jY8LU4FZGSynBEY6TvkXHkvX5WnVdfW6USZWTZW
	kX5IibcopXoKCy3OsCjdULFiKu3bv1txgE2ck/cfgrfnAvUdA3xwfickBiVzAoUJl58H2iLrdtB
	KqqpHEn3q5shjCkB5IVQaGWFs2Q0j7rbMS9C7QZ0wnme4Bw/2tEztpIlRuHbhW8TdEg==
X-Gm-Gg: ASbGnctx5YYhcYappKB85lZLf9/2RzrzgrKoDjhEtyCLEjX/OQs7mfIT6bUuggKED+b
	5UGCuUY0kiWTaZ569V64Lmbm/Tc4QUvDiqdtDCS+p2rdedP1a9YC+J45kwkHyyQnT0AITmalgHS
	KRfVbG9CPZcFFiawK9L+IW5yVn9/d5aAfhwD7en2fVbS62jVnrfjqeUFT02OfYBEdS55XkuQBhS
	dmH3A8D/HkMFgHwV0pAePdNYkYZKId/wZ8+KP5D0C9iAlF/QbtIa4rmsM0guKXj7AzWJbEeFVpn
	+cG+E/CJLpc80dSSbRJ66Q2ZNTSeUr+Hj6Si1ksPNZE5wiH6u4nTTHQxU4ECAk7KDodo
X-Received: by 2002:a05:620a:3705:b0:7d2:2822:3f79 with SMTP id af79cd13be357-7d5df0efa00mr257121485a.13.1751637457533;
        Fri, 04 Jul 2025 06:57:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1fBg+sAtLXj6W9yiXg9aDLRlkJbzYXVk7hXqRbct72Y6FPsj/v1DpV9N99Hdwb5FAsg+IPg==
X-Received: by 2002:a05:620a:3705:b0:7d2:2822:3f79 with SMTP id af79cd13be357-7d5df0efa00mr257118385a.13.1751637457180;
        Fri, 04 Jul 2025 06:57:37 -0700 (PDT)
Received: from ?IPV6:2601:188:c180:4250:ecbe:130d:668d:951d? ([2601:188:c180:4250:ecbe:130d:668d:951d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe8f9a5sm146104285a.87.2025.07.04.06.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 06:57:36 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <6a687f94-770b-4fa8-83be-978007e902b6@redhat.com>
Date: Fri, 4 Jul 2025 09:57:35 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] locking/mutex: remove redundant ifdef
To: ranxiaokai627@163.com, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, boqun.feng@gmail.com
Cc: linux-kernel@vger.kernel.org, ran.xiaokai@zte.com.cn
References: <20250704015218.359754-1-ranxiaokai627@163.com>
Content-Language: en-US
In-Reply-To: <20250704015218.359754-1-ranxiaokai627@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/3/25 9:52 PM, ranxiaokai627@163.com wrote:
> From: Ran Xiaokai <ran.xiaokai@zte.com.cn>
>
> hung_task_set/clear_blocker() is already guarded by
> CONFIG_DETECT_HUNG_TASK_BLOCKER in hung_task.h, So remove
> the redudant check of #ifdef.
>
> Signed-off-by: Ran Xiaokai <ran.xiaokai@zte.com.cn>
> ---
>   kernel/locking/mutex.c | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
> index a39ecccbd106..d4210dc97b6a 100644
> --- a/kernel/locking/mutex.c
> +++ b/kernel/locking/mutex.c
> @@ -191,9 +191,7 @@ static void
>   __mutex_add_waiter(struct mutex *lock, struct mutex_waiter *waiter,
>   		   struct list_head *list)
>   {
> -#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
>   	hung_task_set_blocker(lock, BLOCKER_TYPE_MUTEX);
> -#endif
>   	debug_mutex_add_waiter(lock, waiter, current);
>   
>   	list_add_tail(&waiter->list, list);
> @@ -209,9 +207,7 @@ __mutex_remove_waiter(struct mutex *lock, struct mutex_waiter *waiter)
>   		__mutex_clear_flag(lock, MUTEX_FLAGS);
>   
>   	debug_mutex_remove_waiter(lock, waiter, current);
> -#ifdef CONFIG_DETECT_HUNG_TASK_BLOCKER
>   	hung_task_clear_blocker();
> -#endif
>   }
>   
>   /*
Acked-by: Waiman Long <longman@redhat.com>

