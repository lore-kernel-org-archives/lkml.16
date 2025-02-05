Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9F31DF98F;
	Wed,  5 Feb 2025 16:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771708; cv=none; b=pm7wEE0K1xBXGtw6fme6t35TNPz4DlhRMupSHe4VA5B0KYZxFQ5SdB2uVXNknSYy4pBGhXzQ2+kBH/Jt2HMB4zoZHcfEnbYOeNAMhchtO0FGzhAdw/gTG+rtdAj8/1vGmx8iS6QvZ6VfCPz6QXp7q1ZQ5waQKKGnXZCB2brLixM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771708; c=relaxed/simple;
	bh=Hx6D1rRpddICfBXk7BrrDIlZsj2WNmHzrd9slgJOb4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XGIvSnUJHynGmz8QLBLeOxza0LLEfWk/iSs8VTtprzcvsdzmNNu8WOHxFmcgIWFM082qnOZIqpcLMS4h9ygu6aux0JKZsaUz4M4Zqdr48owzRahYFXyggDxew1/by1oAiVZKUNWN025QL7eVYaS7OPQp8jkAuvspCFssx6GAwKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Io5PPFVY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Io5PPFVY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08174C4CED1;
	Wed,  5 Feb 2025 16:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738771708;
	bh=Hx6D1rRpddICfBXk7BrrDIlZsj2WNmHzrd9slgJOb4Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Io5PPFVYw7DH0OOFqTIgz5a0FBa0YyVLsVV55Bs1qViAsGGjdwYTZsqw4XsXtHi4j
	 rdYoNiaFF53kMn4Tck0hE2DNnjvCaZ9rPMjqv8ljlUXHyBSqv+7RdLP7JmePdwxREe
	 8RuwAylKBRa90LauSOjQzUxMzo/kKpq3ZZjz7iaM9j+RflQ81rQYkgxtSbm9UX5M5C
	 HD2MRso0T/TDKlRLzooD92i4+mDHnWi9UGTD/aRHB79XzFYztchvmgEjrWlugiQLv+
	 KGU+4H+1LyDxn/g1xMd7omKtfGaJj+R4P3QewbHlZMn03ja6e7c9RVasI/xZkM6zSu
	 aEAEnAOdMdd7A==
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
Subject: [PATCH v3 5/6] dt-bindings: riscv: add vector sub-extension dependencies
Date: Wed,  5 Feb 2025 16:05:11 +0000
Message-ID: <20250205-scalding-huntress-a45cab00ad1c@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250205-cobbler-unpadded-5580c1f5d946@spud>
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2332; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=GdLuIc5EAIS3gpLTxrlq7jFgE0FxstD07lH/xrh31/s=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOmLe2xTDnxPurbp87SZax+p3PPk5rSPWK6ZW2nA/Xr7D iv/0JJPHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhIcxsjQ5PirrqmnspCfnHW lp2FwX4HjNSZwubt2HKhf+Zq2+bX1owMV83sVFLXqb5b5640qWvBtP+GsxbN2HRT//iJZf0qWrv 2MgAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Section 33.18.2. Zve*: Vector Extensions for Embedded Processors
in [1] says:
| The Zve32f and Zve64x extensions depend on the Zve32x extension. The Zve64f extension depends
| on the Zve32f and Zve64x extensions. The Zve64d extension depends on the Zve64f extension

| The Zve32x extension depends on the Zicsr extension. The Zve32f and Zve64f extensions depend
| upon the F extension

| The Zve64d extension depends upon the D extension

Apply these rules to the bindings to help prevent invalid combinations.

Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-isa-release-698e64a-2024-09-09 [1]
Reviewed-by: Clément Léger <cleger@rivosinc.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index ebb252275ddd..02065664f819 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -680,6 +680,52 @@ properties:
           contains:
             const: zca
 
+      - if:
+          contains:
+            const: zve32x
+        then:
+          contains:
+            const: zicsr
+
+      - if:
+          contains:
+            const: zve32f
+        then:
+          allOf:
+            - contains:
+                const: f
+            - contains:
+                const: zve32x
+
+      - if:
+          contains:
+            const: zve64x
+        then:
+          contains:
+            const: zve32x
+
+      - if:
+          contains:
+            const: zve64f
+        then:
+          allOf:
+            - contains:
+                const: f
+            - contains:
+                const: zve32f
+            - contains:
+                const: zve64x
+
+      - if:
+          contains:
+            const: zve64d
+        then:
+          allOf:
+            - contains:
+                const: d
+            - contains:
+                const: zve64f
+
 allOf:
   # Zcf extension does not exist on rv64
   - if:
-- 
2.45.2

