Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B142080E8;
	Fri, 20 Jun 2025 12:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750422246; cv=none; b=iqCSGSruyuOV498C4R/1T9e82FcJJfsyPmTfoIO1+g3ckZBH36NuaVgoy4e5qeqGE4+vbJha9o5QfmpBoICZpOKXQb60XO3NRnkS+0jq++7vI/1Ktg8czWSPt+qb4mlldNFoZfqqePnp/WvGx688YvDKETzeax+GpV7IvnpBQI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750422246; c=relaxed/simple;
	bh=2YzTh/LaLRT0RPvVJKqWN+pvYK3F6uBn5nFIAu2E9MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QJn9xIkmjS2kZIWNB5PtDjmarDpbH0VfgJzYVKamyGvNA3VqwJqe7M7lbETPWlpyd68/UIinnjirfxsZDmxsKCIQinEDL6zxsEHVJAs79Q1zOfkZYbLCJm1dED2Vdmo84cABO2L4Zo46KuVKE4nFlUK1aAijAMgi0TE0Gt5VcRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgST6mxw; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgST6mxw"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ade5ca8bc69so311940066b.0;
        Fri, 20 Jun 2025 05:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750422243; x=1751027043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Aku6I+Z1otaiPYqearkHVG7C/o8TpU3V/UW7Y/eqXAs=;
        b=UgST6mxwq1YmVFFg6IEvNIgfiONG3ewqRYx2UekVtC0vdhENur9yzCih90kBxUHy+t
         KQUaBGJvb5ENVxnJkT24qyVkdyHfgxqCEjzhLUzFaXsQ9GwiRe/HILiK3bKOmM7tuD59
         wO/vdCT/HFtFccRX4fUuggDCIkCdjhwfvxGi3GQnrDQIJv+2VVGKXgVMFYbjsVlnEGLM
         jQyif9pPnkbxqDFpzQrSKb03q+6eabvZ/UzC9z7jl+Q13Zh2DTa1bmKD8pCwNxjvkJhj
         y7Z0ofpd8k3HR/A88hQts6HEtfr74TrYsdhr5EygEqbMyyn6Nzc2H5R6hKCPZIDz+oI6
         p0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750422243; x=1751027043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aku6I+Z1otaiPYqearkHVG7C/o8TpU3V/UW7Y/eqXAs=;
        b=vt8imAE+5dKEQhmZwaTWzNLXQIG84wP9CW036+NLHeiL8Iz2ikrMCcbZBnMjOkOUfP
         0ZFUfUvFDCz64FRKjbDnRziQLilOtLzPWdgJtyOMYmtKfaDr9Gc51ykNHLiVgjMvxVZI
         eE40xXG6GKn/0LcVs+2lxJz9OSUXexssjmNM5qzUBQX8671UYmO/iG+CGJwmozBHchNA
         rIfxK+vm1zAhk2wpa9PvQkt56I6Nv19AK0ajmG/fn1etFFqO2wVw3Co+PXEli1KRedbo
         NjOiW5nZY2M4d08pcWqcefKS14EeUdlT7mkqhKq0jqXL0ia7OcF9rI7LchwWPUUro+vc
         RTdA==
X-Forwarded-Encrypted: i=1; AJvYcCUPM/Vn+GXOx3EBshfEgJpJARlT3RNPr6IwDvMiKnc5o+Ohuc5tItDC4+iUnimnv204yC+MpqWyqpqx@vger.kernel.org, AJvYcCVtwdAqzYeCUhnBrxNsEGzMBWP95O4ne28d0V6UYV/zTpDMrD3rwR2EuUAbYh+bGveLFZ6slqBhaNvT37nz@vger.kernel.org
X-Gm-Message-State: AOJu0YzALZOCykvtcYrCpoJwuFdpTEtPWMVs0hq2lmD2VtmDjQvRh+vV
	LogzXZ4rVPnrJ9HT3bJ7sscxO6zEEtUTxEvr80cp5GsSNbH+79gX0yWr
X-Gm-Gg: ASbGnctdKzJljp1GUtwwL1duzu6X+a+g6+1y6T1tXliyPF11T1h90Lrnznn+9oUXkeA
	IAKp1L+S/UzluMvrdGvx7qQM+TbaBl96EUAYKZTf+rO0BoXA5yWhk12Q7KzPOTxUo0qA3Iz8Fny
	XaYWINB3O62qFlNuolNFXNSHBT1BCTBbuJHazGa/MUVcdKntY6A3NWCWbk1GpmzfNlBBKUul+Ka
	iAEhs9ajjDPnU6y1iOy6fZ9BwcU3zvjsc9sh86/oxQBYTVUkuskSTcoUaalg8vpWtHCx1eiy2rM
	m4XO0XPHZzdOmTisQE6ibXhzAzysLaIDBzBJtenQtZErhrEXpbPuN4aGXugaMobayf4UrkKzLec
	27Kh91SH9xADn
X-Google-Smtp-Source: AGHT+IEYpjSbP+5kauJO7OsmCiLi3LL3VA+uEreYie6xCKg7Byu2oLbO5XxrEDg8qXznylM8ayXxoQ==
X-Received: by 2002:a17:906:dc8d:b0:ad8:9257:5735 with SMTP id a640c23a62f3a-ae0578f527emr254169166b.3.1750422242973;
        Fri, 20 Jun 2025 05:24:02 -0700 (PDT)
Received: from wslxew242.. (11-127.static.abakusbp.net. [46.17.127.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e809f6sm154000566b.1.2025.06.20.05.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:24:02 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	boerge.struempfel@gmail.com
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] arm64: dts: Add support for Ultratronik i.MX8MP Ultra-MACH SBC
Date: Fri, 20 Jun 2025 14:23:48 +0200
Message-ID: <20250620122353.150700-1-goran.radni@gmail.com>
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

 Documentation/devicetree/bindings/arm/fsl.yaml          |   1 +
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts   | 909 ++++++++++++++++++
 4 files changed, 912 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts


base-commit: 75f5f23f8787c5e184fcb2fbcd02d8e9317dc5e7
-- 
2.43.0

