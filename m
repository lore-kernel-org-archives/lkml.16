Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32802620D2;
	Wed, 25 Jun 2025 13:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750858432; cv=none; b=Q2JED0sEhUYjG6uBr9RtX6E1yO63ow1QFLN8LPWaiL0lj4zD1rJ0grD63JVq37YuhJJJ0LRo4A7ELRVc7N31ES8NpH218YJMdE+s8T8Zzmd9lgkoLFjOsDZtI1dF7ly53bUObHMPrdL9+T038RfMesNPMGgnJcquH/kV2/WuXFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750858432; c=relaxed/simple;
	bh=5bv7+U7nnAG09/EUeVfNCF6vC1VSNp7LCmluSKx+V1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AiZA185/LbtAotX/S4Q1XhzuGHNN2IQG7/17slx+T9InazA+/YtptgtRQKosYGB6bhPu39CMaDXk2FNDRn66XGJs+Hh8QNagbrWUrw67uSaiAQ7pff4DoGUA7FrStMhM8StpzLKKVJ+krRxM9g7o6sQjmhT+8TrDdkNpsiRrWqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZwD25OEC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZwD25OEC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2503EC4CEEF;
	Wed, 25 Jun 2025 13:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750858432;
	bh=5bv7+U7nnAG09/EUeVfNCF6vC1VSNp7LCmluSKx+V1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZwD25OECifOJ1XdOx/F1AthVoH+pnNjkiLHqyp4F8hUjFBtsoCPqgYzHkBrJ5Ir8a
	 uyNZzswqHEYrbRzT2Y3H8j6KMOMMl+Hc2SBanWN5acDeEIfU7ZtcKRBm5WsQYXL9fA
	 fGKQrtWTl0hTwR/Nq1hREfz64/v8aR1HVxVLRstmAlrhNTHEugEdtYnWPmPGRyhVh4
	 T6VEoQSBGUe9s1CKYdZ3cviEZtppKPLzBun40I5K4YoHi9oqYx7DQDQ3zOQI7vo4wX
	 VXxFiKTjXJrzOIrm0cC1OmOeBMvjDIGdoLAI+Z2fh6AOH8oTxrG/TA6+qDBWzui/cd
	 mHD2Cg1QFE05A==
Date: Wed, 25 Jun 2025 14:33:46 +0100
From: Lee Jones <lee@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] mfd: spacemit: add support for SpacemiT PMICs
Message-ID: <20250625133346.GW795775@google.com>
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-3-elder@riscstar.com>
 <20250619144023.GG795775@google.com>
 <8126de92-0338-4cd0-98fc-4f8c37500201@riscstar.com>
 <20250625082149.GO795775@google.com>
 <5005ba79-d5a5-4d6f-ab0c-4df51407a549@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5005ba79-d5a5-4d6f-ab0c-4df51407a549@riscstar.com>

On Wed, 25 Jun 2025, Alex Elder wrote:

> On 6/25/25 3:21 AM, Lee Jones wrote:
> > On Fri, 20 Jun 2025, Alex Elder wrote:
> > 
> > > On 6/19/25 9:40 AM, Lee Jones wrote:
> > > > On Fri, 13 Jun 2025, Alex Elder wrote:
> > > > 
> > > > > Add support for SpacemiT PMICs. Initially only the P1 PMIC is supported
> > > > > but the driver is structured to allow support for others to be added.
> > > > > 
> > > > > The P1 PMIC is controlled by I2C, and is normally implemented with the
> > > > > SpacemiT K1 SoC.  This PMIC provides six buck converters and 12 LDO
> > > > 
> > > > six or 12.  Please pick a format and remain consistent.
> > > 
> > > "Numbers smaller than ten should be spelled out."
> > 
> > Never heard of that before Googling it.  Formal writing is odd. :)
> > 
> > > But I'll use 6 and 12.
> 
> . . .
> 
> > > > > +/* The name field defines the *driver* name that should bind to the device */
> > > > 
> > > > This comment is superfluous.
> > > 
> > > I'll delete it.
> > > 
> > > I was expecting the driver to recognize the device, not
> > > the device specifying what driver to use, but I guess
> > > I'm used to the DT model.
> > 
> > Even in DT, the *driver* compatible is specified.
> > 
> >    .driver.of_match_table->compatible
> 
> I guess I just interpret that differently than you do.  I think
> of the device compatible string as saying "this is what I am,"
> much like a VID/PID in USB or PCI.
> 
> Then the driver's of_match table says "if a device claims to
> be compatible with any of these it should be bound to me."
> 
> Meanwhile, the MFD device method has the device (cell) saying
> "I should be bound to the driver having this name."

In all cases that I'm aware of (platform code, DT, ACPI, etc), and as
far back as I can remember, the platform devices specify some predefined
data (IDs or strings) that is associated with (hard-coded directly into
the driver in fact) the driver it wishes to be bound to.  This
pre-defined identifier is stored in the driver's data structure:

struct device_driver {
        const char              	*name;
        const struct of_device_id       *of_match_table;
        const struct acpi_device_id     *acpi_match_table;
};

All of these are statically hard-coded items which a device can specify
in order to be bound to the driver.

> > > > > +	/* We currently have no need for a device-specific structure */
> > > > 
> > > > Then why are we adding one?
> > > 
> > > I don't understand, but it might be moot once I add support
> > > for another (sub)device.
> > 
> > There are 2 rules in play here:
> > 
> >    - Only add what you need, when you need it
> >    - MFDs must contain more than 1 device
> > 
> > ... and you're right.  The second rule moots the first here.
> 
> What the comment meant to say is "we have no need to kzalloc()
> any special structure here" as most drivers do. Simply adding
> the set of MFDs defined by the cells is enough.  The same is
> true in "simple-mfd-i2c.c".

I see.  Driver data is not compulsory.  There are plenty of drivers
which refrain from storing data for the child to make use of.

> But this entire source file is gone now, so it's moot for that
> reason.
> 
> . . .
> 
> > > > > +static const struct of_device_id spacemit_pmic_match[] = {
> > > > > +	{
> > > > > +		.compatible	= "spacemit,p1",
> > > > > +		.data		= &p1_pmic_data,
> > > > 
> > > > Ah, now I see.
> > > > 
> > > > We do not allow one data from registration mechanism (MFD) to be piped
> > > > through another (OF).  If you have to match platform data to device (you
> > > > don't), then pass through identifiers and match on those in a switch()
> > > > statement instead.
> > > 
> > > I haven't done an MFD driver before and it took some time
> > > to get this working.  I'll tell you what led me to it.
> > > 
> > > I used code posted by Troy Mitchell (plus downstream) as a
> > > starting point.
> > >    https://lore.kernel.org/lkml/20241230-k1-p1-v1-0-aa4e02b9f993@gmail.com/
> > > 
> > > Krzysztof Kozlowski made this comment on Troy's DT binding:
> > >    Drop compatible, regulators are not re-usable blocks.
> > > 
> > > So my goal was to have the PMIC regulators get bound to a
> > > driver without specifying a DT compatible string, and I
> > > found this worked.
> > > 
> > > You say I don't need to match platform data to device, but
> > > if I did I would pass through identifiers.  Can you refer
> > > me to an example of code that correctly does what I should
> > > be doing instead?
> > 
> > git grep -A5 compatible -- drivers/mfd | grep -E "\.data = .*[A-Z]+"
> > 
> > Those identifiers are usually matched in a swtich() statement.
> 
> OK now I see what you you're talking about.  But these
> compatible strings (and data) are for the PMIC.  I was
> trying to avoid using compatible strings for the *regulators*,
> based on Krzysztof's comment.  And in the process I learned
> that the MFD cell needs to specify the name of a driver,
> not a compatible string.

That's correct.  The compatible attribute is voluntary.

> > > One other comment/question:
> > >    This driver is structured as if it could support a different
> > >    PMIC (in addition to P1).  Should I *not* do that, and simply
> > >    make a source file hard-coded for this one PMIC?
> > 
> > This comes back to the "add only what you need, when you need it" rule.
> 
> Yes, and I agree with that rule.  Thanks for your clarifications.
> 
> Using simple-mfd-i2c.c is much better.  I was surprised (and I guess
> pleased) to see that it was almost *identical* to what I came up with.

*thumbs-up*

-- 
Lee Jones [李琼斯]
