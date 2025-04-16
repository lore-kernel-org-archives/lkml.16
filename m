Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B2A1F55F8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744812773; cv=none; b=C7RawCf0BJjddp7Zz/yoNBamWOepBcP1tNDBKNyfWsbuTO8uZog05crh2DHHzd8+fMp0W9MnCkLmSt2GZVNNMywcrbeLBfslFLfTt3l21icQcvLGNTsbE5wppKdnQIGcYxdNLOJlmLmBn7Kjr5Tvl1cYLOLBT53N9710ofEhw2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744812773; c=relaxed/simple;
	bh=XTkntqDwePYCb0luiS2lGmMOslSaMPOKVqshcejczDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PFHPvAYq7rsMjrsuej1Wa35Z7GyrQAmswsQ8MK5H76wqH1ziUiuXe/pg5OObNcU/6AgRKvuvgzM2woSPyZwvcvbyUtCr0UZd9G8OO9g4ubIAu548hzX9btOl/ple+Gyv+varlG8wZfBuV4jhrG9tthFQzMEIJo3DRl7thqMaguU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TY4PgM1K; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TY4PgM1K"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso1005815766b.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744812769; x=1745417569; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TZMTVb3pZE6oHhA0d7W1SxUDzw2vnyZ2X+M+C9eM56o=;
        b=TY4PgM1KfaShKUCbyX8HFFo774fz2AkxuG6Jju0esbmx2rV51BlG9AZD4JKuo+xeBR
         MDpv0aYKAOwI+5RHBE5OI8E0rElv/hL6Nn6UJx+PZs63A2m+j1dW2FiC0GtPD49GY+qG
         xVgBSbCCNdn3O8N315LimcJLVIKai4VlzBFhWVwvhQfUqgfPS8DMqB7B5kL3vDwSADo5
         tsBW5n8rWH7xrwcuW5m+7TN1irh1fBObtNEiAcimR8+vXXKjUEhN7nrtdoWQh6ndwfkX
         kqqSf5vfB6jEkun/pLOGMrY6glyZTEFBt7b9pON5h2qnIzlonZIOWKPJQNyg5GVl3DI3
         DkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744812769; x=1745417569;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZMTVb3pZE6oHhA0d7W1SxUDzw2vnyZ2X+M+C9eM56o=;
        b=VaFgJhKF/Baa6RIxf13vMf/8CRCj5nBhzaXYFxeFENe5C09cRHHFdT1pV3YACohFjX
         k6aCxPGa//vbISSJfgaDvoUlB+AaVtsUyKjU8rhlkpPx/Z8RoupYtHOUnHJiCmcfq+/A
         tvN4dXXor0w0x6MR/ZpqHYFCN6LWnhp/++3y1VEzE+IhXihiCaGoBFX4yWtPuF6z5fkO
         EMyWoNfMiYSoYaOQvLhC6jGMcK4pKCJKrhs3olCJeucWdhxHnBYthgIOfzxEj7lMEyCW
         ecZm2Rdxk1ulnZ/mJOMCIfGYFqYDVc7XpfNTA0s0hGJCoD6Ii85BWsq+E7B9sNd1HtqD
         VLbg==
X-Forwarded-Encrypted: i=1; AJvYcCXWjckm+cycb8zL1gMYyhlH3YDIE2p0Z7kFyrBIN/Eueen167pCv97v9I/7sT46fUeSN5H/WKaajdG7bnc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr0HuQlyyWDFyjOz0aRNzsyFkGpQ8wY5A6aoINryEokEGq7Rw3
	ecVjMpkESj4na+sW07FPQ3y6Y0G+75Uovz1nhkPs3obR63RGo8hz+pX/nNND6ravlZRIEIkdfRT
	+zHOHeQMuhAKYCy313NGcBolrgoCPgJVl7UagKw==
X-Gm-Gg: ASbGncttPX1IU2RfO6ToRLXEjx7CNZA0P9OG9M090ZVZbHY4bkHUgn8Jz8hPz5nMYzg
	x+ULIFnUEFqx09GVjH5XnpAtEXc5t47wJzkSYgcV/ZOrA+42Gljzqsu5o4VO924JKkx7KdMaB3t
	p+XRJjgCHeUD9pT7J1tedC1cDd//CIdhTabM43OjwjUpu0ZMHrZSjBGXA=
X-Google-Smtp-Source: AGHT+IFKh78VHVMJondHG+OsJwidPfNrFauRyCcIsVgg2sFjRBzYe5AIwmVRBEBBtiTUMeOMLDkaj0i2I1JGEUQ+Qgk=
X-Received: by 2002:a17:907:3d9f:b0:ac2:cdcb:6a85 with SMTP id
 a640c23a62f3a-acb429839b2mr140366666b.22.1744812769573; Wed, 16 Apr 2025
 07:12:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z_-P7bsD3KL5K25R@stanley.mountain>
In-Reply-To: <Z_-P7bsD3KL5K25R@stanley.mountain>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 16 Apr 2025 16:12:37 +0200
X-Gm-Features: ATxdqUGQSIwu5i_6p0YPHLy3HbMNhNvwue3TIyNU5eKcYhwj52asxFGUhRcPQLE
Message-ID: <CACMJSesQ1NZZ5jHy=h6eaRyV+-FaRpzVKtfnycv_5Z4YXJ+o-Q@mail.gmail.com>
Subject: Re: [PATCH next] iio: dac: ad5592r: Delete stray unlock in ad5592r_write_raw()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Apr 2025 at 13:09, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> This code was converted to use guard locks but one of the unlocks was
> accidentally overlooked.  Delete it.
>
> Fixes: f8fedb167ba4 ("iio: dac: ad5592r: use lock guards")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/iio/dac/ad5592r-base.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/iio/dac/ad5592r-base.c b/drivers/iio/dac/ad5592r-base.c
> index 217a8a88818d..5f2cd51723f6 100644
> --- a/drivers/iio/dac/ad5592r-base.c
> +++ b/drivers/iio/dac/ad5592r-base.c
> @@ -324,10 +324,8 @@ static int ad5592r_write_raw(struct iio_dev *iio_dev,
>
>                         ret = st->ops->reg_read(st, AD5592R_REG_CTRL,
>                                                 &st->cached_gp_ctrl);
> -                       if (ret < 0) {
> -                               mutex_unlock(&st->lock);
> +                       if (ret < 0)
>                                 return ret;
> -                       }
>
>                         if (chan->output) {
>                                 if (gain)
> --
> 2.47.2
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thanks for spotting it.
