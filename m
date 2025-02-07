Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE712253B9;
	Fri,  7 Feb 2025 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943239; cv=none; b=csu4CjtCpi8vSPJlUDGhs+8rQoadkfYTkfQzJoM1XaSXxtd75DCs/YQEqVmSO+E3CdSHEGDFMy6nYsTdZ0rIgPxc8VJ3UQLyX1tIzNVblb4ELSHZeK1dywOoE6raGZZ/7Yl2JALSHBMUrqxsoij8D0sC4P+z/1kHSjkq/D6hBgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943239; c=relaxed/simple;
	bh=FuBXIXgK5ndfxQCn2S+4A0NXk7qR5VltBqHb6gMI8Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HZkZKCNtpFKAAIP5Fgcsc6amYyyUMwZDkmn3uWQm8mHLHTDMCVQE5uvM5ilKJzBHcSmk/PewRrSQpJyGD2EdkXwwAW+1HG3APbBeO1WNdbqL4eIkZmMgjIzzN+nhTIrA4il2Klb8WHxbDzhSTiTA47/+1UrqtELtrSe77ic91Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZMs5YvW; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZMs5YvW"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4ba7ab22192so565373137.3;
        Fri, 07 Feb 2025 07:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738943235; x=1739548035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfYoqReQRrtyZU9W1S4tsxAjwEta3UMCiJteabSijcg=;
        b=BZMs5YvWXonMwPq4DNPCXDwzqIdZbfYsRjW5vFnTflA3jv7iq2WnTfxvx8ahPHiEpd
         FZ2CWHzojAxlFcBiY3YGs6jjl9u4CZHvrX5p0u4TlvgHwxU52+tJPgAD+xfc3MVg9RQ2
         EGEJNCXKwUSjPm9b+ToYw8r18DBG+JSvtzQj18TD4sv7qwonVNVSlrk9ecfIo5yGP9Q8
         sw/i0n79NVofcfxRk3bOlrJnKuFYPg8+Y63JHia07cKnm9FzW8KWgeLNty9ZOmbx7jpi
         HiNte5ePWWJKu12u67YnMQ7FyUyaAprK4nFQcnTYunQJ9/MI0Q30NOiLEmbYxl1ZQmyO
         6xUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943235; x=1739548035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfYoqReQRrtyZU9W1S4tsxAjwEta3UMCiJteabSijcg=;
        b=ed4pFUFDfaE9MShk20RiAgE9pHMLgr1Z3dZS7IznE3VLjHjr6zYgEx49h8fSDsHrY1
         SnBfhpQbP3xW8HM6W8cZMv4E9EjhDmEOLGSYABes7U1eNgae6QGmP6OJ9uDqqHUYtfF0
         fWlUOlCBeJssMunqIojpMXPdPAYa5k5E3Lj299HvV9g2i6Xo0Pq251OsBq4q7m+V/VO6
         SdQedpCxkQ7K1Y5AnJn/VESuqv+EIWUc+7tIaLSvP8K/CCRtlTuP186GzDzkzXXutdrM
         4Ycjx36wmTC9ht/O9T1//VJNm/BNZkfkE+K4WtVu58qydZi1BU6UrqrO+XBEtCqnM32R
         RkCg==
X-Forwarded-Encrypted: i=1; AJvYcCUPgda6tp/Ux68cQP3QJBqQOxjJTUaSe7p8ORdnlx854LwDr527uCVW0JlhdfQeUOgYSyQdZsuOSzarEgs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKnQWZ8OIIPfEZnNmO1qq46ug5ffoPEe7tGY4w2ZMOEQSKJbok
	Mu9GJcnY3uuvqRZID/Qnx8GqAquY5JhhpWwGtiU2fVxCENvY+sfCPdZaOQ==
X-Gm-Gg: ASbGncuLUonYQHkYG76FOSsr6dSxEOH781HNGOCHcim+u7gG+woKqsRi1P3H7XDoT1e
	/N3oMOiYvXscTXb8MOHgyptDpr3ZRAXA2SBpagUtBIp8eJ3XxNtW/D1sadZggryslFHB2kWiPVE
	USnnsj55N3FqkPqZo8AVS8R5qC+xLLcWMTo+EIwXSGfArvuA2CHwLvodjQnYVWfu98LLtT3ZTpj
	7EdopMPbVeHHiEcP8nhq1sqmnhnyqqDWKN2t0k2v0C4gCTY+IUbGs/+ry+4+Hk8o47ImXbqqbBB
	oMoyAIaF0hIswadZUqydgvo=
X-Google-Smtp-Source: AGHT+IEOqhDIHU8yQVzigzHi7yEmKeknvLzhaCLGiwy5Lc6Uz7nwOPsjHd03PrIA3Gv3h27ZRwQiqg==
X-Received: by 2002:a05:6102:c0e:b0:4b2:cc94:1881 with SMTP id ada2fe7eead31-4ba85f6666bmr2350659137.21.1738943235338;
        Fri, 07 Feb 2025 07:47:15 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ba76cb8e44sm768456137.0.2025.02.07.07.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:47:14 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v10 12/14] platform/x86: dell: Modify Makefile alignment
Date: Fri,  7 Feb 2025 10:46:08 -0500
Message-ID: <20250207154610.13675-13-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207154610.13675-1-kuurtb@gmail.com>
References: <20250207154610.13675-1-kuurtb@gmail.com>
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

