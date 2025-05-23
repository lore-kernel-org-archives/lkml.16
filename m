Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671AA1EBFEB
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990758; cv=none; b=lRvD0vmVM49rpKVTPStenpOGBNM7zqXgr2DTy9pf77Gk6ezKxSz5QKLNOWSSMf2CxHAzG618QFnwdrDFX+yg1cgo99+2eEXup1IoHYnGrS7H4mfucAc5X13A1viyvwZC0zq71mrDock8EAgDY7SOa1veSyn+3GZK+VgHsJLdcsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990758; c=relaxed/simple;
	bh=8nIPKcbxUc08zrJ5dh3+DyPSHuuWmJSl5snApphxvDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iAvhCmDosIVSvq/LijLbvTDSPeRvTjHncKTuiphvDWw50Jpgeje5GpE6iJXdtI1oDzpPNS99LVV0LNEBAIFWhxmY3YgC9nrvHySelgLUoGBJkrC/Hm4BtNcWNz7we57bzhAgoZ56w9yaGIWiKzsAtdgmB9PfQODbeWjTZxVZmJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t00kL/Pe; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t00kL/Pe"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad574992fcaso989868966b.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747990755; x=1748595555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=stQGbKNOmre948PSNk4Bs17jnwGL+MBsxPrH/ncfoxc=;
        b=t00kL/PeufASgZEJuF85GzkPo2i5aaWUX6cHJvPjAYcq08+wJMMNRx4YHLSQ2KW6Dq
         Qjdh2YdCUfgCi3XUHxwvJFquAmZPZRjn8QWzfxPx4wX5aAG11h3CwWEYC4F9TdUxckUO
         J9cc0LKBsdtReeW5ZDCsGtw1s8WQaqVxUShUvrD5b0zLKGkIeNdKq97KcXHkVT4om/oW
         qce3tOm+64ZIPEDdtHrLvuauMs8ujVq7N6ZRdIHab95FFdFV8YaLlpsMJl6LmyJMivEC
         dedPNjRVfBFyiwyj/3SjnYKuck7zeEcvACMcm+dKK9bCjC0WjAwi46VHB1xU5hnWTiKZ
         1+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747990755; x=1748595555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stQGbKNOmre948PSNk4Bs17jnwGL+MBsxPrH/ncfoxc=;
        b=m7Dbybugv3TKo/xkM98jLx2LrC9ha9GtouvC4eGWGKDpg3Xz5hX7mzQsUeRHuD0lUv
         hrudyUpTC0ACcLTO3paLudZUrL0DSpPtUeyKFU5zzkXaO7YWRuFZkR5Gz+dGIfvfPx+2
         NU0pn9KbHSXfI9Drrc1r1PgjGQOab1mSvCWiwNCIsWhsxVVDkPJzPhtmqZDMSSoRWNxO
         8+0Yy3u7RxLV1HoUf8jStA9Ckyat/VyqnWK3xtqWhueh/4xbGeDOjHQT2BKiHn8rT57i
         pEEcikNMz5zOcFHYo+u3HnofoKbvhO+oS5ldeB4QEZbQ7SDIh9ufS7Nxcd7ONE/T1C3c
         hpyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUL+CqnNI/7cuuNPp1fun3+vr1GzSaW6L3cJSBY3a6gMEgjPVdpPeJvxa1568VjsaCJjOP1VdDzYpPheE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi7Kk0d2N4AjZLX4rZp+E67PGLkWRKKuivoy3lpp7o1d9EWE3L
	pIT7t114zVcJnhW/A08ZwwPnexTUQ5W1RYEqhyyICmpGyuBS9QxYpVIFcZKgFUQmHLU=
X-Gm-Gg: ASbGncu9+qoK5ZGgkOIZztT+W0g6M0+5C7Zi+na+Zqxw+hWM6tYDMT/pLEl46OT/N/D
	B3SlQsKyW6oz2MtclqWwfLmg7CBvamZN6swimwW5lE1z5OVXgZkE39borw/5uuZAQedi1iyKsXP
	pDw9/op/CjBEM9dHrBw7jP2iNryAvaHOp1oi/GwszSp9GD5UvtRJT1pt/Myr9T7QxFMF+giiARu
	qFA/0SbufHkenc5syYzKdgPbRmjClFlYAqv5CiO/UaSWVben5w9fMl32W1G8T0gAO+iGJCt+Cbq
	r76NNmTqu2cFdyhODwuaCnR7As2zoAq8DucRBOctwL+rgsGS6mu9Hst+sIqJDSA=
X-Google-Smtp-Source: AGHT+IEZB6pb8qzCvtbrWXEhxWzERNsp1Y4jhHk1e698FW+co9usbzcUdi7j4FxgD7upZFmBeddP0g==
X-Received: by 2002:a17:907:7245:b0:ad2:5499:7599 with SMTP id a640c23a62f3a-ad708449966mr169123566b.18.1747990754401;
        Fri, 23 May 2025 01:59:14 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:845b:bbb4:b39e:a452])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6020e441c84sm5562670a12.38.2025.05.23.01.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:59:13 -0700 (PDT)
Date: Fri, 23 May 2025 10:59:11 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Georgi Djakov <djakov@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: mailbox: qcom,apcs: Add separate node
 for clock-controller
Message-ID: <aDA42BQHLvfVO_Gp@linaro.org>
References: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
 <20250506-qcom-apcs-mailbox-cc-v1-1-b54dddb150a5@linaro.org>
 <7vszdea2djl43oojvw3vlrip23f7cfyxkyn6jw3wc2f7yowht5@bgsc2pqscujc>
 <aCNGSwL7043GoJBz@linaro.org>
 <20250514160841.GA2427890-robh@kernel.org>
 <aCUHTJGktLFhXq4Q@linaro.org>
 <20250523-curvy-ubiquitous-cicada-eac1a1@kuoka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-curvy-ubiquitous-cicada-eac1a1@kuoka>

On Fri, May 23, 2025 at 10:42:01AM +0200, Krzysztof Kozlowski wrote:
> On Wed, May 14, 2025 at 10:12:44PM GMT, Stephan Gerhold wrote:
> > On Wed, May 14, 2025 at 11:08:41AM -0500, Rob Herring wrote:
> > > On Tue, May 13, 2025 at 02:16:59PM +0100, Stephan Gerhold wrote:
> > > > On Sun, May 11, 2025 at 05:48:11PM -0500, Bjorn Andersson wrote:
> > > > > On Tue, May 06, 2025 at 03:10:08PM +0200, Stephan Gerhold wrote:
> > > > > > APCS "global" is sort of a "miscellaneous" hardware block that combines
> > > > > > multiple registers inside the application processor subsystem. Two distinct
> > > > > > use cases are currently stuffed together in a single device tree node:
> > > > > > 
> > > > > >  - Mailbox: to communicate with other remoteprocs in the system.
> > > > > >  - Clock: for controlling the CPU frequency.
> > > > > > 
> > > > > > These two use cases have unavoidable circular dependencies: the mailbox is
> > > > > > needed as early as possible during boot to start controlling shared
> > > > > > resources like clocks and power domains, while the clock controller needs
> > > > > > one of these shared clocks as its parent. Currently, there is no way to
> > > > > > distinguish these two use cases for generic mechanisms like fw_devlink.
> > > > > > 
> > > > > > This is currently blocking conversion of the deprecated custom "qcom,ipc"
> > > > > > properties to the standard "mboxes", see e.g. commit d92e9ea2f0f9
> > > > > > ("arm64: dts: qcom: msm8939: revert use of APCS mbox for RPM"):
> > > > > >   1. remoteproc &rpm needs mboxes = <&apcs1_mbox 8>;
> > > > > >   2. The clock controller inside &apcs1_mbox needs
> > > > > >      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>.
> > > > > >   3. &rpmcc is a child of remoteproc &rpm
> > > > > > 
> > > > > > The mailbox itself does not need any clocks and should probe early to
> > > > > > unblock the rest of the boot process. The "clocks" are only needed for the
> > > > > > separate clock controller. In Linux, these are already two separate drivers
> > > > > > that can probe independently.
> > > > > > 
> > > > > 
> > > > > Why does this circular dependency need to be broken in the DeviceTree
> > > > > representation?
> > > > > 
> > > > > As you describe, the mailbox probes and register the mailbox controller
> > > > > and it registers the clock controller. The mailbox device isn't affected
> > > > > by the clock controller failing to find rpmcc...
> > > > > 
> > > > 
> > > > That's right, but the problem is that the probe() function of the
> > > > mailbox driver won't be called at all. The device tree *looks* like the
> > > > mailbox depends on the clock, so fw_devlink tries to defer probing until
> > > > the clock is probed (which won't ever happen, because the mailbox is
> > > > needed to make the clock available).
> > > > 
> > > > I'm not sure why fw_devlink doesn't detect this cycle and tries to probe
> > > > them anyway, but fact is that we need to split this up in order to avoid
> > > > warnings and have the supplies/consumers set up properly. Those device
> > > > links are created based on the device tree and not the drivers.
> > > 
> > > Does "post-init-providers" providers solve your problem?
> > > 
> > 
> > I would expect that it does, but it feels like the wrong solution to the
> > problem to me. The clock is not really a post-init provider: It's not
> 
> But the entire node (so the mbox containing clocks) is a provider. This
> looks exactly like the case for post-init or do I miss here something.
> First, I do not see circular dependencies in the DT.
> 

Please see my reply from yesterday, I have explained the disadvantages
of using post-init-provider there and also showed the problematic
circular dependency again [1].

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/aC-AqDa8cjq2AYeM@linaro.org/

