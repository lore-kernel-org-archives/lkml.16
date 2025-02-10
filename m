Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD5E1EF01
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199700; cv=none; b=XuGW1miPtqNYJzikGYmCyrBYDDJHFtu671P1joVFcWMTWIZi/Ia4U5YXR7yW3TooEE8WwhBsnztycBdX6rz5yoE1hXIYJ4PCswugzTTvfaB93KQqwqyIKPPOZmbQn4pSozKiVFSNtbFT11n1uL0yESUYnWJPs4UzLrUV3mDOFi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199700; c=relaxed/simple;
	bh=jb6ZBqqWmCxollI0S4uQS2mM3LQHRj9+Jo7QCgmSty4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ddAD2mh60zvE6X/8fVzaQKDLKcZOYvS9Ey4etTEKOefBbdYmctZ+MUoFkkTT7swRUeN6Y6+dpDodWBBsh8cLOMMPgs1Usbp9Z/O5uma1Yqk4P0W9rwxG6alub6WOnF26lnt6nR/igPxtiol+ePxSORLUrc/m0je9l8d9wLHQuc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cJOPqdhf; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cJOPqdhf"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so835884166b.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739199695; x=1739804495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lvSmMz97pOgFAWJA/y3xBPxzP0im9M8/wf1twm9E1hU=;
        b=cJOPqdhfFWnQDSetQrogyc9bGHOe2FoJDywvYX+GV6KL0uIocfuccleBB/rv2BydLB
         GVbfVcSJrb7IBSLplGUGuwJFsCbrVEe4rMQrIfmTHXTtb/aXkeR4gCjX7DcCSDfgA6ZV
         FyDodcFcadypSrPXf6aGGtb7hJhNek2NyyIwBQy36RL8VhePLlosjV4NKGFvm94qBI9P
         vJek2qKswidS3MlBx5ORlwcM3Dkq+9Xg49YaUMLH/7gRrPTeWaAbyGDbae/2X+Fmfs96
         IX3Gq/c7KuCWxaPhcm46etpbdp80VPsmsKLqXcus6me7+lgVxzghwjiZQTZDXVCj/x+X
         yBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739199695; x=1739804495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvSmMz97pOgFAWJA/y3xBPxzP0im9M8/wf1twm9E1hU=;
        b=tC/DDmpWeApd83BT6kmGA3GuRRfpaxjr2yySJLhPcbUnOpgdLUOam+5g9+SydyaCDX
         ccsVT/Yx1OpELPbS151JNdIwHOSsGoZ6okijS+brRpNQUITMTdo8I3Aehk/ou5+6smD0
         69JSpO9CtV8ymzJrQ0ED0d9MWT7ogLmCkM5LO71RSVijKXc/2dK/MZ3PnGguDcFhGBdV
         XEEBPKFD9qC/Eg/vHzOYyQ9NQtu5M0zVMQ24aiMbCeW9sKFtsLf6MEBZIgpcKo7qZ6Ce
         5R1h16G6JkaQIJLCW+BnuAy1fIiVU9ffLvKJzBnCf74/3gRVg1b2DeWTCS+7ZhRYjPPX
         oVRg==
X-Gm-Message-State: AOJu0YwZgGcF4PU3UVj/XkyJTxC3308dxAetptS71VFK/YMPNHT/xUMp
	fmnTWK2GAe02eQ2UH3WS8gHYjP6ecSxAhIUfQRvDKHIf1GQj8EPzRR0QGmC0Z1Rs+xjpN8oyeT9
	qXYjQiA==
X-Gm-Gg: ASbGnctH64TLjfNevuQIkyt5xXTFcx2zGnq+FAGnBu/ObYvbT3eCkKfHlRCVbgt1cnt
	TeoxkapJWlZ4jjzMFk+OnzgNGTpXAJV3cORwu9B2O7L1WPlyEUugqNdy+tQSV9EPdg5M/TFjrLF
	Q3qADIrdboi/LWDU7ocsOPF8z7TGubKjnVwm+6qN24f1SbNd8VBLbmhyKkAO2FGCtRNKZxhxyYy
	TjtvYl56be9tOwxXEBSKHx8hd/zwRpxXfXzQahyXaigVjL12AWSKJZuQMSRyFz4Y0z160FXACbg
	7631m0iX9h56KkvuMeLKwV915tNz
X-Google-Smtp-Source: AGHT+IF8PHsJflwqMaSmY75s/V/366NFQJlHZHl+wdvCBt6MKVZwDXyvTAAaSuKQ3n4a1jaORAbhTA==
X-Received: by 2002:a17:906:c144:b0:ab7:b2a7:9cb8 with SMTP id a640c23a62f3a-ab7b2a7a565mr636217766b.15.1739199695180;
        Mon, 10 Feb 2025 07:01:35 -0800 (PST)
Received: from localhost.localdomain ([151.41.218.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bec717f7sm250400466b.81.2025.02.10.07.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:01:34 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
To: jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH RFC 0/6] Add support for AUDIN driver in Amlogic GXBB
Date: Mon, 10 Feb 2025 16:01:23 +0100
Message-Id: <20250210150129.40248-1-vsetti@baylibre.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for audio input (AUDIN) on the Amlogic GXBB platform.

It starts with a HACK commit which is necessary to make AIU (audio output)
export its clocks. These clocks are necessary also for AUDIN, but they are
already owned and controlled by AIU. Therefore in order to avoid direct
dependencies between AIU and AUDIN drivers, we let AIU export its clocks.
This export is done through the clk-regmap interface which is not public yet,
so that's why the commit is marked as HACK.

The series then continues with adding dt-bindings, driver and DTS support
for AUDIN. As of now only I2S input is supported, because it's the only one
I could physically test in my setup, but other input sources (ex: SPDIF) are
also allowed according to the SOC's manual and can be added in the future.

This series was tested on an OdroidC2 board (Amlogic S905 SOC) with an
NXP SGTL5000 codec connected to its I2S input port. It was tested on tag
v6.14-rc1.

Valerio Setti (6):
  ASoC: meson: [HACK] let AIU export its clocks through clk-regmap
  ASoC: meson: audin: add audio input dt-bindings
  ASoC: meson: add AUDIN driver
  ASoC: meson: add support for AUDIN in gx-card
  arm64: dts: meson-gx: add audin support
  arm64: dts: meson-gx: enable audin on odroidc2 platform

 .../bindings/sound/amlogic,audin.yaml         | 104 +++++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi     |   8 +
 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  |   9 +
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi   |  39 +-
 include/dt-bindings/sound/meson-aiu.h         |   5 +
 include/dt-bindings/sound/meson-audin.h       |  10 +
 sound/soc/meson/Kconfig                       |   6 +
 sound/soc/meson/Makefile                      |   5 +
 sound/soc/meson/aiu-clocks.c                  | 123 ++++++
 sound/soc/meson/aiu-encoder-i2s.c             | 119 +++---
 sound/soc/meson/aiu.c                         |  22 +
 sound/soc/meson/aiu.h                         |  10 +
 sound/soc/meson/audin-decoder-i2s.c           | 247 +++++++++++
 sound/soc/meson/audin-toddr.c                 | 403 ++++++++++++++++++
 sound/soc/meson/audin.c                       | 321 ++++++++++++++
 sound/soc/meson/audin.h                       | 119 ++++++
 sound/soc/meson/gx-card.c                     |  12 +-
 17 files changed, 1509 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,audin.yaml
 create mode 100644 include/dt-bindings/sound/meson-audin.h
 create mode 100644 sound/soc/meson/aiu-clocks.c
 create mode 100644 sound/soc/meson/audin-decoder-i2s.c
 create mode 100644 sound/soc/meson/audin-toddr.c
 create mode 100644 sound/soc/meson/audin.c
 create mode 100644 sound/soc/meson/audin.h

-- 
2.39.5

