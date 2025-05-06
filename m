Received: from mail-m1973172.qiye.163.com (mail-m1973172.qiye.163.com [220.197.31.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93F127D77F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 12:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746532839; cv=none; b=g3d7Bm44FK5c2sUEpdCqGRGz4xBFK3PscCbb9T+D+pfmL1k5FzO6e6wxD5yVKlGWBOXrnMZH4XQOWbPv2Utlva0+QBx/h/iPQJuWBAercVZnKY9X9ttIw3biNhKT31cTveDRLkTyRfMDC7XRwtAzA+GJ1YOWQwEV0QzOyMM8jMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746532839; c=relaxed/simple;
	bh=H3nSmQofOPbyGH9/LAxyApDbeSy3bZQ2QhgMQtZHcJY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ec+GSUwkgTCyqlemRstuyiYhJcrpXbYkUOWN8kpdwO6z8JtOJ5eO/gK+fqboJOyBqn+bz8NQtzDWzo9+Wo0Y6wI3rkfxKXUoPVrIU7/xARdiyH543cLxrhNE0DJdujTYpIU0bfk0n1OUaiQOPkdtDAEtI0FAnfMCdM9StIUwLto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=POqrcbhW; arc=none smtp.client-ip=220.197.31.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="POqrcbhW"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 140c6eaec;
	Tue, 6 May 2025 10:57:22 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jamie Iles <jamie@jamieiles.com>,
	linux-watchdog@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v5 1/6] dt-bindings: watchdog: Add rk3562 compatible
Date: Tue,  6 May 2025 10:57:10 +0800
Message-Id: <20250506025715.33595-2-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506025715.33595-1-kever.yang@rock-chips.com>
References: <20250506025715.33595-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx8ZGFZKTUpMGExIQkxCGBpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a96a386ca9703afkunm140c6eaec
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mww6Dxw6ETJRCRE6Ij4jMD8e
	DylPCklVSlVKTE9NTktLSU9IT0xLVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJS0tLNwY+
DKIM-Signature:a=rsa-sha256;
	b=POqrcbhWPq/szZJhg5FtRNV3pU+U2EtZcabw4xkutZdrqY2EVN8+tAxVgIV8WfvIdK+G3YrIqKoFsJ8WYBc3Dhxq4sw/CZVQngIhJgHw/B8ZqwBqhC/v6Vapz3g6N5u7t0XuARFArD1RTUCDz3YHiXE5rgltCybZ8pTikKBnmZw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=1taHNHL+bdAlejzIloZs57RLJBN6GLNLvJDGZdKJmkI=;
	h=date:mime-version:subject:message-id:from;

Add rockchip,rk3562-wdt for rk3562.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---

Changes in v5:
- Collect review tag

Changes in v4:
- Collect ack tag

Changes in v3:
- Collect reveiw tag

Changes in v2: None

 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
index 1efefd741c06..ef088e0f6917 100644
--- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
@@ -28,6 +28,7 @@ properties:
               - rockchip,rk3328-wdt
               - rockchip,rk3368-wdt
               - rockchip,rk3399-wdt
+              - rockchip,rk3562-wdt
               - rockchip,rk3568-wdt
               - rockchip,rk3576-wdt
               - rockchip,rk3588-wdt
-- 
2.25.1

