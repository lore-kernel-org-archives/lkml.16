Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3C528A1EE
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 19:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746732986; cv=none; b=Rjc2y/zFeg/mxatOGHVHGRiMpOwbYyD4fwJQYUqtXEX4ak9uuOv1KtDDl/ZHhtJEX5j1A+OsAaFwZogzwFVPpSgjD73+sGKw50es7mGZ+VjipcQWBwLVY7QzDuIDhPWmUAXw7P2eM8vvRnQ3iCwQzTYlB2ObSU2BMO2N61KIEsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746732986; c=relaxed/simple;
	bh=sskzmfRBKrtyrvaDO+90bHXI7VeTet/0CWNnw2B6jzM=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:References:
	 In-Reply-To:Content-Type; b=i5VoZv3dE9ztMsyqjZ4hM+7Yl0XetU6m18GeV1hvsgw/yfOo1zaFr5kuTAqe4eoQicyFQQPEpGCuNbx6+VliUCc/3zmAEhAqlqp4dLRqHdWkqgsQkrDA3yr2b7C5Ozp+w5VUQ4wQDj5cTjpPZqwxX4Kcm5ufg2sWpZKrkrpENXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EZWSrFlb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EZWSrFlb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746732983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sMSK5ZAn41rIA+tVFhgcK/VSjG2CjNRjiAb9AYqMURE=;
	b=EZWSrFlb+0qSRNZSIjY6hEomPo9Cq0YfdEJhFq5832hdxqr9J2Quo42c+KxHAsGkg8ZCKM
	rqBHdsGjmIGMO8diXG9huGpr0tD500S++wIk5tCmfOHAQV1H2Ibydl3FhPHpBkl3oLfbC0
	94M8Wk4SzZqYOvxZN7dOleasCAOspok=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-OH_bhozBPBK2DplYm2gwaA-1; Thu, 08 May 2025 15:36:22 -0400
X-MC-Unique: OH_bhozBPBK2DplYm2gwaA-1
X-Mimecast-MFC-AGG-ID: OH_bhozBPBK2DplYm2gwaA_1746732982
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f2c9e1f207so25296696d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 12:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746732980; x=1747337780;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sMSK5ZAn41rIA+tVFhgcK/VSjG2CjNRjiAb9AYqMURE=;
        b=mk7PFqu35DP/H6JRHFxThYdE9YK8LifYlqxA1Jce90DhlbZzQWfHVJiAfKO1k1VQJx
         ztv4J4K58WtK+5qaAU4L4lfuDbbUF1n+7vq/1cRV+4oOJPIlvjAoWLME2PAauWEKm8Oe
         T0zL2vAe+ZZREWqwjtH/jEFrZh4wtcsi3E9Y1vWSsZgsc3C9aQCYjE4nSLi3oMAe4/qi
         bKNxL/JVGqRbXPj5lGX/yhqtsuXLwtCtix4Lu5r1D8Xiya2RkSnGu/phlL+jM7pq+vhh
         M1aXuqXf6Wrf7ozALW0vx0t7OTIP6qb8xt5usDmmfqo7GCZD3Sq5fvFv7iC4J7YGu5jL
         6P1g==
X-Forwarded-Encrypted: i=1; AJvYcCVyNZTvfkkNLxGErlSRXbx4lfJxwjlRs3YJ43WVkBJE7G1Aaw8OFqnBCSYefreLesCoMZttKdeMLjY59YE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIZQUetkAIwIX0NMgoLBpx2tehem7mhGq533j3lTaLcfWUuPaP
	DrRLT+zwKng7by8EWv/wrp6EqdTluag1JXe85uJPrd6E5+cXJuqhPBXHJZNo1H5BuWmMGGZTvfF
	Q6xlKbSRDR4qVSk5cyxCtn6d95PlNZnTq2j3YRBGTQ/x0mo+zzWOqpoJR0Qg/oVzwUx8Fb5CF
X-Gm-Gg: ASbGncu2zNf4FRrr7rzHbOHtEoRFaKEPuS8t3w0vVRGN+fBEq/C5vWmY9twJFyID+o3
	EC27nvULLqrBshPyAjq1ckOa8ZrL+z1WbfahyPiFzbwzTTYp+DzBmd5T6Jnwka3+yAyaB8aZFM4
	KHAMN1nugrzFoPOwNv1XGRFnTO+HeAb4p0cBjllAMwanb2jDtjLSeMIIX9rDX0mE48hSYFrlZDY
	q0Fli0liVFUJXmC2KyM/7PD7isS4yqCRRekW6GxGAWyG7HXewOcssD4BIeo/nQYJtv792hlOzF/
	C8P1iKynF1Bih8tnyBPyvE37ic6TlGm0RCNgjJDZ7ErUzYRJjGQG8tAE+w==
X-Received: by 2002:ad4:5dcf:0:b0:6e8:f4a1:68a4 with SMTP id 6a1803df08f44-6f6e480e30bmr7967966d6.39.1746732980489;
        Thu, 08 May 2025 12:36:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0Sy72JbcvF90NKSywmPl3GyTkaZYXxFFXeLkdg2Kj45kGhvABU/5pAtNzbQo2gxKgW2G90A==
X-Received: by 2002:ad4:5dcf:0:b0:6e8:f4a1:68a4 with SMTP id 6a1803df08f44-6f6e480e30bmr7967546d6.39.1746732979922;
        Thu, 08 May 2025 12:36:19 -0700 (PDT)
Received: from ?IPV6:2601:188:c102:9c40:1f42:eb97:44d3:6e9a? ([2601:188:c102:9c40:1f42:eb97:44d3:6e9a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e3a538f8sm3316976d6.114.2025.05.08.12.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 12:36:19 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <1b558608-6496-4078-afde-5f0e10086781@redhat.com>
Date: Thu, 8 May 2025 15:36:18 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cgroup/cpuset: drop useless cpumask_empty() in
 compute_effective_exclusive_cpumask()
To: Yury Norov <yury.norov@gmail.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250508193207.388041-1-yury.norov@gmail.com>
Content-Language: en-US
In-Reply-To: <20250508193207.388041-1-yury.norov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/25 3:32 PM, Yury Norov wrote:
> Empty cpumasks can't intersect with any others. Therefore, testing for
> non-emptyness is useless.
>
> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
>   kernel/cgroup/cpuset.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 306b60430091..df308072f268 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -1388,14 +1388,12 @@ static int compute_effective_exclusive_cpumask(struct cpuset *cs,
>   		if (sibling == cs)
>   			continue;
>   
> -		if (!cpumask_empty(sibling->exclusive_cpus) &&
> -		    cpumask_intersects(xcpus, sibling->exclusive_cpus)) {
> +		if (cpumask_intersects(xcpus, sibling->exclusive_cpus)) {
>   			cpumask_andnot(xcpus, xcpus, sibling->exclusive_cpus);
>   			retval++;
>   			continue;
>   		}
> -		if (!cpumask_empty(sibling->effective_xcpus) &&
> -		    cpumask_intersects(xcpus, sibling->effective_xcpus)) {
> +		if (cpumask_intersects(xcpus, sibling->effective_xcpus)) {
>   			cpumask_andnot(xcpus, xcpus, sibling->effective_xcpus);
>   			retval++;
>   		}

You are right. Non-emptiness check is useless.

Reviewed-by: Waiman Long <longman@redhat.com>

