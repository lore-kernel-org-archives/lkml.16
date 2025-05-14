Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021D8224237
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213468; cv=none; b=NEkSUU8R/6YIMOT64AGZpk0HsM/HbjObbFRdc223eLrKDcVEo9vNc44b0VkPyp+P1cy43THBfm3QRylvrSx2k6GomygDlvQagQql9Xt1ltiqio6PICD/KLytmbZdDxUcuCwNOul1/HGojHWr8sgh0WRyw6I7T3XBTBX3wXoYH5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213468; c=relaxed/simple;
	bh=JnHdWEIPeM0wK2Ula9jh9MnaUM824531+Pq5OYIHFp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rIwzW12eaAwZuqTPsdefWAO2wyS9Dc71AE5QVBc0mRuU3d4AVFuLQaqCEFB49lej38b8GAQDV+rzZBqc5qPxGuxNDCa5UwMqMgj7rJsGCceFdk0KQ0E2Ynu9oIihJzArVilBXSzF5Jt8smA+JV8/Ff4m2Rrw4vRfppkNd4q+aiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jtUDPFa/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jtUDPFa/"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so73783745e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747213463; x=1747818263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7K4j572MT7sI790Ze+eK+i3Uz5b16gmlTqgWUGftrXM=;
        b=jtUDPFa/9Ql69jiYYVOviU7HYphSdOgrCUe+jrgzlzBI3DsL5reLSyvmAYj02UuQWl
         dTSujW6NhFwoLVU1S+/sqvYAKAFHx8jYRlpl+21r2meNs3a/52PvCqWkysXdLtUS9cea
         E/Xfv0sd9348LKvdcnHBTTALf2xU/P2eNPfq7mx6IvWp8l043q2P+C3wOGsKaC5szH9Z
         RdyL1HnUAUM5lHPux6WCw1yW2qJsPogGWhBCn1K5WY7IjRtxjOBpC6t/sdyjIzUoDrdA
         L1qvusUJkBobl/S8V9mVeFi3ZDeGv2SGyDdLAByntSQVSEcmn1ee51jhfSGszs1vM2AC
         wosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747213463; x=1747818263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7K4j572MT7sI790Ze+eK+i3Uz5b16gmlTqgWUGftrXM=;
        b=mSCKRe3bc6iAMDhgk4U8+TwEpiTvq3w1w3Gkktw/eSqTi6QhxD8ZGQdNt6A7/fLOCa
         7sKWTEg+ZmeDdz3cqOnAK2ASJH+xDphJggFAQLiEH+VR1CNPJFI3LXxKRg0nYdVqPGFp
         yM9XyxhmFsT0GpAMJaBb43c7K+KercHiFn6w0giNo/t01m0B6VeMyEIX8DtKprusJpBj
         FFkbVHPfBb7buZXHwyW2BU0UAMykmyddWkKv953nFEgBEdwbvnqBE9NKXNBjqQojXpV1
         Q89qqMiEFWUnGl6hUEJeJvJanYEANk1akugebYi7BWV01J7mL6jGHaz5EJ9ZQIhap3rH
         QH2g==
X-Forwarded-Encrypted: i=1; AJvYcCXb8KmN5HAcGvrP9qNur2aOchDcaUr+W3vErTtSAa+dZvl2INoegE3hXYGjb171/YBuG8dEMnJ2Wcqhheo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxE03ED4BQPZy/vjiAoIZJj5cGyRXWgRdB0G+nW32aPlDLJA3hP
	887JdxPXCzbUIAw+eo6HxlA1AYYg2R+Lcu4Vg6kBuTXcO/i9m9MQXKBnSh69miY=
X-Gm-Gg: ASbGncv8CLhgMEfpYTFgzXU8BQCSzF/CSebF7Zmw3x3GIyYrW/Ya8iQFBst1JfQWCfn
	TY+mok/+DrUqf+ossVvMjqx19KeHPDt3qtPzx2zhS8H0DGw7cDkZrVj5vQ88U+LpO+HvUyMA/gh
	L2BNp/Aqz/BiwEwgGfHCcEozWackLBcdv9nXmjIh0wU/5JoQWzQuskNTwDnj7sIJNiF7xTE5wqh
	LvDABttyPcvd3bMGrn3DyZ1LiS4ZZWrzpiUXW1R8tlQvNuB46riZGpJGzEN0Ziv16m+MkphR4kq
	7PgyjjqKw0abq1+17oZhBECOeGbl5Pbb353gM83sXoKSjg33w83wnfWhgUpFgpKbzXQNfkWI1pI
	bcGo5
X-Google-Smtp-Source: AGHT+IGdaeJMKgGTg/Sc7hL1ltOR8m+B42VrjYSEhJIqNaP+mgKdctUxgZHq2QuUEOmWT9ML+hI28A==
X-Received: by 2002:a05:6000:2503:b0:391:3049:d58d with SMTP id ffacd0b85a97d-3a3493d7b80mr2348215f8f.0.1747213463319;
        Wed, 14 May 2025 02:04:23 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfbesm19286561f8f.10.2025.05.14.02.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 02:04:22 -0700 (PDT)
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
Subject: [PATCH v2 1/8] clk: renesas: rzg2l-cpg: Postone updating priv->clks[]
Date: Wed, 14 May 2025 12:04:08 +0300
Message-ID: <20250514090415.4098534-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Since the sibling data is filled after the priv->clks[] array entry is
populated, the first clock that is probed and has a sibling will
temporarily behave as its own sibling until its actual sibling is
populated. To avoid any issues, postpone updating priv->clks[] until after
the sibling is populated.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- postpone the update of priv->clks[id] as suggested in review process
- updated the patch title and description to reflect the new approach

 drivers/clk/renesas/rzg2l-cpg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index a8628f64a03b..c87ad5a972b7 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1389,10 +1389,6 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 		goto fail;
 	}
 
-	clk = clock->hw.clk;
-	dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
-	priv->clks[id] = clk;
-
 	if (mod->is_coupled) {
 		struct mstp_clock *sibling;
 
@@ -1404,6 +1400,10 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 		}
 	}
 
+	clk = clock->hw.clk;
+	dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
+	priv->clks[id] = clk;
+
 	return;
 
 fail:
-- 
2.43.0

