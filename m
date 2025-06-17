Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AB4295520;
	Tue, 17 Jun 2025 09:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151247; cv=none; b=DjDDt73sR4pggYeAeSDg/vTUVa2OwRjL1tyrscnTOyFm0MvGOyokrOPdEizJUPGsQk7ciD+TQrPrhN7QPz5IBYAI6pec4pYHU8sEL92TSk2qZIGA+hyOixGFC9pp15IZ+LXq3ubw/KifzIslWewJ2J1BBlEe4Pw+2en4ulKdHzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151247; c=relaxed/simple;
	bh=EDT1SOtdCggXefr4ykTCKllYEE6DBQiIGJowVV/i1Nw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j5+CE4FxypwP5KYnRC+VvIaSDPnB62N2dILLE9fElwqfnidBZUSreXX+/wjTQhPP6UXS5svWp/IfGgPXZw2wIhSYL9W4K7aSFrkAcr+Z0MLbQGKuhjGCA63fCzJR9OazrRL/uZjhRT5WdAMp/E35+kGmXQb8k1tTbmYErrjJ32E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pZkKdaf7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pZkKdaf7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59AE0C4CEEE;
	Tue, 17 Jun 2025 09:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750151247;
	bh=EDT1SOtdCggXefr4ykTCKllYEE6DBQiIGJowVV/i1Nw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pZkKdaf7pPUdj89QYS+SN6yvqZQ3rGVid+caRFWjc7ZEM51z05mA6RWxJuqKL7Wz8
	 WkU/qB+pAEUhj4ueuhnjX36cx48963ZxRIOu9sxcNZjK0mC100JWEjhLV8UvccQF5K
	 t41CIFTW4/jrpnj2P9jpFMMjM5PGJjT0xErbGeszaTjNMh0arKHseL9EvVY3GNhlFe
	 sh4RJVolSAivZWJim5KrMAKJ1XSRUc3QTEoEwnqrGZaVXTIUzALoULkromF8jShgpa
	 9cY0/VOu/F0rawJj6kipvThP0K71FL+4J7+oXl3Rh8XfVUo32QBtHr/Y1+Y+JrClbY
	 nv9x3byRIlSmw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A79FC71136;
	Tue, 17 Jun 2025 09:07:27 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 17 Jun 2025 10:54:42 +0200
Subject: [PATCH 1/5] dt-bindings: soc: rockchip: add rk3588 csidphy grf
 syscon
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rk3588-csi-dphy-v1-1-84eb3b2a736c@collabora.com>
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
In-Reply-To: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750150493; l=880;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=BZKRYDbmVz180lFPXWMOf8qDnvWsNoqRKtTqFJ29J6s=;
 b=KDsB8HxjAL81/CjJwei3iWocX3CiIBzGjbMYboyngZq1YbWERYJzG0QE7dxwhHn03FwCTHPZK
 qyKSOs80bmIDLHBOQdfIVqaaXjrMkYhxox9EA5jsA++LIKXClDbf5ru
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

Add CSIDPHY GRF syscon compatible for the Rockchip RK3588.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index ccdcc889ba8e..3a1035fbd8dc 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -47,6 +47,7 @@ properties:
               - rockchip,rk3576-vop-grf
               - rockchip,rk3588-bigcore0-grf
               - rockchip,rk3588-bigcore1-grf
+              - rockchip,rk3588-csidphy-grf
               - rockchip,rk3588-dcphy-grf
               - rockchip,rk3588-hdptxphy-grf
               - rockchip,rk3588-ioc

-- 
2.39.5


