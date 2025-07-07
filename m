Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB0F292900
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881635; cv=none; b=u7JzxUtAQVhcmyamsPcfAhfKRuwchXVz5yqudlk2ebXVeWSBQWB7ZPdDr//A0aBMyGQxSJrOZRL57zFYr6yJAd/KvA79NR6u9zZ6NmbQq86LXvPmbptjPNcc4qblzImUh9klhHZrfNCQDGyzjJvVSP0Tp2bXVL0o0IO1NjeTmTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881635; c=relaxed/simple;
	bh=3GdS2Zg8MMGjBRZqKkYiUkht5Rn6/MR/DwR0wzCVmt8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=se5ee6onQCyx91Qgn8NS0vXv5CI3iel79l5MfPqFA6kwAQMUBrup6y5DCtRuPADY2XFNlSamz2P5Jq84tSA2AEEAzxTdNYy53lEbSwB2RP8uB51npYbEVTdXMNq+uxQLEthhJu0dFruYMvoW4Q1whZUvK/x5l5QnTdvULJ2iYqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uYiR9-0006Q5-1e; Mon, 07 Jul 2025 11:46:59 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uYiR6-007E6N-2D;
	Mon, 07 Jul 2025 11:46:56 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uYiR6-000IDo-1x;
	Mon, 07 Jul 2025 11:46:56 +0200
Message-ID: <3732050b6b756868543012c1a1cebbe7cce74d61.camel@pengutronix.de>
Subject: Re: [GIT PULL] Immutable tag between SpacemiT's reset and clock
 trees for v6.17
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@gentoo.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>,  Alex Elder <elder@riscstar.com>,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 07 Jul 2025 11:46:56 +0200
In-Reply-To: <20250706040646-GYA408198@gentoo>
References: <20250703151823-GYA312602@gentoo>
	 <daf9ddad1aa24ee18abdc11a9b26ef03bdcbae16.camel@pengutronix.de>
	 <20250706040646-GYA408198@gentoo>
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

On So, 2025-07-06 at 04:06 +0000, Yixun Lan wrote:
> Hi Philipp,
>=20
> On 12:02 Fri 04 Jul     , Philipp Zabel wrote:
> > On Do, 2025-07-03 at 15:18 +0000, Yixun Lan wrote:
> > > Hi Philipp,
> > >=20
> > > Please pull the following change into the reset tree. This
> > > allows you to apply the patch 5 of the SpacemiT reset driver [1].
> > >=20
> > > Thanks,
> > > Yixun Lan
> > >=20
> > > Link: https://lore.kernel.org/r/20250702113709.291748-6-elder@riscsta=
r.com [1]
> >=20
> > Sorry I didn't notice before, this is missing k1-syscon.h from Patch 2.
> > =C2=A0
> no problem
>=20
> > Can we get a clock maintainer ack to place patch 2 in the shared tag as
> > well? Otherwise you could split patch 2 into soc and clk parts.
> for the ack, I'd assume Stephen have no objection (Cc him explicitly)
>=20
> technically, there is no problem to place more patches in the shared
> tag, since the tag will be both sent(by me) to clock and reset tree,
> so no conflicts in the end.
>=20
> if you expect to at least pass compiling test with patch 5 in reset
> branch only, then patch 1, 2, 3 should be included, otherwise need to
> pull clk branch for additional dependency patches.

3 as well? Oh, that's for struct spacemit_ccu_adev. IMHO this patch
series is not well structured for applying across trees. This should
have been a single patch that adds include/soc/spacemit/k1-syscon.h, to
be shared by both clk and reset trees, and no other dependencies
between clk and reset patches for this to work well.

> I would propose to have shared tag to include patch 1-4, then you can
> pick patch 5, in this way, it should both pass all tests (both
> compile-time and run-time)would would=20

Since this is a new driver, passing run-time tests is not a concern.
Compile-time is, since that would break bisectability for everyone.

> what do you think?

I feel like it's easier and safer for the whole series to be merged via
the clk tree. Since this adds a new reset driver, the only possible
merge conflicts are trivial ones in drivers/reset/{Kconfig,Makefile}.

regards
Philipp
