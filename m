Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF9C17D2;
	Sat,  3 May 2025 11:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746273161; cv=none; b=Pctzi3uh2LoKJGz6Eqnj6l3A3pWrZno8K9vPMOr5Xp1XEpV37Rv0HhvQq8CsZxXzz5fXQw2Gelc0IwNbY9ETxHTrLAz3QVW4QH2EwWu3C4iUCBwl10KPnpmb4XaaIPmeMX7VZHnhV0cXKajGZ8qxfcx+GGfjBejUQUXvNvf05xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746273161; c=relaxed/simple;
	bh=9N1YOzjWc2JYx9i3bv5RKM9YYgAkxPqGjPDJBcM4dMo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BBjc6ThICEPuXz+Ir1eZX4nk3VKHV863oZwrJbUefWNecX4UhVwuJQwwq/bZdDfPSDxFGAQmGSx383/DQ4TeZH9hFb4H2q8odPkxCbTilhJ5/BsCZsr1EXgU2Td4FWHIhv1oEeLxDWj1owyYLukWx5Tu5oMuTeQMfXtN0lVt3pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hET7r9eQ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hET7r9eQ"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so3863427a91.3;
        Sat, 03 May 2025 04:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746273159; x=1746877959; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EhZYQmX+r04EQqv1jdCLyWcxCvy5C9t7SJ8u+oq+lhE=;
        b=hET7r9eQS37aAhEbtEOC1ZAcg9LgzglfvISdS3hVmx3ju4zchppuGedGhMHlkFjf8m
         k/X0uJ0ZFfw9xrhBF6nq5O6Unhde4ibblD7yE0D+s8ST99X1j33JtSr2124VGUeqsmDo
         9S7Zgu32rq0aS4KsC0jafD7axQE7BcZk3kiRBDdjCPRyKtGKxXimk3QV8OKkDlRKPAor
         C5RtiSdsKr2VQ0XHajTIGmokIk9ZDZKTBrb6ryvgGKpNxAe4gxENjrG8FeOI+Wu+K8cr
         PJ72sRx6DscDJ5fcjAcL1Uk2XEKIYc6PG3ybtRLRHQXc6Wj+GYDKJwdSuoUiGKVhzD8V
         5nGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746273159; x=1746877959;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EhZYQmX+r04EQqv1jdCLyWcxCvy5C9t7SJ8u+oq+lhE=;
        b=r0sVkausVxrPFxH7AGGoBoThkjXAjlbHB3g+EPgDukq5+P+zhG4vZLiA1rEb14aOSp
         SKgKtNOENYtd7R9paS1JfR/OZnMRr7rFbVqtCBS5qHPOEdI+5EtP0UbU5SBIDSruJgE+
         g25meryfE5RHWdmLJPLpM3ylo9mIitIVHcEnS1ePcY9mVDr7UAW6mw7g/UWjOKHt+z56
         F2O8lAY1YRtWO/fgk1HHSYQJqvgDGksst3MZDkIujmomc6kIGF6OA1Mb57sfIPqufWBY
         SS+Ru8S3q1YwTp/0epeJOKDjJzxvmYG1ZhdP0I6qp6/pd6z+3/fe5S0w+oKpoHtTqjbp
         j+nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSprGN0krPoXpL5hhWEl6MKHvvaJtfh4gEAedC97PAcf4MTnaNbPM3cGGXsFE/hBiRqmrzl3agiyLeDi8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWT0UczJVC1wQuLolee8MdkbYZeDL+JbCuWUfLsXfyaEtY6jlt
	a/hGo19W1Y/aAxzSH8jAsssl/DiXGQRyugRwofU8zSqaDtGvrTTrBNwf7BS598k=
X-Gm-Gg: ASbGncvB1/Sqms6C2L7BcSjqQyTfhQCsnP0YKNJFivmLKYA37fVrS0OBr89QK8AIqer
	2hzyEyTJ5XU6uTj/DUcZuhgBoRGRHphx5wENYQLkP2tQbv8z0pSNPNm86Fp7PbbpUbsJN8Z5OlM
	VMKqDMYY+EhMjYsH/xDf4eYgBmPDHKRkEHNElr+qXhtWjxWq/G12JQihPmVXsJXgSnICqnsZBy/
	BmPw8PRsW+ydmOcRA7I9d+4bf8gV9oGmHgdFR9/vbDS99iKKtNjZkMTN99v+KozxluEeAQhZPfe
	mjMpHajZ796ofs07H7I9RyODTmUgyE5Zw+fNYo7cCF4dSS6NOSZyTl5Oamz+E88=
X-Google-Smtp-Source: AGHT+IHFHk8s6a5Cg3iIWh+D6msUX9GSdN/ACGW3B3fZ40cQA50LpyO0Tx+KlvYC3RLD5dJjv/eqrQ==
X-Received: by 2002:a17:90b:2e10:b0:306:b65e:13a8 with SMTP id 98e67ed59e1d1-30a5ae10bd9mr3677751a91.8.1746273159442;
        Sat, 03 May 2025 04:52:39 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4745f9a0sm4879878a91.5.2025.05.03.04.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 04:52:39 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v3 0/3] ARM: vt8500: Add runtime SoC version identification
Date: Sat, 03 May 2025 15:52:30 +0400
Message-Id: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH4DFmgC/3XMQQ6CMBCF4auQrq0pQ6HElfcwLqAzwCRCTUuqh
 nB3CxtNjMv3ku9fRCDPFMQpW4SnyIHdlEZxyIQdmqknyZi2AAWl0lDIxzjL4KxEz5G8RIIKK9O
 ipk4kdPfU8XMPXq5pDxxm5197P+bb+zcVc6lki3XbFVBCbuHcjw3fjtaNYktF+PBS/XJIvLbG6
 AZrjdp883Vd31vJNk/rAAAA
X-Change-ID: 20250423-wmt-soc-driver-de26d67bd4ef
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746273161; l=2463;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=9N1YOzjWc2JYx9i3bv5RKM9YYgAkxPqGjPDJBcM4dMo=;
 b=YJ365m45ZFzk/XRDnRbc5C3qDvVokAY0rKHB03vmDIFVdd/eLQDsuKvu+pnUAkYV2NFE1L4ZY
 z9zwrqhp+bdA8wpGdeGSUnz0EcS1b4ESjVq8KEe31cOdybT9Shuq6+I
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

VIA/WonderMedia SoCs have a chip ID register, which is helpful for
selecting support for correct sets of hardware quirks at runtime, add
code for it.

This will enable the use of SOC bus match tables in individual drivers,
allowing for finer grained feature selection where device trees might
not provide full information about what the hardware expects (such as
with non-user-visible SoC revisions having different behavior within
the same user-visible SoC version).

This series intentionally omits the updates to MAINTAINERS, as there
are multiple VT8500 related submissions this cycle which may go via
different trees (and cause pain in sequencing the merges). It will be
updated separately in a single pass to cover everything VT8500 related.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v3:
- Now moved the binding under hwinfo for real. Sorry for the noise
- Link to v2: https://lore.kernel.org/r/20250503-wmt-soc-driver-v2-0-8c774ad84d47@gmail.com

Changes in v2:
- Moved the DT binding under hwinfo directory
- Changed the compatible string to be based on SoC version
- Reworked the driver into a platform one, and switched to devm_ functions
  (all of the above - thanks Krzysztof)
- Link to v1: https://lore.kernel.org/r/20250423-wmt-soc-driver-v1-0-bd8bf32521c2@gmail.com

---
Alexey Charkov (3):
      dt-bindings: hwinfo: Add VIA/WonderMedia SoC identification
      soc: Add VIA/WonderMedia SoC identification driver
      ARM: dts: vt8500: add DT nodes for the system config ID register

 .../bindings/hwinfo/via,vt8500-scc-id.yaml         |  37 ++++++
 arch/arm/boot/dts/vt8500/vt8500.dtsi               |   5 +
 arch/arm/boot/dts/vt8500/wm8505.dtsi               |   5 +
 arch/arm/boot/dts/vt8500/wm8650.dtsi               |   5 +
 arch/arm/boot/dts/vt8500/wm8750.dtsi               |   5 +
 arch/arm/boot/dts/vt8500/wm8850.dtsi               |   5 +
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/vt8500/Kconfig                         |  20 ++++
 drivers/soc/vt8500/Makefile                        |   2 +
 drivers/soc/vt8500/wmt-socinfo.c                   | 125 +++++++++++++++++++++
 11 files changed, 211 insertions(+)
---
base-commit: 37ff6e9a2ce321b7932d3987701757fb4d87b0e6
change-id: 20250423-wmt-soc-driver-de26d67bd4ef

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>

