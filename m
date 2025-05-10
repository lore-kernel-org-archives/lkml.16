Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC151E8326;
	Sat, 10 May 2025 07:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746863109; cv=none; b=h/ZddrZYgh2f6+zxyMNcSKiCtdo/OXfyKbfFNqqi3QMFAoG9Arp7yF9Zbwk9oga5QZjASf5v8FaxewSmmQYC8Ml2xMAXO0xQIHap6bSXZx1EX8Ai0Q12ibngqkHdcQb0aAVdUEOZSSEOxaNGFfWDEnEBRxwaD3A1c4vdCTr6qNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746863109; c=relaxed/simple;
	bh=+zKk01WvQFEh+9PS5+vkAROny5qxzLPQphXlcj06AMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pFs0djFR11pIF1kH3opYdOGaeXQ1gFOyoUcFJAIO0IY4FULmtwjJWALn8PER/WApUlV0oWPp3aUmr3AHosa0OdBIzb7YwM3YMOgHCrCAgY1PwFp8lUQnNeHNO/JKUmfp7rnHhRGdjKquB9Mg/dhKsoyaAHOTGc3zZ+S0/pHTo7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TiMKl3FI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TiMKl3FI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AFB5C4CEF2;
	Sat, 10 May 2025 07:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746863109;
	bh=+zKk01WvQFEh+9PS5+vkAROny5qxzLPQphXlcj06AMQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TiMKl3FIidgw00YlMPoMBmwK9lE3bbpwUptOCGHvbVzkOVCXUbldm5Jlop+mXfxhj
	 naXoADkLN7+lZu0v9TiJQFuL2NmqX2ybEjKb7IY6lhQLE4BhqKL9G9X924Ur69VP4c
	 d+WZo1PsE9A7Ruy0+bXPe9I6IXMSY0zNXFzw9K1JeMM+tu+xCmYi8hpJiD0qruR8nJ
	 b0t6tL0M5z0FIOzgz0pw8pHA5h1s7UeIvuCXKxAX7KScewNB2bV8xue7AH1czMJt1W
	 GE+AWAWJK1gDRBHn1TfwEi3CDNXoeCBqBctlsH2UVrUE3ocAKMXFePIpgy2CMTnwuO
	 PQW61e94QB3lA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D03AC3ABC3;
	Sat, 10 May 2025 07:45:09 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 10 May 2025 07:44:44 +0000
Subject: [PATCH 4/7] dt-bindings: nvmem: apple: Add T8112 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-nvmem-dt-v1-4-eccfa6e33f6a@svenpeter.dev>
References: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>
In-Reply-To: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Sven Peter <sven@svenpeter.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=803; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=1rEv9jNzjWLwB2+MWFArfWPPCr4WKfPng+/WgNvEPzQ=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4Y8C4PvicJlb00+JvVvFvq+NWXph6TEiiNVD74bLXz0/
 OFL3a+TO0pZGMQ4GGTFFFm277c3ffLwjeDSTZfew8xhZQIZwsDFKQATUfNh+B9XbvTq4S8N3oxP
 u1Y/2fD8ygy+/xsl79iarTDmSW55frqakeHa1qveyjbVLVnN7nLvlA8f/5FWMWGL8V+7rQ2sn9R
 j+DkA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev

From: Sven Peter <sven@svenpeter.dev>

The eFuse controller found in Apple's M2 is compatible to the one found
in M1 SoCs

Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 Documentation/devicetree/bindings/nvmem/apple,efuses.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml b/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
index d3abdafdbca06245cdba000ce2ca757b5ce77d3f..2e8b014e9854a1a25d662bab75fee773c62369cd 100644
--- a/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
+++ b/Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
@@ -24,6 +24,7 @@ properties:
       - enum:
           - apple,t8103-efuses
           - apple,t6000-efuses
+          - apple,t8112-efuses
       - const: apple,efuses
 
   reg:

-- 
2.34.1


