Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE7523D29D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148411; cv=none; b=tmtncMKjvCLFXNgjjh+OOITIBF8Wtvk8u73Owi3wQttRE5DLVby2J38DGRgPBgFi03Df/nXxLjdkr9g+KUvKu6LDQPTNa9Ymv6KZYWxitnuNbwCr9u5XZZHFy+01T20D5b/qwExxyf7h5L8bjE5NFCldDcyva1RWyc4CNGimCOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148411; c=relaxed/simple;
	bh=1AG+e7q/YfpNh/SlwkVCOpC963NtuDICetxHLxE4P8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k6n45bc/3pzM17M1QeZcar4HwklJ8C5NXBAbiNbLXEb/BSk+qymHf6CusFGhpi3NpP9PFHNF8b6tVmENnHUcGozaUrnQC4Itj9IjuvFp3XKXX7312YOfnCPXHM1ABYIGiVwpVtLYuhYgLv1Nip9Ij9iUrjCjdIflV2C26Fho6Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E5L6JVBo; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E5L6JVBo"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3122368d7cfso4267926a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750148409; x=1750753209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fCgu0WUEcOwg7fCAIzSjiLXxg/4EglOh3d2upcp8Yto=;
        b=E5L6JVBoqJ5I21gjSFr3jlTaIVgBDYEKQg3a6WN+Y3JpJx17ZQfCBxGeM/tClSkrbQ
         oYfp3nsFXrBPiSJzFhSa31mq0ebY40/EUCeQ4umGKCq9Lau5Ka43ajPwIOIhE+3zJLEx
         fAkIkdJZn+0XbA1+Vg4aMw9RfOTFQ+0uAFlrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148409; x=1750753209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCgu0WUEcOwg7fCAIzSjiLXxg/4EglOh3d2upcp8Yto=;
        b=UgQNsNM08DnOZqh9j/SUeVx7h+WDNA7H/dFg/msYvzLdHKB2cR1Cb4Sr5EY/MHsSFr
         uybwuSducegSbn6tl0j5oTiQzPrZ4DJIHq13EmmfR/EcDndonSmrPwGt5qDvwj0LcXfG
         vWx97eexL1WpfCMNHZDewZ/n20HqUPjZbOIEKUTKh9SKni+IyYsgoE6GbumOUu7LfGAx
         Bpwoh8J5O7GEHD2iPVPzoy+obze/UBRv+xbp0xLltJ/Y2uxDgy5mXR14AzOU6YXQxjEN
         lbo67IWcWB1qOCYxFi4iqU7Z3c9ZOY5WBQ8PzogjJKWZaCD7Q7yUUBscvw3djQKVI8Dy
         oKPA==
X-Forwarded-Encrypted: i=1; AJvYcCWOEF0VAQe9UHbd1aPZnUpKWXeEim94XHlCZ8zkTuT6ID62QKiTgraaL4RfAHSm6dUrytbgpyDxqfAx9I8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0jLPAo2dHuVrTiCqJog88hDmeDEIaoDmOCXsmip0Vm/dctz4J
	uO+Gsu512nYjxuvJTqx+d6m6ZwBzoDhyz/4yjecaI1gkeEFA772/TQj2SY+SmrHOEg==
X-Gm-Gg: ASbGncsG5lGgJGoW7+mxFn959NR2qEMcj/89nya/SdAPGAYYCqUyFPLIpx0vVhpZvi8
	WgRJqM0RheIT5Tmz3HhfDF7x2rkR0eYLnOAqTLNydybP/lGhV21IamEHFnJnm/dkL4poDsMNbbT
	LckjLNCKOsyqyKHUIppkQnNZ/uDhtIJv6TzEeuLQGMbBDiav4j/upmg2rw7k+cxhyJnJYK91C3g
	bdMzzv/kjAStbpaRZN0CNI9w7fmDCgiixe91bWx0duAQ26Btdp0mgo5tTl0cG3qjNzCC74EFQWS
	2S66y2uNmVaZqME+kG5DKKt8kaRyG8ycwN/kCZG888k1uyozOJiBb9nCQp8NNZnM75KZpzCN0ls
	Meacs
X-Google-Smtp-Source: AGHT+IGD8SOS4o5xDhrfWM54iSlJEPR1fjzyAoug43lUG4UEBLvt1iAqZCg4HuIsK4C60TSEQU1JaQ==
X-Received: by 2002:a17:90b:5847:b0:312:1dc9:9f67 with SMTP id 98e67ed59e1d1-313f1c7c54amr19445589a91.2.1750148409049;
        Tue, 17 Jun 2025 01:20:09 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:24a1:2596:1651:13d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm74598885ad.110.2025.06.17.01.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:20:08 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v3 0/6] arm64: mediatek: mt8186-corsola: Consolidate and add new devices
Date: Tue, 17 Jun 2025 16:19:57 +0800
Message-ID: <20250617082004.1653492-1-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is v3 of my "component probe for Corsola devices" series.

Changes since v2:
- Rebased onto next-20250616
- Collected reviewed-by tags
- Dropped driver changes that are already in v6.16-rc1

Changes since v1:
- Reworded commit message for Elan I2C-HID binding change
- Dropped I2C address constraint from Elan I2C-HID binding completely
- Dropped enum from new compatible string entry in Elan I2C-HID binding
- Picked up Rob's ack on two binding changes
- Rebased onto next-20250417, resolving conflicts with "spherion
  component prober" changes
- Link to v1:
  https://lore.kernel.org/all/20250312104344.3084425-1-wenst@chromium.org/

Here's a follow up series of the I2C component probers for Chromebooks.
This series enables the component prober for the Corsola series of
devices, combines the two existing Voltorb SKUs, and adds a new
device, codename Squirtle.

Patch 1 adds a new entry for the Squirtle device to the bindings.

Patch 2 fixes up the existing device trees for the component prober to
be active.

Patch 3 merges the device trees for the Voltorb device.

Patch 4 adds a device tree file for the Squirtle device, with I2C
components ready to be probed by the prober.

Patch 5 enables the prober to probe trackpads on some devices in the
Corsola family.

Patch 6 enables the prober to probe touchscreens on Squirtle.


Everything has been reviewed. Dmitry, please give an Ack so we can merge
everything through the soc tree.


Thanks
ChenYu

Chen-Yu Tsai (6):
  dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
  dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
  dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
  arm64: dts: mediatek: mt8186-steelix: Mark second source components
    for probing
  arm64: dts: mediatek: mt8186: Merge Voltorb device trees
  arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks

 .../devicetree/bindings/arm/mediatek.yaml     |   7 +-
 .../bindings/input/elan,ekth6915.yaml         |  12 +-
 arch/arm64/boot/dts/mediatek/Makefile         |   4 +-
 .../dts/mediatek/mt8186-corsola-squirtle.dts  | 107 ++++++++++++++++++
 .../dts/mediatek/mt8186-corsola-steelix.dtsi  |   9 +-
 .../mt8186-corsola-tentacool-sku327683.dts    |   2 +
 .../mt8186-corsola-tentacruel-sku262148.dts   |   2 +
 .../mt8186-corsola-voltorb-sku589824.dts      |  13 ---
 ...u589825.dts => mt8186-corsola-voltorb.dts} |   5 +-
 .../boot/dts/mediatek/mt8186-corsola.dtsi     |  10 +-
 10 files changed, 138 insertions(+), 33 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
 rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)

-- 
2.50.0.rc2.692.g299adb8693-goog

