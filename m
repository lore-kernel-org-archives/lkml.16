Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6621991B8
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836622; cv=none; b=ChDpeJUAbh3urbOblUx83IHyDrW4+2K/ytUmZ7Jqid75oHB5GVz/Yfz+1WKlLhEGIpLvyAvIJcviItjy5CMflZ5QwYxhvdDCJt1qQCg+sO0q/BrI5DX/fA7kUf/a0aBt/doQSLTpYDDvP/w7AT7/JTxvY3G67rJX3IuhY4RSouw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836622; c=relaxed/simple;
	bh=EGFE9fF8CoyqCcQrGQ5RtJ1O3HstgRvlsNO0EcsOKKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Es5VKCYlR+WtKcfykk6HOWHMg7vZTXLVkfS6i/F2f4GO67hkvB5iEcsu4Va9uis9ZJO25NGMHBbZ8jgbVeICXA4ty2RToCliQeopt2fmUNMxma5PHdeeARuyK9HUisiiGKJjFnYuKU0NrKqjF8O9qFAkQVEXTXLHLqxKQmRx86o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=h1gOxFXk; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="h1gOxFXk"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad52dfe06ceso580608366b.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747836617; x=1748441417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1CHusJ4ei6D6vHackJEhVkMXrFixKZ73PuOqrjq43c=;
        b=h1gOxFXkymt5ugbEYFFKHOVB7tTtFkFGsrSQC2FaVTZ5TarZVdDS9mYA7uwRe6q0ml
         VOrIW0FdUF3bFL/A+aX9B+roh1XYO6Xqzkjn5lHZxIg+lq8jPBi9eYnCH3ScPoSVOcsj
         5GV/hO/TKIIP8sgBbDVVpRTA7geFA2TlUK3KY3k1UAN9PVaffh24Kjrl5VzDm+5e6J9k
         w7GByWFqCCRym8WJeH//sb0Vd/UhNI6ZZr4nrfOz17+lNoeX4Xcp3YijT+IevLxr2Vzu
         71rbrRIhsEHBCiv4QAHvBh/NDtiSF5arkzWHgsb20isQ6qohrJTJqYNSZvA8qMjtbZbK
         iVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836617; x=1748441417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1CHusJ4ei6D6vHackJEhVkMXrFixKZ73PuOqrjq43c=;
        b=I7rsTPUFx1GCXdp0PPAiFnUCpIZTP0Rq7+ePaqMiyN789i+aecpTIvRhIGcwhm9R8c
         t8c/BJ9p75Bj0ZPYLGUbVHQxntLXTSTA+ogzWYUx5ygl5cjZOlRh4Y9u3c4BWa6i8sq+
         BUmAkU5cr8vgkkxLaVNQPpLjNfGvV7pIgS8ZEuzVoG6TktnGUsZfvGDJ4xl2FUyh3jGo
         35W9Kgc7ZE85EIxDNME+YhF4Fa9u+0jxzR0RWAGy00Iu4tw3Bn08myUOxPdsocWg4nS3
         u9YFfLAXIwL3bKt/X/sfIsLHlK6/uWvM3p2/lS71ld8PyUluNH/NNLLdOCSPCqXo9ubl
         YShw==
X-Forwarded-Encrypted: i=1; AJvYcCWkdpqzbj6lxnBDdHu/qHTuaHLspSK7OvPaa7xrwVovfHO4TVQnasKf/mcBeiHzwsq23RQ118d+i02rDw8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5hTa8wkXgCtZ+VMeoloYI2I9XyO5D90UpCnMgNnRHmBvJGtKU
	IDjzXDwduZPlOsHPgVzjqyX62BOv3HsSjZFGXeAE+uOixm0uneEs2LgG0WO+B4A2qNA=
X-Gm-Gg: ASbGncvB2ZyGit435YoHwdSHChpaDl6u7g9uVERmikEHZ0RAu+/wD8x4QWF7dUt+Ga6
	+p/9xzSUCZH8VrbQcgDGxhEmo56d8gWFbFJDo2FSsfskuyTkRJeESId0smiMafHYbcntDT3wDc6
	H7dWsfCh8HBJUFnEEk0XtsJmjabeVnbW4zfOl1luwVqk7U35n8nKDP6IyOdhWinzUk35cpiEzaW
	LgVTDRhYC1kwHEYl17XCK+EnFm47sL3nc+c31Pr4MrC6LwIK/cr0oRbSl0IhIR9V4hLzRfhkqqV
	hM0pw+bbW5M5aQOAAMcDfZjI7DVwPYhlmqBv6WconlElzroHiBe/4GHA1ldz/5X28x57vT7YOIs
	JkYKh
X-Google-Smtp-Source: AGHT+IGvqJR7e/kOZrWWHQJQW+m9p5RsEiN0pjfvxiINSPfnR4snDax5MoMW4mDXwqItr/FNVvG8UQ==
X-Received: by 2002:a17:907:7d89:b0:ad2:5408:bf1a with SMTP id a640c23a62f3a-ad52d64216fmr1934817166b.61.1747836616979;
        Wed, 21 May 2025 07:10:16 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d271916sm914552866b.69.2025.05.21.07.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:10:16 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	kees@kernel.org,
	gustavoars@kernel.org,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 06/12] phy: renesas: rcar-gen3-usb2: Fix an error handling path in rcar_gen3_phy_usb2_probe()
Date: Wed, 21 May 2025 17:09:37 +0300
Message-ID: <20250521140943.3830195-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If an error occurs after the reset_control_deassert(),
reset_control_assert() must be called, as already done in the remove
function.

Use devm_add_action_or_reset() to add the missing call and simplify the
.remove() function accordingly.

Fixes: 4eae16375357 ("phy: renesas: rcar-gen3-usb2: Add support to initialize the bus")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
[claudiu.beznea: removed "struct reset_control *rstc = data;" from
 rcar_gen3_reset_assert()]
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- none; this patch is new; re-spinned the Christophe's work at
  https://lore.kernel.org/all/TYCPR01MB113329930BA5E2149C9BE2A1986672@TYCPR01MB11332.jpnprd01.prod.outlook.com/


 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 47beb94cd424..d61c171d454f 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -699,6 +699,11 @@ static enum usb_dr_mode rcar_gen3_get_dr_mode(struct device_node *np)
 	return candidate;
 }
 
+static void rcar_gen3_reset_assert(void *data)
+{
+	reset_control_assert(data);
+}
+
 static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
 {
 	struct device *dev = channel->dev;
@@ -717,6 +722,11 @@ static int rcar_gen3_phy_usb2_init_bus(struct rcar_gen3_chan *channel)
 	if (ret)
 		goto rpm_put;
 
+	ret = devm_add_action_or_reset(dev, rcar_gen3_reset_assert,
+				       channel->rstc);
+	if (ret)
+		goto rpm_put;
+
 	val = readl(channel->base + USB2_AHB_BUS_CTR);
 	val &= ~USB2_AHB_BUS_CTR_MBL_MASK;
 	val |= USB2_AHB_BUS_CTR_MBL_INCR4;
@@ -860,7 +870,6 @@ static void rcar_gen3_phy_usb2_remove(struct platform_device *pdev)
 	if (channel->is_otg_channel)
 		device_remove_file(&pdev->dev, &dev_attr_role);
 
-	reset_control_assert(channel->rstc);
 	pm_runtime_disable(&pdev->dev);
 };
 
-- 
2.43.0

