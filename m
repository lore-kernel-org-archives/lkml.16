Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5981D25394C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451273; cv=none; b=tssbtOPpBDHSU4rzI8bLR3shdvS/Ggi5+W69ToolT37ntMfAFp8Sms63UvYgliFlJ7K29aWSUvwIpyu5nM9gnhDttRF+Ry0DMPU9Nwr1G1NmVj/Fo87Xva+iMH2hpmkPRZuTbgop//zlLc351jA1Q0AhAkM5OoKvBd6WNX9Q/hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451273; c=relaxed/simple;
	bh=OTBODaYpyW6M8lWP3BhiF5zP7o1W1dXfIi+JCN9pZ8g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nQgz2YPwpRl/YIAarkh6wXGNOKxOKdCCuRHpQlt1AqJDDdh1G+ikrLi/VZyTvnFrOqkDKRfRTzdKN2/7MAVCjbX2cVAxIZhT/dLj3XEvAyU1772cPvSHjib/BQKgJFknhuIRyk64CwcrjDVXtKXsxc0wulds+4ifWL91icN2kQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uWuTe-0001VL-Qj; Wed, 02 Jul 2025 12:14:06 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uWuTc-006Q4b-2S;
	Wed, 02 Jul 2025 12:14:04 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uWuTc-000DK0-27;
	Wed, 02 Jul 2025 12:14:04 +0200
Message-ID: <0580d4e254705be3765be168ce17c8a1c2e12f8f.camel@pengutronix.de>
Subject: Re: [PATCH v11 0/6] reset: spacemit: add K1 reset support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@gentoo.org>
Cc: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr,  heylenay@4d2.org, inochiama@outlook.com,
 guodong@riscstar.com,  devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 02 Jul 2025 12:14:04 +0200
In-Reply-To: <20250702061717-GYA304216@gentoo>
References: <20250613011139.1201702-1-elder@riscstar.com>
	 <20250618111737-GYA157089@gentoo> <20250702061717-GYA304216@gentoo>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On Mi, 2025-07-02 at 06:17 +0000, Yixun Lan wrote:
> Hi Philipp,
>=20
> On 11:17 Wed 18 Jun     , Yixun Lan wrote:
> > Hi ALL,
> >   As the reset driver going through several review cycles,
> > it becomes quite calm down now, I'd like to request to merge
> > it into v6.17, because various drivers (pwm, emac..) will depend
> > on it, even in the worst case if there is problem, I believe Alex
> > will help to address..
> >=20
> > Hi Philipp,
> >   I'd like to query if you willing to take the reset driver -
> > patch [5/6] through the reset tree? It sounds more intuitive,
> > which also will avoid potential conflicts with Kconfig/Makefile..
> >   I've created a prerequisite immutable tag which could be
> > shared between clock and reset subsytem. It's tag -
> > spacemit-reset-deps-for-6.17 at SpacemiT's SoC tree [1], which=20
> > effectively are patches [1-4] of this series.
> > But, to make your life easy, I've also applied patch [5/6] at tag
> > spacemit-reset-drv-for-6.17 [2] which has a small macro adjustment
> > requested by Alex at [3]
> >   Let me know what you think of this, thanks
> >=20
> Just want to ping this, what do you want from my side to proceed?
>=20
> or do you want me to send a more formal Pull-Request for [1],
> then you can apply patch [5/6] (still need to fix the macro of [3])

Please send a v12, so that the latest modifications are on the list.

I'd prefer=C2=A0to either pick patches 1 and 5 from the list, or, if you
provide a tag with only patch 1 to be pulled into both clk and reset
trees, to merge that and then pick patch 5.

regards
Philipp
