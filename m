Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06D31DEFFC;
	Tue, 11 Feb 2025 07:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739257302; cv=none; b=Y8tA0M/+Yy8+FvTRIJA5zEAqAuE2yD+/WKwtnBV7hNLfRLXZlvTrFw60C7hcQE6xKBN0vxRtowpbUcEYYXZMkYbUaqefm3D/ENckrqOWVF91k7Gkh7rdU4Iv39nDqfn4pCA6eypnsgKKIRdvMVY1A+WOJZYim8DGwUWB+pzCZ54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739257302; c=relaxed/simple;
	bh=oYkNhz60aIpUdONo8K56ubZU0soRSKZnPCi9UC8ZksY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b2FL59Xl0t7JLYO/nqZVn095T7NTic2u+LIsZRrQauEL7RH6gzTPWY4/bL83EJRRhJKnDFQQRFagccGdAmXuSA8Snu7f9LiFC8MqvMdoMo3aa621UXmJ7UA0t1Je2QQgAI0PO2x2HCeDIQjPsoxqK4LYAQPES5ET1Oo2dNFJT34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GBHIjeie; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GBHIjeie"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A69F2C4CEDD;
	Tue, 11 Feb 2025 07:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739257301;
	bh=oYkNhz60aIpUdONo8K56ubZU0soRSKZnPCi9UC8ZksY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=GBHIjeieIHwaxv7B+FqszHuj791BU/XeJne24vrma+XxG5jeA5HlVBxyRMJmeSLMT
	 lwnGHQLJi8bGUAtRfP/4YzWTjPe937ERRoRX3zfWG9lfimLY22DSyif1hbf4AvuFkP
	 6mCN4lfgvJCeRnBDHf3n6xzZa98fA2LmtnFAqnZdLmJk7ob2PN865t1T/dCJgixBDy
	 jMnP3JwyEuGYcuUBDyw3SVCyNEwYbnWbwBG+Pl8GTnOtWMm3Wl0ffVnMG3/8/DCFGd
	 oPpZAhaMGQit640Cv5sGwQGekeMKhVtWHw36riMNhegNsTxQ66quHZvxHBU8/CY7JU
	 SuJbJYy/sfEjw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F782C0219E;
	Tue, 11 Feb 2025 07:01:41 +0000 (UTC)
From: Cryolitia PukNgae via B4 Relay <devnull+Cryolitia.gmail.com@kernel.org>
Subject: [PATCH v5 0/2] hwmon: add GPD devices sensor driver
Date: Tue, 11 Feb 2025 15:01:16 +0800
Message-Id: <20250211-gpd_fan-v5-0-608f4255f0e1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALz1qmcC/3XMTQqDMBCG4atI1k3JJDHRrnqPUkpiJhqoP2iRF
 vHujW4US5ffMM87kQH7gAO5JBPpcQxDaJs40lNCiso0JdLg4iaccck0KFp27uFNQ1PtBcu5KLJ
 Mkvjd9ejDey3d7nFXYXi1/WcNj7BcfxsjUEaFZCk4p8EwdS1rE57noq3J0hj53unN8ei8thqVz
 T0He3TijxPRZU6jt8CVsPro5N5lm5PRAShMpQCTe9y7eZ6/0xxiWkYBAAA=
X-Change-ID: 20240716-gpd_fan-57f30923c884
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Cryolitia PukNgae <Cryolitia@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Celeste Liu <CoelacanthusHex@gmail.com>, 
 Yao Zi <ziyao@disroot.org>, Derek John Clark <derekjohn.clark@gmail.com>, 
 =?utf-8?q?Marcin_Str=C4=85gowski?= <marcin@stragowski.com>, 
 someone5678 <someone5678.dev@gmail.com>, 
 Justin Weiss <justin@justinweiss.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1739;
 i=Cryolitia@gmail.com; h=from:subject:message-id;
 bh=oYkNhz60aIpUdONo8K56ubZU0soRSKZnPCi9UC8ZksY=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0did012TXdDV1dQRU9OYzFGS3JRM2phY
 lVraHZSVlgwL0Y4emZ6UmhvVXNoK0xucXMxUi9ULzFUVlRWcnYyCm0rd3VPbS9rNk50L1I4T3Bv
 NVNGUVl5TFFWWk1rV1dGalBYRXVwS3U3Q3Z5TFh0ZzVyQXlnUXhoNE9JVWdJbWMKWTJaa1dNaTl
 3dFBGNEV4OGNEdkxsbmZkS2hjMnh6Y212THNrYUhPdjZaamRFVjFaUTBhR055V1d2YkVHbkYrdQ
 ovWDlqTnIxU1pkR0N6V1hTdTl1M3A4Ymx0dWYyUGd4Z0JBQT0KPWJFQTAKLS0tLS1FTkQgUEdQI
 E1FU1NBR0UtLS0tLQo=
X-Developer-Key: i=Cryolitia@gmail.com; a=openpgp;
 fpr=1C3C6547538D7152310C0EEA84DD0C0130A54DF7
X-Endpoint-Received: by B4 Relay for Cryolitia@gmail.com/default with
 auth_id=186
X-Original-From: Cryolitia PukNgae <Cryolitia@gmail.com>
Reply-To: Cryolitia@gmail.com

Sensors driver for GPD Handhelds that expose fan reading and control via
hwmon sysfs.

Shenzhen GPD Technology Co., Ltd. manufactures a series of handheld
devices. This driver implements these functions through x86 port-mapped IO.

Tested-by: Marcin Strągowski <marcin@stragowski.com>
Tested-by: someone5678 <someone5678.dev@gmail.com>
Tested-by: Justin Weiss <justin@justinweiss.com>

Signed-off-by: Cryolitia PukNgae <Cryolitia@gmail.com>

---
Changes in v5:
- Rebase on kernel 6.13
- Remove all value-cache related code
- Clean up code
- Link to v4: https://lore.kernel.org/r/20240718-gpd_fan-v4-0-116e5431a9fe@gmail.com

Changes in v4:
- Apply suggest by Krzysztof Kozlowski, thanks!
- Link to v3: https://lore.kernel.org/r/20240717-gpd_fan-v3-0-8d7efb1263b7@gmail.com

Changes in v3:
- Re-arrange code, thanks to Krzysztof Kozlowski, Guenter Roeck, Yao Zi!
- Link to v2: https://lore.kernel.org/r/20240717-gpd_fan-v2-0-f7b7e6b9f21b@gmail.com

Changes in v2:
- Improved documentation, thanks to Randy Dunlap!
- Link to v1: https://lore.kernel.org/r/20240716-gpd_fan-v1-0-34051dd71a06@gmail.com

---
Cryolitia PukNgae (2):
      hwmon: add GPD devices sensor driver
      hwmon: document: add gpd-fan

 Documentation/hwmon/gpd-fan.rst |  63 +++++
 Documentation/hwmon/index.rst   |   1 +
 MAINTAINERS                     |   7 +
 drivers/hwmon/Kconfig           |  10 +
 drivers/hwmon/Makefile          |   1 +
 drivers/hwmon/gpd-fan.c         | 611 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 693 insertions(+)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20240716-gpd_fan-57f30923c884

Best regards,
-- 
Cryolitia PukNgae <Cryolitia@gmail.com>


