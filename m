Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9362192F9
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 22:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750286248; cv=none; b=nsBDOkcNLghTigheZRAbAegbTisoqZQIgbUF+r/16kGBuWas9v2WhWXqjkB30HTLtMqbRNrw7P86JIlrDxRJUzsy+4ODn5wDwYQiPSQuVydRzGahyyYILOURHO72tf/b3p6IFOQOnEb5EI87Jsibni/DiLqPXl/5q+WRJElPszI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750286248; c=relaxed/simple;
	bh=xgzbcTSlc7A2T9xXAEBo6stUj3+dzRNVjUmrgd4K2t8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nI+Kptp9/BujyGsH6hJPDklXZ8jY0t7qskf6kUnyD3EL/NMmvK4KxqdGqz4cAJT6HMS7FpgccFema+uwHzbdcmgYZF0iyUl5GQbZcG7DWhXCstcAUh8bm6qu4i6MDz6h5pQTROvaHcJ/RW9C5TWopEZ5UjprDJLeE+fCRZBLtkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KH3mKoD9; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KH3mKoD9"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750286244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Kv3KfRddzWuF3tmaHo/VzvIlYhx1wQ1lEoykLuj/2Dg=;
	b=KH3mKoD9nSMPB916bYsbQoXXeLY3i9SeOljgf3rW46BaKluCJBOdbAwg7x7ucmB8jpB45m
	pm+CaNKG0bhZZQ+QGzIQy1LvjlBYQk8rx8uyTT1KoXCMmdf2L4ntT8PHo1yyxp1UHw459P
	H04AqWceAlDPApf9Vdn6Y5KwT6w0R+Y=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: mixer_oss: Replace deprecated strcpy() with strscpy()
Date: Thu, 19 Jun 2025 00:36:29 +0200
Message-ID: <20250618223631.1244-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() is deprecated; use strscpy() instead.

No functional changes intended.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/core/oss/mixer_oss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index 05fc8911479c..d3d993da3269 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -1014,11 +1014,11 @@ static int snd_mixer_oss_build_input(struct snd_mixer_oss *mixer,
 			
 		if (kctl->info(kctl, uinfo))
 			return 0;
-		strcpy(str, ptr->name);
+		strscpy(str, ptr->name);
 		if (!strcmp(str, "Master"))
-			strcpy(str, "Mix");
+			strscpy(str, "Mix");
 		if (!strcmp(str, "Master Mono"))
-			strcpy(str, "Mix Mono");
+			strscpy(str, "Mix Mono");
 		slot.capture_item = 0;
 		if (!strcmp(uinfo->value.enumerated.name, str)) {
 			slot.present |= SNDRV_MIXER_OSS_PRESENT_CAPTURE;
-- 
2.49.0

