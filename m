Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACA0278E60;
	Fri, 11 Apr 2025 11:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744371500; cv=none; b=RcD6odD6IQBAsNhZqszPuXbKv9YlNqhNfTH0r+WOYaFmhSeXJKMK2SA2GelsEbr5qjpdDAWebYQU4zPux0234fpaToy1hfR7pUnxambARziZyTlN90OA+wtB/8nMDSSuT7A8LpZOVjIrIo6EC/kcgOPPnNZ+S8oa0xOlh1cTk4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744371500; c=relaxed/simple;
	bh=/hQwt0vJTBvVhJE+lXTePELN6y6nrRJohz6/U3u5fL4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LH+VhUHzwzqp/PBHIMSYXgRIgHtqgtWM++Efh/gAGJFdGUFjcea2JyaqrScI+ncEkQBvV0P5YYskK19GXzhZNbz75BYgxgLNDWErHmD9uQAVBaj5z08+fA9Wh0P0TRimIGk30DwUm4ovGCW41a1c7qhuNjdbuCBJAYgvoxNTL3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P6CMxnS8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P6CMxnS8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F5F2C4CEE2;
	Fri, 11 Apr 2025 11:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744371500;
	bh=/hQwt0vJTBvVhJE+lXTePELN6y6nrRJohz6/U3u5fL4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=P6CMxnS8BDuRFaYErU8Qa+JN/4kOhPtCI1flRn/uOT1MMdQ/9atG8JeXgIQVOC/5q
	 WV0H7IbLa/8qpQKX/Ivm3YpPsCqw8BVtokUAAon5N/cUIntM3n9RPYwgfBmyLhjaQ0
	 np5JIpLxATph7ivI5ifC5eRztqGrFs9fI9RnLHSEMK/byGfi1ZJcr3Nt4WrcZ9kg94
	 RhqJ7EHtKIvmFMrrkTjYA4N13R1QXp/RqC6IgzXi8Bf91xkJexFC5A44aVlwLl3c9c
	 Py4WJMUNdO6JYEFcuURU0f1Rm5w2JV6ctzcZu/3hnllm7/9vAqUXqO1zKbNpjD1g7T
	 C2Wnw0W9rnQOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 096BFC36010;
	Fri, 11 Apr 2025 11:38:20 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Subject: [PATCH v6 0/3] Add support for Amlogic A4/A5 Reset
Date: Fri, 11 Apr 2025 19:38:14 +0800
Message-Id: <20250411-a4-a5-reset-v6-0-89963278c686@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACb/+GcC/23OQQqDMBCF4atI1h1JNI5pV71HcZHGiQbUlESkr
 Xj3RqGLQjcD/2I+3soiBUeRXbKVBVpcdH5KgaeMmV5PHYFrU7OCFxUvRQlagq4gUKQZEM9I1V0
 oEpylj0cg656HdmtS2+BHmPtA+mtIfhaK17IQIlccaxDwpsFPXd6mc9Xj4DtncuPH3etdnH14H
 eMWuav/dywSOCQWLSrZorE/ULNt2wfGzFWx6AAAAA==
X-Change-ID: 20250313-a4-a5-reset-6696e5b18e10
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zelong Dong <zelong.dong@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744371498; l=1852;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=/hQwt0vJTBvVhJE+lXTePELN6y6nrRJohz6/U3u5fL4=;
 b=PALP2scUtWnW+Qtp1sVaMJtTsv5qeOy3hkGeox/qrj4xg4vrZcvPaP3qvh042yeZALpns1XvE
 2F219edsTEPBnEK4V2DrF9EU7uu/SLOP/T9PwIdGDJQV0Ck0lMRL9jv
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
Reply-To: kelvin.zhang@amlogic.com

Add dt-binding compatibles and device nodes for Amlogic A4/A5 reset.

Imported from f20240918074211.8067-1-zelong.dong@amlogic.com

Changes in v6:
- Rebased onto the latest v6.16/arm64-dt.
- Link to v5: https://lore.kernel.org/r/20250320-a4-a5-reset-v5-0-296f83bf733d@amlogic.com

Changes in v5:
- Rebasing on top of the latest upstream changes.
- Link to v4: https://lore.kernel.org/r/20250313-a4-a5-reset-v4-0-8076f684d6cf@amlogic.com

Changes in v4:
- Remove the superfluous 'items' in the dt-binding.
- Rebasing due to recent upstream changes.
- Link to v3: https://lore.kernel.org/all/20240918074211.8067-1-zelong.dong@amlogic.com/

Changes in v3:
- rebase on 'amlogic,t7-reset' patchset
- Link to v2: https://lore.kernel.org/all/20240715051217.5286-1-zelong.dong@amlogic.com/

Changes in v2:
- remove 'amlogic,t7-reset'
- move 'amlogic,c3-reset' to the other enum list
- move reset node from amlogic-a4-common.dtsi to
  amlogic-a4.dtsi/amlogic-a5.dtsi
- Link to v1: https://lore.kernel.org/all/20240703061610.37217-1-zelong.dong@amlogic.com/

---
Zelong Dong (3):
      dt-bindings: reset: Add compatible for Amlogic A4/A5 Reset Controller
      arm64: dts: amlogic: Add A4 Reset Controller
      arm64: dts: amlogic: Add A5 Reset Controller

 .../bindings/reset/amlogic,meson-reset.yaml        | 22 +++--
 arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h     | 93 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |  8 ++
 arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h     | 95 ++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |  8 ++
 5 files changed, 218 insertions(+), 8 deletions(-)
---
base-commit: 4bc28af2da876531e5183d25ae807e608c816d18
change-id: 20250313-a4-a5-reset-6696e5b18e10

Best regards,
-- 
Kelvin Zhang <kelvin.zhang@amlogic.com>


