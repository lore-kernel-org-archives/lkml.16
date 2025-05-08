Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EB628468D;
	Thu,  8 May 2025 17:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746726557; cv=none; b=GKHARCSNGeMYdukor4WdCvG64J2ydGKvolKNlyjIb6/CJQqXoS077pTZRkJPYMm8m76KmT2cbh7y2gq0MlhZmXUTeSym7Jx4SiEacA4zRxqDFGC15zTyLeye1C3nPZMYwKyQAlUo2OJoGytTYns7sVLHL1tXGm1ndrxKsNcD6OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746726557; c=relaxed/simple;
	bh=NAfI4J5LptvSmMZm3C5+baXygHpHYNG+mAVX5QfCyZg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jFWf4hWwdifM+jqkcz5MwW+/HtGBTzos3cT5WXuSFnpJISvjm2KEz9JBN1TizxjXXnrf1scoHIBjUGVm/lMgAwX4TKqrZ/qy/G79xh3vTz4cUqTXLRL2Htupswa71pERSCrUhN8tYqE0xUKD4zwBtKHu7RH7o+7QjMyvfEu+IMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=g7HvV+0b; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="g7HvV+0b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746726547;
	bh=NAfI4J5LptvSmMZm3C5+baXygHpHYNG+mAVX5QfCyZg=;
	h=From:Subject:Date:To:Cc:From;
	b=g7HvV+0bL/+rYrmQeg8+mr+fYR0QVGhyS3lrX8dgdgV5qke/DE47+z2nASEU26q60
	 wd67GQCLu5zIXsqXZpzQ1B6GwTGtMNcrSRUE/yydkv0nQt5F7FKnNSB0NyULVB7ByT
	 42iM1uLL5lnPRp95IwNQDHWQj2B1qTIPwFiDKszivgJnFJSP7uefYVdT3VJwPS+ITp
	 UNePn9/Mwe5irQA/rObiOcM2/uRCXuN/obQ2AVWX8jHfa0/6yyuNVAoVCUc9zsg6LI
	 dw50P3qTuAe6sqGpwcu67e11Zgf3TJlorc+ot7FEyils7AcaQAhJgfQBA7rKlpqfXh
	 V0gLTK+7fHuOw==
Received: from jupiter.universe (dyndsl-091-248-213-080.ewe-ip-backbone.de [91.248.213.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C03DF17E0630;
	Thu,  8 May 2025 19:49:07 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6ED26480038; Thu, 08 May 2025 19:49:07 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v2 0/5] arm64: dts: rockchip: add ROCK 5B+ support
Date: Thu, 08 May 2025 19:48:49 +0200
Message-Id: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIHuHGgC/4WNQQ6CMBBFr0Jm7Zi2WBVW3sOwoHQKDUrJFImG9
 O5WLuDyveS/v0Ek9hShLjZgWn30YcqgDgV0Qzv1hN5mBiWUFqU6IYdu1GZGFxhfc1yY2ic6e9V
 GCKOr0kCezkzOv/fsvck8+LgE/uwvq/zZP8FVosCzkheyTmojq9tIPNHjGLiHJqX0BQTCuTi5A
 AAA
X-Change-ID: 20250324-rock5bp-for-upstream-fd85b00b593b
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 FUKAUMI Naoki <naoki@radxa.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1633; i=sre@kernel.org;
 h=from:subject:message-id; bh=NAfI4J5LptvSmMZm3C5+baXygHpHYNG+mAVX5QfCyZg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGgc7pNYkSuDchJEatNd0kHih4w1E1FNCi8z8
 J+oZc53rkitRYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJoHO6TAAoJENju1/PI
 O/qaTG4P/AlMrxTqbu1Tjv6uZNdRO9KwvrMXSdO7m4r8hbdXMAkFgzBGfF3hH3S7ByBrmpRyKCC
 028JlVG31cMO6LXLn7GASt1VX6kJbg/G0e/DA0FzaIiRiZrs3AgDm9buHNetyFDOdnDnn2Skry2
 2vCY/YORkR+mqQMJk995wVKYhNcP4sPTTK8QhjpawOTcVaNkQwuSZJSW5YfY2/xyniF1Z10W/Ah
 R1DRLsIBVY67mZfUJkVB32tR/vgbTtYPk0RbA+H4liHCM34pDhdB0Ktwj7zY2s4Cg+d/MFZWyrZ
 FGOshr312YAJZO8wUGVvWpIChXX04BPhH4P7fHi8on29YXFiHwwtac7mqxNEauCkUOa8Fru3kHx
 bfD+B3YTYgqP4FqIQwdPkL6KTS0PC5oDjAJRRScvZHZpDCgPU1DLu4bo+Yk+iAzluXvQiIC8r9i
 CUu5KJjc88RLWOpme7eBtJTWOApr5L++MGFYh/w7kI1XXLO9TqTaifj4a+OYa7NRcmW9Gov+lXa
 l1duk50ZautlA3Ht+dFgkrDaYHW2admPvp93mzadJbTnDSg+04OxBIiv//YtZECzr53CdbvJrx8
 UEvjECeUNP4OoTNpeMdCveSprCqLthW4cln9XlXF9iVKGQv8ADzVi558mZjZD7S53MOUy6LVY64
 B3GZgKXHEj8LBw6wmh1Irbw==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

This series adds support for the ROCK 5B+, which (as the name suggests)
is an improved version of the ROCK 5B. It also adds initial USB-C
support for both the ROCK 5B and the 5B+.

Changes in PATCHv2:
 - Link to v1: https://lore.kernel.org/r/20250324-rock5bp-for-upstream-v1-0-6217edf15b19@kernel.org
 - Replaced DT binding patch with the version from NAOKI
 - Dropped unused pinctrl for vcc5v0_host_en from the shared DT
 - Moved USB-C SBU DC pins to board specific files, since they differ
   between Rock 5B and Rock 5B+
 - Added pinmux for SBU DC pins
 - Rebased to latest version of Heiko's for-next branch
 - Disable USB-C on Rock 5B for now

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
FUKAUMI Naoki (1):
      dt-bindings: arm: rockchip: Add Radxa ROCK 5B+

Sebastian Reichel (4):
      arm64: dts: rockchip: move rock 5b to include file
      arm64: dts: rockchip: move rock 5b to include file
      arm64: dts: rockchip: add Rock 5B+
      arm64: dts: rockchip: add USB-C support for ROCK 5B+

 .../devicetree/bindings/arm/rockchip.yaml          |    5 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 .../boot/dts/rockchip/rk3588-rock-5b-plus.dts      |  129 +++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |  970 +-----------------
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi   | 1082 ++++++++++++++++++++
 5 files changed, 1247 insertions(+), 940 deletions(-)
---
base-commit: b7caeb9545db25649eda36ce593b70cc2aa804ab
change-id: 20250324-rock5bp-for-upstream-fd85b00b593b

Best regards,
-- 
Sebastian Reichel <sre@kernel.org>

