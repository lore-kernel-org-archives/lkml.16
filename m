Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA40D22D786
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 10:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744022211; cv=none; b=uIjBXCVjQYGLnrnPj4Eq9Qb0+P/G46OhAHMUFoDWE4yL3Cc6fWhbornLUupmLXILxWLVqIWWXxZC5PYerob9eWFIJzAwKXDIpMG5NqEml3VHNHoBfh5yZBUTpb9IyvURlsSUwn/kZrwwUkNr1qFBjlXH8OFuC7Rtt6evgoVZe2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744022211; c=relaxed/simple;
	bh=ni6IR3VVH+J5lTXTfn9v5vOAIqgN8I9n39A//E0LZlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qp2IifiiuL3giTxy/HCyNuHRG5vPWBbm3qNFnd4VywQczQ01VPyimJm6aVjXPqp4mrbM/u8g8wl95tlvh04wqfcAhH2IHTWn9b5HXvLZeY8A7x2zJp2yo86tB6/gyQQgDb6NlzyzSD3MjrHMhldR8y73WpW3Qz9kS1xMft3gDB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t23cdK4I; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t23cdK4I"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso26862785e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 03:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744022208; x=1744627008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lkz8o4FnYCwXIT3qeUpQo7ZAELQRWkaKo9c52y7S9Ec=;
        b=t23cdK4IoI+lmheBOg2uhsSp9fa4Nzt+Y4jlHFXA59Rd1At7GqtIc4Inll4LGKGTUV
         VrANCAVPuokBSZaS61/A404fzsxVtsa1lvpR9NDh0h7Mgqd2WnQOPf+wVlBwgwW7gYPM
         uSZG1tY0Bk1VmzcLOyU2tr2KgrEptV1izmz9nAoOx2mBE8X/5JNbfgkN+Nu//pReq2fv
         RskGEEa6eEKgTQfgVSES+Erq6eAcA2KTw+KZhDFZd2rW2u5V+UpamTQwgFYR7Y0tv5YT
         /uYl3vJaTfgLu8rptWq9TQt47Vagop1AVIwhueMu+Pcre3or6FrQJggq9FePUou1Yhjj
         Q5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744022208; x=1744627008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkz8o4FnYCwXIT3qeUpQo7ZAELQRWkaKo9c52y7S9Ec=;
        b=gE3n8uOrGmzZCF06xZberd8CeZsJNYTpx4VIhzSBCKBurGqQkfxrkmbajIF3QpAZFC
         2o8WQYQHc3gw4uKqmtx4d/B7Hd1kgqxxbP2EIT9anzvnnvqHKvEOz1u4pZDcGB/tZfLy
         8AhcU4OCM7veiXkvCydMlCKSQz3OcSdnF4RfI+QCR/at8Kxhzyhu7aEnPUF4bgU633eC
         JYY8kWledZaGuC1DMOfZONcVA28URVF4DIgF2krJHhh8JVC764sZY+Mf7WyPchU8UECn
         g2r4WfSmDiy2V/TrrpNrlevBG+fDEvRQT5beQruFivDAISIvDM8yATbgg5kjtwu3XD+d
         AsKA==
X-Forwarded-Encrypted: i=1; AJvYcCW9SakDU9jF+fD0UFHEVrI/d9bP1wtDBbtMa1GP6PapQpVnfFlaGu/lqYwcCXG440/RlG71Vw7DUtlb0VQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yymr9IG9GcbJiOgE1/I0EDmcyinrYIVLmzv8SiGmprgwTnDMWJS
	wpHE2QChpBMOq+bF2fmpmpf2C9/09wthLg83XViZbw/kU1adSZiKK3K9H+Ssf3s=
X-Gm-Gg: ASbGncud9BraOBGTG83fbTb8QFjXdOTAi00betcKFSDORbVsAHW5iUUWC0IvcQz9/vI
	exSmuSLWfcB+rRh/uv3Md+5QsEx2534potf3LvjpztURFjLag7V29ooZrDF1R2FWxcfFDuZ4+5N
	9SDWxA8O47mfdb0CXTxWnsUR25ihWUKZK3ydyKrrCYQMQWglyJxpAFzDrN31NmLhEz/9QWUyUoD
	p4i0hLrkVl7oP0/1azR51s/F3pIrecN13X9VDsudv0m7o4dUjeuJhEfNG9qooZ7vqoGiNfwO6eT
	2GQlE92RP8nnOYZ2nTO2ATBtUfKAuwqJPWdt7h8k+Z47LFUdsQ==
X-Google-Smtp-Source: AGHT+IEv8vqFS+kX0wYl+5l7B87oaGb6hLyIPnEnPHyMqegjosqervYGAJsmFyxB7uC4vui/H11Bhw==
X-Received: by 2002:a05:600c:1c02:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-43ecf9c3318mr94184225e9.26.1744022208214;
        Mon, 07 Apr 2025 03:36:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c30226a07sm11432592f8f.84.2025.04.07.03.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 03:36:47 -0700 (PDT)
Date: Mon, 7 Apr 2025 13:36:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v6] staging: rtl8723bs: Add error handling for sd_read()
Message-ID: <aa78d490-f0c7-4977-ae25-fe15d78b8d13@stanley.mountain>
References: <20250407100318.2193-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407100318.2193-1-vulab@iscas.ac.cn>

On Mon, Apr 07, 2025 at 06:03:18PM +0800, Wentao Liang wrote:
> The sdio_read32() calls sd_read(), but does not handle the error if
> sd_read() fails. This could lead to subsequent operations processing
> invalid data. A proper implementation can be found in sdio_readN().
> 
> Add error handling for the sd_read() to free tmpbuf and return error
> code if sd_read() fails. This ensure that the memcpy() is only performed
> when the read operation is successful.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Cc: stable@vger.kernel.org # v4.12+
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
> v6: Fix improper code to propagate error code
> v5: Fix error code
> v4: Add change log and fix error code
> v3: Add Cc flag
> v2: Change code to initialize val
> 
>  drivers/staging/rtl8723bs/hal/sdio_ops.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
> index 21e9f1858745..eb21c7e55949 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
> @@ -185,7 +185,12 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
>  			return SDIO_ERR_VAL32;
>  
>  		ftaddr &= ~(u16)0x3;
> -		sd_read(intfhdl, ftaddr, 8, tmpbuf);
> +		err = sd_read(intfhdl, ftaddr, 8, tmpbuf);
> +		if (err) {
> +			kfree(tmpbuf);
> +			return (u32)err;

Heh.

So the fundamental problem is that non of the callers check for errors.

To be honest, I had expected you to just return zero, but I don't like to
give out the answers to students.  I hadn't even known that SDIO_ERR_VAL32
was an option.  It's still a garbage value but it's kind of a predictable
garbage value and, whatever, it seemed fine to me.  It wasn't fine to Greg
so, yeah, you have to re-write it.  But now this is again not fine to me
(or Greg when he gets around to checking his email).

The bug here is that if you pull out the hardware while doing a read
then it returns whatever was in the kmalloc().  In other words it's an
information leak.

I think you could make an argument that returnnig zero is a good solution.
It fixes the information leak.  It's not a a horrible random value like
"(u32)-EINVAL".

The other option would be to go through all the callers and add error
handling.  So for this this function you would have to pass a pointer to
u32 *val and return zero on success or negative on failure.

regards,
dan carpenter


