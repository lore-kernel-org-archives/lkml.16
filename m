Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7023212C7FD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743154851; cv=none; b=FbQngGvMov6LFgWTJAPOUh37SFmDwOb2gduZRSuvFxoBMP0EQIs1do2rN9ZFsz/m90WrKd7SH/L6IhyvcXaYwPGQuyw4R/qbE5tiiBMnf8J6kguMJbzremRpO3oGUCXW6igxjqxm/xXXqEHtGs45zIlzEMZpLRWsbYn+VSvSO3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743154851; c=relaxed/simple;
	bh=J/E1teosypuOT98TQ3SC0NHR3R/cWdfmSa9jsLcUlCE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fq/WLtyWjZoD5u0BWRbJ07N0KWUvdvKPQ6yTanWbVkwHdZyA6ANq5ZGA3ZJF4A9e/3phqMLCKqX1E0akWjFQ73kwVzjjKbVU64VEDdllP66h/o1qyTpMpCAbay+O79kimXtPK51CNTxZC4DP07eZx92/gEjV7tiZOMIsiF2rUQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=SszOUnzM; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="SszOUnzM"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-227c7e57da2so32945745ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 02:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1743154849; x=1743759649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lVf1OxT8PGj4PYemPZVHKfGsO8vE6CKP1+cnxJtI79Q=;
        b=SszOUnzMi/X58bqhOkaDQlg60J4mK2/s8kWmeSF0yjfvqeQGCAJwx9hjhMdGISQtsQ
         w6LFrV1LI78T/IvWoGAdxrvPNxxqEeY8Ek2Fip4dogKcFJiif4uxYej2w0lVEPpm3S74
         FYcVVH88M6tyzOY/qSlYJK7OAaRIDgijb4xuDoOJ2OGgDgh45Q3PqWSe33NzapQpdp2A
         8o6F1AXZKCw1FxEK1Bj/K9uNB0/oPkEMIdVQVe1ZIGYPkjoyCFVyLxwe8h9x7F+hrG/c
         aXHioGyix/veMqTMxqggLdwMOjQfk1JoulbZHu+Ead0n2MhVaY8t1SVHsnAaz9nPsaRy
         FsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743154849; x=1743759649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVf1OxT8PGj4PYemPZVHKfGsO8vE6CKP1+cnxJtI79Q=;
        b=p3pMTtwSIOwDvc5xH+qL+XddCHXkwswgV6elE9hdeOlc1od2Nt/ELlJyN4L/7R08l/
         Xy0nQb7PIn5a5hArrLNf0llArf0b9iCm7pYQ/Q3Q/4WG4ZRbp9HPiZpPyZkr4ZAdxSaL
         ACgki0Whtxdezfma632xWy1flrLpaA/HrbeDY7opRJ6K5PeiHdEUWZevYHh/jyojfIXv
         tawjlzw38ofPaOoKPFEBUKMeRogd7y1W6Nl3Xlq2QtS9bCFiqqPAYRVlVowEDeVIuPa1
         jROsW2m9qRJFSFkKDQuWXCGW4Wr6ZUD38XKvMXFNetiwT9slzbGYVp93ESCLJDS7Cz/x
         oWoA==
X-Forwarded-Encrypted: i=1; AJvYcCWwsQU9wxw8U0jol3UAbAan8jYe8zD5MG9i7OLbAPNbH81si0vV/OqWTx7fKvkb8YQrLXqXIH6onXzud24=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLjf8fiPCeUBM0zJHqvL2N7x2vtBOw4+5ZxjBEMNPgJC2/6e0H
	EMj1Kr8Eq0E7xGXq3zOjqWgCET3KLCwDrlq/XfA4Zv4/UPHsceA55WEGW60w/4w=
X-Gm-Gg: ASbGncuwoJHz9LItVn5bSUBjx/73ZYOG/T3s70Q1S8AVulWNbM6yRnFChGL8qBXMtHz
	e1wUJK1sIM2tI/++BblnKFLxSqiarRBZuL/IKP+6vreYmOZTM5PBpdwUILpEE8mPh5PvxWSCvmP
	sxAfPSvFZWXmK11L3Sc0Vy6stqzPyUXnT+18K2lmGLGQ3nXWvlKhsJDLky9slj3+ilQk1/zxBqN
	8fOJOM9OOUL6CezD/YGqDiqF2Sf/aPvo5kJNuep/nlBBuyd9d8Cu3MLi3g0MS/NlYUhuKSp4Nx2
	VkJd2YhzRSURlWF2E6cHYZRTP6mNh7wg2KRH5trQRBNhNPJJAv5RnOwZKQBPK2yTH7OcmgUx6H7
	kSgY=
X-Google-Smtp-Source: AGHT+IHlMk3FT8wV80BXMjlruAdNjtASKILfG6spB3x0ZSEswoz0sZWSrejxGN07tV3Fa7SmSJ5ASQ==
X-Received: by 2002:a05:6a00:3392:b0:736:9fa2:bcbb with SMTP id d2e1a72fcca58-739610e3485mr11701752b3a.24.1743154848458;
        Fri, 28 Mar 2025 02:40:48 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7397106c7b7sm1283012b3a.116.2025.03.28.02.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 02:40:48 -0700 (PDT)
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
Subject: [PATCH v9 0/2] arm64: dts: mediatek: Add MT8186 Ponyta
Date: Fri, 28 Mar 2025 17:40:32 +0800
Message-Id: <20250328094034.3400233-1-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v9 of the MT8186 Chromebook device tree series.
---
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

 .../devicetree/bindings/arm/mediatek.yaml     | 10 ++++
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 18 +++++++
 .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 22 +++++++++
 .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 49 +++++++++++++++++++
 5 files changed, 101 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi

-- 
2.34.1

