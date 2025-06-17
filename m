Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D912E9739;
	Tue, 17 Jun 2025 13:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165535; cv=none; b=mlZWWSatveAOfU9dz7w867flPf/rjrC/mVq9bTssWRU0ixiRl/+mIJYYzVF8X97UR9xFfTKJn+N4Lgasc6CA6zbcicGvVjlvsmducBXPFFfPBO1cUSEdIzHfojw0ZKbuqIB1EznQuxxEU3GRv5JQok9oLtEbxjTx36az3OZXVzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165535; c=relaxed/simple;
	bh=gy9EihQWUOqWMrDjGs8fJ52CA6yqIfVbRGyKLsziOQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b8w1F1ch+jAgJyO3luC/sruZC9F7P56KmqPN1TTuzUzP6lDPYFN76ctzoPvTjOZwYZZC7Tz3kzrpq6dyINsxp93gp9ViDdhKwJfindB0FeFTCl+Nb+UcE4vd3J+zy0a8YFzjslvK7tdNlBi+fS8OrcIysAt3fAtRPT5zp2Kk3ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJGUH/06; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJGUH/06"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450cfb6a794so33693295e9.1;
        Tue, 17 Jun 2025 06:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165532; x=1750770332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVnsvGPdp8kOJCNExwlwf+OCamEiwIUeTxxXK2/36vo=;
        b=DJGUH/06npffG4OLpW3SzAQqQW260IGYm3I8/7CWzr+r/0dKXKrPMjwuPKAJ66021P
         aVQ5rZxbT4SPH5OhaCPMFk9eRlBjH7VCwD3Tlwohw2oOMBSGDELo1V10Uv4D+MmxPnOM
         LADs5wBfGJSqnBkXfzXFtsNhQd39+TSg/NJRHHoZliI4T4Y2br2Q9BvZYYcnIudKEF2F
         2brgN1LkOi5dzXLCqKsGZuDMWLCUIUfH9yhbBChUmO5cgtnsCzVCevru+MTyMXZbCUa2
         br+vdFGgchi/ZmbnNKh7goFR7Tnn63AtYCm4qLSHTGlTiLElvBtd3FnqVXaqBD2hqIDD
         3Qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165532; x=1750770332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVnsvGPdp8kOJCNExwlwf+OCamEiwIUeTxxXK2/36vo=;
        b=utU8zgCwoDXb8TCCRrazxnzaJTMfzY1FnJyMo1E2c1uK+iJnpN7RwbqD4X8MSwE2Bu
         u/X1sHH6KlNAiPcFq+uhBEtJW7BiSgRIvs1UiBZ4wGIR6ST9EOmSEdANZ5BanNKTD0AV
         kl3OOVI582XQB79/Ml2MTq4A9MtgCePmKhtMw/LOdY607Fb2r6E5pe4RLmWdo6XzIHUf
         BNF35byzVwmt9hxlhcS1X5u3h2NDKDpBMy4OtrYUQHbmfESghDMpPBeXzCdRUgJbTrk4
         zAqLyTJoP17DOeCCs9GqyBZF+q/NrtFWDQEEtbbQaGxCWc5gvsbwIBzjG/RVrkIf+zAn
         OHsA==
X-Forwarded-Encrypted: i=1; AJvYcCVFwxBlNHQ8SqxuOLfQZADgs6o0MEw5q0IBQGmYotHu72T+5FNf8iDw5ADbNuCpkPzyOHbAGSb8BVveVOaf@vger.kernel.org, AJvYcCVTMD8h3CKnPn9IAmcYgbRP+z1FyQaQMAeaSYGwwD7tQYwkYVlzhsncvdnYawTn35KaSfdhehm5zEub@vger.kernel.org, AJvYcCXswxf0sEvgYngkytX9aqdElgnCFMpvUQjInLJdazv77K5+iDAgYbNYIL6ey27UOI1Ke9lhEJc2bn8Q@vger.kernel.org
X-Gm-Message-State: AOJu0YyvrUWr+ByosEwrBmxbtKkdawunKOO90SEOBKZYD+9sIx7Njkgy
	KxK4UA5civlE7YLxW2jnfcTIuq5mU2NRngp7qVECkXoJDLQjHPH0oJs0Rh5VOg==
X-Gm-Gg: ASbGncsCQdCQekUm7MbyHpXVAujW36Z6hA7YXBDgGalP6Ll6QbWdQ2qHw5HARoU4jKc
	dh6bWNWrBIIBlBDiUFEPVS483JgN/lxjUuzaPP27GHT2lksjj4Ug175WRVwuJgguuDjIhF9MFdO
	V6ITcAjEK5wVoftGYfMedgwAsZd3psJz6DSk9TTQ6h+lqvi5wvwB4ZvLYSZ3kni/YmrnXC1mmrt
	kNSe17e4k2+wELt1KmMYaTveBjMQiBtIA4jUIhXjE8UNOpuEdNEdQKxTIx/DNIEIkgyvV7M7VUA
	EVApJX/YZMBOPlqACCqs2bJ0hwmkDoGZUVWhHkcELfwYwtZUraZC5OChOhHni9vliWhFdGmUGaP
	uGSqxu9S3Ee8B3fKerHZ3/SKGCxKROGE=
X-Google-Smtp-Source: AGHT+IEQ0+4uRzmeiRfzysBn9Qv9S1MOcz/99or+Qrwz85swfgbkKOj/nhnsMfJEL+UV5ugmcEqFdA==
X-Received: by 2002:a05:600c:8b44:b0:451:dee4:cd08 with SMTP id 5b1f17b1804b1-4533cab38b7mr112624025e9.23.1750165531251;
        Tue, 17 Jun 2025 06:05:31 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4532e24b0c8sm173809435e9.24.2025.06.17.06.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:05:30 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 05/10] clk: en7523: permit to reference Chip SCU from phandle
Date: Tue, 17 Jun 2025 15:04:48 +0200
Message-ID: <20250617130455.32682-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250617130455.32682-1-ansuelsmth@gmail.com>
References: <20250617130455.32682-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for support of AN7583 and to make Chip SCU reference more
robust, permit to reference the Chip SCU syscon regmap also with the
"airoha,chip-scu" property in DT.

Legacy implementation is kept by fallbacking in the absence of
"airoha,chip-scu" property.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 54c0462c0dee..a768ba71feec 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -846,11 +846,16 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 			      const struct en_clk_soc_data *soc_data,
 			      struct clk_hw_onecell_data *clk_data)
 {
+	struct device *dev = &pdev->dev;
 	struct regmap *map, *clk_map;
 	void __iomem *base;
 	int err;
 
-	map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
+	if (of_property_present(dev->of_node, "airoha,chip-scu"))
+		map = syscon_regmap_lookup_by_phandle(dev->of_node,
+						      "airoha,chip-scu");
+	else
+		map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
 	if (IS_ERR(map))
 		return PTR_ERR(map);
 
-- 
2.48.1

