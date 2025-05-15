Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABFE28AB0C;
	Thu, 15 May 2025 08:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297640; cv=none; b=U1ZmXjlW8s7eQQA+fNii005qcAssoACxHYIQlgctUIeGgjcNrHtRA9gkdwkiLS5/LPsisCBMB5A0A5l1z/SHXFlW9xIzE+buNPA/B97Q/SMlUXuHFqsJR0YYVwTKFIk/4RQ0sUabhY2nKpeC3GL23PYoQBeCOUAX5aI7fjeW+o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297640; c=relaxed/simple;
	bh=4xVZByVIdOJYGULFJgscDvuQKx2zR8bOnbIjktLdObc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XiDyNWcHNGMBTbG7zRN4Wfm0nO30NRGXVcW0kZVQjiuoB03F+YW1Jo/QnrSUxL6dHyj+Ig/RwrYsWP0J7FOTUKITv9IB5tkwmDXg4Tg4mXGPgSx2pjF6BDbCNXDeW6+XETW8gj/09xAmBtIEn6xL5AvO8VOz53Xbb6FyBvvjfJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=p7e6af3N; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="p7e6af3N"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=OAgk7CXl/I3Qccrf+0JyasnMW9sdwMzVGuy25ZCR3M8=; b=p7e6af3N+xpzK+TmZrPdSf5O4W
	JMhZVJzPfCbKxzplBHqb88iifeHcbwPAkYLwHYNibxq8yZKqd8ou/8W+e+GF8qjeJQyaFX10tOzcb
	4RnXnUUlqxSmosdIMwpzQ/rEyQ2BJrGihtFmEKyimtOTkAKP0TnWu4IRfNTKAsXcHBZaAy1pg2iqH
	nB6bmZ3n0T0hjhOb+qmnFM4KYdKIpTk4HbbeaUx07nW35wAruUoBzmfiNmg1lvoD3LlVS+F23y2Fs
	CB1FUfosZHHIC6sHNyya66AakBqWxdIZyA+6aqDgnXfN8rebgUkVs0oeXor8+doLsIWa3Iz1qdp3v
	Ig9uFf5A==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFTvr-0008Fm-J9; Thu, 15 May 2025 10:27:11 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	nicolas.frattaroli@collabora.com,
	ziyao@disroot.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/2] clk: rockchip: rk3576: add missing slab.h include
Date: Thu, 15 May 2025 10:26:51 +0200
Message-ID: <20250515082652.2503063-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The change for auxiliary GRFs introduced kzalloc usage into the rk3576 clock
driver, but missed adding the header for its prototype. Add it now.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505150941.KWKskr2c-lkp@intel.com/
Fixes: 70a114daf207 ("clk: rockchip: introduce auxiliary GRFs")
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3576.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
index 71e77013f726..1f4547af5acf 100644
--- a/drivers/clk/rockchip/clk-rk3576.c
+++ b/drivers/clk/rockchip/clk-rk3576.c
@@ -10,6 +10,7 @@
 #include <linux/platform_device.h>
 #include <linux/syscore_ops.h>
 #include <linux/mfd/syscon.h>
+#include <linux/slab.h>
 #include <dt-bindings/clock/rockchip,rk3576-cru.h>
 #include "clk.h"
 
-- 
2.47.2

