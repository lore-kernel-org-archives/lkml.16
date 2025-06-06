Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0399420FA90;
	Fri,  6 Jun 2025 19:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749237763; cv=none; b=ZDGOn2h5iUYjB37DqL1aqc3y+L/XyJ4DINWIP/IGCCCjUv/0YaJO6RknYzMbYh1nBs4BazemLpnx3TzCtOR5lttrElut4GsuIg7KtIv3ehYttDhqLePJCatZ1VZ1DVFO+X19OpjNGU21XIG3TsCdooUjTun5EHCvT2YbGiFALd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749237763; c=relaxed/simple;
	bh=O3EpfSpdopDhfBVbWz6sKqweInKXeLeUT2TEtxWApiY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=clehBLjbBExycHXuJOzAE73QGROO3DVsycwYBJC9Y37sH9zUooi5TMcHaraSeXh3UYzqqjMYhedhSrwxmpFuZ0yWF8eiS5hGOoxfiuKWDgAPomuYBwmRyOuj/3oJ1qqaPDK/xK/q4pHzS1oS6BK4M5TRjJmF53CeMFNxuJ0KHQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Agzq/+Ue; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Agzq/+Ue"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450cfb6a794so16981675e9.1;
        Fri, 06 Jun 2025 12:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749237760; x=1749842560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cASi4beLN5z6XxY/m0It44LL3MvOC5VTlaXm8/Ow5Vs=;
        b=Agzq/+Ueo4wnA+bhpEmP+TqX96OKH6pzP0cbwaVqaNCHGtkgay9BE2exjfgwXrPyWD
         vL2dEP/CDW/6YCcKxQLVmxB6UVxbRqDWMjgULuSRVux6gSHK30q+BL5eQegEuqUAahu4
         1kp095PoiXqS8GtTw+3A9I5yoyL1n1F9TwFu597ZNoPDENlRcx39+rGULXPeQvGrru8h
         f3oGtfmvURBzrsQy3r0YxHOJ10106Lf5lEk2hEe0k7VuQUHdFfxlQVCdW0J18W9+FXNi
         pFNdFxthUU9+ArIaPgGS5bcVyq1cj5YAubtA91/I0D1+8ns1MCBDlSYi36C5UNBsHJJr
         nNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749237760; x=1749842560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cASi4beLN5z6XxY/m0It44LL3MvOC5VTlaXm8/Ow5Vs=;
        b=VVWyilN5kMwsXI9dHCoWNRXqZ88Ndif7kFD3Pm/KAgCnozj25KDlA5Dw4ryDOQIG7S
         +e6aZf9G1rUFHDPyP4ax7f3hPn82FhY6eNHgN41D9+M/OoyVt7TSIuHUjyONceCLJj78
         PDRCc4pRFdusti2ovOLbTpQcNJpFNul4Q2XJYbVfuj6+m0/WuuDI4NtbFu8Ew6LkJBpQ
         ZNr9Gh5X4388NgUpLCLjJVLNyGl8pQ8ScvY070f7SmD6J3fydilNI16IueMkW8v2YvXV
         jjQ0lVRIlp9oq9Dr5kUHy6xVJjp08ZFO+wWgehO0OwqZ0A7w9c4CZXE3gpjEd37Aflfg
         2KTQ==
X-Forwarded-Encrypted: i=1; AJvYcCURRI9xtBDXh4x773XxBeG7Wel8ZFFQqv1vbo2yJNgXQHQTkYA0CmXb+PVfsmq5g7JNyHBzieP/usxzGGa6@vger.kernel.org, AJvYcCVZL4BM3XMUY4zrfqjjIYzrdQmExyfvjbmM4epRV62EBHTkCmSjTQjrD6hYqSInFYNibeVwq79q2c36@vger.kernel.org
X-Gm-Message-State: AOJu0YxktWqxCj/dtkeAYFaa98pMjMf54EJd/ZqIId/EvLuf8AoQJdNK
	oHl6pK/MKge5LglYTtZ5yv4y2LHbCflY8WjSQEAVkbHNZ4wzoYu46p5tp/yuNQ==
X-Gm-Gg: ASbGnctL1Q7jrrmyj7Y0NYzy+9VJ5XvNt6ewzOuNpNZJX9V27Er2gMe0wtzAOdtzO8G
	83Qft+7u+rA8jc0//YVrJEtbTAps6zZydo8HBwzxwTqZ2IuEiThBl63X7ATT67VJyZ4CXE5Gxuy
	AmEVG80Gxy3n2lY3utsC4t74LyxWnj4rSCNLZVYGNeXc4i16Bfn6lETGs5OmOqn/xK/6Ayp3Vzi
	1l45e1umf7Df7oQ/3wf7f4PYQ1YnLE6cLairKYHYpPUuCG7aM3DfUNHk+A1Lo+qZZN2OQnvuSBH
	/lxkglzQn8JHiHDUmjMuQcHqmF73cVZBLPaoEWW5Kb5jxr5cY+jQUM4cgLQpXjW+9fa8jenxJIp
	DL/1CFSLNSwXVabK0F8wu
X-Google-Smtp-Source: AGHT+IHDXYu8owykXvL2eQ1VC2oUvIdu6RDT6wGekHH4SyafOc1nP6I1fUcVwnFtSQpdG7bbdIngNQ==
X-Received: by 2002:a05:600c:1d04:b0:43d:ac5:11ed with SMTP id 5b1f17b1804b1-452013d230bmr45510795e9.24.1749237759872;
        Fri, 06 Jun 2025 12:22:39 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-452730b9b27sm30951595e9.23.2025.06.06.12.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 12:22:38 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] phy: airoha: add EN7581 tag to PCIe PHY driver
Date: Fri,  6 Jun 2025 21:22:03 +0200
Message-ID: <20250606192208.26465-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250606192208.26465-1-ansuelsmth@gmail.com>
References: <20250606192208.26465-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for support of Airoha AN7583 PCIe PHY driver, add EN7581
tag to PCIe PHY driver and register header.

This is needed to better differentiate the 2 driver and 2 register
header between EN7581 and AN7583 that require a very different
setup process to make the PCIe port work.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS                                                 | 6 +++---
 drivers/phy/airoha/Kconfig                                  | 6 +++---
 drivers/phy/airoha/Makefile                                 | 2 +-
 ...phy-airoha-pcie-regs.h => phy-airoha-en7581-pcie-regs.h} | 0
 .../airoha/{phy-airoha-pcie.c => phy-airoha-en7581-pcie.c}  | 6 +++---
 5 files changed, 10 insertions(+), 10 deletions(-)
 rename drivers/phy/airoha/{phy-airoha-pcie-regs.h => phy-airoha-en7581-pcie-regs.h} (100%)
 rename drivers/phy/airoha/{phy-airoha-pcie.c => phy-airoha-en7581-pcie.c} (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2f30432916a3..2ea56cd21c8a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -730,13 +730,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 F:	drivers/net/ethernet/airoha/
 
-AIROHA PCIE PHY DRIVER
+AIROHA EN7581 PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/phy/airoha,en7581-pcie-phy.yaml
-F:	drivers/phy/airoha/phy-airoha-pcie-regs.h
-F:	drivers/phy/airoha/phy-airoha-pcie.c
+F:	drivers/phy/airoha/phy-airoha-en7581-pcie-regs.h
+F:	drivers/phy/airoha/phy-airoha-en7581-pcie.c
 
 AIROHA SPI SNFI DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
diff --git a/drivers/phy/airoha/Kconfig b/drivers/phy/airoha/Kconfig
index 1674134ea664..08cc1fe4a11c 100644
--- a/drivers/phy/airoha/Kconfig
+++ b/drivers/phy/airoha/Kconfig
@@ -2,12 +2,12 @@
 #
 # Phy drivers for Airoha platforms
 #
-config PHY_AIROHA_PCIE
-	tristate "Airoha PCIe-PHY Driver"
+config PHY_AIROHA_EN7581_PCIE
+	tristate "Airoha EN7581 PCIe-PHY Driver"
 	depends on ARCH_AIROHA || COMPILE_TEST
 	depends on OF
 	select GENERIC_PHY
 	help
-	  Say Y here to add support for Airoha PCIe PHY driver.
+	  Say Y here to add support for Airoha EN7581 PCIe PHY driver.
 	  This driver create the basic PHY instance and provides initialize
 	  callback for PCIe GEN3 port.
diff --git a/drivers/phy/airoha/Makefile b/drivers/phy/airoha/Makefile
index 616dc96302af..f8949a291486 100644
--- a/drivers/phy/airoha/Makefile
+++ b/drivers/phy/airoha/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
+obj-$(CONFIG_PHY_AIROHA_EN7581_PCIE)	+= phy-airoha-en7581-pcie.o
diff --git a/drivers/phy/airoha/phy-airoha-pcie-regs.h b/drivers/phy/airoha/phy-airoha-en7581-pcie-regs.h
similarity index 100%
rename from drivers/phy/airoha/phy-airoha-pcie-regs.h
rename to drivers/phy/airoha/phy-airoha-en7581-pcie-regs.h
diff --git a/drivers/phy/airoha/phy-airoha-pcie.c b/drivers/phy/airoha/phy-airoha-en7581-pcie.c
similarity index 99%
rename from drivers/phy/airoha/phy-airoha-pcie.c
rename to drivers/phy/airoha/phy-airoha-en7581-pcie.c
index 56e9ade8a9fd..ea448cdf9ae0 100644
--- a/drivers/phy/airoha/phy-airoha-pcie.c
+++ b/drivers/phy/airoha/phy-airoha-en7581-pcie.c
@@ -13,7 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#include "phy-airoha-pcie-regs.h"
+#include "phy-airoha-en7581-pcie-regs.h"
 
 #define LEQ_LEN_CTRL_MAX_VAL	7
 #define FREQ_LOCK_MAX_ATTEMPT	10
@@ -1279,12 +1279,12 @@ MODULE_DEVICE_TABLE(of, airoha_pcie_phy_of_match);
 static struct platform_driver airoha_pcie_phy_driver = {
 	.probe	= airoha_pcie_phy_probe,
 	.driver	= {
-		.name = "airoha-pcie-phy",
+		.name = "airoha-en7581-pcie-phy",
 		.of_match_table = airoha_pcie_phy_of_match,
 	},
 };
 module_platform_driver(airoha_pcie_phy_driver);
 
-MODULE_DESCRIPTION("Airoha PCIe PHY driver");
+MODULE_DESCRIPTION("Airoha EN7581 PCIe PHY driver");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
 MODULE_LICENSE("GPL");
-- 
2.48.1

