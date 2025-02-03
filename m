Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CB8150980;
	Mon,  3 Feb 2025 19:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610713; cv=none; b=SUxd3fcjzHk99v5Aalrufzc1AFW/v/9pkLY5i6ZukirJ3q2/ItaXnWJUPg7/F8igHP0D3lQrP0KM7pwokBWSPmoYuKEj3euW9XF/88ISzqNmnFS4CRltz0trVWbmQIf9hqTACBTJO0QIz6AkXdLd+afItTQVOBARfX/VBUiG2Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610713; c=relaxed/simple;
	bh=Ye8hvQtlRq26TykPMkUVL9FMBPEnZV9ekPk9hamWmKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bN8QGoCXjqM1Crz9xfxiZLKhclJLXd3M2xii5w1QvTsuyAGixeLQJ2/fl9OYHUZl1i32k5osZN/HwpBaZxmooN584SrWIc3xWDt5rzdIne8Ammq7GNQcKEitN3hUzmgSQDWWkOyjBR7tPK7EqrXDuyujh9Hs1LP8i92uvaekAeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=beims.me; spf=pass smtp.mailfrom=beims.me; dkim=pass (2048-bit key) header.d=beims.me header.i=@beims.me header.b=l6kFFaRb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=tCo9GEwf; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=beims.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=beims.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beims.me header.i=@beims.me header.b="l6kFFaRb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tCo9GEwf"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id E33B9114011A;
	Mon,  3 Feb 2025 14:25:08 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Mon, 03 Feb 2025 14:25:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=beims.me; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1738610708; x=1738697108; bh=5R
	cEvpqfY5WECtoKoKIUpeLQNDExBxkuSQ7CCSdlIJo=; b=l6kFFaRbF6WxWkQJYd
	cYD4du66egC9Grd6/1RymNfmoJdVuEqNUXYoSX5q0VjeXziwGZ0uyWvq61Epa/1v
	vWgGsTqneTG/jmi2C3n95pkpWI6QzbxC7Z6GfsT777lqEacIyhS4Erhopi8nQFVG
	BWINLBwPISYtIdbiHQbMeAZhrYvRGDyWSraGXS7bHWdrdGcYSPWZhjS8HlGFzepr
	fYDpciC6xlVqhC/B9TSihKcgZS6+DQ0sa5LASFs/WPNxIwUe1As/w8gkd2xJl9U+
	h4FAFaHT6X3PEkR5qYphP8nRNX+CBvs4VnEdxYmnUNeHGVg5AD+lufCWzEroM9hT
	l9uQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1738610708; x=1738697108; bh=5RcEvpqfY5WECtoKoKIUpeLQNDEx
	BxkuSQ7CCSdlIJo=; b=tCo9GEwflfRqjxRWXUoyJ65+U3c2SZb+qINg24nvXFen
	G+EPC1TvakViK4Zah49rfTZpVXHv9yvhZebir45F88rJVXOhBViDXiRgRAwbz2Vz
	BI0oCOwDPqLiAR/UQjS0x8s5XKUgCNz6h9n56k/XKnvCS4Ya8dwUH3Z8kX3HOugJ
	KEgqUzTWfCaoSTRGOcYkK+lW5Rq/VBRmCBFEh1nD/2xFKJoLozZnTxML5T6ogcvv
	RaqqY4NpeBesPUqszt1HxTZbbwU8DOBEuODrtH4zz6a1k9pRjlMCHDkYHWIWjUuq
	UG3dlm0WsVlYct77ZW2GIdboA0cDOKbMPNlqhFBPfg==
X-ME-Sender: <xms:FBihZxAVvywbiIzElrlrICZoInsXtbQi12sXK-44urIKVm_7NKT13g>
    <xme:FBihZ_hz_kxZIlGibDLalYDtO9epZSVhpiJAMN44_LdMZ3bOc4Gs1zsMLVrBVIbob
    YRuEy0et-ZZ2ZeqWcQ>
X-ME-Received: <xmr:FBihZ8mIiFTXy_vCSLabw2nyIwYJjODVzrHiUahNGGMPIVTnhVXewt7QyF7rcX9apg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeen
    ucfhrhhomheprhgrfhgrvghlsegsvghimhhsrdhmvgenucggtffrrghtthgvrhhnpeevje
    ejleelheeigeetfeejgefgheeiieeltdeiueeggeduhfeiveektdejkeevgeenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrrghfrggvlhessg
    gvihhmshdrmhgvpdhnsggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtoheprggurhhivghnrdhgrhgrshhsvghinhesghhmrghilhdrtghomhdprhgtph
    htthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohep
    nhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfh
    hoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghh
    rghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhhonhgrsheskh
    ifihgsohhordhsvgdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuh
    igrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:FBihZ7w_NlV9DpC1KPjnaL02POSbZ-WjEtAjfLf-VddcqWxs0d9iWQ>
    <xmx:FBihZ2TP7wqz52IuNOCV2nT8w4wzGopQwD7k7YplzFhjlWCz27UKdw>
    <xmx:FBihZ-bBhYXVpX6Jqh0bynMRuJtiWnO3HsUKzCBMA3-Jj1NtLwDuKw>
    <xmx:FBihZ3TEzaxKakcX7nImqM17lQzlIYIdXZ0AG2dkfWX9U-42Mgbjjg>
    <xmx:FBihZ_QEaVNeU47Go7bcfCEsNEEBWycBp_88UFEpmvwqu1GkCIfA7Z60>
Feedback-ID: idc214666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Feb 2025 14:25:03 -0500 (EST)
From: rafael@beims.me
To: Adrien Grassein <adrien.grassein@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>
Cc: Rafael Beims <rafael.beims@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add HDMI audio support to the LT8912B bridge
Date: Mon,  3 Feb 2025 16:23:54 -0300
Message-ID: <20250203192401.244651-1-rafael@beims.me>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafael Beims <rafael.beims@toradex.com>

This patch series adds HDMI audio support to the Lontium LT8912B bridge driver using the I2S input. The audio output was tested using a Verdin iMX8MM + DSI to HDMI adapter connected to different monitors.

Rafael Beims (2):
  dt-bindings: display: bridge: lt8912b: Add I2S audio input port
  drm/bridge: lt8912b: Add support for audio

 .../display/bridge/lontium,lt8912b.yaml       |   8 ++
 drivers/gpu/drm/bridge/Kconfig                |   1 +
 drivers/gpu/drm/bridge/lontium-lt8912b.c      | 107 +++++++++++++++++-
 3 files changed, 115 insertions(+), 1 deletion(-)

-- 
2.47.2

