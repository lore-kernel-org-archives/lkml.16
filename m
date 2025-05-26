Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7F7210198;
	Mon, 26 May 2025 14:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268485; cv=none; b=M3tvnG4O86HZUcFHTYa0ux5RMgFIHV+DQud/WiXs/7Kn9Rtxe9PFKHkYBn9YH5ba6/RWLuLEv9JvE9MU4Tuqa8ug5p5aODMguGhyaLD2rSgoqdi0ry+asU2NVsU30tucD/Pe0wvkDFE5iTqR0HKJUptlYqO7kDYiozV+p6SplSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268485; c=relaxed/simple;
	bh=wgQC4enfJjyfyCiM8wfs2Rxkncl2OSxrlm9/LD/5aq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cOiPRBoPjNRNFu31UyHQBWz+LOWaTj4/nxcv34ndta5L2O71tC/aEXUDfb3vzvMlEamPmyV+wzSWSK/giOjmw45s+PNEhEyegIK0YUh6EgnDZ2Pjp32kWP6jCcfnbb0uONia2Sdp+V/Xqq3ypZIldrssWoHhTx+jGVjAf9ZV+JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MeV7mhGm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MeV7mhGm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748268481;
	bh=wgQC4enfJjyfyCiM8wfs2Rxkncl2OSxrlm9/LD/5aq8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MeV7mhGm377R9yQzHiIcMUFjtXQkJPLJkiekLQkVPSex7TOxl9PkeqBLfaJXx0nXl
	 f9cA4SUxAEMqLtj4WzKvw6+tVGBM9UM9KuVIaxh5L5I9N3pmMVs8l2IqauMnn7ooNP
	 qFRooZ3J0WtH5TmKaqcc0R6foB04cxbn/MfOXJgp6JohAUG51x4Rb0IKGC+9AMe5bH
	 70OOwv9T79uQLYvMV6r3/2q3KSGJZuhWxwdlbDWUi0v7x3RJZD28+PTuZbN99gaC9U
	 YK90PMvVAmaWZPokMkHrdxN1cY/opo6WHtiy41rhYb1sWvKNsCSIpl0/xqnwXfNHvs
	 DIoXzryF/1a2g==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id ADF3717E3716;
	Mon, 26 May 2025 16:08:01 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 26 May 2025 17:07:45 +0300
Subject: [PATCH 6/9] ALSA: usb-audio: Avoid multiple assignments in
 mixer_quirks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-dualsense-alsa-jack-v1-6-1a821463b632@collabora.com>
References: <20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com>
In-Reply-To: <20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Handle report from checkpatch.pl:

  CHECK: multiple assignments should be avoided

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 sound/usb/mixer_quirks.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 071a76554d09e631fdc83c5dc5f044eac482a897..17c9cbbfce224cdcd4f80802b7fbe377969d289f 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -1739,7 +1739,8 @@ static int snd_microii_spdif_default_put(struct snd_kcontrol *kcontrol,
 	unsigned int pval, pval_old;
 	int err;
 
-	pval = pval_old = kcontrol->private_value;
+	pval = kcontrol->private_value;
+	pval_old = pval;
 	pval &= 0xfffff0f0;
 	pval |= (ucontrol->value.iec958.status[1] & 0x0f) << 8;
 	pval |= (ucontrol->value.iec958.status[0] & 0x0f);

-- 
2.49.0

