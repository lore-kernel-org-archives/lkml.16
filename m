Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BED280A58;
	Tue,  4 Mar 2025 22:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741127166; cv=none; b=P2ljzt4tbvAhhFupeFfcLspZLAnHHYS2WCF/7fBxuFUDyzIvYTKeVVuiFZ86mgX6aObwArVgmoyPJ7c/k10KRvcCBcx1xNocH6J144pVycfGDBQf8FwgomflrBnWjd3JKrymVlR3u6JNVlBzVOsZJQHMAP9WQ0IoLFmtuTw9WTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741127166; c=relaxed/simple;
	bh=Nrub3qkRA+TgomjJTI2MZjvgOCSj3Qk4NBzAijrfWTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B9XupzHlKH5VaelERBMslC5zn2Kql83hDTuFZYWo8ec9Seq/zBagEsIqglp1gNCeyKbWpgsJEOXXI71JO0jVIotq++uqrl+D7XaPz9Iog9jA5SwvVChmqxO4U1XBvSX5Q+gVSWB6RqK1Rr0FBfXmvIVnUTeLctJCfDEuZrLMUSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=fail smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0561F2F;
	Tue,  4 Mar 2025 14:26:18 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 098523F5A1;
	Tue,  4 Mar 2025 14:26:02 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/15] dt-bindings: arm: sunxi: Add YuzukiHD Chameleon board name
Date: Tue,  4 Mar 2025 22:23:08 +0000
Message-ID: <20250304222309.29385-15-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250304222309.29385-1-andre.przywara@arm.com>
References: <20250304222309.29385-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Chameleon is an Open Source hardware board designed by YuzkuiHD,
using the Allwinner H618 SoC: https://github.com/YuzukiHD/YuzukiChameleon

Add its compatible name to the list of valid board name.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 80096819fda91..cce31492b0f11 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -1091,4 +1091,9 @@ properties:
           - const: yuzukihd,avaota-a1
           - const: allwinner,sun55i-t527
 
+      - description: YuzukiHD Chameleon
+        items:
+          - const: yuzukihd,chameleon
+          - const: allwinner,sun50i-h618
+
 additionalProperties: true
-- 
2.46.3

