Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC42253F35;
	Mon, 23 Jun 2025 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683413; cv=none; b=qUFA0swV3e0Xay41fHHIrEpu0nBghqxj+FWy0b/Xh4zJ/ciR5q7bxhXgquLKzzz8ny6fEMkaZJa+GScOTY9TdJLIamBNXcS2SvgC4UeHE/i6eIhwofakY9++Jwc3hbSiww/VCxw0AzmLyQFdSvRZor3t+6bN6aKJzxkWYKrA/Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683413; c=relaxed/simple;
	bh=GVjFe4ObRxWxhFMM0FviQ7S/XQ0xsxyQJkNxl0XAxIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RC6wsb5+9JvufQ52TklSSZVjQlj1BWkPPi5ORjJUdJSkgFa9Qfk2EFWkT5QNCxsDOnS9UqNiaC6fLKigk1JXOQi0PsA996ODDWqnecWhFL+pKaYvyMoHov8Uj/SXI1b+krCKxxsSv6Kj4I0jdabx8/KnvXX569BfxDJ3U+WtVfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gs6OLwpU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gs6OLwpU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B87C4CEF6;
	Mon, 23 Jun 2025 12:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750683413;
	bh=GVjFe4ObRxWxhFMM0FviQ7S/XQ0xsxyQJkNxl0XAxIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gs6OLwpUhQG/IueLFxoH/Cz8a3suIICLHaT/RJ6GVJZq48sZ0jI09lAxpuSC+O6xj
	 YAkGIOgZAZixF2qp3qfNmgl2hKWBRCOYn3s+m5sAwjMnYKmQoiWQKSSN/TtlxiiSYM
	 daSHXRloUA7mb36Au+C92Xp2zv6wMkBq5KwcY6tY/IQN28moru6oLC1KFnS3KxKmJG
	 5f6dSPCjBKOvhNfgRFLNQ43Pc9/BXHp3Yy2MoH80SePWBg1hl0NJGSxO8CVPDNLDi9
	 Q48qACq9obNQdIZqY96CC38N5BKp46hEJn7Wo6gaN1rnLAO6hHjwAwIhidZcvFJBA4
	 tgJJzWdbR2vpA==
From: Conor Dooley <conor@kernel.org>
To: sboyd@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/9] dt-bindings: mfd: syscon document the control-scb syscon on PolarFire SoC
Date: Mon, 23 Jun 2025 13:56:15 +0100
Message-ID: <20250623-playoff-napkin-5426a5e304cd@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250623-levitate-nugget-08c9a01f401d@spud>
References: <20250623-levitate-nugget-08c9a01f401d@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1505; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=hxOaJHTVRbH1YgnYGVBXvMwqTyw6bMbbuBO5TUxUKWE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBmRfu+FmR1j5lrcd7wdr3zopH7R7EiV+tknnZ6x25w2D K2xuNTXUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIlIVjD8lf/+6PrEmg1pTf+W MYRqS60ocdCKPtCr9K7p0PejKbo+NxkZXpermORO5/fwqA8+Ely26M4hx10BP7kahSd3pMcFRFo zAwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

The "control-scb" region, contains the "tvs" temperature and voltage
sensors and the control/status registers for the system controller's
mailbox. The mailbox has a dedicated node, so there's no need for a
child node describing it, looking the syscon up by compatible is
sufficient.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
v2:
add the control-scb syscon here too, since it doesn't have any children.
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 27672adeb1fed..d18be50dd7127 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -90,6 +90,7 @@ select:
           - mediatek,mt8173-pctl-a-syscfg
           - mediatek,mt8365-syscfg
           - microchip,lan966x-cpu-syscon
+          - microchip,mpfs-control-scb
           - microchip,mpfs-sysreg-scb
           - microchip,sam9x60-sfr
           - microchip,sama7d65-ddr3phy
@@ -197,6 +198,7 @@ properties:
           - mediatek,mt8365-infracfg-nao
           - mediatek,mt8365-syscfg
           - microchip,lan966x-cpu-syscon
+          - microchip,mpfs-control-scb
           - microchip,mpfs-sysreg-scb
           - microchip,sam9x60-sfr
           - microchip,sama7d65-ddr3phy
-- 
2.45.2

