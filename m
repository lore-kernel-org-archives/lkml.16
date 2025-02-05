Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACEB1DF98F;
	Wed,  5 Feb 2025 16:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771711; cv=none; b=qGcwAjckXxDJyrrDBKfHPPDnoMc/Kjl7u8u0ZexMbN44vWc+Ysy9yaxOOD465mmFuv34nTUzCDWEwGWCtbzekggE308N+STgEzl/STnjKX/9OO5dhZlOQkXtoWZz5PAFkj0ccWLXdqJPgcFVDKPA0U4x/k8gnWVFcjRoMBPH2bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771711; c=relaxed/simple;
	bh=23nEvqAgqDq/DOPfIpZhT0472bYiLNAR6cd2MSKj14w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mMn0HtKXZnvrJ286ryEPDHKczKZuhaMFerU5gRKWhBH6eurwbIXxrsrvSpUu89FCMxIqpUYUL0aiELAsjCmB1tIUlZEafMkKtYgXEKfIRusCeamLTW7W6Zsheo2gDXqnuXrddb5JhxdhyqPVTjKCbr5aA9InUJRSQgOuPN/s/U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+Av3mmy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+Av3mmy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8AAEC4CEDD;
	Wed,  5 Feb 2025 16:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738771711;
	bh=23nEvqAgqDq/DOPfIpZhT0472bYiLNAR6cd2MSKj14w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l+Av3mmy+6T64+lY9WygDOfeDV7rgXn/2RZVycV6xOeXJPQCAYz++p+PkiTs1xi2Y
	 UEVWi0Ipa+KgxrZkNsBhMCHUZZvc3boeTGFY2S6pR7owWmOvWgsVhiLuqf03HMmlxu
	 tyI/cxlfoAfG/wKK4nR/UR26ABUw7VdK1dmMePCU0tCSELqFfdPl4tbv0gpY8fjxcv
	 yswn2CvRoBD/aM4e2AKIlGNDn41v8IzY8qFChH+Eow0EmLmeLOxB0ReJ1CCxiVQb7m
	 S8gynj07gbvqrMGZqzk7Q1oqJm92xbfaqJ49XsCuLCQgM5D1CzoiYYF+pQrHMuFIHc
	 CiBoR+hQyt+Mg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 6/6] dt-bindings: riscv: document vector crypto requirements
Date: Wed,  5 Feb 2025 16:05:12 +0000
Message-ID: <20250205-ludicrous-gratify-b2ae27b95ebd@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250205-cobbler-unpadded-5580c1f5d946@spud>
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2259; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=4C+zfCw5yJE5unx/bTKD27SZG4062igzYOF7ISnVt+Q=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOmLe2y7Bfanpene8DU3nMQ7YfGKj5WTr/KeP7ovccbds kWm0W6fO0pZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRzccZ/pn4u7gq2lttnn6/ WTmxM/2eY+T1TyVPjii/j/x85dZf6yxGhoMX+K6HTk29emNWSLPUFCGV7XnGT3UmvvjzxKFv8TP j6UwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Section 35.2. Extensions Overview of [1] says:
| The Zvknhb and Zvbc Vector Crypto Extensions --and accordingly the composite extensions Zvkn and
| Zvks-- (sic) require a Zve64x base, or application ("V") base Vector Extension.
| All of the other Vector Crypto Extensions can be built on any embedded (Zve*) or application ("V") base
| Vector Extension

Eric Biggars pointed out that the spec is actually incorrect, and that
the list of instructions requiring a Zve64x base is actually: Zvkn,
Zvknc, Zvkng and Zvksc. Implement the rules according to his PR [2].

Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-isa-release-698e64a-2024-09-09 [1]
Link: https://github.com/riscv/riscv-isa-manual/pull/1697 [2]
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 02065664f819..9aeb9d4731ca 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -726,6 +726,39 @@ properties:
             - contains:
                 const: zve64f
 
+      - if:
+          contains:
+            anyOf:
+              - const: zvbc
+              - const: zvkn
+              - const: zvknc
+              - const: zvkng
+              - const: zvknhb
+              - const: zvksc
+        then:
+          contains:
+            anyOf:
+              - const: v
+              - const: zve64x
+
+      - if:
+          contains:
+            anyOf:
+              - const: zvbb
+              - const: zvkb
+              - const: zvkg
+              - const: zvkned
+              - const: zvknha
+              - const: zvksed
+              - const: zvksh
+              - const: zvks
+              - const: zvkt
+        then:
+          contains:
+            anyOf:
+              - const: v
+              - const: zve32x
+
 allOf:
   # Zcf extension does not exist on rv64
   - if:
-- 
2.45.2

