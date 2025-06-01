Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353841CDFD5
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 16:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748796462; cv=none; b=PDa3TrL+R35U4Gjwy/aFumdn1aqiiPBN8DdAN5z0WYQb8eoe8cpno6gGN4JK9OcCbt/m5fZSQky+nIO3hPTbZGJ57IYopM46vRnAEuY0LuODQ53sPSaRpy7L6VAjmGA1cX+Ia4kPlU+eFAlTK0NGxnqJAKKtP6emcHdS/VVxuLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748796462; c=relaxed/simple;
	bh=j0cfU8xaqZBog20Rd/wcr/QwRfbqkqChpxCEWTplL74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NwPLslWlYI3olSGTF/Q+1JVxYbakRrWruQzd7zoXY61z5pQqDJPRJp1aj8HLeQDBLKCGtPLo3X9LexL9mAUNEjN5yKETfes2DCHyDSoFZu0Z2mPG1/AstSqCfFPaFCRbNWnVknrUQhV+DFPs1I0UTbBmdCMjNqtMj69FTOZma6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jprC3GiY; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jprC3GiY"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d094ef02e5so433601585a.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 09:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748796460; x=1749401260; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eggsVU04AUVZUWRg5HaBdUpUX9nV4aUKdNsyJlS/k4A=;
        b=jprC3GiYBxsQ23x6ST+GczvnA/aD6pzInV5DiZcIzvj9y+N3n2idrf4brVuYIbulYf
         NoQAg9PkD8fbNvjs6cklwe50kpORflMbYXSgbA6da9S0CnF9WEInrCyc/4hge+VqCQZx
         l3afxt5yzutGWTjPi75JHCp9+fXMWfnXUroGj2LXnDh/le+6XaAGh/kN2EKqTQLNKs2g
         LS/i8M1stHkIi8mhCMuYYck5kQgD5gsXOi7op5ZVoQ5Kh2vMxDBFNS2JeICEYNjO/8o8
         EpJdhtvv1R0xt9KFnl218nzPgFZgByy/9S9WuQixIsz6seFgX3GZRE9SOeuKHmfaEyvP
         hcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748796460; x=1749401260;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eggsVU04AUVZUWRg5HaBdUpUX9nV4aUKdNsyJlS/k4A=;
        b=oVLKJcWeo2Q2lJRrvmQqK9W5SHesKUcUmQWy7XZfb1I7XDnB5gBR496i52LRKHBUGF
         sltLO6eVKJL+9Fx+5d0xmgJx/m8JFBY5xJuSyAFl+qIuxgDgGTZt5je+O3UFRY9VP2bg
         VWPHVISAvDrubNf8MOiWUaz9l3dF9Zw8RDJJjLeDMzucFJrkHMCHuI9hNMcK8X/NLYf8
         ueZ1Td9Q7Z2geMSkNhBEXrfx83S+dbFuey+G5EuheiYZgMqREilX4rowqQJRuzkCiBa3
         KCYKJu9V+NnECJeCzzBc0qtkl5OPtW5luAdxEJiY/7iat6QGTvkEdrFYppXHDqH5gksY
         CI4w==
X-Forwarded-Encrypted: i=1; AJvYcCVxSUZusSp1eRZRvGPP9EyNdnXK6J1qopP6an9z4tnPdwrrjEKd2SOkKZo3kRStS2rf34RC5sS7TKiAFKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL+K5++BBzXamz/EA03gKpJBmgws88uSPO19VmKyHBluiCYDHF
	JIwwQJbFuGGKvgdorJRHqkOEv0v263Oxz1+Xl3Nnjyamh9GzyS50IMF2
X-Gm-Gg: ASbGncuhiZHWy+fVuQ+P40s4ol81hkwDnA4psqYMO+rv+XzAHGz0H1d+zjMjTJhAdKi
	gql7tqCcbeYxL//yhSV1LUHeBRQyynUcoOeYg1hyOsXjfc6Z+K3tCqHtnQStqX+kbJ85+xt+gqu
	qHbEHRpEDVxqJ4hCHNSgnhCSviY+H9yGUU5V+QhieMhThBQwfmbTfYGt23lfiMu62c0hAhpP5/k
	UpgM5U671PK+1ngLYDtM3o7GwrqRWV/vmOHOwizkLmQEve0+kDr24lDg3T0yucwnSCv8kLsbzea
	35SqkwSxNUPKIlD6Mpv2JCkn55Cbkn/tf5hxxlGdPKPswZQJXuX6YmMCZ+08WyFfSSKgH2HHwno
	egaDRExKpU+gsv7JIkw==
X-Google-Smtp-Source: AGHT+IG8CQDqpXHerlK5xLSeoU2tM8NPyLgN6r+TOGeCSx3gwnZH5FLkLpiCdrK4cHRpMnW1Hsv64A==
X-Received: by 2002:a05:620a:4390:b0:7ce:ea46:94e9 with SMTP id af79cd13be357-7d09878b60cmr2258334085a.11.1748796459994;
        Sun, 01 Jun 2025 09:47:39 -0700 (PDT)
Received: from DESKTOP-IH04BR9.localdomain ([142.181.68.189])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a195573sm507438585a.89.2025.06.01.09.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 09:47:39 -0700 (PDT)
From: Gabriel Dalimonte <gabriel.dalimonte@gmail.com>
Date: Sun, 01 Jun 2025 12:45:36 -0400
Subject: [PATCH RESEND v2] drm/vc4: fix infinite EPROBE_DEFER loop
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250601-vc4-audio-inf-probe-v2-1-9ad43c7b6147@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748796457; l=3253;
 i=gabriel.dalimonte@gmail.com; s=20250426; h=from:subject:message-id;
 bh=j0cfU8xaqZBog20Rd/wcr/QwRfbqkqChpxCEWTplL74=;
 b=Gh72AQoyXv7PCjiHkqfZK1jlJHR9ImWecDSXQ+EofSqxEYRLtrdxpptXDMM/iImnxhnruf/lr
 y+b9mvVAxKdDUuVkDysQcgIoPENmoNmc8NeOgoAZ5DWfnC8TlxZDM3S
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

