Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CDA8F5B;
	Thu, 29 May 2025 14:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748528479; cv=none; b=duxOvAQPSNDr22BtUY1d5KBVGO+xaeMOg1dKKawedthiOXbl8m2Znv02iIPHSJHRgQUkqEv79BWG2iMtGjrVaHovN1FLASbzdkUWIPw2aKLn8BE/5L0KQe6g17iCbzP4P3xdL9dujVLbimXBcAnz88V4G47NuRosl5Yzg7K7x8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748528479; c=relaxed/simple;
	bh=myGypAtrlqF5QAHUeHQu/mXkeB8quQt8Js7lwyNSDAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQVuKcBOAw7VJnsT/RHL2HL1vmTzImdNABdYXAGjL+YsqZ4Vb6bMVWWXUzkNoYnqPICU05+nuBhvOQbh1x57ft+36ZvUsg65QDBgd3VhNnXElFmuvosE3dWT+RAL2TpR/q0yiyUh1vIkCXBHJmJW+YGLhIJV5LItWIekAw9aPwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJLh73X4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJLh73X4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D2DC4CEE7;
	Thu, 29 May 2025 14:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748528479;
	bh=myGypAtrlqF5QAHUeHQu/mXkeB8quQt8Js7lwyNSDAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eJLh73X4YcITKyQPqx52wB2t0hNu4C5ASGe6s0sIXIMoBYcwNXk9FD4mWCp+2lHMx
	 wdcq1dR2LIxZ7Cw3OrugA4pn3fMloQ4lfhE7uVYI0+bVEWgpjh8YW2gZbfIEfggN6N
	 pogU96zX/N20nG58C5KGWM9x8w/iujRuxx4wIer2H4FAdPXIKsIFUga4dnPZ86tw31
	 /q7Pf0BHm6agrKIzDxd6a6m8OfddVtJMxLUdeEiz1p190oL7VETrlZtq50s7rCJD14
	 PHNsR8YAB4RaKJzQEWulTcnYRQ7t+MmO/WR7PXq1bQngU5q8g0wS6Ktrvd8CmPl3XG
	 JXrEUTpIl7iAw==
Date: Thu, 29 May 2025 16:21:10 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, andre.przywara@arm.com,
	Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
Message-ID: <aDhtVkHfJvDfkfaX@lpieralisi>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org>
 <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>

On Thu, May 29, 2025 at 02:17:26PM +0100, Peter Maydell wrote:
> On Thu, 29 May 2025 at 13:44, Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> >
> > [+Andre, Peter]
> >
> > On Tue, May 13, 2025 at 07:47:54PM +0200, Lorenzo Pieralisi wrote:
> > > +      reg:
> > > +        minItems: 1
> > > +        items:
> > > +          - description: IRS control frame
> >
> > I came across it while testing EL3 firmware, raising the topic for
> > discussion.
> >
> > The IRS (and the ITS) has a config frame (need to patch the typo
> > s/control/config, already done) per interrupt domain supported, that is,
> > it can have up to 4 config frames:
> >
> > - EL3
> > - Secure
> > - Realm
> > - Non-Secure
> >
> > The one described in this binding is the non-secure one.
> >
> > IIUC, everything described in the DT represents the non-secure address
> > space.
> 
> The dt bindings do allow for describing Secure-world devices:
> Documentation/devicetree/bindings/arm/secure.txt has the
> details. We use this in QEMU so we can provide a DTB to
> guest EL3 firmware that tells it where the hardware is
> (and which EL3 can then pass on to an NS kernel). It would
> be helpful for the GICv5 binding to be defined in a way that
> we can do this for a GICv5 system too.
> 
> > Two questions:
> >
> > - I don't have to spell out the IRS/ITS config frame (and SETLPI, by
> >   the way) as non-secure, since that's implicit, is that correct ?
> 
> Do you want the DT binding to handle the case of "CPU and GIC do not
> implement EL3, and the only implemented security state is Secure"
> without the kernel needing to do something different from "ditto ditto
> but the only implemented security state is Nonsecure" ?

Not sure I follow you here sorry :)

> (Currently booting.html says you must be in NS, so we effectively
> say we don't support booting on this particular unicorn :-)
> But the secure.txt bindings envisage "kernel got booted in S",
> mostly for the benefit of aarch32.)
> 
> > - How can the schema describe, if present, EL3, Secure and Realm frames ?
> 
> The tempting thing to do is to have regs[] list the frames
> in some given order, but the spec makes them not simple
> supersets, allowing all of:
>  * NS
>  * S
>  * NS, S, EL3
>  * NS, Realm, EL3
>  * NS, Realm, S, EL3
> 
> secure.txt says:
> # The general principle of the naming scheme for Secure world bindings
> # is that any property that needs a different value in the Secure world
> # can be supported by prefixing the property name with "secure-". So for
> # instance "secure-foo" would override "foo".
> 
> So maybe we could have
>  reg : the NS frame(s)
>  secure-reg : the S frame(s)
>  realm-reg : the Realm frame(s)
>  root-reg : the EL3 frame(s)
> 
> ??

I assume someone has to write the root/realm binding extensions.

In Documentation/devicetree/bindings/arm/secure.txt I don't think that
reg is a contemplated property - I don't know if the list of properties
is up-to-date.

If what you suggest is OK, is it really needed to add the
{secure/realm/root}-reg property to this binding ?

Or implicitly a, say, realm-reg property is allowed using the
yet-to-be-written realm.txt rules ?

This would also slightly change the "required" properties, a "reg"
property would not be required if eg the GIC does not implement a NS
interrupt domain (but we would require a secure-reg if it implements a
secure interrupt domain). I am making this up, obviously, I don't know
what's best to do here.

Lorenzo
