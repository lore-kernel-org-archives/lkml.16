Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B83A281363
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745425679; cv=none; b=txAYhge31y5Au7lvwUzASB+9VryDo+LJDwx4/NqznbrIQtlLaZ1spwyPJyt0LB4Qld/MjRQw+qWvw8mrw9qqnLgaKcFZTzrVydlpCwFDi9/+3DDPXaP40fJksmall3sYZzxx091tGs1gUp+uSMdtRwpbpc4mip7UK3WUEBH+m68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745425679; c=relaxed/simple;
	bh=bDDfvri8YyFAG4ESNOUDoL1yc4MxDIU4ST3v842SacU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pAlSY6XbemCYR1x/rtr4YgLluL62/69TAjoh0NwS/lGJMrFYpCagy/foP3Yp8HoCLyFYNndYINRwhepOjPQM3n/3d1H0CQfMmOkhNu7RWfXf13slzGOd0e65RKsxL7ZqNp3g5PF2tJA9a3k0q1J8CMzvajxsbGZJBdBqwoUQTP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQQ39eeN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQQ39eeN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7091C4CEE2;
	Wed, 23 Apr 2025 16:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745425678;
	bh=bDDfvri8YyFAG4ESNOUDoL1yc4MxDIU4ST3v842SacU=;
	h=From:To:Cc:Subject:Date:From;
	b=QQQ39eeNbVDyoldyMV84O1TwISbsRD90SkkgFSYiBEiJPIhC5pN5JCCTxVARu7Kvm
	 H3+4P4XQlvOLXCzNuGKj1i5OqBeTUtEoeA7du9skEMI/xPA5luDH64bNq5ODCu7zcK
	 AiV9quyF+QBIpIYchd0u6fYc5t6D/FekrAvZw2c1tki9v7qWtd14pSTABbk7UupLiS
	 8+G3jLhmV7KokpQzqlj7vy6oVxz0aawv8FsCyo/YxBZ/JVsGSWNt+DxCXOdcbb1oJs
	 C+V6jvF1DRyUUWJvqqveWYedd6vZG6hiAddQatelZF1Dtrqm7IE7XmFX1lR+2bTpjf
	 o9h/6QmR2oPNQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alejandro Colomar <alx@kernel.org>,
	Kees Cook <kees@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] eisa: address link failure
Date: Wed, 23 Apr 2025 18:27:50 +0200
Message-Id: <20250423162755.2174698-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The devlist.h file is generated at build time but is not an object file,
so linking fails, at least in some configurations:

ld.lld-21: error: vmlinux.a(drivers/eisa/devlist.h): not an ELF file

Make this an extra-y instead of obj-y target in Kbuild.

Fixes: dd09eb0e2cc4 ("EISA: Increase length of device names")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/eisa/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/eisa/Makefile b/drivers/eisa/Makefile
index f0d6cf7d1f32..562d8797e3b4 100644
--- a/drivers/eisa/Makefile
+++ b/drivers/eisa/Makefile
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for the Linux device tree
 
-obj-$(CONFIG_EISA)	        += devlist.h eisa-bus.o
+obj-$(CONFIG_EISA)	        += eisa-bus.o
+extra-$(CONFIG_EISA)		+= devlist.h
 obj-${CONFIG_EISA_PCI_EISA}     += pci_eisa.o
 
 # virtual_root.o should be the last EISA root device to initialize,
-- 
2.39.5

