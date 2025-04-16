Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89798156F20
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744810989; cv=none; b=uAruRXrfKU4MI4HqXWXmEaBvG4XuZX1MyW6pp9Lufci2oHvRk7feqVKD3czby8+C0Dn9SENiX92EVwlm+ro9rHv+gGi/IB9vU3l6ZoCyxU1ZpGnE76ynf3zZ7H+6bPGJcs4eOVx5jErhZcaL9sq6ziMVnaezVX1H2TV7jhqo+xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744810989; c=relaxed/simple;
	bh=SgNW/vvh5b61ht92JsADJZKSKikWVs7QhnzVzAyVaA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=piu8bxca+XKH6R9RCFH/fbyOPUf2iRZ0v28tkKUXSYUEZFAXsOqtfYmE8AN8o7w+HrcKKkwkQ0TGazvDGiCbr5tQ6cSiPuFvP04NrzkJ5yA03I2FsJ1mCZKjYfS2Qa4iCv3Z7JvQ3jGKayOQPOX9UgpNIIXGm8ahgmBPFf9HOvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MiW9aDuU; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MiW9aDuU"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af52a624283so665259a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744810987; x=1745415787; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9FMmsTxqI6R4LS4OuXpWt6I4p2kOrGqbZN4wMpdyEGk=;
        b=MiW9aDuUIMoSowhERYRHl9xbKFBd2kgiwIHEEwoZg9Co33F6oF5Vt+xfufmhJWfFlg
         Z7Z6nD63+U7LP4FzHbpMLIYe+08H/C1d5C17nybFfEhLlW/+eRuSNlUn2OIYPrUUJbiK
         Rg9IuSpbhh/rwb+1emuz0EEmzieIf6eHGay1uetYinAK0uLG6RSKUcoQsGFu5wuz6jrg
         GZWAxs+dik42KGJk5xB4YV4dNDynBccPzCkk57wivqFs0kR8GRQglrLHT0sSeZh798M7
         SYiUAoYmv2SZS23S90orqgxC1AY/Pig7yRXizuT3t9XvWvDryYgAzSS5R1gg6RAjY2rd
         wtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744810987; x=1745415787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9FMmsTxqI6R4LS4OuXpWt6I4p2kOrGqbZN4wMpdyEGk=;
        b=BpffWexbZpmhS4k2GcTgwLXqefCWCNRYcHPlsacY2s8r4pG/lZx6RmS/Nu6lFAAw10
         W3d2dlbQyE82VdijFxzpMKxuJdzgTQdu8hbthl7dxreNdvMFU8C5Y99d3YF18LXJNPz6
         K7umGDAzpeHLuwJ65ScFzIrdjU/kLihnEjaDNcS5ccoSCtY13AfSaGVQ2t3XrITk23Xf
         RDFiBtqKAeTnauPEqRjuOLDGs3Wal8rDHN87XVoyZVktA7/c+Hj5JIaZisyPHoXpXb41
         HxajsYq3fmtzh3MGkztzspmW83uYK6sHGBjuNhNK24cqGJsiYGndXurV/nEkJ8FjY/BJ
         B5Bw==
X-Gm-Message-State: AOJu0YwRjNjuHDX15zj0Lr2gWrRfjrR5fAXjkC3UJqa8x+5aY78av4hE
	07eB0XrSdWo1tw0GjiiOTMhauuSWjO76hQ1eAZIvLYeQXFVw1GUevdg79F+x
X-Gm-Gg: ASbGnctVHRfYJigIrIhN2hcH/8D6YtoZxT0ctwPxmvYKTi5j98MHTEVY9zgsGAXb2bd
	WZHAYlqS0TDbb+V7LED62jxFm3G/XSbc0wRL9ouTVs/S8Rs+IFZjZc2djECL4p+Elp/DF4Whfob
	Fa3u1qNpcLZYq2pXCmP9qAwpzBYQjLS4WwrgrQ/JiMalOkoS66TjjQ/zObZ1AWHjfVrILfiIapY
	1YYGvIJ044Imz/20FIKyeDx8GoJiEZCVh0CU6gBPsn/K9RkKqzL/7PfDcIg9U9EcAQ0v1/LnsNW
	ls2A30xAt/dm76NC3d0cU4ZLlBYLWMQP86F/t6j7knmiNxYsitzXrRIg+PbeAA==
X-Google-Smtp-Source: AGHT+IGAF57xlY7daKKfqRRtAHwkl8kenWBXpKkqn7XNIBPG/hMwAVINPlWTUm60iHdirp3RHncuuQ==
X-Received: by 2002:a17:90b:520d:b0:2ff:4a8d:74f9 with SMTP id 98e67ed59e1d1-308642a329amr2862011a91.10.1744810986689;
        Wed, 16 Apr 2025 06:43:06 -0700 (PDT)
Received: from [172.16.116.85] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613b370esm1720823a91.34.2025.04.16.06.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 06:43:06 -0700 (PDT)
Message-ID: <490ab216-982e-4707-abe4-a5b8d0444458@gmail.com>
Date: Wed, 16 Apr 2025 19:13:02 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [FIRST-PATCH] staging : greybus : gb-beagleplay.c : fixing the
 checks as first-patch
To: rujra <braker.noob.kernel@gmail.com>, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 outreachy@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
References: <CAG+54DbvpWHyX8+ucEQpg2B6rNTJP11CRpYxcYVrKpKehzrK-A@mail.gmail.com>
Content-Language: en-US
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <CAG+54DbvpWHyX8+ucEQpg2B6rNTJP11CRpYxcYVrKpKehzrK-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 17:47, rujra wrote:

> added comments on spinlocks for producer-consumer model, rearranged the
> lines on function calls where it should not end with "(" this bracket,
> also removed white-spaces and aligned the arguments of function calls.

Are these manual adjustments, or using clang-format?

I do not care about formatting being "readable". As long as it can be 
done by a tool like clang-format, that's fine with me.

Of course if you are fixing some checkpatch error, that is okay, but if 
now, please avoid formatting changes.

The comments are fine. Although you probably want to add a space between 
`//` and the sentence start.


>
> Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
>
>> 8------------------------------------------------------8<
>   drivers/greybus/gb-beagleplay.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
> index 473ac3f2d382..fa1c3a40dd0b 100644
> --- a/drivers/greybus/gb-beagleplay.c
> +++ b/drivers/greybus/gb-beagleplay.c
> @@ -73,7 +73,9 @@ struct gb_beagleplay {
>          struct gb_host_device *gb_hd;
>
>          struct work_struct tx_work;
> +       //used to ensure that only one producer can access the shared
> resource at a time.
>          spinlock_t tx_producer_lock;
> +       //used to ensure that only one consumer can access the shared
> resource at a time.
>          spinlock_t tx_consumer_lock;
>          struct circ_buf tx_circ_buf;
>          u16 tx_crc;
> @@ -642,8 +644,8 @@ static int cc1352_bootloader_wait_for_ack(struct
> gb_beagleplay *bg)
>   {
>          int ret;
>
> -       ret = wait_for_completion_timeout(
> -               &bg->fwl_ack_com, msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
> +       ret = wait_for_completion_timeout(&bg->fwl_ack_com,
> +
> msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
>          if (ret < 0)
>                  return dev_err_probe(&bg->sd->dev, ret,
>                                       "Failed to acquire ack semaphore");
> @@ -680,9 +682,8 @@ static int cc1352_bootloader_get_status(struct
> gb_beagleplay *bg)
>          if (ret < 0)
>                  return ret;
>
> -       ret = wait_for_completion_timeout(
> -               &bg->fwl_cmd_response_com,
> -               msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
> +       ret = wait_for_completion_timeout(&bg->fwl_cmd_response_com,
> +
> msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
>          if (ret < 0)
>                  return dev_err_probe(&bg->sd->dev, ret,
>                                       "Failed to acquire last status semaphore");
> @@ -765,9 +766,8 @@ static int cc1352_bootloader_crc32(struct
> gb_beagleplay *bg, u32 *crc32)
>          if (ret < 0)
>                  return ret;
>
> -       ret = wait_for_completion_timeout(
> -               &bg->fwl_cmd_response_com,
> -               msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
> +       ret = wait_for_completion_timeout(&bg->fwl_cmd_response_com,
> +
> msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
>          if (ret < 0)
>                  return dev_err_probe(&bg->sd->dev, ret,
>                                       "Failed to acquire last status semaphore");
> --
> 2.43.0


Best Regards,

Ayush Singh

