Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC97C217730;
	Wed, 11 Jun 2025 17:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749663159; cv=none; b=U7jmMeAPWv3arLVKmar5CZBHPpUnznaRQ1iKjQ+DztHl5r8lqBzgf4ivO1p1SxuknMV+gPfhKhzMJje2skfkf4z53JMtyWzsXrHYJBE9bV97M5Q1HN+iCMchRznUJizW0vPIzF+0EkFSf/AioUH2EpsHPDlBV5IrLz6nw+zDO2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749663159; c=relaxed/simple;
	bh=I4HXo0ATSJ/hdYPbDOMk7Ra3is0bb13Y9rAP/aptRgY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YywfPeXyA6DNR0odBmYLy6C2nzk0adUhzaLaqa4uxqDixhFSCks9mHUZbosYkvHAwfqf7uk5TkPMwnpSVsM0S9ve5cBtec+cxstj1fsCrx7Btb0SwDCzQpnzOXFS8kXP/FVb2r18tFZ0GmtIkLZPn5w5ob27/LU42zecxhvSQIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ej0rUAsr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ej0rUAsr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43AFEC4CEE3;
	Wed, 11 Jun 2025 17:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749663159;
	bh=I4HXo0ATSJ/hdYPbDOMk7Ra3is0bb13Y9rAP/aptRgY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ej0rUAsrLsWzPXsxSZgc1vDb6FaLk6B1bklbgjWvOEMJIfNDsxyvimoMhGeQoVpB+
	 e5n62n1TDNhDFDZn4f/zQSb+LPpuppwkGS7EknY23V7B12+Cfad2ef0UQ1do6pjpbn
	 i2F/8Cyay3NRekosMEILXiBftUx4aPwzLRscN+vXFxbhz/RuzvQOKCL8OcYrOiv2S5
	 RvY/l9fyIEL0DCtHkQaOpSMMZ+bfNKmSYicmFZ9sQaKISEKdE6m1PVX07mU4Kv8zse
	 XhXUH1IEI6WyH7CW/HDZBSjgwWUE1cW5MEWH3eLvGErvBRWbyKEwOMenNtR95Fic5R
	 1fBdPFfkgyEag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31558C71141;
	Wed, 11 Jun 2025 17:32:39 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH 0/2] Bindings and DTS for Apple SoC GPUs
Date: Wed, 11 Jun 2025 19:32:15 +0200
Message-Id: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ+9SWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU2ND3eL0Ct2UEl2TRMMkIDJOMjJIUwIqLihKTcusABsUHVtbCwAIRPi
 FWAAAAA==
X-Change-ID: 20250531-sgx-dt-4a1ba1b3b20f
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749663157; l=1440;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=I4HXo0ATSJ/hdYPbDOMk7Ra3is0bb13Y9rAP/aptRgY=;
 b=a/YPKcThE02rkRwTyp+2PWA/Znv8r+ZwFTmoNq9NkcjUgxXGHJoltLqMOGX5qRLEf4jZ6KO9L
 a7wGQotkZnHAE5MWdWThd6RMmfvdh3TUiWPOhTM2vktnPdo+qNV5750
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

Hi.

This patch series adds the DT bindings and tree entries for the GPU
present in Apple M-series SoCs. The driver itself is in Rust and
upstream is currently missing several prerequisite bindings, so will
be sent later.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Sasha Finkelstein (2):
      dt-bindings: Add Apple SoC GPU
      arm64: dts: Add Apple SoC GPU

 Documentation/devicetree/bindings/gpu/apple,agx.yaml | 95 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                          |  1 +
 arch/arm64/boot/dts/apple/t6000.dtsi                 |  4 ++++
 arch/arm64/boot/dts/apple/t6001.dtsi                 |  4 ++++
 arch/arm64/boot/dts/apple/t6002.dtsi                 |  4 ++++
 arch/arm64/boot/dts/apple/t600x-common.dtsi          | 34 ++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t600x-die0.dtsi            | 28 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi                 | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi                 | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 294 insertions(+)
---
base-commit: aef17cb3d3c43854002956f24c24ec8e1a0e3546
change-id: 20250531-sgx-dt-4a1ba1b3b20f

Best regards,
-- 
Sasha Finkelstein <fnkl.kernel@gmail.com>


