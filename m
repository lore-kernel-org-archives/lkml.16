Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4C71B041A;
	Mon, 16 Jun 2025 05:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.236.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750051237; cv=none; b=XzzyZEx0nMvtPZIp3uLPusYwioo/SWLmH7H1MboqMMts6FMIdG+7IWpNyg3mXk3qxj2CEi9DA7RAXViEil2M+VomsWm2FmiXXKVm2TsSZduE3i4owF2JzlBBqGfqrZrI/RUfWN7eqPX5a9oDGaNOFjNeerY8OYAIDkx6CpHWRPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750051237; c=relaxed/simple;
	bh=xZfMpcaAJypo8xW2lO2HU1GylS4Dp/zzkpIUOwMDvWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EETGQLGe4spZW4qfQl9FMlCOWKL8CqF7Jgy3whTz2fCQYP17oD1XWy7yMKO0s6cCVALNmKM6hQMDNgak6wg0YrVZtxp7+SHO5TdP/EvKJoTPhHmMXv5SbGZVn/ZtiXN+55XsSRNQy0OAjWo+Qj/+Yo5JUSn+Cg0TVaCGwaVDRtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.236.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bLJ620D1Tz9sv8;
	Mon, 16 Jun 2025 07:12:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RSs8tuDgJhFH; Mon, 16 Jun 2025 07:12:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bLJ616KWPz9st4;
	Mon, 16 Jun 2025 07:12:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CB2868B764;
	Mon, 16 Jun 2025 07:12:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Rr37r5e5VLCk; Mon, 16 Jun 2025 07:12:25 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 67F758B763;
	Mon, 16 Jun 2025 07:12:25 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] ALSA: pcm: Replace [audio_]tstamp_[n]sec by struct __snd_timespec64 in struct snd_pcm_mmap_status_x32
Date: Mon, 16 Jun 2025 07:12:23 +0200
Message-ID: <e46139ed61bc52fab51babadb8b656fa1aa15506.1750050658.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750050743; l=1658; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=xZfMpcaAJypo8xW2lO2HU1GylS4Dp/zzkpIUOwMDvWU=; b=At18Z5Fc4zdB3x4w6XOU3pi1TVg75/+RxtbjV66c1LgIcr60frXVBJv1tni34PzNdunz11+Ye jnDuRaIAbKbC3D9+WM9Ha3jLIEcRzlL7OoqfFg24xwk+DsZ1ywp9fMF
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

To match struct __snd_pcm_mmap_status and enable reuse of
snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user() by
snd_pcm_sync_ptr() replace tstamp_sec and tstamp_nsec fields by
a struct __snd_timespec64 in struct snd_pcm_mmap_status_x32.
Do the same with audio_tstamp_sec and audio_tstamp_nsec.

This is possible because struct snd_pcm_mmap_status_x32 is packed
and __SND_STRUCT_TIME64 is always defined for kernel which means
struct __snd_timespec64 is always defined as struct __kernel_timespec
which is:

	struct __kernel_timespec {
		long long tv_sec;
		long long tv_nsec;
	};

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: a0f3992ee86e ("ALSA: pcm: Replace [audio_]tstamp_[n]sec by struct __snd_timespec in struct snd_pcm_mmap_status32")
Closes: https://lore.kernel.org/all/20250616130126.08729b84@canb.auug.org.au/
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
Might be squashed with a0f3992ee86e if you happen to rebase sound tree.
---
 sound/core/pcm_compat.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index 17540020ac2f..54eb9bd8eb21 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -377,12 +377,10 @@ struct snd_pcm_mmap_status_x32 {
 	s32 pad1;
 	u32 hw_ptr;
 	u32 pad2; /* alignment */
-	s64 tstamp_sec;
-	s64 tstamp_nsec;
+	struct __snd_timespec64 tstamp;
 	snd_pcm_state_t suspended_state;
 	s32 pad3;
-	s64 audio_tstamp_sec;
-	s64 audio_tstamp_nsec;
+	struct __snd_timespec64 audio_tstamp;
 } __packed;
 
 struct snd_pcm_mmap_control_x32 {
-- 
2.47.0

