Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6DF2676D6;
	Wed,  9 Apr 2025 18:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223862; cv=none; b=St/dbMdGByMKm2rKXYIuRdDg0aQfYMJW9JbRL1BCOPTcwZRjOwShDKpXdW/p4jwWePk4BIwDNrnE9z2Gk2UTOGF3lPi0qHV+jU0A+vorUdAVSPAJbUTx++fY/bSdz0hPn2QH52EpbvDieE4nyVkR9sOrFJibG//Y/FhJyqnAiWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223862; c=relaxed/simple;
	bh=8yrY4MaFR4oh28wr05+q7Ybl4U3s4TACe8cOffU+x9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u6b7FT92FqXRxNHWIeIYOaXZJJCtNVTeOmFPAgZwYtb2aYDoYwTxDQJWxvIecw759wSdWu96NRXwwnLxAgxfXnvyxb2D0pUlfDiU/jhnczcSnemZiNMMZpMyyfIxTAiEZ50PxO5B1DmBkFnXlj3KgfmAT8wqPP/yuWT5tZ3q1a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZF2fSxKz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZF2fSxKz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744223858;
	bh=8yrY4MaFR4oh28wr05+q7Ybl4U3s4TACe8cOffU+x9c=;
	h=From:To:Cc:Subject:Date:From;
	b=ZF2fSxKziDhc/qnaf0mc8HTIO1Fk5oHHXzG+NR5OE2BumZXB27gg05yGnXhveXe8m
	 mM0wyBSLP0l7zWnZlCzgHr2xCQAuF85gIDHmMq28IndYnMOznic7mdVJ/MLlUUaLZE
	 hc83t3qlaZHu5BUcOzwcaZ9pNtpbEciVd+APmpxEo79wlhn3ZMlQ+S2fioNpQ727Om
	 s2xs7rdahcGEp0otzOOIRGqsxyHfXDHcoGhHqrk9SVZVbu+4y7Dcrc/X5fXOfy1/FC
	 j9SJxq4gBEsr9KmjO3AqIfBvxQjieMVpHXnZM8Sq4EwoMqfWFMX/cmH2VcVuMCT9Pt
	 wslRx0YxUS0Zg==
Received: from pan.localdomain (unknown [IPv6:2a00:23c6:c338:be00:61ad:9488:9583:2010])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: martyn)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 78AB517E03C8;
	Wed,  9 Apr 2025 20:37:38 +0200 (CEST)
From: Martyn Welch <martyn.welch@collabora.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Cc: kernel@collabora.com,
	Martyn Welch <martyn.welch@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: Add Boundary Device Nitrogen8M Plus ENC Carrier Board
Date: Wed,  9 Apr 2025 19:37:26 +0100
Message-ID: <20250409183730.1972967-1-martyn.welch@collabora.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for the Nitrogen8M Plus System on Module and the Nitrogen8M
Plus ENC Carrier Board.

Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
---

Changes in v3:
  - New patch

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6e0dcf4307f1..680dd84d50be 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1113,6 +1113,12 @@ properties:
           - const: avnet,sm2s-imx8mp              # SM2S-IMX8PLUS SoM
           - const: fsl,imx8mp
 
+      - description: Boundary Devices Nitrogen8M Plus ENC Carrier Board
+        items:
+          - const: boundary,imx8mp-nitrogen-enc-carrier-board
+          - const: boundary,imx8mp-nitrogen-som
+          - const: fsl,imx8mp
+
       - description: Boundary Device Nitrogen8MP Universal SMARC Carrier Board
         items:
           - const: boundary,imx8mp-nitrogen-smarc-universal-board
-- 
2.47.2

