Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0C8187554;
	Fri, 13 Jun 2025 13:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749821958; cv=none; b=a6smJASIsp5qHBs6Kmyjs2ZGX9RIb0lQcH/zIfS/cjfjhjZQq6aVeh2qNMtK7YcBwLhqcKS6UKiRLMXh13hOI7rQAQUzuq+FrpmiM2y0eac/ZcKp7BfL2wLAZ0oxp44EEf7odRPyhka5wz1lY4F8qHXLBj5+ianyGkTPpDVpDtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749821958; c=relaxed/simple;
	bh=1u10lZ+utTwxzfHAXk4guA8HgqMHAOiC6CKTXRm79YQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sxDP3/oVGHMYaAKoF4Ug8XGNLoqJhcDwWUyhLXAoaVPKvICyD3fI6BA5dZjjIJw93ZuslzZiToyrLzdH0hUipZFjdr+q+PUd65uFDsl2qQhtnasEfsyaogNajhuddlgUfR6lSypQ6JLVhK+Lbmq9WcGiah5HAuUaBmjUCzuqTc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUGVwajn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUGVwajn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75DD5C4CEE3;
	Fri, 13 Jun 2025 13:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749821957;
	bh=1u10lZ+utTwxzfHAXk4guA8HgqMHAOiC6CKTXRm79YQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=TUGVwajnOOjiDLmdqEmnaNAwAvTZ9sFNr4jWG+i+AQV12yr9SCPBDFOze2o9jJAVT
	 X9gCO/KvfcAuslpctCMpcVp7W+/5PUxGEB8/VlvLLmNMOCbZBNyRaJcQOPjzqm7F99
	 1cPee0ziLQzPgTImlv94CGzf2EPtEMNWMAnsIHrSA9hzDDUiLb+xresJmPdVLaM8gM
	 KAzJc6sxKDJ+vP1pBS0kLaTyiCI6a6U5vtkI5YV9vUuPx0c6QNcB7gAVbVGOkau+o4
	 UfZi3f6k0+9FMNUSgEQxV0UW2NYU7TsYiXpvzd1NISx9Wzb0mMqfViQHJTmFMOjeYj
	 rkX2MZ2wFwAFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634D2C71148;
	Fri, 13 Jun 2025 13:39:17 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH v3 0/2] arm64: Device Tree for Ugoos AM3 board
Date: Fri, 13 Jun 2025 15:39:12 +0200
Message-Id: <20250613-ugoos-am3-v3-0-f8a43e6bbfdb@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAqTGgC/1WMwQ6CMBAFf4X0bM122wJy8j+Mh1IX6EFKWmw0h
 H+34AWP8/JmFhYpOIqsKRYWKLno/JhBngpmBzP2xN0jM0NADYjIX733kZun5F1ZKSHrEpRULP+
 nQJ17763bPfPg4uzDZ08nsa2/ioTLoZIEBy5ra1ptVIW6vU4+zuTPI81syyQ8qEIdVcyqQhSgW
 rBk9Z+6rusXqA2RL94AAAA=
X-Change-ID: 20250222-ugoos-am3-f67413860434
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749821956; l=1175;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=1u10lZ+utTwxzfHAXk4guA8HgqMHAOiC6CKTXRm79YQ=;
 b=SxYO8wSB80jUzrAAMi6t4PKUg8Vs2RmSY7vfkjEHbcD44oPU0WnDbBoKTy9Nia6EIglQApBsU
 RAzhx+UYwTsD9W7Tugw9rDB9KnqbqJ+S/TrTRIK6dUcsT0TB8qIFm9B
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

This patchset adds a device tree for Ugoos AM3, an Android TV box from
2018. Most hardware functionality has been tested, as noted in patch 2/2.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
Changes in v3:
- Rebase on v6.16-rc1
- Add a few Reviewed-by tags
- Link to v2: https://lore.kernel.org/r/20250314-ugoos-am3-v2-0-422104b0cec5@posteo.net

Changes in v2:
- fix vendor name in patch subjects
- fix mistake that made wifi not work
- apply Krzysztof's ACK to patch 1/2
- Link to v1: https://lore.kernel.org/r/20250309-ugoos-am3-v1-0-38cab5a4725b@posteo.net

---
J. Neuschäfer (2):
      dt-bindings: arm: amlogic: Add Ugoos AM3
      arm64: dts: amlogic: Add Ugoos AM3

 Documentation/devicetree/bindings/arm/amlogic.yaml |  1 +
 arch/arm64/boot/dts/amlogic/Makefile               |  1 +
 .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |  2 +-
 .../arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dts | 91 ++++++++++++++++++++++
 4 files changed, 94 insertions(+), 1 deletion(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250222-ugoos-am3-f67413860434

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>


