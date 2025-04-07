Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056B0212D65
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 02:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743991801; cv=none; b=SwTSaPiOlzyTiJAyt4YEpL9HdQgd+Wy90r3ZUCL63VCQWWWG/voUV4QPfjV2NXDkDG0kGrDcMXas4PAeZUPVvTPybwh3Z9ky8LpvwIUCx7gganpIY6RQdb4kSKDooTHvW7SHW3rpCyAj+TNjmsn5jKZQ3GBBCUR2rK+UF6xMRLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743991801; c=relaxed/simple;
	bh=W5PvpIs3YYQPP/nm47aShabS05J2uCrQMtCbey8iOOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r0v+EFLq9QpEv6oLWO1YoeqKMNOzXkzM318Jg+xRKKkHFWZr0aSWj9iLl4VLNqka62VMCuHcxsGBJQv2+724TkGbbbsu3TOSdRKXVCPSXaz+BqKl6OnQVwDs/6urhBiVzFQ9aCCW6g0kxVHRBTct/7zznyKTKRk0PgQ8e/ubbyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowAA3dQ3gM_NnLGnGBg--.8741S2;
	Mon, 07 Apr 2025 10:09:42 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] mtd: nand: Add error log for marvell_nfc_end_cmd()
Date: Mon,  7 Apr 2025 10:09:16 +0800
Message-ID: <20250407020917.1242-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAA3dQ3gM_NnLGnGBg--.8741S2
X-Coremail-Antispam: 1UD129KBjvJXoW7urWrZw1xWw1UtFW8AF4fXwb_yoW8AryDpw
	4rZFW5KF40ya1YyrnxJa1DuFy5t3Z3K348K3Wvva4j9r4xGF4jgrsFya40gF1UAayfAw1a
	qrZxKr9Y9Fn0yFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjfUYdgADUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRAFA2fytf-jFwAAs0

The function marvell_nfc_hw_ecc_bch_read_chunk() calls the function
marvell_nfc_end_cmd(), but dose not check its return value. Since it
is incorrect to bail from the loop if the marvell_nfc_end_cmd() fails,
an error log is necessary to prevent silent failure.

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/mtd/nand/raw/marvell_nand.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 303b3016a070..1069a17dae9d 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -1351,16 +1351,20 @@ static void marvell_nfc_hw_ecc_bch_read_chunk(struct nand_chip *chip, int chunk,
 	 * Length is a multiple of 32 bytes, hence it is a multiple of 8 too.
 	 */
 	for (i = 0; i < data_len; i += FIFO_DEPTH * BCH_SEQ_READS) {
-		marvell_nfc_end_cmd(chip, NDSR_RDDREQ,
-				    "RDDREQ while draining FIFO (data)");
+		err = marvell_nfc_end_cmd(chip, NDSR_RDDREQ,
+					  "RDDREQ while draining FIFO (data)");
+		if (err)
+			dev_err(nfc->dev, "Fail to confirm the NDSR.RDDREQ");
 		marvell_nfc_xfer_data_in_pio(nfc, data,
 					     FIFO_DEPTH * BCH_SEQ_READS);
 		data += FIFO_DEPTH * BCH_SEQ_READS;
 	}
 
 	for (i = 0; i < spare_len; i += FIFO_DEPTH * BCH_SEQ_READS) {
-		marvell_nfc_end_cmd(chip, NDSR_RDDREQ,
-				    "RDDREQ while draining FIFO (OOB)");
+		err = marvell_nfc_end_cmd(chip, NDSR_RDDREQ,
+					  "RDDREQ while draining FIFO (OOB)");
+		if (err)
+			dev_err(nfc->dev, "Fail to confirm the NDSR.RDDREQ");
 		marvell_nfc_xfer_data_in_pio(nfc, spare,
 					     FIFO_DEPTH * BCH_SEQ_READS);
 		spare += FIFO_DEPTH * BCH_SEQ_READS;
-- 
2.42.0.windows.2

