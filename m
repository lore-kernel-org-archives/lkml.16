Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5323425F7BC;
	Mon, 28 Apr 2025 10:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745837071; cv=none; b=fdsv+O9EXmtsgOlHwMK4wQMJ0882nFevzNcuvXs0SwU9I/QW8nVvWPTjMymMsA9cBRiosw4gOI5jPVe3z5PbkAzpl2gqjSfPzrqXOAFhmNkmXUN0Xh87M0WQQhSbZEL+wxgWfJBVu4snRxjcmtKq+0CdJegfIUAKbw+yzc8Oxyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745837071; c=relaxed/simple;
	bh=Xlkrt6G0FEKg1HboAv2n4Daxz723vqa07I6qDNDIf/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mQ8x+hg5Ow1O1s3zsj/y5uch9+Df1g8phdIlA9ex2JdJmQqeiIZYUDkP4Fgc4WWT8v8Y9eKS4S4r0cAX61W11kc3e1q5K6yh6/u0TGkt75zAHdTbZX9dP474vQtDn99kGBPo7oCFf8sN27J55GBwiB47GvSpljfuuG/q9NDyxl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cv78DjI2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cv78DjI2"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7B5AC4CEEE;
	Mon, 28 Apr 2025 10:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745837071;
	bh=Xlkrt6G0FEKg1HboAv2n4Daxz723vqa07I6qDNDIf/k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cv78DjI2Q1y/ahBCts7re/2kae0KY1063OgbwMx6h8YMI9gPwa9KlTKUjgY4Stj59
	 QQCKNDbJeiOVkgXwKLNjyo+kNBEHFsmKYvh/iS5e/57BOl6YIlktymdrbfc3bRarqw
	 1EWvOH52QKJ9PDdmYWylVxMxCx2EKBVZlhj0ACu5/dJTxwsazA9W4fb72spllqUcGz
	 LKpxbAqlVg65mntpYRUSHIck762IN6rs/GleTxnRsBAT/z/Wl68XRFrXNt2OU/c7q6
	 hiE4XDTLDlndi0GXlSVmeocmanah0F9sYMYmI251C1gDbituIWjt1UX+pzM4aW2M18
	 pEgk2VUi5gL6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8375C3ABA1;
	Mon, 28 Apr 2025 10:44:30 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Mon, 28 Apr 2025 12:44:29 +0200
Subject: [PATCH v2 2/4] dt-bindings: arm: amlogic: Add TCU Fernsehfee 3.0
 board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250428-fernsehfee-v2-2-293b98a43a91@posteo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745837069; l=1095;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=MIe7PtmNs9I3jGf86k4FxS5W7n++ITrjeAkSDcGo2i4=;
 b=JQIGJmDcQaIKoCGqKGZeFqJOtEbcqdf1GapeFkjcfu3MQktin5wLvLjwWR6M3BJUvWsxUfYrp
 COTqXuWSsBPC51m1X21MQ2ud+DY74IGJKMBCehtdkHP3H9myv+fAtNY
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

Fernsehfee ("TV fairy") 3.0 is a set-top box with HDMI input and output
ports. It originally ran Android 4.4 and a Linux 3.10 kernel.

  https://fernsehfee.de/  (German)
  https://telefairy.com/  (English)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 0647851ae1f55a27bfb148252532bcf15ca905bf..f6f045528da32cf4625b30da59262ca21da860e6 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -27,6 +27,7 @@ properties:
         items:
           - enum:
               - minix,neo-x8
+              - tcu,fernsehfee3
           - const: amlogic,meson8
 
       - description: Boards with the Amlogic Meson8m2 SoC

-- 
2.48.0.rc1.219.gb6b6757d772


