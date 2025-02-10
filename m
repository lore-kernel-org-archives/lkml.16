Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC3625742A;
	Mon, 10 Feb 2025 19:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739215695; cv=none; b=JRIjxI98hxeq9nq13gBbQJS4Qd5rRSBxeeGvCf2Lz38JxjCLW/76JB7/hdOSXbhKo78yvSHr8W76RytNlTfMhAvrRXJyTSRkca8gcbkTGJtgkKG2J+8tENRJISmBvYWfhB5KlObkvY7MWyzPg3hgatzY7TRtI4ngQof4+DfkL1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739215695; c=relaxed/simple;
	bh=B0NhETpnvPQVSyO/GpKfAdXFTG5DHeiGwtAVdN5A7Cs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DIUSn8PpM8JJwtBjFb9P0ISOs1IVZoIhuALZObS+e3qakdcBNVj6g+pG1ygi7STuuJM6JaPltTfx1kxoqZ08WEdxw6sw/AAlLQokeWe/fk10JHwax2rS/p7UlVphIE26cXUwmDRiOBOJaADkGbmcRYQZNiZsQQvszJwIilUPg6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIgcO5bD; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIgcO5bD"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5de6ff9643fso3299242a12.3;
        Mon, 10 Feb 2025 11:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739215692; x=1739820492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmW1HfK2SM2OqIojXGSSnLO3+e4bjP6WcfB/geKC4z0=;
        b=VIgcO5bDPNBHAbmamdPRaDXAb2AHyKZxdW9ftUCQHit3mxfmQfV4SJmB2huAO7fPFe
         LFhUi/8qh9w3qXhvpMOnMshwkW4WaB/r+VINsDVXJ3oPuG3NfSqI0XUWO/JxFrDzZJ6c
         IgRnQmGEcSzIHsgQvvlAkY6iGYc5QuN0tlXlgjpu+g0q45FD+Y6n2oWBmjiFqDZh+fvZ
         W0V/dTZ1SutVNch2YeGmGO80obeDGPM7riUjVQaklg88vH2KnK7ffp4+axZqhIWw/KYu
         7NF1WNiPWHQaTaO+ulno9VbMdGYCtbMllct8lDSoP4GLqhDjLxsT1KD/82+4NCZz10+v
         wSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739215692; x=1739820492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vmW1HfK2SM2OqIojXGSSnLO3+e4bjP6WcfB/geKC4z0=;
        b=WDjhuWlkt+lpdnZrdNuzZxcw9vKghdcy/KU2jO7vPZ76j9eKdU/EtYAuRK2SECp4Re
         utxIREu3WnA/a51YyQ8zoky91iVyWg8LWxy2AtbLx4dUMSm/HFd7mR6tA2b2xCVMOwTs
         +OqQLnpMZxd5Hs5cyc9eRGj41XG57eEpQqPuk4QioVoFnqWCNUfSQCckueY6m0yfJVuw
         D+8Cn65SZtqi/YVmpIaeb6T93d8hV0qDEJVe/VtzmqRWIA5URL7rchhLIGycc9/vUGaB
         7dZojCd3+d2UyY7zwX1FgqHkEFxPYlonAPGTkWM2A645dz0IxFpLVGMJ8ZiSFfPJHY43
         vPJw==
X-Forwarded-Encrypted: i=1; AJvYcCVUDi/KF/wvq5t9PuYbq0UUx3euOndE0qMnx2ccUmXG8AUlScaLhx+ED7Dz3DBIZtzmBPagXJ5/HGin0NqT@vger.kernel.org, AJvYcCXOB2Hq73UNjiqJObMfhBgSlHAC5/IsRh+AJ1384AueRZjaakMR2Ovw/DbAIYXp7R6/hW9qeWfxOXE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNtNe9O/6eAdR1ajWgT4w0MYUWeMvrftuDrqHRKYeK63Wm8X5z
	2BVqLT7g3Ea6CRSkI0az1zcffgtltS8Jb13fkKMIdbfqTkmj6Eo4
X-Gm-Gg: ASbGncuTGsvajMQkbXnJ9H1p2RrFVJYLBDzULnYIMHWi2G8TR3TX+JTUSCx3IFXNLca
	t0FQ6gZLVTJ7ZizGrAB3h8uATsIfCK0ozKIh1IpiHEKyz2zdUHEkph1zhvajf8IE4+dP7uHKW02
	aKqkH0n9ZtbSr9KEy7WfsNMwg1iBKSo6tSlMesKf0m3SwEEqDWAAQPC9AuF9z5cCC/IULAGa4Ay
	WtTSHnHmninUjYyWMlhqcNdbtAimS+T+7sXDxLFuOUvYaD3SMdqWEmetZw+PvS4+W/njX7mT7q9
	ofRfCxdqJdziuW/et+Yzysq36CxJo0mNBqw=
X-Google-Smtp-Source: AGHT+IEvr71u5k+r2/bgZtzaewDxM9eo+2QMspsHoaG61WMLpWVHGjMh8wiDQzEmBjvyBkIxe1lP6w==
X-Received: by 2002:a05:6402:5309:b0:5de:8332:a8e1 with SMTP id 4fb4d7f45d1cf-5de8332aa41mr5553113a12.18.1739215691603;
        Mon, 10 Feb 2025 11:28:11 -0800 (PST)
Received: from nyx.. (g171115.upc-g.chello.nl. [80.57.171.115])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4d250084sm6576804a12.16.2025.02.10.11.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 11:28:10 -0800 (PST)
Sender: Armin M <arminmahdilou@gmail.com>
From: Armin Mahdilou <armin.mahdilou@gmail.com>
X-Google-Original-From: Armin Mahdilou <Armin.Mahdilou@gmail.com>
To: corbet@lwn.net
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Armin Mahdilou <Armin.Mahdilou@gmail.com>
Subject: [PATCH v2] Documentation: proofreading Documentation
Date: Mon, 10 Feb 2025 20:25:31 +0100
Message-ID: <20250210192754.30283-1-Armin.Mahdilou@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <87bjv91yi3.fsf@trenco.lwn.net>
References: <87bjv91yi3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixed some spelling issues in documentations.

Signed-off-by: Armin Mahdilou <Armin.Mahdilou@gmail.com>
---
Thanks the Ack and Review. This is my first patch for the kernel.
Fixed SOB.

Regards

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

