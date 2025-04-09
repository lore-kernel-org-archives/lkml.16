Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462341DE884;
	Wed,  9 Apr 2025 21:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744232585; cv=none; b=DAG04sP/XyFXEegKDAukG61EYCauVFgLYHAvji6PaZyXqY2VvHNl80U/oD42PVifca7yIWQcXqxlnAOnPrQVwtH81HMDXU9TG78bVffIriUegNJ1xX/42z0uNf1cDlc0wPi+EreCjTcpeDyTaSoK+DT2AuL6aSAX8KLzEsp64fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744232585; c=relaxed/simple;
	bh=GNu9pN8MhnbhJEhK3+EqUFdenT1ITVQAVXD2zBG/u2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pa8BqQ97VlVMDcxp2Ce10a+5G2E8ddFwd7+SKxXnL7SSmNtmBC0FPpEFW0o9Nw6NjKNbVHW3foIJNLm0DB4cEsJOffBJFHlDPO0DHU4JfV4k+5KYodsYJkwrJZ3HTrrB0eMnLSRlQoLBdGc7XmuneFk6SiW1Mw7HKGZj7a2ZGR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eAIJgM3l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eAIJgM3l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F92C4CEE8;
	Wed,  9 Apr 2025 21:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744232584;
	bh=GNu9pN8MhnbhJEhK3+EqUFdenT1ITVQAVXD2zBG/u2M=;
	h=From:To:Cc:Subject:Date:From;
	b=eAIJgM3llVkrBg2XJetnIXjBEJ5PHPjd9/hRTZCUjALRAmeHqssEJ0l9GOGzLbzZF
	 7izQXKEH9nOlBN9eAkaVRat8fYDFJO3pxymnku1NOVsbnaVNoIiHPT5sCy0gO5wfU8
	 q2ofvlxiTgfnogcRPFy5YZo60W886Nh6kGT5JGiBL0TYd0BadPwwlzZgmspF13/upj
	 Ihi/GLl74UBsGqJEN3fqC6g/xcDosymFkd0axdXRyusvH727mWnYW+Vz5TBDulbwrO
	 FYmPXLC8x07vn9aHhTc8jPted9k2KI/b9NADC11qBi+KSUw/0pFb8w9Eboaq467sMT
	 UHGmmqi7rD9sw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Antoine Tenart <atenart@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: amazon: Fix simple-bus node name schema warnings
Date: Wed,  9 Apr 2025 16:02:54 -0500
Message-ID: <20250409210255.1541298-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a couple of node name warnings from the schema checks:

arch/arm64/boot/dts/amazon/alpine-v2-evp.dt.yaml: io-fabric: $nodename:0: 'io-fabric' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
arch/arm64/boot/dts/amazon/alpine-v3-evp.dt.yaml: io-fabric: $nodename:0: 'io-fabric' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Arnd, please apply directly unless you expect the Amazon maintainers
will pick this up.
---
 arch/arm64/boot/dts/amazon/alpine-v2.dtsi | 2 +-
 arch/arm64/boot/dts/amazon/alpine-v3.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amazon/alpine-v2.dtsi b/arch/arm64/boot/dts/amazon/alpine-v2.dtsi
index da9de4986660..5a72f0b64247 100644
--- a/arch/arm64/boot/dts/amazon/alpine-v2.dtsi
+++ b/arch/arm64/boot/dts/amazon/alpine-v2.dtsi
@@ -151,7 +151,7 @@ msix: msix@fbe00000 {
 			al,msi-num-spis = <160>;
 		};
 
-		io-fabric@fc000000 {
+		io-bus@fc000000 {
 			compatible = "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/amazon/alpine-v3.dtsi b/arch/arm64/boot/dts/amazon/alpine-v3.dtsi
index 8b6156b5af65..dea60d136c2e 100644
--- a/arch/arm64/boot/dts/amazon/alpine-v3.dtsi
+++ b/arch/arm64/boot/dts/amazon/alpine-v3.dtsi
@@ -361,7 +361,7 @@ msix: msix@fbe00000 {
 			interrupt-parent = <&gic>;
 		};
 
-		io-fabric@fc000000 {
+		io-bus@fc000000 {
 			compatible = "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.47.2

