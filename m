Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06928195
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 13:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738761060; cv=none; b=ithtr1GgfTD7bIvYWan01ToJrGvT3AOqK16NwtFCqFx1Nvu3bQ17V4Op3iIdw+gJHIYMVZaT9F0tqjZ9iMOLETtDeAyjSmeiHT59Gkp24QEn5gQ/JEuUmsE2x8YYdMeJkcDURX54wvFsQH0sUlyRUPTRpm4R6Xab5I9JooGEDNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738761060; c=relaxed/simple;
	bh=UW4vifzm9dK7PfgtyUA+yHCYk90qPhir9yw0Dk0X//Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TmbCXsproeZxVvT9wxm37KV6fO7hT4sDWqZXLNNbUN2Xy9+BUh6cTovrv6CgNaYy3KlohguiWoSdltw59Eu4bLl/I/Hhx6uCHK/wFOdp/lKL4NyE+BQc9HXIYXqQzJiNQIridJ7aYC8XMuil2DpeT919fxMLeLN0sAtbWaC+2rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fa11:c14e:2df5:5273])
	by albert.telenet-ops.be with cmsmtp
	id 9pAn2E0063f221S06pAnbB; Wed, 05 Feb 2025 14:10:47 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tffAp-0000000Fva6-0B9f;
	Wed, 05 Feb 2025 14:10:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tffB1-00000006Q4S-0QzP;
	Wed, 05 Feb 2025 14:10:47 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Dominik Brodowski <linux@dominikbrodowski.net>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] pcmcia: omap_cf: Mark driver struct with __refdata to prevent section mismatch
Date: Wed,  5 Feb 2025 14:10:44 +0100
Message-ID: <06d57da75b583822a541b2eb9f28b172b3487183.1738760740.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As described in the added code comment, a reference to .exit.text is ok
for drivers registered via platform_driver_probe().  Make this explicit
to prevent the following section mismatch warning

    WARNING: modpost: drivers/pcmcia/omap_cf: section mismatch in reference: omap_cf_driver+0x4 (section: .data) -> omap_cf_remove (section: .exit.text)

that triggers on an omap1_defconfig + CONFIG_OMAP_CF=m build.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
v2:
  - Add Acked-by.
---
 drivers/pcmcia/omap_cf.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pcmcia/omap_cf.c b/drivers/pcmcia/omap_cf.c
index f0ccf479f36e5223..9bb80b47f0c453fb 100644
--- a/drivers/pcmcia/omap_cf.c
+++ b/drivers/pcmcia/omap_cf.c
@@ -302,7 +302,13 @@ static void __exit omap_cf_remove(struct platform_device *pdev)
 	kfree(cf);
 }
 
-static struct platform_driver omap_cf_driver = {
+/*
+ * omap_cf_remove() lives in .exit.text. For drivers registered via
+ * platform_driver_probe() this is ok because they cannot get unbound at
+ * runtime. So mark the driver struct with __refdata to prevent modpost
+ * triggering a section mismatch warning.
+ */
+static struct platform_driver omap_cf_driver __refdata = {
 	.driver = {
 		.name	= driver_name,
 	},
-- 
2.43.0

