Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAF11624C2;
	Thu,  6 Feb 2025 15:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738856366; cv=none; b=P6Md939YIX0J0GBx0risqvTvHS6/f1jbbAvGUgeFlMDpX8EuF6P14spozl5TK9SESHMWdQQk6KMVFLNfFps2YzuSOMZ57mPfvhlK0dOt71QUDksOg0uDV0KDV4Fz3ekdemR8Q/dD223qyazzAzXnGPFAKzGCyD17VqhxdUCrhlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738856366; c=relaxed/simple;
	bh=wlE6Gm+jfmM9GP+m3Xl6AJJ+K3p/jju0qAACYiZR0bA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HYCrKawk364pirnSg6Ifr4D0RIGhgXe7BcrtgfMOj3k7jQ5CMwVkiR+fzi5D1ZmYEsgmqueZJkI15riciiDutJE6IQLCKN729E40+M0f5O9dre5Sj5nAj1fxVmZDjyPfl38oxYHH4JffGuQVaigbTS4aQUUsjcZWWIbMg+FLOpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=ZUqX8jTf; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=B+4cb1uf reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="ZUqX8jTf";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="B+4cb1uf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738856362; x=1770392362;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nu8m4uOlFDA+u0T99iQf2bTuV73l/D8rZBvQ030okiA=;
  b=ZUqX8jTfh5PAbPsSc5ZOBDx7jsm2k8aUxVxTVLg/dkwGNLx+7S4SoUes
   /V26COBtFPCmePpUpGnFCNLYFuP+Acbll4rsGlebSUZUENKqwbWP8CTkd
   uzwuakirw75AZitGpGs8rGY8K9xoMSaj593C9BVdx3endRm8KWnO2E389
   /nE+WsbPuwpHX9cXUEX7g8l0HvKvtoerP/AQYINTUdFSt3ZQRZ/q5R+s9
   mCy6lk1XnJm3pLU/ODfjgHwiwyi0rV6VLiD2h+TMfr2cipIlF+SUjv9Yq
   kfQqsS5LgkZrymi75FTQQYU6dVcKBgdMSZVPLKDsiNu8/KlTG/J4LAXDO
   g==;
X-CSE-ConnectionGUID: +s+pPf1WTB6lXyMwIveuSw==
X-CSE-MsgGUID: wlwIYNZKTfSIr6Idjo+bRA==
X-IronPort-AV: E=Sophos;i="6.13,264,1732575600"; 
   d="scan'208";a="41612578"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 06 Feb 2025 16:39:17 +0100
X-CheckPoint: {67A4D7A5-10-8F72533B-EF5B5974}
X-MAIL-CPID: B9E342499AF175E572876BEB97C05D8D_1
X-Control-Analysis: str=0001.0A682F27.67A4D7A6.008D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25ABF165ECA;
	Thu,  6 Feb 2025 16:39:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738856353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nu8m4uOlFDA+u0T99iQf2bTuV73l/D8rZBvQ030okiA=;
	b=B+4cb1uf7v9DiQf+qu4va01yy1IcqvGJ7kvoiQeuCCdGvCOobbBrnwmlfPcNwoYNBvMAEF
	i79WhgV4baWZYhM2qI4UteTdXDmrC3/CijnG6UbGAoTqcEhEE9ANoar/MTWIz7bCgydFfW
	Y+myR7pZ/nAcw9uFcm0sOp04ic+v/48Qo9i9B3wLLjVgUNMd8teAwIF/0p3o9dTe/Iu1lx
	7qB37GZ+rWIc3UtukzA5lZO/y0drb4q8qp65uSjzaasY4KwvqyztfdG/j9beX3xt3QSb0+
	nd/tGprUefNwllqhtIaYUwgfpvfnBVoZbx8jCOJcVct+4HbEL3GELBth7W+ecA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 4/4] drm: bridge: ti-sn65dsi83: Add error recovery mechanism
Date: Thu, 06 Feb 2025 16:39:09 +0100
Message-ID: <8756830.T7Z3S40VBb@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250206162048.1f159ba6@bootlin.com>
References: <20250203161607.223731-1-herve.codina@bootlin.com> <3605739.aeNJFYEL58@steina-w> <20250206162048.1f159ba6@bootlin.com>
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

Am Donnerstag, 6. Februar 2025, 16:20:48 CET schrieb Herve Codina:
> Hi Alexander,
>=20
> On Thu, 06 Feb 2025 15:38:42 +0100
> Alexander Stein <alexander.stein@ew.tq-group.com> wrote:
>=20
> ...
> > With interrupt configured I got the following stack trace upon
> > reboot/poweroff:
> >=20
> > [   91.317264] sn65dsi83 2-002d: reset the pipe
> > [   91.344093] Unable to handle ke
> > ** replaying previous printk message **
> > [   91.344093] Unable to handle kernel NULL pointer dereference at virt=
ual address 0000000000000000
> ...
>=20
> Ouch :(
>=20
> One question to help me investigating:
> Do you have the issue at init/probe or when you start to display graphics?

This is during shutdown/poweroff. I assume that regmap_reg() in
sn65dsi83_handle_errors() fails and because of that reset_work is scheduled.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


