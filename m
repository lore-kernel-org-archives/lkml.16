Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B64C2701C9;
	Fri,  2 May 2025 23:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746229947; cv=none; b=sy6LxV4veu/yuvoMedcQjfZ8MqdzQhMSxDaXAAQDOoW6mLsR0GoGjmhSEdyvY1zsrLRCVZAC2MwNDWiNKZYIrloPWRdTdZmidr2s+8hoHoPWnj1n+lbYc5bSJD/F+XlkltHVKkpNAaH4ISVM/dq31gpouhtT2NYWZw2TZOjgCYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746229947; c=relaxed/simple;
	bh=sjGyzx5zYffZUol4Bd+XcAn9dmMJPKnOV5ISlUy/8+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r2yOV0NF/lJ7UnXFpo8rDP0iLpdR2Kyfs0AoDpEL1iRNQuGjraNXv60aK6jgKihOKtSPGDyKPrkNS0RMSat/DrFs6aUx0SLsnYIF7qXQdSk6mILo2Wk498noRowwp94BehL2U3OuTsJ0ImD4modhKGfgmfCce46VFuheAV6dPK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=PjVfLC62; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="PjVfLC62"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=x2PLJPmdkpGUaXeB0Vpknxa7Gacsdx48KzqeupzvUGQ=; b=PjVfLC62tZRDMJdw
	eJuHxD/CCzwhbEmysoW0G8LpyNDu8O3DGnpd57lbYEmTioEQBi8RshaoftY4SYbCbMKNZDk2PeMPD
	I8fx3zRHCZyFLEYXPfmbeZ2gc8g17iZgPYjCiE7jlrDYAzclZpIJYEZawSuWdpNC4s4pRlLVJeFdc
	rzMU8bAd21ewHoNxORtWC5Kr2A15PS1DPVCkYONHWQh0AjAVCPkYypuALk5b+P+UKEAF6otvgHaYL
	Gp8SBtVzWIGsRZxsCQ/AqXed6OJrrrNYCwfLr0bNfTGBsDuzWXcoygLhlBgRvfZrRxaLlvy/7qcTz
	lApCfjR+Rwr+HHlCXQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uB0B5-001BML-0N;
	Fri, 02 May 2025 23:52:23 +0000
From: linux@treblig.org
To: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 5/5] ALSA: core: Remove unused snd_jack_set_parent
Date: Sat,  3 May 2025 00:52:19 +0100
Message-ID: <20250502235219.1000429-6-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502235219.1000429-1-linux@treblig.org>
References: <20250502235219.1000429-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

snd_jack_set_parent() was added as part of 2008's
commit e76d8ceaaff9 ("ALSA: Add jack reporting API")

but hasn't been used.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 include/sound/jack.h |  6 ------
 sound/core/jack.c    | 19 -------------------
 2 files changed, 25 deletions(-)

diff --git a/include/sound/jack.h b/include/sound/jack.h
index 1ed90e2109e9..36dc104c1145 100644
--- a/include/sound/jack.h
+++ b/include/sound/jack.h
@@ -79,7 +79,6 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
 		 struct snd_jack **jack, bool initial_kctl, bool phantom_jack);
 int snd_jack_add_new_kctl(struct snd_jack *jack, const char * name, int mask);
 #ifdef CONFIG_SND_JACK_INPUT_DEV
-void snd_jack_set_parent(struct snd_jack *jack, struct device *parent);
 int snd_jack_set_key(struct snd_jack *jack, enum snd_jack_types type,
 		     int keytype);
 #endif
@@ -104,11 +103,6 @@ static inline void snd_jack_report(struct snd_jack *jack, int status)
 #endif
 
 #if !defined(CONFIG_SND_JACK) || !defined(CONFIG_SND_JACK_INPUT_DEV)
-static inline void snd_jack_set_parent(struct snd_jack *jack,
-				       struct device *parent)
-{
-}
-
 static inline int snd_jack_set_key(struct snd_jack *jack,
 				   enum snd_jack_types type,
 				   int keytype)
diff --git a/sound/core/jack.c b/sound/core/jack.c
index e4bcecdf89b7..850f82340278 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -574,25 +574,6 @@ int snd_jack_new(struct snd_card *card, const char *id, int type,
 EXPORT_SYMBOL(snd_jack_new);
 
 #ifdef CONFIG_SND_JACK_INPUT_DEV
-/**
- * snd_jack_set_parent - Set the parent device for a jack
- *
- * @jack:   The jack to configure
- * @parent: The device to set as parent for the jack.
- *
- * Set the parent for the jack devices in the device tree.  This
- * function is only valid prior to registration of the jack.  If no
- * parent is configured then the parent device will be the sound card.
- */
-void snd_jack_set_parent(struct snd_jack *jack, struct device *parent)
-{
-	WARN_ON(jack->registered);
-	guard(mutex)(&jack->input_dev_lock);
-	if (jack->input_dev)
-		jack->input_dev->dev.parent = parent;
-}
-EXPORT_SYMBOL(snd_jack_set_parent);
-
 /**
  * snd_jack_set_key - Set a key mapping on a jack
  *
-- 
2.49.0

