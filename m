Received: from mail-m82174.xmail.ntesmail.com (mail-m82174.xmail.ntesmail.com [156.224.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D934C29ACF5;
	Tue,  6 May 2025 04:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.224.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746504787; cv=none; b=nxKiBIG7+qwBjIwnmQ0eIbH4rGlrk8fjvPAzMUQ3nlJ1EpbsXPvlVdJbXz/t8NVkyuIZh9ShS17uVlYANxsSU+nURU0mfsQaCj98Lp/NYeh9AgoZRlsJ93UuYgRCakLsn2UANptBkcDdMFhDX7c+daViozydO0HAWqXl/b9M4Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746504787; c=relaxed/simple;
	bh=uDVf/saMy4+Z9R9ojM5P/eQj0EB4phsLM7i+B38h2iE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cSQL6vrO/xuEZTzLFXeVZieg+jdeEt9QkmYnIlsN7IRwkpw6Dp8BcWNFylx77QMUiT4YpGRmCOK/jfO6nW2dpCDCKowFqWSH4mHF+QOMXjYb6Rcl/QenbMNva9d4kreEy3DqF4nU+yOJQeNdrZyP/BXhABdtgQe2XakJB2Lv+1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=EwQtZEg/; arc=none smtp.client-ip=156.224.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="EwQtZEg/"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 140c6eaf9;
	Tue, 6 May 2025 10:57:25 +0800 (GMT+08:00)
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
Subject: [PATCH v5 3/6] dt-bindings: soc: rockchip: Add rk3562 syscon compatibles
Date: Tue,  6 May 2025 10:57:12 +0800
Message-Id: <20250506025715.33595-4-kever.yang@rock-chips.com>
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
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk5NHVYYHU1MQ0hKQkkfGUNWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
X-HM-Tid: 0a96a386d66c03afkunm140c6eaf9
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pwg6FCo4VjJRNxEtIjMJMD8d
	HC4aCTVVSlVKTE9NTktLSU9NTUtPVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJTkNPNwY+
DKIM-Signature:a=rsa-sha256;
	b=EwQtZEg/JcR9X1aI3qN+lcZB8BLJGZzmogevqtBCXYTMSJ0LbLAJFcjnWqQPESUH3kmNkI/EZAUbcKEte4FPiuE3Uah8VQA0K+JXK1YYyEVymbNOlBJXzC3uVUT3d0nhvqtFSGkPKwp/C6M/TbKL86Pux1ebE1NWBWMr2fCR+ks=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=z6yuuAP3upQvCqHVAexjgMB4cGshHYyvgpiH/jTzsjM=;
	h=date:mime-version:subject:message-id:from;

Add all syscon compatibles for rk3562.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---

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

