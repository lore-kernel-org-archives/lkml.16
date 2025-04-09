Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9709267F5F;
	Wed,  9 Apr 2025 14:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744210254; cv=none; b=ddXp2WSqpx7bQV56Rg4hDvnYXN1u3AEh39kbIe15iT17cRF5YtGLIFfaHtX+XVezevp0cml1Vsh0bVwsEwz8x2+pT/58C7JtTm0FtYpJ8z8RP5Y9oHXgJIS1qZC2d8nZSKbEKHLsISo//yS6YQM7wr5HPV1IikRbnvs1fDtJ33o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744210254; c=relaxed/simple;
	bh=NMWyW4mqpoveMNXaP68AqQDCA/roDvJERCuSx5UrrwU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=srbx3AsiiV+P7bzFr1CYbeww1Qz4RzY07V5ALBu/jFhDg21vA5C+Afe4Enx1101H5w/SnzEx7wPia+OGpxiacSJdXVQBmV9F0ykGsaAikMWeztt+8khrs0K7PnuPMeoI3uPfuT/K0jkiPQXuhLdnl6ayPFpCAKAGJylSqc1xNsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OTFvKWJV; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OTFvKWJV"
Received: by mail.gandi.net (Postfix) with ESMTPSA id E633144280;
	Wed,  9 Apr 2025 14:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744210245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zZPITvEi1v51AvKlOUwPqkkBC0vzA2H3Mxb/j3In2cg=;
	b=OTFvKWJVBXSdWfVzgUI2dvBb0pgR4Qr0Wg7ObninKw2Yemv+a3v0IbSzVHnA5yy1XUHab1
	Nw44w/QDpOIJdtqutfRWPdWiK5mjuDE/12mGoheQTUomNjkozjXC2k6xF7eeVF9hkrttXE
	B726BZr04Od0Xfj2P4hrsQFDjPgJuLh17JBajhvQf7UoYT1S4GvmKPIlJ2M+1kdmjW82zI
	n/fZL1p92TLyHTe+giHtRSsYycjMfM2eR7ipXzUhaP5NfPJz5veb/oxe7bOrfz1yogQY/T
	K1aCQucic5L4qz8KJnlqiSHBifOjtylGujv7iBxOq7Gi5VMb/N2JeujFDWdwkg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v7 0/2] drm/bridge: add docs and kunit test for
 devm_drm_bridge_alloc()
Date: Wed, 09 Apr 2025 16:50:33 +0200
Message-Id: <20250409-drm-bridge-alloc-doc-test-v7-0-a3ca4b97597f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADmJ9mcC/x2MQQqDQAxFryJZGwiD1aFXKS6mJmMDViUzlIJ4d
 4OLt3g8/j+giKkUeDYHmPy06La6DG0D0yets6CyOwQKD+ooItsX36bsJS3LNiE7VUrF0A+ciSX
 HSOD73STr//5+jed5AUCqwy1rAAAA
X-Change-ID: 20250408-drm-bridge-alloc-doc-test-267df0def880
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeivdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejjefhgfffleevhefhfeduhedtfedttedtkefgkeeuieehtdeifeduveejffevgeenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhts
 ehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtoheplhhumhgrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

This small series adds documentation and a simple kunit test for the new
DRM bridge allocation flow, based on the recently introduced
devm_drm_bridge_alloc() [0].

This work was formerly a part of my v6 DRM bridge hotplug series [1], now
split as a standalone series, hence the "v7" version number.

The overall goal is supporting Linux devices with a DRM pipeline whose
final components can be hot-plugged and hot-unplugged, including one or
more bridges. For more details see the big picture [0].

Current plan and status of the DRM bridge refcounting work:

 A. ✔ add new alloc API and refcounting -> (now in drm-misc-next)
 B. convert all bridge drivers to new API (v1 under review [2])
 C. ➜ documentation, kunit tests (this series)
 D. after (B), add get/put to drm_bridge_add/remove() + attach/detech()
 E. after (B), convert accessors; this is a large work and can be done
    in chunks
 F. debugfs improvements

[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b715ea3d1ba537ef2da95eec
[1] https://lore.kernel.org/dri-devel/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/
[2] https://lore.kernel.org/lkml/20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (2):
      drm/bridge: documentat bridge allocation and lifecycle
      drm/tests: bridge: add a KUnit test for devm_drm_bridge_alloc()

 Documentation/gpu/drm-kms-helpers.rst   |  6 +++
 drivers/gpu/drm/drm_bridge.c            | 73 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/tests/drm_bridge_test.c | 60 +++++++++++++++++++++++++++
 3 files changed, 139 insertions(+)
---
base-commit: e8bf4a1bdaeadb28d13b9a2bcfd5910fda06eede
change-id: 20250408-drm-bridge-alloc-doc-test-267df0def880

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

