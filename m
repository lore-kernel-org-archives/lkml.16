Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FAE171CD
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 19:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746991233; cv=none; b=kq6gBJFh1Wh0M5U7qyA/0Ekgbd8L0TnHXgJHMz3HoVxL3anG64ds7ANefsg9Abl8uZzha8ta0g8eprr1w9QRglsgL7gt0YwqXtXilePlmLRkWxQL+qyktN7oAd/DObfbtIe6vnoiukAOFuiQ9o/rt96vQODT3uCbOVNcNZFtd00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746991233; c=relaxed/simple;
	bh=t5dVTCp32WYZx9iv5cpagryELVCp3Jre7TvwO5v+zq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CPXGhdBzkLc0zC20Ya0Rudkaajx7v8PfmTFUZ7Vb6kfMgm0TDGsfWRsSppcdMrlTYJ5AKCNiMjwHqXzFCAQ8PbFHSywiqXlXLiQBBsjoxLx0hgsQzMDUpLbqUCijwWqSJcVBdO+UjqIzEKbC5MxzAzPxOTRiX48CELLAYrObnas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkAnLOgB; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkAnLOgB"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-477296dce8dso43155971cf.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 12:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746991230; x=1747596030; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eggsVU04AUVZUWRg5HaBdUpUX9nV4aUKdNsyJlS/k4A=;
        b=AkAnLOgBkDeATS1Y59+ZTa4bWoHS6P6VSrTmZuHZRGoU1fHhINZcAmq7hN+94tvqai
         1uFKvvVcSkyg9sUDxQT28x7avJDRT5ziOWOdYcYGt4zuY3WjdYmnc/UgvlnCuxs7BXmP
         /uFXURbCYlb1QPYA813jiknowNiMrzCid4Qs7+Kashg/wNLGrv0JnOpfOZYWg8FFGx3Q
         yW6sGA2lDko3aPsogZ/ozO6a3XCBRG5K2xJWzNfodZkdBe0tlcoFv4/ipX6ui/UrtWOD
         /Z32ic43kjFNCBmGEStORQE/eQ4P2zbR2esh/VdrlRBT92/MgRgTyeA+1oPpZYmjHIpn
         LpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746991230; x=1747596030;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eggsVU04AUVZUWRg5HaBdUpUX9nV4aUKdNsyJlS/k4A=;
        b=dkIwS9Trr7wTbWYTasr3rYJUKunNAk817fdt4FXS/6m/Zh3ldtlNwzWimOdvS4tCtw
         Y//TJB588r9oSKhUOOTWZ1G+aPd6Jw5ipJSv969uh+dIkpZFGGUVW+sbGZMRTRKqqfye
         MQ+jq8bnrr2pF98Xq+89L7KDBnCURk8/dPSRc7pTtzHSQed6aY90sH36Y0qUP/N7YGUp
         Xb93SrA5+boEyXKLfPaNkmsysam/OMwaij6jGMMkn2Y6HTY/BMhuFIe7f8TNPfBqGJtA
         YIi313wt+2KYG4uag2+JXjkyjD+Rn+uCDMxyvlpoO7JLlE5W9ckg7KhXy2MMYwwicT4t
         WQ4A==
X-Forwarded-Encrypted: i=1; AJvYcCUdcFhnuQyoP0RuuNfDtt36LoVvIvm+c8AXv/JIbbpgs1p88pp0TvYHqcfFSAmifD140QJOA16J3ot1fPI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+YPjKKAp14ifjPWm+K1L5Q8afBTNnYIvNI8Q7gWCzwLlPZhJH
	+h5dCvi6NFbVbMWrkxjcu8bTWQyxCKVKPoWdEe1gdmI8XUA4mZYv
X-Gm-Gg: ASbGncs4CrH7tS0k/ZSvR+VODiwnFmwXAjgavkUuoyTbmb2mdjXCaLJPGOuCmmJgXzz
	3nkGM46h4MO0ahyBlA0OHRZb04SBWrZbA+e3YR/XmY3TIaLGyb36BFaYWlp+GimhYXn9JPt27AX
	AN7xlbJJjYfoNqgtQzCyD1JMDVsyLKUb8cq8oGRLqLc+zU9UetY9V20Uzcy5y+jTNkHmouI4iGE
	z0KE6kkaTtVWbIlZnIOi+HYq4+BTBB7PYwFBjvdIhbr1CQ+M3G6o8ulXz2DCC5MDA4EUscQXTAF
	JWgvm7Zkdgzlkwikyhwv6lMs776eZxeyPOLhPaj9Sd6Tv+D3VvLc8gr2/57jDuLLy5q+/CqCFMf
	L8cQ=
X-Google-Smtp-Source: AGHT+IHxHdhbMecqAlIJ9BFR5VTyTebEcJ68Sdc+9LQ5gw9CxqdT+Vni7AuYp84juCmiEvqZ7p8faw==
X-Received: by 2002:a05:622a:cf:b0:472:1225:bd98 with SMTP id d75a77b69052e-494527f3b77mr199481001cf.50.1746991230162;
        Sun, 11 May 2025 12:20:30 -0700 (PDT)
Received: from DESKTOP-IH04BR9. ([142.181.68.189])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4945246ca09sm39393991cf.15.2025.05.11.12.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 12:20:29 -0700 (PDT)
From: Gabriel Dalimonte <gabriel.dalimonte@gmail.com>
Date: Sun, 11 May 2025 15:19:53 -0400
Subject: [PATCH v2] drm/vc4: fix infinite EPROBE_DEFER loop
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250511-vc4-audio-inf-probe-v2-1-ac204c961db4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFj4IGgC/32NQQqDMBBFryKz7pQkqJGueg9xMcZEB6qRpA0tk
 rs39QBdvgf//QOiDWwj3KoDgk0c2W8F1KUCs9A2W+SpMCihGlGrFpOpkV4Te+TN4R78aNG1mjo
 iRbITUJZ7sI7fZ7UfCi8cnz58zpMkf/Z/L0mUSI0QumtGLSd3n1fix9X4FYac8xdcQTSItgAAA
 A==
X-Change-ID: 20250426-vc4-audio-inf-probe-f67a8aa2a180
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Gabriel Dalimonte <gabriel.dalimonte@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746991229; l=3254;
 i=gabriel.dalimonte@gmail.com; s=20250426; h=from:subject:message-id;
 bh=t5dVTCp32WYZx9iv5cpagryELVCp3Jre7TvwO5v+zq4=;
 b=xZRAlewdC/XbXWZt7fKdwPsCS1a1+CxfP4Oc/+74mXNFfHKzPzY95a/SUMCfmTW7DFykxP6eO
 UF8NczwHBP+Dg9q27N2Qg3bYC8Nx6LQu7LPVEkcx110RW6/9INBFoZj
X-Developer-Key: i=gabriel.dalimonte@gmail.com; a=ed25519;
 pk=y2QfWJ6TJVcd8RyB6C0zTc7+AqnN6+9cOX7TxbshPMQ=

`vc4_hdmi_audio_init` calls `devm_snd_dmaengine_pcm_register` which may
return EPROBE_DEFER. Calling `drm_connector_hdmi_audio_init` adds a
child device. The driver model docs[1] state that adding a child device
prior to returning EPROBE_DEFER may result in an infinite loop.

[1] https://www.kernel.org/doc/html/v6.14/driver-api/driver-model/driver.html

Fixes: 9640f1437a ("drm/vc4: hdmi: switch to using generic HDMI Codec infrastructure")
Signed-off-by: Gabriel Dalimonte <gabriel.dalimonte@gmail.com>
---
Starting with v6.14, my Raspberry Pi 4B on the mainline kernel started seeing
the vc4 driver looping during probe with:

vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
Registered IR keymap rc-cec
rc rc0: vc4-hdmi-0 as /devices/platform/soc/fef00700.hdmi/rc/rc0
input: vc4-hdmi-0 as /devices/platform/soc/fef00700.hdmi/rc/rc0/input3503
vc4_hdmi fef00700.hdmi: Could not register PCM component: -517

repeating several times per second.

From my understanding, this happens when the sound subsystem can't create a
device, thus returning -517 (EPROBE_DEFER). All of this is consistent with
what I experienced prior to 6.14 as well. However, prior to 6.14 it did not
try to probe infinitely.

Bisecting 6.13 -> 6.14, it looks like
9640f1437a88d8c617ff5523f1f9dc8c3ff29121 [1] moved HDMI audio connector
initialization from vc4 audio initialization to vc4 connector initialization.
If my understanding is correct, this change causes a child device to be added
before EPROBE_DEFER is returned and queues the device probe to happen when a
new device is added, which happens immediately because the audio child device
was added earlier in the probe. 

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9640f1437a88d8c617ff5523f1f9dc8c3ff29121
---
Changes in v2:
- Add Fixes: tag
- Link to v1: https://lore.kernel.org/r/20250426-vc4-audio-inf-probe-v1-1-a500785b71df@gmail.com
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index a29a6ef266f9a5952af53030a9a2d313e2ecdfce..163d092bd973bb3dfc5ea61187ec5fdf4f4f6029 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -560,12 +560,6 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	ret = drm_connector_hdmi_audio_init(connector, dev->dev,
-					    &vc4_hdmi_audio_funcs,
-					    8, false, -1);
-	if (ret)
-		return ret;
-
 	drm_connector_helper_add(connector, &vc4_hdmi_connector_helper_funcs);
 
 	/*
@@ -2291,6 +2285,12 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 		return ret;
 	}
 
+	ret = drm_connector_hdmi_audio_init(&vc4_hdmi->connector, dev,
+					    &vc4_hdmi_audio_funcs, 8, false,
+					    -1);
+	if (ret)
+		return ret;
+
 	dai_link->cpus		= &vc4_hdmi->audio.cpu;
 	dai_link->codecs	= &vc4_hdmi->audio.codec;
 	dai_link->platforms	= &vc4_hdmi->audio.platform;

---
base-commit: b60301774a8fe6c30b14a95104ec099290a2e904
change-id: 20250426-vc4-audio-inf-probe-f67a8aa2a180

Best regards,
-- 
Gabriel Dalimonte <gabriel.dalimonte@gmail.com>

