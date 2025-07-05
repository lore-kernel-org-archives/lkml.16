Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90808256C9F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 13:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751720527; cv=none; b=F1uiqXQUXR3mlDUQ45NAPnoGP6xIP3yMFzuXtss+BzHJHStFu1jW5IP8uCXXQ/fl1kYP32CM7KzeKSAmvRMhzW4ZHcGTyH4+wooY5rTPEWObZG02Hq+BmAv+lxnr4J4QcaB+3VxU262cfg20PbP6vXS+I2tGuTwHWKXCltOUnsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751720527; c=relaxed/simple;
	bh=SqXf6aPuODlu+xrSd3tAhGLkvfo/IFawoGpR3ecYlfo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZvB20URMQo1gksu16wprOzNOJ8udgAeM7dJmHUHW+wD/n8JLpRQbagysl9lspptjG/ZrjBHjoeC2AsmAJXRe+dmCcFziD+8o0cSHDkkYRTQPphOmIdW2El8pUyyiQyYmJK6eHQoNf9mR88+0Z49Hq9OIKclHwkd4/9Q8VaRnFMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=L7Rntyr7; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="L7Rntyr7"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751720512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ArYwZ5zOI/ep0laxBTgV4QIgn2lW60AWJ8gSjeJEzuA=;
	b=L7Rntyr7+7XkBJYk80ZxGw/el13hwuQhm7+4mYXy5OI+I/fsKQD53KiqVJDj05I1mxZg45
	s/r+n3q1JEjoi4dV6SGJZwUg3gWt7momo3k+LMaN0LcDMAo6TJE5FZqcJ6+bjw62Z1+zfk
	wVWAHtIYZNWJyIUU2FWfXtb4dU7u3g0=
From: Ze Huang <huang.ze@linux.dev>
Subject: [PATCH v5 0/2] Add SpacemiT K1 USB3.0 host controller support
Date: Sat, 05 Jul 2025 21:01:24 +0800
Message-Id: <20250705-dwc3_generic-v5-0-9dbc53ea53d2@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACQiaWgC/yWMQQ6CMBAAv9Ls2TVlSQH5iiEGtyvugSItognh7
 zZynElmNkgSVRK0ZoMoqyadQgZ3MsDPPgyC6jMDWXK2tg79h8vbICFnjI231LhLTcQl5OQV5aH
 f/+7aHRxlfufrcki490mQp3HUpTVrdS4qjFxAt+8/5dkFEosAAAA=
X-Change-ID: 20250705-dwc3_generic-8d02859722c3
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huang.ze@linux.dev>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751720506; l=3183;
 i=huang.ze@linux.dev; s=20250705; h=from:subject:message-id;
 bh=SqXf6aPuODlu+xrSd3tAhGLkvfo/IFawoGpR3ecYlfo=;
 b=ov1Mzqe2SD2LFE8mEmXjqL8WIVgz5jScaTpi63H6bGdM8uqaI7LYA3CZSN+/JUOeOCZSS263I
 q4iYuHZ9WjQAya6TOcGraiGPUN9t+iuftSW+kAXgZNOR8SQzCcDMvcO
X-Developer-Key: i=huang.ze@linux.dev; a=ed25519;
 pk=Kzc4PMu5PTo8eZZQ5xmTNL9jeXcQ9Wml0cs+vlQpBkg=
X-Migadu-Flow: FLOW_OUT

The USB 3.0 controller found in the SpacemiT K1 SoC[1] supports both USB3.0
Host and USB2.0 Dual-Role Device (DRD). 

This controller is compatible with DesignWare Core USB 3 (DWC3) driver.
However, constraints in the `snps,dwc3` bindings limit the ability to describe
hardware-specific features in a clean and maintainable way. While
`dwc3-of-simple` still serves as a glue layer for many platforms, it requires a
split device tree node structure, which is less desirable in newer platforms.

To promote a transition toward a flattened `dwc` node structure, this series
introduces `dwc3-generic-plat`, building upon prior efforts that exposed the
DWC3 core driver [2].

The device tree support for SpacemiT K1 will be submitted separately when the
associated PHY driver is ready.

This series is based on 6.16-rc1 and has been tested on BananaPi development
boards.

Link: https://developer.spacemit.com/documentation?token=AjHDwrW78igAAEkiHracBI9HnTb [1]
Link: https://lore.kernel.org/all/20250414-dwc3-refactor-v7-3-f015b358722d@oss.qualcomm.com [2]

Signed-off-by: Ze Huang <huang.ze@linux.dev>
---
Changes in v5:
- drop DTS patch (will submit when PHY driver is ready)
- drop interconnects and update resets property in dt-bindings
- remove unnecessary __maybe_unused attribute and PM guards
- switch to devres APIs for reset and clock management
- Link to v4: https://lore.kernel.org/all/20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn/

Changes in v4:
- dt-bindings spacemit,k1-dwc:
  - reorder properties
  - add properties of phys & phy-names
  - add usb hub nodes in example dt
- add support for spacemit,k1-mbus
- dwc3 generic plat driver:
  - rename dwc3-common.c to dwc3-generic-plat.c
  - use SYSTEM_SLEEP_PM_OPS macros and drop PM guards
- dts:
  - reorder dts properties of usb dwc3 node
  - move "dr_mode" of dwc3 from dtsi to dts
- Link to v3: https://lore.kernel.org/r/20250518-b4-k1-dwc3-v3-v3-0-7609c8baa2a6@whut.edu.cn

Changes in v3:
- introduce dwc3-common for generic dwc3 hardware
- fix warnings in usb host dt-bindings
- fix errors in dts
- Link to v2: https://lore.kernel.org/r/20250428-b4-k1-dwc3-v2-v1-0-7cb061abd619@whut.edu.cn

Changes in v2:
- dt-bindings:
  - add missing 'maxItems'
  - remove 'status' property in exmaple
  - fold dwc3 node into parent
- drop dwc3 glue driver and use snps,dwc3 driver directly
- rename dts nodes and reorder properties to fit coding style
- Link to v1: https://lore.kernel.org/all/20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn

---
Ze Huang (2):
      dt-bindings: usb: dwc3: add support for SpacemiT K1
      usb: dwc3: add generic driver to support flattened

 .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 107 ++++++++++++
 drivers/usb/dwc3/Kconfig                           |  11 ++
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/dwc3-generic-plat.c               | 182 +++++++++++++++++++++
 4 files changed, 301 insertions(+)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250705-dwc3_generic-8d02859722c3

Best regards,
-- 
Ze Huang <huang.ze@linux.dev>

