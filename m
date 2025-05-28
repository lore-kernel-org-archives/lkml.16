Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937B26F06B;
	Wed, 28 May 2025 14:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748442625; cv=none; b=k/UemPVJtCXvJ4K5UFKWhQha7cCRMy48VEi056F1HeyGWw31PFE2vRvaSjC1B1GkxRghoRE5khtu/mU4SKKNzeCXMHi5Puwrvb8jNZeBqilHmnFzOtrqA6iBiwi9csyZWqwPDEy87PrOrwBbkPZrA/feVNAKoPjSv2tA76uTHh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748442625; c=relaxed/simple;
	bh=jRw483kLKF6vHdjKiRX9zkkws+EBqLZOZl2WRGzktK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGRWZzoXg1rjr1/YrMbRM+rwQDhraIa1AzQPT4Gy7T/Ir+AjOP0xHT805c/ilZkUXAuKTGAo+n7SoJnmmZiwugcLLIheHoFOmI65ni/aCbX/6JpR4WT7NZJBnZ5D5YebYz6cfUItCDhlVFgY5Ldf7WxfpM6WsFzK3pa97fOexRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAHZ1WsQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAHZ1WsQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1AF1C4CEE3;
	Wed, 28 May 2025 14:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748442625;
	bh=jRw483kLKF6vHdjKiRX9zkkws+EBqLZOZl2WRGzktK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OAHZ1WsQXlff4iqaAu5tKd8JOIXR5fjx+s868eTzXBOzHYeN3azGgI7++pyxeUlU+
	 vScL0aZzfhY015PrsVRJ0VCLHJuckAhC63a1YnpwqTMtKP9Ecyh7sfoY0KNnWJ66xv
	 uQLH/K2esf1gEm691fBWnbi0FR+9j6hhzvsWuwyfnYiPurPQBbBUKZKGLAIHz2g10/
	 GPByNjTT5pLzkvh0GRbknt5xOKG4OJs55y+UZoMFEbE5HH+XdMEgYEcLnUNLuQzCwZ
	 7DotAIGnRZcylqYb8b4xaHFFnTqie0OGCeL6Q09zR1FusUM+nsQ0XM4MuZOf28pBTi
	 Vs3l7WowTe1dg==
Date: Wed, 28 May 2025 16:30:16 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v4 14/26] arm64/sysreg: Add ICH_HFGITR_EL2
Message-ID: <aDcd+CyDORzgkfXK@lpieralisi>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-14-b36e9b15a6c3@kernel.org>
 <20250528122826.0000566c@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528122826.0000566c@huawei.com>

On Wed, May 28, 2025 at 12:28:26PM +0100, Jonathan Cameron wrote:
> On Tue, 13 May 2025 19:48:07 +0200
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> 
> > Add ICH_HFGITR_EL2 register description to sysreg.
> > 
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> 
> Hi Lorenzo,
> 
> > ---
> >  arch/arm64/tools/sysreg | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> > index 0927754d9fe2c5addbd9693d83b7324f1af66d3e..d2f53fb7929c69895fe8a21ba625d058a844d447 100644
> > --- a/arch/arm64/tools/sysreg
> > +++ b/arch/arm64/tools/sysreg
> > @@ -3616,6 +3616,21 @@ Res0	1
> >  Field	0	ICC_APR_EL1
> >  EndSysreg
> >  
> > +Sysreg	ICH_HFGITR_EL2	3	4	12	9	7
> > +Res0	63:11
> > +Field	10	GICRCDNMIA
> > +Field	9	GICRCDIA
> > +Field	8	GICCDDI
> > +Field	7	GICCDEOI
> > +Field	6	GICCDHM
> > +Field	5	GICCRDRCFG
> 
> GICCDRCFG in the spec. (you have a bonus R)

Bah. Good catch - I should move to autogeneration.

> Of course the real question was what am I avoiding that made checking these
> against the spec feel like a good idea? :)

:)

> FWIW with that fixed,
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> for patches 2 to 14.

Thanks,
Lorenzo

> > +Field	4	GICCDPEND
> > +Field	3	GICCDAFF
> > +Field	2	GICCDPRI
> > +Field	1	GICCDDIS
> > +Field	0	GICCDEN
> > +EndSysreg
> > +
> >  Sysreg	ICH_HCR_EL2	3	4	12	11	0
> >  Res0	63:32
> >  Field	31:27	EOIcount
> > 
> 
