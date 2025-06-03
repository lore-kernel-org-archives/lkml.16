Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DD023371F;
	Tue,  3 Jun 2025 15:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748966016; cv=none; b=K2GbPqkWkcHSJnGZN9ADWN85Y8ila8MMVwFDrkw4FzfRDFs8qkfelv8S+hMPNgKZWbL1rrdZMSOMIeyJCWKvbFyp8zpfU/8S3Ug7xBDoGmHUgx6mb0FRD4jJehnFUPPbQjjAiRXlneigAoBm0dRjChkLfU3ENn8N8EG1YSydhbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748966016; c=relaxed/simple;
	bh=ujm9MuI/e9VolCk4e0eb1/DBEfCNPcM/FoVXZk/NeXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0dQ27oGny56PKOojL9HTNY16x08Dv6mc7sakLzhs3HoXpKlw7d0PRbRLQ3APLb7JQCUEuqqSJqotywHyw0Hq3vnXhjV4RYpGHScPwYv09h7s23vJ5BE/KgwEO+SScyD4oHyjP9KDxhTmv30Dm6Ddbb3MVzAtGg8XAO7PfL2mVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUPrDeKN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUPrDeKN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C608BC4CEED;
	Tue,  3 Jun 2025 15:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748966015;
	bh=ujm9MuI/e9VolCk4e0eb1/DBEfCNPcM/FoVXZk/NeXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bUPrDeKN6S5ATwkVju4UuE4PGM3yT9mWmZc47U6x6ymNepe8Gv/IW133YFTeBEo/T
	 mnbFsDX11nCCrBnr+7UZXR+8fDAiEeeDkOBC6Voi4Mr+t8pGTQemHkMHUQYu1HOHPV
	 iSiMGus9LNTzHAQnu/Eq4CxyS8Cxd9WFY4k29P2UGrirQARIhAo6hXLRzZ5vyksPjD
	 LRYWBBdAF2u64Nt+OvCOJEPXAI2wu1MpPPMHTNRPI8SZBa9N7eJqhZ/pXj5JuwcyLw
	 wFSM/vfOvFIBFt229CJhraqS3Q0mpDEWujvVM3Y2J21iiiCQc9K6romdITw/Snp9Ez
	 uP9JCowCZNdWA==
Date: Tue, 3 Jun 2025 17:53:26 +0200
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
Message-ID: <aD8adnQWcII5XO2J@lpieralisi>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org>
 <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>
 <aD6ouVAXy5qcZtM/@lpieralisi>
 <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>

On Tue, Jun 03, 2025 at 10:15:25AM -0500, Rob Herring wrote:
> On Tue, Jun 3, 2025 at 2:48 AM Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> >
> > On Thu, May 29, 2025 at 02:17:26PM +0100, Peter Maydell wrote:
> > > On Thu, 29 May 2025 at 13:44, Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > > >
> > > > [+Andre, Peter]
> > > >
> > > > On Tue, May 13, 2025 at 07:47:54PM +0200, Lorenzo Pieralisi wrote:
> > > > > +      reg:
> > > > > +        minItems: 1
> > > > > +        items:
> > > > > +          - description: IRS control frame
> > > >
> > > > I came across it while testing EL3 firmware, raising the topic for
> > > > discussion.
> > > >
> > > > The IRS (and the ITS) has a config frame (need to patch the typo
> > > > s/control/config, already done) per interrupt domain supported, that is,
> > > > it can have up to 4 config frames:
> > > >
> > > > - EL3
> > > > - Secure
> > > > - Realm
> > > > - Non-Secure
> > > >
> > > > The one described in this binding is the non-secure one.
> > > >
> > > > IIUC, everything described in the DT represents the non-secure address
> > > > space.
> > >
> > > The dt bindings do allow for describing Secure-world devices:
> > > Documentation/devicetree/bindings/arm/secure.txt has the
> > > details. We use this in QEMU so we can provide a DTB to
> > > guest EL3 firmware that tells it where the hardware is
> > > (and which EL3 can then pass on to an NS kernel). It would
> > > be helpful for the GICv5 binding to be defined in a way that
> > > we can do this for a GICv5 system too.
> >
> > It would be good to understand what DT {should/should not} describe and
> > whether this DT usage to configure firmware is under the DT maintainers
> > radar or it is an attempt at reusing it to avoid implementing a
> > configuration scheme.
> >
> > Rob, Krzysztof,
> >
> > Any thoughts on the matter please ?
> 
> I'm all for firmware using DT, but using a single DT for all
> components with an ABI between all components is an impractical dream.
> You can take that a step further even with a single DT for all
> processors in a system (aka System DT). Ultimately, the DT is a view
> of the system for a client (OS). Different views may need different
> DTs.

Specifically, for IRS/ITS frames then - what the current schema does is
correct, namely, it does _not_ spell out whether the IRS/ITS config
frame is NS/S/Realm/Root interrupt domain, that's information that the
client implicitly assumes.

Are we OK with this approach ? This would leave open the possibility
of having a DT per security-state.

If in the DT schema I define eg reg -> "IRS NS config frame" by
construction the binding can't be used for anything else.

Please let me know if we are in agreement on this matter.

Lorenzo

> u-boot and Linux sharing a DT makes sense as they have the same world
> view. Secure and NS not so much.
> 
> > [...]
> >
> > > The tempting thing to do is to have regs[] list the frames
> > > in some given order, but the spec makes them not simple
> > > supersets, allowing all of:
> > >  * NS
> > >  * S
> > >  * NS, S, EL3
> > >  * NS, Realm, EL3
> > >  * NS, Realm, S, EL3
> >
> > Maybe reg-names can help ? Even though first we need to understand
> > what resources should be described in DT.
> >
> > Current bindings are reviewed and I am not keen on dragging this
> > discussion on forever - the information the kernel requires is there,
> > I'd like to bring this to a close.
> >
> > Thanks,
> > Lorenzo
> >
> > >
> > > secure.txt says:
> > > # The general principle of the naming scheme for Secure world bindings
> > > # is that any property that needs a different value in the Secure world
> > > # can be supported by prefixing the property name with "secure-". So for
> > > # instance "secure-foo" would override "foo".
> 
> Today I would say a 'secure-' prefix is a mistake. To my knowledge,
> it's never been used anyways. But I don't have much visibility into
> what secure world firmware is doing.
> 
> > >
> > > So maybe we could have
> > >  reg : the NS frame(s)
> > >  secure-reg : the S frame(s)
> > >  realm-reg : the Realm frame(s)
> > >  root-reg : the EL3 frame(s)
> 
> Here's why. It really doesn't scale.
> 
> Rob
