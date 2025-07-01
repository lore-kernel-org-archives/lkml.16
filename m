Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE732749F6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376829; cv=none; b=MHsPpKWKpprQTAXYlvSB9fh6UKfsxJin3HicG9szuGxywkqBNVuy3IqLDNHyRWlSoJ6S9GHy3HKO8OR1J/LHSFGLTOxvFY3Bu3c6HCvglPxebt/OiqiKeijoxwora4P5XkF8JV73Rl9f+6b1+BwKY1F7rtvIatxVVzbMCk+0Pwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376829; c=relaxed/simple;
	bh=axIwVupvXGcOX7KDMuxqYaiGemEvjrs+9BecGDGb8nk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U60W51VjiM5Cg4We6zBnxxfjOAeMAxXHwjglbLh8mbJq9Mr6yP3N+6vydwX9SgZu9Ptvq8rRfIj8A7jz+p7KSahJ3g/M1+Ry1WmaKeT9hSVOVK8JAAb7hORcwfqKoA8se3JhLRYWF51msweosuPdMqr6vtlGtzykCg0hO6zPa1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=NT0/xHW6; arc=none smtp.client-ip=185.136.64.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="NT0/xHW6"
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250701133337a2e56ca67b5358737d
        for <linux-kernel@vger.kernel.org>;
        Tue, 01 Jul 2025 15:33:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=YhxdcWDoChMeKmCKFHUBRgx8Fy37YPqEiFc2G1XZk/I=;
 b=NT0/xHW6kCxGPbT2r9IA2uCj2BwYytVU4zBooT76wG4djkO052AKLKBGKI6R7ptSMfv1eJ
 LxneKxMSRmfdxcs2wHR1BP4Mq9ijo/x8elVuh7E54tc2P5RicaWiB6V110bABX7oL4/33xx8
 PIujI8DMQQbMI23ckyP9MIoAU+DEaohpJKGHT1Fq9Tgnwh30kFXM52z5tdtap/794luuoOK4
 QR2vUhhP4n9ZV5GX2xAVvgBsT2BiaeA/jdjh6wGf6/ogS1Q2ezEzMNB0yzBw87T7lCql6/4I
 4HmpD7R2/wwjtodREGMGGv0iPNc9D00KYxZnpWiRt38FsTxBfjdvYqug==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
	linux-mtd@lists.infradead.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nand: raw: atmel: Respect tAR, tCLR in read setup timing
Date: Tue,  1 Jul 2025 15:33:28 +0200
Message-ID: <20250701133333.3871085-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Having setup time 0 violates tAR, tCLR of some chips, for instance
TOSHIBA TC58NVG2S3ETAI0 cannot be detected successfully (first ID byte
being read duplicated, i.e. 98 98 dc 90 15 76 14 03 instead of
98 dc 90 15 76 ...).

Atmel Application Notes postulated 1 cycle NRD_SETUP without explanation
[1], but it looks more appropriate to just calculate setup time properly.

Without the fix we've measured -2ns tAR delay (REn asserted before ALE
deassert!); with the fix -- 60ns (subject to module clock).

[1] Link: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ApplicationNotes/ApplicationNotes/doc6255.pdf
Fixes: f9ce2eddf176 ("mtd: nand: atmel: Add ->setup_data_interface() hooks")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index dedcca87defc7..844df72f45063 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1377,14 +1377,25 @@ static int atmel_smc_nand_prepare_smcconf(struct atmel_nand *nand,
 	if (ret)
 		return ret;
 
+	/*
+	 * Read setup timing depends on the operation done on the NAND:
+	 *
+	 * NRD_SETUP = max(tAR, tCLR)
+	 */
+	timeps = max(conf->timings.sdr.tAR_min, conf->timings.sdr.tCLR_min);
+	ncycles = DIV_ROUND_UP(timeps, mckperiodps);
+	totalcycles += ncycles;
+	ret = atmel_smc_cs_conf_set_setup(smcconf, ATMEL_SMC_NRD_SHIFT,
+					  ncycles);
+	if (ret)
+		return ret;
+
 	/*
 	 * The read cycle timing is directly matching tRC, but is also
 	 * dependent on the setup and hold timings we calculated earlier,
 	 * which gives:
 	 *
-	 * NRD_CYCLE = max(tRC, NRD_PULSE + NRD_HOLD)
-	 *
-	 * NRD_SETUP is always 0.
+	 * NRD_CYCLE = max(tRC, NRD_SETUP + NRD_PULSE + NRD_HOLD)
 	 */
 	ncycles = DIV_ROUND_UP(conf->timings.sdr.tRC_min, mckperiodps);
 	ncycles = max(totalcycles, ncycles);
-- 
2.50.0

