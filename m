Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C62212B0A;
	Mon, 26 May 2025 14:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268486; cv=none; b=VluWvHUiHEX75NI6PQGoHk95nUwa0tnuQqTj2JY3h7XXxYe8Cep7gS84aOloP/tO3xqhVsZhAgKCJmTqQRoSYcueb0r21KfGYU0w+nIY/8vfHG2oJ2qKUSecFtjUDKJhiCoknkFmCMOETZMWlWPwzB29uX6ZfjFgodm2hxyOj4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268486; c=relaxed/simple;
	bh=Zn1nxRIZwpG9gkrQZ1+GbKqVwAFGF98enOifZD+Uysw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h13XGt36/bTM5xPXbSb5eqYgIW7gyAUKES2JJcyx+dm1OyMGnlvN82X5IuG6MQlE44aS0n9IFbp4bUtG/PacU2pHYIapixehtW3bL241x/J04kS3/rNcdZOiW5mA4VwDPN8EFjZFesrn2H7euzFvkFhrFk+c6YQMk/XVTAofCro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pbE24td1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pbE24td1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748268482;
	bh=Zn1nxRIZwpG9gkrQZ1+GbKqVwAFGF98enOifZD+Uysw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pbE24td16JEEK1xpt6vjD4CXXi4gMhE+k6ThvstQcWQtLsKcFT3vXZ1bXidczJqpe
	 kZVuFOA5HUn2hc/CYqrw5ExIpnSJm3Y2CkGsWdDbxUAHQd6fr70h+IdMkdaeulnSj3
	 zks5scFHecmuAxfjTRSN+RAVE3XJ0+FcnqrDEcmMPIZyjwJxU7/2EWvZqPlCdxQynB
	 5ACo2u87GxpeaojzsV5X0TXKTkAp7wAGB8eiT0s6XAzfIxgSiGlbVLc1IjbwjCqmCw
	 26CmXy56a+bEBgGGgdFgRKnA9+1EqgXNk8rXJpjENZfMo+dK5X4c3e9tMfTFjZRfhE
	 vcwOpWIFFBvhA==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 7742F17E1553;
	Mon, 26 May 2025 16:08:02 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 26 May 2025 17:07:46 +0300
Subject: [PATCH 7/9] ALSA: usb-audio: Simplify NULL comparison in
 mixer_quirks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-dualsense-alsa-jack-v1-7-1a821463b632@collabora.com>
References: <20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com>
In-Reply-To: <20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Handle report from checkpatch.pl:

  CHECK: Comparison to NULL could be written "t->name"

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/usb/mixer_quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 17c9cbbfce224cdcd4f80802b7fbe377969d289f..783789cbcfe2901d7dcf30580fa19bac62898897 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -129,7 +129,7 @@ static int snd_create_std_mono_table(struct usb_mixer_interface *mixer,
 {
 	int err;
 
-	while (t->name != NULL) {
+	while (t->name) {
 		err = snd_create_std_mono_ctl(mixer, t->unitid, t->control,
 					      t->cmask, t->val_type, t->name,
 					      t->tlv_callback);

-- 
2.49.0

