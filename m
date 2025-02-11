Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF8C1F03C7;
	Tue, 11 Feb 2025 08:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263309; cv=none; b=VE/Kbd5eT42OmMEoc75KVQdkCfd7TyXpK+kAV1aO72pej6LSn33leo7bVdrz3PsavHYa8ZBQn3eGGuulosjrGSDeNZPe5vbLphdWfESof5xpdJt0D7/dxMWsHjzxUMtgcIF6O4J79JQxezKTDApMcRLrRiYLs9fFEvxAGytp0kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263309; c=relaxed/simple;
	bh=6gPS1YPsWcIMNduBKi+ViZQ5KfZ9CPDoSfRGzV5cUhc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RCvu23PhH6Q/w7Xhw25+K/A9XC0pHvdGa6VxwjJ8ioaaI01RiLaqJ4RdhLh5PU3Z3R9VXaJy/u9cVBLwPS/zlaqq/dqoG8EqoKQtOEdQgaHhwyjp5VvWWPu5qADUumMUBfv1M3HZH4xZ4ootS2n8/fEstwVRQVx4wtDi4eDHlyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=ppjjdNdP; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ot8Ty0pa reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="ppjjdNdP";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ot8Ty0pa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739263306; x=1770799306;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4RFb9A4U5YyWgy4kzIOhyisia7n5ROq1RTJWpcRxL5s=;
  b=ppjjdNdP3TX3KgdVQ6MKG5JBgMF7cQOuKN7B+QeKAlJmkH+InPp0+ZEv
   mZz+eny1WPLbHQ4psKRje13a1eJ+4yaPMP14Y5hNYjerdrWfU8iuXzmQu
   yfIlOU8btMZ5jXwf0mxhrWwfb93mSolSBV794oUxzX5jdaLN0J7jlfqfx
   IuwGzrAcf/kAkUWvvjl0e3x7Woo7AAcRhTGi5LoZAGlVPadwfTvBB5Iif
   AttGGvQrRUeCCVrf02GbeV0feKulIadPo5nshGIFmfL9O+UJs+Zw/GbHK
   vuvK1shFia08iZ7k/fhMSlSlS2yM2EdtLJ6AjOFOY7lWLdif5sz6E9x9U
   A==;
X-CSE-ConnectionGUID: j0tyI7jSQeGshznAOusVTA==
X-CSE-MsgGUID: emYshl8GQ1aoyScGBzvbtQ==
X-IronPort-AV: E=Sophos;i="6.13,277,1732575600"; 
   d="scan'208";a="41744827"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 11 Feb 2025 09:41:43 +0100
X-CheckPoint: {67AB0D46-30-28232521-C0C2250B}
X-MAIL-CPID: 63B22B090640647039E5A23306925933_4
X-Control-Analysis: str=0001.0A006378.67AB0D47.008B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7738169B35;
	Tue, 11 Feb 2025 09:41:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739263298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4RFb9A4U5YyWgy4kzIOhyisia7n5ROq1RTJWpcRxL5s=;
	b=ot8Ty0paEoLYoZcqnTi134PC18byiWn8/CX977l0j/Ul36QedKf2kiEDwDMSjk1wi6eHek
	zWicf2skVWKrnZ2mH6Ebt/oF9XK/W/lyJ88XQ1x45QDUFGSu1AuyMYnAeFygYGjpm83v6g
	X/KZcf280IJajG7t77cPMiSTKUHWKjvc5DeHNo2TW+iHJ1lzOIu1jfuaUcZEgtfhGZZf+x
	BGJJLdR52obnjKWl6Ee2RUiMjaj55EQ5VpKsYwU044Zbu6Sa0A3g1V7Dn8Qu0m4Ys6Xlvx
	Vi+F5JKWtaJFnXJ+IsL63iR2gC6NZcZtgkhhg0fMfcPYYGOWTcM6m5xci9rtJg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] i.MX91/93 parallel display bridge
Date: Tue, 11 Feb 2025 09:41:17 +0100
Message-Id: <20250211084119.849324-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

i.MX91/93 support a parallel display interface. There is a single register
for configuring the output format. There is not much documentation, but
apparently this does some internal conversion.
Add a bridge driver (similar to fsl-ldb.c) for connecting a bridge/panel
to lcdif.
I'm a bit unsure about the name. There is no dedicated IP, according to
reference manual, just that single register. I would also agree
to imx9-dpi or imx93-dpi.
Note: It's only applicable to i.MX91/93, but not i.MX95!

Tested on TQMa9352 on MBa91xxCA

Best regards,
Alexander

Alexander Stein (2):
  dt-bindings: display: bridge: ldb: Implement simple Freescale
    i.MX91/93 DPI bridge
  drm: bridge: imx9-parallel-disp-fmt: add i.MX91/93 parallel display
    bridge

 .../bridge/fsl,imx9-parallel-disp-fmt.yaml    |  78 +++++++
 drivers/gpu/drm/bridge/Kconfig                |  10 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 .../gpu/drm/bridge/imx9-parallel-disp-fmt.c   | 213 ++++++++++++++++++
 4 files changed, 302 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,imx9-parallel-disp-fmt.yaml
 create mode 100644 drivers/gpu/drm/bridge/imx9-parallel-disp-fmt.c

-- 
2.34.1

