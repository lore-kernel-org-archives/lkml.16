Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D122EAD10;
	Thu,  3 Jul 2025 15:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751556084; cv=none; b=svuTglIRxxgwD2RXbfOtAAaAlvFdsXl7B4dBMtXo8uBklFBf/JtjIGf/ugS5P2fh1cvSBcJRxv69xn1KkGPbOUoUmg2Jp7HFkLws8CyFN5UuXPHa2uDPhOJVGB9jQSmRNVwITCsS7zXdXUjvTnB/iROViiYQJ3etpSH2JLsH9Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751556084; c=relaxed/simple;
	bh=9Hhn9GQn02LO6z2+r0noa5JITY+/qY7sfhXj8vfzzj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVJZEr5gkiCzFfoVY6omJa5DpAGE6XaBtzE3LqMXsxONpY+yDBIXbANBnwDlwPzSp+IpkmUIqYg2l/mV0dtYMH884ccZ/n/JhDNV6oJUt0dX2/cln7loB6xTGtNtiiF/gLi0RskhNQJbuggaIfeWoDmJETqDqWi54MmT3qAJnRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 1E8013420E5;
	Thu, 03 Jul 2025 15:21:21 +0000 (UTC)
Date: Thu, 3 Jul 2025 15:21:17 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, heylenay@4d2.org, inochiama@outlook.com,
	guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/6] reset: spacemit: add K1 reset support
Message-ID: <20250703152117-GYA312388@gentoo>
References: <20250613011139.1201702-1-elder@riscstar.com>
 <20250618111737-GYA157089@gentoo>
 <20250702061717-GYA304216@gentoo>
 <0580d4e254705be3765be168ce17c8a1c2e12f8f.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0580d4e254705be3765be168ce17c8a1c2e12f8f.camel@pengutronix.de>

Hi Philipp,

On 12:14 Wed 02 Jul     , Philipp Zabel wrote:
> On Mi, 2025-07-02 at 06:17 +0000, Yixun Lan wrote:
> > Hi Philipp,
> > 
> > On 11:17 Wed 18 Jun     , Yixun Lan wrote:
> > > Hi ALL,
> > >   As the reset driver going through several review cycles,
> > > it becomes quite calm down now, I'd like to request to merge
> > > it into v6.17, because various drivers (pwm, emac..) will depend
> > > on it, even in the worst case if there is problem, I believe Alex
> > > will help to address..
> > > 
> > > Hi Philipp,
> > >   I'd like to query if you willing to take the reset driver -
> > > patch [5/6] through the reset tree? It sounds more intuitive,
> > > which also will avoid potential conflicts with Kconfig/Makefile..
> > >   I've created a prerequisite immutable tag which could be
> > > shared between clock and reset subsytem. It's tag -
> > > spacemit-reset-deps-for-6.17 at SpacemiT's SoC tree [1], which 
> > > effectively are patches [1-4] of this series.
> > > But, to make your life easy, I've also applied patch [5/6] at tag
> > > spacemit-reset-drv-for-6.17 [2] which has a small macro adjustment
> > > requested by Alex at [3]
> > >   Let me know what you think of this, thanks
> > > 
> > Just want to ping this, what do you want from my side to proceed?
> > 
> > or do you want me to send a more formal Pull-Request for [1],
> > then you can apply patch [5/6] (still need to fix the macro of [3])
> 
> Please send a v12, so that the latest modifications are on the list.
> 
> I'd prefer to either pick patches 1 and 5 from the list, or, if you
> provide a tag with only patch 1 to be pulled into both clk and reset
> trees, to merge that and then pick patch 5.
> 
I will prepare a tag of only patch 1, and leave you to pick patch 5.

So in this way, I can handle the reset - take patch 2-4 via clk tree,
and patch 6 via SoC tree..

I've sent a PR here
 https://lore.kernel.org/all/20250703151823-GYA312602@gentoo/ 

-- 
Yixun Lan (dlan)
