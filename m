Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC661FC10E;
	Fri,  2 May 2025 22:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746223485; cv=none; b=q5wmzYYPDV/j1IBN9Z09w4sE2c1gG1+eHNscS4DfHYjU+W8DbgGAjaomORvPGcX6kI4KN/F49EMavrUrEwxyll1KnUwr+SrmqDUM3RaqlF9+LpGJGTvFHQPRpVL54qkKEDIzobBVYyR99CVEaAjd6KHVyKt2KUIAHEdfefZ8GYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746223485; c=relaxed/simple;
	bh=dRIhoysQGSyJs2hdqVmcNTx/4yoP6dvGtwt8OZlsnmY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N4a3BwVa93XqIB60T93N0dXYJ+pM4D4neE2K6/yX7/+OR01rnwRws6KPbJZrM2evZ6fdlPJhTWvlH56fjKPpYU/Piz5ERY/G/XoirI/9x9wGh8yYIOyCDaZCujF96wJqxT6+VZm5WTdQ007Rn/Ve41C3I2lhkPIkiY83R7cueA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zlv1tpFF; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zlv1tpFF"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22c336fcdaaso32228405ad.3;
        Fri, 02 May 2025 15:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746223483; x=1746828283; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7affcrby2vNkam9EwwwwjCrmVQatX9FyWXaqSRxB4wg=;
        b=Zlv1tpFFX9VWAQRfCpXK7Y3pQJWJL5Vd/E+g4ARGEYNsdaAc1koUJNlxfeIejCyj8B
         4zj1ui+/URmGsdHnXNjdCYIepQitM83iSv/HkW1nSjyRDinZ4at7jVM37M9LSv6rkZzQ
         1P3eN1dTw6PvYoIj+gCoL8gv+7/Hhe0NpXvYZRlNA7N0JQC7dNo+Zlw0WLLsO3mkjyvN
         2kSIv/7M/yNbxTLxsCSoKPOFtE6Hyouv2pI530tzbZJAdJpBc3HaLuRskdzYIlRNKD2L
         W40LHltKsGYsXup8Y2etbm2uxQsrpK74f2YH7G1pwyny7jgVjWX3Aph7pD5nW6TgCQny
         DWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746223483; x=1746828283;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7affcrby2vNkam9EwwwwjCrmVQatX9FyWXaqSRxB4wg=;
        b=hwUOu9dOY+ZiQ4+cZaZKqHAbTdqC0zDoGxgv92ZEpPWIGpyXr+j410octqsTsetUSR
         4WQAvOZZ2QryFVZlRm8n2WSeSyE8FvIojudJNaOEPHXOokPz8pdlCPY8iXLTiMCEqQjo
         TpyR9AS4XwvUAGkph4b3fC2y8lRZ4nbmdSMTxuO64Xf/SHanZqJ4UhHxC6ATSBYwk8Z8
         5oLQUDv6hMQJbx+YYgtlX1+UQ85dadMxsBSqn/Ps4JEokzZuK0lHDawTT0Ue+hKSOkd/
         ytFUymohkKvqRR7499wJQIUZCrK1rn1AvjuEpfNC0DNrF5iersIYf0pguRPROUYeJbq4
         4zhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9I2Vahpw0suqUNFuMe5abKWnFTGM1mcWgx9e1hTkKd6OEkFprEXXwJ0KSzJSNvs1YuYasf7fJieF5zc4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0EJxeOyERxsBzgjRT7H7dUB0InkRlT/63rMw7d/PFuZwh20bl
	pzjTK87/VpMTrQG838o+8JN0IuR9piR0wGS1RzJ85Bveu3ZVXCO3
X-Gm-Gg: ASbGncslh4hSkPz8oujER0VLjC4q+p7Glsfx5vcEsKSeLVjCMZXdtJ/2ub9QmGfg7kr
	p2Wdglh06qsFbBEn8XqljsjFF+v+1iMdHwepYhXlqxrxZnEXxMr6DPA/OvM8e9B7WdhoEZKfzA6
	jvsoK7BuQI1QTjQNFhvETDyCN/azyVN9c6XVvAewdxN4nQ85stK3X+alqJnIQLDgZEw0ULHD/lS
	E8BZlo6G2ax0HDelVsIe7RyRsC8nXArjjad0fzVRmo2k2yZmEREs6q2epax3w5vGypa00UfOwKs
	yOuKchR4dzJJi54TvdxwYcZwIIlNuVvWkDXpBhP+erKwGB16K9aq
X-Google-Smtp-Source: AGHT+IFSEK0BFBWq98gRMREk3vYKHwod79qnzPoBE27xjeSvNK9HzGZJPObIMMGJCWFIuUJZRuoBrw==
X-Received: by 2002:a17:902:d481:b0:224:10a2:cae1 with SMTP id d9443c01a7336-22e1038971bmr54216585ad.37.1746223482750;
        Fri, 02 May 2025 15:04:42 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c48ac4sm1301153a12.55.2025.05.02.15.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:04:42 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v2 0/3] ARM: vt8500: Add runtime SoC version identification
Date: Sat, 03 May 2025 02:04:22 +0400
Message-Id: <20250503-wmt-soc-driver-v2-0-8c774ad84d47@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGZBFWgC/3XMyw6CMBCF4Vchs3YMDBeNK9/DsKDtFCYRSlpSN
 aTvbmXv8j/J+XYI7IUD3IodPEcJ4pYcdCpAT8MyMorJDVRSWzZU42veMDiNxktkj4apM91FmYY
 t5NPq2cr7AB997knC5vzn8GP1W/9SscISlbkqW1NLlab7OA/yPGs3Q59S+gIa5icqrAAAAA==
X-Change-ID: 20250423-wmt-soc-driver-de26d67bd4ef
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746223484; l=2281;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=dRIhoysQGSyJs2hdqVmcNTx/4yoP6dvGtwt8OZlsnmY=;
 b=ydF//7uFMmST3aeLF7U0I+Vqit9hRbYNg2pIAe0z+Xv3le8sthrn9K5pHbECZQOCAaTfImeb8
 ZvWJxWgSWskBfPA29c6mH7vKgaUStaCZmF+EhDKv5JYHfKfPihGIPNx
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
Changes in v2:
- Moved the DT binding under hwinfo directory
- Changed the compatible string to be based on SoC version
- Reworked the driver into a platform one, and switched to devm_ functions
  (all of the above - thanks Krzysztof)
- Link to v1: https://lore.kernel.org/r/20250423-wmt-soc-driver-v1-0-bd8bf32521c2@gmail.com

---
Alexey Charkov (3):
      dt-bindings: soc: Add VIA/WonderMedia SoC identification
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

