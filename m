Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3312C20E71C;
	Mon, 26 May 2025 14:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268485; cv=none; b=BCQLBCUfPZRjicBm0mJWFXBNXmcosbo4TwWXWk0/vP75nu06w1IdjJ6TiRx/DCCO+Y8ZpavwcKt++viGWo2vu5GwuwckNPlZoxEo5w8M2it3aeFkWC4ARS3NajKUAM539IfWhiP7NK4nVffQ3412ot+J/ZoveZ6JV3Up13bJPws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268485; c=relaxed/simple;
	bh=TQK9H5IOr5u7QW+/6OvA5z2ET++yNWo2hi3BibLCW7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aq7zfJdW35mlAN1UVibsHmcj3Wy1vi+tvZEgb1PEyfd0GRwYFKkxs3aJ82Zri6juIADPPDoqk2ZKuuTP3D8jL9wfgqhpe5V1olh8Rlozmyf9cBKUddKLr8oK1V7IoCriTXwbMNWzPAvlmLtJkF0ImnRz3d2sOb8YdprgLyh81KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AEW9qGdi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AEW9qGdi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748268481;
	bh=TQK9H5IOr5u7QW+/6OvA5z2ET++yNWo2hi3BibLCW7U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AEW9qGdia/5PbzEj+sKB91D9jDt5HzUYU7X/rPD5M2Lgx51re362Ql4BcSMtYev6f
	 /j7zqQmcTcTr6bz/fEVU5JESveyws0BE/G7L0dYISHardo1+ulA+dVXiQNRDiLbkSA
	 IDoTTqNTAZzw38trXuYW2Gh1E7w0Q2Wb77ym6byZ02UDEj4FSUdy3qluvfNZ37eXF+
	 WJq3TQUg7OoFDj9EZS77nmLoMqe/6fw+cuhH2s0SKHTcJUXWsu+KSsd4qYf7TUJyTT
	 blx5Ijwaq+E0k5BfxA4JfESjcJ8RSvZqICY3kLFcGa/Gf3WqD5aySqUFgNRzEA4ViB
	 wBNTYg326J9HQ==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id DEC9D17E3703;
	Mon, 26 May 2025 16:08:00 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 26 May 2025 17:07:44 +0300
Subject: [PATCH 5/9] ALSA: usb-audio: Drop unnecessary parentheses in
 mixer_quirks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-dualsense-alsa-jack-v1-5-1a821463b632@collabora.com>
References: <20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com>
In-Reply-To: <20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Fix multiple 'CHECK: Unnecessary parentheses around ...' reports from
checkpatch.pl.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/usb/mixer_quirks.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 5ef8fc714cc328c2dc71301c0d2128e4329a6170..071a76554d09e631fdc83c5dc5f044eac482a897 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -380,10 +380,10 @@ static int snd_audigy2nx_controls_create(struct usb_mixer_interface *mixer)
 		struct snd_kcontrol_new knew;
 
 		/* USB X-Fi S51 doesn't have a CMSS LED */
-		if ((mixer->chip->usb_id == USB_ID(0x041e, 0x3042)) && i == 0)
+		if (mixer->chip->usb_id == USB_ID(0x041e, 0x3042) && i == 0)
 			continue;
 		/* USB X-Fi S51 Pro doesn't have one either */
-		if ((mixer->chip->usb_id == USB_ID(0x041e, 0x30df)) && i == 0)
+		if (mixer->chip->usb_id == USB_ID(0x041e, 0x30df) && i == 0)
 			continue;
 		if (i > 1 && /* Live24ext has 2 LEDs only */
 			(mixer->chip->usb_id == USB_ID(0x041e, 0x3040) ||
@@ -3955,7 +3955,7 @@ static int snd_djm_controls_update(struct usb_mixer_interface *mixer,
 	int err;
 	const struct snd_djm_device *device = &snd_djm_devices[device_idx];
 
-	if ((group >= device->ncontrols) || value >= device->controls[group].noptions)
+	if (group >= device->ncontrols || value >= device->controls[group].noptions)
 		return -EINVAL;
 
 	err = snd_usb_lock_shutdown(mixer->chip);

-- 
2.49.0

