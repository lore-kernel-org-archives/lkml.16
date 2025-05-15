Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52891361
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 17:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747331169; cv=none; b=bfhwvUdkkmdrdy+9y//a1E1FvuMbO+AArfXquZ/igVpRWJcbptPaO900RjYGu3B+4/zPX5G5vkcPqeS6Gdr/x7FyOD8zYCkobhPI3Z1lcrb+h0LJjiIEXqBeU2g3t7+A7ctFMtU00/ZlX4tBpXKvRvAIgLQieB69G+HOtISAieA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747331169; c=relaxed/simple;
	bh=4CjC0kpInaRt8g4DK1s6fH4QyHh4X3fogsoj831c6zk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=vGMgAZy41vQdLJigK/UOAH/+EB358+QKxnkRgce/xLJM8eM8h/1edK3kin36v6taCy0+eKARa4VsmsLN/7lecX4EEIcMg/iwMYzxhpIx3jsI5w6IKEwiBqzJH96Hu/oN4ljviyAOQNOHbUYkZi8Zp9osHcHdTrWQFexJv6E9JGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWrveDtS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWrveDtS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C851C4CEE7;
	Thu, 15 May 2025 17:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747331169;
	bh=4CjC0kpInaRt8g4DK1s6fH4QyHh4X3fogsoj831c6zk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=tWrveDtS0Ds1HRVJkHRYU+xb7zPOB3EixSE5cw/k0Ikas7ECttrQa5QVxTNog7pIc
	 Qalo4djwRU2EQdfHi29t8v6nKIW9S3uv7jynLl511SixcJvl+zkC6MrSEx1e+6PVxq
	 FA33MdFWhxOIC0BQ7MCYHKPoJi4cg7DOAvi9JOonFkiHoLKITFysMwFVSrzGsPBKTf
	 Y4CP4PmAdeA6g3Jmnl0yKoDzps7FOTreP357z6Co5Q5aGaYytVkWQ//tsSmm0toUuJ
	 xzPEvjg+togkcPqvyofGNTTh7rTpggrXTnQXVKCYQWjzSgiFPb3/58aHZ2OWA/jOaZ
	 8RWbY43kysFyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D7BC2D0CD;
	Thu, 15 May 2025 17:46:09 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Thu, 15 May 2025 21:46:05 +0400
Subject: [PATCH] mtd: spinand: esmt: fix id code for F50D1G41LB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-spinand-esmt-v1-1-37507b7335b8@outlook.com>
X-B4-Tracking: v=1; b=H4sIAFwoJmgC/x3MQQqAIBBA0avErBNUMKmrRItBp5pFJk5EIN09a
 fkW/1cQKkwCU1eh0M3CZ2owfQdhx7SR4tgMVlunnXFKMidMUZEcl/LDGgZE9NqM0JJcaOXn383
 L+35eF3moXgAAAA==
X-Change-ID: 20250515-spinand-esmt-76fc6aaa7019
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Martin Kurbanov <mmkurbanov@salutedevices.com>, 
 Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 robimarko@gmail.com, George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747331167; l=1761;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=Bw7bpiUiZpTxxhtD+xg0nBao9Wz8H2pesY3n+hLtv0Y=;
 b=TB7980Qcxb+4Xz2tPA3TAkYBEvGxcrLGn3YFB35SRxhwW3A2Ru/l1chsBs0UlKVw+R8PK3Z3j
 71BFt4VyfteB/5sxdDFUSzVxCRpVK1x9kGkLowFAggW5UNUGtf0o9O0
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

Upon detecting the ID for the ESMT F50D1G41LB chip, the fifth byte
returned is always 0x00 instead of the expected JEDEC continuation code
of 0x7f. This causes detection to fail:

[    0.304399] spi-nand spi0.0: unknown raw ID c8117f7f00
[    0.508943] spi-nand: probe of spi0.0 failed with error -524

So let's revert back to the 4 byte ID code for this chip
specifically.

Fixes: 4bd14b2fd8a8 ("mtd: spinand: esmt: Extend IDs to 5 bytes")
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
drivers/mtd/nand/raw/nand_esmt.c mentions that the 5th byte is used to
set ECC strength requirements for the detected chip, so no JEDEC
continuation code is actually expected. I don't know if this there was
a change in design or approach somewhere along the way, hence I fixed
the ID for this chip only.
---
 drivers/mtd/nand/spi/esmt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/esmt.c b/drivers/mtd/nand/spi/esmt.c
index 299d0e507c29fcde1c38d2fdebc0cc755825dade..9e286612a296c75831f7b95a010a5fe47579c36d 100644
--- a/drivers/mtd/nand/spi/esmt.c
+++ b/drivers/mtd/nand/spi/esmt.c
@@ -199,7 +199,7 @@ static const struct spinand_info esmt_c8_spinand_table[] = {
 		     SPINAND_FACT_OTP_INFO(2, 0, &f50l1g41lb_fact_otp_ops)),
 	SPINAND_INFO("F50D1G41LB",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x11, 0x7f,
-				0x7f, 0x7f),
+				0x7f),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(1, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,

---
base-commit: 484803582c77061b470ac64a634f25f89715be3f
change-id: 20250515-spinand-esmt-76fc6aaa7019

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>


