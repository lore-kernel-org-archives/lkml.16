Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2072ED85D;
	Tue, 17 Jun 2025 13:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165541; cv=none; b=p5WaS8Tux8vUhgHwxY+CPSLisaeKW5+5b22bM8gCJpSSzKdgJJj3HkE2Fj8TkiIu+IzKIkdIXYd8u73gwmmDHfXVKRr9L02p1e/v+4Ru9bX1Xy7Wc7OYuP744So05FvrrlVPFRJ1DF54AqvP1ZPvRQUGWZ0uSTtZQFq6xTcLFn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165541; c=relaxed/simple;
	bh=CjRBE1GwYCij/peGP7Pr/kpb0jv0Qj4scpEUDQH+HdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rr+6bVrIFGakgnClLGiHRjquZph8pdcYMeTUxUW1wUdscjRTwlK0potd4iO66NlBG/DNmwHZEOKR21PqM/zA4uy9EUcsCCBuMH4zbquWgG6+x1qag3Smk2J/nYi3UYrDV9i2lpRYddBOLhte7g1CaPVgLcSWcJnNUPRM/OE7JSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmNnH6Gt; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmNnH6Gt"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso46806075e9.2;
        Tue, 17 Jun 2025 06:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165538; x=1750770338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zr3joDyrG8YVD5tA5mE0yPlBtRgX+I7P1+gf6yCVh0U=;
        b=fmNnH6GtkchP2njm7PHDbej+b5pxumTGiix/tsquJiM9ovt191sAi9r7/0FRi+ldnA
         QRZjZhw+fOGzD4jBWNqZ5G2Ez7SUrufaEN8McyKGcOUMd1YQvOu25/iSLrD4rsoLeYSY
         Lt+gstLLO2vISxat8BXxnr+Uuye5UTmHNXTpcmFPNsueSzUVh/obsdyYigbcLGXiJ+fK
         ZC9YOzzfjWW1qYPF8zz4R8g9JLwp6OyUyP6KRn4Zrmeq2xofVEy/ivXwEXkgCC2ItIyP
         5RO6gbnQLA7BxRcPY1Gr/pVpilwJhREr4Qcw1F1AFggFSzfo1hJl2GKwKOlcGoOlG3CU
         gdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165538; x=1750770338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zr3joDyrG8YVD5tA5mE0yPlBtRgX+I7P1+gf6yCVh0U=;
        b=ZHnmdr9z3MZcIUBbkJCoBJ+jiEfFevoJVH/1aWaw9e6Weph4UgYhYwsWLZx9NDWo/K
         Iai2wr8MmAHny/5xNLfF+0h0ygvjEj+Dbus3NKX+IJ3iJ/r5DTWjJ13ccMokRDgmjTFk
         jLQjRtfnTaNVIfru0I3L+eQnOLxRsWkGaNOza0ftc80V+smLg3o8Q2e1HHkWzwroO6et
         B0MAQuwHymoRY1JWfZ+7lY0HeNUl2U3r+b13HItMhf5ExlwkT2M5J7BKosKjR7n7GjvT
         UZQUhXiq0JBKlHgMgRRyuPw0Y4SXE3oTejspP5Dp/rBX/mYwnZF2DzCvD7EEfeYzvYIF
         GGSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5TICPXedxmMlQZwA6959ec1lW2R823ZglnTjxhTc4jeSdmEIWChtt0hDjH4GHyPP9Eje+J0XfGZC3+9bZ@vger.kernel.org, AJvYcCV+e8fv5w5GsBojvLHDAjc4KTRF0rurT4bVbLQKwzQLvNkFUxsAgMOp4k5xDAVLRIgW7GvbvWpWRyqP@vger.kernel.org, AJvYcCVwCibCuYaalAPN028/RlaYn9GyQ2E6LPLIZSnnlHZ9+0j2eZ1koi6Iqd0efOZioTMVJJjyrBgJqmxy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy90k5L+Ya8iKCrrVDSJIBZTW0HGgeJcJoE2urNgSDqG2xDWYSi
	PgOUAWNfqULVo2fshcKQFmo7ftZGpIgBb3DpXvYj4S+AXb3ZbDBE1k3T
X-Gm-Gg: ASbGncs7GoZ80jLLoFP19HfxdgYjZRAzLtu1sLHXpncfBmEstudTdR2OaV/JaDBRuep
	xz+xR0v5B+k4iS3Ru719/91Rr+b+/ZY1KfA0u3f9PhyrlIEMLfCWl5q8S50pTSJhxAyLxqqx3+i
	LUiPvbgMFFuNtshSqf190SYDiz5I/K9ZT6QtB3H7WiBB6m/Uzvz+VxoVFOSv1fUZ0VEX/85AjrN
	kixinaR99D8n4Fd7NBvttJU4TcQOMDXh5XQl14276tR3arXxho8lq0v6SRj6WiCThF5rb9cdzst
	1zKSmLuABeK/TNgjBVdS2pBFqfi/kLy1/rgTGocJRcLmy0u85kPYPR+Q8Yd+q1ZwgXRGRKLeMrN
	u0e0cyPCC7LtqWhq8pfVQOG1AGqtbFzE=
X-Google-Smtp-Source: AGHT+IEgl8TZdULuPnoT6dm0D/sFd3pQRKZBnxHF8Q6WLrbFfJ94j4FIWhqs7C69YgpxaH66Dk4T/w==
X-Received: by 2002:a05:600c:c16a:b0:450:cea0:1781 with SMTP id 5b1f17b1804b1-4533caad471mr126708515e9.16.1750165535827;
        Tue, 17 Jun 2025 06:05:35 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4532e24b0c8sm173809435e9.24.2025.06.17.06.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:05:34 -0700 (PDT)
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
Subject: [PATCH v2 08/10] clk: en7523: add support for probing SCU child
Date: Tue, 17 Jun 2025 15:04:51 +0200
Message-ID: <20250617130455.32682-9-ansuelsmth@gmail.com>
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

On new Airoha SoC in the SCU register space additional pheriperal might
be present aside from the clock/reset. The Airoha AN7583 SoC is an
example of this where 2 MDIO controller are present.

Introduce a bool "probe_child" to trigger probe of child node of the SCU
node.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 5236119bca83..00c80221a274 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -5,6 +5,7 @@
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/mfd/syscon.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
@@ -83,6 +84,7 @@ struct en_rst_data {
 };
 
 struct en_clk_soc_data {
+	bool probe_child;
 	u32 num_clocks;
 	const struct en_clk_desc *base_clks;
 	const struct clk_ops pcie_ops;
@@ -900,8 +902,19 @@ static int en7523_clk_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	return of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
-				      clk_data);
+	err = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
+				     clk_data);
+	if (err)
+		return err;
+
+	if (soc_data->probe_child) {
+		err = of_platform_populate(dev->of_node, NULL, NULL,
+					   dev);
+		if (err)
+			return err;
+	}
+
+	return 0;
 }
 
 static const struct en_clk_soc_data en7523_data = {
-- 
2.48.1

