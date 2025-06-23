Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2337261A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750656221; cv=none; b=JOpZ7jh1mav1ppD8/LmaXR3vjxjjuTvuW/BzAi9lbPA1n4y0116J+uO2yvpcpI6KrKsseueqxXKMW3GjIZLOWdUZpdTly8c0/92zFDraBYGZCEK2WHnYum0G1wtmlUYJBYW2KtZjhTGs4FTiUGbXnQzgJzrFnsBjpafltHvh5Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750656221; c=relaxed/simple;
	bh=be5NMSBf8yses5ej7pxibO8UVq3Zclz8Z04ww4Jagnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQcZudaIVb3fNquJbNKSWwmFfZwfSS59pqxwWtlF8JIrRCMzaWUJ55l+Idm8l7lcYkkdYWyRBzynutoiKGhW5/8KX2UIoXM/et6w1DyQ+mW8LrXbv1Y+YM+ombIAO27Eug3b9Fel5163UVd2C1PwEWgMUpuih/AwYdreRpgXMDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DMT0+4m7; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DMT0+4m7"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23649faf69fso36678705ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 22:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750656219; x=1751261019; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xQwgugPucFRFD249QbpKhz291C8PnULHkQRIiUmqth0=;
        b=DMT0+4m7xZMAQ+QnXY9Jw0XsdKGYrHe0ZlYSjZV5PMr/A7cr5LSldEb5CLNCjCu/o8
         jp+3wsoezTDXhvTfNPhwB2jo1/6YtUuWN29MEhy17DPLIPy247GnUXfOSaxjo5hhXYJ8
         RUbg2l8RI7F7ZJJGyfBPxCylv4xo3JsVYSIf44ucDb+dgeUpZ2RuD2e+fV7mpDtMDFCb
         VNwKokxlxkcjJK0hmwg799YWsAiYU8A+p17Z44xXsOHmTetjSMvH8r4sgtD1CsmAwj8B
         IImL6qUDk4RlyjA0psKf0CgnvgPPf3QwoUsNQY7Gf0NXsFchH4E6dJUiLVs4cTfUJ1nF
         2lyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750656219; x=1751261019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQwgugPucFRFD249QbpKhz291C8PnULHkQRIiUmqth0=;
        b=rbkDV0jC3dnB20Bk6pkNqJ58fbFTeMHrvVqhw5jh87e425a5zzKCZF4hT8i/r6lUhO
         TomY53dZAOgdsub7rTTG6HA99ED3peI3D1K3czxPgPcsLVzjx2a0qv9oFhrdeku39S7y
         GnrDV4X+KKhMSCXltGBjTTEcsHxdHPLJEy+2MfJaBXl/pYuNwSk2jfrnIfjWSyYbKDE+
         3yP9D/uM3mnl7h6pdb6ZvN+tY6fUSfHlbCjQk3lyQJtzAGvdKAGTdTsAjH/SOP6P7O/W
         wCWxb3ZwyY4gPm4d0RVdtQRt7pIXjlkhDsswEYmwZHzrvtQEOFw5fjk9d3of5VBZ9gqH
         nw/g==
X-Forwarded-Encrypted: i=1; AJvYcCWZ3tfXswo5fLHko9ix2gMeit1Yr9KejSQx5iv0ajqbgDbc7JfIwuUz46Du7sDOODy8xsz7bG3NslyCvdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpdxxoTbotuuMDqtk15BVl9+jjcW0cf1Xij5qX3BoHy1jWD7xL
	6lYOfi+4RiGGmvY0BnoUeK0ls0BiqjL9IgX2VkzJeURDMDL6Vkvrx50gPY96uVNscOs=
X-Gm-Gg: ASbGncuEl24z1UFrGxJy1rmJZLHW8R/AmVCg4O4yAsl0kEJ5V8agvhwssvlYj+LvQyE
	jyAxnb+5OiD9LIprfazYbT2k/KksiOKY2xeI5ccl6QkKejS/m9f/nJdwL6x/mOxaH933kA/0J7H
	v4JiwS/s4hRnikylSN4s0dLVkmd4vJIxAFxmjbeFnq8E6ut3lYhOBDNvZoNUo5ExMg5rsmMZVhd
	NhwTS+ytswb9MooQPhrvfxucrx7UdGQDm1oK2Ud8IR3BQguL9hsCYFqZcQDMqTewIe8iqdF5Cuf
	+2KUe11knxqstSOW+RM0NHIbpDHMeMRnDo9A2M6rYMu14En9yavg+dfxl1d1F+g=
X-Google-Smtp-Source: AGHT+IEH9c5WyKk0QMC2mHqfjueodPhOXf2kHZH/3FnWS532QpnCQvmpx+97zKTnLNJSNxf0AWaT2A==
X-Received: by 2002:a17:903:2285:b0:235:eb71:a386 with SMTP id d9443c01a7336-237d9b8e9d5mr159749225ad.50.1750656219135;
        Sun, 22 Jun 2025 22:23:39 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d873e6f1sm73016605ad.247.2025.06.22.22.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 22:23:38 -0700 (PDT)
Date: Mon, 23 Jun 2025 10:53:36 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Jacky Bai <ping.bai@nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: armada-8k: make both cpu masks static
Message-ID: <20250623052336.d7lllm64yfyjfqu7@vireshk-i7>
References: <20250620111459.3366195-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620111459.3366195-1-arnd@kernel.org>

On 20-06-25, 13:14, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> An earlier patch marked one of the two CPU masks as 'static' to reduce stack
> usage, but if CONFIG_NR_CPUS is large enough, the function still produces
> a warning for compile testing:
> 
> drivers/cpufreq/armada-8k-cpufreq.c: In function 'armada_8k_cpufreq_init':
> drivers/cpufreq/armada-8k-cpufreq.c:203:1: error: the frame size of 1416 bytes is larger than 1408 bytes [-Werror=frame-larger-than=]
> 
> Normally this should be done using alloc_cpumask_var(), but since the
> driver already has a static mask and the probe function is not called
> concurrently, use the same trick for both.
> 
> Fixes: 1ffec650d07f ("cpufreq: armada-8k: Avoid excessive stack usage")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/cpufreq/armada-8k-cpufreq.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied. Thanks.

-- 
viresh
