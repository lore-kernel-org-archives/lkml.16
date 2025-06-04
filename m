Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185424C7C;
	Wed,  4 Jun 2025 16:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749054938; cv=none; b=qf4D2LQ6BXBhZHdsZRdbw3pBjIh//HuAwDg08PGKxxrJLpUAvaan72H8BAR20R6723q8FgY+UxP7p4OW4Ummlba4izvn3FSt7Gw4beMSzKrNebGaKKNdNCWc7VnR1/5Zf8xkW4M3zp6eTgcHvs7IWA4m3vt/zhKY7YZDTUWaSWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749054938; c=relaxed/simple;
	bh=bvurVI1LpPnY3JIRxy7/BJjVKXElOxjO6xxlddeu1CU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGYM9uXh0aZAdlgw/6+Mu7KM0rXYTS5x1EdB7mAH15sUs/EqLC8ux284glD8qXrWHpsXAN3HUlDDd0shMvTuswNlTHXWGSAsZrzCruFZkRD65A3akYsPzTvHiAT1Wsph/HUEMt0fMhMLlsIi2dvsl5T9oHw7yx79e+sXNORhLaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=scI70OW0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="scI70OW0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4B8C4CEE4;
	Wed,  4 Jun 2025 16:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749054937;
	bh=bvurVI1LpPnY3JIRxy7/BJjVKXElOxjO6xxlddeu1CU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=scI70OW08HFi5o6W890W7Xetgm51jFGoRvAoyEflLYSXv+VQ1O9lNMBkXQg7lxYXX
	 wh+7cLfW5d0l6zyyM4qgVCV8tg2Kxv0t+yFa5rj2PwHlXUApQvsnR094N1fzvveMDG
	 GH2kwyvLqrF3jFffdFDiVh7zRdHIb9YV8CyW0wcgZUIkOFR6FpStap15X4vDLufD+v
	 /AWrul29FnQbuy41U467dT4+53KeuNzGqw90T+h1pA8Lm+w3Q9A8KZ54BDMaYqJ6su
	 fAZSBbVmOckDm4vnEZOzZRlrm6D+FJPBeTj1jeIiwUShd4zzC5bQyIW7wNuugFXzHI
	 l24x4Ijc1RLGA==
Date: Wed, 4 Jun 2025 18:35:28 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
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
	devicetree@vger.kernel.org, suzuki.poulose@arm.com
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
Message-ID: <aEB10JC1bwwOJfWh@lpieralisi>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org>
 <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>
 <aD6ouVAXy5qcZtM/@lpieralisi>
 <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
 <CAFEAcA-JrS0BiT66iin-pRVFadrY-pnJZ8TkDNxcjErknSCnUA@mail.gmail.com>
 <CAL_JsqL7x53an2-MaLHP5tfVXb4JxT8ORUMaA8pL-gMsWLJqkA@mail.gmail.com>
 <aD/0tuak7Hja8k4g@lpieralisi>
 <878qm7ec19.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878qm7ec19.wl-maz@kernel.org>

On Wed, Jun 04, 2025 at 04:56:02PM +0100, Marc Zyngier wrote:
> On Wed, 04 Jun 2025 08:24:38 +0100,
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > 
> > On Tue, Jun 03, 2025 at 02:11:34PM -0500, Rob Herring wrote:
> > > On Tue, Jun 3, 2025 at 10:37 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > > >
> > > > On Tue, 3 Jun 2025 at 16:15, Rob Herring <robh@kernel.org> wrote:
> > > > >
> > > > > On Tue, Jun 3, 2025 at 2:48 AM Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > > > > >
> > > > > > On Thu, May 29, 2025 at 02:17:26PM +0100, Peter Maydell wrote:
> > > > > > > secure.txt says:
> > > > > > > # The general principle of the naming scheme for Secure world bindings
> > > > > > > # is that any property that needs a different value in the Secure world
> > > > > > > # can be supported by prefixing the property name with "secure-". So for
> > > > > > > # instance "secure-foo" would override "foo".
> > > > >
> > > > > Today I would say a 'secure-' prefix is a mistake. To my knowledge,
> > > > > it's never been used anyways. But I don't have much visibility into
> > > > > what secure world firmware is doing.
> > > >
> > > > QEMU uses it for communicating with the secure firmware if
> > > > you run secure firmware on the virt board. It's done that
> > > > since we introduced that binding. Indeed that use case is *why*
> > > > the binding is there. It works fine for the intended purpose,
> > > > which is "most devices are visible in both S and NS, but a few
> > > > things are S only (UART, a bit of RAM, secure-only flash").
> > > 
> > > I meant "secure-" as a prefix allowed on *any* property, not
> > > "secure-status" specifically, which is the only thing QEMU uses
> > > AFAICT. IOW, I don't think we should be creating secure-reg,
> > > secure-interrupts, secure-clocks, etc.
> > 
> > Reading secure.txt, what does it mean "device present and usable in
> > the secure world" ?
> > 
> > So:
> > 
> > status = "disabled"
> > secure-status = "okay"
> > 
> > basically means that the device in question allows secure-only MMIO
> > access, is that what it says ?
> > 
> > If that's the case and we really want to have all config frames
> > in a single DT, would it be reasonable to have an IRS/ITS DT node
> > per-frame ?
> > 
> > Then yes, the secure- tag is not enough any longer (because we have to
> > cope with 4 interrupt domains) but that's a separate problem - again,
> > this would leave the current reviewed bindings unchanged.
> 
> No, this is the same problem, and we need a way to address it.
> "secure-*" doesn't cut it in a system with FEAT_RME, where resources
> are only available to a single Physical Address Space (PAS). So we
> need a way to qualify these resources with a PAS.

Can I ask again what:

status = "disabled"
secure-status = "okay"

for a device means in practice in the current bindings ?

When I said "a separate problem", I meant that, extending secure- tag
(that applies to the "status" property only) to cover other PASes is
independent from the GICv5 binding *if* we define, for a single DT an eg
IRS device per-PAS (with realm-status, root-status, describing what the
reg property represents. Is that what secure-status does today ? Does
it say "this device MMIO space is secure-only" ?).

It does not look like there is much appetite for tagging the reg
property either and making it GICv5 specific is a shortcut IMO.

> Either that, or we have to restrict DT to describe the view of a
> single PAS. Which Peter will understandably be unhappy about.

Well, I listed a couple of options in this thread, let's try
to converge.

Thanks,
Lorenzo
