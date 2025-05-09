Received: from mail-m19731113.qiye.163.com (mail-m19731113.qiye.163.com [220.197.31.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F561269B18;
	Fri,  9 May 2025 07:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746775391; cv=none; b=KEZG/RHggEtX0FYdFngTJ9n02wPqH+QrzGsRvW14vEocMiflEUX5JnDHg10jB5XIEd+xMwmIGIxS/9hFJstEuW0z0gHGzn5iCcZ1WKSAs+Jwl57jAU5+1CCAdh5j0hmsVSY2NaqePs/XWKLuOKQ44trZ58X/oRVc4NMTgCejDXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746775391; c=relaxed/simple;
	bh=2rlsGH+IAsW0HR8MaZWLJXrXfmkAweHS3XUzFYgWiN0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=myZdtsRHV9pjX6R5nZ+GkOw3cerRcLSJtdNs/YmZsuj9LDo2zUac4ERSERoCFQa94jhvPhEyCLCJbD1yyPJ0xTV4ONWV1R6b84VlVLCOHBjflTL5cRo7twGJV+FsnzAxp3SEJYouS9pEC8tJ7PVha2sNOl6UeyykRuAvBxDJha4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=jICo72Uv; arc=none smtp.client-ip=220.197.31.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="jICo72Uv"
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 147bfe06e;
	Fri, 9 May 2025 15:17:51 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Frank Wang <frank.wang@rock-chips.com>,
	linux-kernel@vger.kernel.org,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Yao Zi <ziyao@disroot.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v6 2/5] dt-bindings: soc: rockchip: Add rk3562 syscon compatibles
Date: Fri,  9 May 2025 15:17:41 +0800
Message-Id: <20250509071744.732412-3-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250509071744.732412-1-kever.yang@rock-chips.com>
References: <20250509071744.732412-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSUsdVkoeTENMGUxITENJSlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lIQkhDVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a96b3e85b3d03afkunm147bfe06e
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRA6HSo*GTJRDQI3PSghQzA2
	IUwaFAFVSlVKTE9NTExOS0xIT0NIVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUlNSks3Bg++
DKIM-Signature:a=rsa-sha256;
	b=jICo72UvTyxMLS4jCNzsEXol0RJoYAk6UU4LWRC/e0I1zM/GN3XMXVY+wI0EUF8X1Txrqw0pWOhxIv3KbvtTyTOIDzdb/zh0kj9x92JSUQGOrMAthY+hBozZ3cY0zhUld0KrCExn0UOi+sfLt4hSWztK8Sy/IxS7SQEjbGsqdfU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=EGmigSdtRwKRT4QsrF61c3jbb3Ixc15iB5ZUt0mum9Q=;
	h=date:mime-version:subject:message-id:from;

Add all syscon compatibles for rk3562.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---

Changes in v6: None
Changes in v5: None
Changes in v4:
- Collect ack tag

Changes in v3: None
Changes in v2: None

 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index 2f61c1b95fea..8cbf5b6772dd 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -18,6 +18,12 @@ properties:
               - rockchip,rk3528-ioc-grf
               - rockchip,rk3528-vo-grf
               - rockchip,rk3528-vpu-grf
+              - rockchip,rk3562-ioc-grf
+              - rockchip,rk3562-peri-grf
+              - rockchip,rk3562-pipephy-grf
+              - rockchip,rk3562-pmu-grf
+              - rockchip,rk3562-sys-grf
+              - rockchip,rk3562-usbphy-grf
               - rockchip,rk3566-pipe-grf
               - rockchip,rk3568-pcie3-phy-grf
               - rockchip,rk3568-pipe-grf
@@ -82,6 +88,7 @@ properties:
               - rockchip,rk3368-pmugrf
               - rockchip,rk3399-grf
               - rockchip,rk3399-pmugrf
+              - rockchip,rk3562-pmu-grf
               - rockchip,rk3568-grf
               - rockchip,rk3568-pmugrf
               - rockchip,rk3576-ioc-grf
-- 
2.25.1

