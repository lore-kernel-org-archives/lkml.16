Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0071DFDB9;
	Mon,  3 Feb 2025 06:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563807; cv=none; b=lpFHYKYpbNWvCOjiNLU2Qu6mOGDxe970W4W8gTfXff52OScv8q3P7Zo2M8HiMnEvrRpVkIJ8iKhHGBdC809Iq3yYdHC+d7QAZWK1HGIXCL6+qkMZMUcy0vQt9Ers9ZiICrA1xZpabXz8DuoXHnvjdWheDVuPejiOaAM14TH67YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563807; c=relaxed/simple;
	bh=FuBXIXgK5ndfxQCn2S+4A0NXk7qR5VltBqHb6gMI8Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SYL1wPfLXPfNNLZYVeuj3SaiOnQiH40t7xr6tQFnQEVHmIbD0zvUL4WcsA3l5NusxE2vMFXjZ+lINZukBKEmhtI8vGG6FMRtqD+lRQcrUB2Z19DC+G3ZfpMgUu1ZYdjjCBV6bkF54/V6UQh6IhRGO8MvM38q3Com9WVejveFFGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Axc3zDiq; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Axc3zDiq"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-85c529e72bcso705053241.0;
        Sun, 02 Feb 2025 22:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738563804; x=1739168604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfYoqReQRrtyZU9W1S4tsxAjwEta3UMCiJteabSijcg=;
        b=Axc3zDiqlCRxqnTt786YuBtpgAA2FvmxeK4PWpUD6iC5F5mf7373yZbo7ZkLOy7yde
         WS/EK24EeqFZ+YOZrkPukLnYYvTvzK+G3rDUCREmLEcFYTlS/GQRwYaQ82nKGzlM/ir5
         4NkjsroBmaGE2Tf2OjZNEC3dPjPNwNySU3qi67TpXKDyHdzzux+9gIS4kimyzI0K/5ZL
         M3yqp3ZlpsSUt8UnnMx18elnLurVP8tHPdEldjSC07bYEc0axP+Ub0FyWAcjTGyuXSNB
         oY1aHYeelIRxBbWMNA6ln5JioCiHafjSWGAx2Mu86vk7DknA+IAx6GcgUDQWtGHjPJWZ
         QIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738563804; x=1739168604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfYoqReQRrtyZU9W1S4tsxAjwEta3UMCiJteabSijcg=;
        b=Cw8StS++xPP61yxsl0UjL9+WIb6jYZpPK2gesUOrwzooCRB51t9VknLIYcokxy9fWT
         Wmq3LPUfOgJlttYVezDVM8Wid4zqomirQDfOafjuzRCXRTyN4cuFlG5SaohADHPktwZz
         NUU1968zSIxAPYzKF/fqyM/FCC0X8YkGzcSXVjUGusuKTpco02ZGJvo/kjl+xixTBcpn
         a5XbdMhh2Xa16bo56PlnKFdIyiwW8s0jNNOoCkLBJk+f0DNAFPvd3o1oL/do2niX1lr9
         XLjBSb6H9hVFQ/l4vq4od1i7VH0f4kyUFmWul1weOMmM2aP9KfcnpFCNSo7GVuBWg5d/
         x+eg==
X-Forwarded-Encrypted: i=1; AJvYcCXe6YLwZf9l465KoH+iP4E3LJFyBFSGA6rlQ0RLZjLkeT1gOrOK2/yP20beoQnHpeAiCfDaekrxzLd805s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD9lAbe5W77ye9aOLkUVtP+ejtCnCrgxt+HjZjfLP5EgEEzPAC
	JtHQyTOpmYeXRBH5qH0F2EF2jIZ7mzYgpL6crG4u3R5HIrYCLU/2Qh60oQ==
X-Gm-Gg: ASbGncuHysnl60/dOtvCXVaA1gjfcKXX2xeH9iKxZNC2+pOsEH4FQyxJyUludybz8kx
	AHk8UPJt6BUj+QYGJQifD841225UeNCVQDJUeSAy/PHpmpC6Y5VOsFu/9uLxIYtb95VMWgnYllL
	Ba0YBmzuyLlYoNztbNESTmZX+JQmGhtEcucy95vbdlq/DoTth6xigl/DVOYyIfBVy7HawEzQjcD
	C8FPiLNxh02wibSvmiV1kU6t7j9jQsxm1YE8TZRlh0+Y79G5lKiC/BbUVL1vPIbIj1gRcnMj37A
	a4vKacnL1NpFXRih7XOyaPo=
X-Google-Smtp-Source: AGHT+IGDJKAFnocJa4XLpHJUspTtiwRouQJ30oHf6se6k3gulgwQZFBJI/uKkNrQo9fkVwO1Wgmj0w==
X-Received: by 2002:a05:6122:4009:b0:517:4fca:86d4 with SMTP id 71dfb90a1353d-51e9e55ba0amr13989534e0c.11.1738563804513;
        Sun, 02 Feb 2025 22:23:24 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1d64c20sm1138789e0c.32.2025.02.02.22.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 22:23:23 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v7 12/14] platform/x86: dell: Modify Makefile alignment
Date: Mon,  3 Feb 2025 01:20:53 -0500
Message-ID: <20250203062055.2915-13-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203062055.2915-1-kuurtb@gmail.com>
References: <20250203062055.2915-1-kuurtb@gmail.com>
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

