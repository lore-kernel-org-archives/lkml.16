Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9A5222590
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213465; cv=none; b=SvlmNJ+65fWZ+JGKAvS5f7KfXw0RKDDSeciaCpUY+1sFBltlPIJGZROoXVkb4BK/ju1ldpfW48J2bQBYUtRFPpZ01jLr+CSfOetDIum3c9yG1Nr3JLFID86Sk0rr/YcohikiQSLwn1tGKfS6neWBy7v5SHrF2sq8MNpDOvQcOyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213465; c=relaxed/simple;
	bh=5K9vutlNbCySpn2mNDTs4+oqYbErEJzRkyHBo6CSjUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jrsJ0kq6eh1KgveOrVvq26TLxIQh1wkX2JyXd65QopcQaoFaBsUqlDxUb7zjKCvvpSQ3elkyPpwGip7w9Tu/JaDoJ/B1zf32JbqYiZleXDv3DEFWf/j4DMWmF8MYcj1nNL9KeqDnH9cOHQKomNVmcsWHpW0fLVMIdAxoaA+FgGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RbivllH1; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RbivllH1"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a1f8c85562so3427372f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747213462; x=1747818262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P3wGtNITHa0U9o78hhbypZiCBzOOsk2GAy0wSEWd5SI=;
        b=RbivllH10Q9QTchRwQ9uc4Dd2nm5qVYmJvwQABgbkSafJB3aDZMHSR5dw5S2WpSSH8
         aGbqu9ThmPKGNDHezRGtYQFVa1SH3WUUTo+CLWISHirFmnsJ+IYAg/5/SRMiZWSa/WJu
         cO22pWZPv//sbZpldEHSZxwFBAWU7cyEoK0mAuYCQZ16+b2GfcA5IUsqm6Isg64b3yuN
         dcvQ/zjf2rTkp1i6ahze4XzWjngOroe/hVushea33xVxjb445peCXwgwhbnAc9x/RYh3
         t22OsS+2KWgiYVnBN544tgdt2vNgH71RT3zgUjNi3CEUpcAnqYIHfms0muWuHf93R9fg
         rNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747213462; x=1747818262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P3wGtNITHa0U9o78hhbypZiCBzOOsk2GAy0wSEWd5SI=;
        b=CYtU0E0xJUvV2LOk+OBK+O33M2+XGTe3kiFGMCoVyG+1zQJUXs5uVhwn6UZ7Z8spvx
         yO5JjMb+fDHJ47YOb40HqiaXhBmnqDuU9CD5fIUbjS01noVSdaVoD8s5aHgCSYzJog8L
         mCW3COz3875b698C549ml/VrAmeU3Lt8b1zamrZyDqQJQ3XI2vDO86v93grfWLlz/uhC
         mp7xREFsvjarMDdFZLYEPFDS0HVTwCcq9qMRknceJbVH/1rS5oI/XEejzspYysnaMN3Q
         EPMBVf5DYZ8X/NnwiPREVf6XDXDD0GvueDKGqyeAlLMisfgAdLqWzXxzX19E76O+Zdfy
         Cxcw==
X-Forwarded-Encrypted: i=1; AJvYcCVkuDqfEdoi3lSQ1HEL0YIzks1N6/h9HbIMvHw6osnJjem99VwjGAugy/qtTli0x6/xDleROj0TZhDha2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYMjUBE/prJKJBdwA/mEI+PimQgUTGSnysWJcpdKqYPN5pghSb
	7BE62FrgEg0oUe1fJyohqSofpP/hVcvM2YTyTPmHbrhBEMiW5rk8XFsynXSeN54=
X-Gm-Gg: ASbGncvweulP7HiTdiqrxGGgcTsP513dDjhwIqAtyMozeo9BDh+1UFIsSQcoiVAKWFz
	7cz9DWbOSGIQRv4L77lArHTlH3KzrmMz0TIcdLfs3/gGB8tNa4F7OHKHrEKBsiWxcr2ELOQ+ZXv
	qB5JSD/BE3O5Qa8qoLM8yYzFkcq2SraigcUnYZxA19qt9GElYTxkBnajaTim72D130ZrLnHIIZu
	hBtYTna/7TYc2ITE2XoBNiAvfWLC/xXc+cyAcGihQxA4S3+iSuzaXprphKYMxRVHTDVguiehAKY
	144a/BDtCX+Cuzk2QgJMA9ifPknU1evvgQjQokspJAXwpGDahs9pvyzaJtZUc8iAMX4Jg/qdOBo
	Zh2ESvW1oS+6SchM=
X-Google-Smtp-Source: AGHT+IFjZxHD0RqKbm4Bz/XFWoN+olN+g7TOLkSX6yfDvf6e23UqKDyHNvx4g80jZ4+20Yv+zITBSw==
X-Received: by 2002:a5d:6342:0:b0:3a1:a96c:9b76 with SMTP id ffacd0b85a97d-3a34991decbmr1659237f8f.38.1747213461891;
        Wed, 14 May 2025 02:04:21 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfbesm19286561f8f.10.2025.05.14.02.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 02:04:21 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/8] clk: renesas: rzg2l-cpg: Drop PM domain abstraction for MSTOP
Date: Wed, 14 May 2025 12:04:07 +0300
Message-ID: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series drops the PM domain abstraction for MSTOP to comply with the
requirements received from the hardware team regarding the configuration
sequence b/w the MSTOP and CLKON bits of individual modules.

The initial MSTOP support for RZ/G3S was proposed here:
https://lore.kernel.org/all/20231120070024.4079344-4-claudiu.beznea.uj@bp.renesas.com/

There are no DT users of this abstraction yet.

Please share your thoughts.

Thank you,
Claudiu Beznea

Changes in v2:
- updated the title and description for patches 1/8, 2/8 along
  with their content
- added patch 3/8
- collected tags
- drop duplicated mstop lists in patch 4/8
- detailed changelog for each patch can be found in the individual
  patch

Claudiu Beznea (8):
  clk: renesas: rzg2l-cpg: Postone updating priv->clks[]
  clk: renesas: rzg2l-cpg: Move pointers after hw member
  clk: renesas: rzg2l-cpg: Add macro to loop through module clocks
  clk: renesas: rzg2l-cpg: Add support for MSTOP in clock enable/disable
    API
  clk: renesas: r9a08g045: Drop power domain instantiation
  clk: renesas: rzg2l-cpg: Drop MSTOP based power domain support
  dt-bindings: clock: rzg2l-cpg: Drop power domain IDs
  Revert "dt-bindings: clock: renesas,rzg2l-cpg: Update
    #power-domain-cells = <1> for RZ/G3S"

 .../bindings/clock/renesas,rzg2l-cpg.yaml     |  18 +-
 drivers/clk/renesas/r9a07g043-cpg.c           | 132 ++---
 drivers/clk/renesas/r9a07g044-cpg.c           | 168 +++---
 drivers/clk/renesas/r9a08g045-cpg.c           | 227 ++++----
 drivers/clk/renesas/r9a09g011-cpg.c           | 116 ++---
 drivers/clk/renesas/rzg2l-cpg.c               | 493 ++++++++++--------
 drivers/clk/renesas/rzg2l-cpg.h               |  66 +--
 include/dt-bindings/clock/r9a07g043-cpg.h     |  53 --
 include/dt-bindings/clock/r9a07g044-cpg.h     |  58 ---
 include/dt-bindings/clock/r9a07g054-cpg.h     |  58 ---
 include/dt-bindings/clock/r9a08g045-cpg.h     |  71 ---
 11 files changed, 603 insertions(+), 857 deletions(-)

-- 
2.43.0

