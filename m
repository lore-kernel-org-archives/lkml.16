Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281B4219E0;
	Mon, 10 Feb 2025 04:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739161089; cv=none; b=PYfo15Waj7JpgKf8kHRJbk6m/hZ/HtNvrr3ae+Y/9AGRp1uJkeybCnIPQqvWi2iyDhoLGRWRuOQzQ8ayXHTWjHKOzVGGVrfvA4Gk4UluGbC57ekycxcwv9eocZfXart3l7laSeDD6vdG/bWqF/hAgdmcq+o94O1iUQjjdfTOu2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739161089; c=relaxed/simple;
	bh=GXPzmmlWgmdNHvWUGZc197Ebw96o+JdNPBwKTYwkIJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=crtZOUsPbiePBAFTcH1UyjMrzyV/XDrdNSMetnz2iTQVGOJx4I4dma98C8hFx8QfVwXbs480feJkauILAhNQAWzRiP4xnbA+4PLzwbo74Lu2k3bGybRu9NM+umG1dGfFytsH5hXkZxRp7fvMgsRyEwLENq2qzqU6BBSRsFedqLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/8ftZPn; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/8ftZPn"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab78e6edb48so359147166b.2;
        Sun, 09 Feb 2025 20:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739161086; x=1739765886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fiLxGd+ZDwVWBRwFcowVgtJsOpgwc0qtFS67yXw+Sao=;
        b=A/8ftZPn7YYGwfVDnbWoyO4i+DfTjr6jC6q0uYAwQXwc2WffTEBlsb5adOts4+imgq
         mzWUsCoIvHDJxwvXoMYStROfsvtAhHExT7gBJgZU8bPkJkPj5BaDT12RyBuYtZTHa6Bk
         MgqAFdMZ3jwZWLDyw5Xm7B7civNKiKeL7Wf4wOSxodxQ74K+cTuegRWnOd03jyEtU9zo
         dFIk/6qgZomIMpf903hz9a31XAIHf7/a068yvRMS87fyCPmoszltF0KDh1jzWwwUbYcJ
         Z/Fsg0F7D7szzkdyCVA0/peqCh3tVrdEq+PjoaVHFs+S4FCMx1Iqs3x7thOGv82geAp4
         fg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739161086; x=1739765886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiLxGd+ZDwVWBRwFcowVgtJsOpgwc0qtFS67yXw+Sao=;
        b=PTg7uqlPqHBGMW3E9Z0nIsSXC5EmmlWcIdKQ2txVmDdByp4/7VuBEE5zm3uOhn1ibW
         ItgRRH7Dnn6D+HU8xIcn1cDJ5dypMHm2QSvmBeedl1AVq73pklC/hxQCm0h63dQYpG38
         LSOMma/7maoMIe39cxI1a4wKuOaZGb4zH+MOvrtHox/3TCpCrVhSyo+UqaGHzECzE0Dt
         Ni43WgUfxbcQl0AIHS9chzXxIQB2XBUXUdRjTV4lbRG7MTpm1di4xoe3Hm2xkHwC+NVo
         l4fVI0AkibEyn6zL1Zqi9O4GHJ7R1xEwghyWr4McO0/yBXPugdgkX/jWzv0A38KXFL+K
         8Zdg==
X-Forwarded-Encrypted: i=1; AJvYcCWegRdKc1SVISMnNiyaLMAGu2fZIn9NRxMrviTCjwcunQMXuuQIQ0HE2fpY9++P+Nuj7On1FLZBKLO7+6GF@vger.kernel.org, AJvYcCX2ua2ZQANeV7LVecIY4jaSpFByahUSReq4jWXKE9LT/xCFWoctaPFcK/tOS4RAHV1kskPteFVo1SM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxke1m6yINRqAgRzM1GJw0fPTYzUuepk52V0yUewxUDGXvN0RuG
	kycKZDM+lVfWsCbhCK3Naj1JWztR1S18cUzJpzPLQhP8B6YkMgmrs7zxo/Cx
X-Gm-Gg: ASbGncsgSyK1mQXuwAT2L1z0x1HCJvG8Zxe9QN2ityAb+hFF8GhOkCs43nm1GZZvZSv
	YzYrUlLFIvA3vSECjKE8g0F5jVMtOsTzGW58ZEWuuUA479YuHnGIRF6GJa+DjbTj9i5XBZOf71+
	4Cz0sK9at1UNGFfs4d8TflS8Sav53Ph0AFqsDyY37/71wk2GD4kA9c913OXt3DUHsGYLuFxRx2q
	XBQRhGHeJKFriADMDpRDxFB649xQ9wPE7kPeVj+jC50QRLGwyl6jPIrzbvzUl97/bvP9VkGOPm8
	g4iiZkpe1s0M2Rweygl4Vs1sfgq/Qn5Qa5X98FAL76Q5lAPNjVe7ieA=
X-Google-Smtp-Source: AGHT+IH5XBtm3FxrjSD1wc8eLCSYr52Viylqc2DHFUp6jGN7snZQnWddNu3F6vMWoPmPK6AYOVZE2Q==
X-Received: by 2002:a05:6402:210e:b0:5dc:58c8:3154 with SMTP id 4fb4d7f45d1cf-5de450800a4mr36264876a12.28.1739161086097;
        Sun, 09 Feb 2025 20:18:06 -0800 (PST)
Received: from nyx.arnhem.chello.nl (g171115.upc-g.chello.nl. [80.57.171.115])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de6cfbccb9sm2612110a12.13.2025.02.09.20.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 20:18:04 -0800 (PST)
Sender: Armin M <arminmahdilou@gmail.com>
From: Armin <armin.mahdilou@gmail.com>
X-Google-Original-From: Armin <Armin.Mahdilou@gmail.com>
To: corbet@lwn.net
Cc: shuah@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Armin <Armin.Mahdilou@gmail.com>
Subject: [PATCH] Documentation: proofreading Documentation
Date: Mon, 10 Feb 2025 05:17:50 +0100
Message-ID: <20250210041800.357393-1-Armin.Mahdilou@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixed some spelling issues in documentations.

Signed-off-by: Armin <Armin.Mahdilou@gmail.com>
---
 Documentation/ABI/testing/configfs-usb-gadget-midi2 | 2 +-
 Documentation/input/devices/elantech.rst            | 2 +-
 Documentation/nvme/nvme-pci-endpoint-target.rst     | 2 +-
 Documentation/sound/soc/machine.rst                 | 2 +-
 Documentation/usb/gadget-testing.rst                | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-midi2 b/Documentation/ABI/testing/configfs-usb-gadget-midi2
index 0eac3aaba137..d76a52e2ca7f 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-midi2
+++ b/Documentation/ABI/testing/configfs-usb-gadget-midi2
@@ -47,7 +47,7 @@ Description:
 		midi1_first_group	The first UMP Group number for MIDI 1.0 (0-15)
 		midi1_num_groups	The number of groups for MIDI 1.0 (0-16)
 		ui_hint			0: unknown, 1: receiver, 2: sender, 3: both
-		midi_ci_verison		Supported MIDI-CI version number (8 bit)
+		midi_ci_version		Supported MIDI-CI version number (8 bit)
 		is_midi1		Legacy MIDI 1.0 device (0, 1 or 2)
 		sysex8_streams		Max number of SysEx8 streams (8 bit)
 		active			Active FB flag (0 or 1)
diff --git a/Documentation/input/devices/elantech.rst b/Documentation/input/devices/elantech.rst
index c3374a7ce7af..98163a258b83 100644
--- a/Documentation/input/devices/elantech.rst
+++ b/Documentation/input/devices/elantech.rst
@@ -556,7 +556,7 @@ Note on debounce:
 In case the box has unstable power supply or other electricity issues, or
 when number of finger changes, F/W would send "debounce packet" to inform
 driver that the hardware is in debounce status.
-The debouce packet has the following signature::
+The debounce packet has the following signature::
 
     byte 0: 0xc4
     byte 1: 0xff
diff --git a/Documentation/nvme/nvme-pci-endpoint-target.rst b/Documentation/nvme/nvme-pci-endpoint-target.rst
index 66e7b7d869b4..b699595d1762 100644
--- a/Documentation/nvme/nvme-pci-endpoint-target.rst
+++ b/Documentation/nvme/nvme-pci-endpoint-target.rst
@@ -86,7 +86,7 @@ configurable through configfs before starting the controller. To avoid issues
 with excessive local memory usage for executing commands, MDTS defaults to 512
 KB and is limited to a maximum of 2 MB (arbitrary limit).
 
-Mimimum number of PCI Address Mapping Windows Required
+Minimum number of PCI Address Mapping Windows Required
 ------------------------------------------------------
 
 Most PCI endpoint controllers provide a limited number of mapping windows for
diff --git a/Documentation/sound/soc/machine.rst b/Documentation/sound/soc/machine.rst
index 9db132bc0070..1828f5edca3e 100644
--- a/Documentation/sound/soc/machine.rst
+++ b/Documentation/sound/soc/machine.rst
@@ -75,7 +75,7 @@ In the above struct, dai’s are registered using names but you can pass
 either dai name or device tree node but not both. Also, names used here
 for cpu/codec/platform dais should be globally unique.
 
-Additionaly below example macro can be used to register cpu, codec and
+Additionally below example macro can be used to register cpu, codec and
 platform dai::
 
   SND_SOC_DAILINK_DEFS(wm2200_cpu_dsp,
diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
index bf555c2270f5..1998dc146c56 100644
--- a/Documentation/usb/gadget-testing.rst
+++ b/Documentation/usb/gadget-testing.rst
@@ -1050,7 +1050,7 @@ Its attributes are:
 	midi1_num_groups	The number of groups for MIDI 1.0 (0-16)
 	ui_hint			UI-hint of this FB
 				0: unknown, 1: receiver, 2: sender, 3: both
-	midi_ci_verison		Supported MIDI-CI version number (8 bit)
+	midi_ci_version		Supported MIDI-CI version number (8 bit)
 	is_midi1		Legacy MIDI 1.0 device (0-2)
 				0: MIDI 2.0 device,
 				1: MIDI 1.0 without restriction, or
-- 
2.47.2

