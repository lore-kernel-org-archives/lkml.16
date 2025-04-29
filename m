Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932C929DB79
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917898; cv=none; b=DQFMkSXA8PGVPmCDYww9rdNgpn6FW4wb7FxgovP6c6HQ7MpYYrmff7SchLfacAli4cqh+DtNnZ1dTU9QAFq6TIiR5M3rcPoS1/UrWvm9M0wDNj2Z9NoBLvDlqKgDHdRaD8IPCLDw3ZApvrJcWPQZcCEOCgZW0cKYtvGZq8RSaWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917898; c=relaxed/simple;
	bh=7AZhpTKOvLOyLiuuO3wDIpGhvpjUehddROW89GGvk0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iiAlSU+BQ0+a2NhtvlOGucuqPL4UxcFsbaqayHNYYJzdLJ8t14Sl86JRxM7E8zStYXI8hR8tHCCObHTfFO2vT5CWDyTzNUWvIqB6rDXyUn7oZmIdMOqQn54N9xIr249CdmabeFU+p1Y12F7LsZkPzAlY+DuEwona+2FH6VLM2L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wp09pEXA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wp09pEXA"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so38195545e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745917895; x=1746522695; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VxD4j3vDyteNdqJvAUUpvoMHVBnOf6GCTmW7JIDK78U=;
        b=Wp09pEXAHvAonYh5wBzLN2EEg/3c+VaofBQq3lTwWBcWfN+yk/14VKmBTo6eJ3XCid
         nWtJHDCPGYeNiwYkzhWyqOMaFVfDoyjmDQcRQ7VwtUYvuUOk3LraFOomMn1uoYSWHVLC
         liOa9/wuhukIPTVWu82bRyFAs1gwmfUqtRnJo/MMXem1BqmmCzEQXtfKuKkLHJH4F8Ul
         baLVs8B5Eu4i2UoX0hmPD7QHNDne8IOyzxt3sVJnNzSeVSrpp1gwC0GByrWQ1KtF9DhI
         +yChQHFgwAwSUdHm3XIbAjZrRtWuqfimv0fuuSnuMkGti0i6aR8THLUOnh5Gm9q654CS
         YqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745917895; x=1746522695;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VxD4j3vDyteNdqJvAUUpvoMHVBnOf6GCTmW7JIDK78U=;
        b=uvT4GmctvleY/KKoWn4MdG2RTEj74T1xtCkRsRKblLaVbFaJ1MkRqzI/Jb82aQqPn4
         Brm9LiJyCM8v96HwQY8PmHKeu9+y+kBhV8Bm2CoeZiQVlHMhwNGtvPg4m+XT4fwBjIjB
         T01u65cWN/d56gZ6F8Kx2EBXzbaLWv7k1hskpqzoE/iQjfKxf2C1159fj+FgHflQQD3a
         jFinsF7DWePt2ucI2Peq8d5JgPtSsoXKWUoqtql9tnaPJ6itUKuL54h+zYEyln3fPcKr
         vaX8Pp0anLN3QDA4Pwm6PEkNhuwKHoyFEs5LU8aY5w+YaNwFzbEGabzFT44Ft4SLDGxr
         cYSg==
X-Forwarded-Encrypted: i=1; AJvYcCXc6AMUO4K2mr56LIfnPQlLdF/o4+9uEjqBfCBeV4tJi6A2iyJyGCPyJa4xXrFi4/3sHZ64Vlk/7UhIF+w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1+yDJ69HVmKOxUmjIBUY3ik/FnwcGj4wSeQtAsFt5Mq+Swrrp
	WmUxldqX6eM8Y/pFFVHZC5ci0rOH8SoiIr3K9mcdi5SrjW2hTJI1YRCP8N/x5AZqmaGd9ObBMzn
	C
X-Gm-Gg: ASbGncu6YwYmdyMD9H5oRNERXq1lYTIwk6Ug4CclGj+m2y/zkyPqXwVAc2Eg/lJ2xVt
	h/jIBRb1YV/n/rZ9QoGLFtfK4T65BhXLjpnICjFyokg+NUbJ3XtTV2Z2n7z2FZ2Y27DrDAhFD2M
	uDRPtFAsUaccenkduK3/F6seTbjONeGkWZxDTbttbU9sdyUBHSoX68XMc+Xb/+oh9lycupiJIc9
	LfRnZibGf6zTVNoVMbAPshP+mzD5/06AUd0xjVWBQy6gi1VfH5LkdcbeC9GlKUVqxcllF4hOOp2
	RHX/H+LSnqET0kpF2z0wZx/sEz/bMso2RxcY3iIKuq36jclVpbqWcMVafvNSGoy0Xc/Lkdc3DxV
	/HIU=
X-Google-Smtp-Source: AGHT+IHt5dl4VzZgVx7VAtRzt6HvZYoeWhXSsoqa0MgpfyS8bg4NsVQEB378Uh/V/2NbR5QFA9Cw2Q==
X-Received: by 2002:a05:600c:870f:b0:439:873a:1114 with SMTP id 5b1f17b1804b1-441acb065eamr19783835e9.6.1745917894850;
        Tue, 29 Apr 2025 02:11:34 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ac079sm182483895e9.18.2025.04.29.02.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:11:34 -0700 (PDT)
Date: Tue, 29 Apr 2025 11:11:32 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Arnd Bergmann <arnd@arndb.de>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v3] clocksource: atmel_tcb: fix kconfig dependency
Message-ID: <aBCXxH2WUlgLDA4h@mai.linaro.org>
References: <20250409155313.1096915-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409155313.1096915-1-arnd@kernel.org>

On Wed, Apr 09, 2025 at 05:53:08PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Build-testing this driver on arm without CONFIG_OF produces a warning:
> 
> drivers/clocksource/timer-atmel-tcb.c:368:34: error: 'atmel_tcb_of_match' defined but not used [-Werror=unused-const-variable=]
>   368 | static const struct of_device_id atmel_tcb_of_match[] = {
>       |                                  ^~~~~~~~~~~~~~~~~~
> 
> Change the dependency to require CONFIG_OF for build testing to
> avoid the warning. Testing remains possible on all architectures
> as CONFIG_OF is user-selectable.
> 
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
