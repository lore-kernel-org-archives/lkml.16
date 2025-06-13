Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B7E2853E0;
	Fri, 13 Jun 2025 21:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749849433; cv=none; b=TmoKz5embopPfXPKlKpHimsM3DIoW5ygrhuHPtA97IMRf3k8QjzIfGJJZ+yBYb464IVZiCromZ2nAQchJ3hVMTCde3WyfnPXr9e7r4gQkZSlU/VnnvtB0NH/ZXeRFaMXCJoUTuBA3gJO/ba9rd5UYUvsK7qYSqTb/LieAxlNwXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749849433; c=relaxed/simple;
	bh=NJadowudszLSgzKfdukMH5RpQ02v2soiEg2ACYH3B8o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=amYzXcAbZfUoXTPBv/L3+yb2SC1UjN17Cg8ifK4i7174zRXccF3IQqIJKJsNEeoqCH6H1nf8b/o8ilALyzZ3VoRYYHKsQoqVhT7VsRXiHITbZl6VPuC4DAqlFpotrEvV42KGNuHjM/uWXZ9b906dKxsO01w3r5/kFpiUIi+tqMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u7ehtF6U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u7ehtF6U"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1A36C4CEE3;
	Fri, 13 Jun 2025 21:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749849432;
	bh=NJadowudszLSgzKfdukMH5RpQ02v2soiEg2ACYH3B8o=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=u7ehtF6UflhpbqPHmPNwFeoIx0Sy8IkEerJmt9xeYP+1KlCvYnS1gieekTG6CZ0ow
	 FLkK2N+KXosNJfuNbH8kRKWNBRxzwoEHDPixBIrGGsimftUTbKSOAOEF4bQZHAECUM
	 k8RaXcpkVugHXC/POHmcCl3nn2R/frNoqU+dSgq54+XeYu/KizakCx6IPFf8M1ulxo
	 AjgZljaKZ2CfRPcUL0pOdAEQgeSaCT1qndGYMSQ790IP405ADEcl6/n1s7frZtjCwF
	 Yx59s3J35jlnD9F/u3Mepg5uPL+CBh3e/sCVzNf4jwoeo5zn3A2GoKDMALaa/rmwr9
	 SpEYC4F3FLHPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C5B6C71135;
	Fri, 13 Jun 2025 21:17:12 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] Bindings and DTS for Apple SoC GPUs
Date: Fri, 13 Jun 2025 23:17:06 +0200
Message-Id: <20250613-sgx-dt-v2-0-fb2b7d1c3ff7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFKVTGgC/z3MQQrDIBCF4auEWdfiaE1DV71HycIYNQNNLBokJ
 Xj32hQKs/mHx7dDspFsgluzQ7SZEoWlhjg1YCa9eMtorA2CC8WVRJb8xsaVXTQO9eQguIM6fkX
 raDugR197orSG+D7cjN/vj2jxT2RknF01opNdp0zL737W9DybMENfSvkANEBUnpwAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749849431; l=1962;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=NJadowudszLSgzKfdukMH5RpQ02v2soiEg2ACYH3B8o=;
 b=BTZDJF7eeNf0BzPM75xJma9mqlxWyaQQsSwlvF5Tt36Spv4LD2sOPeAllFWYZf8xYScndDcBE
 caKq7WcNHF+A9ESpuSB2Y9SlDEKmOUROX+iiiUMs9JXGiKyZjMPQ/Os
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

The kernel and m1n1 (bootloader) that are using those bindings are
available at the following branches:
Kernel: https://github.com/WhatAmISupposedToPutHere/linux/tree/starlight
m1n1: https://github.com/WhatAmISupposedToPutHere/m1n1/tree/bootloader-cal-blobs

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Changes in v2:
- s/firmware-compat/firmware-abi/
- drop the agx-g13x compatible
- rework reserved regions
- Improved memory region and register descriptions
- Link to v1: https://lore.kernel.org/r/20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com

---
Sasha Finkelstein (2):
      dt-bindings: gpu: Add Apple SoC GPU
      arm64: dts: Add Apple SoC GPU

 Documentation/devicetree/bindings/gpu/apple,agx.yaml | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                          |  1 +
 arch/arm64/boot/dts/apple/t6000.dtsi                 |  4 ++++
 arch/arm64/boot/dts/apple/t6001.dtsi                 |  4 ++++
 arch/arm64/boot/dts/apple/t6002.dtsi                 |  4 ++++
 arch/arm64/boot/dts/apple/t600x-common.dtsi          | 34 ++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t600x-die0.dtsi            | 28 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi                 | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi                 | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 293 insertions(+)
---
base-commit: aef17cb3d3c43854002956f24c24ec8e1a0e3546
change-id: 20250531-sgx-dt-4a1ba1b3b20f

Best regards,
-- 
Sasha Finkelstein <fnkl.kernel@gmail.com>


