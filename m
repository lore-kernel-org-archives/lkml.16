Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D641D1BF58;
	Sat, 29 Mar 2025 18:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743274759; cv=none; b=M8D4RUZtDH3cvLBq+i9XPjTsvRHbDwMXZZKKdFh/l/gj9mRVwALHstyJPnOHQnwcrBSI7ve3MuTvT+k54p3NU3RvU3ommbzd1h03ZGjdhtvNYyuN1M9s1mIFta776JMrz45jGyNkC4xHJir12c/ZSPmZ8NO/JIzwUR+6qvKicMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743274759; c=relaxed/simple;
	bh=lGWWyruY+zjC/qdtG1MwSTaPIJwqLXDqfa1q/ixSz1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qdCU5O7rf8odVRP2qsQoCCsgOTjX8HVCH2H84bE9LFKW+weWK6kXLFLMOhrXXPEU1B+Wr5pNBmHvovEslql997XLjeovs2/jARO+abXSWloj/Y/nUgCwmaIuSqKqXhsITRI+4l6MLi0Fe92hRAVZppbiU5UsKz2fbCe7TbiHDlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=FICBYtHT; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="FICBYtHT"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so419956766b.0;
        Sat, 29 Mar 2025 11:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743274755; x=1743879555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5GVWx3U81+0/GXIOVP80B3wI0lY+sgpXX7M13r9xpuc=;
        b=FICBYtHTbjMHFJHzv3EyLoJR2scfmgqo8QlnwyGfWfKyyWQuqmxbgcmiJ0pAj8y7g+
         vS+6YYlw/ao4qJB3pF+1wuAQJ5fv6t6OnYQV4rgxg7CYbojJWHAqXdig7oYy23VzrffD
         j2wp6NuwddLdUeas3JCyN1c8Nt1yKGUExX2sNkDDcabtK7MU8ru5+92XFK/3CBkMHFwa
         2+DXOCc41pNNsCF3PTCkt096ChSt6huwihjrS6qbSmAvfeBfElwCrdE5WHr4i2Y/4268
         2xt9qU3wLDxcrokg766fCKQ0VuK6vq6PRVAxLmSavQc7erni9BTaG4Y6cvpkw+jCE+/A
         gixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743274755; x=1743879555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5GVWx3U81+0/GXIOVP80B3wI0lY+sgpXX7M13r9xpuc=;
        b=BDkgsDmzZl3UNjhuIMmLiAJLQr9RcVONdfCJzpn42PQ069CVJx1V+LqkXemhsDRzTb
         rnOE29nv4y8Qn8lzlXa1paWDHKC0Pz2+wUTPUDNse942vzV4IuMHtQeXRcWJ/UKjtSGc
         yuOItWclpFDv0c3LRgdNlbwRdaKCve79+72nyalF+dO10zdqR8wno0WmsdP9+iAhxTJO
         h8vgwoVcPCI3WRAaSApkU5xHNhj7jf5Gi1DxETgDu1tFF1nFATMkI8jLIJoTXAXrXBcD
         mEfEpiFaLTxTetV6+3hLuEp4UybQ8ywfyrri0McVBe6/euyWr5Ycpr5d1fKsiIM6Z74C
         25VA==
X-Forwarded-Encrypted: i=1; AJvYcCUfnKZ5HVsKRnE+19doQ64h643bjm0DlG/Xm06kr6yHuknyWy9faEUc29llFRL5oYtcpV0ZRGu/eTxQ@vger.kernel.org, AJvYcCXXGBnI8qU6FA+M0Cpo3LrBRsnTfQQJXK5oA5MWzZb5OUCC0n22xKRzmMcTCpG5y0TEM1VVbTODIQwmRa/m@vger.kernel.org
X-Gm-Message-State: AOJu0YyGmmB7xkQ2OhqanpaG3JARIuV3j0LzsAN8hRc7ejB9z53T6+ml
	j3avIrLA2io91nH0DOfD17PSso6V/EqrC3n2xIJ37w0b9Rp8H6m8
X-Gm-Gg: ASbGncsvi8IBbqVbKkomSU8kC2D3wQK+sdM2sv6R8c4hAPV/HzUhc7TuorB7irN9jep
	GCioZkJ0DoevlhfbevJNqoiAyFfchR+/DYTkuBLaA+weYbqJJoWKtNZ/VMo2p1fkFMKdjxN4dN4
	w18OK2udy1ROH224jI0vC5ORGHnQWJT2/FVC97Y66hUg6pYvwrDtzywjgKwsTejhQCqwdtmSQ5J
	bZM/YN4oYUw1Itglz4wvaI3knLRLUt7NUiVVP30Bie7q+I1TdoZHnNRenC2ujmnQaJw5ef9UT9v
	4zW68itQb+TOG0bDV6APE/O7610zywrrbZWcAy3ogBZD68xSSdAtoKk+AK5Clbxq7obtbc9gO40
	Ssigu8NNg9bqa13UH0xVMrmgSHlR3a/xHwMCdWmolaPAqfQrI9uKoB96K+lM+MDYflsJvgw==
X-Google-Smtp-Source: AGHT+IFk/KARCjCUyhGU/vgF6K1Sn2uPB37x4iuQwrcxiHKFEPycVyCYu/EqsFuwOcWYcCe/tapuaQ==
X-Received: by 2002:a17:907:6d27:b0:ac7:1aff:1183 with SMTP id a640c23a62f3a-ac738932eecmr276308566b.2.1743274754676;
        Sat, 29 Mar 2025 11:59:14 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac7196dd46asm364497866b.160.2025.03.29.11.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 11:59:13 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com,
	khilman@baylibre.com,
	neil.armstrong@linaro.org,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/7] dts: amlogic: enable UART RX and TX pull up by default
Date: Sat, 29 Mar 2025 19:58:48 +0100
Message-ID: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the LibreELEC forum there have been reports that Odroid-C2 does not
boot when UART is left disconnected [0]. It turns out that this can be
solved by enabling the SoCs pull-up resistor on the UART RX and TX
pads [1].
It's not clear whether that specific Odroid-C2 board has a broken
resistor, the resistor is not populated (either by accident or on
purpose) or if there's another reason.

Testing on an SM1 X96-Air shows that pull-ups being enabled on UART
RX and TX is actually the default (either set in vendor u-boot or an
actual hardware default).

This series enables the UART RX and TX pull up resistors in the
default pin configuration on all supported SoCs.

Testing has been done on:
- GXBB Odroid-C1 on u-boot by a user in the LibreELEC forums [2]
- Meson8b Odroid-C1 on Linux (with vendor u-boot)
- SM1 X96-Air on Linux (with vendor u-boot)

Please include this early so the various CI systems can test these
patches.


[0] https://forum.libreelec.tv/thread/28586-odroid-c2-gxbb-s905-and-le-11-06-or-12-does-not-boot/?postID=195481#post195481
[1] https://forum.libreelec.tv/thread/28586-odroid-c2-gxbb-s905-and-le-11-06-or-12-does-not-boot/?postID=195667#post195667
[2] https://forum.libreelec.tv/thread/28586-odroid-c2-gxbb-s905-and-le-11-06-or-12-does-not-boot/?postID=195674#post195674


Martin Blumenstingl (7):
  ARM: dts: amlogic: meson8: enable UART RX and TX pull up by default
  ARM: dts: amlogic: meson8b: enable UART RX and TX pull up by default
  arm64: dts: amlogic: gxbb: enable UART RX and TX pull up by default
  arm64: dts: amlogic: gxl: enable UART RX and TX pull up by default
  arm64: dts: amlogic: g12: enable UART RX and TX pull up by default
  arm64: dts: amlogic: axg: enable UART RX and TX pull up by default
  arm64: dts: amlogic: a1: enable UART RX and TX pull up by default

 arch/arm/boot/dts/amlogic/meson8.dtsi             |  4 ++--
 arch/arm/boot/dts/amlogic/meson8b.dtsi            |  4 ++--
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi         |  1 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 12 ++++++------
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 10 +++++-----
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi       | 10 +++++-----
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 12 ++++++------
 7 files changed, 27 insertions(+), 26 deletions(-)

-- 
2.49.0

