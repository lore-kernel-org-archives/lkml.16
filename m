Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612F529D19;
	Tue, 10 Jun 2025 19:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749583170; cv=none; b=dmypxZg9atX/SRhQY+0LhnLeGaEkadsSouBRTSriB+Vs6uXuxzzCN8WAJ4IeAQE7dYdlYwwgqah2ppEani+UASpwTKaubk5qZU7GQMjuqOIuEz6pvZ5IvYCkrO06Xo5pAqX29GVzLtEDXvxngMWa+V1wtEgQz2TNGt7l1A/ZFQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749583170; c=relaxed/simple;
	bh=I7LIFG9CUURK/xCFq/gHrynuB0+CqswX9qvQ7HEglvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CK5GWIyhOzW0ao+TJRnLNwigTOWZbll9BIyEgMOCyIuYWRLYvUx+GUqeR6ji5Sjaq7679iqHz3meLIsbLjnm0p6J7/Jwxp/l+F4FoN/pbxWB6nWQUUGctIsjV0Vrx5ZZsUlNQMXJlTy/HsMC70WPPyoOWOvbFeVdpPk5rM8QD08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XJrNhMZq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XJrNhMZq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D914CC4CEED;
	Tue, 10 Jun 2025 19:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749583169;
	bh=I7LIFG9CUURK/xCFq/gHrynuB0+CqswX9qvQ7HEglvA=;
	h=From:Date:Subject:To:Cc:From;
	b=XJrNhMZqdrAhrqVbb9fCWpGKj8dYMEO2pZFyFCmSLKnaC9XCVpKkbkg0Ae9FQ/BUk
	 MHSxaDFIDnr/d2Zw3qrAl72UadRR7RzA1Be9CMfDltvmv/moUw8r+XtH/KCihwB8Xz
	 WKOHPFf1TyqgrgechlZ5RtaloETFEoLJlqJ/IsEjOY8RcYgRgTAXvfEVzZumsjmUG/
	 MllxaIN/50zCxkrSl9ZdIJ7WPRxHCCK0y5JcX34ZuWQh9rMvzHrtLOchy2AFTGQFeV
	 W6TgnF7HNIgQ3aQPHv2yYOq6H9criwB1LugLWIsbMqSNghHIRAJtcQiEG/Sa9T0VwK
	 erG6UK/e9H4hQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33A8C677C4;
	Tue, 10 Jun 2025 19:19:29 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Tue, 10 Jun 2025 19:19:24 +0000
Subject: [PATCH] arm64: dts: apple: Drop {address,size}-cells from SPI NOR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-apple-dts-warnings-v1-1-70b53e8108a0@kernel.org>
X-B4-Tracking: v=1; b=H4sIADuFSGgC/x3MQQ5AMBBA0avIrE1SqoiriEXLYBKppiNIxN01l
 m/x/wNCkUmgyx6IdLLw7hOKPINxtX4h5CkZSlUaZbRCG8JGOB2Cl42e/SLYOqcbrevGmQpSGCL
 NfP/TfnjfD0gomXdkAAAA
X-Change-ID: 20250530-apple-dts-warnings-8bb373367b54
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1243; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=I7LIFG9CUURK/xCFq/gHrynuB0+CqswX9qvQ7HEglvA=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4ZHq73vyvzpddl7Td89/J323EP/7satR+MffagOLGIOf
 jJHK21xRykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiWVGMDGe4rxsafox+V3e5
 TNBZWf31hBIWH7fSc+c/vTaed+N7yW6GX0znghs1Xjwy+cx0J03vVqF8p0DsrLf1FQnLPJ3fXuC
 fwAEA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Fix the following warning by dropping #{address,size}-cells from the SPI
NOR node which only has a single child node without reg property:

spi1-nvram.dtsi:19.10-38.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

Fixes: 3febe9de5ca5 ("arm64: dts: apple: Add SPI NOR nvram partition to all devices")
Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/spi1-nvram.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/spi1-nvram.dtsi b/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
index 3df2fd3993b52884d7c00b65099c88d830a7a4c3..9740fbf200f0bcd0e7d1b81885fe9d9ff8f04fdc 100644
--- a/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
+++ b/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
@@ -20,8 +20,6 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0x0>;
 		spi-max-frequency = <25000000>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 
 		partitions {
 			compatible = "fixed-partitions";

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250530-apple-dts-warnings-8bb373367b54

Best regards,
-- 
Sven Peter <sven@kernel.org>


