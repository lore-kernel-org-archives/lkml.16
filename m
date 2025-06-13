Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B352E1487F6;
	Fri, 13 Jun 2025 13:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749821957; cv=none; b=D/rVNmoQ4yyeA7vCspEH5UG49JXEz3LFxZHmDQFcAeIExj93B0QYEM25AFr33uTyT5bYvNun7GKsnXj5Sf8XRPSXPWS19fyGBLqhBCB0VRxrbE+V2U50IsbfKHAYILY8vaYaDZdhUJvz3Fvy86QrIOEBV+JIqGGZpZkCGW0QDbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749821957; c=relaxed/simple;
	bh=d4zt0JOBC2hdaumNtVVwuXPV9bmTleS7AL76KtydixI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=apz75ZD7q7H9lSRIAjxxtb95avzBQi2vKGcoiGRtNZb9mOvg8u58USy/AZRMjlmvtICg24BwCi3CC6N/NMlszk/OcYqU//jSN4b0L6NbzxZd9LNtv6uJBLhyARTbbjGbUCCxtSMpsbYmcF5kNKIDfNGckIVTohPRHoeGOkZ5bzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=orDS8zZi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="orDS8zZi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82919C4CEF0;
	Fri, 13 Jun 2025 13:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749821957;
	bh=d4zt0JOBC2hdaumNtVVwuXPV9bmTleS7AL76KtydixI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=orDS8zZiDiEvC5a+Xj68U/brImg3QVNBSWNpgk6qGEmLsw/AI1tiuhPfPDAZjpmiW
	 BYA+lqYM31aNms+BlF8Zbpmj9FeoBX4Yb6QpMtIB/+wU+9AdFogYYVGhBLz5yD3fL5
	 nV0YshzW/JvB+p/57A8rn5ixtyHetU5qmr2QHKPYVlIZASM96n+RO0PjiDnSGx7AGK
	 /4tAFOPTgBXW+mPDpfWtgo/iXa7x/eNgrnwM7O4czC3ZDjJcnQ0zTCmayIIkttqYlx
	 J+lIIUtEADx/EA/PUSrk0o+irqkaAJh4yXHpw48pPbD40fbWN5msgTrCb/poyI6xbD
	 R7p7bTacb8jpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 735CEC71136;
	Fri, 13 Jun 2025 13:39:17 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 13 Jun 2025 15:39:13 +0200
Subject: [PATCH v3 1/2] dt-bindings: arm: amlogic: Add Ugoos AM3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250613-ugoos-am3-v3-1-f8a43e6bbfdb@posteo.net>
References: <20250613-ugoos-am3-v3-0-f8a43e6bbfdb@posteo.net>
In-Reply-To: <20250613-ugoos-am3-v3-0-f8a43e6bbfdb@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749821956; l=1125;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=kZwR93fnBy9N7Bg/HslF5gmhIegfe1/51WU15kA7fXw=;
 b=dd33tXb2gztAfCgLiRlEw/IQQQHH7LtYQY6rjV/dGwaie7Sf3Bs/24sa4q3zEyvnbtipEILxQ
 +B+Tk3SGZRBDguFUxz4AzBcLk1SvJ10VqAaApauwVEK22UxHof8QINI
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

The Ugoos AM3 is a small set-top box based on the Amlogic S912 SoC.

  https://ugoos.com/ugoos-am3-16g

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

V3:
- add Martin's R-b tag

V2:
- fix vendor name in patch subject
- add Krzysztof's ACK
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 05edf22e6c30368bfee7be61bbb4b682bfbc1d5e..2a096e060ed3d30f243d39b47817d2a5a36361b3 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -135,6 +135,7 @@ properties:
               - minix,neo-u9h
               - nexbox,a1
               - tronsmart,vega-s96
+              - ugoos,am3
               - videostrong,gxm-kiii-pro
               - wetek,core2
           - const: amlogic,s912

-- 
2.48.0.rc1.219.gb6b6757d772


