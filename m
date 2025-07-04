Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3262FC3BF;
	Fri,  4 Jul 2025 13:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751634038; cv=none; b=deZTD8Qj1t9jASUbU7qCpQaifq+gqk6W9XQaQK4yuh+q2rf18xVL6k7h3ZaezMgfGjsmfzf3Hk4B2JmTJd7HRaXpC7gf0lmin13Lf6hpEnDzCAe9JM8JbAo0gkcp1ZTshyrUx4WL1dVHQBU/aqRBRJtgXyNKddjbs54KlNMdx4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751634038; c=relaxed/simple;
	bh=v7lU4f5zMr8N+ikd3EfPfeZFUTJTKPOhU0exZZftG6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cF5e+GGzqvQZsYaJ5utYYdyYORcHPkLuJapYUK8CxCUmJ9FOUPu9zRQCYopTa1yl0ZVj4ciE2BJebVixv8zALO4u9w7pemwlNdztl6FwbSo5oquVmyaK5BnxMilDn7of1ZuWLmFiTivQ8tVpqjQqVQsqI+00MQKwTYUed4ZxqIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k3tUcUj6; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3tUcUj6"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23636167b30so9572475ad.1;
        Fri, 04 Jul 2025 06:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751634035; x=1752238835; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mQGjws5M8IuXv7Hc22/iewWiFVP1hrsYWYglQueIYvY=;
        b=k3tUcUj69uwQUwrGYAIZG0+88/Q4MNR7NvZgVteeRnCTLtgCo1Dv9S4QLOGhF8uqsa
         uqzBbKKZcMRtumb2WoDGHNJ3qH98TeXyPCc/5IpUBIuc57MGdWHE3dY+5E+sDAkHUqI/
         Gs8bUrMs4uWX05QzI3wPhe1/fNmz7YwdKs+sOGUY7KJnvI+gxxAVLI6xjWZtKmS/hHlc
         ZYxZivxKshlEmD+hFpkPYLWFEJX4x/QJ1Qqi2Hcp+Aiwco2GFdmHS0DNwAu8FFNzNeN6
         0yJfu4TiD7xK1yyRM4oBcbr+BrtdTQ+EObvlWR0sGKYRIesKPr6olMqcSwWbEgKvPtUD
         x7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751634035; x=1752238835;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mQGjws5M8IuXv7Hc22/iewWiFVP1hrsYWYglQueIYvY=;
        b=D8tbO5DgijD4g1hpQckwsu1m0vVbst3BG6OfG2gnylp6QRpzlaWFfu+IPVeYKohn1F
         w44W/Z9n3b3Njnaz4VXrFTFaFtiUVBozHXO1jJ8wDAk4LR7lKl/9yWk7ZxzQG5wHrlmu
         iBEhPEMeAKVhr1fRQzta/u0cSW/AjZOZxqiH5CLVM7XFuK9gkCPrOANALJir+bZeXib5
         VUeMB4UuOS5AdXUNcHmrFZjrtlcfL+M7Lh1QNUtDTWaGxcaszuvNXDVm5jwtnRNVbxY0
         nPSrbNoKodq+ulZb0nC+5g50Ma/eyBmZEB8sme9L6e9aG4tMhZpbUDTlE6FEig5moktT
         4AEA==
X-Forwarded-Encrypted: i=1; AJvYcCU8IEisgjYqJ3bC/Mw760rg7Tx8YobtLinY+Qg9BkcM3moony2A9pmcGpmQNSsinFZ/CJuIS8JF8kQSp/8s@vger.kernel.org, AJvYcCVG4F0PaoeqN+2nwD51R5F3ZbNQ9beB3mvR/H9zKy5StAe7yBznqsunYhOsv4M+UTMBkGlisLMrd3Lp@vger.kernel.org, AJvYcCVZfcAScNtAuDgKoZmH82PdrG+4GNxJ/XUwOrVEmXaozXKTQosEE5tO6u6F2hKdFu8vgK7rA2ko3JxG@vger.kernel.org, AJvYcCWO4eglMDB113hsutquTAwoUiBOq9o7COoWl84CE4xl9Ms9HeG5vrfyndSU24H/5HIeExajzQItAVEwIUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYwiCUsV0Hw6wfwIZpXA3VaPKTaF2pNmjoxjri9aj/tDSX6ip1
	Q9D8+jLEAPzg/CIgtxvHv2PiguD/2+U/z3GYrEu4zyKJToFB4tudvzfK
X-Gm-Gg: ASbGncvCy9yvw70MnNk1rvMnd7I/MIZZdQ7XiokwLn5RS1SikcT2jrDh9wAVIJYz2L/
	YZHtoE8b0N7WqTErtXCTn4Gy7r3b8UZo1NI8eX99GHh3YFn0xP9sHMVtXnXTOxY4oPJlJ32hcBj
	2T+uMjWcPNODESHdeYZWb4VjG3UFda8oc1S0Lg+MXg3/0VPqPSfr4kdQgHxsH0P/MTc6t/YGBxi
	q8yNzHMV8mIpKRs4Ezk1o4Hg5Fhca9QttuaUpAZAf7Y5DdOPcd09/yNeSdoTqQel+iUO2gorigk
	Oc2wocyVT2OJkW+En4sRAQxvc/6QFK2iE/uO3yFEVSdVZF/26X3htTuFLt85HbOlCZeLMgoYRf0
	=
X-Google-Smtp-Source: AGHT+IEDaXi0mlnwq8CmOY2xOIWopoVkpF+HHxHqff0HGahclQAW6sBorP5XQ2TgzgwJAV4gzOj4ZA==
X-Received: by 2002:a17:903:27cc:b0:235:225d:30a2 with SMTP id d9443c01a7336-23c85ec7329mr33981495ad.48.1751634035360;
        Fri, 04 Jul 2025 06:00:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c84581113sm19185835ad.183.2025.07.04.06.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:00:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 4 Jul 2025 06:00:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, jdelvare@suse.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] drivers: hwmon: add EMC2101 driver
Message-ID: <c70c3d26-c2c7-4e5b-b415-8d8c20f922f1@roeck-us.net>
References: <20250701181228.1196102-1-noltari@gmail.com>
 <20250701181228.1196102-4-noltari@gmail.com>
 <c893384d-4134-4510-be87-11a2c9ba6cc7@kernel.org>
 <CAKR-sGeSPHu5DiFL2sX=SdET_jzbepo30qguscUjzYkX-Aub0Q@mail.gmail.com>
 <9df1cc49-34bd-42d4-96dc-ec9b512e0c5f@roeck-us.net>
 <CAKR-sGcLkihNKAQpPR6y3u2aCA6xmTd0mp2Ko15e3QZWrc4Dgg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKR-sGcLkihNKAQpPR6y3u2aCA6xmTd0mp2Ko15e3QZWrc4Dgg@mail.gmail.com>

On Fri, Jul 04, 2025 at 09:26:16AM +0200, Álvaro Fernández Rojas wrote:
> Hi Guenter,
> 
> El vie, 4 jul 2025 a las 2:25, Guenter Roeck (<linux@roeck-us.net>) escribió:
> >
> > On Thu, Jul 03, 2025 at 09:23:41AM +0200, Álvaro Fernández Rojas wrote:
> > > >
> > > > Add a comment describing what you are protecting here. It looks so far
> > > > like you could just use regmap and drop the mutex, but I didn't check
> > > > thoroughly.
> > >
> > > The EMC2101 datasheet is explicit about the Look Up Table registers
> > > (REG_FAN_LUT_TEMP and REG_FAN_LUT_SPEED) being RO if FAN_LUT_DISABLE
> > > isn't set, so I believe that we need the mutex even if we switch to
> > > regmap.
> > > I will add an explanation with that in the next version.
> > > Should I still switch the implementation to regmap considering that we
> > > need a mutex?
> > >
> > What does r/w vs. r/o register access have to do with locking ?
> 
> FAN_LUT_DISABLE bit can be set or cleared when pwm_enable is modified,
> but we need it to be set in order to be able to modify
> REG_FAN_LUT_TEMP and REG_FAN_LUT_SPEED registers.
> If FAN_LUT_DISABLE bit isn't set, any attempt to modify
> REG_FAN_LUT_TEMP and REG_FAN_LUT_SPEED registers won't work because
> they would be RO.
> Therefore, we need a lock to ensure that FAN_LUT_DISABLE is kept while
> modifying those registers.
> Please, take a look at emc2101_pwm_enable_write() and
> __pwm_auto_point_temp_store().
> 
Thanks for the clarification. Please add that as comment into the code.

Regmap is still valuable even if local locking is needed. It provides
caching for non-volatile registers, and it provides various useful API
functions (for example for bit value changes) which you otherwise have
to implement by hand.

Guenter
