Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACF42B9A7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745456939; cv=none; b=p5ijLA+9M2aDj+ELEY+ogTYZbWdU6xese6pnUfUBoKYn3d/hZxGbZoS42rxLhsQ85q6SvEpjo8M0OFcfvem1xbpfxxtwOB0rIULjR2HxPTr4l2Yp+Mp0EnNQ+IjpV9iqPz7Q5L7BMDYGquQ2/+dO6Ygwjb0BKvN/FM+Qb/so7Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745456939; c=relaxed/simple;
	bh=r/Wf+jfdsb0cuBQZ+dONOZlNzlyDtVkBfehZ2Z9pVIk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GRT0tlrY/UAdGPf1SB88tPh46u/0xkjgs/T7/SKttG/PL44pCjsXSUq7VxfNN5sS6lt2WydrLGaVZYGFlPPlnnFCDfpbv79G6LMYfyUKJ0pS6TqUa/NU7tepgm55LHwje5vf9Af5oXvJyqu5YaX3IYiZ9xMPjeIO6qoPRz6vzAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=tv5Y1nYg; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="tv5Y1nYg"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso397156b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 18:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1745456936; x=1746061736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=96K+mNY7OtOPr52dzDB019LRxvI9XjhygxeglXZ6I3Y=;
        b=tv5Y1nYge23PIPsmTjDcNdaJ5k9B/y7C/WRPadljdkFU7RCdpFFF2zaELhlEFB3Nhq
         /34fgiah8Xm7ISdhC80cXdXAAIjs1bm8xSLP6k57xiwKwd8pgVMZ7Haj+MP3oGaygddE
         WnALFJHzX+ZSWIJM9K9pZbec44zwnnnNZ7ZI+4/MKLf6HESdc6AOkSEWz3UDpjSslAxL
         2QHu4ZoNCVj4OuDKsVbGvuZuOuYbZuJHNDK2ACaoDd1oV1DD6fwWEvqxrSppBLA8dP5n
         O46istpGmkvPEPO8Pc2wpnPwXDobImQ2mH+rsG5jStfDnvVN1Tubk3VkiYnleuHQitrr
         /dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745456936; x=1746061736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=96K+mNY7OtOPr52dzDB019LRxvI9XjhygxeglXZ6I3Y=;
        b=sONIxRSES8D79DZm6YvpfZi+qV0YvcQzikPkHQ9tHab5O1Pn7wqDTPpnj/3Re6p/Zl
         0gto87id/dF3rDRfbZe+ZNw+P9eAIE/3TFYZ98BqH+J4S5LHVuOz62hT50yoH7SSpOVa
         MrRk2VFOnDF4ilT3aPgvW8d4gxDlU6Uq+KQVlaLVylV5y7ZhBV+dMZ4QMN0cBq82H0tX
         wJNTiEyGiB2gaksBsQD15Lyb+sxdnG8SHIDovefapArAbeBJkBrGm7AQZoP5RPDrY/gC
         bYh/Cwbtf4q+RtzSqgcnPoPjiNYplNpCJMJS+7VyLjFXb6CEMZrwdBzYZxBcDpafzt/Z
         DT8w==
X-Forwarded-Encrypted: i=1; AJvYcCV/kfl14JyQdaYyP28nFrrxCtTixUAa7g8l4pJ051O9M/ugR+LSzTzVaUkSJ5BdgROk9yOPSRYRjcHDKGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzFdjtnKc8muMUZBO9UxVYdhDJMTD1KlJm30W7GogZGZdHaD1k
	Qd414w3VfgFn1mzupBb6XFjqBsDFnmu4CAKcfxNpI0RTCQLbtn1Qqeeym7kSOBs=
X-Gm-Gg: ASbGncuC/iuyChkg6KNrWydLB/WGEDSzUjuVrjlQHhkbIq7eJCwmv5SGbx6ksO8WzHH
	s3RD43VnQ78jfdjLjVH0JR0u19Ua0II/ZlqQ9YjiFsqj4vXT9JLUT1VrKCag7GGUQvQ4S9nCbGf
	SNU9nY1qgatrPc7wQ8dneofGPfhVNCaU6KlP5QdQprEYNKw4y19KD4670yZVc/w4bFWTiZfim7D
	ybJrlp80gSxt11vHkI6WrmGs0WCYhr0+JbWbvxTvyzLFo9Ne0yZbw3RLDylIaaLYD8MY1Ei0asE
	ANmIfhYPfglpARoxZ0Ga08te9cfL+bU9mtpbYb5pNzgCxbR/rmKbrORPKvOs2ah6boW2wg/F/64
	=
X-Google-Smtp-Source: AGHT+IEjab817v1eaoeZEkx35Op0t9qrF1r28YyBnzNAO8gZBkkFNiR9lKADu4oJ6ffW4g43dcuz5A==
X-Received: by 2002:a05:6a00:1d81:b0:736:5725:59b4 with SMTP id d2e1a72fcca58-73e245c09bemr1272531b3a.3.1745456936651;
        Wed, 23 Apr 2025 18:08:56 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25941d65sm236071b3a.63.2025.04.23.18.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 18:08:56 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: sam@ravnborg.org,
	neil.armstrong@linaro.org,
	daniel@ffwll.ch,
	dianders@google.com,
	hsinyi@google.com,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	knoxchiou@google.com
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v11 0/2]
Date: Thu, 24 Apr 2025 09:08:48 +0800
Message-Id: <20250424010850.994288-1-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v11 of the MT8186 Chromebook device tree series.
---
Changes in v11:
- PATCH 1/2: Remove redundant items.
- Link to v10:https://lore.kernel.org/all/20250423093647.4074135-2-cengjianeng@huaqin.corp-partner.google.com/

Changes in v10:
- PATCH 1/2: Add enum for ponyta sku.
- Link to v9:https://lore.kernel.org/all/20250328094034.3400233-2-cengjianeng@huaqin.corp-partner.google.com/

Changes in v9:
- PATCH 2/2: Add sound model to fix the warning.
- Link to v8:https://lore.kernel.org/all/20240914063122.1622196-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v8:
- PATCH 1/2: Remove custom label.
- PATCH 2/2: Change the commit about ponyta.
- Link to v7:https://lore.kernel.org/all/20240913031505.372868-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v7:
- PATCH 2/2: Remove prototype sku.
- PATCH 2/2: Disable the other trackpad to enable one of them.
- Link to v5:https://lore.kernel.org/all/20240913015503.4192806-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v6:
- No change.

Changes in v5:
- PATCH 1/2: Remove sku2147483647.
- PATCH 2/2: Remove sku2147483647.
- Link to v4:https://lore.kernel.org/all/20240906085739.1322676-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v4:
- PATCH 1/2: Add more info for Ponyta custom label in commit.
- Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 0/2: Add the modify records.
- PATCH 1/2: Modify lable to label.
- Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 2/2: Modify the dtb name without rev2.
- Link to v1:https://lore.kernel.org/all/20240902125502.1844374-1-cengjianeng@huaqin.corp-partner.google.com/

Jianeng Ceng (2):
  dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
  arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks

 .../devicetree/bindings/arm/mediatek.yaml     |  7 +++
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 18 +++++++
 .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 22 +++++++++
 .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 49 +++++++++++++++++++
 5 files changed, 98 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi

-- 
2.34.1

