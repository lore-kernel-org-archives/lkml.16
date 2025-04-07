Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3757209F44
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744042431; cv=none; b=nAr+pXUEeH9IeDaC0Bk4yeLhDmAjl0zdvJMAAH7Wz13oCamq7DYI5AYLuXCMoWQdRzOjKGL/IvCwIY25VvVjtuYA/VvbrIT7E1cf1Vyt6oB5bc/Fb0OWNOIa58UbRaijWBLNmdmHGd05IEMB9kru6Muhrx6mmm9LYPekIKBK+oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744042431; c=relaxed/simple;
	bh=momMVb5vlwB7w7QBIrh4FuJxBMr+DXof5tHLvIxbILc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dH2C0UsAAUjUgRZp4QnjnlToEbwhjD6jvWLVQm1iyqKvhhTl1ONrA+0qcQ1sHO5fDFX/QZhzywxG5+pbIz3hwL+Wq6oOMmWJk7V5pZetSDeZtYdnYragzei9BX1P5VN1dW2lpjzpbmwtgsOLxCFcCH69NQPEWm0WqYrzp4Jau4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=VUkcGvdZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="VUkcGvdZ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so44100995e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 09:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744042428; x=1744647228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hAlufBsPlnjuTWbgusP8CYnzhAGj3Mnwll46JdWGBbE=;
        b=VUkcGvdZWUbu9OzL8xb/T9nIPABJp+EpwUB25HeDeqsIYBWHw/KxG+9HzB6zJ25efA
         IEVWesGAkZXnsKnEEQm5RrjsBBy/tM0vuvAVzxUKgGOfI/2MnZRk9eU1buIVmNaD/vyl
         7ohlvYtihiG99nc1Pjalgx9Cg3PhduK3ocW9+yDw355ftfxGvBo3YocEdBwq8pF8+NYx
         lMdNCYIYwmRxY1Ub0vqMljGY5ITbfI0syUZ0bCM41CmNbN56FnpgJML2mZso6zE4ctdw
         GGWGXp/DxpbSRR2/MomVoMl/GluMdqLScFL5xdZU1NcCHhUkH0KM61p8FLLG8T+nyt1b
         kttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744042428; x=1744647228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAlufBsPlnjuTWbgusP8CYnzhAGj3Mnwll46JdWGBbE=;
        b=oLCx/8UYbQr9GiFSoKJ0HaCgJVpn9GSrJ1/NgMNppgXivKJjVh39zSda5HpnP1nj4S
         2Hbx7KpSFIDQyKzF8o+CCc2489y+1JdzUJ2ueJQAydqwGOv8mQi3eCJdBP4lYOSvRj1N
         thk0RO6twh7hHdUMnR6nviRP7vsQBLcpbDnmzjoOda1GBNBwxWhWKd+3409wDoqmV/bz
         abM4t2bn3TZubyRoj5pwgccbY/UQm1L57RN5IpuHbZPXryfzAztWuzBHOfsBfr1w5QQh
         Rx9itISuhCOWM2vLPmj/RWkyF4x6ewFTHgI5zt9CWimRDqrzEA+1W8qOQK055r8OtkOI
         TK+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWejrKWuzpwVwIefDx9btM9p90bJogOUkS4xu5FOZ6DQhwnk6C1VoVdA/u85x4SYfj1/UQIsT8/ymUfgqg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk13n8mm9fzx8n2MU8m8X3Weq1a4GgxYmx1zXZmv0kazGn8DBD
	8X+FPVocdR79ml0udSmfqnpauC7X9ZzLRu/JXNNh8Tu6YBKLyDw4z9sBM4Ot9CU=
X-Gm-Gg: ASbGncvSl5S5Ji4fviMysu5sVCAAov6bthqR6OIsPlt0eH59HHKCKXh3R/JOPrXiWGy
	0RQkfuwu3MBx7wpBdwRMMoRCckjhrJjK6F4A+E4maES2KemaW6B+RJN6vlKN2LD01/QeXKBNcsK
	+xiDbD2FNHsonZA2mQNoYHpYWgVH+IZ6yxxwGdjYnd3CcxS2u6OYonx8Ql1L7t31lwLiFBbWanL
	dW0hpGHN39TOSldXNhYVRYzDgpF7CDvbQeiUKDZ3JUkpm1s72JR7y38U1nG+pl9b883cbrdWIyN
	Qeo+WzIqi2Fx9APYpAynt7LyFp0MHk7xNZYBfsG8mezgb2aZ+j73VoFEbAf2wLS0oHjZhuiVoJB
	ZQDwjHMlXVzAmb/byFf01trHuUX4=
X-Google-Smtp-Source: AGHT+IF9E+Yu68SivmKTZ/2oBu6XpMDyufJhLClsxWUTbSHDLDqi5DwsmXJhaL8CEGG/v/moBPNDvw==
X-Received: by 2002:a05:600c:1d28:b0:43c:fad6:fa5a with SMTP id 5b1f17b1804b1-43ed0d9ce1dmr107471025e9.24.1744042427942;
        Mon, 07 Apr 2025 09:13:47 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630ddesm137924675e9.5.2025.04.07.09.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:13:46 -0700 (PDT)
Date: Mon, 7 Apr 2025 17:13:44 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 3/4] backlight: ktz8866: improve current sinks setting
Message-ID: <Z_P5uLrGiQWez0jv@aspen.lan>
References: <20250407095119.588920-1-mitltlatltl@gmail.com>
 <20250407095119.588920-4-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407095119.588920-4-mitltlatltl@gmail.com>

On Mon, Apr 07, 2025 at 05:51:18PM +0800, Pengyu Luo wrote:
> I polled all registers when the module was loading, found that
> current sinks have already been configured. Bootloader would set
> when booting. So checking it before setting the all channels.

Can you rephrase this so the problem and solution are more clearly
expressed. Perhaps template Ingo suggests here would be good:
https://www.spinics.net/lists/kernel/msg1633438.html


> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/video/backlight/ktz8866.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backlight/ktz8866.c
> index 017ad80dd..b67ca136d 100644
> --- a/drivers/video/backlight/ktz8866.c
> +++ b/drivers/video/backlight/ktz8866.c
> @@ -46,6 +46,8 @@
>  #define LCD_BIAS_EN 0x9F
>  #define PWM_HYST 0x5
>
> +#define CURRENT_SINKS_MASK GENMASK(5, 0)
> +

Call this BL_EN_CURRENT_SINKS_MASK and keep it next to the register it
applies to.


>  struct ktz8866_slave {
>  	struct i2c_client *client;
>  	struct regmap *regmap;
> @@ -112,11 +120,18 @@ static void ktz8866_init(struct ktz8866 *ktz)
>  {
>  	unsigned int val = 0;
>
> -	if (!of_property_read_u32(ktz->client->dev.of_node, "current-num-sinks", &val))
> +	if (!of_property_read_u32(ktz->client->dev.of_node, "current-num-sinks", &val)) {
>  		ktz8866_write(ktz, BL_EN, BIT(val) - 1);
> -	else
> -		/* Enable all 6 current sinks if the number of current sinks isn't specified. */
> -		ktz8866_write(ktz, BL_EN, BIT(6) - 1);
> +	} else {
> +		/*
> +		 * Enable all 6 current sinks if the number of current
> +		 * sinks isn't specified and the bootloader didn't set
> +		 * the value.
> +		 */
> +		ktz8866_read(ktz, BL_EN, &val);
> +		if (!(val && CURRENT_SINKS_MASK))

This is the wrong form of AND.

> +			ktz8866_write(ktz, BL_EN, CURRENT_SINKS_MASK);
> +	}


Daniel.
