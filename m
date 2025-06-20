Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4441E0E0B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750391751; cv=none; b=MYzYXV63S8fNO74g0TSfQJeGciDNta2gI4OaLTLtNPWMw6MahPLpEB+fOmI4sqgvY9PCAqKzQoHSwpsodhjNlZlm2pJcXKqbDoJhjXp0LUdwumaQc6QmquKzGPErjHz//YquEt8ZaI/yPbeoVHkrpaC4hhprHXEQ+DVYnXxPn4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750391751; c=relaxed/simple;
	bh=LY8ANmPaWU03IOjkEPYoZ2pfuLTEkXi7k0X/MjRp79o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUiT3Qi4zfSFOvnxiZqV8+ZQHqsEUquglzIQ3GlNp5h8dyZdw/SY0EVvRWyun0eGoDOjgyjnth3HtMkcJntZnP8epvSDbi2TSlb89Ogg+tuT2Ji1/iyH2Si/VnSCfd0DnvYFQizBVw3uHGRPVq4Yrlq6RBahldf9DdZukcY3Vdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ksehFE35; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ksehFE35"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-400fa6eafa9so950640b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750391749; x=1750996549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9ygpRy1yhhvPXt3ON6IStdleo1cb/x/nqaI0QI7Xp8=;
        b=ksehFE35g7scQ7JurvjhwSZTU8uma/OdZHPI3DBSf9M1a79QH+121ek3OaSMjk+j4q
         tHBzAybwosov+2Tr8wrYEpQkU+Gtc8WG5k+H9dmjz9y2ww5iMGbAdtzdc6dnxMN+GePB
         hAZltC5W4dE6XAz/6oSb1KQnN1jh7XhWQJlEis5buX5+tBIvSfE9LWuO1FFS23/GX0HV
         KP7Fa2GZGJoDLSKcO9e+YTetg3USdCLacep35X/XRKRV7GMp1vki4MDYm0c/Xj2ypX7+
         NEcsg0BBN/l/bS8qtl3PdP9zZywuffiXYWc4d5eN70T21dvIeHtnAy3cUHdQTKUagT/9
         3j6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750391749; x=1750996549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9ygpRy1yhhvPXt3ON6IStdleo1cb/x/nqaI0QI7Xp8=;
        b=utF0bN9zt0sWq1Xb/+NMV/b+xkhjzd+7AQKdhOCrENVBKuoGS2tMVEfXIvRNVa1t8r
         w9GBdWiP+V0guokWZti7l6zpYJBwXykpKbFwMm5rk9EFzam+ub1fj4AepJrejhOf0lCC
         8EOUW7SgbBQ95EdjfgB6wS+VBj5T++0tXuBG43zOlnHo7KPQ1F+TLwdpnamWeS2QlPb/
         Kg8cXURMQJ01rHlsYMygHVktoIwWtYPLnsGui0fulsrR277FxHumfS1gptvHL6I69xJO
         +qVoFjw1AupApcSLLJqZFJt438XHaZl8HKU8xNvfALWDkG2i++nWeS/x43YHAMwpNAuw
         uE2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVY9K5rdDZyDH7g2Iz5CGuou2dz7HmArh5EM2forqwS/QSZe1XzY6FVnSFlstILKapJCQIvz3QWCI+iQ6E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjGyIG9m/2TkrqXKr28WCV5nRYYe8Ig2in20qr94wCpoQX2rAN
	m+PySsdq1G2OER0RomcFb4UMPhYueAxZceVc0kW32W1HGh7Fo5zfgaPhErdTy40JsLg=
X-Gm-Gg: ASbGncsEmW7MdZNaqMw/1Dc1pmL1BKC31rrvviMQjX2Bu0VsvWLW8bFiCIhK0eyY7PN
	zyWJvdBwsLZcSlEpAHjETzDfxD8D3B2n0l9+RMLp1qrjxqRSQ7QqNoR8aNfAy9pPnTUkH4dkr31
	3xYYc745gyA8MA322/66ndXWOsJR9uJfLjUCI9GmuQAryFAgvJwBFHEimnwbldSBuOWycC4m4NB
	TdpiKb+V3zcTN+Pa43y7b7qvfvjed694X5d2vR9xGmq0wkjBkYtmZsfiJvzqoM7TxjYd425iKsS
	jD0LHeha8tTRSc645FbqEkifOWRJVUPTCxMNYj3/cvFbkDkKF10QlxvBYC+uYIb/xNx4lw==
X-Google-Smtp-Source: AGHT+IFpMqMfL10VDeZnAPZWqzBUfFVLrNCqWwvVeY7CBAKdJ4F2IHl6lMhC8ceeQFXXdaQcmdLn7w==
X-Received: by 2002:a05:6808:19a7:b0:406:6d79:49d2 with SMTP id 5614622812f47-40ac6fccb21mr1032511b6e.26.1750391748683;
        Thu, 19 Jun 2025 20:55:48 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:67e2:ece8:b2f5:738f])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a908bc982sm193555a34.0.2025.06.19.20.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 20:55:47 -0700 (PDT)
Date: Fri, 20 Jun 2025 06:55:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Chuck Cannon <chuck.cannon@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: bus: Add pm ops
Message-ID: <8a7e6e24-5ab2-434a-ba71-7b1b4f74e9f3@suswa.mountain>
References: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
 <20250620-scmi-pm-v1-1-c2f02cae5122@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-scmi-pm-v1-1-c2f02cae5122@nxp.com>

On Fri, Jun 20, 2025 at 11:37:13AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Take platform_pm_ops as reference. Add pm ops for scmi_bus_type,
> then the scmi devices under scmi bus could have their own hooks for
> suspend, resume function.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/arm_scmi/bus.c | 45 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 1adef03894751dae9bb752b8c7f86e5d01c5d4fd..2d1ef73cb6d39ac611afa5d0008c46515e297b93 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -323,6 +323,50 @@ static struct attribute *scmi_device_attributes_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(scmi_device_attributes);
>  
> +#ifdef CONFIG_SUSPEND
> +static int scmi_pm_suspend(struct device *dev)
> +{
> +	const struct device_driver *drv = dev->driver;
> +	int ret = 0;
> +
> +	if (!drv)
> +		return 0;
> +
> +	if (drv->pm) {
> +		if (drv->pm->suspend)
> +			ret = drv->pm->suspend(dev);
> +	}
> +
> +	return ret;
> +}

These could be done on one line:

static int scmi_pm_suspend(struct device *dev)
{
	const struct device_driver *drv = dev->driver;

	if (drv && drv->pm && drv->pm->suspend)
		return drv->pm->suspend(dev);

	return 0;
}

regards,
dan carpenter

