Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B631A14A4CC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 14:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744985261; cv=none; b=Hai2nP47VahEX9pHw7vDMOS4vMGE2GrJaeXpd/0iv/ANhaMnCOCPflnqPW71dXARcrR63Fkj205KAOVmm72F/c9YqR04+FKTgFoXRyiusVexxR/Gj2heTSRXgobA9fsrUgv0NCg7lXtn5q87JgxqDYqv729xylW9zUiu0+GGq5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744985261; c=relaxed/simple;
	bh=XuOo9Ik7S02zDvGyFDMl1tQesRYdIo9cyadjRKde298=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G8RRBAfKA1FPOi7rW5ZIjZzWWFwe81A1Qh4z2W2BYCh08f3QCrK1zkMMh+MFWUKMKTYqAn+ln8iRlL3GzFj3kVy5xH5+MVygeFPNVnDznby/tqX2dj5m1w64bcRxNg9XLqkDhaqD4usdTsHE7wO6kPkNdd9o9aHey2zFNbkMlK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=noa-labs.com; spf=pass smtp.mailfrom=noa-labs.com; dkim=pass (2048-bit key) header.d=noa-labs.com header.i=@noa-labs.com header.b=Su3SCbsG; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=noa-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noa-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=noa-labs.com header.i=@noa-labs.com header.b="Su3SCbsG"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22c33e5013aso22986435ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=noa-labs.com; s=google; t=1744985259; x=1745590059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p6USpUWrLnzYBA8TX/R2FhcDlF2SxThWgxs+Y+F81H4=;
        b=Su3SCbsGcQbY7vtwKAxIfBKTDskD3b4pymOKzKlFcngDNGx4oYAhuBTET9iBnv2xzv
         UAOG0pLifglan9LuNJ/mUKl0ZgHOrvk8cxpSw5sIqPgT+2cbnZQHFSw8fhcHq0oqMm9t
         l62pYplFExy+Uj/nVeN40tgV18OpKREYKjoI63BscOlU996dZiL97/JGhTqhHlX+Xi2d
         UT5zHGg7DQbmff8M0aHWfF9lCtTrsR/HanPkSRWepSF/IEgtZGw/C8zsMUcAmWQdbktS
         9ZX/MAgmPYEU8XMoqRFDYm9BlbMzjXaKqK3SG5kBbAZ8vegcq2BV6X5mMDpSBafc0gtJ
         ylfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744985259; x=1745590059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p6USpUWrLnzYBA8TX/R2FhcDlF2SxThWgxs+Y+F81H4=;
        b=oG2K+PREJykMeTqGCy9mLpx8kT8rpGzcCAxlMKz0jGiG+HiVltROwlnSwA3ADrmZFo
         cYOvqo1qDFGTLvSh9Dr1aCRM46qABfH1b87GVVifENtUVEeoH/tcWenj1SZC5kGwxQG5
         x5pjJBCo8Dp30vGTokr+VReSm5DMXxG4spDb1ljwF4WNaTQfjfGGbGYWP165fu2NIHFC
         gkSBFhK7+Xb+rmf3azGu5cRyXtEArb3KQ1zoOOy88KDMV6nUnHnARyGCPk7cVyKOP04t
         5qQOCuN61XZUFcRiTRZ6Vmpcc01Nd0PUavfJp8MzKKCG/20iIiKld1dy15LTWMIuupnw
         lCjA==
X-Forwarded-Encrypted: i=1; AJvYcCVHjDXB9kTlUnwb7kCPSDPiPOewitnVCE/ZBsuEZ3AzMicHWRpUw6R2aooB0wt6xSPLwlmz9WFbC1b5sSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFsI3qG613obNBn1laWexQfR4M/7/iXCYrsawJ10qToyNMnIq5
	0qUONmOy5PaSEGbewMhmQ2/7gUwUzKoSMGbxE7JanghsvidWEsDj4ZDfCDscGFI=
X-Gm-Gg: ASbGnctc3MhyKJyi6ZR2LLGJaQsPtgF6700ZT0IPn3ZU0Jkl02j7tCSBhG9Iy35Lcgl
	NzM18T2jyUdEZBu0kuMArBArs5tssLWXUcD39T5I/cJD1Wjm1XfylvQeuuhZnNhZ5qGivMN41s4
	DMZ+86E51dByx9YJYWOobJn0W6S+IHBdWiEBYkq1zIcTB8fMSNlxtXYg+7l7ZtEdpEZfAoZ+sDM
	svfb9YGu3GZdcWcUnVNhGIGWlG/2tqlumFCdHrqc3yCrJEuiNCIoaIhF9+ZvMZmggYdA3PfASZ/
	7sygUsSS9IsAk9xtejR1gYDOa5Ss7+HWVPHzSBcqSqoFA3Ej5Pg=
X-Google-Smtp-Source: AGHT+IGDY4A9qWVhPK/5IuBpCCh8ZbiLJgCXTlCV4KF8CYpImkCVO65Sak+LmHjYWOza2thoGrE4rg==
X-Received: by 2002:a17:903:41c7:b0:215:b1a3:4701 with SMTP id d9443c01a7336-22c5359b5damr40639295ad.13.1744985258844;
        Fri, 18 Apr 2025 07:07:38 -0700 (PDT)
Received: from localhost.localdomain ([103.23.40.103])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-22c50bdaca6sm17167465ad.9.2025.04.18.07.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:07:38 -0700 (PDT)
From: Pavel Nikulin <pavel@noa-labs.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pavel Nikulin <pavel@noa-labs.com>
Subject: [PATCH] platform/x86: asus-wmi: Disable OOBE state after resume from hibernation
Date: Fri, 18 Apr 2025 20:06:08 +0600
Message-ID: <20250418140706.1691-1-pavel@noa-labs.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ASUS firmware resets OOBE state during S4 suspend, so the keyboard blinks during resume from hibernation. This patch disables OOBE state after resume from hibernation.

Signed-off-by: Pavel Nikulin <pavel@noa-labs.com>
---
 drivers/platform/x86/asus-wmi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 38ef778e8c19..0c697b46f436 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -304,6 +304,7 @@ struct asus_wmi {
 
 	u32 kbd_rgb_dev;
 	bool kbd_rgb_state_available;
+	bool oobe_state_available;
 
 	u8 throttle_thermal_policy_mode;
 	u32 throttle_thermal_policy_dev;
@@ -1826,7 +1827,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 			goto error;
 	}
 
-	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_OOBE)) {
+	if (asus->oobe_state_available) {
 		/*
 		 * Disable OOBE state, so that e.g. the keyboard backlight
 		 * works.
@@ -4723,6 +4724,7 @@ static int asus_wmi_add(struct platform_device *pdev)
 	asus->egpu_enable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
 	asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
 	asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
+	asus->oobe_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_OOBE);
 	asus->ally_mcu_usb_switch = acpi_has_method(NULL, ASUS_USB0_PWR_EC0_CSEE)
 						&& dmi_check_system(asus_ally_mcu_quirk);
 
@@ -4970,6 +4972,13 @@ static int asus_hotk_restore(struct device *device)
 	}
 	if (!IS_ERR_OR_NULL(asus->kbd_led.dev))
 		kbd_led_update(asus);
+	if (asus->oobe_state_available) {
+		/*
+		 * Disable OOBE state, so that e.g. the keyboard backlight
+		 * works.
+		 */
+		asus_wmi_set_devstate(ASUS_WMI_DEVID_OOBE, 1, NULL);
+	}
 
 	if (asus_wmi_has_fnlock_key(asus))
 		asus_wmi_fnlock_update(asus);
-- 
2.49.0

