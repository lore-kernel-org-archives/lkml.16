Received: from mail-m49232.qiye.163.com (mail-m49232.qiye.163.com [45.254.49.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B4AA32;
	Thu,  6 Feb 2025 03:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738811072; cv=none; b=vBhS3IvpPZcnAANBVtnD2cjtTjP9vWjm0xgzQEYZQxDWp5x/jXDqbDpjHflWLr67gNjgnXejhOCjKjKQQgyI84YyhnZ9WwgGH/PPuzeTMCbeQ2mHpamAQ9+0IPT7W+htkxj8ZZRbLFFO18PL0BjDnw69ZuznZQYl6jVso+L5B9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738811072; c=relaxed/simple;
	bh=gpPAqqBmjRC1v7achzvazt4UU3KoDdfWysgY310xIgI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lmrTTZCTGCWstOmV9leYskKQzLiHIm2JheJsMWJeeMmHssRdCUAVXGA+lIHaOgMZy6LIrTq4xpL1Wi784qhpkUP28qI6zhNAGZoA/sHjdtFUKYdJap+dOyAmyzlZde13dQRtMz7NJMqczOavkYIuHcn0Zf2xrVQwQ+A4LhWHCcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=d7YY+O85; arc=none smtp.client-ip=45.254.49.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="d7YY+O85"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id a47c7ad0;
	Thu, 6 Feb 2025 11:04:23 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 1/2] dt-bindings: display: rockchip: Fix label name of hdptxphy for RK3588 HDMI TX Controller
Date: Thu,  6 Feb 2025 11:03:29 +0800
Message-Id: <20250206030330.680424-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206030330.680424-1-damon.ding@rock-chips.com>
References: <20250206030330.680424-1-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh5IHVYZHUNPGUlOQx4aSU5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94d9373c9403a3kunma47c7ad0
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ni46Szo*AjIXCglPFSoNFSkv
	GgMaFBpVSlVKTEhDQ0pKS01PQk9OVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKSEtPNwY+
DKIM-Signature:a=rsa-sha256;
	b=d7YY+O854XmgoVpBJXdIG4Nd9eU7aUyYRzKIpCa2tPl/vsYteLWnQTR8wH1gjRfOwP3Tu8QfwrXQNmKihJDxsS82hC7Tys00Tq8KRFn3sQuqlzlAAzHKfjgvSXpw+j8IWKqLlGGpTyAQ366M6B4ytht+6mewG3KV/RVqeObscK0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=DsE1WkVNoF+Jwn/u5/eTYNhUxfmsWFSRl9E2p5GwmYk=;
	h=date:mime-version:subject:message-id:from;

The hdptxphy is a combo transmit-PHY for HDMI2.1 TMDS Link, FRL Link, DP
and eDP Link. Therefore, it is better to name it hdptxphy0 other than
hdptxphy_hdmi0, which will be referenced by both hdmi0 and edp0 nodes.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
index d8e761865f27..7a1ae31cc535 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
@@ -156,7 +156,7 @@ examples:
                      <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH 0>,
                      <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH 0>;
         interrupt-names = "avp", "cec", "earc", "main", "hpd";
-        phys = <&hdptxphy_hdmi0>;
+        phys = <&hdptxphy0>;
         power-domains = <&power RK3588_PD_VO1>;
         resets = <&cru SRST_HDMITX0_REF>, <&cru SRST_HDMIHDP0>;
         reset-names = "ref", "hdp";
-- 
2.34.1

