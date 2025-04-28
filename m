Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0347A2356B1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 17:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745860012; cv=none; b=cteN8XGycX0r8y56BrbYkPpRsaFm1g7UzR869JkxCmv/GbQGXANpq7zS4BRGZ8eK4LXMcnC/J7FTKGqY/scWg28H5Nl8tTEB6+AadVihlTrThag4yV5Z0dhoRyEWmzWO1DjHMmwXkgjDQzJHeKTDkcJebz5UZjK7t7s0RHHS4sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745860012; c=relaxed/simple;
	bh=jfzsM62LzU24IAdPi6RiSZnE7tBTNT1DWjrm016n3/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qsdRoXhCHlUr4zYOczuTkGtAYY9KfgQj4qyRKw9o5KcXggb5Fgs5Ur8fw9WhVs7FWA4eJst87oWkI9dbzmFN7bM/JOg+VGvKxsW5j8Mz7NDz0rTAsZ9Nl89F40LB70vyCkZxqZagLj7Y8Y2zs/4AJcX7g6BRMkezM7l2AKb1xEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H80oZGU7; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H80oZGU7"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so34074795e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745860009; x=1746464809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ttAPR2nnzr3O+nZdkkXAqM5OCqtTBjn7C3XdJ2LYctM=;
        b=H80oZGU7iRhsnL1dqbU+Esu69FCB2XT+L7EefQ7d3hnYpV8jR5CBOxWZt1K5a/SNwA
         8s29NF67pz47TjRpO+vAFuFU2dnRPJwG3OxKauViI4rQQ0NUcFHIYUNePZZ7072yZ5Zf
         nMKHN0F7p67zGOrZuQc0z29JAvnMUDSmXU9j/hv79AhtBUL/DQUJ9yUhaDmoUiyFD5EH
         56FDi9zgzgcAsaZ8HfR5lxXAt4ucpwWoj1dvKuuuz0+PVo4+/4AehqPu5BJSKiy0l70K
         k0oW61XD6aJvYS0lUp4tCML9lLJvB3wJ9nRbtgHwc0Zw+60CjcP+iEKIkS95kHXGeYk6
         ekEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745860009; x=1746464809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttAPR2nnzr3O+nZdkkXAqM5OCqtTBjn7C3XdJ2LYctM=;
        b=MqrxQXbQCjNqSkPRIb7U93HYLrU5GyYDGkb7jV0NRlldcMtkBySnxVBT+kNvH1jO6P
         OLFG37J/4dqtU3hVwyNseMACsw1xcrCTsCMo6sm1pKjmrAQeHsbabJhS7FjV2Hh8uQFN
         7bEyqOhBHCGdFa3LNHBICVxqAtXZwlC2owzpoHVHdz7Nu+s3fpLEa4H4qE0coAKZaSsI
         qU65M4MDa7UB305KEFhcFydeEBLPDceAugSVsIf4h5tp4WifdIeMxfu7Jl3GHcgDM2zD
         jp/lokgx0DtgKKVtkEDdF8O/3pyYcSsuoZSLjKsDsyNkpyo3D690Yo47ytR1mEcwYExT
         OSRg==
X-Forwarded-Encrypted: i=1; AJvYcCV6hSyyXTbhURI9x5oHjs1UrxUqLTLtV7Ga+djtJVtQL7KXZuuahWNZQoDqLiUC5S8gU49VwrkIrRfIgbk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFoQe63/G3Wx5Jk8IWJeGdRtBB1QPsjTJUJ07C3VWVqpzIiV7U
	WBezz6gQna135oPBFvoRAx9GoDOluBILNf6/Y8Dd58AkYZEo28roDDBO303G49I=
X-Gm-Gg: ASbGnctdTeawnF3I4RZ16zfxfsXxk2CGlN89vrkTB2ewH+d9OIi6LRaK2WxvZP2fIZp
	Y2B3RI7z5MWbG4PqfdXvLRh3vCRH4m8AbRZihmY0kWtWIboKHxy+8deXLlIWJcVFm8Bh1OOKgpW
	xsZW4tD3Op1+N1qMX/3S0RpzPkNtmOGk6oPIamzq3ZCB/aQmNmnPkTjnkClcLUovwnfNdhcaruz
	u2D3iv0+N675rSGwZNTKaf7OU549uNYzR7f2ac1gCbyPrY6siqh8dABEADvPlrs76VEX5wPl0ps
	+vHqXuPIZjNPHlYuT2H/xj0tuHLXslqy9nSi+KJStRZkUw==
X-Google-Smtp-Source: AGHT+IFFtsUvOru4VFXTbio9Ytb7+BeHGQ/bBHpgQLhDKt8Mul1sfm/jNtuzIXtCpsCi5L7CbjPfDA==
X-Received: by 2002:a05:600c:1d97:b0:440:67f8:7589 with SMTP id 5b1f17b1804b1-440a66143f0mr133682935e9.16.1745860009202;
        Mon, 28 Apr 2025 10:06:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4409d2dfc2fsm160453095e9.33.2025.04.28.10.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:06:48 -0700 (PDT)
Date: Mon, 28 Apr 2025 20:06:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sridhar Arra <sridhar.arra@yahoo.com>
Cc: vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] [PATCH v2 1/2] staging: greybus: fw-management:
 Add detailed mutex comment
Message-ID: <01975294-1073-4263-a201-0f68781fbb6a@stanley.mountain>
References: <20250428160837.664000-1-sridhar.arra.ref@yahoo.com>
 <20250428160837.664000-1-sridhar.arra@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428160837.664000-1-sridhar.arra@yahoo.com>

On Mon, Apr 28, 2025 at 09:38:36PM +0530, Sridhar Arra wrote:
> Added a detailed comment explaining the role of the mutex
> in serializing firmware management ioctl() operations.
> The mutex prevents concurrent access to firmware operations
> and protects the 'disabled' state flag during disconnection.
> 
> Signed-off-by: Sridhar Arra <sridhar.arra@yahoo.com>
> ---
>  drivers/staging/greybus/fw-management.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
> index a47385175582..56725b711a17 100644
> --- a/drivers/staging/greybus/fw-management.c
> +++ b/drivers/staging/greybus/fw-management.c
> @@ -28,6 +28,19 @@ struct fw_mgmt {
>  
>  	/* Common id-map for interface and backend firmware requests */
>  	struct ida		id_map;
> +	/*
> +	 * Mutex to serialize firmware management ioctl() operations and
> +	 * protect against concurrent access.

"serialize" and "protect against concurrent access" are the same thing.

> +	 *
> +	 * Ensures that user-space cannot perform multiple firmware
> +	 * operations in parallel (e.g., updating interface firmware)

"Ensures that user-space cannot perform multiple firmware operations in
parallel" also is the same as serializing.

What does "updating interface firmware" mean in this context?  It's
not really even true...  There are other places poking at the firmware
that don't take the lock (so this lock on it's own doesn't ensure that).

> +	 * for the same Interface, avoiding race conditions and reducing
> +	 * code complexity.

"avoiding race conditions" also means serialize.  It doesn't "reduce
code complexity".

> +	 *
> +	 * Also protects the 'disabled' state flag, preventing new
> +	 * operations from starting when the firmware management
> +	 * connection is being disconnected.

Yep.  That's true.

I guess (from reading the code without much background) that we can
use the fw_mgmt_ioctl() to set some configuration options until
the FW_MGMT_IOC_MODE_SWITCH ioctl is called.  So this lock enforces
those rules.  You can only call fw_mgmt_ioctl() one at time until
either FW_MGMT_IOC_MODE_SWITCH is done or we disconnect, which
ever is first.

regards,
dan carpenter

