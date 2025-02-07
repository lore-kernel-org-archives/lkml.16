Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BFE24060F;
	Fri,  7 Feb 2025 15:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943240; cv=none; b=KsUqytwVNSgQaglI44Vza+zQ9+PH8ba5XLS/3gG4jvRWbVys/MTD+NMbcSyFOLFeQ83xOpdK7dZOprM4WGb+wflp7wJUhgfsyGqOLpF0gdcS+pZpMlJ5SU/e/GE0o1+4eVy31YBjk1IOK7AwOyZNe9Z44vf2YdF1m5dWr9XBKF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943240; c=relaxed/simple;
	bh=0Zjdw9NpuyixOjift32u/5Rw66qhX9ntW7jPh3oiamc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HkVYrZPtaWrCh/FB6xhboMYSCjkFg2sQxVYIYXq2w0KNdEdQq3cyw+vE0H0B60ulHAogn2Q/GpnfzxRB130MiKZ0sLjMjbBBM9tIvqpSaHYaua5/U+KNohCwJAN3CNoTzEutS55n/OJU8DHxUJ76Z2DnhbkA260r9DOovpuY/mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eeITKvZB; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eeITKvZB"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4ba7d79cb57so460706137.2;
        Fri, 07 Feb 2025 07:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738943238; x=1739548038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9pp9x2wBsw/6QWgWZUu2H51n8MPvLiJNzq+9sr/6qk=;
        b=eeITKvZBkvsKTndOKoYNConlExIACufbX+8mfqw50wek2e6TBstiR8FOQ3AHarN8Bf
         GuuDsaNkIvQKYQ0rnn1EKU2IQlJEkd9VqD0H0elnIfOZMok9Brya4ANvSuJWOiGrsGfQ
         uC6c9R+SQD9pqKVgilJaAX+RiGq6KgnXQa1uQNPNfoF5TgR2hMjD9ZXZ0nmh60lX7z8r
         AIZT6oHxUeRCS4ODv0oOz5JuFyJ3zXg9GXu47e1s5RdcYE4fssiE6yWdxgROcBgdGJ+6
         4XtGc6HADaUm/xR9D/eaNvNJQx18rfcLyE1NKQNJ1eAO0dZ+IShctQD0E9DURO5rv/7C
         VQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943238; x=1739548038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9pp9x2wBsw/6QWgWZUu2H51n8MPvLiJNzq+9sr/6qk=;
        b=XJegRubnc1/9QJeWwwWCIyRisVdJ9OphCA1a7J+vpH1qjG9HJA/O79eChK7IvJBFjx
         jcWt5ytggIZ0bgKF64zdHn8GLxx3m1Mnj8gIsS/k+9Bw6F9frIW+v1ogPbcrqKYPItEW
         XCEzfsWK+nUVnw0We63eAmw3lbav7rJQxrzYKfps5KaA6ns0pmtPDZE+oU3mZEn//eZm
         OqAnA5vKy/Rcd03ll3rzQud7toeZvwjhRgYLAM4IslsFId2KfwCVC67Gk++clpnP+Alk
         L/5JWOjky5vxsSF5dO6vvE01dX2hQVF6Lf5WMwi6X70VG2NyMtqzj0mXnw4nqIrZ6fbA
         b+7w==
X-Forwarded-Encrypted: i=1; AJvYcCV8oWn905q+pFZRD4/LF+6oCKnhgmMUXyitw7Efg9a106wdxj5awiklOmiE5FVrOO9AagkjVEVYWGZ1p5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrdGbk1qa6OuAAFAugobr1ETjMZXOKHp4qnAUo1cKPye1ifzsq
	31aYqv/OAEqD5hVEesZGGB5pMMCZwF44VmsUj4/X5DeOVEe73Mw/92MW6w==
X-Gm-Gg: ASbGncsFrllGBjScP5PNHVsMqBr5KOrPJcD42dZU4QrYP854lbstQhrHJ60bbt7zTwD
	Pf0+ksprqk0uHuUtn9RJ8PSdotkuPQHmMzOb3cU8fA5PNkkKraEXNgKdiuEfmt0FCFazC5ijTwS
	hsRJ3oDEMthbbXwxdRvVZx94BIIRNfb6JPQOM3zmgb/MUATSTfpU8VAvZaCQwrBVP7iFr33vl38
	Xmo9MLtuhNSZ+hjegPOaoI/A8ngTtVbL8b3jsucpGw3e9X1hM+S6rANkqlc2GEGc6snEHuSId8f
	jOLsBow+LyqqWRxlFMFi+WA=
X-Google-Smtp-Source: AGHT+IG6kWcOutbwPvcvnvsve6FnqTEXVLlXKAsW2kfL4I3odG5jk8b0QmDiGAcxvQrZsKVmz/S68Q==
X-Received: by 2002:a05:6102:72e:b0:4ba:974c:891e with SMTP id ada2fe7eead31-4ba974c90bamr295424137.17.1738943237770;
        Fri, 07 Feb 2025 07:47:17 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ba76cb8e44sm768456137.0.2025.02.07.07.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:47:17 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v10 13/14] platform/x86: Update alienware-wmi config entries
Date: Fri,  7 Feb 2025 10:46:09 -0500
Message-ID: <20250207154610.13675-14-kuurtb@gmail.com>
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

Add config entries for each WMI driver managed by the alienware-wmi
module to be able to conditionally compile them.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/Kconfig         | 30 +++++++++++++++++++----
 drivers/platform/x86/dell/Makefile        |  4 +--
 drivers/platform/x86/dell/alienware-wmi.h | 25 +++++++++++++++++++
 3 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
index d09060aedd3f..f8a0dffcaab7 100644
--- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/x86/dell/Kconfig
@@ -18,15 +18,35 @@ config ALIENWARE_WMI
 	tristate "Alienware Special feature control"
 	default m
 	depends on ACPI
+	depends on ACPI_WMI
+	depends on DMI
 	depends on LEDS_CLASS
 	depends on NEW_LEDS
-	depends on ACPI_WMI
+	help
+	 This is a driver for controlling Alienware WMI driven features.
+
+	 On legacy devices, it exposes an interface for controlling the AlienFX
+	 zones on Alienware machines that don't contain a dedicated
+	 AlienFX USB MCU such as the X51 and X51-R2.
+
+	 On newer devices, it exposes the AWCC thermal control interface through
+	 known Kernel APIs.
+
+config ALIENWARE_WMI_LEGACY
+	bool "Alienware Legacy WMI device driver"
+	default y
+	depends on ALIENWARE_WMI
+	help
+	 Legacy Alienware WMI driver with AlienFX LED control capabilities.
+
+config ALIENWARE_WMI_WMAX
+	bool "Alienware WMAX WMI device driver"
+	default y
+	depends on ALIENWARE_WMI
 	select ACPI_PLATFORM_PROFILE
 	help
-	 This is a driver for controlling Alienware BIOS driven
-	 features.  It exposes an interface for controlling the AlienFX
-	 zones on Alienware machines that don't contain a dedicated AlienFX
-	 USB MCU such as the X51 and X51-R2.
+	 Alienware WMI driver with AlienFX LED, HDMI, amplifier, deep sleep and
+	 AWCC thermal control capabilities.
 
 config DCDBAS
 	tristate "Dell Systems Management Base Driver"
diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
index d5718ef34c48..8ac9a933c770 100644
--- a/drivers/platform/x86/dell/Makefile
+++ b/drivers/platform/x86/dell/Makefile
@@ -6,8 +6,8 @@
 
 obj-$(CONFIG_ALIENWARE_WMI)			+= alienware-wmi.o
 alienware-wmi-objs				:= alienware-wmi-base.o
-alienware-wmi-y					+= alienware-wmi-legacy.o
-alienware-wmi-y					+= alienware-wmi-wmax.o
+alienware-wmi-$(CONFIG_ALIENWARE_WMI_LEGACY)	+= alienware-wmi-legacy.o
+alienware-wmi-$(CONFIG_ALIENWARE_WMI_WMAX)	+= alienware-wmi-wmax.o
 obj-$(CONFIG_DCDBAS)				+= dcdbas.o
 obj-$(CONFIG_DELL_LAPTOP)			+= dell-laptop.o
 obj-$(CONFIG_DELL_RBTN)				+= dell-rbtn.o
diff --git a/drivers/platform/x86/dell/alienware-wmi.h b/drivers/platform/x86/dell/alienware-wmi.h
index b950c91e1979..68d4242211ae 100644
--- a/drivers/platform/x86/dell/alienware-wmi.h
+++ b/drivers/platform/x86/dell/alienware-wmi.h
@@ -75,9 +75,21 @@ int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
 
 int alienware_alienfx_setup(struct alienfx_platdata *pdata);
 
+#if IS_ENABLED(CONFIG_ALIENWARE_WMI_LEGACY)
 int __init alienware_legacy_wmi_init(void);
 void __exit alienware_legacy_wmi_exit(void);
+#else
+static inline int alienware_legacy_wmi_init(void)
+{
+	return -ENODEV;
+}
+
+static inline void alienware_legacy_wmi_exit(void)
+{
+}
+#endif
 
+#if IS_ENABLED(CONFIG_ALIENWARE_WMI_WMAX)
 extern const struct attribute_group wmax_hdmi_attribute_group;
 extern const struct attribute_group wmax_amplifier_attribute_group;
 extern const struct attribute_group wmax_deepsleep_attribute_group;
@@ -88,5 +100,18 @@ extern const struct attribute_group wmax_deepsleep_attribute_group;
 
 int __init alienware_wmax_wmi_init(void);
 void __exit alienware_wmax_wmi_exit(void);
+#else
+#define WMAX_DEV_GROUPS
+
+static inline int alienware_wmax_wmi_init(void)
+{
+	return -ENODEV;
+}
+
+
+static inline void alienware_wmax_wmi_exit(void)
+{
+}
+#endif
 
 #endif
-- 
2.48.1

