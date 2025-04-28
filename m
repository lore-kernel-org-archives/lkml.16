Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7171122D79F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 15:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745852916; cv=none; b=fKSTRKrRAyhXPsqeLJ4S1mlZNRvDalgP1AhhlBJ4KvOeBHiGcP9fldcLrNWtPjvREYDqnc+KbITrZdKpEQTQgfer0eaRbyDhR9o0he1U3HAYCQ2QK7aZ583pCtFDPmfkVr4gkCQnwnkFip5EWYOLUMBNmpKpQFoV15gVZF+eqh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745852916; c=relaxed/simple;
	bh=W4vANu/E9fwm4Sbvcc2sOjIQbJIHU9o19RdQbxmSku4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nkOFsbt13ryQDu6c2bEBZvaK0/DOFCdnApaofUhtHAEX/+auNDj+gSAwsw64yW9Y27KPEC0r2VfdVmRi1WIZCHVrXPtqBmCHJW9YA3KRGaaamHEssWbdN+aGCgQX6K+j7YESvNK5E0luTXrLqQLyXYTxC3nzcJlmQQvjfeNHTYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIRlKgE5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIRlKgE5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADBFC4CEE4;
	Mon, 28 Apr 2025 15:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745852915;
	bh=W4vANu/E9fwm4Sbvcc2sOjIQbJIHU9o19RdQbxmSku4=;
	h=From:To:Cc:Subject:Date:From;
	b=SIRlKgE5vGcYY1GLFwPRTeOhFi3kekvqMuModqVAbt477dqYEHWRz3pCHgbKhkqpR
	 xGTdmIzANir+TJ76HEV5nQNh/1ziXpMDM9t3Smj8rb9ujwE3301YzxzQV2KcXIZjck
	 qKvdmM5qI95WTL9ae2YQ9Ne8kHg76JlqFRdFIF5kcjLc18x9wMkPcBKgC/2b2X6GhO
	 pDpbJVmEPSwh6FsnxCz+9BF6/vQl6LwjC+nU2AqIwmWaT02weQd53kPkEgbueVjVaO
	 jMB2dVODfAjkGzI4arvhAzy6mcAQfC02E5vfp9abeS9TdBsNfoHsLRcCzTsUUxxeTu
	 2hkTtELxkA++w==
From: Arnd Bergmann <arnd@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nvmem: rmem: select CONFIG_CRC32
Date: Mon, 28 Apr 2025 17:08:26 +0200
Message-Id: <20250428150831.4001255-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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
2.39.5

