Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1508B221FC4;
	Fri, 11 Apr 2025 12:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375375; cv=none; b=Sj3qkqK3GxoIt+SxjJcTO3WKM2MNCqTmdA6/g0jIGABSqHyweq1fQH67c3tcJikiZlIM7xA5NatgEcawxGXiQ0WmoLAuzYue0tiOXKJJUwvyglGmRzcx+KmWBa/0WWbwNsu3a6lF1CzCaIpoBeQr91Krq8sW23EG5EACRZUjx0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375375; c=relaxed/simple;
	bh=4Ja56XexhMA1DCbBsQ1zoDOwfhujr3WsOePoWuHRSsc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ro98ibo1Tb7WG02FJRyCazzb5516ZqP01qJdebYdhz3dF5PdXdAeF0SG98Gd3Y+Oh9LU1vy/RSJcQ0Zc60pD5JP0PnxkwBmEmhAE+Asd5hpRC0AamIgCfqocE3SIkenOQ+hQuagX+w26pQ/dwbrriycXWoqaBa5lUvZY6dTxoL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhGa06pn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhGa06pn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AC4AC4CEE2;
	Fri, 11 Apr 2025 12:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744375374;
	bh=4Ja56XexhMA1DCbBsQ1zoDOwfhujr3WsOePoWuHRSsc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VhGa06pnAJjSwN1NSo8al7+LsFhxD+uf7+PY+TCvEWDXrdO1n41QSFG3HQa3+/ToQ
	 q51MS4KyRixR99YarxfmL6PwoUXNJyCyszkUhBZlBoIOgMJDPmzU89WJ40+9Br4Eop
	 HqeteyhhoDk/VAbzaT2PaSsuKJj9F1qW57XSm67UCuqJpvlnj5XViPB0aUUrt/+HtA
	 eOz4OMAR9rx5p95GqiJpTtYh45qI5tejplMyuF/cUGiLSKeGl27i8iTl+eI8QiQ+k2
	 lckBBwgAubxpHx69AgbnW7RSEoFxliOg/sU6zRBX1AO87v58uwYNdEBV/erJ3dzW09
	 Cju/CLmqIJXjA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67832C36010;
	Fri, 11 Apr 2025 12:42:54 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH 0/7] soc: amlogic: clk-measure: Add clk-measure support for
 C3 and S4
Date: Fri, 11 Apr 2025 20:42:42 +0800
Message-Id: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEIO+WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0ND3eScbN3c1MTi0qJU3RRj42TTxCQzIzMzSyWgjoKi1LTMCrBp0bG
 1tQD1zih3XQAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744375372; l=1025;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=4Ja56XexhMA1DCbBsQ1zoDOwfhujr3WsOePoWuHRSsc=;
 b=hNqHwd8xj6la7bifCJfhTbVRhSovhfmFzrYyzc9dzFgcKEAMHEqsdY6+AhrxaJauQy/eae5NF
 PLtq085pFpjCsXqAkyeugg02kDsfGTyViS4F7xDX3inqsLT5CYxyQfk
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

Add clk-measure support for C3/S4 SoCs.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Chuan Liu (7):
      soc: amlogic: clk-measure: Define MSR_CLK's register offset separately
      dt-bindings: soc: amlogic: C3 supports clk-measure
      dt-bindings: soc: amlogic: S4 supports clk-measure
      soc: amlogic: clk-measure: Add support for C3
      soc: amlogic: clk-measure: Add support for S4
      arm64: dts: amlogic: C3: Add clk-measure controller node
      arm64: dts: amlogic: S4: Add clk-measure controller node

 .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |   2 +
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |   5 +
 drivers/soc/amlogic/meson-clk-measure.c            | 399 ++++++++++++++++++++-
 4 files changed, 396 insertions(+), 15 deletions(-)
---
base-commit: 37021be47d02d2913d6767795a6f4c72b4e63a4f
change-id: 20250411-clk-measure-d33c5ab62669

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>


