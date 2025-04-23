Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0ACB52F88;
	Wed, 23 Apr 2025 19:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745435912; cv=none; b=utN8PtHtSH2gqheFhNXnQ/nX6Tm1hf7fkh3k9nj1E8RV+D72RrSpybM7pH7TL9bcmXW+16kdLN7KIoCoU+SNbpDscpYi6EksAWYcBOk2y9rgn5FH4Gmcrt8SUGhKreYA1dhe4QfbF5ceEoiH9y85BqhJuzLvcQ914RHu/k4fUZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745435912; c=relaxed/simple;
	bh=F8SSjqtBe9E0HYlX9U1a01n/FwOQ8nwnabHjcE9VkKA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hFds1VZZVjSeLrs9C4fZbIpjN6S3sBI3j43Bq715XoD7ld7oU7kE8gL41fUpdfKhrAxATAVsLyeYG7f1ECbi9WRL2yvVoVIghwf9mdQN3LUgGh7jQ1nxDMa6Bwq4sldB3JrV7Dp6t2wYKUMtzC7TIv/PeX8MuV1wQ6tezJKImYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCzJ2Aw+; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCzJ2Aw+"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22409077c06so3175095ad.1;
        Wed, 23 Apr 2025 12:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745435910; x=1746040710; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XAlKzRIEDmOMNM6L0NhSyuVo569RcMS78YotCgYOSqI=;
        b=YCzJ2Aw+rALydtaNTLLeoRzTJN7nAk2hxbJTkuMt5vxuClky4a1IaySv1CTLHteDqw
         cCLjS3n1evLS/PHewDK9hJGqYUVTxt8IJK828TPkL+a5ucvsxom2wcQIvVY4hx42Am2b
         gudkk4kCrHxxuiDhTW/tQZEfAAnTXhOTKvh38WqavV6JdeFOo7pSutoR9YLNZj7jRjYY
         AJf9HgcsL8VCgml6dCgDTvG0fdmRl/RVH2snecvT5Yttn2QARK1XoGUuBDa9dVDxaZ8S
         jDhdGCvZLgwlmtdHesXiSCQpoJF7SnRb5bZp7pQFoncb0N45LOUdHXTE0w2MyZ1bsul6
         EbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745435910; x=1746040710;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XAlKzRIEDmOMNM6L0NhSyuVo569RcMS78YotCgYOSqI=;
        b=veuVrDY3z9XQirXd/z9+P3mlCuncqU3rONx/SVhGmYqfnyq6DOPb93ZoB0u2W4x6Sy
         sLINnN54Vps/SpMEqYpot5nQvyIdIKTa0SjunbCm7Oo1xHsGNxvyzDuinJUp9jVj1BKa
         tLH+OCI+2uTpcgmmawX+drBfbNtA5w4Xqf0J2NOBG48G45Oh8xQkQsEBMS+/GSharJb3
         aWCJ74HwYpwK5YDgaRTZqooFyvUg8BcHCus9eJqyFWPMfglKJDdeHt4zofVsaWt9XZWG
         SLhkC3cz90m3W3UBL694SgMBxdlMYzZVBWgbU9BpXRFvFnxA1NozTkBa66LKmVBCFDOv
         qXjg==
X-Forwarded-Encrypted: i=1; AJvYcCUkMgRHs0U5QzvPX6B86OFw1wLCqLz5LjijTL3743DIopvpg5Vup9tpJBLixM4wk72FGgzgdU+1RX+DVDY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpg+lQ0XEL4me7RVCwdW4rBTecL4oRnDDfgMBPo7T7T7Prr67b
	7nreGnQoyVu86QA0etBKyOb9UQNBnRSnfCfJG+KV7lLPci1DzyLj
X-Gm-Gg: ASbGncu9EEoy32cQOQmu/cw6apRd91OMXhmP9VZ6ztBjLI2ZQKTJpmiLSqzraULQfo6
	SYO8g8wvIesXB7qFPj45c9SRHAzREr4COEVGMY+BjenbCeJUCeZxF6U5kdGf63hpELXEYDugpM/
	s6e7kwG9uRP/TcewWZuUVpfi8kcnpUpejHjI41t+V9WpTcg4Y0WjIvS+4ccx1/mfmVY1D+IeJBd
	TX6Rhm+9+OZnvN0dGkG3ZkdA/UwDqLjfbUPgNmjTPv15l+erChiqEL2nrxtsO9I1PXddG4gAIyl
	1x7Co3i4T+RpeYCLwnvYKTe8LeD0s7iUd5MfB6ZAxiuvIiO23Yz2
X-Google-Smtp-Source: AGHT+IFqtVLMUYCI3a91c+3WdvO87nsZUIASaOWcsedUdf92cp9GVuS79Tnp76Wh41NEsYpqtvSNhg==
X-Received: by 2002:a17:902:c40f:b0:227:e74a:a05a with SMTP id d9443c01a7336-22c5361d29emr313472595ad.44.1745435910020;
        Wed, 23 Apr 2025 12:18:30 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4897sm108204025ad.143.2025.04.23.12.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 12:18:29 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH 0/3] ARM: vt8500: Add runtime SoC version identification
Date: Wed, 23 Apr 2025 23:18:30 +0400
Message-Id: <20250423-wmt-soc-driver-v1-0-bd8bf32521c2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAY9CWgC/x3MQQ5AMBBA0avIrE1CUYmriAVmMAutTAWJ9O4ay
 7f4/4XAKhygy15QviSIdwllnsG8jW5lFEoGU5imqE2F935i8DOSysWKxMaSbSeqeYEUHcqLPP+
 wH2L8AORdRgRgAAAA
X-Change-ID: 20250423-wmt-soc-driver-de26d67bd4ef
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745435922; l=1942;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=F8SSjqtBe9E0HYlX9U1a01n/FwOQ8nwnabHjcE9VkKA=;
 b=pisJxblZif4j+2IG4v9/QlR/sxLCnoZAYCaH1elEBlp3VqDubQ8vrbYnb9NfDjmqRfv2Z8mad
 pJpR2Mq4yRzABROxYSU6Yv/472p2j/zknOmwkrYGiD9EqQsIUXyAzAl
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
Alexey Charkov (3):
      dt-bindings: soc: Add VIA/WonderMedia SoC identification
      soc: Add VIA/WonderMedia SoC identification driver
      ARM: dts: vt8500: add DT nodes for the system config ID register

 .../devicetree/bindings/soc/vt8500/via,scc-id.yaml |  37 +++++++
 arch/arm/boot/dts/vt8500/vt8500.dtsi               |   5 +
 arch/arm/boot/dts/vt8500/wm8505.dtsi               |   5 +
 arch/arm/boot/dts/vt8500/wm8650.dtsi               |   5 +
 arch/arm/boot/dts/vt8500/wm8750.dtsi               |   5 +
 arch/arm/boot/dts/vt8500/wm8850.dtsi               |   5 +
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/vt8500/Kconfig                         |  20 ++++
 drivers/soc/vt8500/Makefile                        |   2 +
 drivers/soc/vt8500/wmt-socinfo.c                   | 121 +++++++++++++++++++++
 11 files changed, 207 insertions(+)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250423-wmt-soc-driver-de26d67bd4ef

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>

