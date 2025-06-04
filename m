Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E7722DA17;
	Wed,  4 Jun 2025 07:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749021888; cv=none; b=ikKlO79bTeaw/f7s4KyB3k7wrwLFSyF2g5XERNnAoSd3mrnJ5u9IbibvUsxmLeON6lTf0jVENlVs96zf9VpnMKD8UonvWJ5s3tRzynHjoCfkjbj6F79XEkynrjPW3DxZcCq/BAF9WHM1ClmJhBzhb1GJwDnvP5Zi+xqO5mgqdWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749021888; c=relaxed/simple;
	bh=d5VGZY3wjHIhKCGDSeV6VZbiBPYwu9t4ayf8AO8OlwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/uNeO0tEagujOPUnteyJffivUmpFoBFjo305mmyAtnM4hMecE9S9xqh/2QSMmytvWY40c8eAFS1sdS9DWO0LJ5Rn4eoyI3HOshQLDC0D2L2mEFmpBtfBSSeeTH4obd2+9stFpKHx1GxNXob4nVsPHGZOJV4m2Efv8bgiccQbsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=odyy8wQ5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="odyy8wQ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD61C4CEE7;
	Wed,  4 Jun 2025 07:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749021887;
	bh=d5VGZY3wjHIhKCGDSeV6VZbiBPYwu9t4ayf8AO8OlwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=odyy8wQ5ON02zPffOE2SJpBxUwUYz5rmT5lsE2yOgNbb2cDXnIwb0ACfUhTX9uK8c
	 bqVyvG+X44TOpZ6BjZz+yFBUGipEXDmEzroDs9BVd6rU1kd+cBPUWr4UygZJrRyDew
	 2CvhfHn6EhiRYyOc99eZpfidTitTHMZs/OH+xzIToCaZNP4v3VLaXeHt8xZCAG+AR1
	 HygqPF1tjl1zS5OKj2rvtKGX5HTGDoSj7qKMgGJEKYXjlNWHRkXg0QWLSlkBw8asQD
	 FH64MJHBBiUK2uTUApfPhWXBcE6MzA63npN2mN7MtdGj9u9vf32BHi+hkcr+OfHtVx
	 QFPWrpJi2/V7A==
Date: Wed, 4 Jun 2025 09:24:38 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
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
Message-ID: <aD/0tuak7Hja8k4g@lpieralisi>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org>
 <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>
 <aD6ouVAXy5qcZtM/@lpieralisi>
 <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
 <CAFEAcA-JrS0BiT66iin-pRVFadrY-pnJZ8TkDNxcjErknSCnUA@mail.gmail.com>
 <CAL_JsqL7x53an2-MaLHP5tfVXb4JxT8ORUMaA8pL-gMsWLJqkA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqL7x53an2-MaLHP5tfVXb4JxT8ORUMaA8pL-gMsWLJqkA@mail.gmail.com>

On Tue, Jun 03, 2025 at 02:11:34PM -0500, Rob Herring wrote:
> On Tue, Jun 3, 2025 at 10:37 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Tue, 3 Jun 2025 at 16:15, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Tue, Jun 3, 2025 at 2:48 AM Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > > >
> > > > On Thu, May 29, 2025 at 02:17:26PM +0100, Peter Maydell wrote:
> > > > > secure.txt says:
> > > > > # The general principle of the naming scheme for Secure world bindings
> > > > > # is that any property that needs a different value in the Secure world
> > > > > # can be supported by prefixing the property name with "secure-". So for
> > > > > # instance "secure-foo" would override "foo".
> > >
> > > Today I would say a 'secure-' prefix is a mistake. To my knowledge,
> > > it's never been used anyways. But I don't have much visibility into
> > > what secure world firmware is doing.
> >
> > QEMU uses it for communicating with the secure firmware if
> > you run secure firmware on the virt board. It's done that
> > since we introduced that binding. Indeed that use case is *why*
> > the binding is there. It works fine for the intended purpose,
> > which is "most devices are visible in both S and NS, but a few
> > things are S only (UART, a bit of RAM, secure-only flash").
> 
> I meant "secure-" as a prefix allowed on *any* property, not
> "secure-status" specifically, which is the only thing QEMU uses
> AFAICT. IOW, I don't think we should be creating secure-reg,
> secure-interrupts, secure-clocks, etc.

Reading secure.txt, what does it mean "device present and usable in
the secure world" ?

So:

status = "disabled"
secure-status = "okay"

basically means that the device in question allows secure-only MMIO
access, is that what it says ?

If that's the case and we really want to have all config frames
in a single DT, would it be reasonable to have an IRS/ITS DT node
per-frame ?

Then yes, the secure- tag is not enough any longer (because we have to
cope with 4 interrupt domains) but that's a separate problem - again,
this would leave the current reviewed bindings unchanged.

Other than that as I mentioned we could use (? aka clutching at straws)
reg-names but I don't think it is correct to have in the DT address
space that the CPU is not allowed to address.

Lorenzo
