Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A957018035
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743134338; cv=none; b=BPqZ8TMS6EvC/tnsZqdBMxGZH1zNAqVwQBS18waiTKJYo7t40GIVNfdr0Xxy55lzuXx7XSU/MHEQb2eGhtiZB+14xuFYLl8ehmxvo6TudfwnGwefwEFY6T1UZ3zbudAikJKi+vJBPa8MFWwZsXLV/+6Lnf4qu1JY80Xjzs+n+JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743134338; c=relaxed/simple;
	bh=q7XI5g1niryW5hlAM+BsctOWycdt+eJmqr1ZRgqdIlc=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=So5Z2c7HihdvC2iJnFNho4Lpq5OTw4AW1Nw+SeYGL9ZEUMW0XhGjHFEDDbDNLu2B8E8O//hvms2yxqsBWZPmGxQCu+8Y9BtaiUSZ1vtQST4xV8ruZp6c2hqreKeHO7purWG2JnNXCIPEKgQk8VFQdgRJ/z+6yUrp6jpCxMz9ptU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GRYRCaEL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GRYRCaEL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743134335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aWtCRsYNYmXWI6K6OWoKyuEPbLWjGU4bseqJwFGHju8=;
	b=GRYRCaELxAsXHMAvKd52atX4CL5jzCepKrEORPidnFaG/Y8S1ztof943K0BjxVQ712gV1W
	Q57RnXVFlo/ItIQ5kggR9dTNX2QtDbjzaINCYT4tMWX8XXH/BXwbf468CY15AZxoqDdISq
	VmRhzQVOSIW5lmLC2CfdPOoGYrJkaSE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-nASvyEeEMeqMU1xiWkQSZQ-1; Thu, 27 Mar 2025 23:58:54 -0400
X-MC-Unique: nASvyEeEMeqMU1xiWkQSZQ-1
X-Mimecast-MFC-AGG-ID: nASvyEeEMeqMU1xiWkQSZQ_1743134333
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e91b1ddb51so25843806d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743134333; x=1743739133;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aWtCRsYNYmXWI6K6OWoKyuEPbLWjGU4bseqJwFGHju8=;
        b=M3fkCtkYMiPMLSFQa+JEBD6oK0Oew8Q+je26us1dmTcf2JUyVrH/8dzTAEyCFhchnc
         eJCTSoRwLcV1iTyEUC7bLpnsNmye9E//XdvoWwqF7QKMfnjrIlsyTdMU3rtPwunTdIJD
         JO4wHyQTfYs3X7NW7MKYfSq7ZmyZM4BuWlc7dIddw582zPZ3nR8BLE9QCNkk0pmHaeXu
         xbCMH17CWTIeOQ28jxUTu3uRgJC9vRMkHsUi2jg90Xy6r20p6HsPztcMWRbblvdFmvzm
         6NOg//bJSjwLjOt/duf/2S4tv4xETAiW0V/JO+3GKwhlt0d2kOPxvR6vRZdkDmFbCdSF
         Wp9A==
X-Gm-Message-State: AOJu0Yw36MBbX/g+9mpt2kzmwzPPl2twHnCnjJubb52fHK8R3KeABCg0
	cs15bXeMBv1/fc/MG+D9Jp/hxUKgFD6xy66+b57Q+AJePei9AZtLoHto3vVY2TZX86oA/o8cwbB
	La/DOibJ8RnxPXaNRLWGVgcThyH4xghEHO/MrowzU10aqp+AImlgY4++WLqOZWw==
X-Gm-Gg: ASbGncuCfm1VHLtbrmXLlZC+rI0hfGsWeffr/87zDXk9sz+VMe8UYg0Q53tOik7ycmz
	LMGIYBHGoqpQIdzDl13VhXlmcjhTy0DrBD2RU4KFkqSgNOhOeFQzNP+USviYWqbV1dhiM29+wXx
	SGmhLMe96leLdQOLW3P/tI9/SL9r+xgbA66L9NPnxv3N8TMeIBFpZ4aYWk+V+wOSVRJLcpVa9zt
	rWrc9Po2k3kXeLz+wNqrIC3jNW3Oxa7VezwLERI7vQjqC5ROAFfUgRmXUiQDKquDn4YhbzsONxE
	2PqxpgxZPTmnJRMIi+bZ4eD6U0wczU3+R5KRoFdGBJxPq9b3+hHesM1XGvSOow==
X-Received: by 2002:a05:6214:404:b0:6ed:1651:e8cb with SMTP id 6a1803df08f44-6ed238bd327mr90024316d6.17.1743134333420;
        Thu, 27 Mar 2025 20:58:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHlvKZQhw/zpKofmHdWX/4aL72DpDwdob1NsJswikmjwfEP08qRF10ho5r+tyyI6XN+afPUw==
X-Received: by 2002:a05:6214:404:b0:6ed:1651:e8cb with SMTP id 6a1803df08f44-6ed238bd327mr90024076d6.17.1743134333007;
        Thu, 27 Mar 2025 20:58:53 -0700 (PDT)
Received: from ?IPV6:2601:188:c100:5710:315f:57b3:b997:5fca? ([2601:188:c100:5710:315f:57b3:b997:5fca])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9627a16sm6355066d6.20.2025.03.27.20.58.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 20:58:52 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <8ee10a0a-b257-4141-b955-0097b43405e6@redhat.com>
Date: Thu, 27 Mar 2025 23:58:51 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] percpu_rwsem: let percpu_rwsem writer get rwsem faster
To: Cruz Zhao <CruzZhao@linux.alibaba.com>, peterz@infradead.org,
 mingo@redhat.com, boqun.feng@gmail.com, will@kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250328030519.897032-1-CruzZhao@linux.alibaba.com>
Content-Language: en-US
In-Reply-To: <20250328030519.897032-1-CruzZhao@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/27/25 11:05 PM, Cruz Zhao wrote:
> In the scenario where a large number of containers are created
> at the same time, there will be a lot of tasks created in a
> short time, and they will be written into cgroup.procs.
>
> copy_process() will require the cgroup_threadgroup_rwsem read
> lock, cgroup_procs_write will require the cgroup_threadgroup_rwsem
> write lock. As the readers will pre-increase the read_count and
> then check whether there is any writers, resulting that the
> writer may be starving, especially when there is a steady stream
> of readers.
>
> To alleviate this problem, we add one more check whether there
> are writers waiting before increasing the read_count, to make
> writers getting lock faster.
>
> Signed-off-by: Cruz Zhao <CruzZhao@linux.alibaba.com>
> ---
>   kernel/locking/percpu-rwsem.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/kernel/locking/percpu-rwsem.c b/kernel/locking/percpu-rwsem.c
> index 6083883c4fe0..66bf18c28b43 100644
> --- a/kernel/locking/percpu-rwsem.c
> +++ b/kernel/locking/percpu-rwsem.c
> @@ -47,6 +47,11 @@ EXPORT_SYMBOL_GPL(percpu_free_rwsem);
>   
>   static bool __percpu_down_read_trylock(struct percpu_rw_semaphore *sem)
>   {
> +	if (unlikely(atomic_read_acquire(&sem->block))) {
> +		rcuwait_wake_up(&sem->writer);
> +		return false;
> +	}
> +
>   	this_cpu_inc(*sem->read_count);
>   
>   	/*

The specific sequence of events are there for a reason. If we disturb 
the sequence like that, there is a possibility that a percpu_up_write() 
may miss a waiting reader, for example. So a more careful analysis has 
to be done.

BTW, how much performance benefit did you gain by making this change? We 
certainly need to see some performance metrics.

The design of percpu rwsem prefers readers more with much less 
performance overhead than regular rwsem. It also assumes writers come in 
once in a while. To be more fair to writer, we use rwsem.

Cheers,
Longman

