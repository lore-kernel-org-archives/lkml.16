Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44911202998;
	Mon, 26 May 2025 14:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268483; cv=none; b=F5YdSGzRRz7A1PfGAzoBdYCQifxEUbvlrot/roUOsrIfgGSGplWHW/YjvVZsGzHw0WqDFtRYY6uZZMmtRcXZ0fCoiXJDGoFi5YtkGJyWjrql+U2pFKKM2g/qhi67JlQNQyfXYCcR0kT0x92WGyg1J6WzqRJchah9FgOigRKZDMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268483; c=relaxed/simple;
	bh=goUSQdLpIY2NH/Ek9+J+Jas3NOAaNi4mkZBZnKEZ0tc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ERPY+GbgT3FE0UDd6DDygOo2jSdiPV8yVtKdcc9S848/x6ZGsTA0+LKNsL2OwrbnuG7DKYRKWi8n7PMTP3yjBT7rfPTkc8jhc06FzjB70Rc1S31miHACfRQUVLTy7F/JWTp7fGbGuRsylo5Tbr7ZgcZ+7ve9GcHmVNEyRskmxOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kDSCAbwF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kDSCAbwF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748268479;
	bh=goUSQdLpIY2NH/Ek9+J+Jas3NOAaNi4mkZBZnKEZ0tc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kDSCAbwFCSl/PRM5FDxDXnNh922wkvI760R4W2IYD1Nj1fbFiTIIX17Lo+s9JKqfC
	 FS9lXRs+o3erTXl1gpXstr5Ic8VrTlUUelO/cgMRsqlCyliLPx8FUWs4he4WXVo5aH
	 6ilFceGlB4/Oz0fHFhYtjRFXTYcOYTtSWamaQ+F3MPqNzFUvbNKpRiA1CmclOM27M5
	 ZyTYi7JAGVf9CqIM2ofFwI6ARvl2z97MjIpNbkoe5oTrAmCxJ09JPIXWVJ7BPNhGV9
	 CRqVRSipa1MhYYHoFJhqw8jtupSVhEtiBtiP6+yMZ1CxEArLUi3fKzUCzfmyfWtYCu
	 klcx9eDcMKxRA==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 4173517E3701;
	Mon, 26 May 2025 16:07:59 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 26 May 2025 17:07:42 +0300
Subject: [PATCH 3/9] ALSA: usb-audio: Avoid precedence issues in
 mixer_quirks macros
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-dualsense-alsa-jack-v1-3-1a821463b632@collabora.com>
References: <20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com>
In-Reply-To: <20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Fix all macro related issues identified by checkpatch.pl:

  CHECK: Macro argument 'x' may be better as '(x)' to avoid precedence issues

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/usb/mixer_quirks.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index ec14b5ee61c20c9cc098582f078c5a54e9fb0d81..19abd709c4d73939c0a99b82afc1ef155c9f22c3 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2156,15 +2156,15 @@ static int dell_dock_mixer_init(struct usb_mixer_interface *mixer)
 #define SND_RME_CLK_FREQMUL_SHIFT		18
 #define SND_RME_CLK_FREQMUL_MASK		0x7
 #define SND_RME_CLK_SYSTEM(x) \
-	((x >> SND_RME_CLK_SYSTEM_SHIFT) & SND_RME_CLK_SYSTEM_MASK)
+	(((x) >> SND_RME_CLK_SYSTEM_SHIFT) & SND_RME_CLK_SYSTEM_MASK)
 #define SND_RME_CLK_AES(x) \
-	((x >> SND_RME_CLK_AES_SHIFT) & SND_RME_CLK_AES_SPDIF_MASK)
+	(((x) >> SND_RME_CLK_AES_SHIFT) & SND_RME_CLK_AES_SPDIF_MASK)
 #define SND_RME_CLK_SPDIF(x) \
-	((x >> SND_RME_CLK_SPDIF_SHIFT) & SND_RME_CLK_AES_SPDIF_MASK)
+	(((x) >> SND_RME_CLK_SPDIF_SHIFT) & SND_RME_CLK_AES_SPDIF_MASK)
 #define SND_RME_CLK_SYNC(x) \
-	((x >> SND_RME_CLK_SYNC_SHIFT) & SND_RME_CLK_SYNC_MASK)
+	(((x) >> SND_RME_CLK_SYNC_SHIFT) & SND_RME_CLK_SYNC_MASK)
 #define SND_RME_CLK_FREQMUL(x) \
-	((x >> SND_RME_CLK_FREQMUL_SHIFT) & SND_RME_CLK_FREQMUL_MASK)
+	(((x) >> SND_RME_CLK_FREQMUL_SHIFT) & SND_RME_CLK_FREQMUL_MASK)
 #define SND_RME_CLK_AES_LOCK			0x1
 #define SND_RME_CLK_AES_SYNC			0x4
 #define SND_RME_CLK_SPDIF_LOCK			0x2
@@ -2173,9 +2173,9 @@ static int dell_dock_mixer_init(struct usb_mixer_interface *mixer)
 #define SND_RME_SPDIF_FORMAT_SHIFT		5
 #define SND_RME_BINARY_MASK			0x1
 #define SND_RME_SPDIF_IF(x) \
-	((x >> SND_RME_SPDIF_IF_SHIFT) & SND_RME_BINARY_MASK)
+	(((x) >> SND_RME_SPDIF_IF_SHIFT) & SND_RME_BINARY_MASK)
 #define SND_RME_SPDIF_FORMAT(x) \
-	((x >> SND_RME_SPDIF_FORMAT_SHIFT) & SND_RME_BINARY_MASK)
+	(((x) >> SND_RME_SPDIF_FORMAT_SHIFT) & SND_RME_BINARY_MASK)
 
 static const u32 snd_rme_rate_table[] = {
 	32000, 44100, 48000, 50000,

-- 
2.49.0

