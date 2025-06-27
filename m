Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D49D1C860A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750998747; cv=none; b=aiRMVIS9KP0McfwsnhI1b8r2uFaOvq/eLsmPRlyngPNmkfE8iuyMrJt87X+BjP7rHW6zFqKXBIXrAahO1Iq5hiS1BdgmSgtcNeGWRWkeLYhY+VcR2znX9t2BZeLGQJxwiWlv0mg8rGLwVXQiIbgDukFAHUyfZo4alS2rjl0AJl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750998747; c=relaxed/simple;
	bh=v+42VstUVNPd2mezC8iuO8gwNNt9a6yuYkzSDlyNOJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZRqfMhc8+ipTbKG8PWHpipTi+c1vbJiopLrVdMpfw3edWMR74oiukDrZpyPaGXliwRMQsjCBvjumdHC0m8pflxnnGrQcovTifo7JQTUQeWkpUhFqAviAmy+EjMnnIT+A2mDvDh5UXzNV5eS2VykK4bozC9FByRJ3feREP9VAO7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RW4L2mvJ; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RW4L2mvJ"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso1744394b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750998745; x=1751603545; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Et1vKrANEWd1oLPdiIp7rldoq/gXylaA1yJpyMaOcf8=;
        b=RW4L2mvJNwHOs0eG0IS2BOMXmejQTJNxSRGD7LHHivfRGniaeE7W0eCoegiQ/SlGW+
         sx/j2EGg3nHuo7MIcy4r2tdPYEbEWlaRTGcTBxhOm103W2efBnzcvOjL/Jamj+46hu5C
         32fRo25FztWUMeHAJfLHxw0WuufHI4K/HPRY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750998745; x=1751603545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Et1vKrANEWd1oLPdiIp7rldoq/gXylaA1yJpyMaOcf8=;
        b=agB5HKKGz1wLoRrulY6CQHzOPWyMC8d0Bh5rrHmfWUtwwPX/QvS9Hjoty33qD2g4iF
         nxFRrbOW1d/jUGqgUOfsr37kHigBCPvqtMl+cE29iYp+zv4EyhBs/ik2EyLU/ymi0Uul
         +jphS1ONsdFFf5xXK9GauARufDQ7c3dr4lyE1pJ0AsilEzUkh8UgfHo4UJgATugbNXuZ
         eUvk/6cxGFGWc8gq3NOEthO2WXd44ljb81bG9bI7nqajOQfCaa86wvZtFvVgZg3qUFxE
         LPVP2XE2+tJkstp6K+IpW9DRNdp5cGKEL0aeeBSMi0LmhTQGTyvQsrHeXjCbEiz/bQJk
         gbBg==
X-Forwarded-Encrypted: i=1; AJvYcCUgXHbV+4ClzL29mTZq8cUC/RRQgd9pv2HJTBRpH2Cm0CflFUKGWLmwtHzPkOokJDug7NplC5XsQEOlh6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpnIbX/pqpja97znXereokIXK4F14128gymQSVgZ/CcniKCSJg
	CK2NCLQnofJPaRLtmMIBQRE7NRjVuSTGV8lbBJLEG0WWpFNPQ+mSSIJnPnVNWb0jnQ==
X-Gm-Gg: ASbGnculI3ddnPdNWeBKGFri8qejvGzJLX4Q5+RvjI3me/pmARnio/ZGnbttNElUUll
	DXuHmt5AEAqEbJCaH4+uFdDs4qzHqybNxKxZjM2opyxSpCtmH7J09orYkSo+pKFJPjFqQOAkcdV
	6/vWeXikBefviFOLyWTFJeKpelTjTWBEAR1ytGUi8z9ODZMA2esuoRQb6sgkIMtBC1kgVTTnUCX
	h+UlykiSwPrU0CLAExvBeEoJIO8Wyen6DEntUgdt1Q6fixkn/ev4EFBxwQ5Jhc4grZOnXq4sylX
	ACOFWpzw4Z1mDNWFoZugrqZJaErMPx3bbGOY4IPNkrekbymz99oOVzoYmRAFA4jr3w==
X-Google-Smtp-Source: AGHT+IFsUUHvXLkVnFLLwlY36+r3+Fgx+TFevhxTOC4GjFZoOrSNFaMyU9W5wFF/BGs6YIpTwbjcOg==
X-Received: by 2002:a05:6a00:23cb:b0:736:4d05:2e2e with SMTP id d2e1a72fcca58-74af6e60f24mr2433036b3a.6.1750998744783;
        Thu, 26 Jun 2025 21:32:24 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:de1c:e88f:de93:cd95])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af540b37bsm1190315b3a.24.2025.06.26.21.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 21:32:24 -0700 (PDT)
Date: Fri, 27 Jun 2025 13:32:20 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jens Axboe <axboe@kernel.dk>, Rahul Kumar <rk0006818@gmail.com>
Cc: minchan@kernel.org, senozhatsky@chromium.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH] block: zram: replace scnprintf() with sysfs_emit() in
 *_show() functions
Message-ID: <zzscki3fdg75nl4gojsqo7exhwodt6sm66avcwmmhnz5yvc5sm@sld334al6udp>
References: <20250627035256.1120740-1-rk0006818@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627035256.1120740-1-rk0006818@gmail.com>

On (25/06/27 09:22), Rahul Kumar wrote:
> Replace scnprintf() with sysfs_emit() or sysfs_emit_at() in sysfs
> *_show() functions in zram_drv.c to follow the kernel's guidelines
> from Documentation/filesystems/sysfs.rst.
> 
> This improves consistency, safety, and makes the code easier to
> maintain and update in the future.
> 
> Signed-off-by: Rahul Kumar <rk0006818@gmail.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
