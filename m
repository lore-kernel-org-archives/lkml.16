Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3967013B2A4;
	Fri,  6 Jun 2025 09:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749203438; cv=none; b=AX1IAp1XcAXTxNu+5gWH9SRVPHzZjqRUkgyWWRCch5DrDtZZ8jMiye5RCsxTi4bLE9CcwBNJ2T/LjCtZxar6G4lEsf5KXz8fxAYcPAIqheivaapA25l8QzV0PfXFeQcib3alMXb5R4hbbOukzibqF+gf7Czoodv3h6vVGu4ASkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749203438; c=relaxed/simple;
	bh=feAQpUfREqIyqaR5jr5Sy0Qgv6IKtyAVXYK+ZWaBKfw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z5OBAJJyDVdxjvTM8wbn0YwSaDdlhImF8fyQt8aTN7R0L0WwCPT3cpYB9DAgjxGI3gJ3L3kdYN+CUNVzLh8vlZo824eZU80vXZAXODxrRsxfqfPw2Bldw/pSD3FSQpEW82YNXA2VTUkGu6yXByGUi++A7C+2zSr0HIZ0M0a42AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bDGcJ510Jz9ssb;
	Fri,  6 Jun 2025 11:44:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tjurJkmP4Gxb; Fri,  6 Jun 2025 11:44:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bDGcJ4C5Wz9srg;
	Fri,  6 Jun 2025 11:44:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8B59F8B76C;
	Fri,  6 Jun 2025 11:44:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id skAA1reDtuH6; Fri,  6 Jun 2025 11:44:16 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 18FEE8B763;
	Fri,  6 Jun 2025 11:44:16 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH] ALSA: pcm: Rewrite recalculate_boundary() to avoid costly loop
Date: Fri,  6 Jun 2025 11:44:02 +0200
Message-ID: <4836e2cde653eebaf2709ebe30eec736bb8c67fd.1749202237.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749203043; l=3083; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=feAQpUfREqIyqaR5jr5Sy0Qgv6IKtyAVXYK+ZWaBKfw=; b=qB3NAsGq3M8Q0jjRupzKaooojapfHgaxiAqyhkjD/arhMy8Gf84sxuM4dscgA+wlp0eVzGbAl Uzowl9ub5IDDUTT9oWgWbKqtrPkutIIJlPhqgllmPt+YfjtjqxxIzdI
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

At the time being recalculate_boundary() is implemented with a
loop which shows up as costly in a perf profile, as depicted by
the annotate below:

    0.00 :   c057e934:       3d 40 7f ff     lis     r10,32767
    0.03 :   c057e938:       61 4a ff ff     ori     r10,r10,65535
    0.21 :   c057e93c:       7d 49 50 50     subf    r10,r9,r10
    5.39 :   c057e940:       7d 3c 4b 78     mr      r28,r9
    2.11 :   c057e944:       55 29 08 3c     slwi    r9,r9,1
    3.04 :   c057e948:       7c 09 50 40     cmplw   r9,r10
    2.47 :   c057e94c:       40 81 ff f4     ble     c057e940 <snd_pcm_ioctl+0xee0>

Total: 13.2% on that simple loop.

But what the loop does is to multiply the boundary by 2 until it is
over the wanted border. This can be avoided by using fls() to get the
boundary value order and shift it by the appropriate number of bits at
once.

This change provides the following profile:

    0.04 :   c057f6e8:       3d 20 7f ff     lis     r9,32767
    0.02 :   c057f6ec:       61 29 ff ff     ori     r9,r9,65535
    0.34 :   c057f6f0:       7d 5a 48 50     subf    r10,r26,r9
    0.23 :   c057f6f4:       7c 1a 50 40     cmplw   r26,r10
    0.02 :   c057f6f8:       41 81 00 20     bgt     c057f718 <snd_pcm_ioctl+0xf08>
    0.26 :   c057f6fc:       7f 47 00 34     cntlzw  r7,r26
    0.09 :   c057f700:       7d 48 00 34     cntlzw  r8,r10
    0.22 :   c057f704:       7d 08 38 50     subf    r8,r8,r7
    0.04 :   c057f708:       7f 5a 40 30     slw     r26,r26,r8
    0.35 :   c057f70c:       7c 0a d0 40     cmplw   r10,r26
    0.13 :   c057f710:       40 80 05 f8     bge     c057fd08 <snd_pcm_ioctl+0x14f8>
    0.00 :   c057f714:       57 5a f8 7e     srwi    r26,r26,1

Total: 1.7% with that loopless alternative.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 sound/core/pcm_native.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 6c2b6a62d9d2..2b77190a247d 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -24,6 +24,7 @@
 #include <sound/minors.h>
 #include <linux/uio.h>
 #include <linux/delay.h>
+#include <linux/bitops.h>
 
 #include "pcm_local.h"
 
@@ -3119,13 +3120,23 @@ struct snd_pcm_sync_ptr32 {
 static snd_pcm_uframes_t recalculate_boundary(struct snd_pcm_runtime *runtime)
 {
 	snd_pcm_uframes_t boundary;
+	snd_pcm_uframes_t border;
+	int order;
 
 	if (! runtime->buffer_size)
 		return 0;
-	boundary = runtime->buffer_size;
-	while (boundary * 2 <= 0x7fffffffUL - runtime->buffer_size)
-		boundary *= 2;
-	return boundary;
+
+	border = 0x7fffffffUL - runtime->buffer_size;
+	if (runtime->buffer_size > border)
+		return runtime->buffer_size;
+
+	order = __fls(border) - __fls(runtime->buffer_size);
+	boundary = runtime->buffer_size << order;
+
+	if (boundary <= border)
+		return boundary;
+	else
+		return boundary / 2;
 }
 
 static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
-- 
2.47.0

