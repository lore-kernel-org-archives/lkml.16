Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351B8289823
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 18:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747248746; cv=none; b=FlbSl5KpKjV7zOhQS8Fzalhzzpebx5fu3nQxzoqyoltE6moXTz43EZXhpmFRNkhA+tmcqBIe2042bTB0qsBbD9tzKsB0NeuorYjVs8cUk134MtfVmLhyzdzsr6BHIbLU7GaJHryrX2OdpGbpNRB50ssw+MjOvZLEdEHEQ+LZ5Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747248746; c=relaxed/simple;
	bh=CQJ/Izdemu9Upqt5gzxnWRlT+ZgctMHmGm8idYAOny8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=djxYnE8aMllVaBhRwSbFGjP4QRA+QpNVkosw2EbPAJwmjwizIfk08ZdEbIyndK+rM9Xr5J8dBS33qKiQSwZtmZKXWeNq2Sp8kh2J0Y1gTN7a/z+6hKZtb2rFrbQRNQerdPhspW7ACKufbnQqr9dKl/yRHpI6mza+mE9/o8gT3Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=STw0v52y; arc=none smtp.client-ip=209.85.166.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="STw0v52y"
Received: by mail-il1-f195.google.com with SMTP id e9e14a558f8ab-3da73df6c4eso997865ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1747248743; x=1747853543; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HGMN7yT051U8CF0u0W3zG/2Gp6ABI+Yzeacfvbogg24=;
        b=STw0v52yb5f0mPL9IZXFtif2MvZtEGQ2168zGGYzHCPb6t4M0vFI1jgwVwp1LT9Pn2
         Za9nauB7EZCqRUQTpEvQ2fc5DQm9SbI5ueJz6kx8+ASZEMaH0r5RKD0q77mQfTOU3xpZ
         WRuxwr5X3agOghIhOz2VBvaJVhlUgfFwPjXSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747248743; x=1747853543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HGMN7yT051U8CF0u0W3zG/2Gp6ABI+Yzeacfvbogg24=;
        b=GO7je86Ym3/lXoTIKJEzNMy7VFfEXYlHoQXvQmZASLYQgXg2UrJtGRiPI7RSvP56Lt
         1njXi9sBzISvmD9cawF6DNZ0iD5YgEy7f/DQ1a4y/s79+xNWNMPEpoiT4Y1C32JmpLyk
         uVkaKCeKmLSyjPgRBiiPzHQzSxHTnaqF6moDltihLEHcIpXE6es/OyxEpGTKvHjgYIjD
         p55+mZL32NeQw2/aaJ1CTxT/gbYnlPs/V2LgfI/TGlKHmEWlFRGLgtepuoGZ5c0Tw0om
         6+q97BMY1U+PE9zPeQvRpkWtQDvCTZ+IBGPplVh77CZypk4xZqpls5EKd2eTId5bVKCB
         ytHg==
X-Forwarded-Encrypted: i=1; AJvYcCXhSfQfzjK9Rr/aNlJCSWM19FJx72KydC/UOWpdhfIaHkuo1JexE/7pdapyaTq5EBGFg0cRjneYNsI+pT4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf9WHjVHrPIdYXcQTwTlJlB158IzEancTWPvXIepdF3y3kgRVB
	Ce3cIQ5u53tZVgSOpc62dviRqlz74Qin3ksrhnWvrzYj5hbpgg3/iqcT7BhYMQ==
X-Gm-Gg: ASbGncvzAN5YlKQbsTBSovqBrugLOt2ErJzgiW0hz9cC2OZYNZ/Op8jMkbfmNdoHl6/
	blYiPTZdpySxMEYA9jBjwFPQsDiZOTAgSBMSLplifjKHhcERiiPSBL43DUDwNXxMcBqw5ilRCCh
	oZ8Q87dkiEYZ6F4Cor/9sQe+SYKdWYaPJ6CIVhPZfS3UiIyQ2ptIVJXLa5Nx5p5ftQifvXBqUNW
	eyq/IwpMnQ457L0XEkv3P/yQti0aiiWLZEPNAKIZYxy1rU3c9hEbnLo6KGrHnrkOvlOICaKz4gG
	A+AfyGJglMv8sXb/1yEahcvyNZWHrIY2Syr9iA9XQDWYFsfx3rZudcvU3MBeGsc98RzLnPbCcF5
	qZLm3xt6vsg==
X-Google-Smtp-Source: AGHT+IFWNOPlW3Guyw5uFAogWr2c6RBmPpeNia2yV6RQZMbC2QrNjBo4dAxX2hlRCnwwzJwFcrXEhA==
X-Received: by 2002:a05:6e02:4415:10b0:3db:7007:297e with SMTP id e9e14a558f8ab-3db70072a21mr27112305ab.6.1747248742981;
        Wed, 14 May 2025 11:52:22 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-4fa226587acsm2718570173.115.2025.05.14.11.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 11:52:22 -0700 (PDT)
Message-ID: <9c69fb88-d4e1-4567-93ec-ed303b9ba01a@ieee.org>
Date: Wed, 14 May 2025 13:52:20 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rbd: replace strcpy() with strscpy()
To: Siddarth Gundu <siddarthsgml@gmail.com>, idryomov@gmail.com
Cc: dongsheng.yang@easystack.cn, axboe@kernel.dk, ceph-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250514182015.163117-1-siddarthsgml@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250514182015.163117-1-siddarthsgml@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/14/25 1:20 PM, Siddarth Gundu wrote:
> strcpy() is deprecated; use strscpy() instead.
> 
> Both the destination and source buffer are of fixed length
> so strscpy with 2-arguments is used.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Siddarth Gundu <siddarthsgml@gmail.com>
> ---
>   drivers/block/rbd.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> index faafd7ff43d6..92b38972db1c 100644
> --- a/drivers/block/rbd.c
> +++ b/drivers/block/rbd.c
> @@ -39,6 +39,7 @@
>   
>   #include <linux/kernel.h>
>   #include <linux/device.h>
> +#include <linux/string.h>
>   #include <linux/module.h>
>   #include <linux/blk-mq.h>
>   #include <linux/fs.h>
> @@ -3654,7 +3655,7 @@ static void __rbd_lock(struct rbd_device *rbd_dev, const char *cookie)

Could the cookie argument possibly be defined with
its size?  I.e.:
   __rbd_lock(struct rbd_device *rbd_dev, const char cookie[32])

I see all the callers pass an array that's 32 characters,
but the function argument doesn't guarantee that.

You could also abstract the cookie with a typedef and
operations on it.

					-Alex

>   	struct rbd_client_id cid = rbd_get_cid(rbd_dev);
>   
>   	rbd_dev->lock_state = RBD_LOCK_STATE_LOCKED;
> -	strcpy(rbd_dev->lock_cookie, cookie);
> +	strscpy(rbd_dev->lock_cookie, cookie);
>   	rbd_set_owner_cid(rbd_dev, &cid);
>   	queue_work(rbd_dev->task_wq, &rbd_dev->acquired_lock_work);
>   }

