Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160C428DF27
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297436; cv=none; b=YgSTuVilsbQX1f0if0qU6HycPtqGG4ORbwBISoE5ulSxw5dkD2Awjqtjmy0V4BiyV83G9ETdiXdn8OmdHwV0kePIEHoXE0hX0P8izDNwx62BWgINJG9mlYcyPEJA3cfK/dMDegP+HxZmT4fs41Dhdp8KIaTPskKSYMoJMyv6TFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297436; c=relaxed/simple;
	bh=ZoN7WUrWTT1EvP6wGsSudZOTn/CrPVijo1zustyTmkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLkPg2BMIAU+14I+wm6SJx3of0PMnQjD13yQhTElx5/EWt8ZJIpPTJT44QaQ+F6zRe7/sTrtoSTmesdtUc35u4AhM5YpmHoswD0vx6Y4OQtTMNevBmi7xUb0A+UmG4wD+PuRqFAjITfeU9at94luL5Xd1ziIu4pRsaKs/+Gem+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CsfZpOqB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CsfZpOqB"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-441ab63a415so6635705e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747297431; x=1747902231; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+HLbkl6AZb7BGR9qo8J2ScZzZaqgPdxm8C/99kZcqbk=;
        b=CsfZpOqBP5DrcC0qcKlKIZYun/D5ZhMBjFn7SjzOFfkkKyzN39EkABYYXfg0B8+HlK
         kZhCH9KScdzYWeL98N0QrUAPiosBhKx3W22lEI6sdQP5bunX+GGljPmGz6qN6CLzmX3U
         jbxEHk7HxIw/KdnAccOLQXblLASJKef9l76QU8CM7Y7LsecZU6lZQif/h+L1ipKFql5Y
         0Oxgo2jMFjm8vOxgxWLtRRgw8V0FACqNw6S+X8GpZMlUkTNGZkiuaMJta+NlwW1f1eky
         SkpRUmpLyy4Do3p/l9rhgYhyNu0PrXz8fWlsyMmh2tUrkhMf0mf3blkU6a/lj3L/i5dX
         2rXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297431; x=1747902231;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HLbkl6AZb7BGR9qo8J2ScZzZaqgPdxm8C/99kZcqbk=;
        b=LThkzuwmnXMY6OUbDbtRIsC30pEHbaebr1Xi4abw498hPrSC0YXAp6zAbn8PK5cpzW
         oUDIhbgFI/uWv6OTxy+a5I8IyzEjoRTd8dbRaKqXFgbs99xtkLe+GSiv8jPVG16pU3vf
         PhvQ1S6c2AFYXMct0gNx9k6EtUosNrpFV6B8NTk/jDj4UE0EBpIF82BYPsOcQLW76vTy
         bzmj/qbIVg4+feBPkibxrJvJr4Y/qGka5T2Sn1WX68GS7x4cUA9AzaNx/wARWtkDKI5t
         dDL0+0DNFeS/2aGxwI2/Y8UyrMgqWFzv5egLu19Vf7LYFxu7PlTXO1VwSnGET/VfUdA8
         1HIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxd6hqeO8LwP/lovyYSvA814Xk3BraEdaoCyBgeLY527pxVTDwY8Uq7WpuAXC7xrUacTc8QJc8YPLbyK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfZo585GYQciq9h7C4UZjbzAc96FqLaBJ2V0m8ohfummWIfQrX
	AMYQ/cUmbH10colApXvaNtg8K6NjB8KAk4IK1q7U3gDBULBMNzm9yO+f9dN2MAM=
X-Gm-Gg: ASbGnct1c+qHqT63vcpAm7I5hdxNw9/3Wz0cTh8oSzE9U2gKMNNWoxp0UqOHT35Ld+w
	l2OAzYDfYxtMbFnTva2nAXxxsVM5VNrCMdyp9TKe9z1PUSZ5HHK0OgiEL8N0+8/aNZL1y57Emaz
	vSPGAX3a3lPAWJ/PGzoXxhNiIwyxSx8Wd6j0urlvWLahibeDXBOj7b7j61mLcxV1i2oEYPgzM/o
	NyUBICWVbT0qe36gVFMlwvKgOEBIu9tQTuKBplLvqI+nJGbLI1HhrK/f7OWhKwwpRl+z6hM8msc
	LLAuZ3uCX2bnw6xsBLIii6qwcIdkTaPxWWxNRkfqpN+aOn+YCfec8NSExOfwN4G5DY40ecvd8nb
	hlM0t0r3h1nDOdA==
X-Google-Smtp-Source: AGHT+IGGpcJqyo2chd/Qt7FhZAddVefASCm/rGvTnzANcNrhxPatD3FKWX67AQKztgRQcEReU47KIA==
X-Received: by 2002:a05:600c:4447:b0:43c:f470:7605 with SMTP id 5b1f17b1804b1-442f20e80cbmr60116595e9.12.1747297431280;
        Thu, 15 May 2025 01:23:51 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3979355sm60876865e9.37.2025.05.15.01.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:50 -0700 (PDT)
Date: Thu, 15 May 2025 10:23:49 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ezequiel Garcia <ezequiel.garcia@imgtec.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Convert img,pistachio-gptimer to DT
 schema
Message-ID: <aCWklbIgCbQOOkj_@mai.linaro.org>
References: <20250506022249.2587839-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022249.2587839-1-robh@kernel.org>

On Mon, May 05, 2025 at 09:22:48PM -0500, Rob Herring wrote:
> Convert the ImgTec Pistachio Timer binding to DT schema format. It's a
> straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
