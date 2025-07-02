Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCD4268683
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456242; cv=none; b=IxIOkzAp7xK6tG6MlJyULZRGyZmKeRW5WEd+4TeXD1ZUOMpvMGg/HrnU0FBe1EOd43QzP3flcPBjTgejzuzMk10TryPmRorbFlvdTE8rD+jJypHnFXzH7g6VR/Nfa96BrE3cQ5AdganozNQDoVE5C6obRL1SGGhKUt8G237ldZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456242; c=relaxed/simple;
	bh=x2bb90yd/z6BGWxPn6MrfwFL9GBhzPEVY1PUSblaovc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ivPJnjLyrgLPACNtxQR5XbO7qEPcdRd6Gc9/i8VEogDUm0FUhVE8KXGNDmlEMhNRDPdm2SR2uCydWgNTy4VBkc3m9Q8gIUFhplUoBntz4jV7Juy3CeuAEuDlJ2m0D7H7oKVZdiTE7UYecdZ6fY48cRAs8VJPQuHxNdomV6MG+wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=xXh8Eplx; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="xXh8Eplx"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6ecf99dd567so58818836d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 04:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751456239; x=1752061039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cjpgt53WofqzbGA4fRWGXisKKHuRc8Ezyw19NVROhHY=;
        b=xXh8EplxjdfpnP+gfWDM6G+WCuBEHzG+cfxhoHZSeOnQBtyICExtGRlyPtnMWbSkNr
         qR97m3+8L/MmUNRkU2NSEZK7ekQ0fureCl4AwPcSyAlxkJzoOHGjnzipbRLfTtCt6QFO
         WwPMxT2Ef0JT1Jt/4Dlb8PoZYWG6YQdNEEtLhnSrcpk56wAhtO6WMmN1gZQyf6V5XpFO
         8DZQCwVHZGeN+xcvPM4/Wbnv9IfPfzPA6rIiJPMMEOgyWWniVlpyULrIRaQ9nkQhkQnZ
         Of6P4tv46qD/RnYBCLxZea013N6wZIG6BVW7/rsJ8mt7RjaR4Zy5nCm+WTLqi0aKJLfA
         TxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751456239; x=1752061039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cjpgt53WofqzbGA4fRWGXisKKHuRc8Ezyw19NVROhHY=;
        b=pjYfOg2QQYaVl+aXrpPAg0RATWdhvbm/mPdip/9K22zeSZ+5g+5nxTxolYmJbAUbjS
         uuIcdHfWGJQWw7tOCTrhuQacd7gCw4lV/sIaIvkfS+c7VFD7885+iRcu1hzGFuLQ1wUg
         LQKz80UQSOZigpgWT5SAaAgsC2+q6m0YBWzvDOvffEoMCa7BVZziXl9NuLkZvyVAR8fO
         ZKes0cKvyjSke865u9GOcTtM/c0sYcg1Eqjyo7c3NoLSK0/4WTc3Pejjru/EcLOhxmRe
         fT+OOWgYVmM8QKB79w3VhNExIkaDSojMVoc02Azmm9fS4s6wPD5qBnlGG9h4mCOCe73L
         /r3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUonGbjs1BRolbRWge5wNqFwzqyu48p0qD+26AvO/GkBJZghQh4f5fJVvZT0CsTkykArtMDo020jhOPbw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2iTTO4HxSHkD12TNE1fgggPWZgc2t9pCwr658bkSiMIREAwLy
	FhnsYic+VksDgVY0YDzoK0XIZ5ouCe94bWo166neofHjp3yBVa1rq5lC9RZoCKVBIOw=
X-Gm-Gg: ASbGncvcg70uMknsiYNh4yd28Q8WAvtFq2hRoI3367pibVgAwEY2CEmZ0gHA6mKa2hC
	LAOk/cUCkaI9fYfBwgQibrj24ImjmdTV3ZRt7QEHdOnv2WqeSu+4r9a13u5lYpvyk5GX10vpS9L
	ZqZn/U8MZU8gLgCjxZSaoSW7+j8H7skrxTAAfHddJL3nC7PkbsVrvHJ2ca/nxJ+zzJS+sPGpUDR
	07f2V9SgQktDfdJKxM6tjDOA/muJTSq594mR31t0BlMoGOiJjpOrdHTykSQEogyxoCrXZ9SwMcf
	xS+9FYqFL7CkhbzjjTCRN7qTiD2AdeqMoKDrTt+DXX0hZ8YfqgwZ44ZkhNtvk1jOw8YT30W589H
	7PKH2ytRlsPRgmnxUb18UfQyzwyq+z34VeaE=
X-Google-Smtp-Source: AGHT+IH3LET1MT7KHlQqUntAkhS1H9AgE3UHH6mD+JJGc/1gby2zMVvKDZcLFLc/p0vmKgudXAnAAg==
X-Received: by 2002:a05:6214:2587:b0:6fd:6e94:9dee with SMTP id 6a1803df08f44-702b1c04d50mr26220596d6.41.1751456239572;
        Wed, 02 Jul 2025 04:37:19 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7730ac6csm99218046d6.103.2025.07.02.04.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 04:37:19 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 4/6] clk: spacemit: define three reset-only CCUs
Date: Wed,  2 Jul 2025 06:37:06 -0500
Message-ID: <20250702113709.291748-5-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702113709.291748-1-elder@riscstar.com>
References: <20250702113709.291748-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three CCUs on the SpacemiT K1 SoC implement only resets, not clocks.
Define the CCU data for these resets so their auxiliary devices get
created.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/clk/spacemit/ccu-k1.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 1c9ed434ae93e..f9e2200d1fd04 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -943,6 +943,18 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
 	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
+static const struct spacemit_ccu_data k1_ccu_rcpu_data = {
+	.reset_name	= "rcpu-reset",
+};
+
+static const struct spacemit_ccu_data k1_ccu_rcpu2_data = {
+	.reset_name	= "rcpu2-reset",
+};
+
+static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
+	.reset_name	= "apbc2-reset",
+};
+
 static int spacemit_ccu_register(struct device *dev,
 				 struct regmap *regmap,
 				 struct regmap *lock_regmap,
@@ -1121,6 +1133,18 @@ static const struct of_device_id of_k1_ccu_match[] = {
 		.compatible	= "spacemit,k1-syscon-apmu",
 		.data		= &k1_ccu_apmu_data,
 	},
+	{
+		.compatible	= "spacemit,k1-syscon-rcpu",
+		.data		= &k1_ccu_rcpu_data,
+	},
+	{
+		.compatible	= "spacemit,k1-syscon-rcpu2",
+		.data		= &k1_ccu_rcpu2_data,
+	},
+	{
+		.compatible	= "spacemit,k1-syscon-apbc2",
+		.data		= &k1_ccu_apbc2_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
-- 
2.45.2

