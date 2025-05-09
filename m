Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09CF2900BF
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793453; cv=none; b=nLlGDRtm0kxpgfTbyYzdr3tM4sBcICHrOEU7dhkh9ivaBamQKbQAAuQdQZWKpJHKrDOVlexHHksbpO8NUcNL4wPOKw+EVc3a3+O6C9m/MeZi0ItRvyXOjZg0FGLbPQ+DzNDjFWjd1EFA7XIYmnZFYwaRjkJL2aooFX8Rldm6kO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793453; c=relaxed/simple;
	bh=5QU/fYsJTWK8uOAULt2gwoSngZ7xHcJZvHzcag3bej8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JmUKnd64eXrawjqbD2CctamvKFeIV0fX8Ok44/HL3+zgbgOgOR3wjfmmdLwmREAq7G4+Eshn0i5qdszwNOWbm3U5ACWqvcH96qsXCiaQmdWr0JyXOHEZqg7uHNmNMNRD/4gM2uIdvuNQX322bIK24yYJPmVafwfsariURK6CFvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6vurtuM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6vurtuM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 330D9C4CEEE;
	Fri,  9 May 2025 12:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746793453;
	bh=5QU/fYsJTWK8uOAULt2gwoSngZ7xHcJZvHzcag3bej8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C6vurtuM1AOcS/Riqz8naZyveMnWt2MgyX5JuV1gg/dXJwiEUOhJxnqR6YE2nftlL
	 RPOn4ch8yQW8CJ++lHAEdmxkB7qqAVB+NmW/jC7F3/3ftf9G6sUD2Fe5HG5m5eYXIq
	 wxMQAnNt9F5qzQwfFn8VLDUd8c3XGoPjdWqcDCaEqnozPri0vUl6ae6/MkShtv+hfJ
	 6JPnYElUvko8Dsrimh7hemoJu5udlD/4n5zAB1hoBpy6bwC+Hnw+dmYR21kOMQtguq
	 PQPXe98qxXwgx2c3qi+csYxJ+7d+MIA4yWGFzdKzzDzdXeGKcq66OQYkf1wdCZv9Ls
	 NdHeRfhQ/pxJw==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 1/2] nvmem: rmem: select CONFIG_CRC32
Date: Fri,  9 May 2025 13:24:06 +0100
Message-ID: <20250509122407.11763-2-srini@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250509122407.11763-1-srini@kernel.org>
References: <20250509122407.11763-1-srini@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The newly added crc checking leads to a link failure if CRC32
itself is disabled:

x86_64-linux-ld: vmlinux.o: in function `rmem_eyeq5_checksum':
rmem.c:(.text+0x52341b): undefined reference to `crc32_le_arch'

Fixes: 7e606c311f70 ("nvmem: rmem: add CRC validation for Mobileye EyeQ5 NVMEM")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 drivers/nvmem/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 8671b7c974b9..eceb3cdb421f 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -260,6 +260,7 @@ config NVMEM_RCAR_EFUSE
 config NVMEM_RMEM
 	tristate "Reserved Memory Based Driver Support"
 	depends on HAS_IOMEM
+	select CRC32
 	help
 	  This driver maps reserved memory into an nvmem device. It might be
 	  useful to expose information left by firmware in memory.
-- 
2.43.0

