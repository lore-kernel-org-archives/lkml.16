Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531CF25F79B;
	Mon, 28 Apr 2025 10:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745837071; cv=none; b=XM6FGaIhMW9EyOBNSsb5bExwCjNYvU0c8eQjMStKopoFeSyw8MZKydGwPWHZFwaVG9mF2xXdaoy9fHoMd59rHoiiQ7p+6hawq5a7KACe/7lZBIYnN+1yZEOziRgGDj2CWpiu2iHxXFlTYo6LCrCMergCInvhAKbqm2E7hJ/O5bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745837071; c=relaxed/simple;
	bh=zoNoOQu9Fld7LEIioJ+wlApw7JJtAWg9ZZxxQWQdkQ0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hKocOWnCmDGR/FRAh4tGm+INaaQX0So4GkKZPHItT+rp4NwGVL0BdjzB/G+JJXwQ3KWeVFYylRNAMQM3tVg/9GE8QqhC8Wh1FLEmUk7jKuOFFXgZU09dqLIzQFNnfDn0pJlW+yW9AmYSWPr1UFVsjghjFsSXJOH+YRr4E1fZ9vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=heTRi+Kn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="heTRi+Kn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA6E7C4CEE4;
	Mon, 28 Apr 2025 10:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745837070;
	bh=zoNoOQu9Fld7LEIioJ+wlApw7JJtAWg9ZZxxQWQdkQ0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=heTRi+KnPNW2vy0rLctBRjFgRRBAennRpA8uIGdIiQhBNfvdzvqU6DnSTx1Zp4aFv
	 TbYJag4bmzfvMg7TCShf9Wda8Mqd1/ZKQOFIVyCS5F0GsnBNvBI9goB7dYul1tltN/
	 61rvK4ioEBvMCl7VN3aGW9PAojxwK0QT7YJfzWiPdFIfxNlTPhK9z6TlfKkZYDU+7T
	 5Jg+d2eKCk7EJ+jE5dmO3E2LGhNGSZd5AJpnHmgk9d8ltqXuaAjkBP2P06cCgaPm6/
	 JElbMQvL7w9txpTdN/eRb/CzMV6mKDCZLPsHaG6kccIIY8BGk5ejXsderrw7gHU8/9
	 wkQhQsNZoVspw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F57C369D3;
	Mon, 28 Apr 2025 10:44:30 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH v2 0/4] Board support for Fernsehfee 3.0
Date: Mon, 28 Apr 2025 12:44:27 +0200
Message-Id: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAtcD2gC/03MTQ7CIBiE4as031oMP2KjK+9husB2EDbQACGah
 ruLjQuX7yTzbJSRPDJdh40Sqs8+hh7yMNDsTHiC+aU3SS41V0IzixQynAXYQxvYi+KzGUH9sCZ
 Y/9qx+9Tb+Vxieu92Fd/1x0j1z1TBOJNnKdRJzIsazW2NuSAeAwpNrbUPE2O1saUAAAA=
X-Change-ID: 20250315-fernsehfee-b5aef930ca7e
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745837069; l=1421;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=zoNoOQu9Fld7LEIioJ+wlApw7JJtAWg9ZZxxQWQdkQ0=;
 b=sloiws7PjerztavFOh+WRSwUGtcJ8z57ukYOGobwKBpWoMWMkPQdnhNLJFGvr24RatYRu5di8
 GLTh5fOlEknAphpjgeeMJ/wjmSSrkPR/7ufDGiz/ou72uuoN0GwH3MD
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

Fernsehfee[1] ("TV fairy") is a family of set-top boxes marketed as
ad-blocking appliances. This patchset adds board support in the form of
a device tree for the third generation, Fernsehfee 3.0.

[1]: https://fernsehfee.de/ (German), https://www.telefairy.com/ (English)

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
Changes in v2:
- Apply ACKs from Krzysztof Kozlowski and R-b from Neil Armstrong and Martin Blumenstingl
- New patch 4/4 to describe PMIC regulators, after discussion with Martin Blumenstingl
- Link to v1: https://lore.kernel.org/r/20250323-fernsehfee-v1-0-2621341cd37a@posteo.net

---
J. Neuschäfer (4):
      dt-bindings: vendor-prefixes: Add TC Unterhaltungselektronik AG
      dt-bindings: arm: amlogic: Add TCU Fernsehfee 3.0 board
      ARM: dts: amlogic: Add TCU Fernsehfee 3.0
      ARM: dts: amlogic: meson8-fernsehfee3: Describe regulators

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/amlogic/Makefile                 |   1 +
 arch/arm/boot/dts/amlogic/meson8-fernsehfee3.dts   | 306 +++++++++++++++++++++
 arch/arm/boot/dts/amlogic/meson8.dtsi              |  18 ++
 5 files changed, 328 insertions(+)
---
base-commit: 9c8bd75378d70cd6087d503eb8317d1eea67164a
change-id: 20250315-fernsehfee-b5aef930ca7e

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>


