Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76232211462;
	Mon,  3 Feb 2025 18:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607269; cv=none; b=sj3UxpFFaihCYhefTK9ofHE7NHh9j5tKxeir4ruk18sv7GQNorVjUX5rUJawhQCsPiWq2ZhqA2QCITGdJOYsnVv/Zgw6843wAB/Gp/OWm0d0V2fOxUjtXIVyaDAuDo2NfMZzEzjIzcxrpu0t3Qxj6D/lpnhdMfYx7LccV3iuklE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607269; c=relaxed/simple;
	bh=FuBXIXgK5ndfxQCn2S+4A0NXk7qR5VltBqHb6gMI8Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bwPSaAQeqXnitT4UssJP5ixGK8tN/AGNlSMvRfQ/Z1YbnLI1reoIbUkJNnmuAerOjG4efGNJPY27wCaPyDAFvew+RqGY/ezhODs6BTKH1v0S60NC1Ir5hGMSDuH/XEXq3Yo4BAAlP8gshNwQCHMjoEYaAZ7fDERG+ilx4i5c/7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OAfApnJI; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OAfApnJI"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e58a7e02514so4715909276.1;
        Mon, 03 Feb 2025 10:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738607266; x=1739212066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfYoqReQRrtyZU9W1S4tsxAjwEta3UMCiJteabSijcg=;
        b=OAfApnJIzA9i+pjxECDuAyyVKf7gJNimLa6Ds4EQyx9Vs/9BZqvhnD5Bj7it3UIu55
         F/IipfVpwyDCzpeALzuPJbgROELrXJzSSt18ajAIdEJSfdFZFA2ZG4XT7vsZIKgc7AaH
         zhzSjggO0epVFr5tD70n/nd03+uDpYGIr4DwQRW+0FZC9RkUzQH1YmcFJQFJmm/LMWVM
         EcVv73f+6xtRsnDa9IJFWNqsiOLXogF4OeQP2wF+N8gH5HwFJ5LQbL4iKxESZl2KqVBq
         1uBb41/HbORILC/a1xtiw9XkIc7dMjq+aER5RSwvtX/1fcxxkQNsEVN3isXsIN+HmBHk
         OhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738607266; x=1739212066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfYoqReQRrtyZU9W1S4tsxAjwEta3UMCiJteabSijcg=;
        b=fTB1niBHt7K9BGKOuZ25Q/PYHjdfHXzKKc1qzi0R82mq1muKmMuJCoqvtol691FMJe
         2puET9A4ZWl9drdvZcjjqmGlPsBbvIUDtEVtj6/9CViqW3jENWdF5gTHv7KQEE1f/Ial
         TcHQV5LHJgcy4eVUKOYoX49PBLFDX16wb3yLcTpv/hRZWIBYJqkN/mu7ifs5M0v4n3FM
         +qZXJH7H3vUDsESEbEoO3mbkIa6Wisjt0Gy/1/VY0pDgsnNhV70IuGVkJ5ngN3btntDT
         KlOaHUBf4FebsWIyAKbiqvrtbzRaVgoEZX2AWS4z124RsRxTY631OA9+2va+bnu/Yt2D
         tBrA==
X-Forwarded-Encrypted: i=1; AJvYcCXcMxkGl1zCbtgP4fT2YPFK+pZd/MBZtVNnl59YGF3NLgfrOXEi8RgEyW3/753Dy78gNzJHHmBA7/FL9vw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyehJ/IuDn4KU1SWGjFe5e2a70jMo40XtZ4I0CKUuUMexVYlUqR
	6U8MoI2Kg+BeJY8SAnXJ7yOmKwfBDOCArwUE+TX7acMu4E34f1vGhMvScA==
X-Gm-Gg: ASbGnct3Hl0uSVBXHIp/nwyLMgA/FYVfX5T6MCh7vs0Oyr06ol+yTtrZl2zWJNZga5x
	ukvZQUFJteMuami27dga8bVy2hQUXJIGzsUqHDq8Axoe0wRDcPyql6+3HWalmm5f+LvurRniXss
	Zc6OcIktzI0triUlVDow2cgjn6kHioWey4dey6D5OoqYTGyx7ZrktmQ1713r1fx5hSpVbN3ZjzR
	B/DkAR2FYR+NGwGarb1n/sDGoZPS+D4BulbxGvEHpv9653KSnIzn2RlSDPXUJxyQkCbt0C3ff9z
	YE14PKr1LCt4p5MdrMoS0Z0=
X-Google-Smtp-Source: AGHT+IG+7kj3hTwcMQVxfO/7cVkdorcuw0D7FkRyB3Am+4UZHhpGKnxWpEJrpCYk8gosIZ8xbjZoTg==
X-Received: by 2002:a05:6902:841:b0:e57:fd58:ad51 with SMTP id 3f1490d57ef6-e58a4aa82f5mr15489636276.1.1738607266103;
        Mon, 03 Feb 2025 10:27:46 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5acb2bc726sm2142239276.30.2025.02.03.10.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 10:27:45 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v8 12/14] platform/x86: dell: Modify Makefile alignment
Date: Mon,  3 Feb 2025 13:27:11 -0500
Message-ID: <20250203182713.27446-13-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203182713.27446-1-kuurtb@gmail.com>
References: <20250203182713.27446-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add one more TAB to each line to support upcoming changes.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/Makefile | 48 +++++++++++++++---------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
index 03ba459f3d31..d5718ef34c48 100644
--- a/drivers/platform/x86/dell/Makefile
+++ b/drivers/platform/x86/dell/Makefile
@@ -4,27 +4,27 @@
 # Dell x86 Platform-Specific Drivers
 #
 
-obj-$(CONFIG_ALIENWARE_WMI)		+= alienware-wmi.o
-alienware-wmi-objs			:= alienware-wmi-base.o
-alienware-wmi-y				+= alienware-wmi-legacy.o
-alienware-wmi-y				+= alienware-wmi-wmax.o
-obj-$(CONFIG_DCDBAS)			+= dcdbas.o
-obj-$(CONFIG_DELL_LAPTOP)		+= dell-laptop.o
-obj-$(CONFIG_DELL_RBTN)			+= dell-rbtn.o
-obj-$(CONFIG_DELL_RBU)			+= dell_rbu.o
-obj-$(CONFIG_DELL_PC)			+= dell-pc.o
-obj-$(CONFIG_DELL_SMBIOS)		+= dell-smbios.o
-dell-smbios-objs			:= dell-smbios-base.o
-dell-smbios-$(CONFIG_DELL_SMBIOS_WMI)	+= dell-smbios-wmi.o
-dell-smbios-$(CONFIG_DELL_SMBIOS_SMM)	+= dell-smbios-smm.o
-obj-$(CONFIG_DELL_SMO8800)		+= dell-smo8800.o
-obj-$(CONFIG_DELL_SMO8800)		+= dell-lis3lv02d.o
-obj-$(CONFIG_DELL_UART_BACKLIGHT)	+= dell-uart-backlight.o
-obj-$(CONFIG_DELL_WMI)			+= dell-wmi.o
-dell-wmi-objs				:= dell-wmi-base.o
-dell-wmi-$(CONFIG_DELL_WMI_PRIVACY)	+= dell-wmi-privacy.o
-obj-$(CONFIG_DELL_WMI_AIO)		+= dell-wmi-aio.o
-obj-$(CONFIG_DELL_WMI_DESCRIPTOR)	+= dell-wmi-descriptor.o
-obj-$(CONFIG_DELL_WMI_DDV)		+= dell-wmi-ddv.o
-obj-$(CONFIG_DELL_WMI_LED)		+= dell-wmi-led.o
-obj-$(CONFIG_DELL_WMI_SYSMAN)		+= dell-wmi-sysman/
+obj-$(CONFIG_ALIENWARE_WMI)			+= alienware-wmi.o
+alienware-wmi-objs				:= alienware-wmi-base.o
+alienware-wmi-y					+= alienware-wmi-legacy.o
+alienware-wmi-y					+= alienware-wmi-wmax.o
+obj-$(CONFIG_DCDBAS)				+= dcdbas.o
+obj-$(CONFIG_DELL_LAPTOP)			+= dell-laptop.o
+obj-$(CONFIG_DELL_RBTN)				+= dell-rbtn.o
+obj-$(CONFIG_DELL_RBU)				+= dell_rbu.o
+obj-$(CONFIG_DELL_PC)				+= dell-pc.o
+obj-$(CONFIG_DELL_SMBIOS)			+= dell-smbios.o
+dell-smbios-objs				:= dell-smbios-base.o
+dell-smbios-$(CONFIG_DELL_SMBIOS_WMI)		+= dell-smbios-wmi.o
+dell-smbios-$(CONFIG_DELL_SMBIOS_SMM)		+= dell-smbios-smm.o
+obj-$(CONFIG_DELL_SMO8800)			+= dell-smo8800.o
+obj-$(CONFIG_DELL_SMO8800)			+= dell-lis3lv02d.o
+obj-$(CONFIG_DELL_UART_BACKLIGHT)		+= dell-uart-backlight.o
+obj-$(CONFIG_DELL_WMI)				+= dell-wmi.o
+dell-wmi-objs					:= dell-wmi-base.o
+dell-wmi-$(CONFIG_DELL_WMI_PRIVACY)		+= dell-wmi-privacy.o
+obj-$(CONFIG_DELL_WMI_AIO)			+= dell-wmi-aio.o
+obj-$(CONFIG_DELL_WMI_DESCRIPTOR)		+= dell-wmi-descriptor.o
+obj-$(CONFIG_DELL_WMI_DDV)			+= dell-wmi-ddv.o
+obj-$(CONFIG_DELL_WMI_LED)			+= dell-wmi-led.o
+obj-$(CONFIG_DELL_WMI_SYSMAN)			+= dell-wmi-sysman/
-- 
2.48.1

