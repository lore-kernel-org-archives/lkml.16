Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AD52139C8;
	Mon, 26 May 2025 14:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268487; cv=none; b=CLJKMTYL9EiKyWNS41faxSiVvrkwQrSdShsn52X8brykwSSyKwIpHBYCz4oi7OAYsqN3trovw2PNHEINWKCM1Rb/o3hH+zENy4GWuZfUAnQLFX4EUHj5WbYeWFuDEMcvxTJBSKfzi1SKY221l2RVkIE8zMEh3k3wxjNG7UM+IlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268487; c=relaxed/simple;
	bh=owUJ57FVHFzWDxKpviR6uO5WheEy4uv8zmSWZJXBe0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BubwfdPSB+c7ezw7OopgUGlVNHbPCAdNdAFjWEtrB+FrnrBbA2Lu317lr9au5CoK1zAjoHRP7Zwna0J2lbm++bb7Db5IfyzKH5ZhSZcpFqtTYH1p587qtBLbUQ8VCEy134orhgpihSZpK1WlxINgiGi69P3FhJk0T5b0MSC/0N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SsIC4Huk; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SsIC4Huk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748268483;
	bh=owUJ57FVHFzWDxKpviR6uO5WheEy4uv8zmSWZJXBe0Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SsIC4Huk24euC21ipxtjoRe7uTK3N6DadoqzdotcwYwShWPrBcLWq6dkeet91tmi4
	 fsHMCOhXx0Vu83Y1Pv0idS0gozpKsX3Qwq2RCsnkCcY7U1BmXy0jBm7cjZRZZ5Pzv2
	 YSLH2dujGZCA653cAx9moA/p7q1rE1tNiuOkxEFMnVHv3LSD6Idd5XzPnf2mKrLSwZ
	 YIIMGow0i4x1NVPQkA7j1lRXC32aVQGtSj7KN+tHu7wcgYg5SnyL4qKcFEQUO8XYiz
	 f8QKYwxyir/si3L1aYQ2OO/B2NTmkf/ih/sn5ehjkr1c7O96IPwJpNzBAtKoK47G0i
	 HEWHT6tnus5mw==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 4613717E1560;
	Mon, 26 May 2025 16:08:03 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 26 May 2025 17:07:47 +0300
Subject: [PATCH 8/9] ALSA: usb-audio: Remove unneeded wmb() in mixer_quirks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-dualsense-alsa-jack-v1-8-1a821463b632@collabora.com>
References: <20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com>
In-Reply-To: <20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Adding a memory barrier before wake_up() in
snd_usb_soundblaster_remote_complete() is supposed to ensure the write
to mixer->rc_code is visible in wait_event_interruptible() from
snd_usb_sbrc_hwdep_read().

However, this is not really necessary, since wake_up() is just a wrapper
over __wake_up() which already executes a full memory barrier before
accessing the state of the task to be waken up.

Drop the redundant call to wmb() and implicitly fix the checkpatch
complaint:

  WARNING: memory barrier without comment

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/usb/mixer_quirks.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 783789cbcfe2901d7dcf30580fa19bac62898897..ffda3b8d42cc6b05ea26726616196a012cb6d1e4 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -212,7 +212,6 @@ static void snd_usb_soundblaster_remote_complete(struct urb *urb)
 	if (code == rc->mute_code)
 		snd_usb_mixer_notify_id(mixer, rc->mute_mixer_id);
 	mixer->rc_code = code;
-	wmb();
 	wake_up(&mixer->rc_waitq);
 }
 

-- 
2.49.0

