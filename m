Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5921523A6;
	Tue, 27 May 2025 05:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748322928; cv=none; b=VdNVVtNA4a6r/f4QkCL2PspJIasvrpmdm7cAOfhOKTknWRwDQEHiaeDace0KZpSkv2NDaK3wjicZH2pRe5IWDkgX92GyllEWrdtQdg/RrNeDxIaDerc/gvZ6sfCWclEqmgwMmnxMgOql2bYWJfH0vXNkgGO6Q91+j1Rj165K/x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748322928; c=relaxed/simple;
	bh=xURgOK3pFJUXKZ6fAfxjAMKIOiAO6nzG5Owtv/6PTGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oqJ34M2cpABW5ciTWUJ9SCSv7OmGAehlY8W3FNVdVg9v8tg660V+9MW0MbaNr6hILvRZ5iWe+moslPjXnKcuuEkxY6wuAcd2esQt4ECHjVPKFyViC00/2hqQCp5udb1YvzgQ1BaiEPa7B8nZN7ByZEfDFAfdnMEalS5laeA5dqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=N6xdaNGv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N6xdaNGv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C188C4CEEA;
	Tue, 27 May 2025 05:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748322927;
	bh=xURgOK3pFJUXKZ6fAfxjAMKIOiAO6nzG5Owtv/6PTGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N6xdaNGv/eqQmSAW8B3Nj3Dh5VzUj7UHdCMFlpO5QpNGmbSL+iFWNu7+5aGcyQMLC
	 jxW4UVP/zwIxClOomUa5xpOCnzzQPCR2MoktQw4/I1zS0kLlwskuxObiVzX2gyqWqQ
	 WVdvAUObTaNL16vx2UsG7Qk3shn+DzFfD/EhdSn8=
Date: Tue, 27 May 2025 07:15:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: clingfei <clf700383@gmail.com>
Cc: elder@kernel.org, keescook@chromium.org, johan@kernel.org,
	vireshk@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] greybus: Avoid fake flexible array for response data
Message-ID: <2025052700-ungodly-vitality-d86d@gregkh>
References: <20250527050635.946553-1-clf700383@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527050635.946553-1-clf700383@gmail.com>

On Tue, May 27, 2025 at 01:06:35PM +0800, clingfei wrote:
> We want to get rid of zero size arrays and use flexible arrays instead.
> However, in this case the struct is just one flexible array of u8 which
> adds no value. Just use a pointer instead.

Not true at all, sorry, it does "add value".  Please read the greybus
specification if you have questions about this.

> 
> v1: https://lore.kernel.org/all/202505262032.507AD8E0DC@keescook/

Please read our documentation for how to properly version kernel patches

> 
> Signed-off-by: clingfei <clf700383@gmail.com>

Also, we need a "full"name, not an email alias.

> ---
>  drivers/staging/greybus/i2c.c             | 12 ++++--------
>  include/linux/greybus/greybus_protocols.h |  3 ---
>  2 files changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/greybus/i2c.c
> index 14f1ff6d448c..b248d6717b71 100644
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
> @@ -188,10 +187,7 @@ static int gb_i2c_transfer_operation(struct gb_i2c_device *gb_i2c_dev,
>  
>  	ret = gb_operation_request_send_sync(operation);
>  	if (!ret) {
> -		struct gb_i2c_transfer_response *response;
> -
> -		response = operation->response->payload;
> -		gb_i2c_decode_response(msgs, msg_count, response);
> +		gb_i2c_decode_response(msgs, msg_count, operation->response->payload);
>  		ret = msg_count;
>  	} else if (!gb_i2c_expected_transfer_error(ret)) {
>  		dev_err(dev, "transfer operation failed (%d)\n", ret);
> diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
> index 820134b0105c..6a35c78b967b 100644
> --- a/include/linux/greybus/greybus_protocols.h
> +++ b/include/linux/greybus/greybus_protocols.h
> @@ -678,9 +678,6 @@ struct gb_i2c_transfer_request {
>  	__le16				op_count;
>  	struct gb_i2c_transfer_op	ops[];		/* op_count of these */
>  } __packed;
> -struct gb_i2c_transfer_response {
> -	__u8				data[0];	/* inbound data */
> -} __packed;

As I said before, you can't just delete structures that are exported to
userspace without breaking things.  Why is this change acceptable to do
that?

And how was any of this tested?

greg k-h
