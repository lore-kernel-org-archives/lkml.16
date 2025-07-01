Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B71B1F4CBD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370334; cv=none; b=PF+axuhzsJYMfvuWD0XCEuwCkZSWPySk7VXkguequ0ySdhtgxuJ/lt7X0kb1k5H5cyVk23qmMH8Ko1avFc2LYljwTAoytAeZwMDxVorpW8ZEcpD97gv4CP9NYvTTClOWgy84C7n3oyvpqQTaoj9ovSYKxioCmhoUtKDvi5pp3vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370334; c=relaxed/simple;
	bh=gTUNr+PscDQrSl2I0O8sibm9zmoEPk3B5YEs5fMDJn0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=obVRqOP5NHcTdPHlwbHqAoCK7wTeUDhDg2FqhSvOKMfCmKy1kiUXPtmP3FRuMoZidMDSLJUuAI0AsbLsli9Dw32CtG1qiB3rndjiLvMvMZCsLAyj9D4lrV0rWaKNQz+ppxeTulCn6w6f8C7oeGa3UEqu/BhXF81H58hdGbyRHxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6phUvPK; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6phUvPK"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4eb4dfd8eso860093f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751370331; x=1751975131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqV2cSc9JcT72sZ3WvX374nk7Y11QAirdR7fnD3P+JI=;
        b=h6phUvPKxPxFrREizYVnkTnMMkcAymtAbuXVc1bMOMnj9PWfolNDT/Jyms0Si6muk1
         sBm5HgY0LuIZVA/bUiSaeYBWw4RcSp4SF1tbm6JZq/JFAHTedqkCMeXL7PX74AntHtUn
         kiZn+yOhX8N+VFo5o4kue4svwCb4izxGe4JSoLiOMcYqe7tQSLkqz7qMD14acx9oEDz3
         WSp8RabehaCwb9kipfIHd9d+6iMIloUIsYz78zyOy9BPvNwLrHNhn2wq0/l7O9ywDilP
         3WpMn7sN4/3u8aiDYE8ZYWR8g/fNjm8N7TuYv2+MHuPgDs0pYrQWzMkyrkV3vgxMCU1Y
         180w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370331; x=1751975131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqV2cSc9JcT72sZ3WvX374nk7Y11QAirdR7fnD3P+JI=;
        b=kNILH1Sk2+pn/8QmAcFCs0+TiYYKKc3yXadCzTNrHVyGCPT4ornM6pJCQOtI88BeKy
         AmkWpdSV/KV+yzhD6YIAk1+BrsGQrmfHiwqtNGh3MkXi8beRhZwBCjncmJ1MQJ3bRCIn
         lpBaaLoLe/SuLRuME+mX/4KjnpUl1T1H3yMDrjS2IkgijHSzmH3P1jTcJNysdCBd6g9E
         sQIKR+CfYxKlvmho2sncdIt1LEsb+HGA128vRpKwJdfcieyhA6ncMLYbYdKrRCvklu8n
         42m4uXbHdwJWrv/hNPb4NmJ7ox+s3tcE4ANYY6mFGzIAO6og4SyDLzUg56uIqYOlEnAe
         ep1g==
X-Forwarded-Encrypted: i=1; AJvYcCVDJ7m1JynKZtmPsyGkoIUe+FbD/u7IPzNGQr0cPrbhx3cVKx/lOqndOyHQ557xo94y2VdOqWqeVFCzmzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIH+ujNuYs2EGhQteYBXtjRvD30yVi228QnjH7v642v7MnuGKB
	JotWviIbqoJJnjbnIc+fERcWVG5n9Cg1bEa8sAqeAZ3a3kW+ktU0JPmRxL7ogIdj
X-Gm-Gg: ASbGnctzv6KRTqLPOn6d7FQ24yru0EIbVKLkwDEfwQXiyVUpH8/3EgZlORHBHXOhk3N
	Hgk2It46FyifGFI+4mnn5xq2Q7cQSKkUZBxzK8/oylK3tzy9N8klSTzcdHTCWVz//gmJ/c/2jDX
	z6LUqQy6s6elDHn+mnjMneNtI6y19H+k7QxFJqxr71Dnvl1OoBX42fTNhAWEopoWwWqRMWhVzKi
	4LeTDTo3KGU3Z3HQMNT9KGDJIyG8i+jiSy+3iJ9hmeKLLoTjHJEjJi0H4l6Bx+l8ajSV7hqu3ma
	9tgO8SeojGddfsWsGY/6qRSNrscI81SmqZbFY6KNGRqh5fReb1SoueXN0J5JdVr1KwufDad+SD4
	029OFp/NSzFYqdHw=
X-Google-Smtp-Source: AGHT+IE0MARjLwFpVKy3XcqNu0YHZaj2TRqPNQZA5Vxs8cyk8AFUVhx3QiWGdqMXOzIEmt1ArxrW6A==
X-Received: by 2002:a05:6000:440f:b0:3a4:d4a0:1315 with SMTP id ffacd0b85a97d-3af246671cbmr642564f8f.6.1751370331232;
        Tue, 01 Jul 2025 04:45:31 -0700 (PDT)
Received: from thomas-precision3591.imag.fr ([2001:660:5301:24:a723:4386:e2f6:bd22])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-453823b6e9esm197218935e9.28.2025.07.01.04.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:45:30 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Alexander Dahl <ada@thorsis.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nand: Fix dma_mapping_error() address
Date: Tue,  1 Jul 2025 13:44:23 +0200
Message-ID: <20250701114427.24910-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It seems like what was intended is to test if the dma_map of the
previous line failed but the wrong dma address was passed.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index dedcca87defc..84ab4a83cbd6 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -373,7 +373,7 @@ static int atmel_nand_dma_transfer(struct atmel_nand_controller *nc,
 	dma_cookie_t cookie;
 
 	buf_dma = dma_map_single(nc->dev, buf, len, dir);
-	if (dma_mapping_error(nc->dev, dev_dma)) {
+	if (dma_mapping_error(nc->dev, buf_dma)) {
 		dev_err(nc->dev,
 			"Failed to prepare a buffer for DMA access\n");
 		goto err;
-- 
2.43.0

