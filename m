Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8F31F5827;
	Sat, 14 Jun 2025 06:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749883858; cv=none; b=GuH7fKQjRGAcLnu/nqFdkxT0ztSHIZaqHc547MiVPwd1pNQByuW2yQmfyxj7o5Bb26dKpjlipzLbv56XTATFOWQ3WOf/V8y6BPdB5JItbNt+RAxPCsQadWvKZBv+4sW3QWTV9Y38RiRy7DLqUSnfRJRE7WtU3WsF2txvsuFJDM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749883858; c=relaxed/simple;
	bh=TxFfVJnfi/55ZEHmQBAQ766Sfb3w7ACIMtkxgoYmr8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o7UE+69PahGfQUIk18KHrzdV6oHX63LFnCr7ioHCTFScIzkJibhSu4EdA68F7lXu+FpmYY+XdhAjo4YEgLvhuF9ovuMjjY+ZqYAvmSv8FQCWYG4VWxdcSs2eGBolRzzaVDyzSmCnIyb92nUsJQWdidSttORINmVyTS0iks88NWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bK6Cx56syz9syd;
	Sat, 14 Jun 2025 08:43:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gnLr0TCqepJo; Sat, 14 Jun 2025 08:43:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bK6Cw3LbQz9sy4;
	Sat, 14 Jun 2025 08:43:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6E51E8B77C;
	Sat, 14 Jun 2025 08:43:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id S16e25hkZocH; Sat, 14 Jun 2025 08:43:24 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 08C1E8B77B;
	Sat, 14 Jun 2025 08:43:23 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v3 3/4] ALSA: pcm: Replace [audio_]tstamp_[n]sec by struct __snd_timespec in struct snd_pcm_mmap_status32
Date: Sat, 14 Jun 2025 08:43:16 +0200
Message-ID: <df8ea1a9aff61c3e358759b1f495bdb9fb8a3e6a.1749883041.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1749883041.git.christophe.leroy@csgroup.eu>
References: <cover.1749883041.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749883394; l=2417; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=TxFfVJnfi/55ZEHmQBAQ766Sfb3w7ACIMtkxgoYmr8A=; b=t+LDtHniwILr1P7MDKvZNUmWR4TFFNQ8gxzPAZ7sW8fkBY+hPO1Y2gzQqKJdo03xoJ3Dqstv+ tJizR/qauqBCnz3dQUZ11VHbV66cucQf46urLzATHQAsF/WqDd0lvjf
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

To match struct __snd_pcm_mmap_status and enable reuse of
snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user() by
snd_pcm_sync_ptr() replace tstamp_sec and tstamp_nsec fields by
a struct __snd_timespec in struct snd_pcm_mmap_status32.
Do the same with audio_tstamp_sec and audio_tstamp_nsec.

This is possible because struct snd_pcm_mmap_status32 is packed
and __SND_STRUCT_TIME64 is always defined for kernel which means
struct __snd_timespec is always defined as:

	struct __snd_timespec {
		__s32 tv_sec;
		__s32 tv_nsec;
	};

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 sound/core/pcm_native.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 5eb59fdb3cb2..b7339c9ebb1f 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -3078,11 +3078,11 @@ failed_begin:									\
 		goto failed_begin;						\
 	unsafe_put_user(__s.state, &__src->s.status.state, failed);		\
 	unsafe_put_user(__s.hw_ptr, &__src->s.status.hw_ptr, failed);		\
-	unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp_sec, failed);\
-	unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp_nsec, failed);		\
+	unsafe_put_user(__s.tstamp.tv_sec, &__src->s.status.tstamp.tv_sec, failed);		\
+	unsafe_put_user(__s.tstamp.tv_nsec, &__src->s.status.tstamp.tv_nsec, failed);		\
 	unsafe_put_user(__s.suspended_state, &__src->s.status.suspended_state, failed);		\
-	unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.audio_tstamp_sec, failed);	\
-	unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.audio_tstamp_nsec, failed);	\
+	unsafe_put_user(__s.audio_tstamp.tv_sec, &__src->s.status.audio_tstamp.tv_sec, failed);	\
+	unsafe_put_user(__s.audio_tstamp.tv_nsec, &__src->s.status.audio_tstamp.tv_nsec, failed);\
 	unsafe_put_user(__c.appl_ptr, &__src->c.control.appl_ptr, failed);	\
 	unsafe_put_user(__c.avail_min, &__src->c.control.avail_min, failed);	\
 	__err = 0;								\
@@ -3143,11 +3143,9 @@ struct snd_pcm_mmap_status32 {
 	snd_pcm_state_t state;
 	s32 pad1;
 	u32 hw_ptr;
-	s32 tstamp_sec;
-	s32 tstamp_nsec;
+	struct __snd_timespec tstamp;
 	snd_pcm_state_t suspended_state;
-	s32 audio_tstamp_sec;
-	s32 audio_tstamp_nsec;
+	struct __snd_timespec audio_tstamp;
 } __packed;
 
 struct snd_pcm_mmap_control32 {
-- 
2.47.0

