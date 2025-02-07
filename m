Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134D217C68;
	Fri,  7 Feb 2025 12:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931880; cv=none; b=XQhFmWjAzKcwVL9w0lrijn7HZ45dPDLr37xsQDF4fCnhlDNNNzU91+D1uQgT/9Dar+6diNwzsE+Z8Zqgcjl7Hcd37/3QWiewCOHHOxfvcHO8om2r7+7T3fcRUum6Nf36AYG5kXYGf+Vp5It6aa3aJtpX36oSoBsHd6WdfNSOdYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931880; c=relaxed/simple;
	bh=Hb1BL9HTKTtLH1zeyF/ibnMzCyaoavTXsXdsLMI6yWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZboMefRkA+2xThPa21NQDBAfdqEosuVccLj71l2HQ6Qq+iqpF0vxMSJW2xhL6icH4v2eNP2Wfo1CpXcehaIhfa5BfPe6p8Zr3nEQqE3Dle9oQu5QGDWn/FW6IkAUjbL0smKprXjfXwHKTuFp4z24OW520CHeSrEf7cnwSMsgQR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=VxKT+Rdn; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=I1/z7SKq reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="VxKT+Rdn";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="I1/z7SKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738931878; x=1770467878;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hb1BL9HTKTtLH1zeyF/ibnMzCyaoavTXsXdsLMI6yWg=;
  b=VxKT+RdnIvXE1OAQD5x0wlRcIMsE3HhKXI427gBPkdYDcEDyCpPYWncT
   cMGFZsYLAV237mViai/7Nats//RZRtDnpX16JoYSb4yYMiOw1KR+l0pcu
   czAZiN+5ENCkc4rFNQncW2lWqqTB8j2cVsKEUSQoK/D+CT7qwOG+hZD27
   ncpc/r6/BV4RBbGt2+cPawcq2kl7YyaOoWO3iM+37lFzS2lLLDiosErkN
   PLE14fT9XdHXun17YICkScCGUI4/5x+P6oFopnqN8rVyuY+5x0eJQcizc
   1nxZCmX+OQlgx3sDjyMGQTrYNSatVSNoxb6+uDpxoqfv9hcmHq+3Y9d8v
   Q==;
X-CSE-ConnectionGUID: Sg42n2ozS4C4fhhAH4VPGg==
X-CSE-MsgGUID: jQSFvGScTA6Nn+RVtwt9Gg==
X-IronPort-AV: E=Sophos;i="6.13,267,1732575600"; 
   d="scan'208";a="41643350"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 13:37:34 +0100
X-CheckPoint: {67A5FE8C-43-727D2C21-EE1B71AA}
X-MAIL-CPID: 1E6721796D650DEE10A7DEEE738D12C6_5
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9884B167399;
	Fri,  7 Feb 2025 13:37:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738931848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hb1BL9HTKTtLH1zeyF/ibnMzCyaoavTXsXdsLMI6yWg=;
	b=I1/z7SKqrPX2qN6C5RiE/udQgARQgIi1j+FAtEhyXMgksxFGgHeGeoA+rs+40fd9orRLWg
	evVtGx5cAHqAkcNInDsomMTCCSaEiG6Oxcih+ogR+ni/+g/QOHub8Nrj+F+rvEs8Wj9W+J
	g2cyhZnxfSmghza5625asIvgAD6EV6okFThIaAbuX/fRCsCE8ntJCPm6XvQsTxJFJWay4d
	4wcLWC2lES23ablBxxCOzSKEnc1TbQxvJucOOcDLZJFsJjSt+6HBI2x0UJ4a37YOKwRfTw
	xXNhKI+GBnWHQJucW7BXfW/7i+VmtB6OyUM7YHaA0t68UJuAR7VvAiskgA4mhQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/10] arm64: dts: imx8mn: Add access-controller references
Date: Fri, 07 Feb 2025 13:37:27 +0100
Message-ID: <8037692.EvYhyI6sBW@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250207120213.GD14860@localhost.localdomain>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com> <20250207083616.1442887-5-alexander.stein@ew.tq-group.com> <20250207120213.GD14860@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi Peng,

Am Freitag, 7. Februar 2025, 13:02:13 CET schrieb Peng Fan:
> On Fri, Feb 07, 2025 at 09:36:09AM +0100, Alexander Stein wrote:
> >Mark ocotp as a access-controller and add references on peripherals
> >which can be disabled (fused).
>=20
> I am not sure whether gpcv2 changes should be included in this patchset
> or not. Just add access-controller for fused IP will not work.

Well, I was able to successfully boot a i.MX8M Nano DualLite.

> i.MX8M BLK-CTRL/GPC will hang if the related power domain is still touched
> by kernel. The pgc can't power up/down because clock is gated.=20

Well, with GPU node disabled, no one should enable the power domain.
But to be on the safe side I would also add access-controllers to the
corresponding power domains as well.

> This comment also apply to i.MX8MM/P.

Sure. Do you have any information what is actually disabled by those fused?
It seems it's the IP and their power domains. Anything else?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


