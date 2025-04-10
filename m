Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50EF28A3EA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294001; cv=none; b=sWC2DWNMHX2oZZqyXSaMm1zYM4yHN22lmcfcsl6xOB8hZUBafT5LOosfoXkjwVtYKIMMAaz+df4MqHGw+jvLFHlObAjubk4+/qXKeIprikvO95TTADTDM3ISJbLO0DmxGcEypxfY0Vhpi80SJIvBZOQkZ9ctt28kLHV5CAgPRDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294001; c=relaxed/simple;
	bh=70O+m5jMJQAgg9qe/fZx0v9qZJUtTNWbcE/fmW9fTHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NMxjRldmjjFS55qRwi+sWXiAjRkU+JFlXRgDIKA0VjOHjOy6Y6bSX+cUz/pKkC7neU1Kyos97K7KmIFphrlGTrhQ3Th4pB+K4OSCHhOjeoKFbaSC9Ej0RTZX9H5bz91GWndk4WmEbTYMp225SjoitH3kUhTkTNx4wClnA2cJ1xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=AjHQi5o/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="AjHQi5o/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso6574515e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744293998; x=1744898798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cqmxZUvPf6V2A1Cezn9tnOYvckuzJKW+Y/kXwIn43p8=;
        b=AjHQi5o/hILZFwDbG7swqyT6AchVDQctb6uGJqopwsBDZiXdCkxoY0nx8nIpakOGWt
         MGhlGlqe7P5ZK0E0ul7J5VGQkjgG6kjs6xRZasrA7Ab2CZFNrDTmwoRwX2wso2CG8izI
         9EmmDEbxShbeQNpadwCJ+uD2VOTdwWVwL716j6acSxWyNBzLI6IdNlHuC0wRY6+92Sw4
         Q86U6NIU3duTyHJTNwqeOcMWPuUI5gMl3bqTdLjol1XiLv3YTMH5tihkOm4iINcv/RmG
         K0afDbjfCnEDPFUr9eyG8ge+R35hcA5CvG37/Tez8v/seeDBGnMx7k1qObjwODYYgM4G
         DXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744293998; x=1744898798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cqmxZUvPf6V2A1Cezn9tnOYvckuzJKW+Y/kXwIn43p8=;
        b=adJ30cjzYby8gXjObWSmmDHf44AvJd17EDC/AHxxNegJgNdsDuO3HxRigC+/kWy9Xl
         kh3k3nqL27OJfWQfEhEG6qr46WnJgRqrrCATMy2spxc+88xqnuwoaMSzBoDR6vrhftZ8
         8jq75NgjoRAK5PmBnZp2jI8graEoEXGt6ULXKw1UdN+F4WHHO+AQiZD/I20zol49f24z
         CzL4HqpJamZuNZ8l/WeX1bKlfIbxIIyppospGtZdhw8y9VZHwv2tVc6UkCcvBhamIXW0
         oeqkr/SxnTBT/jB5N9lx+Gjx1muhjp13KSSrpYPRNbL0mWFcJOceM53vJmciWZnb4lic
         Nz0g==
X-Forwarded-Encrypted: i=1; AJvYcCU/XxRN6x4s80dDviH8JRAH42guBvaD1dIm76fLvP34ylRuVxGknyaEZ61VsFS1kVVlxNcayIPNY72ci+c=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfpw/U7/xelD/kmPo231+w8NG+ACnrvkw5epOmm7SH7IGTYv6V
	I0jV65pwoP3KeuBAPyZExybrOWcwwfkuko1XGiyF1Lo4c+xO0+I4Y8RReWimX2E=
X-Gm-Gg: ASbGncvpUFTN0DismNwCKyIxrWhKDzk9eMZAh57vaS2wCXEllPLkdMqZQpp3FE3xY//
	Xdhqs6D0Q50DSlcL+5Inleg1gYTTJ64dk7PTNOP6/uaBAVEjiA2a6ARI0LX66twZpL6kC6KcuAp
	FbbjH8wuO6vkeAqXcN6XLI5gQ1DU4JArq1BtxsK3dvP6iUQfH5dPMzc92NAul1cMZa9WuDPXxh2
	b/67OB0OlEH1cLfV+BeuSQf8DQDUREse7iCnXCm+JaA/CTW1cO6sFRLiaHQFwhzZpLEd98s3YFv
	epxZyoCHTJR7A9gfS7CbFylGpPc5MO8mYGJac2NrxyjqHLAA6JzsIqU9EmmfZRVWZ3OiAg==
X-Google-Smtp-Source: AGHT+IG3Kkwoiog4nj2/Gc1J31GMD5PU0317zNvjLp4mPJY4J5I/eRdRLPfLN1hG/KXOYT+0675X8Q==
X-Received: by 2002:a05:600c:1d20:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-43f36c78b22mr2008515e9.25.1744293997785;
        Thu, 10 Apr 2025 07:06:37 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8937f0d8sm4806913f8f.40.2025.04.10.07.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 07:06:37 -0700 (PDT)
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
Subject: [PATCH 0/7] clk: renesas: rzg2l-cpg: Drop PM domain abstraction for MSTOP
Date: Thu, 10 Apr 2025 17:06:21 +0300
Message-ID: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
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
Claudiu

Claudiu Beznea (7):
  clk: renesas: rzg2l-cpg: Skip lookup of clock when searching for a
    sibling
  clk: renesas: rzg2l-cpg: Move pointers at the beginning of struct
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
 drivers/clk/renesas/r9a09g011-cpg.c           | 116 ++--
 drivers/clk/renesas/rzg2l-cpg.c               | 498 +++++++++++-------
 drivers/clk/renesas/rzg2l-cpg.h               |  68 +--
 include/dt-bindings/clock/r9a07g043-cpg.h     |  53 --
 include/dt-bindings/clock/r9a07g044-cpg.h     |  58 --
 include/dt-bindings/clock/r9a07g054-cpg.h     |  58 --
 include/dt-bindings/clock/r9a08g045-cpg.h     |  71 ---
 11 files changed, 622 insertions(+), 845 deletions(-)

-- 
2.43.0

