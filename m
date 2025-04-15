Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1A21DF994
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710480; cv=none; b=r40COYPMVYkuO6M224wlfBpF3u8dXjXMZeD7fBeYunccobpPpJuh+cJJ1lhXVT1xEbWpw8ALH53Z1uxjDyDzeKGkCJ6wyWiJaHEC/hJ4ditb30iAzPmza/2OeeE4f7pdBioELSVnbYgZEL9Ac3yg4kPnQM66Udx6wWJ54MyIxas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710480; c=relaxed/simple;
	bh=NHYgoMavZomgR155FPH8MIHUNwsEbiNGYwRCeljlovQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EabNq0niqHINfpdEh9ZdCeYQQTKx8ywQLLEkH2u0wMaWA4Pqd8hEZfGsfy6GpuS34h0k/XjQKLKJTGS+u4xaSDKb8w6tFaJ5/BNp2Z9vrqslqZTgb+xu2GWAGIIT0E3eWKxF5/d9YT/f78F3Vjg0tmA/4ewIp4FqqLoiYnRfEHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9QkKGZO; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9QkKGZO"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso819562766b.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744710475; x=1745315275; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z9B0Bd1BUx68w7Mbxfm0Ifu9JvY4VuLu19QSTLgTNRs=;
        b=B9QkKGZO+C2u1z0+gxW524kJgW8Mna6DZHh0p6bqGwvzjtkS5+ozy3Xr6P9MpPxr/F
         6PEtIs0tUb8beieGgWvr5xPEPVGhsxrcnlvHs4WG11te5tbnTsnQ0lnHqgfeiYhnE+3y
         rWxs4MouYtA40IN7g0eH/U0V82jcx0PmeiZPeQ+sX2oCCEwyrYHyMCsIelbY2lVxL8F9
         DfCmOEANHRtFChXxitvg0gn2T2ad4Eaakh/lhlrbAjqc5quKj9fJdK+guapF9GV0zMue
         LtsiWPS+xdry+m7lUV0uNGPutpMm5yoCVmqjez17mHeechF2ZYquXI0ubYl3A/CIeuQx
         gPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710475; x=1745315275;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9B0Bd1BUx68w7Mbxfm0Ifu9JvY4VuLu19QSTLgTNRs=;
        b=OljJb5L1IRVjvdA1QWfFDHuRoVjALglaj7Z4wXsOOpbrTbJFH9fYSJDhJgrWQipRO1
         i119MygrLNjjamItZ3YmTQhxW359kwGxkvxlf6r/oIgKp2adXVqoTnFQdkapPt7wYRpF
         xTa64wlBp0hrVH35lsmGyOHFq49nMosqCJ8gnLrGU3iJ8tcOAZ/AMdqqH/NXmi1OWEwt
         f304k/O//En7OZxwHSCkDvw9xBg1ogHqqGYz01h2dmYgRs5s8Y0LziX0eVsKb/FXku1r
         9jz/om0xo6dnoEZP10yCPVr8ENv5C2RimyfdAJDoKSs1Tu4BX3N5rZ7oQ64dW3k1g6SH
         v/Xg==
X-Gm-Message-State: AOJu0Yx0mdCYFQpKTBWWTuQCFF92FsCazBQpYvXPdd9a+KsaLq9i0Dh1
	Jld7eK2h+5A6+itqXog8EwSxMXODJz0juUvN75ntLP3rozjp+Qqb
X-Gm-Gg: ASbGnct6ny/fcVl5wQe8dyWpXvlKFhv7VDd1B5YY3aTVs4B1IG8d8NQ63Fd0cbPRK2J
	iilKGwNbRQ8Fn8yO3FNI/f17xzXXZ1FlgxpHRsXp68fs2wW3WnSf/rgcSY2HCTrjtlApnGnPeSD
	ERkbMK+ZuDk6+z+9V2m6isQ67vkJ0uBdOlmFchzSHvXqV1b+CaJRVfjf53uPEwjTxmoduqEBsxN
	dqnkts/chTgDxXk5OqOECwb3NxM0cyMV+Kbgb4UuXajM+q8ianweOiScI9f/vLTYOlheL7EpNwW
	QFipkJ3d2nzz01XLNJYH73SuOjoN3Ybg4vELd7xcG8SGW/ZkOLs8pvvtklUuJm1nlPj59ph+y28
	gXb0A
X-Google-Smtp-Source: AGHT+IFi/pl1+kYD/76ekvd4gzjSl0YfqXxDau9kzWZIzbXn80QsA39CkXQWExTlmp9UQ9EcAAO6Eg==
X-Received: by 2002:a17:907:1b05:b0:ac3:45c6:a1ec with SMTP id a640c23a62f3a-acad34bfaecmr1477673866b.25.1744710475082;
        Tue, 15 Apr 2025 02:47:55 -0700 (PDT)
Received: from [10.1.1.210] (89-139-41-229.bb.netvision.net.il. [89.139.41.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3d9csm1060597466b.25.2025.04.15.02.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:47:54 -0700 (PDT)
Message-ID: <aedaf79b-7bd3-885c-2bcf-ab9c73f7cf86@outbound.gmail.com>
Date: Tue, 15 Apr 2025 12:46:51 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] char: xillybus: Use to_delayed_work()
Content-Language: en-US
To: Chen Ni <nichen@iscas.ac.cn>, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org
References: <20250414074559.3954142-1-nichen@iscas.ac.cn>
From: Eli Billauer <eli.billauer@gmail.com>
In-Reply-To: <20250414074559.3954142-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Yes, I suppose this is the right way to do it.

Thanks,
    Eli

Acked-by: Eli Billauer <eli.billauer@gmail.com>

On 14/04/2025 10:45, Chen Ni wrote:
> Use to_delayed_work() instead of open-coding it.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>   drivers/char/xillybus/xillybus_core.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/char/xillybus/xillybus_core.c b/drivers/char/xillybus/xillybus_core.c
> index 11b7c4749274..efb1ae834265 100644
> --- a/drivers/char/xillybus/xillybus_core.c
> +++ b/drivers/char/xillybus/xillybus_core.c
> @@ -1184,8 +1184,7 @@ static int xillybus_flush(struct file *filp, fl_owner_t id)
>   
>   static void xillybus_autoflush(struct work_struct *work)
>   {
> -	struct delayed_work *workitem = container_of(
> -		work, struct delayed_work, work);
> +	struct delayed_work *workitem = to_delayed_work(work);
>   	struct xilly_channel *channel = container_of(
>   		workitem, struct xilly_channel, rd_workitem);
>   	int rc;

