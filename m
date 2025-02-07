Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B3A23645C;
	Fri,  7 Feb 2025 14:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738937312; cv=none; b=W0QTVaCSTlSo+lA2H0j7+C24AhtnTNj8c7/ayIoPyusdi+tNwLSxd5rGn2tsDc+p1yFh2Q7pqn6To35Sx75SU+EeTQn1xRhH6cTD3OUvy781z2yT03MVrdQv4aIuf4Vr+CgwpF3g3heohC4UokohBpegBGWtDYMfzVEStHyOwSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738937312; c=relaxed/simple;
	bh=0Zjdw9NpuyixOjift32u/5Rw66qhX9ntW7jPh3oiamc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJGKAfYX9VtytLUNxaPaQa471sNZp45W+JHOjEghs9X2GZF4Jeln8ALRzqlLVxSPAF+Eee0y+DdxgEOOxPYL6o1U79ZjMy6uCox1Hl2HrUVM9K8pG18qd7PaLlQryKlqIyEc1o9NJ6oadqNc20Yf509/8X8InxbxjdoKnohSrl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBq4g9it; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBq4g9it"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e5b32f64ffeso1823830276.3;
        Fri, 07 Feb 2025 06:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738937309; x=1739542109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9pp9x2wBsw/6QWgWZUu2H51n8MPvLiJNzq+9sr/6qk=;
        b=SBq4g9itw2QFhxr7FwhfAdpv7x2z2RgKa0+bT71ai3/UtSSX25W8QcbtjEfcZmNCpl
         wY86ok22w90lG8K+gGpEDD/8VH02+TGrz2bkCb6NnIGua0oSZUHwmlS75VjLKiYaO1oe
         2NxM2b5+mqEWFMhAjPtH8jYdoiJ7VfHZHSvxvHmoAGiizw0gwMUXe2J5ruNl+q06IJgw
         qkH+w3DR7RnmZvhml9ne2UUWohZ48qH76g9Mbhcr4P03oCiyvYUCz3fDtB4WZb6e6NQF
         tcDUR0GLLBWLneyoSagL19P1cm2LsZKvJLSf2QiJd8wKSnn95Yhxe/SO9mkD19VtPHLs
         V+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738937309; x=1739542109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9pp9x2wBsw/6QWgWZUu2H51n8MPvLiJNzq+9sr/6qk=;
        b=VGrpaWxgWstShyuSUD54EcqmcfetV/ybQlcSGjHy/bRFWxDm4oKd5kxD6wcN+WkRuo
         CLqo8ORHAbN257AEZaaI9+ZC0mmeZID7iS8WlKRbjBHZZ/3aJlu6roHR6VAv+e993BDF
         chZ9PH/dFvg3aslLZEzb+MtrJW17TyY+m3JyvVICMTKd2cfet0JbreBoMlsJogHgpZlc
         lNTi/Xa+CrjOPbifOnx/YuCWbB7GfKkuos9/7KmLgPihRdTvHVByf947gwYiD9lrbjmk
         muy6qiKstRwj5ouwbcTxSEK+P/yg+zIX5CWlNNR1dicimagoaY7o1Ju8zPJ5+Q/RlxQ1
         4PSA==
X-Forwarded-Encrypted: i=1; AJvYcCWTuUuNsdE9xhvzkZNr0t6WMBWP5NNyUEZ379fLmKInhLpY1s0T1343UaNiOnSyM/a8k+BWeogWgGnleu0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Yf6dwQ29hppnJlkjGeUDEffSQFc9CZAItQKtqbr2nm01tcs2
	4WZiMojraIU4XZ+i1zJUG6IECGRdxnHn9rYcZlJRg3DjdF3CaaIFsAlH/Q==
X-Gm-Gg: ASbGncucEdQ9MOB32DrP+NFj6JEaAo8xG4t0KbZDn3YmHGYNxsB3mG5lNQMCDbKhfeL
	+sIDAU501R68dNJNImadphrxk4aip/YDLIgdcPcRI51zTQRfTrz5rSOX7UetEfZjWR6KuCuMxIl
	JbzVRfWq1FwCxsCQ+YrItsOAAaGv1OzFDJVUZTtJr5JJ/YvsDbQOA2VUbvTjPIgMJiS6foqxdbw
	UrZosQM7JW3GVg22NkRMTtnaFWZDUY/TTrBsb+XrpHMaRIjQb/vxRjG3LRLY2eHLiLITHayO8q6
	NJTE9eX5QV6yJzcxo5gN7IU=
X-Google-Smtp-Source: AGHT+IG031B3KAKCzswk8qjhMkf+rDzb+OfAfZ/ncOEfdaiF0IG2cVHidURzliDIm6hZ0GJDBzROgg==
X-Received: by 2002:a05:690c:9989:b0:6f9:a75f:f245 with SMTP id 00721157ae682-6f9b2878035mr31806127b3.15.1738937308812;
        Fri, 07 Feb 2025 06:08:28 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f9a000f577sm5525607b3.118.2025.02.07.06.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 06:08:28 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v9 13/14] platform/x86: Update alienware-wmi config entries
Date: Fri,  7 Feb 2025 09:07:42 -0500
Message-ID: <20250207140743.16822-14-kuurtb@gmail.com>
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

