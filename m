Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3C029CB2B;
	Mon, 23 Jun 2025 17:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750701422; cv=none; b=sP+68PTi+x6rsxMeLhBQ7xSpvkNRK9/Dt0NUmtCdHAwCy80P38dnB8tODVI3p4jW4vUGxpT8WzRDTa1wgA7IYZfestranNkNdf+lvU3RCJ1E8jMO8tWWRMmbQh65SSC8PM/k4I2FlBMDyli6jt+QUXwGgNVCgSS1OG1BYmtOtCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750701422; c=relaxed/simple;
	bh=A7K+LcWLXdSMh6wKmlW7+130w6CceY6pTYjB9LGpL2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vky2H3AhJxYaFy/nL5ZUDkDjyp0RpU86eZ+3b9Nm/0JnIleDF0/R7rBmUua3IE+7BLMA1A683AnAMUguDYAKQUn530GwBGLd4Ny2//WcRVVCQshvVGr7RuB5HrWnlO2KoE0GX4yts+gpCq6k8lkyjThy1bqoG0z93RlDfhl/nb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCtKeMiE; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCtKeMiE"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60794c43101so6777640a12.1;
        Mon, 23 Jun 2025 10:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750701419; x=1751306219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nZZPcFFpczlCCH3+jUC8DptxGeSvN4AN6UN7IiqcAco=;
        b=VCtKeMiEFOLvq7tY34c03+q7aXV8n3RUHeYdSBXc+VeISUhK3dXqtXN/AoEqObUbVN
         KMeasolH1367v7FbI4F13W15X6qqYbQQAVCIXGVENyayV4jn4P3RO0OrSdNUER0iENmn
         yo5qxj7FYVZB3dLN5fzDzFLTaW/xSCPBUzdy/BwSBGP2vc4N6b2dHEI6j1yhVxCeXhXm
         uLatbOv84AiJmqFfg4OmTh5BMj/MVLF4pt6beXwtT2CSF4SojRJLdKhcA2yZXIJN29vQ
         Fe5RfE9FFYgHDKECQnU6gBG5i09EkSFp3qZghbnM1QK2YjyXK6FwkKjXMr9djQspAdHw
         Jcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750701419; x=1751306219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZZPcFFpczlCCH3+jUC8DptxGeSvN4AN6UN7IiqcAco=;
        b=GzSZVpj8TcbFwQGKu/8Th0TtVUadJ592S6FPPj4SzY0b8Gpb2bB6olnQlwXifYawg/
         RrDQyjPtrD+/+Ni5lIIavNQ/Wg16SxxmResCCcv7Crz4c0qR5kVbqsfptClzF3X5I+Yb
         8X8lgy+3+C/C1PbOaX9XtExKc7vw/ntjU86GXZ4m3SmcdO/FmWTuZQhsiAiGe/YyqcNZ
         WKhxUIBd5CIPGwkUa3CrhWVMHSxgslR/HQL/936OxKrwNGxSoNqyOhymZj6nDClVdmXy
         T99KfYHjHg0UBu4zWXPVv54cZoBXQMoOmTd3vGfvMFO5Wfx8jHSETj2t5WznbBZraqTh
         Pv6w==
X-Forwarded-Encrypted: i=1; AJvYcCXguCZjPuDqZxoJrxMjs/+/ggLh73bMjTs+bilWUm8iC9D3Gjdzjzvfu4ftuERJDe3GiC/AK6lKiCYsuBti@vger.kernel.org, AJvYcCXtEz1f/M/2Zo1pxQMBKUHdVQpPvo6XcCyT+Qw68xRuC1uWp7RjQhfamBUCLmn/WY8u65nNNHpaz3hr@vger.kernel.org
X-Gm-Message-State: AOJu0YwR1dHzCGhJJOr5UEaZx1vXlb9zu0YRplhFKFURKc8/w1b02oBl
	tm4FlIPoecN8glohq8Jjz4mKo1aQz3cn6JzOPo66V6zJX7J7ChoZKAgL
X-Gm-Gg: ASbGncu1G4Szrl3Js5A3BVeEoH1nz0JNdjUqEQh0dcWkavn+Zy2TA3m8EBmTJMdSa9D
	ShklriN6jOtci6wbZBoR4V9OYwt7y0MXM0MQ/3koKFU8KjvXhDFENjFFUbPnYc02ZZv1iXsdupj
	ijqzJFYTJqcy+z/vvTbXEn7EzR6/1RDD7a/rUuyz2Ct6V4CMY3CS5+U1g6MzUC8UGk1TeDeiRZ3
	eVBIR66MHbYMMaYCjzZLAMEewbHWsE72ZMMpelnbxXIta0qejn5qtLas0DBXg1CrNIAjTkOu2aO
	Ex3eMN1UugDMsPZZRwGSJqHs8d6BarApYZ6Gn2M2ZHpRdwmYJN4hBtjjE4K2zmhdMQ==
X-Google-Smtp-Source: AGHT+IFHYGJzGKcHxHbMeasOLjpLtoHx3VNYxm2w5V3zB7PXBaWircwkfG+MxrjaKvR+fMF9gFZEZw==
X-Received: by 2002:a05:6402:350f:b0:607:f082:583a with SMTP id 4fb4d7f45d1cf-60a1d187fa0mr11731886a12.27.1750701418968;
        Mon, 23 Jun 2025 10:56:58 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cb9e5dsm6360789a12.53.2025.06.23.10.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 10:56:58 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Frank.li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	boerge.struempfel@gmail.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/3] arm64: dts: Add support for Ultratronik i.MX8MP Ultra-MACH SBC
Date: Mon, 23 Jun 2025 19:56:49 +0200
Message-ID: <20250623175654.844281-1-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series adds support for the Ultratronik i.MX8MP-based Ultra-MACH SBC.

The Ultra-MACH SBC is an industrial-grade single-board computer based on the NXP i.MX8M Plus SoC. This initial support includes:

- Updating the MAINTAINERS file to include the new board in the Ultratronik support section.
- Adding a compatible string entry for the board to `fsl.yaml` in device tree bindings.
- Introducing a new device tree source file `imx8mp-ultra-mach-sbc.dts` with basic hardware support.

This series is modeled after the support added for the STM32MP157C-based Ultra-FLY SBC and aims to follow the conventions used for other i.MX8MP boards in mainline..

Changes in v2:
  - Use `enum` with `const:` values in fsl.yaml to correctly represent multiple compatibles.
  - Updated SPI child node name to use the generic `nfc-transceiver` per DT naming conventions.
  - Renamed several peripheral nodes (`crypto@35`, `pmic@25`, etc.) to standard names.
  - Minor formatting cleanup and compliance fixes per review feedback.

Changes in v3:
- Added "ultratronik,imx8mp-ultra-mach-sbc" to the shared i.MX8MP enum block in `fsl.yaml` [1].
- Ensured the compatible entry is validated by the existing binding structure.
- Updated `imx8mp-ultra-mach-sbc.dts` to address review feedback from v2 [2], including:
  - Proper formatting and indentation fixes.
  - Cleaned up node ordering and property alignment.

Changes in v4:
  - Moved `status = "okay";` to the last property in the TPM node.
  - Fixed indentation of `cs-gpios` multi-line property in the ecspi2 node.
  - Removed an outdated comment.

No functional changes otherwise. Patch series is based on feedback from Frank Li and Krzysztof Kozlowski.

Thanks for the reviews!

Link to v2 DT binding discussion:
[1] https://lore.kernel.org/all/578ea477-c68c-4427-8013-550bf4f9c05b@kernel.org/#t

Link to v2 DTS review:
[2] https://lore.kernel.org/all/aEmh7VL7BHkXp5Fu@lizhi-Precision-Tower-5810/

The board is based on NXP's i.MX8MP SoC and includes eMMC, LPDDR4, USB-C, Ethernet, and HDMI.

Tested with:
- `make ARCH=arm64 dtbs_check` (passes)
- Boot tested on hardware

Best regards,  
Goran Rađenović


Goran Rađenović (3):
  MAINTAINERS: Add i.MX8MP Ultra-MACH SBC to ULTRATRONIK BOARD SUPPORT
  dt-bindings: arm: imx8mp: Add Ultratronik Ultra-MACH SBC
  arm64: dts: imx8mp: Add initial support for Ultratronik
    imx8mp-ultra-mach-sbc board

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-ultra-mach-sbc.dts   | 908 ++++++++++++++++++
 4 files changed, 911 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts


base-commit: 86731a2a651e58953fc949573895f2fa6d456841
-- 
2.43.0

