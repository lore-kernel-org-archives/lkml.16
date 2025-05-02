Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9980A1A239E;
	Fri,  2 May 2025 08:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746173075; cv=none; b=jYrWAZ4CBSulP03fjxiStTK3SN7is0vgXzBxhjoNq9kOH92fZi2JpizMUul4XmfVX7RsHjS+FWbXvGfy2Jt7SU/AX/L/YJ6paTRKp3r/6Vb3UjYebTysj4ZxTp5xb8K8NTLXDAG6M0WMahnOQJ2WVBxxlScIxB0HoDBHMNFwh4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746173075; c=relaxed/simple;
	bh=ArvrCl6LeK7SKJMaqMa0YkfqbqIqXzNihw4OxLI2rLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJdu53IazZufEGP1Q0jraCfhI6fx7zeJ8sBY9pMGDJ3qoGqTHGxjZK3saWFsYN1mXoXn2CPqOkF2fFaqI+SNlW3nu8XwWA2yDddOlNCzX6whaDZ2pAoIp2N8RA7yHuit8/gxrdRlmQDXI22Q+fFr+HoyAzXv6Xsy8ryobAfapFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HS9tIkpO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HS9tIkpO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D417C4CEE4;
	Fri,  2 May 2025 08:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746173075;
	bh=ArvrCl6LeK7SKJMaqMa0YkfqbqIqXzNihw4OxLI2rLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HS9tIkpO8zMLCggb8vl44ZNDuQBxzvUdWXU1jVpSVWelUTA8pwi6EqPs/1oRly8nR
	 rkz1ou8EDkUVpYt6FyMUMjcR6aH+aCKwXVgujJ2dymSaYyYkCbjelG3DpKILRLLJxc
	 OktdShWNq6CAoztHBMKNjZBgXfvUJXPxRvJugeLm8wtt0fQhvTTRR4roM3uw7b8d1T
	 WkN1+2Fa01CA69Y3UGXWwNdQV3UZwg3EDmP9XPhoJBGWWQLZRFvUbdkf8PBSb3frks
	 yHmxRBiP5BbJj2kRub8CFz+ubXNo6ygf1WPpCZKCLVCXoqS2/VDJY4buA3NtpRiLhI
	 0qb6/lxJ0+gCg==
Date: Fri, 2 May 2025 10:04:27 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 21/22] irqchip/gic-v5: Add GICv5 IWB support
Message-ID: <aBR8i56xO6uNCt/G@lpieralisi>
References: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
 <20250424-gicv5-host-v2-21-545edcaf012b@kernel.org>
 <867c31j20i.wl-maz@kernel.org>
 <aBJO9GEyb+0t6W6u@lpieralisi>
 <86tt64h0x9.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86tt64h0x9.wl-maz@kernel.org>

On Thu, May 01, 2025 at 03:15:46PM +0100, Marc Zyngier wrote:

[...]

> > If we are, we use the msi_alloc_info_t->hwirq to define the LPI eventid,
> > basically the IWB wire, if not we just allocate an eventid available from
> > the device bitmap.
> > 
> > Other than that (and being forced to provide an IWB irqchip.irq_write_msi_msg()
> > pointer even if the IWB can't write anything otherwise we dereference
> > NULL) this works.
> 
> Not even MBIGEN allows you to change the event. If you really want to
> ensure things are even tighter, invent a MSI_FLAG_HARDCODED_MSG flag,
> and pass that down the prepare path.

I tried to set a new alloc flag in the IWB msi_domain_template.ops.set_desc()
callback and it works.

It can be set in the IWB driver (and does not change anything else),
it works so happy days.

> > Is there a better way to implement this ? I would post this code with
> > v3 but instead of waiting I thought I could inline it here, feel free
> > to ignore it (or flame me if it is a solved problem I failed to spot,
> > we need to find a way for the IWB driver to pass the "fixed event" info
> > to the ITS - IWB eventIDs are hardwired it is not like the MBIgen where
> > the irq_write_msi_msg() callback programs the wire-to-eventid
> > translation in HW).
> 
> It's *exactly* the same. And see above for a potential explicit
> solution. The empty irq_write_msi_msg() is not a problem. It's
> actually pretty clean, given how the whole thing works.
> 
> Please fold this into your v3, and we'll take it from there.

I will with the new alloc flag above, thanks.

Lorenzo
