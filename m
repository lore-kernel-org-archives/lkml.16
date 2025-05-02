Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFED1F1511;
	Fri,  2 May 2025 20:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746218263; cv=none; b=D51GhnXA0An8W0ZOHWRuhYAD2AThEoVMmz6AJLQGG4N/jNIDbRi3DL7VajOu+Y7VU8zHAMPhHPkdA9F6+8QIibUCh26pwbDMeaEgyFVHHBfP8/spIzIt8VBr9tcV73WL1SLhdnuAWV556JLnF4sIpZkXg3hg883wy3/AvSjdvPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746218263; c=relaxed/simple;
	bh=oloKmQxAf54lQCGupu61nthqXQQLfUEn+3ZYUvSGYtA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Jy/w1lwXoGf/Qxfghvg3NUdqYOos0XJ4eon2pA1f/iJ/WszMwgWrUYNzn9ojWCSeODahUlqV3uwQysndP/DwGLJLpV5rN4nAFG1pz4daucfjjfUzNeppCkKUqEnRbVhy+TZ2bx58IoZKHgMjV8LTFvqbhc8Jwx9ImiwxHMX4v4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JCIzU81z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JCIzU81z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB18C4CEE4;
	Fri,  2 May 2025 20:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746218263;
	bh=oloKmQxAf54lQCGupu61nthqXQQLfUEn+3ZYUvSGYtA=;
	h=From:To:Cc:Subject:Date:From;
	b=JCIzU81z4JOJiko0V178+kfMW6k4Af7KGOWOSGWgGn4ciLIPVS3QF5JE5pG1L36zf
	 EoiujVw9v/Glcn3qxOT/3k8Vo9qQ7nYju5BqdHwUslEll3Z4V5Vx+/vt26Y+tCGdDK
	 P/ZiDMS9BTrrGK+qX24/sd2zSLnqenvR8M+dUGQmQ/lPENPxDeD+PLzwjvIBrAMiiO
	 9x4PCOMNzhbwwO0ln/CHmqifDAa8+W1BevXvv6tmgewSWAq7KQnIaZuwC96zM/EcG9
	 afps9Le26X2bJzN8neA80YceaOidwKRbQZsizZuP4qjg1YbQ5E5Kpc4Lgl+3rOl6Ar
	 V2ECk0RKgak2Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Ciju Rajan K <crajank@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Michael Shych <michaelsh@nvidia.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/mellanox: mlxreg-dpu: add I2C dependency
Date: Fri,  2 May 2025 22:37:35 +0200
Message-Id: <20250502203739.2143173-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

REGMAP_I2C cannot be selected unless I2C is already enabled:

WARNING: unmet direct dependencies detected for REGMAP_I2C
  Depends on [n]: I2C [=n]
  Selected by [y]:
  - MLXREG_DPU [=y] && MELLANOX_PLATFORM [=y]

Fixes: 3e75f2954116 ("platform/mellanox: mlxreg-dpu: Add initial support for Nvidia DPU")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/mellanox/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
index 7204b10388ca..e3afbe62c7f6 100644
--- a/drivers/platform/mellanox/Kconfig
+++ b/drivers/platform/mellanox/Kconfig
@@ -29,6 +29,7 @@ config MLX_PLATFORM
 
 config MLXREG_DPU
 	tristate "Nvidia Data Processor Unit platform driver support"
+	depends on I2C
 	select REGMAP_I2C
 	help
 	  This driver provides support for the Nvidia BF3 Data Processor Units,
-- 
2.39.5

