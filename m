Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E7220F098;
	Mon,  3 Feb 2025 18:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607272; cv=none; b=WiOSWQ3I+E0oiDc1i1TzhXHXxZ1K/aVEkA/BFnBaj2GB/2ZbsCNwcWFrK6/fTjC8nz0atphid9Zr2ThsYbtn/GyQplUBXyWNWNk2dLg3muEeEH8dqEcFBwXSfJE1syxJeVnDxBVnCIo2ak4D0syBOZJA5+HLQ4yyKYsFkF+1Y4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607272; c=relaxed/simple;
	bh=0Zjdw9NpuyixOjift32u/5Rw66qhX9ntW7jPh3oiamc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dbfz8+3GPUEiX6JcVoc0Umj4UQh3LNCgLMWT1jSMqaDJTvZwNVu4fqL22/gVUeWlZF7zjNLOvYppp8vprQ+D+ClczkyT2rpjQXcexRpJHxekppyCxV5VOcCOeQMrUI28gQ+W1w1BIf6isvuimYqGt50cpuWGyXvAp16lC2Icb6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxV3L7xr; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxV3L7xr"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e5afeb2acecso1131979276.0;
        Mon, 03 Feb 2025 10:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738607268; x=1739212068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9pp9x2wBsw/6QWgWZUu2H51n8MPvLiJNzq+9sr/6qk=;
        b=QxV3L7xrwyz5+kaiAa8BSYDwuCxnrFiDYyPyyjMfDR4FaBWEXrpj8bA4T8Jr6QabCx
         eaHBLDfwF+hrAa3oStY443gaNFnDHGtzzbmDTouGETGjTW9zh2Go6DAcF5FwaDmVluOo
         sM8lQWEkL2FDqhWQhZs1Q5ncJHWkwYQltdMbJ3+DCc2Y3nOTo4jFmd33SewNKaGKmpJJ
         60BZEQFKkd7V2hEMkwfaOju+Cc0Tho/O0qhezqZOMQEY9SwR1LDpunjLhZRZXpsiPGWR
         c+5PTj8Bk79GebEummfK/RrjreYcO6XS5lTBhT6M7L6Te39FvT+9grSBEZIDu3LwGNbO
         g3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738607268; x=1739212068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9pp9x2wBsw/6QWgWZUu2H51n8MPvLiJNzq+9sr/6qk=;
        b=ItHIqKIADHgxLi8tpmMde3Av8dHKdPG3oCjbSk3AA44VFU+LnkKE5cYdsz8DWXTJfE
         Cy4eFVcTRCpTc17xHoSTZNZv/XJKjeOdx/1RtMZWE6mEE7eHcaVGktVtORteT0zE3eYn
         acq0feYSo6Xy/6Qh7M4Mv4n9zLOcY30GNzlwoYaVvMx+roEoZaviDsAv7dcBq5y3hPQ5
         9QeMJHdoixJL8TiVY4gshB0mnjVkcmB+VJrnEMBzaKHv4h8ogfQDi15FtGGTa/V1RgsL
         Khweaj5jTFyftIQJOGC5RAeGAMGBbMuvwoUNsMAZR56dPfBQY34VWmxLDXVuSrcqHHc9
         oN9g==
X-Forwarded-Encrypted: i=1; AJvYcCXOhkdhfYjd9+VHLvhxLr+BERS/UUToYTg7Vz5rri/kRKX39AVW728ARegn9oY/pkwjnuykyShtSz30SgY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNGwI8mw4o6cYGZEN1s3wZ9SZtuqKtyNCRtRIaPpiq7UIutPKi
	+0PnkEZpsCHT1LO/3Nm+NBsqBXHpiHKiSA8kfM99EGZXrUac3tNgtXxoIQ==
X-Gm-Gg: ASbGnctCQhewQkMU8xy2KV22bDBC+0wNyV/ZLDG1KyftYu24TyijO050QwdWnuPmpE6
	G+OgC6zasxZswjYd9NP9jqoIUemIXCihpaO7ZzQ6P7ZEoRux+ulzi4ibpXFtd1PqFZl2Rck0CM6
	Sb5JXPkpvCiqrE2LDUoci5VarhqUCOj9owzAn/i+rCpp6aiYCCLRkuPIACe9efSnwAHC8SJB3Kr
	KusGxiApTMWTRB7K1dcu0/a4839nfFZu00mM7lxyH7ZS2SuVUl7zSKvqbeqLOPb/AbpjDWhgeTn
	Gptl3uccpDusc3Gk++Us0ZE=
X-Google-Smtp-Source: AGHT+IFvJYr8h68w2KHFCkgzn7tECGUz5TT6jCjrKnn2NzivRwlKq85iVqceXM4GThsfE5uPN5sfWg==
X-Received: by 2002:a05:6902:2786:b0:e5a:e4f8:d674 with SMTP id 3f1490d57ef6-e5b13561ceamr453346276.7.1738607268507;
        Mon, 03 Feb 2025 10:27:48 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5acb2bc726sm2142239276.30.2025.02.03.10.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 10:27:47 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v8 13/14] platform/x86: Update alienware-wmi config entries
Date: Mon,  3 Feb 2025 13:27:12 -0500
Message-ID: <20250203182713.27446-14-kuurtb@gmail.com>
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

