Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C871DEFDD
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316155; cv=none; b=owy4qakFso6jM1dSyzip7vXG9bfrjy8zaSu4GaPxxvM5+Cj/2SzgEmRUkLS4iHy4MMe0O05Ce2XAzBE1NU+25Tde1slm/oouG273a/uJ6iM+Z9CDZ1XtbtCKn8A3mL9tm29s0tAFPE64vANqEepQNYlhU4aXZJgme9DWC+jQdGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316155; c=relaxed/simple;
	bh=r6si7KxlGkOoATAg7ilVznuwbtqgYzdFtBjWKcTszJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZEkp4L/zhPIFDRKd69i8sTOhbb0J6w1ULW8/buIK36ltYX0WTAO93l1So5sE94mtquCWU7UWgRnWAZveWd3/bUfDtBgDaI2XpTtUiVK3Wvhx16YXX1rv/TrzjHrDuwNWvvgIhxw9pm35hzV4oOkuTYQSE0cww6QyIfD/52i0YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FPLeId+N; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FPLeId+N"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so4987760f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745316152; x=1745920952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2lwX66HK8eTxAxJezuea/KRjoMND3umFRpU7IdR4G0w=;
        b=FPLeId+NVXCtZvebuQRmAzc9kWvDpITGAqw+N9z7hTXK49DrYxUgREe2UNtbenzvP6
         XLxg2CROL8Iu2VpTy8POM2xXlfg+FcLTOd7MdleIfP3OVc8ROjbhx19xSMfmMtG15JX7
         ngPqizDJxgLBbJOrF5udCnrsw/Y6L07+v0bcjasEQ0oS9ca1YWgAcYilZpMrGBfTYkBD
         BlzplR/PXXXJdoQYjbZwc3qXJIL6jxXvyLoHpuuyPVRvjxm64BsuZ2g33qSABpTgTPrf
         1CnKgsceMR6jPRBqgWt6DuNn5eYW1TzMO+p6JLXOd5A6pkZsV6icZ+ipkNDI45cK0bkd
         G6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745316152; x=1745920952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lwX66HK8eTxAxJezuea/KRjoMND3umFRpU7IdR4G0w=;
        b=FPGufXauVPiYQjtb1FVLUaY3I7LBV5/UpQU/J+6um+uIBkPHnJu5gJpyOuTrcdFgse
         8WfgJJgg/vkQXQKknpIQuid59xYsWW7hlRJ1pvksLnCnnCIwV7v5LXgvOZhuTC4kBbLl
         8isV5xdV6m9AF+wkYb1yecgwdMAlXjuO6R61MZlxMIwbj6p6b8ojKAdRofkigNbKXhgR
         NUSUokdGjoitndyFjef4RFcwKRA4aXlAdf1xokorU7w2DxCEl5x64U8bBTWH2Yjp9aag
         BCT8fZ6yGYxqU1Xoi/jLzRQC6fJP3plJtj3ZZEvj2msF0DiR25B+3oM3o7mXygGLyFwr
         7MUw==
X-Forwarded-Encrypted: i=1; AJvYcCXdAfOOt9mC1QDjJ2cKXOc4uBw+suZPH/mJPTHwV3FnEXDl2Ps8iKA78E2U9mn6NoWn2049soasbHyBxFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhNUQ/c+DY7Tph7CxrS983mQEVc3RXefdi249yWz3U4YPzT/GR
	/PhT+Cj6db0I3j6mjaBGC3c0TPfQM4VRC1bAYrrC3gHnBPh4vv7sqEdU7dUe+tA=
X-Gm-Gg: ASbGncs11qetsJAtWn3fkYiVa4+tVIXyI8kJn2NIbn04Y5DH5guIbvVfpXqFqrNIMHU
	nzi/s49YTMXAJP1vElzW59OG0lFsoF4Hz9CGRq51iLY/saf/S5o1n/C/gtoS1tQcLedNQLjV7Bs
	q/477EBiTqCWHCKmJhREtw+23kW1TdDWWXkuhiCLPevl9cPOPRrkSaG7qq8ux9gAQYMTIcZqdor
	UWYuO+q/Ok4CKJchicQqz3z5m4qLAaEKPMSlXSiLHQ02HZN5dHcRv1DXCD3HmDWKwDrGWXN62H2
	oqq4wI0fsVNTuO1AhZvvCPmwZceg+8fsFWTxX0cJzBAvMA==
X-Google-Smtp-Source: AGHT+IF1ZkfPi2gJ652NKkarwIY/ypcd5ApofOa/AQ+PxbuhRTF4pbWiSN2ZlQ7ALpKKQfQcvtNEOA==
X-Received: by 2002:a5d:5f8a:0:b0:391:2bcc:11f2 with SMTP id ffacd0b85a97d-39efba2c924mr10978756f8f.1.1745316152148;
        Tue, 22 Apr 2025 03:02:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4406d5acec8sm165056665e9.16.2025.04.22.03.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:02:31 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:02:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] staging: iio: ad5933: Correct settling cycles
 encoding per datasheet
Message-ID: <ce0c0684-2f5e-4e23-824e-8bcad56e6b0c@stanley.mountain>
References: <20250420003000.842747-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420003000.842747-1-gshahrouzi@gmail.com>

On Sat, Apr 19, 2025 at 08:30:00PM -0400, Gabriel Shahrouzi wrote:
> Implement the settling cycles encoding as specified in the AD5933
> datasheet, Table 13 ("Number of Settling Times Cycles Register"). The
> previous logic did not correctly translate the user-requested effective
> cycle count into the required 9-bit base + 2-bit multiplier format
> (D10..D0) for values exceeding 511.
> 
> Clamp the user input for out_altvoltage0_settling_cycles to the
> maximum effective value of 2044 cycles (511 * 4x multiplier).
> 
> Fixes: f94aa354d676 ("iio: impedance-analyzer: New driver for AD5933/4 Impedance Converter, Network Analyzer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
> Changes in v3:
> 	- Only include fix (remove refactoring which will be its own
> 	  separate patch).
> Changes in v2:
>         - Fix spacing in comment around '+'.
>         - Define mask and values for settling cycle multipliers.
> ---
>  drivers/staging/iio/impedance-analyzer/ad5933.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
> index d5544fc2fe989..f8fcc10ea8150 100644
> --- a/drivers/staging/iio/impedance-analyzer/ad5933.c
> +++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
> @@ -411,7 +411,7 @@ static ssize_t ad5933_store(struct device *dev,
>  		ret = ad5933_cmd(st, 0);
>  		break;
>  	case AD5933_OUT_SETTLING_CYCLES:
> -		val = clamp(val, (u16)0, (u16)0x7FF);
> +		val = clamp(val, (u16)0, (u16)0x7FC);

We have a fancy clamp() define now so the ugly casts are no longer
required.

regards,
dan carpenter

