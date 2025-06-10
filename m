Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D992D244694;
	Tue, 10 Jun 2025 17:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749575862; cv=none; b=HnfmE4IKkhK9uViMksDgqvpQAU/4930y/YRO2hA6iglA9aMWQdHmQu0ZAswdWHR+CRANUB7w06lhkkPnhQLDDrPNbeiAUmyeXBMmGNK9j0sMcZQPxW5aAd6eTSEUr+viOH3nMHAT2FELVE4foKjHM00dWzFLEgy/ptuWhQu+p9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749575862; c=relaxed/simple;
	bh=B8ef7NKPQf8MeJRbWQzc5+78gOTS5XigM7aRKiQ2pMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QJqH4dDy5re/qGY7LopI9opqxn4nRLmaEGwzlRtI/ivhEodObGqPnZ510eEn9baJVCBE1fCAuEVZwAIjMWoqw05YFo9B6D4nrIGdZ2a9Uv1M01Masfo0bdSxv6VgRPxdF5Xq9IbQjGmJ/xBZcjn5R1kAIQF1sILx+6QLiT/YhDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bv/pgGgt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bv/pgGgt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D14EC4CEED;
	Tue, 10 Jun 2025 17:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749575861;
	bh=B8ef7NKPQf8MeJRbWQzc5+78gOTS5XigM7aRKiQ2pMM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Bv/pgGgtwyhBRUEEPXJWy9emq7OrC/BQpCtIn+9AVHIWi95dl5eNelFaz3gRmOwz9
	 VFBhN9eDBiEVYK6A1UjT1+IGJV3icki+5Z+fxT0uXb2pTjvDIeANElQdyRrUaTlbVv
	 tJzeRjD5Nx+8MzyRE34DztV4XfxA7b59xSK0hG0/OBc81SrJLQ1YLSr1hYN+ujWwTx
	 3ratqSOl0QmNW3BvdpmSSM/efEux0M6rP7NpyJv6E/zyaj+l+oAnJd7+IVuerasYe+
	 RK4tzvW5m0cVv1QTBGMeH3X7d9xpZ0p6dxhxbJLe76FG9m6zLMO64vSnL01ljb9Di+
	 HlCMOZOSOABlg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C7AC677C4;
	Tue, 10 Jun 2025 17:17:40 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Tue, 10 Jun 2025 17:17:34 +0000
Subject: [PATCH 1/2] dt-bindings: nvmem: fixed-layout: Allow optional bit
 positions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-nvmem-bit-pattern-v1-1-55ed5c1b369c@kernel.org>
References: <20250610-nvmem-bit-pattern-v1-0-55ed5c1b369c@kernel.org>
In-Reply-To: <20250610-nvmem-bit-pattern-v1-0-55ed5c1b369c@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Hector Martin <marcan@marcan.st>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1501; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=B8ef7NKPQf8MeJRbWQzc5+78gOTS5XigM7aRKiQ2pMM=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4ZHxoZ/okfto2eHbj4+w1y7M+nftQ55e03LZo58+ZYOa
 VtWs/yOUhYGMQ4GWTFFlu377U2fPHwjuHTTpfcwc1iZQIYwcHEKwERqZzMyHNZTTllZe/qq9eNF
 V90ZKxaz5WRMCbz97ILp6RIbMYZSUYZ/dtkLODTnn3v1hG0qX/uVlw5W3HfZlqV96O/tOOllu6G
 aEQA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

NVMEM nodes can optionally include the bits property to specify the bit
position of the cell within a byte.
Extend patternProperties to allow adding the bit offset to the node
address to be able to distinguish nodes with the same address but
different bit positions, e.g.

   trim@54,4 {
        reg = <0x54 1>;
        bits = <4 2>;
    };
    trim@54,0 {
        reg = <0x54 1>;
        bits = <0 4>;
    };

Before the conversion to NVMEM layouts in commit bd912c991d2e
("dt-bindings: nvmem: layouts: add fixed-layout") this extension was
originally added with commit 4b2545dd19ed ("dt-bindings: nvmem: Extend
patternProperties to optionally indicate bit position") to the now
deprecated layout.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml
index 9bd34bd5af30d83ae03d48b10f3b2c5be2ee9586..b01567f9928443fd0f6d4f252cf2632dbec0de9a 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml
@@ -27,7 +27,7 @@ properties:
     const: 1
 
 patternProperties:
-  "@[a-f0-9]+$":
+  "@[a-f0-9]+(,[0-7])?$":
     type: object
     $ref: fixed-cell.yaml
     unevaluatedProperties: false

-- 
2.34.1


