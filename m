Received: from smtp.smtpout.orange.fr (smtp-79.smtpout.orange.fr [80.12.242.79])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5A913B284;
	Sun, 25 May 2025 16:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748192099; cv=none; b=kx+gnZNDuCP5ot8gIm9qK4jNBYQCHQ1qAWL891oLjN10yMkBqhnCtmrA/vjskFUmtDjyGgQc0mkx/rIVrIwMSOWnO2UsuhWnphpz49DkQpzFpRKHWJvahgsh+Z/K7zg7x0ZnvEDsgezkFxG7VER98euMEGOpb1XMuBGJu45+/LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748192099; c=relaxed/simple;
	bh=8bflu4UgxWs0JkpbKJIZNm34KO9JOk6Vak4CmKBaKs4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=shwthbDMohAbEU6XkLL9317WNksUF7kPeAV/X4q3e05SZe6oovJNm/i/yX8LVaZWDXF28RFXh1v81sAHdAZvNIbOPFh4dhrgwSIrDBw/n7NjXqUijxfvbJ8SU3IjzuIv3mSDKygS5cuvFzrgF8jUP3jPf4/Pf4HAlxnKHv16ey0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=scYq1qKT; arc=none smtp.client-ip=80.12.242.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="scYq1qKT"
Received: from localhost.localdomain
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id JEbXuyhO3Q1a2JEbXuhZYT; Sun, 25 May 2025 18:53:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1748192025;
	bh=MS4BOzI8pIQH6Em3Qo4qOWc4O/UmRIVViLq3oo0QcKY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=scYq1qKTLRlllmiICeOLIfueUqB/6hw9etqG4F/30KkzN6rpMNO2Vbc484c3OqkOK
	 qWwnKY+lRYrFJoUHVkyUOp3JwPxxmyd+9POz++xRSKmRR545Z+NwPwEVBdqs05RnCC
	 1eyPiYtKBFNo+RxwTfGFTWGvFdqrx/TUzlag56bwarjXdnCND8HEjcUcMm5TTb+MF/
	 //gDATAJB7u7TIwH3t+ii28mg4UB+nFzvPilFsojeVfOZleWMWXQWqxlBXdcYR+w9M
	 D3wbQM/BTVyTkPUVTFEO1+/DP5Zybopd414wzt8u80QiDWq2i4ie11x75aT0zQ3vAZ
	 pXXaHVLa/yz0w==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 25 May 2025 18:53:44 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: Constify struct spi_nor_fixups
Date: Sun, 25 May 2025 18:53:31 +0200
Message-ID: <aa641732ba707ce3690217825c3ca7373ffde4f9.1748191985.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct spi_nor_fixups' are not modified in this driver.

Constifying these structures moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  23304	  13168	      0	  36472	   8e78	drivers/mtd/spi-nor/micron-st.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  23560	  12912	      0	  36472	   8e78	drivers/mtd/spi-nor/micron-st.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/mtd/spi-nor/micron-st.c | 8 ++++----
 drivers/mtd/spi-nor/spansion.c  | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index e6bab2d00c92..187239ccd549 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -189,7 +189,7 @@ static int mt25qu512a_post_bfpt_fixup(struct spi_nor *nor,
 	return 0;
 }
 
-static struct spi_nor_fixups mt25qu512a_fixups = {
+static const struct spi_nor_fixups mt25qu512a_fixups = {
 	.post_bfpt = mt25qu512a_post_bfpt_fixup,
 };
 
@@ -225,15 +225,15 @@ static int st_nor_two_die_late_init(struct spi_nor *nor)
 	return spi_nor_set_4byte_addr_mode(nor, true);
 }
 
-static struct spi_nor_fixups n25q00_fixups = {
+static const struct spi_nor_fixups n25q00_fixups = {
 	.late_init = st_nor_four_die_late_init,
 };
 
-static struct spi_nor_fixups mt25q01_fixups = {
+static const struct spi_nor_fixups mt25q01_fixups = {
 	.late_init = st_nor_two_die_late_init,
 };
 
-static struct spi_nor_fixups mt25q02_fixups = {
+static const struct spi_nor_fixups mt25q02_fixups = {
 	.late_init = st_nor_four_die_late_init,
 };
 
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index bf08dbf5e742..920bb8dd5dc2 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -578,7 +578,7 @@ static int s25fs256t_late_init(struct spi_nor *nor)
 	return 0;
 }
 
-static struct spi_nor_fixups s25fs256t_fixups = {
+static const struct spi_nor_fixups s25fs256t_fixups = {
 	.post_bfpt = s25fs256t_post_bfpt_fixup,
 	.post_sfdp = s25fs256t_post_sfdp_fixup,
 	.late_init = s25fs256t_late_init,
@@ -650,7 +650,7 @@ static int s25hx_t_late_init(struct spi_nor *nor)
 	return 0;
 }
 
-static struct spi_nor_fixups s25hx_t_fixups = {
+static const struct spi_nor_fixups s25hx_t_fixups = {
 	.post_bfpt = s25hx_t_post_bfpt_fixup,
 	.post_sfdp = s25hx_t_post_sfdp_fixup,
 	.late_init = s25hx_t_late_init,
-- 
2.49.0

