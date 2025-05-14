Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B580D1E5734
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 06:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747203301; cv=none; b=iqjVccpQV8IGgKQRfMFG87Dx73JwnDBfvqV7I6is2oF4adHV2MJytp/2U5t2zdjPOCvmbGzLiSPXv7DpeIAIo2ZFOLS16elFhFyYt11kq/Ypj4rRiFWKgdy9WsV51m94pjVD7kIimLWBtZDl15XtZAfr3cI6hSOSb6meyg7r/4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747203301; c=relaxed/simple;
	bh=dk6pl26pKU7jcK+NEmRsQMZdSMi2Bn3Mj14u+x5BRmU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=rIUF1Q/lI3VVinN7dBSQbuMGXibvnNlxvGmRiqGRwQxcVYceCIh3P/UV+EI9r9KdY4ek+bOixKnJr6DhB9R6voGiUowo5u0n7O3oUVn0I+uVCT6tBPihQ5ZznUe2LUtm/vGiJbazf7DoO6ixXwoOQvUHsHrmOd5HBJ59hm37OY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhqwVLRp; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhqwVLRp"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso68038695e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 23:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747203298; x=1747808098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NeVM2h2Stw1nFbFkEhu5d40BuDFNnEXXFXORIacGvH8=;
        b=AhqwVLRpwCq/UUkNlB4lqljsB9GrbQAutSBqm0/5i4cvMwJMOnWjH1eF96kN01lZ3t
         +WpGDnu+B2RRlMbV0U3V2CwR3ILD62x0tA+CtYfjpnK8OGD7b0vnal0njolT04A0aRiJ
         17j6aq1ODan8kdpPNR64+70pKVw8Xnq2T8d3ReEKTREzg3k5pCs768USDoMLyF63KcuJ
         19BEoIUr9GRmw0i757S2VKsv2b7zEO2YSlFNHyWa93wpc7ImlJu89lJHm9BE+X7d3Db3
         vPk3rMJDKRKel6D7h7mUyaUSHDi2Tkxo+O45a9SPK3RiFezyms4A0cvMd2fxLF1hr1vS
         nOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747203298; x=1747808098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NeVM2h2Stw1nFbFkEhu5d40BuDFNnEXXFXORIacGvH8=;
        b=bKUWn7s6aMHDGm7rnUXX1vLSzWibw+9AiwcUpiAVqQYqWJSPUNYDownn+Y0BxhkReM
         ghDFloLedfm+vAdRtnEFbhUvmmvXUsDBwNcQ7jXVyKr8x9ON7EEKLeMVAu3sYyto8PRQ
         yFB/Pp9XEl5cZ2jkt6rKjqeOltjcLSY/dA1JEtfwlK2ZGdj8K6Vi0G/LI6wJpAg4p9Qn
         H2c8z1SSBoQWdo6pztaygc3qiEz6NLt/xzzZnnbkgiuHZ8tYvD0URVGp0fb06s6thFpF
         3Za7e8uUFM5gu9QsbeEpqah9Bcz9n3z7vVjVC7VGN2EfqDyD4/me5pvlJhXOWr05ZQ1f
         XumQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT/SdkpA5jKQJDH7WrXIdTvz42bPvKV0JrbolcIq9sDBfMuo1FEsi8/ZWqt5qtvEpzDgMvJDiQcB4X+BY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVfoeYWkKx15mj0P1U43140Lb/sIO4zApwEUZR9HlXKdGIYnyc
	Of+B1gZniiXsGF+tHwHlPqvDQ5teMUeTXTr1vOx+Sewif7fLwM5H5C60NQ==
X-Gm-Gg: ASbGnctwvI7QP6Dek/t7j22nLc+FY12AdvngurJbLGUFhlko+bg98bhuecz/9nt1oj6
	yQvwc3oiNft4MtL2ULR8xCUBbXR9NtxkclaU/B7Ho24EriKvfIEKlB5Ih0nbZc/PKwQNxG0Ic6D
	6NDjlbdP9qCB1n8U0nbZ5CNI/ngZN+zfWCZqPy7AFyHZJDRnAYNIx+mCtUbFKFdxC/FGL+VIl+Q
	rvWku66kTFrGxTRdJ7yqijRkM0l+V63+xGTA/IdwdfMEY/p9QDJkXipehEwc2NhvO8SCSGh8I1G
	jaHCoscxpEWhnl0zpoHF+L2ijNFqoqnWGLuVFdabyU7GfZKHq6/LkANYK193F6mhVcNc2RRmyNA
	zumRl8b+qPGRdkD9q+sbLfD0zo2hiacJyod97RHVodfnklxrQRHI=
X-Google-Smtp-Source: AGHT+IGELleSe/EkJ657aNOlkflnr85dFaoekbo06RvE73Tj85o9n9teCannJWwIHe2q+LzdscPf6Q==
X-Received: by 2002:a5d:584d:0:b0:3a1:fe77:9e3d with SMTP id ffacd0b85a97d-3a34994bbbamr1373051f8f.37.1747203297707;
        Tue, 13 May 2025 23:14:57 -0700 (PDT)
Received: from skynet.lan (2a02-9142-4580-0400-0000-0000-0000-0008.red-2a02-914.customerbaf.ipv6.rima-tde.net. [2a02:9142:4580:400::8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddff6sm18719531f8f.12.2025.05.13.23.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 23:14:57 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: dregan@broadcom.com,
	florian.fainelli@broadcom.com,
	computersforpeace@gmail.com,
	kamal.dasu@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	jonas.gorski@gmail.com,
	dgcbueu@gmail.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Subject: [PATCH v2] mtd: rawnand: brcmnand: remove unused parameters
Date: Wed, 14 May 2025 08:14:54 +0200
Message-Id: <20250514061454.772340-1-noltari@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

last_cmd and last_byte are now unused brcmnand_host members.
last_addr is only written and never read so we can remove it too.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

 v2: fix unused host variable warnings.

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 17f6d9723df9..299dd2bca5b4 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -310,9 +310,6 @@ struct brcmnand_host {
 	struct platform_device	*pdev;
 	int			cs;
 
-	unsigned int		last_cmd;
-	unsigned int		last_byte;
-	u64			last_addr;
 	struct brcmnand_cfg	hwcfg;
 	struct brcmnand_controller *ctrl;
 };
@@ -2233,14 +2230,11 @@ static int brcmnand_read_page(struct nand_chip *chip, uint8_t *buf,
 			      int oob_required, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct brcmnand_host *host = nand_get_controller_data(chip);
 	u8 *oob = oob_required ? (u8 *)chip->oob_poi : NULL;
 	u64 addr = (u64)page << chip->page_shift;
 
-	host->last_addr = addr;
-
-	return brcmnand_read(mtd, chip, host->last_addr,
-			mtd->writesize >> FC_SHIFT, (u32 *)buf, oob);
+	return brcmnand_read(mtd, chip, addr, mtd->writesize >> FC_SHIFT,
+			     (u32 *)buf, oob);
 }
 
 static int brcmnand_read_page_raw(struct nand_chip *chip, uint8_t *buf,
@@ -2252,11 +2246,9 @@ static int brcmnand_read_page_raw(struct nand_chip *chip, uint8_t *buf,
 	int ret;
 	u64 addr = (u64)page << chip->page_shift;
 
-	host->last_addr = addr;
-
 	brcmnand_set_ecc_enabled(host, 0);
-	ret = brcmnand_read(mtd, chip, host->last_addr,
-			mtd->writesize >> FC_SHIFT, (u32 *)buf, oob);
+	ret = brcmnand_read(mtd, chip, addr, mtd->writesize >> FC_SHIFT,
+			    (u32 *)buf, oob);
 	brcmnand_set_ecc_enabled(host, 1);
 	return ret;
 }
@@ -2363,13 +2355,10 @@ static int brcmnand_write_page(struct nand_chip *chip, const uint8_t *buf,
 			       int oob_required, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	struct brcmnand_host *host = nand_get_controller_data(chip);
 	void *oob = oob_required ? chip->oob_poi : NULL;
 	u64 addr = (u64)page << chip->page_shift;
 
-	host->last_addr = addr;
-
-	return brcmnand_write(mtd, chip, host->last_addr, (const u32 *)buf, oob);
+	return brcmnand_write(mtd, chip, addr, (const u32 *)buf, oob);
 }
 
 static int brcmnand_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
@@ -2381,9 +2370,8 @@ static int brcmnand_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
 	u64 addr = (u64)page << chip->page_shift;
 	int ret = 0;
 
-	host->last_addr = addr;
 	brcmnand_set_ecc_enabled(host, 0);
-	ret = brcmnand_write(mtd, chip, host->last_addr, (const u32 *)buf, oob);
+	ret = brcmnand_write(mtd, chip, addr, (const u32 *)buf, oob);
 	brcmnand_set_ecc_enabled(host, 1);
 
 	return ret;
-- 
2.39.5

