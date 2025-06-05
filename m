Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEA91DE3A7;
	Thu,  5 Jun 2025 14:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749133660; cv=none; b=SwkDHZ+CH06o7DRi/kWksjrx59Yg51OMdr5OQZE7nPhlR8N41uywEmr6VOSyFOmegFKqqL/txuIcvYOFmB+C1ZoAAzZKsBcroFYTK/oSb5WOdu7LEvR6VGuB3r3Bfd2hV3wWevSFH1Jlv66CVO5SW9JSG81qERCDULOiSIe8UQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749133660; c=relaxed/simple;
	bh=nllIz1ELWLaTsW0jgbqZFDkXDGbpV+IrcJUPbcQPwOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nkTUaPbuyrGxjH+Pf7+Tv43dsiOa97AiNMzMKS/KLaV9a5zANY7VnMuTA3y1Sn9TQbMFcwQu7ytulVIVSchGm5Mxa+liIhvqHp9PkrZ3DcK1yyzyBRaC16DhmBS/lWpYBMcXze/h38rd3aa7yYxYNny1hyCeysPLnj1T2oKEGw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+S9JZmq; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+S9JZmq"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso188226766b.3;
        Thu, 05 Jun 2025 07:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749133657; x=1749738457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6+NXri69Vzo7baXI/w3sw4guApRbpP2jRadBYUKmX0w=;
        b=d+S9JZmqcziR6/o2q4Uht11vXlgrLtyzotsDTI0djSCvO3hSIkbw2OLiqYvAFFSvw7
         toGzHRkufEwCNssO1YuA66ZsjdFXD8yq2Auu8x00oPgRQ+gc0ejofu3ATuidSsKA6cGl
         3E89twxc+ZOlq6oX4F4RKM/60XZgSVqiWdZX026lEUEDeCTQDUNaWmmWLxx8Cikt0z3W
         o7RR8CC3/5saKgbsuyNOPOPfZdbP1Rbitt8PI4TC+6f814krgHkDPu/kYBeCCVc08hjF
         UdRuw5sVeJrsakjwfSsFriDCI49SVxGCwL6CYrsOm14ADWU7wTxtIOxcfbkLXU25vq8s
         pWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749133657; x=1749738457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+NXri69Vzo7baXI/w3sw4guApRbpP2jRadBYUKmX0w=;
        b=NEDfq2Yak3zfoO+fumXnyDBjQ7wZYSQ/ba5tehyhma7MLv6Io60dZ5HZUflrj1Rd9G
         TkQ84nOaIrk4rahN/FQ/8rbbGBwwZQ8MrACVPE+cj+0xB1sAn7hb1HvM6jquoJ3YUblw
         wBxFrrJWeQgoE1Hb+vKfIsBqq7OpLh65ibl+zF4TR/RorXFqRWvHbpfjw/kWN4E0gNUW
         gXgPiED9AiSzO9hCjvH9gHcagVkk4M7LOg7YG+21LCi6NeM/X6D0rKSUZrBXlWPOAGSe
         aVN3OrSgII0hAZuh4mhyITvh2k23Rpzf1KJOplRgVTzT5uWxjmSj607OYb6FNFNnIjj6
         iTTw==
X-Forwarded-Encrypted: i=1; AJvYcCVG7uh0Dz0Mxv2gbOEao4himmzWLQij5kPgfosGwg91gbVMdXAbsPcdmyVNgceAtCYqRv3ZnAuen39DJava@vger.kernel.org, AJvYcCX7D1kRSHkykSwRegHz9VEV6++1lZz2/VSSmNp3UpS+9Co+FMfT9RIi5YoMUG7r5sdwOOh9EfzNJHZB@vger.kernel.org
X-Gm-Message-State: AOJu0YwJI6kVctKh89nc06f2ei0yBzwQ/vBAfzoBPMMoqhy28wv7of1T
	MaA8x7FkmuhYgkZEGVEr3Jry6fAgS+f64kP9rIzUIhH6MXbkwV/+8cba
X-Gm-Gg: ASbGncshy2Ar8XByYwZN6su2gcvR+4QIuM0SuaLTFNs3Hc/7BRDymfyZ0GN76bDIfSl
	fz26TGaE8ILbZsxxrcAuq4LVjfbJd8XrdYkBPcxyR44S8KAXwDtoo8IfbhNiu7qW6dWDH9fGiw6
	hjFV/1rP8UZKE4ssI+/1gSP719pnghdiYfgFiGWQQ23it/vXJDopOW9gxo21VEzr55llOehaH5w
	GZ0aTt8yY/35vJN5sP01D837fAfcc7QyWLj+U79F4r9zPEK3ymTF0+9I4y9ItENCimtd1PDMez+
	/rWSZRrlfzl0yxIHI6xwapqF9Xj/S4vXH08ygAS/6jIDDouN5VTu2h3Qd0PaYeyDIg==
X-Google-Smtp-Source: AGHT+IHW2Pc/ewt7hddIYI4OomGwG9pMOjuT2WwbFuM4l7M77lzfl5/Sb5QJCFz7zadn8bOoPbfd2g==
X-Received: by 2002:a17:907:7b8e:b0:ad8:a41a:3cba with SMTP id a640c23a62f3a-addf8f75b77mr657715266b.43.1749133656544;
        Thu, 05 Jun 2025 07:27:36 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d84e75fsm1259338066b.81.2025.06.05.07.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 07:27:35 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	boerge.struempfel@gmail.com
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] arm64: dts: Add support for Ultratronik i.MX8MP Ultra-MACH SBC
Date: Thu,  5 Jun 2025 16:27:23 +0200
Message-ID: <20250605142728.2891465-1-goran.radni@gmail.com>
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

This series is modeled after the support added for the STM32MP157C-based Ultra-FLY SBC and aims to follow the conventions used for other i.MX8MP boards in mainline.

Tested on hardware with:
- Serial console
- HDMI output via LCDIF pipeline
- eMMC/SD-card boot

Feedback is welcome.

Goran Rađenović (3):
  MAINTAINERS: Add i.MX8MP Ultra-MACH SBC to ULTRATRONIK BOARD SUPPORT
  dt-bindings: arm: imx8mp: Add Ultratronik Ultra-MACH SBC
  arm64: dts: imx8mp: Add initial support for Ultratronik
    imx8mp-ultra-mach-sbc board

 .../devicetree/bindings/arm/fsl.yaml          |   5 +
 MAINTAINERS                                   |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mp-ultra-mach-sbc.dts   | 907 ++++++++++++++++++
 4 files changed, 914 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts

base-commit: cd2e103d57e5615f9bb027d772f93b9efd567224
-- 
2.43.0
