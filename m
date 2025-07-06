Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1E6249E5;
	Sun,  6 Jul 2025 14:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751813768; cv=none; b=TEYtOAS9Y/yZydMLOqt43sza8jf0chx12806zV/oPtMp9tT0eX3OrWMrmfvT9+7ZRurAa+Qkx8fYOw6mGw5k7HGtUjFTgzgf0+6K0SASQL1wjhU5mobI+vRr3E+N6ISPjzv66R7sv75jHDAIo7OBz7amibunZp39bnXsO2VZ4Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751813768; c=relaxed/simple;
	bh=t5fVpQ/gUUAgdHPJ9lykwXeuOHra+H85ZYEr2642rfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bPG0rgnAqe7aAlv/xsN+L7NJ6s8pf3iG4YkMcU25dtKZz5X4KcOOIgGQWMWD0f2kkC9eYrZi9wDMqVR4trC5xpZZfEnQVpxxF3O8OCrcwJOb1Cj6yxTuQ9rX7GEQx7aKnB50mBjGJFJAnVxB8plIv4D9UX4v33MS98BkiGXo9eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SwL5Hdm+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SwL5Hdm+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A756CC4CEED;
	Sun,  6 Jul 2025 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751813767;
	bh=t5fVpQ/gUUAgdHPJ9lykwXeuOHra+H85ZYEr2642rfI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SwL5Hdm+Agki0JJzw86IoDLpvy+e/KlWVLPc/YR47bOODFcJoEXjXBsoCyPUc/tea
	 7wwwOu7tCHflAqXOtQhYbYPUZuGSqQTt47fjTwoEeSCKuqvczDzwcLBFxxTbqTmA7x
	 OEEmkGOZgXrBHOxjZ88aWpmf4yNd4MUcLudQwctgyYTEMshG7/vn9gQL2Rgc91rehf
	 A/7R1kiSVO4xh4jODW1+8JcPGU3yTZDbIiWsLXDXhLhnyLW6nANx3RKj9eO9EOHSWM
	 qxuwtjd6KkPBngJv/YS1gqWo7+tGJ4/8ZcnRmMTMu+30XCzDTpdpDgeCSd34hkXKj3
	 Fp/+zJ9E4Ym0w==
Message-ID: <b6666720-73d0-47a9-84ab-bc5e0fa16044@kernel.org>
Date: Sun, 6 Jul 2025 16:56:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4 V2] Staging: media: atomisp: i2c: removed redundand
 debug message
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 Thomas Andreatta <thomas.andreatta2000@gmail.com>
References: <20250619084420.146151-1-thomas.andreatta2000@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250619084420.146151-1-thomas.andreatta2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Thomas,

On 19-Jun-25 10:44 AM, Thomas Andreatta wrote:
> Checkpatch fix: deleted `dev_dbg()` printing the name of the function.
>                 ftrace can be used instead.
> 
> Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>

Thank you for your patch.

This patch is obsoleted by my recent gc0310 driver cleanups,
so I'm dropping this patch from the queue.

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> index d35394f1ddbb..830a38086cb8 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -584,8 +584,6 @@ static void gc0310_remove(struct i2c_client *client)
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>  	struct gc0310_device *dev = to_gc0310_sensor(sd);
>  
> -	dev_dbg(&client->dev, "gc0310_remove...\n");
> -
>  	v4l2_async_unregister_subdev(sd);
>  	media_entity_cleanup(&dev->sd.entity);
>  	v4l2_ctrl_handler_free(&dev->ctrls.handler);

