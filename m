Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E8679EA;
	Tue,  1 Jul 2025 00:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751329448; cv=none; b=CreoeSRtC/DFtjyVu924dlZaXKCADEpqUF33GVdw6FDHuqSIyZBlv5pOCNXEWsop9oy/nuoPtyqPcN36nO8WVK14D+jsxdrksKl7XR4Tyx2ulZrYiendbrTKPPBOL9KXlYSmUNF0Lm8hMg7b2eBjYY+Q0wH2g55XRNSjGN8NdF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751329448; c=relaxed/simple;
	bh=uiBymXwretaOUkf5o53rSII7Fx9D4PtdT/XgeocguoA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YBJ00f6G+00CQhfFCf1GZpy8f15nEaGkSSu98VhF8BGeQn3miskBC1Zp3df+w5XCT1yz2jHkPzBqXDy6punU4f57Wq2zlJ//QFyhWEse12YUMePfSMmHQoEIHq/UwtUgJgovdmB2zw1aDzJgwFlgxD3Q/iOlFpscu7ptUvbjXTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBhTmNCt; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBhTmNCt"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60bf5a08729so5815287a12.0;
        Mon, 30 Jun 2025 17:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751329444; x=1751934244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WjbfLs8DH6SSSqq8mb1Ox4C8jBDdt+sgOqlePr+W3eM=;
        b=WBhTmNCtYh4QA3pJGoYyhvNnxOz8B05ht2adbyfcUapS4YZXLs8e30lW0p7c3Fo8iJ
         4hR3ZryKPibFPa5PLuU7kw643LRXIKRYDp9ifoCcvCAcv9blJkw8bIsU2PQGYaa0IfTe
         Ur7b7BhKPK9kBkEIBzhnr2s7N6vrZLxlNAPhx+mjxxazD1FuLqLnkxHztfGvdT7m9Ph2
         mTH1bOihAIY8xrxiKpHfg2xNcZSSw3wVHflo5hC1y1eJ5mQsO05A8n1pjGw6BNdhM1Eo
         mc8ogknVdmmTqoulCTY6FXX255+mTrU0aBRA6X/UaAs+BIf9XA/MDn4Yte+1BfZfLIUH
         /gxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751329444; x=1751934244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WjbfLs8DH6SSSqq8mb1Ox4C8jBDdt+sgOqlePr+W3eM=;
        b=F2qByT7UhgtHrQ+YnAFHJMyzYtdNzGxSnnasHT8Uu3mHX3cRyogbhLVB3gszoQRaIF
         BXiKbJ2eQWo1Mf/8gelN5XcIlBfU3TAemHdWGMeUJacZhGmH8WURMEaAI8f7kMCtqXUY
         HzGWaNe7Kg+3NgHpXrXScuJ8y9StrR9DXkS1Atqv0N9CB2HmCFVxzHykhyK2xjmYVO0b
         BXzCvBZrMtFDMvYiPfHtonI7gOC8n1sgzcQc1eE0v5HCwjAVmdb4dKrcW4kVxLKfRr9k
         5cz+vAFI/RAEDfaLhn11wTK6tdrLimLO1H2r1+Rnk6dsv0ZPHTtN+3cB5DcUv+dyMNv8
         cRWw==
X-Forwarded-Encrypted: i=1; AJvYcCXFwETZ3qjm1db8imD0kts+wwJlZihZAc0W4bD9fcv46vHeS5uRBt79t4ZAo01adGyYdhENbMsfXLJMguOa@vger.kernel.org, AJvYcCXjxBHli2+3dyffsB/TsV8SBrSzIF+KnMeO2JnekMRKL2LItlPdRfHbREzEuLdo1RY8oN54fFGOdEQG@vger.kernel.org
X-Gm-Message-State: AOJu0YyFxcNpL3W0Dw63gA8Gs4ACkb55iWD0kpNy5RCDRa4BuRgw0Lre
	IuB+ytQCRiZMZYED4q0tLRREfeprYQFcb6G1ISn6FB4zj3pBTe+sopM1
X-Gm-Gg: ASbGncvnv0pby6r/oPNDkYCLRf1wmLMjwpLX9nHR6KDjE2w67sX0fQS1EFv8jrKiQW8
	PsS5681icK+S5a2yO6sDqokITTQVswxgFneUBrYFS5xNeG2eU7XH42vtok7c3LsYpWm2OS1amBu
	v3DfJvvX4NGK04Dk3/zJvDN/cn1OQNhLkVVpbRzr6VC/hb76x0Ts8oZc3QczqnSVM+ddiSYd//N
	j4La0VaFSrpCmBzHPwKUfuIk687bPIvyrmjPr7Yhd9TzoRaH79DIQ9bMkOwLdQA+WurA3fZFlAi
	6kIeLLoLOfVTeDIgx4TNKkbZMpQ4TiWs2BBPtgw96aW1IRaVCAhS9ejejSeLV6b36PUnwfE/wcF
	XExLwSxhQwjwAnm8Yp5xa/B4=
X-Google-Smtp-Source: AGHT+IFFo6r4Ry+EiPmDe/+U6PesB1h9GLgYS0w9pmNsWBBj4w9MeTRZATpmZ5/qgVzTD5pNQ/SjWw==
X-Received: by 2002:a05:6402:510b:b0:608:3f9c:c69d with SMTP id 4fb4d7f45d1cf-60c88e61654mr13152295a12.33.1751329444447;
        Mon, 30 Jun 2025 17:24:04 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60e26b7ac4esm979532a12.7.2025.06.30.17.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 17:24:03 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: dts: support the i.MX8ULP EVK9 board
Date: Mon, 30 Jun 2025 20:22:37 -0400
Message-Id: <20250701002239.972090-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add support for the i.MX8ULP EVK9 board by introducing a new DTS and
a new compatible string.

---
Changes in v3:
* change order of the board DT compatible inside the binding.
"fsl,imx8ulp-9x9-evk" now comes before "fsl,imx8ulp-evk".
* link to v2: https://lore.kernel.org/lkml/20250627142645.134256-1-laurentiumihalcea111@gmail.com/

Changes in v2:
* introduced a new compatible string for the board.
* aligned the pin configurations to the same column.
* link to v1: https://lore.kernel.org/lkml/20250623150146.1398044-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (2):
  dt-bindings: arm: fsl: add i.MX8ULP EVK9 board
  arm64: dts: imx: add dts for the imx8ulp evk9 board

 .../devicetree/bindings/arm/fsl.yaml          |  1 +
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../boot/dts/freescale/imx8ulp-9x9-evk.dts    | 69 +++++++++++++++++++
 3 files changed, 71 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts

-- 
2.34.1

