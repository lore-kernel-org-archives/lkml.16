Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAA7288C1C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751623395; cv=none; b=QBBL7QopbLhzAhThMfapjWgNTq06U+BVrPkSW806JrW3Ol0WNrD3saRmZ3lrtYKuv/vAGANRNUQb/G05RJFBlWANBu7ajKSZ5ZcbOLzu3Sp1DRaVdtXkcLkuMpoaDYNJ4LDBv0LyI9LSeZVLYkBEY6jvqU8WhdnaLWCL0vDo+B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751623395; c=relaxed/simple;
	bh=ZGWVSPbloHjfJ3pWvMyOnYMs4sjlJNieDkORmzs4jyw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z4PLfnkTyqnFfYl4zNkc+6mTwb8lPrwbITZn4tBNHRap9azH6H7TekF4qObFgO0SAzTrOcAqNB8Z7u4wWh0/A4/o8vdeT+DmJIKwHtfQi4OhmSYdkzLR+EHx2mO7zBSBN4ZxhuwN5baGNCPIH48lYLEQTQ/v9yozmmIljn/L9wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uXdFx-0008E4-R2; Fri, 04 Jul 2025 12:02:57 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uXdFx-006kU9-1J;
	Fri, 04 Jul 2025 12:02:57 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uXdFx-000BZv-16;
	Fri, 04 Jul 2025 12:02:57 +0200
Message-ID: <daf9ddad1aa24ee18abdc11a9b26ef03bdcbae16.camel@pengutronix.de>
Subject: Re: [GIT PULL] Immutable tag between SpacemiT's reset and clock
 trees for v6.17
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@gentoo.org>
Cc: Alex Elder <elder@riscstar.com>, linux-clk@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 04 Jul 2025 12:02:57 +0200
In-Reply-To: <20250703151823-GYA312602@gentoo>
References: <20250703151823-GYA312602@gentoo>
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

On Do, 2025-07-03 at 15:18 +0000, Yixun Lan wrote:
> Hi Philipp,
>=20
> Please pull the following change into the reset tree. This
> allows you to apply the patch 5 of the SpacemiT reset driver [1].
>=20
> Thanks,
> Yixun Lan
>=20
> Link: https://lore.kernel.org/r/20250702113709.291748-6-elder@riscstar.co=
m [1]

Sorry I didn't notice before, this is missing k1-syscon.h from Patch 2.
=C2=A0
Can we get a clock maintainer ack to place patch 2 in the shared tag as
well? Otherwise you could split patch 2 into soc and clk parts.

regards
Philipp
