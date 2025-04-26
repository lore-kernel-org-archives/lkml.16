Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0654D1ABEC5
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 06:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745648602; cv=none; b=kVQ4ZzRbv1aHi3CwMKMsbtxYGiAkQ6mmHiG/g+4vUGo4pEa+hLg08RL2YMmqo99ozP8UnaXAAk8Zx/e9EhHKnsWZlNs7uedaZRvqzYfKj5b6NcORatlLr+8LBokzUyBOIDOb9/1/WZjmr7Ih0bgGeq6rzXroFWR0o++9pjKtrds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745648602; c=relaxed/simple;
	bh=bTFlO0TwF8sw3rIs76AU9tYPoYlXU0yDlOFLlIGtuJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oSLRwbGCcE/74Qkv03GwWFaNTEHgniO4E7lMc4nbCnwvsgwzEv7GZCA0Qs6HjvY/PSlOxpQy7JznyZCsv6aM3XV9T/tJcFL4L/cBEj9gQyeeviXsDCBxCCyPM1h3IxHe1h13Yka9uLYxJ9xh00OaFeoTbg9cr1KxW5AaXoiLSy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E90ZqQJT; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E90ZqQJT"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7be49f6b331so367192885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745648599; x=1746253399; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yYjPYlG/aOt+7muqnNSQUYn87RZuOsFelShjtJk3VdA=;
        b=E90ZqQJTzBlubLAJ0GgdpBHgMq4Ax0PqCtYPoLvAX/zZlbxEu1kstOwiTEJWKW7f60
         M6ZLRAtSeTNSAQvzIkdzEwDSDgc1CLqJ4ZRhrDiFhp2aO+RNYa6QyAxKa/au5DfZxLd/
         +8+zXHc3uLphqO6cfFm1WLzSiclHKJbWCoXmQQCoJOO9uVYAcrphW9Flc6YCyPDX41UJ
         5oFph0G7J9Oi8IPa1tRV+zaU1RLBqG+4sQrlW/9DcdUvAXzsJapYetNj9EDY63Qk2JjN
         GrY8g7Dk2MN5wPBdUm3eKLHVPRV4wFGSmDVL2E+EhURAfJjE7yAcIA1S0s4KwODq5MhT
         0bCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745648599; x=1746253399;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yYjPYlG/aOt+7muqnNSQUYn87RZuOsFelShjtJk3VdA=;
        b=MgbqNtqjrOPyvDlnO7muG5lJ6WJo9a0rYIeSaiJiKIY1EUTofNzWyzvT6eUoCKfqum
         z7c7mKbs+onLgTU2ATS/wX54Re/DfIVwg8VGY7TakuRylofSU4UdHaZ517hgFwZAYaTV
         u8ZZACHqHJn4JBe9gSUNcPsWzXQntSTOlKBp4YGiJs/uoxGfj00A4TRkztplKXO76RD4
         Ol2cdiyP+UuZHopw0TL7BF/nGnLwmICe1BZjRozMOl5eMpY1ZYtCVsHgUMVuFQhgFqi2
         Lpfg0o0/ZVjBIv3z4qEBzeWsaHI3CUsRwHky1CLemLO9b3byNPObq6rGdwapwxGtrhX9
         eLnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7zIcUBJoP4VajXPG8o2jyWPITGeUUDLcJxEXSLm4ne2wYarUbBYrb6mxP9QQwMFRaJUlcotAErhJjAQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUeGv6+PvIAd+c/TaNoG4MqAKWLCgqnQPfHD5pDTJLygcQcK75
	4/ATmuOaCy4fnezWahgKRUS2aq2AI1xPdZ5zsh3R4z9DNMQAzkoTsHE9gA==
X-Gm-Gg: ASbGncsWf606+ngUPGYDxM+/Ya4XjJ6pA3Qmp2NHIDzf2yJvT0rRHJI5caTJyS583wt
	fpgZDPw7BkFxxIKn0lF7priUaODKxO6p2lu2mFqH5qAQUCiVmcBuEI6w0kk/5hNwKcu8rzgP7js
	bzNFuNk/rdzVhqaIBKYu7QQbH7mHuWAEkghIVrxM15zm/U+gu18YQBXKslxuekDgdATlTnD4j0n
	obHP0RUtA8ymb7bbN530PODCWufDpIvMygBIALTDpxV+s5OXpxzuzYrNRvU4doNlzOYK1p1qizE
	E2kAYxB5znBHN2xGiO9WsbH61sS0gKUWEIkJy06PW/qk2Yeesx8GDW12
X-Google-Smtp-Source: AGHT+IHFkpV0m/2kCRCnG4UBJMY+2A70QyJWPMyvnAmt2xVVw7MRyayQRC2/jvS7+UjWFurLbcUqvg==
X-Received: by 2002:a05:620a:390c:b0:7c5:79c6:645d with SMTP id af79cd13be357-7c9606ac6e6mr672821185a.11.1745648599506;
        Fri, 25 Apr 2025 23:23:19 -0700 (PDT)
Received: from DESKTOP-IH04BR9. ([174.88.143.14])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958e7c035sm313919785a.78.2025.04.25.23.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 23:23:19 -0700 (PDT)
From: Gabriel Dalimonte <gabriel.dalimonte@gmail.com>
Date: Sat, 26 Apr 2025 02:22:58 -0400
Subject: [PATCH] drm/vc4: fix infinite EPROBE_DEFER loop
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250426-vc4-audio-inf-probe-v1-1-a500785b71df@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMF7DGgC/x3MTQqAIBBA4avErBtQ6Ue6SrSYaqzZqChJEN09a
 fkt3nsgcxLOMDUPJC6SJfgK3TawneQPRtmrwSjTq84MWLYO6doloHiHMYWV0Q0jWSJD2iqoZUz
 s5P6v8/K+H+bGmFZlAAAA
X-Change-ID: 20250426-vc4-audio-inf-probe-f67a8aa2a180
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Gabriel Dalimonte <gabriel.dalimonte@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745648599; l=3157;
 i=gabriel.dalimonte@gmail.com; s=20250426; h=from:subject:message-id;
 bh=bTFlO0TwF8sw3rIs76AU9tYPoYlXU0yDlOFLlIGtuJY=;
 b=Ykw0DUw1uI7iXb4HJ2AglC6VizvnISjek0BPMA82rTon2tQZWXXn5RsBR2FPwM2X62PNKTyOY
 WpSGRjVyO6MCYcawa4mCl0NVSuUAg7R2z6UqHDH+yAexCuWZFthUklW
X-Developer-Key: i=gabriel.dalimonte@gmail.com; a=ed25519;
 pk=y2QfWJ6TJVcd8RyB6C0zTc7+AqnN6+9cOX7TxbshPMQ=

`vc4_hdmi_audio_init` calls `devm_snd_dmaengine_pcm_register` which may
return EPROBE_DEFER. Calling `drm_connector_hdmi_audio_init` adds a
child device. The driver model docs[1] state that adding a child device
prior to returning EPROBE_DEFER may result in an infinite loop.

[1] https://www.kernel.org/doc/html/v6.14/driver-api/driver-model/driver.html

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

From my understanding, this happens due to the mainline kernel missing the
patches to support audio portion of the HDMI interface. In this case, or
other cases where the sound subsystem can't create a device, it returns
-517 (EPROBE_DEFER). All of this is consistent with what I experienced prior
to 6.14 as well. However, prior to 6.14 it did not try to probe infinitely.

Bisecting 6.13 -> 6.14, it looks like
9640f1437a88d8c617ff5523f1f9dc8c3ff29121 [1] moved HDMI audio connector
initialization from audio vc4 audio initialization to vc4 connector
initialization. If my understanding is correct, this change causes a child
device to be added before EPROBE_DEFER is returned and queues the device probe
to happen when a new device is added, which happens immediately because the
audio child device was added earlier in the probe. 

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9640f1437a88d8c617ff5523f1f9dc8c3ff29121
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

