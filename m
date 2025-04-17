Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDE1221F3C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876483; cv=none; b=j5kBKzZhI76Ow+k+oTHitpQZ5N8U45Y+BRyqhsRFEHGidlkE/Qc9V+nqwkGErV++URo6VoKZTTT7cJtp6DSawvK5DRCZDZNeS5PVWjixKWmz78o26+gdm3WbjhSzgPapmpGSMc0Im1emWWGb/ZRGnXTTdafSosGUOcBLGLpojX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876483; c=relaxed/simple;
	bh=jgYEQR/CMvM1QLqc8LJB3Y0zD6umdnkq3sJIRc1ppUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OErImdU3HQDrRRhUvtGhCW7458yeYNsEPvXKnO+XcNfYR6RqL6K6hSOpH62W4dRIHajKX0bIUjmO8H+q+2aq+Jwt/LhHCKhSbmLvzaMucJ11dAAvDRQWXn0VdqhjmPt0GfZx84quV2dK63crtrAoc2YBfHeaX4fOz5SnDXTUouQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EeBuegOp; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EeBuegOp"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54989702b36so102941e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876479; x=1745481279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMSnHiDuLiHAtM0smyVAG+glICjNKIJrdV+6F8Gol3U=;
        b=EeBuegOphzvoM44XQ6mhJBH8wZFd22dRpVBDIDuEcOGIO6fLfSOsTfnyzjtCkTFoW0
         9AWLTw0jNR47XH//qPC5kCR1S073Iq/wZ5v3vc0PBtDakoeB+dprTFPk7VQU92AB4k/C
         5KX2C3GFF0jIjPRfVoWoP9ToFdg7f3pDMgkqnspnsCWN1rV1cmZyNrbwdNcL1UaOjypp
         +/yPv3GT2I8EWn7BydgRujVwu/hGxIdtrqpdrLkFmF5jcgAQvsPsbpCcsheq9Z/2BctP
         u1XtgyFeEDlyG+sQ8Jn5o/aR0XfyBa8RtzYnpCJ9y8T0lvLAoXHVJBxKSf4zd5dTM0PH
         ANiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876479; x=1745481279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZMSnHiDuLiHAtM0smyVAG+glICjNKIJrdV+6F8Gol3U=;
        b=vBhf86C7TGXN9bneuAbGR2PQxUMl43Hfm32liUB2H77o/YaWEd/Z+Fj7Z4zeogyiy8
         viaLc7fQ4D+/bZrjvEw/3fz+Xe2aTroKOibZ8AztQePCkeTb5k2u2InOuwI0umdl6IN6
         MbO0isvkVttaaV22Apqi8sfzAyiRexNERpILD2QhKXH5wfCGGJOa2M/bWaeJ6PjenhP3
         lDBaHR1t0J73QqUaQTwGSCc74ROk3PbJsvngIkQluNLN1AXb6eAn60GfQAV+y+TSQeNc
         NaubmdcSiYymR/2sMzcNHsSKPDUu//Fh+Rmy0O8QA683tmpQb2Mq6+47N+PBUH86L4yy
         ivuw==
X-Forwarded-Encrypted: i=1; AJvYcCWItFe/uRR1kSixjOnU1+1F2J0Jb8U0fnDGbvr+2dQNPd9F9bZh0QfuA/tLObU0tIT+tcZqe8UM2ByIFtM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym8JGjBM3oM+op3ak08r+JqAABhgZRTOYxI84QXLd7DEnxvpHv
	aoG/PMamNQ6OZWQyeu0awuJ+pKgNqWQV5X8B8dgOQZzjoFaUKtxWal3TG2OhBpGKD1WCvv/TZeR
	W
X-Gm-Gg: ASbGncsYhYOShdihOYmEELD06V57byF73uDq+8Tn9e6SRH8QBmVMj+mFyDTM6FHjNV/
	mp9MXUAxI4MTW05fuGT8GXAZ18byhqyRM1xeULdWw7IobtFalr4shYGl5veov6YSwThLn6VRWMl
	rXItIPo4dKkXao7lXGcvdXF345fAUxf5eRA1NtMOUjW6aipbKalds1gCZEQ8SfjiUFXL454+wzP
	zqYFGMDvLVRGE572WtKZHoOsngL70R30nMT7gGKTIKGtRwX9aR6rlPj5yBsaJWlaHBapPImwbZM
	7j2Z0ph8wdSssTCUEelaX5T2WRjhY2zvCva5GYURMrnW6Mzej+3424tzV8jfKbc6jresJXSQ6MV
	l/om6eQ==
X-Google-Smtp-Source: AGHT+IHB4jQhQTTFHjUKBspn82NOI75eRRcHHbv5F89JQH4b2AzbEMH2AEUaXUx/aXMiln+9GOMQbw==
X-Received: by 2002:a05:6000:1ac5:b0:391:319c:193f with SMTP id ffacd0b85a97d-39ee900296dmr630621f8f.13.1744876010118;
        Thu, 17 Apr 2025 00:46:50 -0700 (PDT)
Received: from kuoka.. (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cb29sm19265954f8f.76.2025.04.17.00.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:46:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] platform: Do not enable by default during compile testing
Date: Thu, 17 Apr 2025 09:46:47 +0200
Message-ID: <20250417074648.81528-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling the compile test should not cause automatic enabling of all
drivers, but only allow to choose to compile them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

For longer rationale:
https://lore.kernel.org/all/191543a8-2e2e-4ac4-9b2b-d253820a0c9f@app.fastmail.com/
---
 drivers/platform/arm64/Kconfig    | 2 +-
 drivers/platform/surface/Kconfig  | 2 +-
 drivers/platform/x86/dell/Kconfig | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index 0abe5377891b..06288aebc559 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -6,7 +6,7 @@
 menuconfig ARM64_PLATFORM_DEVICES
 	bool "ARM64 Platform-Specific Device Drivers"
 	depends on ARM64 || COMPILE_TEST
-	default y
+	default ARM64
 	help
 	  Say Y here to get to see options for platform-specific device drivers
 	  for arm64 based devices, primarily EC-like device drivers.
diff --git a/drivers/platform/surface/Kconfig b/drivers/platform/surface/Kconfig
index b629e82af97c..f775c6ca1ec1 100644
--- a/drivers/platform/surface/Kconfig
+++ b/drivers/platform/surface/Kconfig
@@ -6,7 +6,7 @@
 menuconfig SURFACE_PLATFORMS
 	bool "Microsoft Surface Platform-Specific Device Drivers"
 	depends on ARM64 || X86 || COMPILE_TEST
-	default y
+	default y if ARM64 || X86
 	help
 	  Say Y here to get to see options for platform-specific device drivers
 	  for Microsoft Surface devices. This option alone does not add any
diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
index f8a0dffcaab7..641276753bfa 100644
--- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/x86/dell/Kconfig
@@ -171,7 +171,7 @@ config DELL_SMBIOS_SMM
 
 config DELL_SMO8800
 	tristate "Dell Latitude freefall driver (ACPI SMO88XX)"
-	default m
+	default m if ACPI
 	depends on I2C
 	depends on ACPI || COMPILE_TEST
 	help
-- 
2.45.2

