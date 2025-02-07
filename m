Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6406236450;
	Fri,  7 Feb 2025 14:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738937310; cv=none; b=SdH+r6/kfrIF8qgbeh2cH+hcgnDZ302wQ3XoUDbPqL/fBRiWnKky8Cz17yRVP2GtQGKc5cd7Z9sDlNOSNPUz08UKQE3vziSTDXeBBSh/msJ+atAreS6BJk8l53lx93XnUl2zbi7CsY0LjyCb885KWK4A/v5OQigOq5ejaKuopCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738937310; c=relaxed/simple;
	bh=FuBXIXgK5ndfxQCn2S+4A0NXk7qR5VltBqHb6gMI8Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rAM3TCwwx6NRNeQRIM3HNH4YhbwaK8KVta64FxnbuPfVLskH6IltIgS4Hhz2IunpyfZ0nkKzH2nwuUz6jjS6YCJqhEDJPiTKYTazY0fqv9BzAfxDgGOban/60pq5F0L4yDbDw/3hPxqGSc0Ql4Btd4JtG/kfBWRPUAcCqy3m6BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOgE7YNH; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOgE7YNH"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6f9b8291c49so4849337b3.1;
        Fri, 07 Feb 2025 06:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738937307; x=1739542107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfYoqReQRrtyZU9W1S4tsxAjwEta3UMCiJteabSijcg=;
        b=dOgE7YNHMVs1JR4aNVWom2nAC+D15vlbCDXkvRgl+/jqHk4NQ5arxCPaF34Ubqe1xR
         iUBPyD2gLOLfpItRvTuA/Qc/JQrAx643yGFpyUm6ZP7pXrc9VORsh5kOcnAizCuC2uI3
         7UKtcmTxnmQzxO2ClKdzihxRBOU7qoMgicNiAOKz6PijAy1zHZtsJYitrHiWtBdT9A/o
         kBwEf8xwmuxF8lVm38F2Hk2Vgu0q+PKGfNvKS6G97sJ8QKip6N8Ne+k68mDUNLcpWwFD
         OdoyKlrRSMBiCNa0PdFPm2n2/j8tk5v6jaCZ4d/vnA30PNwQpC9OJ8jZlzYUwxbU3HS3
         bsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738937307; x=1739542107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfYoqReQRrtyZU9W1S4tsxAjwEta3UMCiJteabSijcg=;
        b=ktrqVHuokIQqj5y+v1+FkeGF8lK4LY2POCBdsxNqPLtN6wGIyHj2332RoOX9A33zgU
         Z/XkQC8pgY9aJVRxK3UvMZf8GR9AqBOuH27xjD/jrFtRsIn7FSPBfma81SE3NVWUxT0G
         0C3EBd3j1u10vBejJMEF87W5Rav2fcIYMzoXfXjc3EH0NrVtgZTj99Ie8uqTojPsF+66
         5NfgeVJvHqr0y6/+1RBgzvyvqjQt8E+VJdv0if0zu746scMZEuWE+J4eQ57BKn3icLhK
         GXHRtTehnPMaPuR+dz3CbN6PJmgbQOZu+3jOcI7/rIU6jcS2Tag4+jE7/5xyijXAUJpG
         Rjfg==
X-Forwarded-Encrypted: i=1; AJvYcCX4lFoWqAU7shBDxwlYzIGwss0vG3Evp6WgMkLH7Og1gZqk384UV0iNcMtgWWwzms7Wsdf8uLBIRHl5uUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMgRfLfeOSkN62EMvonW7D2pfJBmqOiLK3Z7iiLHtju3tXYwZi
	3QGYPGReSjrPNv/0++0cX8R2slCBoaYNtT19yf7tekvkN3xRpdDbmZH4eA==
X-Gm-Gg: ASbGnctCFclUi/wyclGHLL0pge4vzQLeCPVTPhr7gdLSQV2P2V0fw+2eGypNWBwS+C5
	xsktyZyv5ZqeAHahn5QUF3AY01uO4IDqe+pTX8/DY6HXAopkwZoxfvoUbT+xoh5KFLVY19BKNzb
	rUgh/ZYWESOe90Sk0rLw9scefIw9gYEalrObvhnj/tFxWKyJFf3RuKwOgMjA3udL7RrJR9HDlbG
	L6P9IefV41Hu/2hp59n5pcht7YPQBN3ZKyRwYDZulzRmli9g8olwN1CwPBqOivfC5I+91H7Ol6X
	I/6r4+9Y88dI8Zq/toE5wUU=
X-Google-Smtp-Source: AGHT+IEbVT1Pg0odsuKa4bw4ZpRzfZRIyt/MPhazWDnCNH3ULDt90KxF/3tKPY0U1emzZm+a/9DmtQ==
X-Received: by 2002:a05:690c:6812:b0:6f7:a6d8:349 with SMTP id 00721157ae682-6f9b284bc17mr34146307b3.10.1738937307140;
        Fri, 07 Feb 2025 06:08:27 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f9a000f577sm5525607b3.118.2025.02.07.06.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 06:08:26 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v9 12/14] platform/x86: dell: Modify Makefile alignment
Date: Fri,  7 Feb 2025 09:07:41 -0500
Message-ID: <20250207140743.16822-13-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207140743.16822-1-kuurtb@gmail.com>
References: <20250207140743.16822-1-kuurtb@gmail.com>
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

