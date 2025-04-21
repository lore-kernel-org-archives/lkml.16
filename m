Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412F61362
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230389; cv=none; b=htDGuoYWKeRSUed29hks2/dj7n7oZMZDZKI8piYF/JW1orrWzxd+rUpxkH64m/NBttBajEgjBDKe/MOMM3YX34t9/NJQ4IqeoCKdAElZZPAz41E61L0BUWOHlUqoCUpfFf0RcSWMB66e9gI3NS9F7z9if0hS+n5uiOOSVSgqyic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230389; c=relaxed/simple;
	bh=ixRYONgnygzUENQX+ohridJXTFmoDUomB21ryQ2dw9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O2k2dOgKNCvxXN6jPLkue18+65BRzfLnbuTJjJlmpmKgKoGf7XkB/n98bdm6zv+Tdg3H7fBhuSQLV3Lu1LHunDA7T3I0K+hgkSon+yioW/9NrmBckbwSx1OhdyvfQsrB2tWv4tKfnkrNQGd8T0pJrfTr8PuAqNI7WXFqpBrSqSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Wh2msPt7; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wh2msPt7"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2295d78b433so42969355ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230385; x=1745835185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9AOgrKhqWzlPfaierQD2uw1OzuGW6898QT6wOBkGCJE=;
        b=Wh2msPt7jsueLcvAy5+60KWTolGX9G3PuktwgH0Gt2s0FUohgMLsjOozc45LSXogOW
         JRVGDUpgz0ynQupyUjie7Bkf5SWLxP8vlXYL//H1jViNAq5DreLSlSgkxAqbdc5AiWut
         MvW9fxk/b5J1Cfu/ghgeZLq3wJ0PxrXWh30nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230385; x=1745835185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9AOgrKhqWzlPfaierQD2uw1OzuGW6898QT6wOBkGCJE=;
        b=bwnElzSo64HRdlQjiCYje+zv2llaXkxJDx8LxV6DenKCzQ1odIG+LM/6+8Dl4cGZD3
         1XSEx0+7Cp39dCqhV6/E+nBnMmbaIZz/WLLQr6OJOq9BZ4DB7Wv/36nhE0n8LSjw3uKW
         yJVy9LT0tRwtmpgSi/WSsVudDOvZis3274c2vXVqJsvtia0xHPaX1JCilR7qQ8R+qdYN
         plovfk5VNJg2AX970hV05Y/tcXc2LMz/6ebZNJ8uloUSp3wmdDGB1kLOJawQPxOinLSW
         MGEvEMy4eZGgvGolx9cOFnoFHUUNWhOZJwxhC/zR0Ci564DFZQNfO7QnF+v8b25pDdq2
         kQBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMRH45AjOLOrB0rublaqm+PYBXErxgfv6tAtNEhaGz+sHo6OXtvJPfZf+z6BPKkm4lEGwEu7YHja5WHgs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP7QP+yvnKiAuqaKErhSS1Eivfs+7PU1TN5AWCUBnvzWXbQZjD
	wGHzKNSGbO8kkaQm2nFmyWVT2wKfUE2oqPgAAAfA+Q0P01IZNiVIiW7MnUt8pQ==
X-Gm-Gg: ASbGncv+Hx8I+Qa5AlPVv/vp9Dv5DZZA9uyQPub3yUrCHLdabp/646MhemvEupnOQCF
	RYnz0jE5YVWvZtt/mKiFdGs4oRD5ETmbtXbl79ErVvViEouytK9wBR7pIuXARocig05CWdnf2EQ
	SVKjSo4R5qaCmAJRr1HHLlR8bMwMHMF9RELXSQjtM237dakxjJVoG1FHLCAqx1KPInmzl/pkW3W
	lfmn7QoqzCUP/0JtQzPN5PXLhqNnSMV9bkK9Ta7zDGfNoEj6qirBdq0Uj0Cxhubx6bO1rzZGQgh
	lddBal+GCuNoIwTvSZwuD4xvfpRSj7EBGYOTgjY/CnuKpV1eQ54iC2opGLE=
X-Google-Smtp-Source: AGHT+IGnpHCEjIJrIXmHvs6VqUJ4pvMmeTt+m8C/FSrMMx0dcqiEAz4cygU8b09pUtOZGuXYRXJLmQ==
X-Received: by 2002:a17:903:19ed:b0:224:1c95:451e with SMTP id d9443c01a7336-22c53607dffmr160232245ad.33.1745230385598;
        Mon, 21 Apr 2025 03:13:05 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:05 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 0/8] arm64: mediatek: mt8186-corsola: Consolidate and add new devices
Date: Mon, 21 Apr 2025 18:12:38 +0800
Message-ID: <20250421101248.426929-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

This is v2 of my "component probe for Corsola devices" series.

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

Patch 1 adds a new HID-over-I2C touchscreen from Elan.

Patch 2 merges the Voltorb entries in the device tree bindings into one.

Patch 3 adds a new entry for the Squirtle device to the bindings.

Patch 4 fixes up the existing device trees for the component prober to
be active.

Patch 5 merges the device trees for the Voltorb device.

Patch 6 adds a device tree file for the Squirtle device, with I2C
components ready to be probed by the prober.

Patch 7 enables the prober to probe trackpads on some devices in the
Corsola family.

Patch 8 enables the prober to probe touchscreens on Squirtle.

Please take a look.


Thanks
ChenYu


Chen-Yu Tsai (8):
  dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
  dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
  dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
  arm64: dts: mediatek: mt8186-steelix: Mark second source components
    for probing
  arm64: dts: mediatek: mt8186: Merge Voltorb device trees
  arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks
  platform/chrome: of_hw_prober: Support trackpad probing on Corsola
    family
  platform/chrome: of_hw_prober: Support touchscreen probing on Squirtle

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
 .../platform/chrome/chromeos_of_hw_prober.c   |  29 +++++
 11 files changed, 167 insertions(+), 33 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
 rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)

-- 
2.49.0.805.g082f7c87e0-goog

