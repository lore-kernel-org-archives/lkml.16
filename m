Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5331925F96D;
	Mon, 28 Apr 2025 10:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745837071; cv=none; b=fiDIGvof3OFubVQKRXTJBGyhiR/RkGoDAcHkAsgnEBtxlLxV2+tYpQkdKegE+k+GR2xhf1z39LyY5h7g4m0Mtq9z2JiW95IJsfOojrHSH+Zj2EP9Q68OYjmb86vZuEPf2SPLie22zzPox+flrKS+fbiJaVBIrBvTwogoh5Urp+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745837071; c=relaxed/simple;
	bh=bM/5EDf32Br2Fmtz15dIAtUhg9VujV8OEWyNE+VJDtY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kSbRyRQ6b3yral+DBqazaQF6qrMpWr4AzhO9jy7hiLO2t/ZE/w7nk9b3tePc/qcziHWX3XD+ZQx8NyHsL+SxAVrsk0uZveeiCF0tNVWVr9QiLAE02fXVoW2zonzD+j4mkaewo0SuezL7fBhNQK2u7GKameFuDCn+kuirYlJerO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMHAfWte; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMHAfWte"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB81FC4CEE9;
	Mon, 28 Apr 2025 10:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745837070;
	bh=bM/5EDf32Br2Fmtz15dIAtUhg9VujV8OEWyNE+VJDtY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GMHAfWteEmXZRUOmsspfjqj3XLZPvza+ufNt58PrhZG56F9WIpcG8JjBqa/bYRwdo
	 WdrnK0hZmbqeYBxPtKm5VFG9V57yYGMLahOv93JpF+53uhRQnZ9Ux4HmihVC9uPBpW
	 tlsXQHDuVEGOcUeVRP6Mt+iPeiQumHKumnkr28T3n0BeEoeSXCDipy9fbvC/d/SQoU
	 MpgcYw0wRCMwUNIC+aioO8rY6hwkPeP5fJsz3f+uRvJTAJNBQSB7/odhapSDyWfQEY
	 ZP+gZui6oBAoqBw2+X/exFRmHpY0jIC4yzDMFf2l/6jFTxzU3JWFFAoQSJA/ivZL4I
	 qs04lblftIqaw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA738C369D9;
	Mon, 28 Apr 2025 10:44:30 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Mon, 28 Apr 2025 12:44:28 +0200
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add TC
 Unterhaltungselektronik AG
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250428-fernsehfee-v2-1-293b98a43a91@posteo.net>
References: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net>
In-Reply-To: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745837069; l=1023;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=lhW1S1FqMGlohP33kbMw1Pv6brNFdpf4vK4RYn9L2Ow=;
 b=FTY9CmJ9n2ohyDbO/qJZqosFFn7U14VWhCnco0IzGh6Gm4JAfeBCIiuq5vK/IPab3X0l9f6Sa
 Ihm0gJtX4+jAcTLq+jgTYmqgc0uFaRXuQcRIgnZuzJPM326GFPDN3k9
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

TC Unterhaltungselektronik is the company behind Fernsehfee branded
set-top boxes.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae217643bf7a63a471f74819d18238..c61c5e11ff5472acb8a6ebdd6d1a66cfa07ae7af 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1494,6 +1494,8 @@ patternProperties:
     description: Toby Churchill Ltd.
   "^tcs,.*":
     description: Shenzhen City Tang Cheng Technology Co., Ltd.
+  "^tcu,.*":
+    description: TC Unterhaltungselektronik AG
   "^tdo,.*":
     description: Shangai Top Display Optoelectronics Co., Ltd
   "^team-source-display,.*":

-- 
2.48.0.rc1.219.gb6b6757d772


