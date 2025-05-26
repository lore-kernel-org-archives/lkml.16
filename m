Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA94E1F2388
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 11:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748259440; cv=none; b=IzbMixkzD2dpxXvjwXyGWSYWJNNP3UaHlHGQ+sxeH32JniqjkiNSfVIakWL12LFrGdF2JXbUOumnsdYDZwa2Z2GeD3EHbhROhL3N8x6f4gXoVZicCogpK+xdop+b4AutLkEwEL/ecZI7FUFIXLSWcWLh7v1zfQt5N1nsbknDX4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748259440; c=relaxed/simple;
	bh=nSDYH4WEhkI0c4mWAbs9ei0wGtWyyYjJxPJ8Zztq6V8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPPkcZ5uoTXD11jqKqkLEGwOK8PZxopV/WbLS192IfaaTKffJVrX0PkF58RYe3p5lZbZ2hffxQ+KZm+vd6zYFamNkZc5dmwKZ4J8qEXBf4odlAOghgMjQ1Cw6n4FzTbP1hl4VUu3pU3m35ih3X1UFtNvY3D3+EP/3RgohPEcE9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ScdH/Yoi; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ScdH/Yoi"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a374f727dbso67289f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 04:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748259437; x=1748864237; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q+rDiPz0qSiYsyHG9zqVRKjQE9VlYlwaE/0xL4WFAXE=;
        b=ScdH/YoiFPxoMBbOD6lhW0f7B7pot7t5pETKHfKXpgM445bToixc2S0ECXCN5bBlPm
         24Qi9YUk3hKPS1zzUDQvCxWKh6arP2ePb2j9aGn3vW0RigfXDsdOK6RUAzIN4JToy2AL
         YgmIvgOgi3epmQumVuywj5Sls/fX1whN1vwGHzQxj1sbN6JoTutCKxaud0oRT5wYTx28
         UOMNNpiA0bkjeTjORP1447x0WIcijMN8qGNo8m46g/MIg8L2EWaRuThs7l7210eJ8UYt
         C23P2GY6NdIqvAagaJlITQou4pf5MhRo33LV21XTeGq8GGJIoOCRM2kDu4QPfwPyLQuP
         mwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748259437; x=1748864237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+rDiPz0qSiYsyHG9zqVRKjQE9VlYlwaE/0xL4WFAXE=;
        b=cCPQxzt3sFmt+PPzAonAodvFGyP0uqDjmFMIGWHKPdGqMnjlS1BD4OU/BZ4zNp19jj
         BxMZWk606cXrOoI0GmSmPt9MgYza4tpB2ScsbDli4N7kn95Gm2ndGOGBIQnCOboF+/+c
         OCk4x3x3fCQGI36Ztu3DGyddLefiG06UDQ7M3urgcgdH3TERclFZ52HkZ2+PDMTa0n3J
         9KPi0mxs9EaCb37xdaAnqaOHF27p+IiRGMI4Sc3RkfQ/6WlEttHsLeQl9vQDDVPZ8UD4
         3EY5OfKkxYl2uVif/dd8blQJ9HkPoHYIaAGIhdZs4rjtsYmHLo361dSA2Sjj4K56qJle
         s/lA==
X-Forwarded-Encrypted: i=1; AJvYcCU6DtFz6uRC3qJHiOv1XVAlSt512dVfq7NlDF1RwACeZG7HsS+weFuyHSJxtzkWeNfR9zEbEsvd7xR5Hh4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjGZKthijAFrPvKYPKSUnu82xn01U4ZLO0ssYgznApdenMFddt
	BZJ+yTq71nqsZdzjB9m0gDvHe2MWnBDHTze3YSajljvgknU0cigRhF3mDnKdb1Mt5Sw=
X-Gm-Gg: ASbGncu0dmaV+ZyT3jT07r3N9vyvEwd66odsPMxfp8h0wSUDWNEsrOE6ud6/ZsIlUDN
	/3v2Tgq3A5FD9wNtEOeF8LcoUzn7WlmvTah2Pfj8Z4ggu/FcXJmScB1OSqaykmbcSMau5tnDQD4
	/BY1/ibcgbHmd3imZ5MkmTn22kZdAWHIO0xwUOi7jVDljVu7KsoSs4kRaPaIlnQI9m0O3HCCwWO
	bUprO9Zfoj4WMR4jaSDajlTiVeO6TOyEcJXa41zyMDpkx4+SlpzsuiIrAlp9NRTtVy1W/0cdk27
	XtB9xdf3c4rnrRSwD5IYpASoq8esod3wF3QMe0u8yXsg5zqlJiP/w5vq
X-Google-Smtp-Source: AGHT+IEv5PUqkz+rdGK7cMHOMrelnch8JlHVRcoDJFXgNKq4OweFef3f63o86S/y+HO8Dwb3Au7C2g==
X-Received: by 2002:a05:6000:40ca:b0:3a4:d8f8:fba7 with SMTP id ffacd0b85a97d-3a4d8f8fd9dmr2806239f8f.2.1748259436914;
        Mon, 26 May 2025 04:37:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4cce08411sm7388745f8f.51.2025.05.26.04.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 04:37:16 -0700 (PDT)
Date: Mon, 26 May 2025 14:37:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: clingfei <clf700383@gmail.com>, Kees Cook <keescook@chromium.org>
Cc: elder@kernel.org, johan@kernel.org, vireshk@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] greybus: Avoid fake flexible array for response data
Message-ID: <aDRSaZ4Rq47hjMuY@stanley.mountain>
References: <20250526110654.3916536-1-clf700383@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526110654.3916536-1-clf700383@gmail.com>

On Mon, May 26, 2025 at 07:06:54PM +0800, clingfei wrote:
> As https://lore.kernel.org/all/20240304211940.it.083-kees@kernel.org/

I don't want to have to read a link to understand the commit message.

Does this change really affect anything in terms of "enforce the 0-sized
destinations" rule?  I don't think this is a destination.  I think Kees
enabled the checking he wanted.  You should probably CC him since we're
refering to his email.

> pointed out, to enforce the 0-sized destinations, the remaining 0-sized
> destinations need to be handled. Thus the struct
> gb_control_get_manifest_response and struct gb_i2c_transfer_response
> are removed.

Here is a better commit message;

"We want to get rid of zero size arrays and use flexible arrays instead.
However, in this case the struct is just one flexible array of u8 which
adds no value.  Just use a char pointer instead."

I would have ignored it, probably but actually the
gb_control_get_manifest_response struct is not used so put that in a
separate commit.  That's a simpler commit to review.

"The gb_control_get_manifest_response struct is not used.  Delete it."

> 
> Signed-off-by: clingfei <clf700383@gmail.com>
> ---
>  drivers/staging/greybus/i2c.c             | 9 ++++-----
>  include/linux/greybus/greybus_protocols.h | 9 ---------
>  2 files changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/greybus/i2c.c
> index 14f1ff6d448c..2857c2834206 100644
> --- a/drivers/staging/greybus/i2c.c
> +++ b/drivers/staging/greybus/i2c.c
> @@ -144,15 +144,14 @@ gb_i2c_operation_create(struct gb_connection *connection,
>  }
>  
>  static void gb_i2c_decode_response(struct i2c_msg *msgs, u32 msg_count,
> -				   struct gb_i2c_transfer_response *response)
> +				   u8 *data)
>  {
>  	struct i2c_msg *msg = msgs;
> -	u8 *data;
>  	u32 i;
>  
> -	if (!response)
> +	if (!data)
>  		return;
> -	data = response->data;
> +
>  	for (i = 0; i < msg_count; i++) {
>  		if (msg->flags & I2C_M_RD) {
>  			memcpy(msg->buf, data, msg->len);
> @@ -188,7 +187,7 @@ static int gb_i2c_transfer_operation(struct gb_i2c_device *gb_i2c_dev,
>  
>  	ret = gb_operation_request_send_sync(operation);
>  	if (!ret) {
> -		struct gb_i2c_transfer_response *response;
> +		u8 *response;
>  
>  		response = operation->response->payload;
>  		gb_i2c_decode_response(msgs, msg_count, response);

I like when parameters are called the same thing on both sides.  The
name "response" adds no value.  Instead get rid of that variable and
pass operation->response->payload directly.

		gb_i2c_decode_response(msgs, msg_count,
				       operation->response->payload);

regards,
dan carpenter

