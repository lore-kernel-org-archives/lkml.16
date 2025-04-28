Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD07B22D79F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 15:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745852878; cv=none; b=YeRskAxK6mQL0EZ2JIx+OM98LvmoJ17mXc5AsWNYV/2tz/lNtx1DciQq264UwAdaLj3MEW2hDput8FcLBg9RopqfOul/p0PvxC75GFvqaTQks7CGj/aw1UOuFLhV+yCRRhE4NwJUHnQpuC1A6JSm+f8Nh/NjnHRgh0Aq1ZIGlUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745852878; c=relaxed/simple;
	bh=jxTwfAcECygf5CIL5YAyFGJI9HrtjGfkmcaFSr4z1Us=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sA25HBjoKEx2lsx0GKiljENicr4iH+Usp0IStgOQxjQExYlujc8H9OtwhCRSyD3s9tJ37/aUZQ6lxxCJQOXtYEu/DBWJyBJoShUGqNQ/9CY9jXEjucto/gc4FoorWZnWazoGt5IDmYZrtTFz40SeNv2tJw3CaWieci+BQ2/PZZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qdYuVUBb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qdYuVUBb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B3FC4CEE4;
	Mon, 28 Apr 2025 15:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745852878;
	bh=jxTwfAcECygf5CIL5YAyFGJI9HrtjGfkmcaFSr4z1Us=;
	h=From:To:Cc:Subject:Date:From;
	b=qdYuVUBbXL6NTpfZ6clt4loWwrgjyzitkl9NMyTlYhx0Egx5zo/sapVWVxmLXaX9w
	 KrYiwPMNKLX2nBK5GP1vJhsqPCoAZ7bRBrG0ok1ROrloR4tCjL/WxRunEopF9VuGxD
	 MWDils7CFgiqxAWJWAVeAkpheLZP7GSJoTDtFidWLaS0/TsY1xq0/0AS1CRH5kGmHE
	 VEcR2zSQY3vxK0K1whQJYz6OTiQJzg235GqS9phytgatqctBio+s3jqdMi/FImQLxr
	 LOGWAjMElNT7l35yLf37XcctqlUnstywmmU+PnqpZ+OeHp5rqjElcQywvAl1F97rtN
	 cQ04GQoy53Alg==
From: Arnd Bergmann <arnd@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	David Lechner <david@lechnology.com>,
	=?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
	Alex Lanzano <lanzano.alex@gmail.com>,
	Kerem Karabay <kekrby@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/st7571-i2c: select CONFIG_DRM_CLIENT_SELECTION
Date: Mon, 28 Apr 2025 17:07:45 +0200
Message-Id: <20250428150752.3970145-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The newly added driver calls drm_client_setup(), but that is not
always built in:

x86_64-linux-ld: vmlinux.o: in function `st7571_probe':
st7571-i2c.c:(.text+0x7b7119): undefined reference to `drm_client_setup'

Select the appropriate Kconfig symbol.

Fixes: 4b35f0f41ee2 ("drm/st7571-i2c: add support for Sitronix ST7571 LCD controller")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/tiny/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 1dfe6291d9c0..654cd6f25faa 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -215,6 +215,7 @@ config TINYDRM_ST7586
 config DRM_ST7571_I2C
 	tristate "DRM support for Sitronix ST7571 display panels (I2C)"
 	depends on DRM && I2C && MMU
+	select DRM_CLIENT_SELECTION
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
-- 
2.39.5

