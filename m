Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC871FC7F1;
	Fri, 13 Jun 2025 15:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749829837; cv=none; b=dTLthk9dNDY+AK8GfbE+MKvO1EDLVNfcWd7NKFT/ekUdJnWAsT0i0Csqf4OJLBgvL+J6UGLAdeW4j3c1c2Bn2sluCe/TTZb/e3XbkyNis5rd80l5oqeQfxMN2aDUAa1YrFXFkU/A+376ZvMYwBwZtiBwUqdJq4zmo15W+YytbTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749829837; c=relaxed/simple;
	bh=Td6hiZXhhqoBLfs3QmUNs9jotqLzTXOjBxWUYpRWpLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dSytzyskxuiXsa1bgwFpSCRKwaHrInS2t3XdEZzwYxCftfm4frFKrItURK3cY2ThIjvJlsZYpPD1P9KbY9GO3owaNO/rDkqPI3USrabi9yChCmYBa2+TdD2GLoIeZg7Kx+XSsyivyU+w2ty207poxhBGPUM73bMIIlyxMEUtnWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bJk6Q27zXz9ssb;
	Fri, 13 Jun 2025 17:37:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EousmuU7QcO6; Fri, 13 Jun 2025 17:37:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bJk6P2lTwz9sqT;
	Fri, 13 Jun 2025 17:37:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 59E238B77C;
	Fri, 13 Jun 2025 17:37:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id saUuz8-oaz9r; Fri, 13 Jun 2025 17:37:17 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E268C8B77B;
	Fri, 13 Jun 2025 17:37:16 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v2 1/4] ALSA: pcm: refactor copy from/to user in SNDRV_PCM_IOCTL_SYNC_PTR
Date: Fri, 13 Jun 2025 17:37:08 +0200
Message-ID: <1ae442f2df889ad5cc90297ad38503cd1e6cf457.1749828169.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1749828169.git.christophe.leroy@csgroup.eu>
References: <cover.1749828169.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749829028; l=5427; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Td6hiZXhhqoBLfs3QmUNs9jotqLzTXOjBxWUYpRWpLs=; b=YZdzXs8CDghpeoQcKRKxw5QdexUFYtYZ4bx5NKG8myA4PcnEt7kTvmbmE0vbEZHkJRFotrPrU jm7JOEuEJEfBIBy8U7U9fyfGshxNXMo4UjyUz0bPiWdLMuDd4Z9ccJr
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

In an effort of optimising SNDRV_PCM_IOCTL_SYNC_PTR ioctl which
is a hot path, lets first refactor the copy from and to user
with macros.

This is done with macros and not static inline fonctions because
types differs between the different versions of snd_pcm_sync_ptr()
like functions.

First step is to refactor only snd_pcm_ioctl_sync_ptr_compat() and
snd_pcm_ioctl_sync_ptr_x32() as it would be a performance
regression for snd_pcm_sync_ptr() and snd_pcm_ioctl_sync_ptr_buggy()
for now. They may be refactored after next patch.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 sound/core/pcm_compat.c | 14 ++------------
 sound/core/pcm_native.c | 42 +++++++++++++++++++++++++++++------------
 2 files changed, 32 insertions(+), 24 deletions(-)

diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index a42ec7f5a1da..17540020ac2f 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -418,9 +418,7 @@ static int snd_pcm_ioctl_sync_ptr_x32(struct snd_pcm_substream *substream,
 	if (snd_BUG_ON(!runtime))
 		return -EINVAL;
 
-	if (get_user(sflags, &src->flags) ||
-	    get_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
-	    get_user(scontrol.avail_min, &src->c.control.avail_min))
+	if (snd_pcm_sync_ptr_get_user(sflags, scontrol, src))
 		return -EFAULT;
 	if (sflags & SNDRV_PCM_SYNC_PTR_HWSYNC) {
 		err = snd_pcm_hwsync(substream);
@@ -450,15 +448,7 @@ static int snd_pcm_ioctl_sync_ptr_x32(struct snd_pcm_substream *substream,
 	}
 	if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL))
 		snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
-	if (put_user(sstatus.state, &src->s.status.state) ||
-	    put_user(sstatus.hw_ptr, &src->s.status.hw_ptr) ||
-	    put_user(sstatus.tstamp.tv_sec, &src->s.status.tstamp_sec) ||
-	    put_user(sstatus.tstamp.tv_nsec, &src->s.status.tstamp_nsec) ||
-	    put_user(sstatus.suspended_state, &src->s.status.suspended_state) ||
-	    put_user(sstatus.audio_tstamp.tv_sec, &src->s.status.audio_tstamp_sec) ||
-	    put_user(sstatus.audio_tstamp.tv_nsec, &src->s.status.audio_tstamp_nsec) ||
-	    put_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
-	    put_user(scontrol.avail_min, &src->c.control.avail_min))
+	if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
 		return -EFAULT;
 
 	return 0;
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index ecb71bf1859d..20326aa377b0 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3052,6 +3052,34 @@ static inline int snd_pcm_hwsync(struct snd_pcm_substream *substream)
 	return snd_pcm_delay(substream, NULL);
 }
 
+#define snd_pcm_sync_ptr_get_user(__f, __c, __ptr) ({				\
+	int __err = 0;								\
+	typeof(*(__ptr)) __user *__src = (__ptr);					\
+										\
+	if (get_user(__f, &src->flags) ||					\
+	    get_user(__c.appl_ptr, &__src->c.control.appl_ptr) ||		\
+	    get_user(__c.avail_min, &__src->c.control.avail_min))		\
+		__err = -EFAULT;						\
+	__err;									\
+})
+
+#define snd_pcm_sync_ptr_put_user(__s, __c, __ptr) ({				\
+	int __err = 0;								\
+	typeof(*(__ptr)) __user *__src = (__ptr);					\
+										\
+	if (put_user(__s.state, &__src->s.status.state) ||			\
+	    put_user(__s.hw_ptr, &__src->s.status.hw_ptr) ||			\
+	    put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp_sec) ||		\
+	    put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp_nsec) ||	\
+	    put_user(__s.suspended_state, &__src->s.status.suspended_state) ||	\
+	    put_user(__s.audio_tstamp.tv_sec, &__src->s.status.audio_tstamp_sec) ||	\
+	    put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.audio_tstamp_nsec) ||	\
+	    put_user(__c.appl_ptr, &__src->c.control.appl_ptr) ||		\
+	    put_user(__c.avail_min, &__src->c.control.avail_min))		\
+		__err = -EFAULT;						\
+	__err;									\
+})
+
 static int snd_pcm_sync_ptr(struct snd_pcm_substream *substream,
 			    struct snd_pcm_sync_ptr __user *_sync_ptr)
 {
@@ -3165,9 +3193,7 @@ static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
 	if (snd_BUG_ON(!runtime))
 		return -EINVAL;
 
-	if (get_user(sflags, &src->flags) ||
-	    get_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
-	    get_user(scontrol.avail_min, &src->c.control.avail_min))
+	if (snd_pcm_sync_ptr_get_user(sflags, scontrol, src))
 		return -EFAULT;
 	if (sflags & SNDRV_PCM_SYNC_PTR_HWSYNC) {
 		err = snd_pcm_hwsync(substream);
@@ -3200,15 +3226,7 @@ static int snd_pcm_ioctl_sync_ptr_compat(struct snd_pcm_substream *substream,
 	}
 	if (!(sflags & SNDRV_PCM_SYNC_PTR_APPL))
 		snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
-	if (put_user(sstatus.state, &src->s.status.state) ||
-	    put_user(sstatus.hw_ptr, &src->s.status.hw_ptr) ||
-	    put_user(sstatus.tstamp.tv_sec, &src->s.status.tstamp_sec) ||
-	    put_user(sstatus.tstamp.tv_nsec, &src->s.status.tstamp_nsec) ||
-	    put_user(sstatus.suspended_state, &src->s.status.suspended_state) ||
-	    put_user(sstatus.audio_tstamp.tv_sec, &src->s.status.audio_tstamp_sec) ||
-	    put_user(sstatus.audio_tstamp.tv_nsec, &src->s.status.audio_tstamp_nsec) ||
-	    put_user(scontrol.appl_ptr, &src->c.control.appl_ptr) ||
-	    put_user(scontrol.avail_min, &src->c.control.avail_min))
+	if (snd_pcm_sync_ptr_put_user(sstatus, scontrol, src))
 		return -EFAULT;
 
 	return 0;
-- 
2.47.0

