Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B3981724;
	Mon, 26 May 2025 14:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748268481; cv=none; b=md8xKtuLrEFYOFp3c9Uwg/JaRL2ckcROGeLhzlI3ZsfKIkiMgXeCMFUgcRmef3NQ3gpajlv3mtV0LV+4MtqSrHNcjfox5mh4JhU8WPmdL8O+F4/6Sa+IEvdw4YJEkdHvO2mZXSvPw9m0gkEMPN2KLPGi1rJ/bwAP4jTOxqXSEPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748268481; c=relaxed/simple;
	bh=pGA7RWtsBx13lJBvQoBATds4zV2CSHqkZ9Uio1fU/1U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rHy5py4PznHd2t/j4cPhnezXnwxRdH1GkLcmYUYToDRxiNmj2HGZn+58IZVLkmAPUsV9bJ9akhVSZ+wG8SrSnDUWGpvW4ND4XVdd9eTNt+pO8LQRT3Q+a8NNHN/eiIGptd/8qGNw/s0OECe/kvao001jJU9bvdoFsW6svFXH3ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AbGtmYWl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AbGtmYWl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748268477;
	bh=pGA7RWtsBx13lJBvQoBATds4zV2CSHqkZ9Uio1fU/1U=;
	h=From:Subject:Date:To:Cc:From;
	b=AbGtmYWl2a3jmwJS2CkSnDnDJUqKRdDzgV/LbgYkx6Mw/52+hzCUr/aXvjcImB10A
	 ZO4InyZ/2Li45eW7JCRJwH6D986+yso/teP6BLnmE3sZcN+UFx69t1qssX50aNvIlb
	 2q7uKHshKqT941tB/KCw0Y5Jho7C+l7VEX366CRb0brMsdQ1ZCb0mg7+aXv1hV6hfq
	 TtoqWgby25nvLwEazKlRnSU3yU8ULBsV6AyIZH6DQsklbI2NdaI3dlqTACXf/9UHXb
	 6vQgOR3Kn1wZDPNiF1P9IP1wk+HThGOrCRq3v65uHAohtU4cyjAj8oswyZhmR59Ysz
	 gx8Bd8SrxD3tQ==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id BFC6517E1553;
	Mon, 26 May 2025 16:07:56 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/9] ALSA: usb-audio: Support jack detection on Sony
 DualSense PS5
Date: Mon, 26 May 2025 17:07:39 +0300
Message-Id: <20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKt1NGgC/x2MSQqAMAwAvyI5G6jFDb8iHmqbalSqNCiC+HeLp
 2EOMw8IRSaBLnsg0sXCe0hS5BnY2YSJkF1y0EpXqtI1utNsQkEIEw0uxq5YtsqOhWuc9yWk8oj
 k+f6v/fC+H9fJ465lAAAA
X-Change-ID: 20250526-dualsense-alsa-jack-480cb1d7dff4
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

The Sony DualSense PS5 controller has an internal mono speaker, but it
also provides a 3.5mm jack socket for headphone output and headset
microphone input.

Since this is a UAC1 device, it doesn't advertise any jack detection
capability.  However, the controller is able to report HP & MIC insert
events via HID, i.e. through a dedicated input device managed by the
hid-playstation driver [1].

This patch series implements a quirk to create the jack controls for
headphone and headset mic, respectively, and registers an input handler
for each of them in order to intercept the related hotplug events.

It's worth noting there is no hard dependency on the HID patch set [1],
as the usb-audio driver will simply bind the jack controls to the input
devices when they become available - this is managed internally by the
input handler framework.

Unrelated to the above, the series also provides fixes to a bunch of
general coding style issues as reported by checkpatch.

[1] https://lore.kernel.org/all/20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (9):
      ALSA: usb-audio: Fix code alignment in mixer_quirks
      ALSA: usb-audio: Fix whitespace & blank line issues in mixer_quirks
      ALSA: usb-audio: Avoid precedence issues in mixer_quirks macros
      ALSA: usb-audio: Fix block comments in mixer_quirks
      ALSA: usb-audio: Drop unnecessary parentheses in mixer_quirks
      ALSA: usb-audio: Avoid multiple assignments in mixer_quirks
      ALSA: usb-audio: Simplify NULL comparison in mixer_quirks
      ALSA: usb-audio: Remove unneeded wmb() in mixer_quirks
      ALSA: usb-audio: Add mixer quirk for Sony DualSense PS5

 sound/usb/mixer_quirks.c | 571 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 418 insertions(+), 153 deletions(-)
---
base-commit: 7bac2c97af4078d7a627500c9bcdd5b033f97718
change-id: 20250526-dualsense-alsa-jack-480cb1d7dff4

