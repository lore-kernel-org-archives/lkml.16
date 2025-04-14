Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BBF266586;
	Mon, 14 Apr 2025 10:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625576; cv=none; b=mfUiC5yJg/KPbsjSSewpEFx8e/DnxJtym1sm/mfI1owytHxfKdPRFdx+JEaQ5S9VoJ/33c03UwXwSm18gKVJzrvnmzgPcyIz/YU54/cGxUOFXge37dNvdUASNMRf5S7ADC0daCbPa96othWkcXTTfS84gU+ybkxdl2G3+XoMdGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625576; c=relaxed/simple;
	bh=8/5+Mwb/Pk1qbvhX1PLg4XvpKaWqdiHo6PVGtnDXOBg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fZRy5xkmrUFEruEWFsG5m0Ke1vrcRiEIKUWwT3/B6uT83il7V8cp3lYGTI2IxTh2YyBJSJUN2bACnN+frbAX5nmBsRoJUS+nTyWcPytYoPEOTszFAAPMNueYz3JoBVHcOWrpmsaSp59UFJ1DIrgAktq7mvMkgK6A7Ofv/Ah16Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7z+9n9c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N7z+9n9c"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C372C4CEE2;
	Mon, 14 Apr 2025 10:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744625575;
	bh=8/5+Mwb/Pk1qbvhX1PLg4XvpKaWqdiHo6PVGtnDXOBg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=N7z+9n9csvtmDw/fgYSTpxhxWxm35QRaPKu/HS+l72nzsdaB8BwzzAf3I8JZ8BmBg
	 h8/E7hOJUHgZFcD8Pj1MCo6z1NYD7MBsKRJJ8dpltXD/eiaD7ZoaOV30yPk5IpNjJB
	 pgqMT5HiGwzXMIGnx4dJXwjSMZcCXv2PjFDZKMYZ9aMGDKv+ioCe4P8UMHHJlN+d4f
	 Ahyf5JnOBZ7IwmnbyKAwVOjRRhKWJE7LYb5ovK6ikxxLe01rrlHrGcOaVSu5vf5NCq
	 PqqeyuhU/3n46CUvMopoVn4qFwzI/R7iiayP8XG2zHD67yx1JH/4zFA5f+rsm7ql16
	 w9s/Pxn9bj9Cw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB4EC369B2;
	Mon, 14 Apr 2025 10:12:55 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH v2 0/7] soc: amlogic: clk-measure: Add clk-measure support
 for C3 and S4
Date: Mon, 14 Apr 2025 18:12:27 +0800
Message-Id: <20250414-clk-measure-v2-0-65077690053a@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIvf/GcC/23MQQ7CIBCF4as0sxYDtEXblfcwXVAY24mlGFCia
 bi72LXL/yXv2yBiIIzQVxsETBTJryXkoQIz63VCRrY0SC5b3gjBzHJnDnV8BWS2rk2rRyWV6qA
 8HgFv9N6161B6pvj04bPjSfzW/04SjDMzNkqfzpaLTl+0W/xE5mi8gyHn/AVxRZfkqAAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744625573; l=1253;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=8/5+Mwb/Pk1qbvhX1PLg4XvpKaWqdiHo6PVGtnDXOBg=;
 b=ZH0NEy35W5gs/Tu2051Lyxrw35300elFLKMkQjYgn1ytG5I5ExkRe0Ac/OHwoZohJ3lnXRu65
 XNKR6HG9AfuASs6Z2IWOLeUazeEMbq6wNKIRYHw59Rdgr+/tk2OucSD
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

Add clk-measure support for C3/S4 SoCs.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
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
 drivers/soc/amlogic/meson-clk-measure.c            | 374 ++++++++++++++++++++-
 4 files changed, 371 insertions(+), 15 deletions(-)
---
base-commit: 37021be47d02d2913d6767795a6f4c72b4e63a4f
change-id: 20250411-clk-measure-d33c5ab62669

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>


