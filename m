Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BC71C8FB5
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750678828; cv=none; b=s6qE8UpVcqdjrAwvQFvLiVYPszJ8AEpg2bqONBtEMgT6ci3GMgbL0gUkt1eKlY9oQkzl4ZrmqQ82s/xWeRkIr2EJ1v5Ez0+WW5o8ClDcFY/PhMPWcB/DmxyA1O/m7QbMHIIbsI2+BX1JgDtRfbXSQ4WxgIj0UAAf+hrqGe3yEN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750678828; c=relaxed/simple;
	bh=O0Hll9tqf5vaAp4T+XgLpGTIeySeDTEEOqSUBPSGiTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jV17x5YCxpmb/o8un8qwrHCQknEmJ4dOZD4OZOluesuIYirt/Lg4R/hnJehN6xKz34fPP4+QRmYbwotcpzPYZaGOtVi/PHp2lE7VuWalfAJzAciQn7xEKCNbY06L7i0GiyM0a/MCm9XVJbdPIro0BtqrW8YMcGNjTKyOI4e3UtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mZqs+6kd; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mZqs+6kd"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750678811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hV5L1hYeLUOf0/Dp7H1uSGfizIrCDJW4pwW2IEWJmOY=;
	b=mZqs+6kd3I64GHE4ROfNpS6p7C5hSWDwlz9+vQJelsL4NsSQYrpYeOig0U8Ntmna+QjYv8
	Q8zZWEn7T4r5E7jFRL3U9glUpS9/4V1WTHi836YTxsAO990Ov0X2pkyiSCG184Qz84JXjx
	MFKI+dMzqu/H//D/eGs4rZ3+lBWCnuk=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: mixer_oss: Remove deprecated strcpy() function calls
Date: Mon, 23 Jun 2025 13:38:54 +0200
Message-ID: <20250623113855.37031-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove the deprecated strcpy() function calls and assign the strings
directly to a 'char *' instead.

Use 'if/else if' instead of two separate if statements.

No functional changes intended.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Assign the strings directly as suggested by Al and Takashi
- Use if/else if instead of if/if
- Link to v1: https://lore.kernel.org/lkml/20250618223631.1244-2-thorsten.blum@linux.dev/
---
 sound/core/oss/mixer_oss.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index 05fc8911479c..e839a4bb93f8 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -991,7 +991,7 @@ static int snd_mixer_oss_build_input(struct snd_mixer_oss *mixer,
 	struct slot *pslot;
 	struct snd_kcontrol *kctl;
 	struct snd_mixer_oss_slot *rslot;
-	char str[64];	
+	const char *str;
 	
 	/* check if already assigned */
 	if (mixer->slots[ptr->oss_id].get_volume && ! replace_old)
@@ -1014,11 +1014,11 @@ static int snd_mixer_oss_build_input(struct snd_mixer_oss *mixer,
 			
 		if (kctl->info(kctl, uinfo))
 			return 0;
-		strcpy(str, ptr->name);
+		str = ptr->name;
 		if (!strcmp(str, "Master"))
-			strcpy(str, "Mix");
-		if (!strcmp(str, "Master Mono"))
-			strcpy(str, "Mix Mono");
+			str = "Mix";
+		else if (!strcmp(str, "Master Mono"))
+			str = "Mix Mono";
 		slot.capture_item = 0;
 		if (!strcmp(uinfo->value.enumerated.name, str)) {
 			slot.present |= SNDRV_MIXER_OSS_PRESENT_CAPTURE;
-- 
2.49.0

