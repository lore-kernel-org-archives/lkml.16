Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790D61E8356;
	Fri, 11 Apr 2025 11:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370873; cv=none; b=mYFdOl2yJNUXWUW5hhTineNW5FuC4nCbTwFXNEyB5SXwx2bQH5LLwQYWntQXXrOI/63WIh7YPpq/wz2M6tZXYDscMYW9nFl6mtMb/mEBdjKrDdISqpBc2+D9fbqIG9jOuWwRzuPtTLb3OjkAYnjWaxxjZ+UPQUJqmNCDwOyiwRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370873; c=relaxed/simple;
	bh=/hQwt0vJTBvVhJE+lXTePELN6y6nrRJohz6/U3u5fL4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wv0UKT1LeVzDBT/YUZwLtB8K7tcbQx4rjOkiwZYhTs9FoZJJIAdh0cdsxKRKIzEdc729QJ39R2DD63ZRR81gwZi9Q7XGt07QI7wIpast+GJfyyJqCsLcSZNZW98A5pB0cTn9NkC/rV1lYfXXyBze3Jk/uIGwdy4NnbhZPuitIiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNr6ltNw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNr6ltNw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E23D1C4CEE2;
	Fri, 11 Apr 2025 11:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744370873;
	bh=/hQwt0vJTBvVhJE+lXTePELN6y6nrRJohz6/U3u5fL4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=WNr6ltNw2BY0sHq1MEXbDfpkcJB3ZsZwpNZqpAXkzQ1hMqvtakeRDWArF8GGunoxy
	 MKwuWNl02Zas86K7WMmLU6Y6bQFjqGX+Yd3/Ks6WR2v89drDiUkdG8jHG7LxJTPkSr
	 LECl4UU1yJwMPlGIxpQZSjY/DT52AWZpyWhjAGZxmfXM/1cAZOA9kj/QWWecUVlxOD
	 tHH5hskMv4wP6mCuXA37HEZi+rN5GgYc4VayZKtckPqfiWbpz+JDuBZ+1lQKkDESTA
	 GC5lYXkxI7Zik202kACGBz9FfJF01PX64b0KZvBMIWAjD055sV1kLfAOlbABkKe3N1
	 FHFMwqGvSDNBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FDFC36010;
	Fri, 11 Apr 2025 11:27:52 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Subject: [PATCH v5 0/3] Add support for Amlogic A4/A5 Reset
Date: Fri, 11 Apr 2025 19:27:49 +0800
Message-Id: <20250411-a4-a5-reset-v5-0-24812538dce6@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALX8+GcC/23OQQqDMBCF4atI1h1JNImxq96juEjjRANqJBFpK
 969Ueii0M3Av5iPt5GIwWEk12wjAVcXnZ9SiEtGTK+nDsG1qUlBC0FLVoLmoAUEjLiAlLVE8WA
 KGSXpYw5o3fPU7k1qG/wISx9Qfw1Oa6ZoxQvGckVlBQzeOPipy9t0bnocfOdMbvx4eL2Liw+vc
 9zKD/X/jpUDhcRKKxVvpbE/ULPv+wcXqykJ6AAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744370870; l=1852;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=/hQwt0vJTBvVhJE+lXTePELN6y6nrRJohz6/U3u5fL4=;
 b=UvsI2+X25bb9TkdbcgOwYDAT2PxYzxtjSaJ6ceqVvvAPGEV/A456/DtsUkl6/nhN7WZkykTRj
 rw5v0oVybmkDGGb3vxSf+ayfi8FBK3c45YiqTr7ouM+jZG5HCf/gata
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


