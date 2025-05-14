Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4F728EA47
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747257299; cv=none; b=I0PF8UtxyNoyqmOfIy30yO+hFy40pokdHrZNCx47fX3unpeoTFZscJ9Q21k9uUy9LhLmZ8pdj/Rwc3DWcFHCy7/NGAXo9x7FJCmvItf2WhrIgI/ZoaYK+2h9G4PFDrgr7IZGDVb8sY13XbsZqB7qKCzVX/6gwy9xSg9VdLjD4XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747257299; c=relaxed/simple;
	bh=xy48Ke49o0MQQP+WVGAW8zjJEqic+HLbYecWDxrve5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTQtChZhA9S5F3PbKXrXp0hkVJ/rTUwRRqECqa3wr60rMYca5DiDudcm/Pn+UxIKzeB4mo6vECaJ4f0+o/4aZzfI+UYlZhntHeAugxu1uNQQSvXlLJJCPcqYmSJinUkPoZtseV7AWaihVvvfNke0JXXqobeujZ/rJ6A4BxEmG8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kJzgl51T; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kJzgl51T"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so2734535e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747257296; x=1747862096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K2iv4lSpsksuKGweGaE94y/cYcxuHI7ZTis4Uim2sZI=;
        b=kJzgl51TFeBusPG/OhqEPkuvDoTglpXcpHZkcn+1oYmEeWxmUgw3xRtbcZcxXdnKd9
         wMOL/l3sLatPlkr5UjYWeu2KRsyYhBnJhj7kqET1b3Lf/f4snkt/jG9swdnJzJZ4WVUK
         XDljAQc75lexSQFJJVEEZyMs1d0sFdytQ51pjw09IKS0KevEYSL1I5Ai0W3JqdQe2Tz/
         ZldWot6J5Nr4Bbs6YgXUZNLH1hu4dCBAITWb6c+Tl24lMeSZtBOjDqG61BUAu4TCRtWF
         eAj0/kQ6cnqzDoolK0iVBHLWQ//XjgTLbZeLYa3LznH0Ikg31OxfgPCVtVRTMwiFt5s6
         8ZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747257296; x=1747862096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2iv4lSpsksuKGweGaE94y/cYcxuHI7ZTis4Uim2sZI=;
        b=B+klz5uL8biyoaQ7FkpuTYw2cyv72U60CeuWe+IOlcmM2e+Ah8cG4eH5WPgE2qBisD
         omtjELRJi+SeXNY8PBqJ3hTfqLoXUlEZPs2T1lTGFcswfmH0pANq+k/sb+ox++FMM/4b
         beXvkEsggLpZ/aw4EVM5nmkKnFQmS9G3FPLkOfgDa2C6jaP1/yWRuDr/7t/jnoXHdHO3
         q/kE0qrOCaAq/INYxx/qMlCIiIoHgrHUQ2wcxASuBH2EdZmt3vxuPStA53Gu+H9UNQp+
         MwmWUbk3IAWT+6JfPB0ehD7VQe80I/9Iih7cgVEqaafmnL2caz1WaIR7lRIqU2Wz3D5c
         qHDA==
X-Forwarded-Encrypted: i=1; AJvYcCUrXWrHleA49C8mAkTMxiK+XkDSnDTaOBdQUErnyfNO/xu44wxcV8NDZDLqarq+SMU4s1Cn7rUYPV1bOQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmMJR/Hic+TbPOrPtPeJRRVd2RtZdV5SzXLZo3TnmkxdOziuIk
	KnlPn5SacMwNtWfkdoiZWVYGvBF021owZkEdbdDMXG58sVgnLRzgeIWaB03E3uM=
X-Gm-Gg: ASbGnctObLtNLvDgNEFjHdiW1DZuIckXh7GDTtB2BU9V9+5jLy7DUlStl6ET+PQACQW
	oiDv5brBvNP0Wp8j5tkD3YKW83amIaP0k69cz3/aMmmi1QRUHSq1htCZOhZsPuJEY+LYZnOF/g/
	sTySmYvDIz3UQ1EY+QnAqi4Lk01AosxMz1GNfgqhhtT4jVUyj1eHTSVMhDc1Q/+cLN8U+GeZhVi
	vZFGWJciJi/HwAerma2E+/B+Q+HamTuI/3DAIagh9eCXVvovnlznlPxZ8B/2Yqoe2ihUTX6eY9H
	FYojVLyI4rP7S1zxZFI/VKMla6oMZqOztjeL0VAN9j7aHTSPZL1WV5u6arTOvabCVBDqlyLM8I7
	Q0+0WfJKoig==
X-Google-Smtp-Source: AGHT+IGiTo87vlzfm7YxlUUnc8Xs6uMppHhulyIK54p68iyjckl+Nn9ZStWI2jzn16jLSxRNaQVZ4w==
X-Received: by 2002:a05:6000:438a:b0:39c:2665:2c13 with SMTP id ffacd0b85a97d-3a3537ac263mr52909f8f.54.1747257295851;
        Wed, 14 May 2025 14:14:55 -0700 (PDT)
Received: from linaro.org (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4d21esm21038746f8f.99.2025.05.14.14.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:14:55 -0700 (PDT)
Date: Wed, 14 May 2025 22:12:44 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
Message-ID: <aCUHTJGktLFhXq4Q@linaro.org>
References: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
 <20250506-qcom-apcs-mailbox-cc-v1-1-b54dddb150a5@linaro.org>
 <7vszdea2djl43oojvw3vlrip23f7cfyxkyn6jw3wc2f7yowht5@bgsc2pqscujc>
 <aCNGSwL7043GoJBz@linaro.org>
 <20250514160841.GA2427890-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514160841.GA2427890-robh@kernel.org>

On Wed, May 14, 2025 at 11:08:41AM -0500, Rob Herring wrote:
> On Tue, May 13, 2025 at 02:16:59PM +0100, Stephan Gerhold wrote:
> > On Sun, May 11, 2025 at 05:48:11PM -0500, Bjorn Andersson wrote:
> > > On Tue, May 06, 2025 at 03:10:08PM +0200, Stephan Gerhold wrote:
> > > > APCS "global" is sort of a "miscellaneous" hardware block that combines
> > > > multiple registers inside the application processor subsystem. Two distinct
> > > > use cases are currently stuffed together in a single device tree node:
> > > > 
> > > >  - Mailbox: to communicate with other remoteprocs in the system.
> > > >  - Clock: for controlling the CPU frequency.
> > > > 
> > > > These two use cases have unavoidable circular dependencies: the mailbox is
> > > > needed as early as possible during boot to start controlling shared
> > > > resources like clocks and power domains, while the clock controller needs
> > > > one of these shared clocks as its parent. Currently, there is no way to
> > > > distinguish these two use cases for generic mechanisms like fw_devlink.
> > > > 
> > > > This is currently blocking conversion of the deprecated custom "qcom,ipc"
> > > > properties to the standard "mboxes", see e.g. commit d92e9ea2f0f9
> > > > ("arm64: dts: qcom: msm8939: revert use of APCS mbox for RPM"):
> > > >   1. remoteproc &rpm needs mboxes = <&apcs1_mbox 8>;
> > > >   2. The clock controller inside &apcs1_mbox needs
> > > >      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>.
> > > >   3. &rpmcc is a child of remoteproc &rpm
> > > > 
> > > > The mailbox itself does not need any clocks and should probe early to
> > > > unblock the rest of the boot process. The "clocks" are only needed for the
> > > > separate clock controller. In Linux, these are already two separate drivers
> > > > that can probe independently.
> > > > 
> > > 
> > > Why does this circular dependency need to be broken in the DeviceTree
> > > representation?
> > > 
> > > As you describe, the mailbox probes and register the mailbox controller
> > > and it registers the clock controller. The mailbox device isn't affected
> > > by the clock controller failing to find rpmcc...
> > > 
> > 
> > That's right, but the problem is that the probe() function of the
> > mailbox driver won't be called at all. The device tree *looks* like the
> > mailbox depends on the clock, so fw_devlink tries to defer probing until
> > the clock is probed (which won't ever happen, because the mailbox is
> > needed to make the clock available).
> > 
> > I'm not sure why fw_devlink doesn't detect this cycle and tries to probe
> > them anyway, but fact is that we need to split this up in order to avoid
> > warnings and have the supplies/consumers set up properly. Those device
> > links are created based on the device tree and not the drivers.
> 
> Does "post-init-providers" providers solve your problem?
> 

I would expect that it does, but it feels like the wrong solution to the
problem to me. The clock is not really a post-init provider: It's not
consumed at all by the mailbox and needed immediately to initialize the
clock controller. The real problem in my opinion is that we're
describing two essentially distinct devices/drivers in a single device
node, and there is no way to distinguish that.

By splitting up the two distinct components into separate device tree
nodes, the relation between the providers/consumers is clearly
described.

Thanks,
Stephan
