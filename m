Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD884C9F;
	Tue, 15 Apr 2025 02:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685158; cv=none; b=dOpdWy2HMR4kvOE+1LcV0GYPylsOUAEjA/StMWt5z6OyUKw8xaoOYGAWjPiufG4K/yLis3mfiiJtd2rwyL8iAwocqzMQCwBdUyqejX41SynsXmr7S+5SGLLbqqzWlY3TVsRmJj1X35GntC0XFbwhAjFON8N8SFqeaaFmKx8OmNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685158; c=relaxed/simple;
	bh=oEyawwJ67t4F2O0m4uUa8lz1QQdbkKkB8kGfM2EgBQw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kRC/EoKuhoARVXmmftJ/E9TZ20ch3NQ6aJbzc/Uk4WHt6HnTNaOOAwr1HCH/Yb+6QjVT+NXPqg+EV8XQy81u90o1gwIvLoz+dWeJQp2NAaZmJFpoXQRphAGtyMJBLq7+Fiox96WX1bBdqQvNQsl/2Jgkr6jlggu/CcYLEfaVmC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JeSYPZSv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JeSYPZSv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5A92C4CEEA;
	Tue, 15 Apr 2025 02:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744685157;
	bh=oEyawwJ67t4F2O0m4uUa8lz1QQdbkKkB8kGfM2EgBQw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=JeSYPZSvuUz2kVFu+Nt8tVZjEwB1lkOlnAyqgDHf7OuEGkrCyJZxXvzl+vg6JFLKn
	 7Btcx0LpplxhYmGyETdt6uYy9wGPP/MVzWOxA2uOSUypgaruNw4JmUHrvFPVNRopMR
	 ZFt6BPOPrhiePHg3QfrOUEx7bz5PaCy2wB1jl0E7tWttAcCSBSnQss0wRpW44xCm1C
	 0bN0UNXX3HxCDrF1nTxigXKgs+NNlw5WKJ6Q3O5185r+HWw5iyQ6Q/jWaLpn2/Tuu1
	 wP2+dcdqg55guaizXek9YGeAjIJi7Orkyk97pgl/HgeOPxN8YM1ltZ63KOfKGAzwuy
	 y5UIvpuKM8WcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F917C369B2;
	Tue, 15 Apr 2025 02:45:57 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH v3 0/7] soc: amlogic: clk-measure: Add clk-measure support
 for C3 and S4
Date: Tue, 15 Apr 2025 10:45:23 +0800
Message-Id: <20250415-clk-measure-v3-0-9b8551dd33b4@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEPI/WcC/23MQQ7CIBCF4as0rMUMUKh15T2MC0rHdqItBpRom
 t5d2pUal+8l3z+xiIEwsn0xsYCJIvkxD7UpmOvt2CGnNm8mQWooheDueuED2vgIyFulnLaNkcb
 ULItbwDM919rxlHdP8e7Da40nsbz/O0lw4K4pja12LYjaHuxw9R25rfMDW0pJfuryW8usjYaqM
 jWAVj96nuc3PBEy3eYAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744685155; l=1405;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=oEyawwJ67t4F2O0m4uUa8lz1QQdbkKkB8kGfM2EgBQw=;
 b=IoVhOIKXt2iTmxOh8pMHEPW25r6XKeC7qPnpkj89JQVoY9Iv7zua6Kz2dvzktcyZba3m4ohNl
 wK1EXJZO4nRAfTbS+nbRG3/xqfa4dLrjR3BB29J2HPj+eDgcliXGYGY
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

Add clk-measure support for C3/S4 SoCs.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Changes in v3:
- Change struct msr_reg_offset to const.
- Link to v2: https://lore.kernel.org/r/20250414-clk-measure-v2-0-65077690053a@amlogic.com

Changes in v2:
- 1 Rename the clk-measure register.
- 2 Remove unused registers.
- 3 Share reg_offset across multiple chips.
- Link to v1: https://lore.kernel.org/r/20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com

---
Chuan Liu (7):
      soc: amlogic: clk-measure: Define MSR_CLK's register offset separately
      dt-bindings: soc: amlogic: C3 supports clk-measure
      dt-bindings: soc: amlogic: S4 supports clk-measure
      soc: amlogic: clk-measure: Add support for C3
      soc: amlogic: clk-measure: Add support for S4
      arm64: dts: amlogic: C3: Add clk-measure controller node
      arm64: dts: amlogic: S4: Add clk-measure controller node

 .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |   2 +
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |   5 +
 drivers/soc/amlogic/meson-clk-measure.c            | 375 ++++++++++++++++++++-
 4 files changed, 372 insertions(+), 15 deletions(-)
---
base-commit: 37021be47d02d2913d6767795a6f4c72b4e63a4f
change-id: 20250411-clk-measure-d33c5ab62669

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>


