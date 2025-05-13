Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE0F221F27
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128101; cv=none; b=Qja4YW0Jor8y/kbYUYFydg5UashtfFfREleS6q4x7yWGyqz1MYamDRj6dzBKCI41pF4wcIFzhg7J9sWvsj9/Dll3M0KCAJ7EqeOK0K6pM+1HGXKB1+qlFgjBtJe85tDIeBjdxRs/ZMWufukYKJHkOiMiXSnUfvF/UfNCB2N0xQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128101; c=relaxed/simple;
	bh=L7l7fK4yzt+8ARLihCJvli/AWMvTKu+OyqzgTNEXlgY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bRtiKWsXUNnWd0tcPdBP9bQcBoDd6vJ4ap5C1uiIXY8G6WsR0N8qdcpreoogFdPKHuD0xaatC31Rh9KkFuhWFvdVjFcbR1GnurBRqxONzVd/KgHs43uzHn8CckUSy/6AfTJlmKz8+obRPaVSLF8yTuccCBuBsOxVd9YaLcBrjEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uElox-0008Gs-Cv; Tue, 13 May 2025 11:21:07 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uElow-002W0l-2L;
	Tue, 13 May 2025 11:21:07 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uElox-0004YW-0K;
	Tue, 13 May 2025 11:21:07 +0200
Message-ID: <ecf46fa3116690b85f51539edf7f6a47c612fca5.camel@pengutronix.de>
Subject: Re: [PATCH v9 5/6] reset: spacemit: define three more CCUs
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr,  dlan@gentoo.org
Cc: heylenay@4d2.org, inochiama@outlook.com, guodong@riscstar.com, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev,  linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 13 May 2025 11:21:07 +0200
In-Reply-To: <20250512183212.3465963-6-elder@riscstar.com>
References: <20250512183212.3465963-1-elder@riscstar.com>
	 <20250512183212.3465963-6-elder@riscstar.com>
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

On Mo, 2025-05-12 at 13:32 -0500, Alex Elder wrote:
> Three more CCUs on the SpacemiT K1 SoC implement only resets, not clocks.
> Define these resets so they can be used.
>=20
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/clk/spacemit/ccu-k1.c    | 24 +++++++++++++++
>  drivers/reset/reset-spacemit.c   | 51 ++++++++++++++++++++++++++++++++
>  include/soc/spacemit/k1-syscon.h | 30 +++++++++++++++++++

Could you split this into clk: and reset: parts? The reset changes are

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
