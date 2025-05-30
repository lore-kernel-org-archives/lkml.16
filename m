Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7062116F4
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748593851; cv=none; b=kPVKS0+ekuQXrXUpZ7h+j54NuOgtEgAW+qGJ52w9KPUI3ZqQR0Z42nbLH/AGIEo42XwFsHBhrqZPiF3Y9fRvpprC8JTSOY4dPHqjd6ftA86t//aoT5p/vn+sMMuiNvH8bsYB8DzSL5czonpa70uHHogCB5cDnuGbYU0yuAppa2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748593851; c=relaxed/simple;
	bh=64qScj2fNxS5xRxlTh1u81AIS0+t+p7HGyYWKUysbyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5NpQn6m88Qar1NLJm8jEuuFbP+oEg1Qty/l1wJZGuA5Mrd+jueqGonvcj8P4nVIoHIX5xwaBD2C1i5OPNHuAZS/XpbPmSmbQs+ISS27OnEiYsCAp9/STzJqd4XV2OxUX0KioXyHq+ZgMjlOILq/GXM6DZ/nkk/gYr13PhpKsag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKv8M-0007q5-27; Fri, 30 May 2025 10:30:34 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKv8K-000wm3-3C;
	Fri, 30 May 2025 10:30:33 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKv8K-000oiq-2n;
	Fri, 30 May 2025 10:30:32 +0200
Date: Fri, 30 May 2025 10:30:32 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>,
	Marco Felsch <kernel@pengutronix.de>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: vendor-prefixes: Add TouchNetix AS
Message-ID: <20250530083032.lszndbodo2tgixu6@pengutronix.de>
References: <20250529-v6-10-topic-touchscreen-axiom-v2-0-a5edb105a600@pengutronix.de>
 <20250529-v6-10-topic-touchscreen-axiom-v2-2-a5edb105a600@pengutronix.de>
 <1e5bd735-3eb5-40da-9e4d-12aa364e1cb3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e5bd735-3eb5-40da-9e4d-12aa364e1cb3@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On 25-05-29, Krzysztof Kozlowski wrote:
> On 29/05/2025 00:08, Marco Felsch wrote:
> > From: Kamel Bouhara <kamel.bouhara@bootlin.com>
> > 
> > Add vendor prefix for TouchNetix AS (https://www.touchnetix.com/products/).
> > 
> > Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> How v16 became v2 is still confusing:
> 
> https://lore.kernel.org/all/20240703142520.207066-2-kamel.bouhara@bootlin.com/

As explained within the v1, I started from a fresh v1 due to the
complete rework.

Regards,
  Marco
