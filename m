Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996FE221F0F;
	Wed,  7 May 2025 07:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604483; cv=none; b=mfbc3AchSZXMXRl6pT+Scf3Cxproxk1SwOnLL3PRTEJ/wJW7Vr1WBJR63Ex2IvuIR02aMOvjLKSwtZWa2CccsQ1ddxRKxon9Qv67BahtqIooBzOdYugWjkIi4b5DPoJIUi87NnH+ICEWJJMJ3t5q+fo1vIKHp3kTXwjFbhBkaJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604483; c=relaxed/simple;
	bh=IVqlNaocDaKpQ/G49Jf3ESZWsV0zgwAqDWauMFaqzXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQTpfqR+T8cEEt+XdtZs28NbKArFpXF1urL5uQcPd9AgT2sS+r7H4BN+ej/+W3DPeKcx6m3BNCPXiTQQK9ZE62TQcqFkoUsSwd0sUvdSckZ+KGZwynfwg+qKvfdG5F0cYA68Suvb2kUiAgGx/ilEOyhZ/HTdYgfWKkNV6t9Me5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fG4S6iJP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fG4S6iJP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E88C4CEE7;
	Wed,  7 May 2025 07:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746604483;
	bh=IVqlNaocDaKpQ/G49Jf3ESZWsV0zgwAqDWauMFaqzXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fG4S6iJPzOtfKuwF5zStg02hXa10Zsaqean7bjPc3xb9WnrfCIc+ASROSDoSuHHYX
	 bbXfkEzekQ2ppLyo6r2rvrRfpy8aQq/aVWuR+fmq3C3Jq94zIgP7JF70hSxdrqzaon
	 rtZzHrpO+IXvAj7jF4XCO/g9BOTBPa6FkQqG+CF7PGlU4wyyl0KY4pZ8H86ak+YoVX
	 3Y5Kj3gFgpdgRh5gMvS/0P0x1+vQMffx0CJ9fJLrpYZr/YB3NqAzbzOcPgwIZR2C86
	 rK0aWoEHj4NFvuJSljP1Uvkc0zCSlO0nsersJ7oJj65it9rmWLV6jqb8ly3UdEHbTC
	 Ck2++0pa0E5bw==
Date: Wed, 7 May 2025 09:54:36 +0200
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
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 00/25] Arm GICv5: Host driver implementation
Message-ID: <aBsRvOzse7z39dkh@lpieralisi>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
 <86frhhhm18.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86frhhhm18.wl-maz@kernel.org>

On Tue, May 06, 2025 at 03:05:39PM +0100, Marc Zyngier wrote:
> On Tue, 06 May 2025 13:23:29 +0100,
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > 
> > =============
> > 2.5 GICv5 IWB
> > =============
> > 
> > The IWB driver has been dropped owing to issues encountered with
> > core code DOMAIN_BUS_WIRED_TO_MSI bus token handling:
> > 
> > https://lore.kernel.org/lkml/87tt6310hu.wl-maz@kernel.org/
> 
> This problem does not have much to do with DOMAIN_BUS_WIRED_TO_MSI.
> 
> The issues are that:
> 
> - the core code calls into the .prepare domain on a per-interrupt
>   basis instead of on a per *device* basis. This is a complete
>   violation of the MSI API, because .prepare is when you are supposed
>   to perform resource reservation (in the GICv3 parlance, that's ITT
>   allocation + MAPD command).
> 
> - the same function calls .prepare for a *single* interrupt,
>   effectively telling the irqchip "my device has only one interrupt".
>   Because I'm super generous (and don't like wasting precious bytes),
>   I allocate 32 LPIs at the minimum. Only snag is that I could do with
>   300+ interrupts, and calling repeatedly doesn't help at all, since
>   we cannot *grow* an ITT.

On the IWB driver code that I could not post I noticed that it is
true that the .prepare callback is called on a per-interrupt basis
but the vector size is the domain size (ie number of wires) which
is correct AFAICS, so the ITT size should be fine I don't get why
it would need to grow.

The difference with this series is that on v3 LPIs are allocated
on .prepare(), we allocate them on .alloc().

So yes, calling .prepare on a per-interrupt basis looks like a bug
but if we allow reusing a deviceID (ie the "shared" thingy) it could
be harmless.

> So this code needs to be taken to the backyard and beaten into shape
> before we can make use of it. My D05 (with its collection of MBIGENs)
> only works by accident at the moment, as I found out yesterday, and
> GICv5 IWB is in the same boat, since it reuses the msi-parent thing,
> and therefore the same heuristic.
> 
> I guess not having the IWB immediately isn't too big a deal, but I
> really didn't expect to find this...

To be honest, it was expected. We found these snags while designing
the code (that explains how IWB was structured in v1 - by the way)
but we didn't know if the behaviour above was by construction, we
always thought "we must be making a mistake".

The same goes for the fixed eventID but I would not resume that
discussion again, there are things that are impossible to
know unless you are aware of the background story behind them.

Thanks,
Lorenzo
