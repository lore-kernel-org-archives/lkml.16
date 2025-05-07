Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DA74B1E5D;
	Wed,  7 May 2025 08:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746606651; cv=none; b=NPtwdTMgAf2RUoQnq2l1tnZ4DvXLhiKDqXnKsLfz909cXMdMTcKxbLzQm/jHxdcmDGmaiV/WC0UhY6pvyMVs81zeiV64G94iy4hLI8TI9YT9ni026hc2Jur6yHbO4DGQlT58RfZ8DG9pbUaot+KoepVeNMDqHujMvWO14zdEers=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746606651; c=relaxed/simple;
	bh=Fl13JhPGBJPjzijzkCVK1qHkDmkFIdv5opEKFUNLvKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btxkkW3Dzn8R5sVXdUtGzzieC3SuOJ6nAs1xi/cNl5dOAUu8wACShZhZFFGQIZoip0hDROotKrXmvK6/rlzRJDOmtHujSGgmfqjNxEcJmGtfbfKR+RRAm4sWUrBKqdowMJ9EMLas+tbR+0pjB8iFYh12b2I4cFtAH36aZXAYXeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tpjn8Isa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tpjn8Isa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4412CC4CEEB;
	Wed,  7 May 2025 08:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746606651;
	bh=Fl13JhPGBJPjzijzkCVK1qHkDmkFIdv5opEKFUNLvKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tpjn8IsacvjjRczk9F0jA7SV0QPGr1kT/oq4aO+Gvp5A1zbHfz8RJGd++ZX72pZOr
	 aRYD6aE31tc+Qh4uF6bug1laNwT5N2S9tR1u4tT0zH4EMjtqLsQV0o0XW5Z6xqCnlV
	 Z1RGYRo8XAYSQWcyTv543tH7BIIZIAwgpkqnDAMSOxGGRXyPMMjS9v8OeYy8psaVpL
	 6rqJFTaO6lV6mZUBHgfuYF5FYxF8vU1LM6Jl5xlhtZCicV3Lp+Q61VgBeubuTmotgA
	 koqhU3TMrRrcSsdTvBgduF6dRBI2UMi6W4347pxjoTBJ3Ku6tFNLLTRRwZt2Vfm1ph
	 5GXtFku5t3u7A==
Date: Wed, 7 May 2025 10:30:44 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v3 22/25] irqchip/gic-v5: Add GICv5 LPI/IPI support
Message-ID: <aBsaNNmMZ5mXvIKU@lpieralisi>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
 <20250506-gicv5-host-v3-22-6edd5a92fd09@kernel.org>
 <87wmatn5g3.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmatn5g3.ffs@tglx>

On Tue, May 06, 2025 at 05:07:24PM +0200, Thomas Gleixner wrote:
> On Tue, May 06 2025 at 14:23, Lorenzo Pieralisi wrote:
> > +static int __init gicv5_irs_init_ist(struct gicv5_irs_chip_data *irs_data)
> > +{
> > +	u32 lpi_id_bits, idr2_id_bits, idr2_min_lpi_id_bits,
> > +	    l2_iste_sz, l2sz, l2_iste_sz_split, idr2;
> 
> Please don't do that. That's horrible to read. If it does not fit into a
> single line, make it
> 
>        u32 a,....,h;
>        u32 i,...,m;

Done.

Thanks,
Lorenzo
