Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2F018D656
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 11:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738841488; cv=none; b=uIQPbkILWGEcGk3OzjiimbYfKIZyJCn0mxCsbBjbw2yLuyobjggyCzmp8WELdztqpCy4w/RvcfEOj3pNuNEej1JaOEpTUx2NOv6vyY72yorlyw1EWgW/apBJ4kfKGzq+2GuF5stuj7Gwfz859/t5eJ7Z2EKpVOWrOBdavKGs5QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738841488; c=relaxed/simple;
	bh=zkGa5WERNlcjx9M1T5UZoFwgT0eWSaHUBpVHYuBMcKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=paMq1XvbV55HVVJxqY0gIm6OPKaKnmm5Wnfs+ZTobT+Cg7f/wvs+ffWzd350/xG87xa5BjcWFw+EYGr3tRZ+QNqbbvN3WxQR31DpDhT5wDfpPxTpJiObtQhUvLGI5cnKQ/awwGtqbZq7JbdhDqTQZz1OMy+cixuCPrpuQFA+W14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tzaMsSzv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tzaMsSzv"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43624b2d453so8433025e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 03:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738841483; x=1739446283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oCI1ZBTo4CXvGl9Bx83X1jcDkmWE56kdXG7He5kgffs=;
        b=tzaMsSzvxHK88gKeBut+8lVTlpUXmExyLGu7Y4BC1fHp205y9bAzJkO2pn73BmfCcA
         /Y2gcuHR25JsIqW0b9QesD3U5/ssCY3tleGBqE/aBAMRm2UVxLek960vrDNae7qftnUs
         3iWFwe3Bi0oSFiobSPvY5ci33X0Ei5s7DUThV5F3wcvAahan97nptEVdu539MDH838BU
         6Jd2PHNfrNtG7cPRcKEt6FFgkwAZFTtBevG1wo6/dxS84JYuCWAS7vkqrfvfaiovyTrE
         jPDSTUwteTDDGbzwrBFeBkN1e5UPhVXCu9o1Rbfr8eBreNOTnJNYarlpUjbR/7kCmbLh
         EPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738841483; x=1739446283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCI1ZBTo4CXvGl9Bx83X1jcDkmWE56kdXG7He5kgffs=;
        b=bVk3CwDxuanhmzaLWL4I7MUdQcwNm6bV8SHpAs+skG+qT0IP3nL2VfdS+T5BYJ5PWZ
         qX74PGaZkGmG3Eu/fHzzruE7DtPo5+BhKulfuWM8JN+xboPz30hsu53kEBL2br18EI5b
         xyteM2FCxzhkzH/Onkg8Yh6wSFcOvM2vlhyglcxkB2EX3XPkmEoXiS0EQxD7PxlXJ9ng
         Dnu20PoiqvHKsDXAWaAqo/3NOHNvmU/D9rkbVmTCL1cV3Dl3e1zIIA9QTmCQaPfHTI9N
         h8cv4RwKsWFKYu+CiuvijAlcm1+LgWFdodnHQUtT4/W7ZJ93SLBY0j75Bux8QZOC+OC/
         MOiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeenzSp6rEoeemYRg7qkAycm5nKGTJ/3hyF+0skEf1uBd0/bUm8d0rJK7hlqgvGbpHVAcHgWoSkNKKa4w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5QfV7hpB05Us+/azK6Jq5fXpMb5YnLUL7fcj4Zwc8JCq2pzmW
	6j+m8su2lWvifcb0+OJaLkNPLMKXjs1p+V/II1CPHSzis+ypSBg4oQ3FKUXfxRI=
X-Gm-Gg: ASbGncvdGeyM8UdZcLi8NZof93k94gMhgWFN/ZPRT+itNfJyLTWVcOJPygx6Dlul8JV
	59m+Bz5v1xNRvgBQmm4LXSFA+aCn2eb1bYnnPCCfZOtfL2y3COiInZJG3haOCvxwYXOuzj5jW3w
	ctf8RB6FojU4Ozfx6xw//xNWHClPkxJwdZPPYuwW+FrzwpAF+bW+2EcfEApGyiMHvMU851uXxua
	Lhe8ThsbSuNqH54f/BSGnwWvPCL+nUOjwGgo1gIbtKiszhO8VS8Sc7W8zhwmQydgyugPTMnxBYU
	mtHUYnc0r6t08dBGaq0l
X-Google-Smtp-Source: AGHT+IH7D8euabfcrwCOQjtY+IXcdW/axRayM6NaqPRFSLZQPDH+rc/cv5/qoeqeWWI69RXkq3ju1g==
X-Received: by 2002:a05:600c:1d1e:b0:434:f5c0:329f with SMTP id 5b1f17b1804b1-4390d43e471mr72311885e9.14.1738841483532;
        Thu, 06 Feb 2025 03:31:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4390d96517dsm52528035e9.20.2025.02.06.03.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 03:31:23 -0800 (PST)
Date: Thu, 6 Feb 2025 14:31:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/4] firmware: arm_scmi: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <e20415aa-517c-4e72-a1c3-9c02769c1149@stanley.mountain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com>
 <7a29ec8f-fef8-4f1c-a2eb-16a63f2b820c@stanley.mountain>
 <20250206105218.GA22527@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206105218.GA22527@localhost.localdomain>

On Thu, Feb 06, 2025 at 06:52:20PM +0800, Peng Fan wrote:
> On Wed, Feb 05, 2025 at 03:45:00PM +0300, Dan Carpenter wrote:
> >On Mon, Jan 20, 2025 at 03:13:29PM +0800, Peng Fan (OSS) wrote:
> >> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> >> index 2c853c84b58f530898057e4ab274ba76070de05e..7850eb7710f499888d32aebf5d99df63db8bfa26 100644
> >> --- a/drivers/firmware/arm_scmi/bus.c
> >> +++ b/drivers/firmware/arm_scmi/bus.c
> >> @@ -344,6 +344,21 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
> >>  	device_unregister(&scmi_dev->dev);
> >>  }
> >>  
> >> +static int
> >> +__scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
> >> +		       int protocol, const char *name)
> >> +{
> >> +	/* cpufreq device does not need to be supplier from devlink perspective */
> >> +	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
> >
> >I don't love this...  It seems like an hack.  Could we put a flag
> >somewhere instead?  Perhaps in scmi_device?  (I'm just saying that
> >because that's what we're passing to this function).
> 
> This means when creating scmi_device, a flag needs to be set which requires
> to extend scmi_device_id to include a flag entry or else.
> 
> As below in scmi-cpufreq.c
> { SCMI_PROTOCOL_PERF, "cpufreq", SCMI_FWNODE_NO }
> 

Yeah, I like that.

-	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
+	if (scmi_dev->flags & SCMI_FWNODE_NO) {

Or we could do something like "if (scmi_dev->no_fwnode) {"

regards,
dan carpenter

