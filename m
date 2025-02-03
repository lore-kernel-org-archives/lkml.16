Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8676220F094;
	Mon,  3 Feb 2025 21:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738618262; cv=none; b=sKE2++F08lMTsHwqRlfE8bIAq8P1eIyd3YWxaON77YFRMkqjukg4342x50qsuETeSv188nlIrAkBajRkyCLUFtn3JdWGEhMqocacyXvgK/wqJyYKf21ggD8DIzfkP9iRvsn4GyOZ7nSzJCDxvhlvtNDdsrn7+MEjNjyGYApInoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738618262; c=relaxed/simple;
	bh=k9EUAUSdgz8Hi+LWzo64vfqQmxZJ++evupmA/smLcuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lXY2zpmnZRJb9nTjz0A8z7uJvqm1ocMU1nysVxV0/MTEYK+9d7FaifegvRVVIPGhlkan385UqvQy2pDN38Om2E2lbpY9A38TZcQ/ez3a0JQtIg+q767P6b+F25QeavUPM4uULsg22tGHuCX4+b28vIGSA8icM+H6txESZGheYGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtUdTdOJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtUdTdOJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E02C4CEE6;
	Mon,  3 Feb 2025 21:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738618262;
	bh=k9EUAUSdgz8Hi+LWzo64vfqQmxZJ++evupmA/smLcuw=;
	h=From:To:Cc:Subject:Date:From;
	b=YtUdTdOJt3vrSk8Om8vBARgbR43K0mYKeBkEP6EcvIl2FCHZRsUgQMPU5Vf8tIKNJ
	 A6EjboDC0O0prEQl1HJE57uOkrm4f05KlArcI9kr0/6NEk5qf/sD/9D9W07ZVEReKR
	 wfKTpDFsb70jeQWA3qrPOhU3MLFcuozsuC290Qrv/YQAG8z/0sxwJMuAjIyPPtGR6j
	 xEjryUDro4usDCKwgSEcNt2Bz5IJIvHZS4vi15Di0tH5Uzb+l7fjIflrG4M2eOzCyO
	 86NyBid3WDvv3QgIAMfJR9oOwJKZiD4YTYIt4KW9REXORj8fgs95K2vQCiOgFKOmFn
	 bnrKUBjIe+l/A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Elaine Zhang <zhangqing@rock-chips.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: rockchip: pmu: Ensure all properties are defined
Date: Mon,  3 Feb 2025 15:30:56 -0600
Message-ID: <20250203213056.13827-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device specific schemas should not allow undefined properties which is
what 'additionalProperties: true' allows. Add the missing child nodes
and fix this constraint.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/rockchip/pmu.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
index 932f981265cc..52016a141227 100644
--- a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
@@ -53,11 +53,17 @@ properties:
   reg:
     maxItems: 1
 
+  power-controller:
+    type: object
+
+  reboot-mode:
+    type: object
+
 required:
   - compatible
   - reg
 
-additionalProperties: true
+additionalProperties: false
 
 examples:
   - |
-- 
2.47.2

