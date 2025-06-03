Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1563E2C3240;
	Tue,  3 Jun 2025 07:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748936901; cv=none; b=eFXkuu/nCyqUovr9XN4JuXOpQa3V3KjLHyj5BkdjTF7SOIM4Tt4scMDB2yfsI/xLokT9nlWDlZqRhOEj2uzoYWnvNdHdIP8j+ssdxkAFU8IWb3I6XWEJzf8T+YCRLyNfioQBeNucYxualDg9yJaCj/TDlqMyaK9BcVdnfXoZD1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748936901; c=relaxed/simple;
	bh=7/E2PZuS4xuO6ru4tVmW9wWcgEN+UdjTQfwPp/jVbLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jFxQiUUykHEzKBBWuREROy87Hz3EAdXGxRkFdwy0jaBPNHKb7ITagJRjHuu3+TsaWkw/4eEzOUupWbYvooJFqm4TROZqNeQ7PuLjZs/Almwm8t+YG7V8fsHbWjckKqa4KYSHCH7NW/2n9CUcn4TPuec+YjoVnyzuXXz5cZFftMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bPJcWEeg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bPJcWEeg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A4DC4CEED;
	Tue,  3 Jun 2025 07:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748936898;
	bh=7/E2PZuS4xuO6ru4tVmW9wWcgEN+UdjTQfwPp/jVbLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bPJcWEegGmPrknxY/HQNjWITDH1jVIsj4qm7CIV5o0hvAbjeGtz7MW8+a3SNZdCdh
	 bc4OTGVFjVCTT+oF/GR0JZaZb1IuazvjGxfnM4IiEdeHtBJlz3r63lvs8HbRLKfvVo
	 aK/AtHpjGbJoA2A6tANmgeArsq7kixhM6Ed8ymmBY6aCvhA4dScXcFCk5TlsJq36J6
	 lbyaZdo9Ardhe6ixAg/j6vFNdrNDrrN6mIPak3Jx2uBsn63RJUapN7K6rUayoMnAvr
	 ttEEp6wtGPOyk9yQFW0wATtiPcDApPZ9NhKfiKVShk2e/Zr0Mh4RwZEOD18UU9Q6GH
	 ZOTyDZfjE8w/A==
Date: Tue, 3 Jun 2025 09:48:09 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
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
Message-ID: <aD6ouVAXy5qcZtM/@lpieralisi>
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

It would be good to understand what DT {should/should not} describe and
whether this DT usage to configure firmware is under the DT maintainers
radar or it is an attempt at reusing it to avoid implementing a
configuration scheme.

Rob, Krzysztof,

Any thoughts on the matter please ?

[...]

> The tempting thing to do is to have regs[] list the frames
> in some given order, but the spec makes them not simple
> supersets, allowing all of:
>  * NS
>  * S
>  * NS, S, EL3
>  * NS, Realm, EL3
>  * NS, Realm, S, EL3

Maybe reg-names can help ? Even though first we need to understand
what resources should be described in DT.

Current bindings are reviewed and I am not keen on dragging this
discussion on forever - the information the kernel requires is there,
I'd like to bring this to a close.

Thanks,
Lorenzo

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
> 
> thanks
> -- PMM
