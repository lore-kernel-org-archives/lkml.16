Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B3420DD52;
	Mon, 26 May 2025 14:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268483; cv=none; b=oggzb9kD+ajZu6azHBoVxi0zZ2ohokYt7wogI0OJPeQZc9yV31I9F27KBVIIdmB7ie5w+R1yA7IZQHP2/1VYjfRg2EHI86OSyeXgTCbkF5zuUe/twRAbH4RI5/YiWwupFi6lfchZBIZMeGIGFUnFzUeJ9010hXBkDr+BvoDBBUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268483; c=relaxed/simple;
	bh=LnnMY7OsQE+JNzaeQA9B1Iaa5QiJtt9qHy8Om26qen0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L7UIQK1Ef919rJ5EeYqU4Mt1f8/+B8OwyFkMIZZnyvzvcqm0Km6RrKd8LNw+G+QK/tEuy/zXVtEcmbZ1yZ2a0er+CFp5FKZF5vpNH7OdQz5SCE5++tJdi1Lc8I99pvTTDsECcROnKmQ7Tc65McoSro1CAgm4ND8ZPW1WUJZSHWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lRoR0R8D; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lRoR0R8D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748268480;
	bh=LnnMY7OsQE+JNzaeQA9B1Iaa5QiJtt9qHy8Om26qen0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lRoR0R8DmaQZg5h4sORGVxs8Bxog//W2p0hNYjt74C08clBv4YuuynUAXPPn0v3Fi
	 nA3OEEQkcpRbDGFrKSchtKp3xKb+sBr+TCai3lzxujxq6rwolMwl3nshWRKWEqtoQN
	 JGS6oS00lS/4qhbMGtxHVXJBG5QRjSPGhX+4xIapmqTPQenk+cXOu3T/bRco3ToSk+
	 Qoz7QVYMOuzm2KFm+/k5jcgeKwCVSmCWGPmipqRDNksnr++TYtwwjZ3/gzSEitUsRw
	 CDBW3fR2CmoBokBui3wfyOlbG6tt69tusFPO4hPxfcsUnZfdKREb2KjnLDo7W2/j8b
	 LCBpWD+zOjsSw==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 1755E17E3702;
	Mon, 26 May 2025 16:08:00 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 26 May 2025 17:07:43 +0300
Subject: [PATCH 4/9] ALSA: usb-audio: Fix block comments in mixer_quirks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-dualsense-alsa-jack-v1-4-1a821463b632@collabora.com>
References: <20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com>
In-Reply-To: <20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Address a couple of comment formatting issues indicated by
checkpatch.pl:

  WARNING: Block comments use a trailing */ on a separate line

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/usb/mixer_quirks.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 19abd709c4d73939c0a99b82afc1ef155c9f22c3..5ef8fc714cc328c2dc71301c0d2128e4329a6170 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -78,7 +78,8 @@ static int snd_create_std_mono_ctl_offset(struct usb_mixer_interface *mixer,
 	cval->idx_off = idx_off;
 
 	/* get_min_max() is called only for integer volumes later,
-	 * so provide a short-cut for booleans */
+	 * so provide a short-cut for booleans
+	 */
 	cval->min = 0;
 	cval->max = 1;
 	cval->res = 0;
@@ -4255,7 +4256,8 @@ static void snd_dragonfly_quirk_db_scale(struct usb_mixer_interface *mixer,
 					 struct snd_kcontrol *kctl)
 {
 	/* Approximation using 10 ranges based on output measurement on hw v1.2.
-	 * This seems close to the cubic mapping e.g. alsamixer uses. */
+	 * This seems close to the cubic mapping e.g. alsamixer uses.
+	 */
 	static const DECLARE_TLV_DB_RANGE(scale,
 		 0,  1, TLV_DB_MINMAX_ITEM(-5300, -4970),
 		 2,  5, TLV_DB_MINMAX_ITEM(-4710, -4160),

-- 
2.49.0

