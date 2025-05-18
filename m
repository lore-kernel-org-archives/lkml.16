Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93FB20E6EB
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 22:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747606072; cv=none; b=GQvSGwiYN/t3qd5mKuq37MHQl7o8AKikRq62kSP9YJwt/TjUF56gL6nOcY0nRfq2qmbQlZz5F6Eioho3se9NcBivPHQVcDPROKlmUQTGaAMfa+dIdZrpAEDgo0sRW3xnuNIAnA63YXX5fxyX5VaEAAwv5w/iKr/hBteH+wvMDfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747606072; c=relaxed/simple;
	bh=9curmiG4YbpPUmNJzaDKpDzEW84OyLQg40Vqsed5nNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=McDGQwArbIQlaAIQ1IiWaWKddc63qt1mObcVBJnvq8O22SmW+kNAq+OitsDzj/7pi00fpwhE7HOcahZNZED/XUZ0axJS1niygwkXAPAnSwhwKxHz2wuHkjYYwM/ePPKR9+sI0vNdJK8XITv+jz/cccXOjvl9yFKQLddP6a8qeC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=xs2E8B8+; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="xs2E8B8+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1747606070; bh=ngOKSl6OG/tW+9Rxzp2cYqj7UrWaCYxSd5FvuPjMg/M=;
 b=xs2E8B8+3FgUQ7jXvGctFJSj8ev7lwfPdx4geZpyUqDf5jDI2j1Wb//6zTw0xAnkrQTr8vSg3
 yPpjHPOmfnPZe7n8HtvqEaIA0bKj4S84imvk7GiedSbx65AB3rg4TL4Eo5uPH3RzO0idTlhvZ9S
 NvoOfEZWmU5o6BpJ9CrL0xxKpiiWgUAPI1a/bPm36ZHHegUiR/bLdIxj0D9FbZwRxR7K/z85GfS
 mxDiwmbAil5A6ql6Kpa94F29zm+S7NKxk+fcJRNAekQBvMEqt3vTQq7eUKpSAU8a9+ry/4SyZR6
 B2fO6Fl5QUfUFw4wBY/gIFuT6RQvMipkFac/VaDdmUlQ==
X-Forward-Email-ID: 682a5a2e78cae75fbd8d4704
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] dt-bindings: i2c: i2c-rk3x: Allow use of a power-domain
Date: Sun, 18 May 2025 22:06:54 +0000
Message-ID: <20250518220707.669515-8-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518220707.669515-1-jonas@kwiboo.se>
References: <20250518220707.669515-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C controllers in most Rockchip SoCs are part or power domains that
are always powered on, i.e. PD_BUS or PD_PMU.

On RK3528 the I2C controllers are spread out among the PD_RKVENC, PD_VO
and PD_VPU power domains.

Add support to describe power-domains for the I2C controllers.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
index 2f1e97969c3f..4ac5a40a3886 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
@@ -105,6 +105,9 @@ properties:
       (t(f) in the I2C specification). If not specified we will use the SCL
       value since they are the same in nearly all cases.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.49.0

