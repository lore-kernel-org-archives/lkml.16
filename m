Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C2B28BA96
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658246; cv=none; b=VUnD24V7Zp23ggDCPp8n6tqvitJ3YpaxI7zeOSyTL+zc3sK5g28V4w8MWljvQ2fcx+fRqdJFU0os/85Nb+f4dEgSD/EX92J3wuXkQbdsOFZzINLpzw+jH9h0200eylzaoSqHWnetElA9rK5s6Y9hJeXY2amqIW2lKu3+HcvZPXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658246; c=relaxed/simple;
	bh=EAW+HDTqn4JOg/LwTabgEKzUOriy6DOvjcW5MZPwhWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TgFVBJ3wvjJw9KBP6WDLXwU3oy3o1c/Ud2286qx9U/Q03MoUprvdKvvzbVzxJwXvpiSuJd3/o2k4pN2M4AA+EdEzikJizLhxSvyqoApBgtLvwIMJ//5hCThOt4sM4dGSnAwonqptfAy3B1YsctyvxrU19d/egXdhQqSSh6PTXUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=gJfqfxuw; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="gJfqfxuw"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-86135ae2a29so432498739f.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744658244; x=1745263044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQupJEb/nO7YYkb/BsP/LHrq8C6tspApeBZ7h7HnR4g=;
        b=gJfqfxuwowCWsuKqeuAdkMSHl9bb8j8JZm9q4bFVYmzeyjqsV1AC+lVzKfWTOZXgnx
         t/QV5zuJ65z5pBd+GJTh7kPD8dQvIabPvOBbOCKrD/xIPZFaZcSCOwdaUP6mcbW2Z9km
         FOD6ZGCLJPltcfBiSzBt7Thvk4MPQVU2VZcMCFC66fraPhW5h2QzqYl5yHxzUaSvk/Jy
         0FKlCVh86zTXbkl9OV+Ene4wK9F66jp7wryNIWYl9affzYaa+sOuTobe1i8kXfjqINZU
         /QRnwkCec5BcYogPKHZVoIsy+2fJSiTXY5m2/ct6toJqp/IAithIxfwZnuh5p7QtGjOL
         jmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658244; x=1745263044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQupJEb/nO7YYkb/BsP/LHrq8C6tspApeBZ7h7HnR4g=;
        b=Ort4963ddOY9sQBoxKshHz3fIAPFgt5XfBlcWEIWMzEe2S/N/GfhGIEpLtRwWjRrrg
         q7gazo2Um8GQdz3mTXfdcdZgfdO8TSJcLOBbHxeP308Nc2jpKXUK6ACnKK9xBa8gLJ0K
         dep9EY/x8GYApmxwrFo62r1pEJ8NedH+9kMR++XjRHCQrNcUzcGu6wIbSENbVDpc9ZOA
         he9E62d8/Xc6B6pOpARyil2D+hnvCFQKwa92GYDOSoR2sOYY34Q/7NXKQxtJg+z7yBRJ
         XdekzT4cS3QaJ+INLW+jdKTRh/Hl/FxxoWSwdJMl/uGdFqIY0HHaJ+TGr6QPtR+sP4Ar
         xcfw==
X-Forwarded-Encrypted: i=1; AJvYcCVob/9FRp0M84YIWblywASZ6bpjcIqsVgCmBJ9O0p7Hs0MF7cM2p49q7BKVaFyvLAkJR+ruoOxLJ3Jdk1g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi6fOhtb+lZy1iFA+1yT//bd6mkV6n12aBz8CvqW8c0/FQrINQ
	JJbJT9IPVDxnTZL5spLjjtseSkOcDOoqWHr6ciFSKG/wtNpoD9k0aEtj3XxdKsY=
X-Gm-Gg: ASbGncum8DM2iTtIRmJt5DAwDoZKaIj/x699ob1VG7I1S33UEzN/7FrRQEO2pjqfSzB
	rBVOuo4dNJbMcUZhzt/bfj8J1A4ZxAi7ss2ieMK0NbJHY8uTtAxzoaYpLWz38QDeOCUu+Ul7ZqZ
	L6PzmcE4tVF0zUo8ua4KWmeT0sK1NCtm5UDsC2heYlehZh4ifhrYsxRHM/G3OaIwRXyAz/YaZju
	vbMwqHt4yuGiRBQNqh0G6gQuN0Ts/ctYtzgJ0bU/vgNq4BYatJfKuuiiVhADO4ZHL+Ci1UJS+cj
	APg/t+/oFe6XsEdNEqbi0LwQCfriR/9ReE2HeS+R8tAhIXbB0/4K00dgkJqHQZ+PLAhVRfBFhYw
	eNYfPWgTFU4iHkZTdf8fd4n4A
X-Google-Smtp-Source: AGHT+IHzgkKPo3rteT6o1FQjeZVctNmK9CtfxtQBm7TMKIVPM8zC+qltuaZQi09FYGKSfneN1EH7HA==
X-Received: by 2002:a05:6602:4145:b0:85b:3885:1592 with SMTP id ca18e2360f4ac-8617cc32960mr1403266539f.10.1744658243876;
        Mon, 14 Apr 2025 12:17:23 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e026d1sm2715662173.94.2025.04.14.12.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 12:17:23 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/7] clk: spacemit: rename spacemit_ccu_data fields
Date: Mon, 14 Apr 2025 14:17:09 -0500
Message-ID: <20250414191715.2264758-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250414191715.2264758-1-elder@riscstar.com>
References: <20250414191715.2264758-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "clk_" to the names of the fields in the spacemit_ccu_data structure
type.  This prepares it for the addition of two similar fields dedicated
to resets.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index a55957806db31..4db91c1b1d280 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -130,8 +130,8 @@
 #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
 
 struct spacemit_ccu_data {
-	struct clk_hw **hws;
-	size_t num;
+	struct clk_hw **clk_hws;
+	size_t clk_num;
 };
 
 /* APBS clocks start, APBS region contains and only contains all PLL clocks */
@@ -819,8 +819,8 @@ static struct clk_hw *k1_ccu_pll_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_pll_data = {
-	.hws	= k1_ccu_pll_hws,
-	.num	= ARRAY_SIZE(k1_ccu_pll_hws),
+	.clk_hws	= k1_ccu_pll_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_pll_hws),
 };
 
 static struct clk_hw *k1_ccu_mpmu_hws[] = {
@@ -860,8 +860,8 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
-	.hws	= k1_ccu_mpmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
+	.clk_hws	= k1_ccu_mpmu_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_mpmu_hws),
 };
 
 static struct clk_hw *k1_ccu_apbc_hws[] = {
@@ -968,8 +968,8 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apbc_data = {
-	.hws	= k1_ccu_apbc_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apbc_hws),
+	.clk_hws	= k1_ccu_apbc_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_apbc_hws),
 };
 
 static struct clk_hw *k1_ccu_apmu_hws[] = {
@@ -1038,8 +1038,8 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apmu_data = {
-	.hws	= k1_ccu_apmu_hws,
-	.num	= ARRAY_SIZE(k1_ccu_apmu_hws),
+	.clk_hws	= k1_ccu_apmu_hws,
+	.clk_num	= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
 static int spacemit_ccu_register(struct device *dev,
@@ -1050,13 +1050,13 @@ static int spacemit_ccu_register(struct device *dev,
 	struct clk_hw_onecell_data *clk_data;
 	int i, ret;
 
-	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->clk_num),
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
 
-	for (i = 0; i < data->num; i++) {
-		struct clk_hw *hw = data->hws[i];
+	for (i = 0; i < data->clk_num; i++) {
+		struct clk_hw *hw = data->clk_hws[i];
 		struct ccu_common *common;
 		const char *name;
 
@@ -1081,7 +1081,7 @@ static int spacemit_ccu_register(struct device *dev,
 		clk_data->hws[i] = hw;
 	}
 
-	clk_data->num = data->num;
+	clk_data->num = data->clk_num;
 
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
 	if (ret)
-- 
2.45.2

