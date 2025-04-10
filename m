Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34331BF37
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744265868; cv=none; b=NdO3SNezZV62T5dgDhoKiAP0wr8Lrb1HUBAyJcqCNlTV0MEReuEOrE9qiw/bqI7Ts53Og5n1l39XWeTNMGAgH96XX+aRwxbS1f907at+8+BEem9u/IF4iWoULz5MzmDrKtKSJEahINVYpE4TGma/tJCGBj/Tf8Fdfw2kahtAjr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744265868; c=relaxed/simple;
	bh=RuJkx0SME0u7KQoXNcdSFo1kg/bczJSkO6Gfd1eD3s4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUzUuMaFl3WoDNl2GAgfmfRVWTQJi4CrED8qEtKH8iCPZZm07vJb1WZMy+V8v1w+dUD0Rbw3CDOuyy8Rf/aQ72e2qs3M4SnbU5tuBqGmtEs3GaWbignG8lWsMpl8XGF9glgKv4CU4ORkg1UAJ2H/1PpMF8Ge5N5/TDJ9g4iTHac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XYrE7tlm; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XYrE7tlm"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so262592f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 23:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744265864; x=1744870664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jYStztFya2y5gjqP02BNpybAW9yRhWvY1XlPanf+Ykc=;
        b=XYrE7tlm6lG/Qzu/17ww0gE1PiK3v9bUCi3qviV4EXV/+J7oehIVgOVUu+0I9iJd3u
         g2RHdU4HwaL39OM3HjqeZLmydpz/Kkxw6maFRwNVRHetlDmd7gLFM1ok6qBnrKvH/viR
         Amiky4lARgT1imbK+v4lJw3Rr2VIdM08fYsA/9esNG/Yjz15mVUir+gw0zbbRbQ5Rjmd
         9wo7tIOeO2nnueSSyX04CDkpc72hv9L7RsMt/xlZEY717lG4OgLdxFNl6TXxPP8ENih6
         rIq2JhowNMaZBM64vdo++5MgjxTkLrMSfxs2s/0wbTqM+srsld6/x6s74IV4SZ65I70Z
         d34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744265864; x=1744870664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYStztFya2y5gjqP02BNpybAW9yRhWvY1XlPanf+Ykc=;
        b=JlN2OCHRbj/HtvIzW2cbJSUE9+p8rFQxWnlQXbHqjgKsK6+DmZqhuNBQlKEpyV2laq
         CcDiU+NIqbcIov1ZhsZQ71WzHP7dnVrXS3c5Su0OwdcfxHiG/G2pZaYFoAfcJv79xvgk
         T+nyUKRD5V4vw0htRW0TMUAAh8PvLWDe3G5pV6lY6aFORuJc81BjLTrKfkdbsovnTjQ/
         rIKTnhewO5Q2JCf9V4FIF5QmgtKtNxQFi4WaPZUFiA7HLJMnG3/+eH8ceT8yPM0jxVvi
         aEmKjXvcZr2EGtY6g/CZjRsE2o19c/Wl1ovjQo5mvl4D8UbmjQEPYzsIemze7+FjooWo
         RoFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAWhIYVLGkzKadycIHo1+SY2H6wgqNIr7uwSwwWxSsQ70wL8MvXJrwPONyO17FRNifbmue6hFLvaeGzSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD6QeJLxRFN3uyb0p1glpZg2GA28ZsCsCzyoDJIItwTDngs7q+
	L3cbodCuo3mefiVNEMGlEruTHY1aeGHM8IGFHVPnFhbNFY8zsGDzWUbMUVWh5Yc=
X-Gm-Gg: ASbGncvS+L/3t3YbzjgfIbPIoe1y+KxVX+LxGuS86x3zWYNomt2o4PqLGMnF72e+/ox
	6IcP25RUl1DOPJ1GSAlf66chFbGHKFxCmpZvTEocP1Mb8vXfzs0atSh+FOHKQDNjfiS6pS/bkhK
	/iGElJR75ZdqCBsGgb4i9LyllcSnGgXy80iiGDCE7QqDYOjXtJ9MzhMolBqvHf4OzxsIvgFobnq
	RCClhCF+wdD+hIKd8FGdghla7/tC2ET1Cf2oqy0ILFQO37yEL9Q2OF5WIuv5K6N+esTMQzvs8x1
	9XfJDEjjhRD01ZR7pploOB4X05Ubu+v4tiq+oFdgIKHk/T2VFyXuJ6GZ
X-Google-Smtp-Source: AGHT+IGPf0mN33Z8VXMC6vHoEgIYPUGu+ettg097AataOUXjxz6bSk1dsUcrvcjBIRQZplQw7qTkLw==
X-Received: by 2002:a05:6000:18ae:b0:39c:2692:425a with SMTP id ffacd0b85a97d-39d8fd63d92mr746462f8f.6.1744265864279;
        Wed, 09 Apr 2025 23:17:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d893611d0sm3664353f8f.6.2025.04.09.23.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:17:43 -0700 (PDT)
Date: Thu, 10 Apr 2025 09:17:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Siddarth G <siddarthsgml@gmail.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] staging/media/imx: fix null pointer dereference
Message-ID: <0d496695-ce20-4774-8e86-4d5c98dc220b@stanley.mountain>
References: <20250409211727.62710-1-siddarthsgml@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409211727.62710-1-siddarthsgml@gmail.com>

On Thu, Apr 10, 2025 at 02:47:27AM +0530, Siddarth G wrote:
> Cppcheck warnings:
> 
> drivers/staging/media/imx/imx-media-fim.c:79:6:
> error: Null pointer dereference: fi [ctunullpointer]
>   if (fi->denominator == 0) {
> 
> drivers/staging/media/imx/imx-media-csi.c:795:27:
> note: Calling function imx_media_fim_set_stream, 2nd argument is null
>   imx_media_fim_set_stream(priv->fim, NULL, false);
                                              ^^^^^
This is a false positive.  The false means that we don't call
update_fim_nominal().  Btw, Smatch parses this one correctly.

> 
> drivers/staging/media/imx/imx-media-fim.c:388:3:
> note: Calling function update_fim_nominal, 2nd argument is null
>   update_fim_nominal(fim, fi);
> 
> drivers/staging/media/imx/imx-media-fim.c:79:6:
> note: Dereferencing argument fi that is null
>   if (fi->denominator == 0) {
> 
> To fix the issue, add a check to validate that the 'fi' is not
> null before accessing its members.
> 
> Signed-off-by: Siddarth G <siddarthsgml@gmail.com>

Don't resend because we just ignore false positives instead of
trying to silence them.  But if this were a real bug then it
would need a Fixes tag.

> ---
>  drivers/staging/media/imx/imx-media-fim.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
> index ccbc0371fba2..25f79d0f87b9 100644
> --- a/drivers/staging/media/imx/imx-media-fim.c
> +++ b/drivers/staging/media/imx/imx-media-fim.c
> @@ -76,6 +76,9 @@ static bool icap_enabled(struct imx_media_fim *fim)
>  static void update_fim_nominal(struct imx_media_fim *fim,
>  			       const struct v4l2_fract *fi)
>  {
> +	if (!fi)
> +		return;

If this were a real bug, then probably the NULL check would be better in
the caller.

regards,
dan carpenter

> +
>  	if (fi->denominator == 0) {
>  		dev_dbg(fim->sd->dev, "no frame interval, FIM disabled\n");
>  		fim->enabled = false;
> -- 
> 2.43.0
> 
