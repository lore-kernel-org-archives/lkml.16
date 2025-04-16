Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80054215778;
	Wed, 16 Apr 2025 13:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811694; cv=none; b=ZleDT28hS0NlAKnzG4yeGT1kYVoiZNbyuVUYrCnIRrYUmlq+EPrEbYtk7JcaP+unh0pMsHjhupuOtKg6KTnQiXCNBceQQrzVtWDr6meFdnKxtZ6MhsCESfF2woYKQea9pxsFrj/QYcXWGfPIb5t+F22w/iNQyPPRS60tw+7EP88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811694; c=relaxed/simple;
	bh=cDKUc2qr4xy2aliQgEkwRBtZ1Kb2bgQimbu1j0KwCEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gn2CKjfgNYcvpc2vho7N7AwQf95acLvCd4xWmqisiu9qjXbN1eh+MWNfcY4eVSSh1N0nEa6fTc4k7JBbxN19iH/pbxwclb6blqKKUQnbx6LNKXUrij7ud/742aBzSs26wUsg1sHgCXKjWZm08L7HcYB2dv4F2gbG+85N6p+fNjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=1f2FbHye; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=GA4W0h1c; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="1f2FbHye";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="GA4W0h1c"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id E68DB12FB450;
	Wed, 16 Apr 2025 06:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744811693; bh=cDKUc2qr4xy2aliQgEkwRBtZ1Kb2bgQimbu1j0KwCEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=1f2FbHyedv1LxNbEscPXYOKxmEUzp+P9fVOn1ar4X3F8Vyf2j30/9K1ucuccF0rzh
	 blS89fA0tVl+gDb0gAhF3G/C64FD9SkpMabIKpV8vOt/zXgP7Xm+64nAHMXm37l5Ss
	 qBnGX7LQgyZNMNAUb+KzV5V5Z2vimmGRdiYOYcBhmlNRhY6QT9sCZPi2QUJbBBQbvh
	 zxmg3eHbU3m79dlF4DPTLZMNklaI6DmAoQhQLqaXnv7qbWOSAOCUp84pNM9jKO93fo
	 sfaU6hhIFtQIL7P8cEoMHzcSaKcF3tGh8iipXtAsmbgEMJ54jeFj6XpsgWnxFSOf/3
	 G9c4E6Eqa5W7Q==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Gr--WM_oGMm; Wed, 16 Apr 2025 06:54:51 -0700 (PDT)
Received: from localhost.localdomain (unknown [183.217.80.190])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 5EB7F12FB435;
	Wed, 16 Apr 2025 06:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744811691; bh=cDKUc2qr4xy2aliQgEkwRBtZ1Kb2bgQimbu1j0KwCEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GA4W0h1cMddHFj1ML5LOIBXpOSH4kWwboRpf/NvRm0BTWH77v8OmUSvg30W9tMt0Z
	 kZbNOPgxCw6VNWCvP4U+Kq/RNuCzu35uvUo256V1iDpspnfupP84t8Bp5VmQ9gXa4v
	 oplbZPNk5rjzchwDmR3CKZmysdccg5L8qvWd1GtU4qfQq+/H6qpHMT/VFHiu/Lhi93
	 kAYiStQpizJT1YZuk6vu7yP/ERfFv0Qov7VciIRGZGrMO07bZ96BPwvz3IrqogrM5Q
	 R7XM8RmW4nPsqeS3TGElT3kXiCWEs2IINu4BSltK8fJXMHhwDu+wGWbRXsowaY+gQS
	 ITUF2bOI8ajhA==
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Haylen Chu <heylenay@4d2.org>,
	Alex Elder <elder@riscstar.com>
Subject: [PATCH v8 6/6] riscv: defconfig: spacemit: enable clock controller driver for SpacemiT K1
Date: Wed, 16 Apr 2025 13:54:06 +0000
Message-ID: <20250416135406.16284-7-heylenay@4d2.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416135406.16284-1-heylenay@4d2.org>
References: <20250416135406.16284-1-heylenay@4d2.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clock controller unit, or CCU, generates various clocks frequency for
peripherals integrated in SpacemiT K1 SoC and is essential for normal
operation. Let's enable it as built-in driver in defconfig.

Signed-off-by: Haylen Chu <heylenay@4d2.org>
Reviewed-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 3c8e16d71e17..4888529df1d8 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -250,6 +250,8 @@ CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_CLK_SOPHGO_SG2042_PLL=y
 CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
 CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
+CONFIG_SPACEMIT_CCU=y
+CONFIG_SPACEMIT_K1_CCU=y
 CONFIG_SUN8I_DE2_CCU=m
 CONFIG_SUN50I_IOMMU=y
 CONFIG_RPMSG_CHAR=y
-- 
2.49.0

