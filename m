Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96044230997
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 14:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751208859; cv=none; b=Ljc6iWLOsS9q2ee93XR1l2vXaKGcrLt+OMjqT9vgjAkynjQi6EVOz0FT88JgOSksivrGcEsYrPCm7Irxik6+ItMnBmTM8W7+2lEQtos47Y6sC4u5k3MfUMU17qmDjWvANFJLvE2eJ2CHdhyV2BiUl5b20aeQOeWkGTVy6EkCMLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751208859; c=relaxed/simple;
	bh=SuYzlHdKx9KKuMad5H89bprbU/W9GFt87MZuLdv6G2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=knowl1IUx5sWQG99NoD3lqjQvVTahH7pgNcnLKtIpuMMpOjCZITe/DytVFWQ5JrgSm3rpQrddj3wZvbAH+lHDZBzKli8GdmkTX95g2d71eh2/1Aq1aJtT+xWjc6GjI5Ijv3oQz99fWOuBSJ6L5QwCVsdiGuEaDSeugOxIfCtAjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E/d37Q7J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E/d37Q7J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751208856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OQhAjIZaqrzSin/ILh/jdA9Kl28mycO6RSVocvPjupU=;
	b=E/d37Q7JhFzLTtHM49KPoqxnmJgy1UmOhMMsajlQS1dgbL2/GVmHuFzA1mD4m6rh8jBeSg
	rSBUy7bmF7zt2dM1/LhAEzPcoW1Hdy9L7On6NoymC6kXd2J8cEjy0eP+yNyq+LKA5498h4
	XnqC0wYXLrXfZqpK6KFiFRdlwaJusjs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-V9aIqE1RPpGhr5l-4uhOLw-1; Sun, 29 Jun 2025 10:54:15 -0400
X-MC-Unique: V9aIqE1RPpGhr5l-4uhOLw-1
X-Mimecast-MFC-AGG-ID: V9aIqE1RPpGhr5l-4uhOLw_1751208854
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f65a705dso673137f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 07:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751208854; x=1751813654;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OQhAjIZaqrzSin/ILh/jdA9Kl28mycO6RSVocvPjupU=;
        b=Qw/mMUONKT9LsWEQYNXMaDMSZmyQ6IO/dj2+CuOnNpIXY36geDm2QjGKQllERXtmFj
         rIl60LJGy7b6cw6EabxKwK+5NYMX5jFLB4fZwtTTFHDq7AJuZdtTJNBEL/dfKLjNDoAD
         a5XjdMNICjU8ji8E+VcRhAieKTtmEC76nMe2a+INP1iXRteI+TBxwmYcVqrxzM5K/cqO
         uFNN7TMB6YcLNXHPZ9ebaWgBnM6NTNPdeCJGMNUo4ogIM8WOTdvuehzzJlx1PITBCQJ7
         h0ZaaiURMEc/PVL+nCYhv2uxGelnd+BR0lMzd7jonIzX12S7V6yGfU3gHBAVO5q9iWSY
         2bCA==
X-Forwarded-Encrypted: i=1; AJvYcCVuSRhBWF9HQ1uleM0p7WFyrW5sIKA12LNSlIhpGLXf1G9aFDi7Fx1hIt+nEr/+xm4DDt/jIw34RWSh8ZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVYiotwsDpMvY2xNuyN/9esNeAnOti1oLEZE0LE6PdRAj+hdLQ
	b9V1jjku6+ZXTJVtiDRPWTYSFQYcDPIShIWNNQMcmBcqhCK7XKNsiHqc8GH8bjv+TexXCKFk6ku
	mku/tmQPEDVO6MSBoGAjErEcqUG7XFcAeA0aAPFTixuTKoWB5+ujMFdBfB5mLMIr/BA==
X-Gm-Gg: ASbGncsKF/gIU9Puo/BqulK6L4VCM170fE7Cr0GjGOOhS+ymsGnlXNMOCoeG7l4ydNB
	Ec+JcJKoZHvVNxjQBYowZ55UKk4k4ii0zZVmhSaVbu2BKhqInTuU8A26jUjCoBugJWKeTjl73XB
	AZx0Ji3m5sP/PbqW/A+dgsr/0Fez0CRSJlUo0pM3zjzZyT2bRvtPp2XM/D8d5/aq9NtgNnnHmL5
	kP+FKHEXSEZck5VG5xug0OHt85mpJMIvLUqbiejG0SWeqbs+3lTdHkldyPlIhj+g/39BvfwVNjM
	MBzPKncyuSAwvYMAdtJg+04Y1y7yumUUYgzUQJQpr+HERAsPMpzXymdIhCxktw==
X-Received: by 2002:a05:6000:4186:b0:3a5:57b7:cd7b with SMTP id ffacd0b85a97d-3a8f482cf28mr7316067f8f.22.1751208853595;
        Sun, 29 Jun 2025 07:54:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBMBWkMBcKHvlqeEC2011OKDiMy1e9qvKMcbYXf7maBrJLSJvn0jG6UetsmvOQwcivB7Qgog==
X-Received: by 2002:a05:6000:4186:b0:3a5:57b7:cd7b with SMTP id ffacd0b85a97d-3a8f482cf28mr7316054f8f.22.1751208853166;
        Sun, 29 Jun 2025 07:54:13 -0700 (PDT)
Received: from ?IPV6:2a00:79c0:638:3500:abf:b8ff:feee:998b? ([2a00:79c0:638:3500:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52af3sm8072162f8f.50.2025.06.29.07.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 07:54:12 -0700 (PDT)
Message-ID: <20f0c6fa-fb23-4159-b742-58994f2af30d@redhat.com>
Date: Sun, 29 Jun 2025 16:54:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 42/42] drm/msm: Add VM_BIND throttling
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
 <20250629140537.30850-43-robin.clark@oss.qualcomm.com>
From: Danilo Krummrich <dakr@redhat.com>
Content-Language: en-US
Organization: RedHat
In-Reply-To: <20250629140537.30850-43-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/29/25 4:03 PM, Rob Clark wrote:

> @@ -1121,6 +1124,20 @@ vm_bind_prealloc_count(struct msm_vm_bind_job *job)
>   
>   	/* Flush the remaining range: */
>   	prealloc_count(job, first, last);
> +
> +	/*
> +	 * Now that we know the needed amount to pre-alloc, throttle on pending
> +	 * VM_BIND jobs if we already have too much pre-alloc memory in flight
> +	 */
> +	ret = wait_event_interruptible(
> +			to_msm_vm(job->vm)->sched.job_scheduled,

Ick! Please don't peek internal fields of the GPU scheduler (or any other API).
If you solve this within your driver for now, please use your own waitqueue
instead.

However, I think it would be even better to move this to a new generic
drm_throttle component as discussed in previous patches. We can also do this
subsequently though.

> +			atomic_read(&job->queue->in_flight_prealloc) <= 1024);
> +	if (ret)
> +		return ret;
> +
> +	atomic_add(job->prealloc.count, &job->queue->in_flight_prealloc);
> +
> +	return 0;
>   }

