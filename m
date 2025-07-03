Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A38029B8C3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 07:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529455; cv=none; b=KU6rFMOwWFH9742aswvAru+Xv5O5FhMMCa8FkQDwIVabbgD38pah/1q6RrfgLlr+EEkeTUteJiOO2QhLqrX2s45bHCEhlAf6PVTlVeHGhsXfUKNLO0iSa076uS7Tq5wRPtshE6WqRAgWKywGZUZkh0z/Q198jrQppZZgsBOj0po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529455; c=relaxed/simple;
	bh=Rj+cDyKpwLwOxiAK6r/KcUtejPOhAQTZIKtCceWgTEo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Cc1bbq1AzdMt3MiJFZlM5p8y/IVDEEWn9ZfWxTiNnh6Jwcc9wz42gzF3lkC08Co18HeydEuwGU2GGicYX0v49AKjOw/bsbhwkUSy4VOiPwyAfdXsE1UbeLLhAIs8kcGa8rH6gUl8MkJKVuqwWmoLRNQdY6xDkxIlbOxzwNjQKTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PVhovEkd; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PVhovEkd"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A2D644473;
	Thu,  3 Jul 2025 07:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751529443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=99tJs9r0guufVFmRQHV9k5c/ogA9oLn8lkvdgt2b02g=;
	b=PVhovEkdk73QJ1+mZy34kZX+HeSsO88Oezm0APmk0/tBG2UpNYvwD86TXo0JioXBmUB4fb
	i/Ml2zB9Aqb55Zw7D7+T2dGhHehv4ZzaO/PFGvlgS8kLwCKLwJ38hA48DAXYvqYJZyAScx
	7xzr7Z6jf9vP4tePBSWUn7JqWTrxtpaPHN8fC2vcoUaearW14Ehk/l3diW74cqWb74Livr
	iO//MEVz/80DCB+NwG879M00dATtybFy0yu7kbJr6xRer93B3Z6MfQDTEIxB3UTlk/m5s9
	IwIS1fL8UjeLmAiPKCuSfX/Q6eJHgt0Kqtfp9R4NF4QUFkQYAK2CqVUdVYKIkA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v7 0/8] drm/vkms: Add support for multiple plane formats
Date: Thu, 03 Jul 2025 09:56:56 +0200
Message-Id: <20250703-b4-new-color-formats-v7-0-15fd8fd2e15c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMg3ZmgC/33S3U7DIBQA4FdZuB7K4bfsyvcwXhQKjmQtClhnl
 r27dM2cS613HJLznZ+cE8ouBZfRbnNCyY0hhzjUQG03yO7b4dXh0NUYUUI5YUCx4Xhwn9jGQ0z
 Yx9S3JWMwTneyaQyFFtXUt+R8OF7Y55ca70MuMX1dqoww/c6gAPk3OAImWHHrtXdEMVBPJsZyC
 MODjT2ayJHemAb4CkMr0xjGtbbeaeLumO08FhCi/knvuOpaQTouFV92wX66AKAr2xlZZSjzSik
 JWlm9ZPiVEUQwssLwyjgv6k54w5S0S0bcGEnXhhKV0ZwL6gG0VXTJyN9Ms8LIaSigwoBmXkN7z
 5znK0ju/aPeVJlPAZk2u+r0fSi7TZd63IdsH6+PWuVYaur5GyTiee2WAgAA
X-Change-ID: 20240312-b4-new-color-formats-1be9d688b21a
To: Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3035;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Rj+cDyKpwLwOxiAK6r/KcUtejPOhAQTZIKtCceWgTEo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoZjffO2nIaO37Bi/4zEEZFAt4rM2Q07dftnPTb
 ZA3VZU6sQeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaGY33wAKCRAgrS7GWxAs
 4tcQEACGzlKPzA/fg4dh55hbvxIj+vuugU+kyVv38aAkjUmqDnz8CgwHXV32muRPW17B7pujUT8
 hNKSbQP0pkCsdfXvWIX5hc4LW3fHHfAZmo/+HvyMJ+90D2f53dxF4sayEIKjsRRPsblGL+6oD80
 dobdXvMcbnd71sHok8TGru8ot50e+qaFkDRusIEjNcFULISMJV4j5jMXsTrnHzDs1Ho6HlYNEOZ
 QivXqxJW7uzi20Xtdj+zM/wPA1XIk47xbmR2jzH2I9fud7aLgCO3d8n2sIiuLPPBaEVv94DJ0xT
 jHtUpzgmcak74gE2aQirLWh9my78rVJ4DYisMvLQdvfTHtR7qeWDui7CUtPgGnjB1NgtXMeMP+r
 WUeYjdGmc0eC7cUAjeFGp5QEL7fDBtscclk0UKuydDM9ajI4zsbANKgH7VyWUvs1x0tGEuBJ29/
 0/CIhFcstwGcCW2D0HbGo/RcnKEFf2sa15q+ND5kr0+F9lI2BmwuNfKT7/SExLd2O2UH3yGoabT
 S0dlrFuzyngT4CPUhH0WLBT6LEjkKQ2I+Pma0ki+2f6iQcGSMj//Hq/Zes8Mi+RtxE+MAq2HvBQ
 /ONa2+eV52DYKxh6UrLrOZ41WPyPVBBCyfOAnKe40epHI1ik2R+XKavWesfn1+L780ep/3vZbGz
 jMYrRWxbbD4Qweg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduleejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteeufefgfeffgfejgeejveelvdffvdehgfeugfeiueefffeljeetgefgleeuveevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrghnphgruhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehmvghlihhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitgholhgvjhgruggvh
 igvvgesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegrrhhthhhurhhgrhhilhhlohesrhhishgvuhhprdhnvghtpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com

@maíra: For the patch 6/8 I just removed the comment about yuv input 
size, is it good for you?

This series introduce a macro to generate a function to read simple
formats. It avoid duplication of the same logic for similar formats.

In addition, it also introduce multiple "easy" formats (rgb888 variants)
and also 16 bits yuv support (P01* formats).

PATCH 1 is the introduction of the macro and adaptation of the existing
code to avoid duplication
PATCH 2-5 introduce new formats with the help of this macro.
PATCH 6 adds support for 16-bit yuv formats
PATCH 7 introduces a macro to reduce code duplication between yuv formats
PATCH 8 adds support for P01* formats

I tested the implementation using kms_plane.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Changes in v7:
- Fixed build warning
- Link to v6: https://lore.kernel.org/r/20250628-b4-new-color-formats-v6-0-2125b193f91a@bootlin.com

Changes in v6:
- Reformat commit message
- Remove outdated comment
- Link to v5: https://lore.kernel.org/r/20250627-b4-new-color-formats-v5-0-94452f119c72@bootlin.com

Changes in v5:
- Avoid code duplication in RGB565 and BRG565 readline functions
- Properly rename yuv_u8 to yuv_u16
- Fix useless indentatin
- Remove untested formats
- Link to v4: https://lore.kernel.org/r/20250530-b4-new-color-formats-v4-0-ef5f9f48376c@bootlin.com

Changes in v4:
- Update tests to test yuv 16 bits conversions, not only 8 bits
- Link to v3: https://lore.kernel.org/r/20241122-b4-new-color-formats-v3-0-23f7776197c9@bootlin.com

Changes in v3:
- Rebased on new YUV iterations
- Link to v2: https://lore.kernel.org/r/20241007-b4-new-color-formats-v2-0-d47da50d4674@bootlin.com

Changes in v2:
- Add proper casting/type to __le16 when needed to avoid warnings with
  sparse
- Change the function argb_u16_from_yuv8888 to argb_u16_from_yuv161616 to
  support 16 bits values.
- Add support for P010/P012/P016 format
- Link to v1: https://lore.kernel.org/r/20240516-b4-new-color-formats-v1-0-74cf9fe07317@bootlin.com

---
Louis Chauvet (8):
      drm/vkms: Create helpers macro to avoid code duplication in format callbacks
      drm/vkms: Add support for ARGB8888 formats
      drm/vkms: Add support for ARGB16161616 formats
      drm/vkms: Add support for RGB565 formats
      drm/vkms: Add support for RGB888 formats
      drm/vkms: Change YUV helpers to support u16 inputs for conversion
      drm/vkms: Create helper macro for YUV formats
      drm/vkms: Add P01* formats

 drivers/gpu/drm/vkms/tests/vkms_format_test.c | 143 ++++++-----
 drivers/gpu/drm/vkms/vkms_formats.c           | 331 +++++++++++++-------------
 drivers/gpu/drm/vkms/vkms_formats.h           |   4 +-
 drivers/gpu/drm/vkms/vkms_plane.c             |  13 +-
 4 files changed, 251 insertions(+), 240 deletions(-)
---
base-commit: b4cd18f485687a2061ee7a0ce6833851fc4438da
change-id: 20240312-b4-new-color-formats-1be9d688b21a

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

