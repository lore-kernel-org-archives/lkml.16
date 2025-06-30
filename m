Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140C341760
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 03:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751255413; cv=none; b=j0QLPH17u79otDVe4WS1FePlqhlpMFkkL/LawjXhwqOWL1kln6OoCIbaStCtjKogdcBa5TBytTL7LhN/qkrdNu292VmYYs/lIsqC/1uOEUELU795tApSSYpRl8/koS7+AEJusImwGgSTtsnNi/IOln26Z9xFHMZbnHpRgdkymXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751255413; c=relaxed/simple;
	bh=hP6Zj3x6ZxHTchOTvbcRoLgDuAgETcfBOEsMi4tGJCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RJIm+NEW/02lBzXhcy0pNhbTBCft8TamXaj+aJVZAnNHssNZ5k+0OmHz+V/wtO09R4dFEJWGZa2ejkmMwC8UhONEi8chLL+gzQqIrHJWg4GtbYEkjqRmbEfIXPepsLGXixyTDLyb3oM7PGZqhzADUXzmsAv0z5h/h9fF/FXKBls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5XqPo5z; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5XqPo5z"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-747c2cc3419so3876650b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751255411; x=1751860211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XS3uMD6coTyQ6ld95dZSw/chmAO1ya8AiyTyXgg1NkA=;
        b=h5XqPo5zRAUAZuOS9I8buyn3xWjo6TkCIkfB3Z1qQYITDikoWgVZoK05768RsWU6fO
         4Z4n2gl9CMekfh0VHs651VlYs8ZeGPxZPCx6GkY8Zqy8AhCD/DvWDId2sMRQSmgp0qzS
         COjbNmd861IsQfUGHVXJ6MFZhYRfS3qrIuBJePLC+MeeWlpG+IzaqU+wW3pHKcAdBJqV
         xnNfML7booC0kHbjSHvNllKPnTHREwFec/uWhcdIqMfV6YwXPfKzz1bC1QgFMGp3XeN6
         m+liJkoOAGkS6Ol9n2J+My1GUmkl70+AxL4fcTbYxfqO3WbYMxs5kvMnywPAqnE2++CQ
         7Jdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751255411; x=1751860211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XS3uMD6coTyQ6ld95dZSw/chmAO1ya8AiyTyXgg1NkA=;
        b=Yl52KF4HWGYiFY8I+XUH6Rc/PkHEb+Y9TvB4yOLvL9FyycMWEneIL3b9A8SdF2xhEu
         p/3Tk68tICuNWm6IaBtJz50xQ2sXVWp6WkCpf3MdPxoTW+jQHKxm8LqVBnpnCgmCHlIm
         AJLlM8883xO0XbrwzYjOy585Vd3mdlJbxIgtFrojax+6y9OsCRTD2321Su0WWMLGs0us
         apN6qigEb6cRIoXQY9dXtkLYJzE1jxfo+iWR7MLetAXicr7hiza/zu7McCSNgxBFxWVp
         cBZCF9D4/nCf4Zpn/cjUaAQowv9JJqiHiMjiPkbJpUuy+n6AvRHA6ao6iyeK3PnX3MYu
         otaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFgwPsTjG0iH8X0jhpDc4bzxwP/BzCpbKhm+1PozgMWN/xG4t9R+DOYM0yFc+DUU01Nzfrhy16jhORG2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX8OOx3Au4k+wXgenxP+f/opFiZOw+b1ROupcwL5NLcUUNtehY
	GkwHux0m9Xy9zReJP5XLv/4essWsgLyC1gt/7TboJRahq9OIm4aw0ehs3SC6kX5xAug=
X-Gm-Gg: ASbGncuFEBZaeR1p8XrX5/Z/DCxA4GAknlj+kb8xI2ShJENIhfkAKcQQ7JmP155Vxpk
	Fiqxc/AnCEBw0Mmr1q+Du3WE7mbfWr3gvTElXvgN/FmXMcq6Ni0n7lIAJpD4nAjwtmk+BkZk2EQ
	6+LVX2ye/QWZLTNCwCXfvIeVBP6gmMKbz0RMtedRLi1ARlwla4OPam73yk/AiRgQIEe7VTTeMEM
	Y+APnQtri0TCTRxAOeCe0GkWh4qA9mTVjpiK2yVPX8Aybmt3i1YRSUuqgVq7CxFwKqi2LO3DS4V
	cSRd0cM3yP7YZtYtfYssr2dXwYS+ymT/4eq8M0j3sqEBWW0WAHR8lr+5pNo0DgYkmSlHNKepb9f
	3wj0TClpZq+yZRK+u9XC2/KxuazVzRTkogJc6Z7kxzHc=
X-Google-Smtp-Source: AGHT+IGm+3mueaY7vn0ufRWgnmJ1q3u/xndByjPzeluFETrUS5APHTdn4iIBDyvRfiCgViEMNUWXRw==
X-Received: by 2002:a05:6a20:d486:b0:201:2834:6c62 with SMTP id adf61e73a8af0-220a16b359bmr17862154637.25.1751255411268;
        Sun, 29 Jun 2025 20:50:11 -0700 (PDT)
Received: from wuteng-VMware-Virtual-Platform.localdomain ([113.84.10.134])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31bea17sm6912262a12.46.2025.06.29.20.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 20:50:10 -0700 (PDT)
From: gigadevice2025@gmail.com
To: miquel.raynal@bootlin.com,
	richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Teng Wu <gigadevice2025@gmail.com>
Subject: [PATCH] mtd:spinand:gigadevice:Add support for GD5F1GM9 chips
Date: Mon, 30 Jun 2025 11:49:31 +0800
Message-ID: <20250630034931.7962-1-gigadevice2025@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Teng Wu <gigadevice2025@gmail.com>

- GD5F1GM9UExxG (ID:c89101 3.3V)
- GD5F1GM9RExxG (ID:c88101 1.8V)

Both device feature:
  - 1Gb density (1024 blocks)
  - 2048-byte page size with 128-byte OOB
  - 8-bit ECC requirement per 512 bytes
  - Quad I/O Read support (opcode EBH)
  - tPROG ≤ 300us typical page program time

Testing environment:
  - Platform: Raspberry PI-5 (Linux raspberry 6.15.0-rc6-v8)
  - Operations verified:
    * Full device read/write/erase cycles on all blocks
    * Nandspeed:
      ~ GD5F1GM9UE: 2.75MB/s read, 1.99MB/s write, 41.26MB/s erase
      ~ GD5F1GM9RE: 1.84MB/s read, 1.45MB/s write, 41.04MS/s erase
    * Nandbiterrs: Both corredted 8-bit errors per 512 bytes
    * Stresstest: Both 144k cycles 0 bad block growth

Full test log:
 -U: https://gist.github.com/WT-886/b0f41fb50ddac3adc0020222c1f89b61
 -R: https://gist.github.com/WT-886/8784e72f4632d519814928ff49225963

Datasheet:
 -https://github.com/WT-886/DATASHEET/blob/main/GD5F1GM9-v1.0.pdf

Signed-off-by: Teng Wu <gigadevice2025@gmail.com>
---
 drivers/mtd/nand/spi/gigadevice.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index d620bb02a..f781d0368 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -533,6 +533,26 @@ static const struct spinand_info gigadevice_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
 				     gd5fxgq4uexxg_ecc_get_status)),
+	SPINAND_INFO("GD5F1GM9UExxG",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x91, 0x01),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_1gq5,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
+				     gd5fxgq4uexxg_ecc_get_status)),
+	SPINAND_INFO("GD5F1GM9RExxG",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x81, 0x01),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_1gq5,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
+				     gd5fxgq4uexxg_ecc_get_status)),
 };
 
 static const struct spinand_manufacturer_ops gigadevice_spinand_manuf_ops = {
-- 
2.48.1

