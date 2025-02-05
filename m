Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377FB194C61;
	Wed,  5 Feb 2025 16:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771706; cv=none; b=SVpHqjoAAzjQ0dlf3z8jk2kuuKG1O5udHuOCKbDnBkTYTbYm8QD6n9UpLDdRCqsF0uVW+olWMLJ+3gnWKSwKTDWrmoXN9VvFH49AbdBMHn9t+XozxG5YZiH/k4ubZbTqPbHFL//PamYRHufbJ+83hB5hdYJROWvyjirX/62/EXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771706; c=relaxed/simple;
	bh=PBTPbAPIWX+QDh4lvcUtj+0ELhjT53JUuY94iLECXmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fMhUjwnHCGiWn4LXKOfF/IZm90oum64HVyMxElJOQQxwfr7t/PFB0BXTxDWLxWhl9yTaUKHbv/3oV7p8uTCVBDocODIwNLdXjHDC3qWGt8Pp0/JqBwKJU2GFEuF5IUwDP479LK115zSBU7sNUVQkbZsg5/8RIQIn2csd+mrSLhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M4En6XTU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M4En6XTU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC32C4CEE2;
	Wed,  5 Feb 2025 16:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738771705;
	bh=PBTPbAPIWX+QDh4lvcUtj+0ELhjT53JUuY94iLECXmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M4En6XTU4gYjM6SblHahsMQFrwquDVrtXhwSOiRd/NNQJVnCAyqvdQY6YapDezFDZ
	 T3rE4qAj6EGNKFBj3I2zifN/45tOUFBp56uQIbe82nWrgE4tgU3A4DwtCisT+kxlMY
	 pVZPkCXzxQOItYf3yEP8Re1gX2bVT82KFcmVfVXuvixXrrz8DYlOvBCfJUatVSMXqp
	 DgKYq51kwuTxFQQMDkwflKOGPqRe1yWuXO9AnLqI+ZU9nwCujIcGFKdvbcFGYT3xep
	 O9zedOVYgFiKqzAiU0UuXRm1TO1WAf3AsZL4smgrgJMddTR0AXD1lI4P49CY4EoyXe
	 8qPf2mzfIPTEg==
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
Subject: [PATCH v3 4/6] dt-bindings: riscv: d requires f
Date: Wed,  5 Feb 2025 16:05:10 +0000
Message-ID: <20250205-flatly-clover-ae7016cb6e04@spud>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=dYPhJy02rU+uIlGkMnAKd9ueA9RZPFw8XUqVyW1zPdM=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOmLe2wyn2Zpc1yYeiZ41d8nEiVLN8wVerFq7twTB6+5B x7SDShv6ShlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEJp5l+F8j+dNOqWN3k5H2 ND/tQzuX3e94eW31mWv7wwXd6natl3diZHhYuGNy080ni/PWMn1Ysopp5RNZ6wV+tQ1n7x4ON+W +e4UHAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Per the specifications, the d extension for double-precision floating
point operations depends on the f extension for single-precision floating
point. Add that requirement to the bindings. This differs from the
Linux implementation, where single-precious only is not supported.

Reviewed-by: Clément Léger <cleger@rivosinc.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a63b994e0763..ebb252275ddd 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -639,6 +639,12 @@ properties:
             https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
 
     allOf:
+      - if:
+          contains:
+            const: d
+        then:
+          contains:
+            const: f
       # Zcb depends on Zca
       - if:
           contains:
-- 
2.45.2

