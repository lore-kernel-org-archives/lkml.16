Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4115622B8CD
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 11:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738842572; cv=none; b=qz6DwlvayovEVkLnXJiQY5DdHhXH6yIZREdoR4xmHKbM7gi5ht9sY9NW8Q2D2sCdcN4C+dRwFXxX3PBgNnWo1fXfmTV5ENcYx+B2sIMxN1FDh9s1++3wDKxuHo8fhqBPyhMJ7gCYDbymm/3vpJ31Ed5QNlrbbhwCZExTfVfPd2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738842572; c=relaxed/simple;
	bh=E8+d7rzKIQYxvCPsaoYc55cIInzpgJbkEM+e7bop0Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=luShGzqcMVK84cMTj+mpA6HReU9LzhF533QpxFPVokrrisElFMZIYPQP3ox5zpQHnPnCN/BSN1lMtCuMGz05VGtk0RTWp2TXZ53FqGtotNy3faUyXPxMGLXjjUgItIIlEBWgoDIdDXrOHi+x2cgkNHJq4lB6MNrkejbaLlSV4qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i2INX94n; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i2INX94n"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-436345cc17bso5603095e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 03:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738842568; x=1739447368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NX9ms/4I8NC6zrc1aMCv7TAeR5qd6HJ58Z3muKUA91A=;
        b=i2INX94nzv1I+RFUk8aoJSG6QACu6LLaG8v2He3L2jxp68dSvdt6TOr9WmR0pwBdTv
         oDghr28FuERI+3HnT9l67fmynAoVlwXmDRDernVRVFgBhI1OGlC3p6CaPQur0hKTMKf6
         CZTj7YmLj40UrRPNjyW/oXef0tVxeJ2Ov/2+uiM3wTyEZzK8+MYDbirTOZe7TQsIG8X9
         Z18YIl8vPE1WT0TEkbZlZDbDNvZJDGfjKcVHEvy+wrlKuMcuSCXVdPIIPyPrHajupXkM
         6jFbfDzLsWFLQLDD+lHuJEG15e980QlMdH7tNzCFBASz+fckwTtvLAG0S2pFYL7Bzerq
         rETw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738842568; x=1739447368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NX9ms/4I8NC6zrc1aMCv7TAeR5qd6HJ58Z3muKUA91A=;
        b=WpDJO+wXZeNBBbrq5F7f3T+PCgjj2s70mNXEJFgWwmJ8Z3q6cbgALNzT2KA+LQkUJP
         tBubmN9LAcBQfN73LCDk7cAJVC907ZmAQdqekkYxRa26oV3RHyaod9HhBXateOUqoPIO
         gHe3sAUeVl3A/2ApGfXZCPUFQJEoRQtCHCvba/c70TSdvNnO1a4mG2hsQQJehvhiKtVE
         XcLARQg4/nuloP90pibJ3ROTTlfbt4bAtpTf+ivWQWh7D1tUckWjLYgJ0484+i8ZH3by
         KDpJxiw+6GYvBx2fHRy6znvMGh1dQvSIMe0voMbuJDMpgn9ijOZa9027cr3gDXW6cSTm
         6G4A==
X-Forwarded-Encrypted: i=1; AJvYcCU1rV8QMk/a96KKkTytp6cqAuJT4O2NnHPjf737e30sKUWLVEcM5gjqR4A1wr8ALb59bwJFVKMaDf/B2/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzITbWkoO1cIUTejk8lsxDZIn0jbqSJONeLHmXWQT60K2ou3Vyb
	DleBH03MSUdP/jFpPqZhhUuOMgTALb3Uu2vArmAEOl+kpV1zJHsD4Hy2fcgjWjk=
X-Gm-Gg: ASbGnctQiF7vaNRUZ77xUfJBQeZzC/wGb4qj4586QLdynp2E2SIkD/il/0mwvAt6Ej9
	gVaAPT9b/LqfzgChfYsaMQQP1KbdcQ5Ye1mo+OPZJJcWCnPfDhz+qNEY1KqjGZ0r//8a7vFlQwg
	wQI5NqRqF8MTGWRR47SBcPOWfZdG7df5DF8Ka227pxebjeqOG5H/boBYMRhAoEPsUA6RhZLDqtL
	Q5hCPFTMsy8GGVYlaxV84J8qUipUkp1uBK/7x9ayrHyOupO3jA4b+NMfJDOAxrH1uuUs8hrvlyj
	phCYCPq+30dojZE6gN4S
X-Google-Smtp-Source: AGHT+IGBjV9LowhqFquW+OEjP5fmaVEQ40WZqgqqY5aomaJpQL2ZwcJcaosKDFlLLto2p8sEGWzZkQ==
X-Received: by 2002:a05:600c:46d4:b0:434:f767:68ea with SMTP id 5b1f17b1804b1-4390d42ccb9mr56959955e9.5.1738842568525;
        Thu, 06 Feb 2025 03:49:28 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4390d94d685sm52793145e9.13.2025.02.06.03.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 03:49:28 -0800 (PST)
Date: Thu, 6 Feb 2025 14:49:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
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
Message-ID: <1a420172-de2f-4602-a181-be79bff0bb2b@stanley.mountain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com>
 <7a29ec8f-fef8-4f1c-a2eb-16a63f2b820c@stanley.mountain>
 <20250206105218.GA22527@localhost.localdomain>
 <e20415aa-517c-4e72-a1c3-9c02769c1149@stanley.mountain>
 <Z6SgFGb4Z88v783c@pluto>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6SgFGb4Z88v783c@pluto>

On Thu, Feb 06, 2025 at 11:42:12AM +0000, Cristian Marussi wrote:
> On Thu, Feb 06, 2025 at 02:31:19PM +0300, Dan Carpenter wrote:
> > On Thu, Feb 06, 2025 at 06:52:20PM +0800, Peng Fan wrote:
> > > On Wed, Feb 05, 2025 at 03:45:00PM +0300, Dan Carpenter wrote:
> > > >On Mon, Jan 20, 2025 at 03:13:29PM +0800, Peng Fan (OSS) wrote:
> > > >> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> > > >> index 2c853c84b58f530898057e4ab274ba76070de05e..7850eb7710f499888d32aebf5d99df63db8bfa26 100644
> > > >> --- a/drivers/firmware/arm_scmi/bus.c
> > > >> +++ b/drivers/firmware/arm_scmi/bus.c
> > > >> @@ -344,6 +344,21 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
> > > >>  	device_unregister(&scmi_dev->dev);
> > > >>  }
> > > >>  
> > > >> +static int
> > > >> +__scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
> > > >> +		       int protocol, const char *name)
> > > >> +{
> > > >> +	/* cpufreq device does not need to be supplier from devlink perspective */
> > > >> +	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
> > > >
> > > >I don't love this...  It seems like an hack.  Could we put a flag
> > > >somewhere instead?  Perhaps in scmi_device?  (I'm just saying that
> > > >because that's what we're passing to this function).
> > > 
> > > This means when creating scmi_device, a flag needs to be set which requires
> > > to extend scmi_device_id to include a flag entry or else.
> > > 
> > > As below in scmi-cpufreq.c
> > > { SCMI_PROTOCOL_PERF, "cpufreq", SCMI_FWNODE_NO }
> > > 
> > 
> > Yeah, I like that.
> > 
> > -	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
> > +	if (scmi_dev->flags & SCMI_FWNODE_NO) {
> > 
> > Or we could do something like "if (scmi_dev->no_fwnode) {"
> 
> I proposed a flag a few review ago about this, it shoule come somehow
> from the device_table above like Peng was proposing, so that a driver
> can just declare that does NOT need fw_devlink.

Great.  I think we're on the same page then.

regards,
dan carpenter
