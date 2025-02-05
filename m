Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7E4623
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 12:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759508; cv=none; b=VIdr/7rpLP4kFKlhpiyRxQ2RcL2iSrAVO0D1ECLaT/fW1DkOQRdnuwDBOOXyvlCMZWeg3iHCCxqrU/07XO2Qg+OgqvkqkQawftJHIIMCBJ7w8vX64rp2p04gSf8Xetg04vmqlce/hZZUuu1EAiz77DpBc/HdujCqVJUHD556zsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759508; c=relaxed/simple;
	bh=hdLNvV4ZDefdMJiuno9fjpOjHFosu7nQkZ7UaWvn1cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0arPuvuUkWigLUQQ826U0UH5cIoS5/qmJTW+7R/At2Bj7uPrGbMHlDBWQZ0VlPU9nNjctZwalkzMSL0gMeHVPQ7DSVgYqKh42cXSlYQDircmBOCmHZ2HsI01s1VGOKnouUT3IDbdk3OWx0ft9KY49tYVuBa1A9f4EAEyFML2ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pkQilnK+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pkQilnK+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so76996455e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 04:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738759504; x=1739364304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TsGJ3UalQzSxFZb2gU0XPD2QXXPZcrt6eLZRxDHYdww=;
        b=pkQilnK+Njaw7IstoQaD0egpevB3pjAGduOBegd9faJL7xDKRDw/z3pfkSj5r/yg8I
         zn6av2BkM2yZEEJ9JDKa+C8XMHYKQ/uxO6RmUBfbtLhHK757t/l1aIQ94aHmT8CKe7Pf
         hpFrnnCsmNGRUmy86ARsTZbALNOYRud771uX4aCcmnu8SkKMgVKdpE33q8+nWMD8hMth
         dFtrRqs+pZUlRZRUA2igYC45SaL0gVQM39LWmlfKEiZdOQJI3JTeVQ43KWq0Z3gTHczN
         WpKFJ0buTMybC0WpcXG76Lg3JuosflzNL88/Vi5eQQI41kZt4/JnX0OZbySVJFB9adLD
         lOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759504; x=1739364304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TsGJ3UalQzSxFZb2gU0XPD2QXXPZcrt6eLZRxDHYdww=;
        b=bwhYwoKghpqKAoxPwwIeCpCTWPVkz8bR8aDexI/QKBKvTdakFUbUKNoU9NAeQ/uerC
         6mFRIcr6vDHoDIVJOLdG7u6DLP33Pm1g/s/8YOJtOzY0gbPFrET5DVnkpmz68gVX0pc8
         FsTn3/Px7MUH+MDolZ58YLbEY7KPafYA1jsrYNgmsLcQMsBhI9B1IEfUkBY1SoX0llZy
         SX1a9mfGO3ZUGFMEDIhetIJbP6WgDu4tK9dy8Z5MIJrVjnc/GvtrcljOAkJJ+hamanwm
         bfu4B17StnNkpTKersLev6xU9yRKnJZ0dXFpFRg7aeNop3Ll0Msytq8b9clzOYjTd0vu
         SYRA==
X-Forwarded-Encrypted: i=1; AJvYcCV7uXj4GYeULVmXVNiHXDYxLv/+nWXCiPygbX7cAMfJOS6zTO+tN3J1n5lR5GsqEFdb96g99DJGIrRAJ+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqSnFGLbEZkzhIIc9GRMObo1IsODbiy5jdco6w69SsHPMHEhcn
	wAPSGeXwunlQbzz6jXwhhZ6Qs0z+sprU4t0XicuD3mLk2bHo4rkT68Ck/gL/rp4=
X-Gm-Gg: ASbGncv0K90xhpikDWmqwtIvUH6N8MltM6W/itsiWIEsQ+UTULgl3xaivYZcGqOE49o
	VmA/QGDx8S2kvgv7xZ+ae/3+5sDf8p6iYrCa9JgAbOtgi83Rl8DTMKsw+DG4Fxmsc9ahmFyp0ug
	o/GLz1NVfL8o0WrzJg8+f9dDL3Drlmt7cSOtoV/3h9kI2OtW17CB8bmMKUca2R3wrq51XQBsh1G
	fHERDGCP/g0kSytxNhe22V04QswbF8cGARLsavYkolZceyvzV6uuRU1K6FLKSFb62BPXNA99k1F
	jM5kWV53wqT0lsKuzXMT
X-Google-Smtp-Source: AGHT+IFCvzDOHTxQpe1wyNcbveuClBOWo7xzohLO9c/UKcth1SBw5nvlvVBDYrxutdBTH8HCumBZ9g==
X-Received: by 2002:a05:600c:3511:b0:434:a202:7a0d with SMTP id 5b1f17b1804b1-4390d569890mr18220445e9.22.1738759504528;
        Wed, 05 Feb 2025 04:45:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38db0e2f479sm3524769f8f.57.2025.02.05.04.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:45:04 -0800 (PST)
Date: Wed, 5 Feb 2025 15:45:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
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
Message-ID: <7a29ec8f-fef8-4f1c-a2eb-16a63f2b820c@stanley.mountain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com>

On Mon, Jan 20, 2025 at 03:13:29PM +0800, Peng Fan (OSS) wrote:
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 2c853c84b58f530898057e4ab274ba76070de05e..7850eb7710f499888d32aebf5d99df63db8bfa26 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -344,6 +344,21 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
>  	device_unregister(&scmi_dev->dev);
>  }
>  
> +static int
> +__scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
> +		       int protocol, const char *name)
> +{
> +	/* cpufreq device does not need to be supplier from devlink perspective */
> +	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {

I don't love this...  It seems like an hack.  Could we put a flag
somewhere instead?  Perhaps in scmi_device?  (I'm just saying that
because that's what we're passing to this function).

regards,
dan carpenter

