Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE402566DF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745401016; cv=none; b=Oh2rS9Je7zU61yEMSqwtHbQSoAt2U0MVCrJxYZE/lralMFgjwJzRokvkAsO+syyZO8qG5V1aKCo8A2YukEcJ5uEmMWDN9LiMdT+6Fxsrqxsg+8Nm/jV22dRj41HHO04FhNjtw9+D1adrvhaM5IdRqcINRwaWZ2hFxU0DEp6riBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745401016; c=relaxed/simple;
	bh=ay9u22d4cvFKC85mIYrra57bfWbo2XoJZcsvh3N3gJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KtDDxsgCi1jWZGzwIOHE7swTKCVTHy0nBSBNRe21D7I886A8n6YAXSdRGnfZcDRnfS9+eu65uNPMyGYsrzJqb+rOJ8gdRFMc4FDLsUWMmMwBn5jf/bMtrBl6/1lBJZUb31DoA5zv3XU2T1hHMHpgfMlyj42hBgxLOCWNOi2uINc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=Dbhj7gOF; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="Dbhj7gOF"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-223fb0f619dso70942175ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 02:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1745401014; x=1746005814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+QxK+Tc2ZVbe+5BePsqof8LIo5Vk1Mj0GQ50Wfpr8bE=;
        b=Dbhj7gOFV+B34YuXHtX9JuGgWgkuefUxRvKYSJhEw9ZILYOljTiMRbs9wRm/erbg/i
         +I+WS+jF/WokutrD4Jga4qdFQSTmwV4CwCBbe1VXkzhDmM5sObpq8uwZJM7hmNz2lb5S
         UTmdDdvjIYg+chSeQKeRiksAd51HF4Fr+O+by7oZlxTFilCV+qlcNTWeAZpXDhTyYnv4
         bH3TqSxMUmzGfoiQAyjRKMZesbYjEgKQQRe+Pjv+rHOXxjtoc6xWWB4dW2WzUasg3FfU
         8dcuMwOLpvByJDoOSA7TLBqVVOSRSp5amG8zN0lBb468MjCGT7v3LqXkIiLOi3P1Ghh8
         3W2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745401014; x=1746005814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QxK+Tc2ZVbe+5BePsqof8LIo5Vk1Mj0GQ50Wfpr8bE=;
        b=uqkgHMMfD/cyrjvCEZPZnU2AVAo0Jx55of0kz2tOxwco5QM5qi2iSgAkxUGBf/o8Bv
         RvaDgWwrQd44643tsa95dKTFcYEmcHdiuA8AYY8ylOdJiY2Qai51h4eoLdF9VVHvSX2W
         +oZWdy8q7JZEppVbw+ozXnFvwSRd6m48kA8wkLrUIekWtkRc9kimO5mDQpjxsRHwvk5x
         25miqDAQHUc4iO3yWcwsZRmRnn7PduWkV4Sp+dIp1j6xVt1UAn12nbb1Q7X+PfLdT9f8
         L6y7GcagVsWDoD1ZXMk0SgGXlDNPVqc6TaaVNCeTUXCFF6oU7v/okzDnw+sOS42/9YRM
         3o1g==
X-Forwarded-Encrypted: i=1; AJvYcCWfhA84CeSHNUJbLXlX/LQnDKuUnAG1IQBMZyy859a6Fufru2b4TBfcCt0icWRIUIc1y0TLIf/M3Yz9szs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgmOcv94zFNC3zedfr0UWqIXn8EB/q/TU+4py545AX/9cCOCOj
	R1z5AaFWk53X7MW2x7uNbpASHD7KBHyXfZVWCkeM997NXYvyox0QAezYfy/OqGA=
X-Gm-Gg: ASbGncuiawDVGVdMpSXdfp0HiZHW6HGyzhiQ8IguaI6fMagAsykz1T3+EbX1bzhlsQP
	5AOC1giSvdfyUb4RoD6Y8diLflsLIALK1GkQanZHk7uUbiBK/tVRNQk4ipu0eKy33BieQlmuJgq
	O581OwieYzCx55eT4oMbdaR+edxo1Dyq0LAAlgytTDKVsyYb580QJwr2M34JngUt3BzC4KmU2Sr
	1H78EY776kO2whlVic4epeubkwsS2HymWDqOKEZXjxMYESYdaTlaG5gRzeEEVQSW94EI+9MKTGs
	EPwbCoPqtiXJ1Uqwq5LgYJ1Pvbzr9JGjnGZGNgW9fyim1McTXjoa8f273fQrsEohZIIXT5dWDv4
	=
X-Google-Smtp-Source: AGHT+IFGuOW6Tpkgou6NY/aO5b7J0ZgNyZb2L7+1Em7PC2gecYR8PaSxzzzBVlry/acNwbDrg5EeYA==
X-Received: by 2002:a17:903:3c43:b0:223:501c:7576 with SMTP id d9443c01a7336-22c53583deamr299094675ad.12.1745401014467;
        Wed, 23 Apr 2025 02:36:54 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ecec54sm99557885ad.168.2025.04.23.02.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 02:36:54 -0700 (PDT)
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
Subject: [PATCH v10 0/2]
Date: Wed, 23 Apr 2025 17:36:45 +0800
Message-Id: <20250423093647.4074135-1-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v10 of the MT8186 Chromebook device tree series.
---
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

 .../devicetree/bindings/arm/mediatek.yaml     | 13 +++++
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 18 +++++++
 .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 22 +++++++++
 .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 49 +++++++++++++++++++
 5 files changed, 104 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi

-- 
2.34.1

