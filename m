Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F03230D1E
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 11:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746184243; cv=none; b=pNAshep0xKymu8mPRndMMIPKJ4GBjfArRTUF7y9vMfoC+p/ZZ8eQ8FZyX+wJVGzuXruGqL8nn1MCQfgxI5+rlgoPrkGwIXgD//wd/sKpWwwUo4sFlX/cKpjs4Xq5N75M0joCZ48XugZ1MHnBpHYVYwK5sTXGBE1A0GFLjBQ6sUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746184243; c=relaxed/simple;
	bh=uCREbpoXZ/d4qu1maOPKLiBN7nJnfTaIKK/Mi8Y0w+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hruznv5o02F72syBVX3bVnpQ8tE2kTgFUFSp9N219HO37NPzbJITbJYiFuA8nAUwzeHv/GPs8AHDftVtdY98k69RhBFIrELYBY+ebZjoucyF+HHmJOnNOtUka4Vun1HvRnbjjd3Shu4z7KrWMJBz7WQibOdCpgHDaSXSfxj43vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:df64:35e8:502:4ac0])
	by albert.telenet-ops.be with cmsmtp
	id kBAf2E00B4sst1106BAfLo; Fri, 02 May 2025 13:10:39 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uAoHq-00000000Wa9-2zMC;
	Fri, 02 May 2025 13:10:39 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uAoHu-00000008ozq-3Cqa;
	Fri, 02 May 2025 13:10:38 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mark Brown <broonie@kernel.org>,
	Martin Sperl <kernel@martin.sperl.org>
Cc: linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] spi: loopback-test: Do not split 1024-byte hexdumps
Date: Fri,  2 May 2025 13:10:35 +0200
Message-ID: <37ee1bc90c6554c9347040adabf04188c8f704aa.1746184171.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

spi_test_print_hex_dump() prints buffers holding less than 1024 bytes in
full.  Larger buffers are truncated: only the first 512 and the last 512
bytes are printed, separated by a truncation message.  The latter is
confusing in case the buffer holds exactly 1024 bytes, as all data is
printed anyway.

Fix this by printing buffers holding up to and including 1024 bytes in
full.

Fixes: 84e0c4e5e2c4ef42 ("spi: add loopback test driver to allow for spi_master regression tests")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/spi/spi-loopback-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-loopback-test.c b/drivers/spi/spi-loopback-test.c
index 31a878d9458d95fd..7740f94847a883f3 100644
--- a/drivers/spi/spi-loopback-test.c
+++ b/drivers/spi/spi-loopback-test.c
@@ -420,7 +420,7 @@ MODULE_LICENSE("GPL");
 static void spi_test_print_hex_dump(char *pre, const void *ptr, size_t len)
 {
 	/* limit the hex_dump */
-	if (len < 1024) {
+	if (len <= 1024) {
 		print_hex_dump(KERN_INFO, pre,
 			       DUMP_PREFIX_OFFSET, 16, 1,
 			       ptr, len, 0);
-- 
2.43.0

