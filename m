Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66834213E69;
	Fri, 30 May 2025 09:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748596638; cv=none; b=cJHR1eEHXIbZJFahK1bcA9nHodoY51lXfGnHsg0Kn7AcoxPapdTGpN1lTPzUK0rtIyIAaKPP3Y7QJqtkKMra1xP2RlAIbBUOTvQNGoClnb84K0xTmQZHhH+TQfVX+WEblvUGeWehwWU137JXB03fnc1BEHn+/9EFVId008KQpYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748596638; c=relaxed/simple;
	bh=rvOVWJD5+xqMqRK/AGl01bB/hKBxArXk3yGsiYQz278=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Emy2AqJZecsGy550AYwtEgMl/fCHSFc8Ey974qEjHi5dC4I/ZM6EM7298BXqCAojHF2NlfEnL14p+unCZElrPeQgEoTaQlzegSquXCfb78mp84R8m35fyRx04LWmUZmL4hx5G+MBCuqbNqIYKhWlTupqimTUANtc+YZnnj8+nEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qdssh3k1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qdssh3k1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C91FC4CEE9;
	Fri, 30 May 2025 09:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748596637;
	bh=rvOVWJD5+xqMqRK/AGl01bB/hKBxArXk3yGsiYQz278=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qdssh3k1UwPO6qsM3u4ZvtuEHTcMUtaTI1MVf3+Q1Tq4rduKU2AbsCU7qFM1bFIWx
	 FV+aBu4YPbVVB+82MWwqg5kTpmUmmZ1+XuebfeHK2lzuk9Qrqs12pkGnXu6ouOrHHg
	 aSaehZrAvwYIeyN0safPGRwq5cMhEcAovlrBAqx45WlUwcVJ0UY6QbuCfUVX6NUmgz
	 +tb8W953Z/l4XWUma45ZpFEIHvzrXkEGa/fO6Wgo+sLO7+cXPnSPD/ssY4rC2IKxvv
	 T2cTeBeBkwkFvSqY0RaO9vxH6PQ96u2Y3inr8iGqkzCXYmawjvZuE4OtMEIUng7iV9
	 tV136S6pLrzNg==
Date: Fri, 30 May 2025 11:17:09 +0200
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
	Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
Message-ID: <aDl3lXiw3+l43+Cj@lpieralisi>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org>
 <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>
 <aDhtVkHfJvDfkfaX@lpieralisi>
 <CAFEAcA-=0GWG+rnHDOnsHg8cUq1pszN=x1-W+4MYZXXD8H8Pkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-=0GWG+rnHDOnsHg8cUq1pszN=x1-W+4MYZXXD8H8Pkg@mail.gmail.com>

[+Suzuki]

On Thu, May 29, 2025 at 03:30:51PM +0100, Peter Maydell wrote:
> On Thu, 29 May 2025 at 15:21, Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > On Thu, May 29, 2025 at 02:17:26PM +0100, Peter Maydell wrote:
> > > The dt bindings do allow for describing Secure-world devices:
> > > Documentation/devicetree/bindings/arm/secure.txt has the
> > > details. We use this in QEMU so we can provide a DTB to
> > > guest EL3 firmware that tells it where the hardware is
> > > (and which EL3 can then pass on to an NS kernel). It would
> > > be helpful for the GICv5 binding to be defined in a way that
> > > we can do this for a GICv5 system too.
> > >
> > > > Two questions:
> > > >
> > > > - I don't have to spell out the IRS/ITS config frame (and SETLPI, by
> > > >   the way) as non-secure, since that's implicit, is that correct ?
> > >
> > > Do you want the DT binding to handle the case of "CPU and GIC do not
> > > implement EL3, and the only implemented security state is Secure"
> > > without the kernel needing to do something different from "ditto ditto
> > > but the only implemented security state is Nonsecure" ?
> >
> > Not sure I follow you here sorry :)
> 
> In a hypothetical system like that the dt could either
> define the (only) IRS frame in reg[], or in secure-reg[].
> The former would let the kernel not care about the fact it was
> in Secure, but would be a bit weird. But I think we can probably
> ignore this hypothetical in favour of keeping the binding simple.
> 
> > > (Currently booting.html says you must be in NS, so we effectively
> > > say we don't support booting on this particular unicorn :-)
> > > But the secure.txt bindings envisage "kernel got booted in S",
> > > mostly for the benefit of aarch32.)
> > >
> > > > - How can the schema describe, if present, EL3, Secure and Realm frames ?
> > >
> > > The tempting thing to do is to have regs[] list the frames
> > > in some given order, but the spec makes them not simple
> > > supersets, allowing all of:
> > >  * NS
> > >  * S
> > >  * NS, S, EL3
> > >  * NS, Realm, EL3
> > >  * NS, Realm, S, EL3
> > >
> > > secure.txt says:
> > > # The general principle of the naming scheme for Secure world bindings
> > > # is that any property that needs a different value in the Secure world
> > > # can be supported by prefixing the property name with "secure-". So for
> > > # instance "secure-foo" would override "foo".
> > >
> > > So maybe we could have
> > >  reg : the NS frame(s)
> > >  secure-reg : the S frame(s)
> > >  realm-reg : the Realm frame(s)
> > >  root-reg : the EL3 frame(s)
> > >
> > > ??
> >
> > I assume someone has to write the root/realm binding extensions.
> >
> > In Documentation/devicetree/bindings/arm/secure.txt I don't think that
> > reg is a contemplated property - I don't know if the list of properties
> > is up-to-date.
> 
> It's up to date in the sense that so far we've only needed
> to have the 'status' property have a secure- variant. My
> suggestion here is that we might extend that to also allow
> secure-reg, and to have root- and realm- prefixes too.
> Though I don't think we would want to permit secure-reg for
> any old device, so maybe something more-GICv5-specific would
> work better.

I am not sure this is a GICv5 only requirement (looking at SMMUv3,
for instance and there might be more IPs that require security
state awareness).

Or maybe it is a non-existing problem IIUC the paragraph below
correctly (albeit to be frank I don't understand how to determine
whether a dtb is consumed by eg secure-world-only).

"Note that it is still valid for bindings intended for purely Secure
world consumers (like kernels that run entirely in Secure) to simply
describe the view of Secure world using the standard bindings. These
secure- bindings only need to be used where both the Secure and Normal
world views need to be described in a single device tree."

I assume "standard bindings" there would mean that "reg" for the
GICv5 would be just eg "config frame" with no NS/S/Realm/Root attached.

We don't strictly need to have the same dts file for NS and S (example),
NS will never "need" the S bindings at least for GICv5.

Thoughts ?

Thanks,
Lorenzo
