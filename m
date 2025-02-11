Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CAB1EEA38;
	Tue, 11 Feb 2025 11:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739274278; cv=none; b=U1Z6AEx0vRJM7UKcOXg3gBmMlql9aY9mdFoRn/5f6kMqAoO/h4zbrY7xVbnVgwDNwAXM0WOjDvPg2eWdfSowc4kBRuF2TBCAuE0qQMpv5QNY69V9+dMyxr7OzliXv3tJCQXUf3bS1R778MRCPRGbdk7WTofDr65PWbzB/W4erqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739274278; c=relaxed/simple;
	bh=RgLO6P1goXDawul5y+R84q5+vVPWK6PuO7ujWU+944Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tRefJ0cMQod/YaZgAvfooYbZpBxs/v/oaSWkoliVIDUxSPLRsGkqeBjDwDvZBwtTjmZy3NPsA1aiIICLdst2rcLDNej48q+EJy9spyZgy9LdixGfl/W0YMOHneSFQ3P96loC1BLQ/EbCccgZsUsp/T7BcLyfTYOGd943JLWWrUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pEQMvPpM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pEQMvPpM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739274272;
	bh=RgLO6P1goXDawul5y+R84q5+vVPWK6PuO7ujWU+944Y=;
	h=From:To:Cc:Subject:Date:From;
	b=pEQMvPpM1YD15H2fDyHoX8THcZog4GAeo5LXRWXHDXejcZGzOtOCyw/xQ2SfkmkBL
	 mRoL1ODbIFoWHwd0Ixf2aNBR53P72os0HEgR3aB9YCHAMsSNgSNm41borfGfT0vL2P
	 59XJx13Y2s067YNB4knmVaJFGoZEHSNmdmjZ5f+V854Jrk2DP0UYv54hXONLOgnR+s
	 sY+P0jHSjuq8BWs4P30DD6g96GlDZKxziWtuhWKz0yu9VpyhdhwPZ9uD5/K+uu+SGO
	 b7Zq8hndC9X7eB8qV2UCz2Iuf05KGIZjKlyTycP1Q2qPM9q5HLXuQ14GVftrpPIt/f
	 vQcDvE7W5wN8Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F7BA17E14D5;
	Tue, 11 Feb 2025 12:44:31 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	pablo.sun@mediatek.com
Subject: [PATCH v1 0/2] Add driver for Himax HX8279 DriverIC panels
Date: Tue, 11 Feb 2025 12:44:27 +0100
Message-ID: <20250211114429.1519148-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a driver for DSI panels using the Himax HX8279 and
HX8279-D DriverICs, and introduces one panel using such a configuration,
the Startek KX070FHFID078.

This panel is found on the latest hardware revisions of some MediaTek
Genio Evaluation Kits, and specifically, at least:
 - Genio 510 EVK
 - Genio 700 EVK
 - Genio 1200 EVK

This driver was tested on all of the aforementioned boards.

AngeloGioacchino Del Regno (2):
  dt-bindings: display: panel: Add Himax HX8279/HX8279-D
  drm: panel: Add driver for Himax HX8279 and Startek KD070FHFID078

 .../bindings/display/panel/himax,hx8279.yaml  |  74 ++
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-himax-hx8279.c    | 910 ++++++++++++++++++
 4 files changed, 996 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx8279.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-himax-hx8279.c

-- 
2.48.1

