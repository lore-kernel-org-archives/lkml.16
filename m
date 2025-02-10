Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DE21CB31D;
	Mon, 10 Feb 2025 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184152; cv=none; b=cPkfKCn8mN3xBj4hA60bwXRqu4d9Df6+0hJ+WJ97ZUurfkJraDK5ct0Kas0PNyzePQjGll3SCmNZ8wNplCGjh5cH7eqEHjmHD0p1kQXuQEkcVbpLDfQ0Q6bRLu3bwyRw53FU6BQyM2ktMwYxR5FoaIaoFLQR11XlFqtMI3VJ5Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184152; c=relaxed/simple;
	bh=ts2LtqA7qGcjq6lEkdlnLsw0o7mF4rRZm6vKhbs9l2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rhJVhQbfLgec1rt42Kk+InivwepXmx2j+UUkVKVyPJSuaQIUHxQiUc6yN27pxr3YL1TNoTIoGzlEB/2L2OocREKBvItg5bAQC2BMhOQ6SOaZPmMCCAYJRrmTezIYnGJOXojbfD/8AbzTlM78FgKiTUYQU+K4jce66F78Mrbvpag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=UVltPev6; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=TxR+X0Nj reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="UVltPev6";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="TxR+X0Nj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739184149; x=1770720149;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jezc0BOJMNbqLUIuH2UXMgYuq2vdFgE3MRadiK4vpW0=;
  b=UVltPev6h4CuizDLQWoyWNy8W1QktZaSv9l25tEj1IXMKgf10GOVYSB8
   ACPn0AAVKQi/oAsGEFSoQ5IMiqZLkQd8x3kRsG0K3KTFgMLcXPBLCxPqj
   51Y2rGajfs7LgJKzcde2mhl14pTnHch8Dv24Sq5jiObVitm0Y2C1dCGWs
   ejacGYprTDFG023+KZ6Qlug8bukLR7UrtwwOl5tibUj1QCCM3xQsN2wsS
   Y0/a9toj06C9sAqE9yDr+jOomN3OeFE6FyrZQzZV6tGl0CLggynSZHdg0
   Ox6zbuKvTRRBMT73hps/MoRUP1HWmv4IwwP42DOjIrMb4TU+cMlFOAtQk
   A==;
X-CSE-ConnectionGUID: EsQg75ssQyKTisPAiqzoTg==
X-CSE-MsgGUID: 8yhcmnJRQk+xhCxZBpl4Rw==
X-IronPort-AV: E=Sophos;i="6.13,274,1732575600"; 
   d="scan'208";a="41715447"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 10 Feb 2025 11:42:20 +0100
X-CheckPoint: {67A9D80B-3E-BE46CFC6-C2AD582F}
X-MAIL-CPID: C31CE8128C21FD0A25E6B2990B0E0002_1
X-Control-Analysis: str=0001.0A006366.67A9D80C.00AB,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86750168A66;
	Mon, 10 Feb 2025 11:42:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739184135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jezc0BOJMNbqLUIuH2UXMgYuq2vdFgE3MRadiK4vpW0=;
	b=TxR+X0NjzptiTuYA3Za9xKvwbimpIESwrfFoAcIItEBm/2E0rxZpubt82EPZgta66DWHBc
	BiewKr1CqmlbXHZFpY9McZHer3wylTAC2ONJkubkVhHPNO1FTKjlVVJZCQ4WZ6EitNkzi6
	xKC+XuF08cfTpWv0vtUXUW2TkEUw5z1VWSDIUEGH+XMpQXC1EohKmdm6S9qiuy9gboJXUJ
	kxJhBhpiLy0VnXdIMfg/81DYSlZ+BLdfiDr5P3fWKMrux3Wg+KOvsL/3UgqFDSmo96CzDP
	7M00wQZh1zZat3sH3dTTW6lXSOalQPNdyMsvsuX8aZGo+YmeJqzFQj9HbmbJfA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 4/4] drm: bridge: ti-sn65dsi83: Add error recovery mechanism
Date: Mon, 10 Feb 2025 11:42:09 +0100
Message-ID: <6136272.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250207190816.2002d313@bootlin.com>
References: <20250203161607.223731-1-herve.codina@bootlin.com> <8756830.T7Z3S40VBb@steina-w> <20250207190816.2002d313@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Herve,

Am Freitag, 7. Februar 2025, 19:08:16 CET schrieb Herve Codina:
> Hi Alexander,
>=20
> On Thu, 06 Feb 2025 16:39:09 +0100
> Alexander Stein <alexander.stein@ew.tq-group.com> wrote:
>=20
> > Hi Herve,
> >=20
> > Am Donnerstag, 6. Februar 2025, 16:20:48 CET schrieb Herve Codina:
> > > Hi Alexander,
> > >=20
> > > On Thu, 06 Feb 2025 15:38:42 +0100
> > > Alexander Stein <alexander.stein@ew.tq-group.com> wrote:
> > >=20
> > > ... =20
> > > > With interrupt configured I got the following stack trace upon
> > > > reboot/poweroff:
> > > >=20
> > > > [   91.317264] sn65dsi83 2-002d: reset the pipe
> > > > [   91.344093] Unable to handle ke
> > > > ** replaying previous printk message **
> > > > [   91.344093] Unable to handle kernel NULL pointer dereference at =
virtual address 0000000000000000 =20
> > > ...
> > >=20
> > > Ouch :(
> > >=20
> > > One question to help me investigating:
> > > Do you have the issue at init/probe or when you start to display grap=
hics? =20
> >=20
> > This is during shutdown/poweroff. I assume that regmap_reg() in
> > sn65dsi83_handle_errors() fails and because of that reset_work is sched=
uled.
> >=20
>=20
> Found the issue.
>=20
> Can you give me following information so that I can validate what I
> understood:
>   - Is your interrupt line connected directly to the SoC?

No, unfortunately not. It's connected to a GPIO expander, which in turn
delivers an IRQ to the SoC. In between the bridge and the expander is a
buffer for voltage switch (1V8 -> 3V3).

>   - Is there any pullup/pulldown on your interrupt line?

As far a I can tell, there is no pullup/pulldown on the IRQ line to
the buffer.

>   - In your devicetree what is the configuration used for this interrupt =
in
>     terms of level or edge.

As this line is connected to an expander (pca9555) only edge triggered
interrupts are supported.

> Anyway, I will send a fix in the next iteration.

Thanks for digging into this.
Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


