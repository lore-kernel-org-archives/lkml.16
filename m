Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507131A262D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041072; cv=none; b=qvqUeySwtyMDutgtm0gzek6Kn2NG21j0kIjdaviOOdTpfd1nMft1zSaoiJFHIDempBN16CljqIaeM/vvIfa2rBE/ize8pSdSqKT/SW3FeLjM4Zcur8EE/Kgov7XfpwCW8smjeZCQ4FjptMYyAh6MIfPzp/Ke7ynE8l+1/bSyAVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041072; c=relaxed/simple;
	bh=pzgMrZVeqk8Rm97oeE77YKv8t+NyWxMLvgRWSeEUkWQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AGSbKwj7jivzAstb5YL6W/D/W44ZD5vQbniI/56s1IvHCjiIP5OtINMihNPWdwVq7GruuR+7qjlFsB4LyilRtkTd6ZhKdbXHLKchlJAfUrbLERrPZ3O6rzl3E5Cd4V17EkQJJtLR+6lqnGR6HJLKMIQjzA/Y4GZ05sq9CVXgBUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBlq-0001D5-HK; Fri, 27 Jun 2025 18:17:46 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBlq-005e4l-16;
	Fri, 27 Jun 2025 18:17:46 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBlq-000QKf-0s;
	Fri, 27 Jun 2025 18:17:46 +0200
Message-ID: <961297baada69d3a9df0885e8021051d9bf16304.camel@pengutronix.de>
Subject: Re: [PATCH] reset: mpfs: use the auxiliary device creation
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>, Conor Dooley
 <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 27 Jun 2025 18:17:46 +0200
In-Reply-To: <20250611-rst-mpfs-aux-v1-1-c86534b473c3@baylibre.com>
References: <20250611-rst-mpfs-aux-v1-1-c86534b473c3@baylibre.com>
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

On Mi, 2025-06-11 at 12:06 +0200, Jerome Brunet wrote:
> The auxiliary device creation of this driver is simple enough to
> use the available auxiliary device creation helper.
>=20
> Use it and remove some boilerplate code.

Applied to reset/next, thanks!

[1/1] reset: mpfs: use the auxiliary device creation
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D9d33595c0227

regards
Philipp
