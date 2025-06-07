Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA1E1FDE01;
	Sat,  7 Jun 2025 21:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331744; cv=none; b=HJ8AW0bBbIBQ6WPtvtlc91LtwUZhv9GRnRXdY+ZVtzFIKG0bsSb0OSuU7YtqebK5X2Rm/SsdxuRXkIuGNugxeWLQtlIb1CLNPdNzFiw4fLw/blc2g8QTiaeb/zPCsCLEB66//63Jaf5BZJZczsVj/kuxwlk3ZaMGX0UlnJmMjlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331744; c=relaxed/simple;
	bh=XHrP+0GPTa7TRd2JvYw/E9otF7QNFDMpfbQMlQ7dElg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IgL8gdyJ3HG2BPkfknErVLhV+Az2hK3AsSw+3cnZUeX46BSg+WqQ3zfNi5wh3XxKgQg+DmgAzxkPQRFCnS+B6DXq0BzBB909RSDk9Aqtt5woF8XnIqFNIf5rXYRLt6AwGN6d2u1CZwd2CCX4GZvT1we/14pc1MFOaUli1n62EXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mY86qNwL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mY86qNwL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540EDC4CEF0;
	Sat,  7 Jun 2025 21:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749331742;
	bh=XHrP+0GPTa7TRd2JvYw/E9otF7QNFDMpfbQMlQ7dElg=;
	h=From:To:Cc:Subject:Date:From;
	b=mY86qNwLX6I8JsCEklNFAVUsALMNhrv3Un7nVJZOgfLG8Vjap7lU4Dh33SKVCpxtT
	 /s/YxErxfMieOAAzAKULW93ulhJ7UhvK08BaLkSUQ9kW4mWPPLX7a+1rpaUcFKZw5H
	 SXUbrHbaVghMnhV0JWmCLG2mUckX++JyqQyBL1QkY+rzjR9HGFr7IknJak+oQtfkIf
	 mfmlSEp3a/AR1em62nYh4xOQrR/CKWt4nCXzh23R8mNmGDt+YPzeJfnc4uSyBiSyDH
	 Jz+xzEkKXFvccncEX6UV1j4DVRSc/OPiZgC2EX42LbSMsqk0JTKrwS0+vtrG24Gy6h
	 TMhT68ouW3ueQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: soc: fsl,ls1028a-reset: Drop extra "/" in $id
Date: Sat,  7 Jun 2025 16:28:13 -0500
Message-ID: <20250607212813.747203-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The $id value has a double "//". Drop it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
index 234089b5954d..b43df10c5ef4 100644
--- a/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,ls1028a-reset.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas//soc/fsl/fsl,ls1028a-reset.yaml#
+$id: http://devicetree.org/schemas/soc/fsl/fsl,ls1028a-reset.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Freescale Layerscape Reset Registers Module
-- 
2.47.2

