Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C39421FF5B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 12:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730115; cv=none; b=RO6wwoOyt70GQzqn6VKiMong5GpYZ2RkTnP6kDzCEDUEtAS1Zd11SEj42v8wwR5SOeWcvHxbIfeGDG58Z5lqXWriGSSLk+4QQKCIAkJX0qAv50uhAuD1oghnQnMtH9ljhbeG3y57Lcfcnl8nGdpahxi8uQYVQuk+XwKn5aPYeBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730115; c=relaxed/simple;
	bh=/5hkVOPMuKNYyP5pXqAuGWYICPyX3micXgythDTEnfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FlsYTrMlbs7cvw+Sbd0ylEmlSErFN3toAr3NQlYn+k8Wy3XpyWFRGqk3iEg24eWGAYaYuNOSNY4OgJ+V0DHrbRlcACn6fVKtqXP2X4MHit9IGBadkq21ZFdt/XZ3tAthpn1vTK4YjuMLIHThUzaSLZcwcVZaYapOIvo076x7D/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=b/+EWrU0; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="b/+EWrU0"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-872886ed65aso82141839f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 05:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1749730111; x=1750334911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oiQC+W0yjIGVwcsiN86fhi+gjf0lk8z+cPeuP0rwwk8=;
        b=b/+EWrU00bjwqoqDBfgmYPWOhkSYPf9t6JvmX8kXLzj1ZrUUYHgzKK7TZc6ZTCIm+u
         kPgS+I65OIuGFHJxyqvt7BuJ47EADr8r/3NM6rNo0FaA4y1G8LzTtpQ6EGxttSF5B24P
         /hTX0C/8paMgK9MgwJ57jgm3Pm5KPjA0ypCzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749730111; x=1750334911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oiQC+W0yjIGVwcsiN86fhi+gjf0lk8z+cPeuP0rwwk8=;
        b=jvDmqPGGfkOjznIXUxmhezlZTVL9AN4noDk2BQfcVO68SM+uMdQe3PnqxBeOLaa1kW
         AEHAVwmAeT7tDaMUxf/cmLoMB/HjjthFdAzUw3GLUCFH2yjSWeigOtmVK65EQ49wBi40
         y+YpMUkW+pg3jSB7KlVl9Q8/b8mJ8c2q9rCba3KAZcpnbBwLcl93hvEuAb7aLvpinTHL
         Ol4eymIu9FmyLricvvU5aPEg8wIR3nv97lD6aOljVSDgLl+0z8kpgmTzSfR4dqDw51Dz
         P2JJUzv1tnscrFBpoKeyVZ8GdwYKg0wX46/SNpJ+D8BghclyGmygVFSj5rLVIfh38yQr
         THcg==
X-Forwarded-Encrypted: i=1; AJvYcCVzJNZZBp+dLNtl18+BUswHf60Tzas+HjAUU9s5pEgGVaS/zA2MCtnvcpvjxuJIzG1806Ja6ycCh4gfHmQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb6F34QaaU1x/mqLexFAkzMdgVlq20Ou2GLy8j4sxo1Bq/OjKM
	j56R5JqjSiEG/gvjyrKhbM5bQobe84K4KGRgPcCSTbN1bNa77hsNQcAtWHz1GgEYXdwp6CSrEIi
	g/X8=
X-Gm-Gg: ASbGncsAGDebDmKF9/DA5PRM8xlBj1eGBWz9PmwF9pMFq+nywU/VXc0Rpp090VPyG6A
	ZNXOPsgPpX9v4jDsg5m427IN+i7wVrtLHQ0+P9LeBLjUmtYA1zudaHJrEAl07/ahyA1Ld4jdYca
	3I1ZBgmyh4tO005dSPSIU5kS392fp899t14dIxtt4BGOX8iLdfilhFtg3eorSe6r4N/X6rIjt/S
	qegNU4gAhtJoBuWM8CSMEVjyVxwk0Brm+uivXTVVJp+bGoaH+UPCcme9p4HNni866P5aiekcIIi
	X97qk7pnRnGcGn/tgNBfVvhRvf/HdNEZiTWw/WjbLQJT+nONoNXOTQ/dNyDM7Kh/UM2Z4LiH3qf
	JgoFc9XlKNM2uDAumJwfI
X-Google-Smtp-Source: AGHT+IFE6LoaIDSTbR2+Z49WPjvrD6HagrivYIZlBUHlPLtFW8Kl3MBn0+M7fl7SQRHeC/DZIkrMcg==
X-Received: by 2002:a05:6602:3719:b0:864:a3d0:ddef with SMTP id ca18e2360f4ac-875bc410f92mr880203339f.6.1749730111300;
        Thu, 12 Jun 2025 05:08:31 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-5013b75604esm260578173.8.2025.06.12.05.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 05:08:30 -0700 (PDT)
Message-ID: <28c3f551-c1a2-4bc0-a263-a27576335317@ieee.org>
Date: Thu, 12 Jun 2025 07:08:28 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] rbd: convert to use secs_to_jiffies
To: Yuesong Li <liyuesong@vivo.com>, Ilya Dryomov <idryomov@gmail.com>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>, Jens Axboe <axboe@kernel.dk>,
 ceph-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20250612110705.91353-1-liyuesong@vivo.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250612110705.91353-1-liyuesong@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 6:07 AM, Yuesong Li wrote:
> Since secs_to_jiffies()(commit:b35108a51cf7) has been introduced, we can
> use it to avoid scaling the time to msec.
> 
> Signed-off-by: Yuesong Li <liyuesong@vivo.com>

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/block/rbd.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> index faafd7ff43d6..92d04a60718f 100644
> --- a/drivers/block/rbd.c
> +++ b/drivers/block/rbd.c
> @@ -4162,7 +4162,7 @@ static void rbd_acquire_lock(struct work_struct *work)
>   		dout("%s rbd_dev %p requeuing lock_dwork\n", __func__,
>   		     rbd_dev);
>   		mod_delayed_work(rbd_dev->task_wq, &rbd_dev->lock_dwork,
> -		    msecs_to_jiffies(2 * RBD_NOTIFY_TIMEOUT * MSEC_PER_SEC));
> +		    secs_to_jiffies(2 * RBD_NOTIFY_TIMEOUT));
>   	}
>   }
>   
> @@ -6285,7 +6285,7 @@ static int rbd_parse_param(struct fs_parameter *param,
>   		/* 0 is "wait forever" (i.e. infinite timeout) */
>   		if (result.uint_32 > INT_MAX / 1000)
>   			goto out_of_range;
> -		opt->lock_timeout = msecs_to_jiffies(result.uint_32 * 1000);
> +		opt->lock_timeout = secs_to_jiffies(result.uint_32);
>   		break;
>   	case Opt_pool_ns:
>   		kfree(pctx->spec->pool_ns);

