Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFBB2580D6;
	Mon, 10 Feb 2025 16:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205245; cv=none; b=g+VCpJdLfrKg+SJzkRzXK3Ddj+BBaYf2DgJZMxhXn9CObKgfx43uDik1r6+10wPtnnqWukPUdrZfiQWWTZR2e2FB/EGDrPDGYcmiOjog/1eT1zPCpGLv0HLejP1/0z4D2LeGisj1e/U/O2NMy/411kgxpRolE+PvRC3aMQtVBJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205245; c=relaxed/simple;
	bh=ypPI17tsQZJ+km5A1XxVr29qienQSziXYMYp0ksACRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWN0x3I1GUAI1k3lSWeA+KaNb8mYmqFeG7bDAPzb0Zm2RhhXN10fu5Q6Bk6+DjXiNcDflr8F9BbRAoBsqcnsWZdzP7rXtu7LFO/WcmMSPIc5FE2Ep4ZzM9fEmp1CtqEI0LxCPFQhmArn5lvXdsKwwBXDDYc0fPeF45QqGhG6XzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UbOAsLYb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbOAsLYb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB4BC4CED1;
	Mon, 10 Feb 2025 16:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739205245;
	bh=ypPI17tsQZJ+km5A1XxVr29qienQSziXYMYp0ksACRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UbOAsLYbiPDE6IFDnojp9BT7SnzxEB0k4y8Gx/Svk6KcuRA1k7MSlL6OqBePE5pZh
	 ySqQaoBi0SE09abNaCF1a7/fiigSXGwH25hFaURTqp2GbnNFdEbln50QVCbf3m+upp
	 2NbxQSXcrc2i6tlRX/HG6iB8yAiZbWImA7PF/5Rbq+Q54UR+5EWm7XXYkYnt8ojPep
	 jrnnpDqf0zbexT37ShYnK4LId2LeH9Pe+UyditJy5p+X+uy58+Ojt6ZCwV47QjdYu1
	 ytnMly3T/kptepApjA0OYMFUCgahrWZUvQskboDowaB+TGCb94BBp7Ft6XWD5hMXC0
	 RNs7Yji3cEKDA==
Date: Mon, 10 Feb 2025 16:33:59 +0000
From: Lee Jones <lee@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 4/7] mfd: bcm590xx: Add compatible for BCM59054
Message-ID: <20250210163359.GA1868108@google.com>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
 <20250131-bcm59054-v3-4-bbac52a84787@gmail.com>
 <20250207084852.GC7593@google.com>
 <bc9df0fe-ff2b-439b-a434-b6b88ee8e25c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc9df0fe-ff2b-439b-a434-b6b88ee8e25c@gmail.com>

On Fri, 07 Feb 2025, Artur Weber wrote:

> On 7.02.2025 09:48, Lee Jones wrote:
> > On Fri, 31 Jan 2025, Artur Weber wrote:
> > 
> > > The BCM59056 supported by the bcm590xx driver is similar to the
> > > BCM59054 MFD. Add a compatible for it in the driver, in preparation
> > > for extending support of this chip in the bcm590xx regulator driver.
> > > 
> > > Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> > > ---
> > > Changes in v3:
> > > - Fix compilation warning about device_type pointer cast type
> > > - Name the device types enum and use it as the type in the MFD struct
> > > ---
> > >   drivers/mfd/bcm590xx.c       | 6 +++++-
> > >   include/linux/mfd/bcm590xx.h | 7 +++++++
> > >   2 files changed, 12 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
> > > index 8b56786d85d0182acf91da203b5f943556c08422..23036157480e0116301bfa93932c92f5a80010ea 100644
> > > --- a/drivers/mfd/bcm590xx.c
> > > +++ b/drivers/mfd/bcm590xx.c
> > > @@ -50,6 +50,9 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
> > >   	bcm590xx->dev = &i2c_pri->dev;
> > >   	bcm590xx->i2c_pri = i2c_pri;
> > > +	bcm590xx->device_type = \
> > > +			  (uintptr_t) of_device_get_match_data(bcm590xx->dev);
> > 
> > Why are you dividing pointers with each other?
> 
> That's not division, it's a line continuation (note the space before

The space is irrelevant in C.

> "\") - had to insert it for the line to fit in 80 characters. Though
> admittedly, there's probably a better way to do this than to force it
> with "\"...

You do not need to escape the line break in C-functions.

> I will clean this up in the next version.

You can use up to 100-chars these days, so you don't need the break at
all.  However, if you insist on keeping to the old 80-char rule, you can
just omit the escape char.

-- 
Lee Jones [李琼斯]
