Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646642ECD2E;
	Tue, 17 Jun 2025 13:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165539; cv=none; b=YwnisK66B7PG2CwemLAHVa9t+pG2XXnxOIVNlLxZ7waUkXspNwglksbsDJuH2OIkshKzRc/j3WFqFFq5z40/VghtWhFX13nXaVHTBJ7rDFuFMfyrNg4ptSOZVx5HOtMTb+Vm+v40ucmjDTgCEXZBa87lC6MqX0cDLzuWp8N1gnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165539; c=relaxed/simple;
	bh=rFKhPTXTND3U4QpVC9pqI4wgW9nwGhqKP7Tpq4DOMl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EOuFDlD+8vMuCdorciJF13ziitu9gWdPBnA+8MpkUpp8j53SSJh77xkR768+AVYffDfALjgkd0bUW3hEfoIW2E8Ls03HnNmDjUvNf/sh7S6EknxjgK+VHlra7V20F0/Z+tG6jGHJjQthHQjWlnRoWltp6FlEk4/bkdO4M8yWReE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXfWRFIk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXfWRFIk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450ce671a08so35642275e9.3;
        Tue, 17 Jun 2025 06:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165535; x=1750770335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6yYKuc9rkME/HWqOAI2uRCSxowfvwU6UNZAyixXIx8=;
        b=KXfWRFIkC3ie/jncaY+mfNl3LBcNps03Qo/SEgdppkk1BnuVHEi5genKnEq2AOJa4d
         n4YjPIBMpD8dVvPNtKRDSL2OGhUXuITPsyzKSwbrP3NFZjue6ZtDXY8v+EHgnC7o3m4C
         YXmtUBRvK9MNVfc+K+fziP5zvT4YafjKifaByNb7nSgad/guuNHF+0GEwB7OwJ2Cjz0D
         MKXIfhuYhOe1Ow7bl9r+9unLfT0PsmaouXurhlZGk35PEp7+jHgSAEOi/j5ACg1KEiH/
         tQt9Ou3fKm37Usn6S3x7Pdwf3/6wOmjIKLnqm/wXjbfP/dh4klVabucxVV21ZYF0Pio0
         NluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165535; x=1750770335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6yYKuc9rkME/HWqOAI2uRCSxowfvwU6UNZAyixXIx8=;
        b=BgevpToS0YEJs97TltAvj3eZZwxemec3ONEttaDvXv2gJ0CcXLVElhGLmXpDjX5dRl
         llzqlpioeo/zoGtoYeOnUYzVY+gmziktXIrOooyc8TgKbjp/YLXu/9P/bslqdpSSX+2U
         RFaXLoVYYR0VsnsoE37acrMjOLuuUoDYJKFZaR7IRd51lLRjYxyyXLmmdFBlKNLel3n8
         oH7CZhdybwMxRrqYWsfHAaJfjgGZ27LcontUkEjfpORd1FayifKLVdesFaf43dAPxBH3
         jKVIs6eBfEBxwYrE631ohjcgJI54g9hdJ7p/m6veTC6ZIe+QmkBPLUYF3+E4bDbWvv4Q
         wIiA==
X-Forwarded-Encrypted: i=1; AJvYcCUa8OSo3AKXdwiVr4iRM9nI3l7s9pvMMxEmd7LMNNQYxwAB3PVaQ/P/ACRfwBebW/0UwIs27rLXaN4N@vger.kernel.org, AJvYcCVCD42Rh+otuFZfbMKdk2t8PpU4M9c4+pLeQGBoGjDwaud+zaEdpIXhIQhcLpYBpdhypXcJJTw4Mq4zdyY2@vger.kernel.org, AJvYcCX62w1dO6pz+HGm3E+9tWIXZDsVp+B2Ojaj75W9P1TDAtMmT242r9l7mjVZ8S/cqL+0mtmRl74Zac+p@vger.kernel.org
X-Gm-Message-State: AOJu0YzVnup4/voz+KD1wPd9iN4jjq82y+V27s3L/hdL05npAVT2Uv5e
	rNEJHAWnxLm/Xpf0GAjw3lSJxOLC4ZwRfKSmg/MneUkbWgnBVfGx5OiZ
X-Gm-Gg: ASbGncuGc/+ONu5c1ue/itx16t9oMT2OGLF8eDz9K+lctz0hNsGeyy8+twOPG07wARE
	AvbNXlPrjD6YK0xtGOLAMDthv7PqGp21jBOZGXs1wAKrLKpIR8y0/IaVv0TP8RwKq2sqRk/e8YJ
	TBvON3nD/olNsqgR7vQGrauJFHasLvR3EZz5+pjmmmxPaYatS6+ZEhNuB0748VFY0Hs/ykGSRE3
	uXG45mjxZscMJBG6UXXMP1zAE/ouNgUilhpE08+Z2CVoJ+BIX6ScKxrSe6geAlvNt6QzCnKiEVb
	HxT3uw2J9bHQVhT70Dpu32N2H4za7EvnCxixhJwj0Wq0r2GL8IB7u1U44gpDDVNtVtbUMFuqhoT
	seo/qQNm7Baf0g9KxmCSZkZzLLwPTDik=
X-Google-Smtp-Source: AGHT+IHUEAOIpFoiSc6oko/0Z9/8My1r3kxo0YLBxab06jyDQ8PBvO1+0YxLLdxfKXw0tr6IO8yLxQ==
X-Received: by 2002:a05:600c:6097:b0:43c:fffc:786c with SMTP id 5b1f17b1804b1-4533cb484e6mr124983065e9.19.1750165534067;
        Tue, 17 Jun 2025 06:05:34 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4532e24b0c8sm173809435e9.24.2025.06.17.06.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:05:33 -0700 (PDT)
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
Subject: [PATCH v2 07/10] clk: en7523: reword and clean clk_probe variables
Date: Tue, 17 Jun 2025 15:04:50 +0200
Message-ID: <20250617130455.32682-8-ansuelsmth@gmail.com>
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

Rework and clean en7523_clk_probe variables to make them consistent with
the rest of the source. Also apply some minor cleanup for pdev
variables.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index a768ba71feec..5236119bca83 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -881,25 +881,27 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 
 static int en7523_clk_probe(struct platform_device *pdev)
 {
-	struct device_node *node = pdev->dev.of_node;
 	const struct en_clk_soc_data *soc_data;
 	struct clk_hw_onecell_data *clk_data;
-	int r;
+	struct device *dev = &pdev->dev;
+	int err;
 
-	soc_data = device_get_match_data(&pdev->dev);
+	soc_data = device_get_match_data(dev);
 
-	clk_data = devm_kzalloc(&pdev->dev,
-				struct_size(clk_data, hws, soc_data->num_clocks),
+	clk_data = devm_kzalloc(dev,
+				struct_size(clk_data, hws,
+					    soc_data->num_clocks),
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
 
 	clk_data->num = soc_data->num_clocks;
-	r = soc_data->hw_init(pdev, soc_data, clk_data);
-	if (r)
-		return r;
+	err = soc_data->hw_init(pdev, soc_data, clk_data);
+	if (err)
+		return err;
 
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	return of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
+				      clk_data);
 }
 
 static const struct en_clk_soc_data en7523_data = {
-- 
2.48.1

