Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84C01FC7F1;
	Fri, 13 Jun 2025 15:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749829842; cv=none; b=MmB3dgyDmAYjucbx5HN5XK28SyGjCqyLBsrAxubt1fUvE0Ud/zkcTAbtnyAmdZfpGaFhVvwFjaB7yGttLt0swo2dQV20mVcNN1gwt6sE4pKgYh7zGzRRTGpjBTr7EnU+/FTO559rtlrD5rJ/B+ZvB8VCTo5lf70l09aZ3s0LF7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749829842; c=relaxed/simple;
	bh=fpYw3nOP4OtD5+jA3VODm8ZtGI8XFR4GNg4zhN1spd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBM/XAviiU+qHt4237Hes9/we8Oe4f6VZa7AFI7fpGDAOazFO5RF8tLwpyQC3boRXTjeScOThnay7BmOAjhb1nDyvJs8X/fHAmyVn2MFU3hF8Rt/k3NBsfbzyjeIQHpNtZMk1wYHmXV/kqyi66AhvOoJHHtJzSqzjRmWvhbczS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bJk6R3LDbz9st4;
	Fri, 13 Jun 2025 17:37:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1fj8onNIzymh; Fri, 13 Jun 2025 17:37:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bJk6P5sPmz9sr6;
	Fri, 13 Jun 2025 17:37:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C353F8B77C;
	Fri, 13 Jun 2025 17:37:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 39M8agvPvxS8; Fri, 13 Jun 2025 17:37:17 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 540D38B769;
	Fri, 13 Jun 2025 17:37:17 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v2 2/4] ALSA: pcm: Convert SNDRV_PCM_IOCTL_SYNC_PTR to user_access_begin/user_access_end()
Date: Fri, 13 Jun 2025 17:37:09 +0200
Message-ID: <abb97ecdf9af8a9a63b03e59ff7ac338f6ce83f4.1749828169.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1749828169.git.christophe.leroy@csgroup.eu>
References: <cover.1749828169.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749829028; l=5662; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=fpYw3nOP4OtD5+jA3VODm8ZtGI8XFR4GNg4zhN1spd4=; b=VYmWe2b2cBDV2fAT1lyjaUFcmggqdRwVwYQyq5L/fXP23iyMsWHcy8kjTQwNcb5fDi/fNfANZ oekkSiTdmd0C+yLMG8hgkHVNJYWHTvnve6zkMFIi79haTwo2YsvrNL8
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

With user access protection (Called SMAP on x86 or KUAP on powerpc)
each and every call to get_user() or put_user() performs heavy
operations to unlock and lock kernel access to userspace.

SNDRV_PCM_IOCTL_SYNC_PTR is a hot path which is called really often
and needs to run as fast as possible.

To improve performance, perform user accesses by blocks using
user_access_begin/user_access_end() and unsafe_get_user()/
unsafe_put_user().

Before the patch the 9 calls to put_user() at the end of
snd_pcm_ioctl_sync_ptr_compat() imply the following set of
instructions about 9 times (access_ok - enable user - write - disable
user):
    0.00 :   c057f858:       3d 20 7f ff     lis     r9,32767
    0.29 :   c057f85c:       39 5e 00 14     addi    r10,r30,20
    0.77 :   c057f860:       61 29 ff fc     ori     r9,r9,65532
    0.32 :   c057f864:       7c 0a 48 40     cmplw   r10,r9
    0.36 :   c057f868:       41 a1 fb 58     bgt     c057f3c0 <snd_pcm_ioctl+0xbb0>
    0.30 :   c057f86c:       3d 20 dc 00     lis     r9,-9216
    1.95 :   c057f870:       7d 3a c3 a6     mtspr   794,r9
    0.33 :   c057f874:       92 8a 00 00     stw     r20,0(r10)
    0.27 :   c057f878:       3d 20 de 00     lis     r9,-8704
    0.28 :   c057f87c:       7d 3a c3 a6     mtspr   794,r9
...

A perf profile shows that in total the 9 put_user() represent 36% of
the time spent in snd_pcm_ioctl() and about 80 instructions.

With this patch everything is done in 13 instructions and represent
only 15% of the time spent in snd_pcm_ioctl():

    0.57 :   c057f5dc:       3d 20 dc 00     lis     r9,-9216
    0.98 :   c057f5e0:       7d 3a c3 a6     mtspr   794,r9
    0.16 :   c057f5e4:       92 7f 00 04     stw     r19,4(r31)
    0.63 :   c057f5e8:       93 df 00 0c     stw     r30,12(r31)
    0.16 :   c057f5ec:       93 9f 00 10     stw     r28,16(r31)
    4.95 :   c057f5f0:       92 9f 00 14     stw     r20,20(r31)
    0.19 :   c057f5f4:       92 5f 00 18     stw     r18,24(r31)
    0.49 :   c057f5f8:       92 bf 00 1c     stw     r21,28(r31)
    0.27 :   c057f5fc:       93 7f 00 20     stw     r27,32(r31)
    5.88 :   c057f600:       93 36 00 00     stw     r25,0(r22)
    0.11 :   c057f604:       93 17 00 00     stw     r24,0(r23)
    0.00 :   c057f608:       3d 20 de 00     lis     r9,-8704
    0.79 :   c057f60c:       7d 3a c3 a6     mtspr   794,r9

Note that here the access_ok() in user_write_access_begin() is skipped
because the exact same verification has already been performed at the
beginning of the fonction with the call to user_read_access_begin().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 sound/core/pcm_native.c | 42 +++++++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 20326aa377b0..fd69eea935b2 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3053,30 +3053,40 @@ static inline int snd_pcm_hwsync(struct snd_pcm_substream *substream)
 }
 
 #define snd_pcm_sync_ptr_get_user(__f, __c, __ptr) ({				\
-	int __err = 0;								\
+	__label__ failed;							\
+	int __err = -EFAULT;							\
 	typeof(*(__ptr)) __user *__src = (__ptr);					\
 										\
-	if (get_user(__f, &src->flags) ||					\
-	    get_user(__c.appl_ptr, &__src->c.control.appl_ptr) ||		\
-	    get_user(__c.avail_min, &__src->c.control.avail_min))		\
-		__err = -EFAULT;						\
+	if (!user_read_access_begin(__src, sizeof(*__src)))			\
+		goto failed;							\
+	unsafe_get_user(__f, &__src->flags, failed);				\
+	unsafe_get_user(__c.appl_ptr, &__src->c.control.appl_ptr, failed);	\
+	unsafe_get_user(__c.avail_min, &__src->c.control.avail_min, failed);	\
+	__err = 0;								\
+failed:										\
+	user_read_access_end();							\
 	__err;									\
 })
 
 #define snd_pcm_sync_ptr_put_user(__s, __c, __ptr) ({				\
-	int __err = 0;								\
+	__label__ failed;							\
+	int __err = -EFAULT;							\
 	typeof(*(__ptr)) __user *__src = (__ptr);					\
 										\
-	if (put_user(__s.state, &__src->s.status.state) ||			\
-	    put_user(__s.hw_ptr, &__src->s.status.hw_ptr) ||			\
-	    put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp_sec) ||		\
-	    put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp_nsec) ||	\
-	    put_user(__s.suspended_state, &__src->s.status.suspended_state) ||	\
-	    put_user(__s.audio_tstamp.tv_sec, &__src->s.status.audio_tstamp_sec) ||	\
-	    put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.audio_tstamp_nsec) ||	\
-	    put_user(__c.appl_ptr, &__src->c.control.appl_ptr) ||		\
-	    put_user(__c.avail_min, &__src->c.control.avail_min))		\
-		__err = -EFAULT;						\
+	if (!user_write_access_begin(__src, sizeof(*__src)))			\
+		goto failed;							\
+	unsafe_put_user(__s.state, &__src->s.status.state, failed);		\
+	unsafe_put_user(__s.hw_ptr, &__src->s.status.hw_ptr, failed);		\
+	unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp_sec, failed);\
+	unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp_nsec, failed);		\
+	unsafe_put_user(__s.suspended_state, &__src->s.status.suspended_state, failed);		\
+	unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.audio_tstamp_sec, failed);	\
+	unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.audio_tstamp_nsec, failed);	\
+	unsafe_put_user(__c.appl_ptr, &__src->c.control.appl_ptr, failed);	\
+	unsafe_put_user(__c.avail_min, &__src->c.control.avail_min, failed);	\
+	__err = 0;								\
+failed:										\
+	user_write_access_end();						\
 	__err;									\
 })
 
-- 
2.47.0

