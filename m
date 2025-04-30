Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958CB25D90F;
	Wed, 30 Apr 2025 12:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014790; cv=none; b=hTpev/gVNJbmC/+jCynIx9GEVXF2GtKFaSBb+IhJpPz5XCNsQWGnzSelWLX42xMR0In1fisV9Rqkv+HjIYYh3t/vKg4Stz7BjvYZ/R1L6HAp6oyd4BePUvptYy/cDvVu4AnovFk5zwb0P+lVyckABP4QvxxBDUefZ9P33UezEH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014790; c=relaxed/simple;
	bh=p1YMctkP+4J9z4wfwHeFb82KdEtOcPG7Y1y61zmIgxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G0z9IwAJv6Xhe3qUrFBcJf4/ENlFx9HM8LX0lz2ryGqopMVnJVUwCD8j7mr66l9QP6j6FPVnZo5b2yoc6/F1M/+A5fG1X3StT+DbkYvJdqII7aY4qYeTN0KCf1cynhqLkbfglJDpYKXIQqnEViDnyptiBGFwr8VkZ9gMllenl6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=ibChXvct; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=hXGTCeHa reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="ibChXvct";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="hXGTCeHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1746014787; x=1777550787;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=omb28bPFnepOCl9nKwsWgB/GlXCLrfSFWc7L3eCs/XI=;
  b=ibChXvct7i7vmEGg4fZxoCR2ir0uyj3plQhfbntVBoSqWvgm4GsplXUj
   eGIrclo34nD0nNhPOiCctQ/U+t+y8m5V7tqJ0qHVySyEuWhopVHlNGmvk
   xgoe5AQ5j7emAfRlQyuiz+/nB+s9++nBMKd1O76Gp4Y6HUPyCjlhKQGzC
   hUEQTbY/6nM3Pf3K//D56Vpe6Tpmufb1YZ9mXi5lJ+jMdCEPwxPsdF6cn
   zK3tFhv/sQ+18g+fYCfmVzb45AcU7ONyQ13ClRrC1eD+wJvXj+QTQdSNh
   Mr0NJEqkfnfxaWB77nVus8BdqvrQhxHaZOUZHWBMEgHYj+wu5glgoXqTh
   A==;
X-CSE-ConnectionGUID: v8x2pFd2Q+e4LtiWMKjCjg==
X-CSE-MsgGUID: xFRknDV/Qp27JbnCNXdQEA==
X-IronPort-AV: E=Sophos;i="6.15,251,1739833200"; 
   d="scan'208";a="43809741"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 Apr 2025 14:06:23 +0200
X-CheckPoint: {6812123F-3B-C7E25413-F4312D34}
X-MAIL-CPID: 26F950DBBDC6ACB49334F34AB69B5E04_4
X-Control-Analysis: str=0001.0A00639C.6812124B.0078,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D26EA167074;
	Wed, 30 Apr 2025 14:06:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1746014779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=omb28bPFnepOCl9nKwsWgB/GlXCLrfSFWc7L3eCs/XI=;
	b=hXGTCeHaQ8mm1Ph5J5FX4phYmH+hTjYb/aV7FLUIYQlHYpbswwdt37IBsiLmhm5D+uWhP1
	1HLKphb7S6FFE4asYZgRBK+C+SDw8Dv46L0mJt+6Nk0NgMK52X6Qu/qThgU3bE/j47WcAp
	mjgdvb4ywYbV0Avn4VGitVJq+NVz7jxzAWqobyamS6l7oxNJ+tgE5F3MGp9CZxeDHvUgrT
	IACo/edJ7bUMVVgbwh6oEQBCi2cSDNxu7Q6XQ3CLT5YcB+ghVTTOFAdMUhnxRTQ0I7kgM4
	eiRRHNVok8jbx/qd+ebhpzAmcK7SHygWQkkOcGgfV/jaiyE69PvedG31jjjhzQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt: bindings: arm: add bindings for TQMLS1012AL
Date: Wed, 30 Apr 2025 14:06:00 +0200
Message-ID: <20250430120605.2068102-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

TQMLS1012AL is a SOM using NXP LS1012A CPU. MBLS1012AL is a carrier
reference design.

[1] https://www.tq-group.com/en/products/tq-embedded/qoriq-layerscape/tqmls1012al

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
* Collected Conor's A-b

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5ff0bc6c92483..8b9d96c5edc65 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1538,6 +1538,12 @@ properties:
               - fsl,ls1012a-qds
           - const: fsl,ls1012a
 
+      - description: TQ Systems TQMLS12AL SoM on MBLS1012AL board
+        items:
+          - const: tq,ls1012a-tqmls1012al-mbls1012al
+          - const: tq,ls1012a-tqmls1012al
+          - const: fsl,ls1012a
+
       - description: LS1021A based Boards
         items:
           - enum:
-- 
2.43.0

