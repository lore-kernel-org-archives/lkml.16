Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CCA257AF5;
	Tue, 15 Apr 2025 21:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744753964; cv=none; b=kwyfoRohFxj0nE1Xk7GoHc5fxBVdc8CyYw+wlWgB8TsyrMFqUSMMzNTq9OYgKxp7HkD+QPZqLZ033rvckvEn5YmcwHlVt33zr/y8viX1yuKQh5NX+tQWcmCiU6pZlR+zVL2vDF32mHiJIyEKSm1oftsV3FwfT7lVMyqq4pN2d94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744753964; c=relaxed/simple;
	bh=jBNCv2rda4YJZMZlnqUFKXhD2YixBW/bajeGa6Tnahg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=M9O0oHMFl6EQTBpfMpel9HETD4+VZJB2kgWGJgAMu9OUvUYtpp1nQBwUA5vEJqd8gS5buxztphoGWEor02HIEBA3eSNF1zyiHD71sHINqW8dKQ75nNKgdl3Cwz8jDxRJk+WAiukw2htURX4ebzdzdv+ddCdajCFcfomb3qoklZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTC875YD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTC875YD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73842C4CEE7;
	Tue, 15 Apr 2025 21:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744753963;
	bh=jBNCv2rda4YJZMZlnqUFKXhD2YixBW/bajeGa6Tnahg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ZTC875YDSXTbhMKwBPJqLXIDR4ehZNUQyv27RtLDUGt2lWnURr5FL53iytvdRoQ0k
	 DNtByinSi0TTzxSAb5GBdpuiqqHHxoaz4R7fpmjDEhpcTkzkWoVCIJHvo5JaKQhTbw
	 NOFEFM+SI/PWr07PCTXx8P/czUGezvVP/Aog3+LMoNIaaZeXNM47H5yElOxkn/sxfx
	 TNR5DnBs+x2+5GT0lMSwIg5cie3u6EVVL4lF4fpEODX9PP/wmzKe8VV/0XPGLpHKr9
	 a4Bdt4QYs/RDPhH7QL/IQvaAbYExNREcpFsRCaO2C8AYB8EqZhX58md6uRu651L1kd
	 EWbLYuOxG0dFA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6138DC369BD;
	Tue, 15 Apr 2025 21:52:43 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH 0/3] Generic SPMI NVMEM cell driver
Date: Tue, 15 Apr 2025 23:52:33 +0200
Message-Id: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACLV/mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0NT3eKC3EzdvLLc1FzdVAMLM2NTY0MzQ3NTJaCGgqLUtMwKsGHRsbW
 1ABuu0b9cAAAA
X-Change-ID: 20250415-spmi-nvmem-e08635316175
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744753962; l=1432;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=jBNCv2rda4YJZMZlnqUFKXhD2YixBW/bajeGa6Tnahg=;
 b=z/bozObO8yi+GVG8sufEa3NcrtwV6CqAU6PzOgE14u6VKIBZuU8qylsUv97vpKOw9XrAYnnts
 RA/RVyk+lJwCJ3/TPasI9fumkGl32BPZfim4W4o7J+IHeyGvfsrR/2T
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

Hi.

This patch series adds a driver for exposing a set of SPMI registers
as NVMEM cells. This is used on Apple ARM platforms to store the RTC
offset and to communicate platform power state between the OS and
boot firmware.

The NVMEM cell consumer drivers will be sent in a further series.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Hector Martin (2):
      nvmem: Add spmi-nvmem driver
      arm64: dts: apple: Add PMU NVMEM

Sasha Finkelstein (1):
      dt-bindings: spmi: Add generic SPMI NVMEM

 .../devicetree/bindings/nvmem/spmi-nvmem.yaml      | 44 +++++++++++++++
 MAINTAINERS                                        |  2 +
 arch/arm64/boot/dts/apple/t6001.dtsi               |  1 +
 arch/arm64/boot/dts/apple/t6002.dtsi               |  1 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi          | 50 +++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi               | 50 +++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi               | 50 +++++++++++++++++
 drivers/nvmem/Kconfig                              | 14 +++++
 drivers/nvmem/Makefile                             |  2 +
 drivers/nvmem/spmi-nvmem.c                         | 62 ++++++++++++++++++++++
 10 files changed, 276 insertions(+)
---
base-commit: 2e0e70c95077172b29a5b13716c4b159d578e82c
change-id: 20250415-spmi-nvmem-e08635316175

Best regards,
-- 
Sasha Finkelstein <fnkl.kernel@gmail.com>


