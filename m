Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A51101FF
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 16:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743869783; cv=none; b=ONqwKhPR0T6Ycq785HhUB/6VYyAD+NAvnSpX7D9v5KnoK3ImJSKoDDXnQea3I6EewcDZtvATZXBT7SC+s+ThE1uivxCYbwXXj1P6IHiyKii/XgGCvtvWf4GeY7Tl0wC2Tdl3PXMbeA1c/8DLDXnOIkrgcoDyeWbqGdJgWSzlPeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743869783; c=relaxed/simple;
	bh=f9fwwNv03NbODRWqKK9+JE9Q2mHw9mQ/GAhJTTxPSIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSrRZ0Lr3SWohJQUBiGcCarpUdoNti5Cn28maaZ0N8YdF6rvil1oLA9nZ03qYLwHy3s6izfLKcvq9pQMf2MyrCMT+jwOg1/r9ODfeJpWIplAnUvx0Mp3ZNR8ouYoWE3b2i5StQx4jwOgCAFTjEdrXJCKkp+1Jp83hGN9RRzPYyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u22BHMrn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u22BHMrn"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso27251325e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 09:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743869780; x=1744474580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kQA4y1FzPmhivnWC1Pgg4oxOyq8Cr4ueMJktDOHR4oo=;
        b=u22BHMrnba6WGRrZkRRO89X1aOUWuFyfznNTg8J/QoFW3mK6pTahHpXX1oBsRZqNWh
         P4+BCR+v40UHS+lPyq+nQjxsYcl/XcDPR8J+4CC1QPwxln1W4T38oZJmljIZhv5Q0cvA
         iXR66EHP7IbkmvBVIzUki72ahB2/iFzafiRCrDrd5b9rtFuJ6gqQcFmq2gXk00FzpvbK
         D0WS1vLUSPiDkYkje9gFLDIEOeCbqK7Ovo4U0hKqv+DeGLnPDLiV7u2E2tL0ZoWPEdCo
         QLYXFERS5lgndpeCRhIvpNsDN9ZmNre1SRd3QrYYaYVfs0hRznxIbrYXWF8j+CmfrMAp
         k9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743869780; x=1744474580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQA4y1FzPmhivnWC1Pgg4oxOyq8Cr4ueMJktDOHR4oo=;
        b=m7NJLthUo0bRjhtQ9CQaiX6Ob0gsTk90omipbeG8yI0vZAISQ0Yxda7Uqel8O2CGfJ
         btf3td2/uJ0x0EvMW0Kbb24HV0DC89iTs9fiPVG7eWXmFd409Ugg7OzE9RzRZnkkA58s
         EaOKi8fpls5lFiPys66+JbXm5SDtCwahWVS7soFtr9SCOybMjlMd2VI9TDQXa84ieTnc
         1/qktOsd2ewb3ZND5jwMt2aVuQZLg5DTJ67UHTgwdISIazjXm+FjmHkEfeA367rX7A7v
         8r0+BMs8QUAMKg7Rp+346wggLDIDFQYpgY4IS0IAhvqoUdf8Yh/6pRNb8UtMNI0oA2mO
         cmlw==
X-Forwarded-Encrypted: i=1; AJvYcCU1P5lPzi7Qab6p1NCq197IhVhzBcN0HO6UySEyqrjECX30whHdnMb4Ml/oGja81Rz8vQFbA7sEBFOWnZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt/e/3uNPbVc6vk6UiB4H0DtmnUS9oTnzwM/NgFGPf06kw/uzZ
	eepZcQKKEFhU/WPFWQwdQIuqwarF2s2iQISv3n+vM1vh1B6Jy41Xqq1HgVUzW9g=
X-Gm-Gg: ASbGnctkmS9O1Hr+IjDGjbyQsm2Prhke0shESHRE0t6eHSonad4mjSl95LFwyA3kXhx
	a+FiC3ljqdsp9yQrphnpfiY7JqbYMgIDvMMmEMR3ytCOsFUeJh42TZmv2W9r0LO0rcx1/a1f8px
	YM7f0IX2fMWgZUfenbHR0Yi+T3W5O3bQVo4b7oIQQXAcPg3cBJPl1UMrvh17LV1JnAaIl/K8Nog
	oEU1P+YSkmn70+up6Q+6h3VwIFoGjYPl2WwVpAkPBfsstE1OMOaPIdy8B2tq9mW+aMtugaYzarc
	rPSp3b+Dfr6KjlbdOJ7q8Kyy6L6CU3HFWy+5F7jHPOmSxfJyOQHF5lugEUz1
X-Google-Smtp-Source: AGHT+IHUbTxn+Ru3ccdmf6QiLK+OvdKs5Vbjv0pWdVZVEKvUSxpiHrDhuhyHXkzdAGYKFCiWEJML5g==
X-Received: by 2002:a05:6000:4282:b0:39a:c9b3:e1d7 with SMTP id ffacd0b85a97d-39cba93ca51mr6004112f8f.29.1743869780109;
        Sat, 05 Apr 2025 09:16:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c301a9da1sm7148016f8f.22.2025.04.05.09.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 09:16:19 -0700 (PDT)
Date: Sat, 5 Apr 2025 19:16:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: Add error handling for sd_read()
Message-ID: <8fd63a84-0fd1-4596-a9da-913e9c8eb110@stanley.mountain>
References: <20250405160546.2639-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405160546.2639-1-vulab@iscas.ac.cn>

On Sun, Apr 06, 2025 at 12:05:46AM +0800, Wentao Liang wrote:
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
> v4: Add change log and fix error code
> v3: Add Cc flag
> v2: Change code to initialize val
> 

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

