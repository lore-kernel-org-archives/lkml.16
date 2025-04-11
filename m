Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8871607B4;
	Fri, 11 Apr 2025 14:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744382218; cv=none; b=QHN5oeK2l3HkwkMDnltFgBLeGs9fQbn4lhk5NOr4Eh8u6E9gGJVfc2eusCvTV82QmEMgGdGNraRGoZ+jUy+TXyqss1GVFtDrWJU60YS9zMMzzruBm1K7ZPY0lAC6XWZHEJA9hL9J/xQOYWqc2gwQqOxb5TmWx9AjuFGC9+oh6Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744382218; c=relaxed/simple;
	bh=SrM3/nW46b/Up1uYmcAJVJKRqJerTsXY35JIMkLNcaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ncrS2ZQwX2/OFMN+sil8RmGQ5DfPsHtVvZyybrypPCLfeEROvI2nkcoFhf0WcOTHlVcJFqbfc5JCKpkVzWI2NpD96VEhUSBYmASZmAE39a7m7PZ6mWIo/HQRaim/qtSy9wZSQj7xwOsTvzi4jMxKE4irQnHmBl/ejm/9hN2yYW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRQELaie; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRQELaie"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30820167b47so1515126a91.0;
        Fri, 11 Apr 2025 07:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744382217; x=1744987017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JmStyPiy4hw3LWA0hjvsecRLO8wk5l4wDE5cpFveI9w=;
        b=TRQELaiebilzLX7u+LFHGi3VE/Osa8L4KlvsbnSM0YViPXq/tz01hPrJvg4NkGJlhE
         GbCLzcCBh1IF2Yc8ddPfW1fS4M1gB6vmtHGZs5o1RI9U5UXMcFZ2L6Veiak7hV9Pyiqt
         /4+IASP/l5gPzeQRekFIJ5O7yKQvNMbvhZWyQyYPkMCElS+Z7tEap5+KSABQNHoFGriX
         dGgbbMv8XQykTspdMNJcElQPexLO3cOdGFC0MWxyxJLrnVM/0s4Isnrh81emDFyoSlsw
         4vev6nAdij2ABcJxNZDd2s4kb8jyEZSqLkmFgKEkOIjU6VVFAlZoBEknhLjQHbpWy0ZB
         EMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744382217; x=1744987017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmStyPiy4hw3LWA0hjvsecRLO8wk5l4wDE5cpFveI9w=;
        b=Xo8QJ6NLcw49oo7yiJoDskOKslK0jSVMkV6dCO1cCOVMYYmqnO4ZKf0xdV/G+apqCk
         qYj2U/ZOqbx3YwD8wU58/6MUO08IsfxyWTflMnNwa9eX+B+mpY/CpuJ7ztsbgOp9VjNd
         NX2VhWnB9wRwuNUkWp+HUVnYBA5lE3ksKk/tvjAJQVPQv5W/PWR9DWaPkAWRovmVEOSM
         y/LmHu7Swo+XeUY+zIVLosIajweyLFNxwP7c32WDo/LhuVgZfLVFzHcDMWXhfMBqHvuq
         6jzlJp5XX73FFF5ywImWESPzYeVnbspazX34nKmGw1lJESQ/hs6Y5fdfHWwZiPk0ASGE
         tIMA==
X-Forwarded-Encrypted: i=1; AJvYcCVbWPusIVwO0jeMcJgxiwsKSSWG7yUCkxKv2YFJwW7l8zzgQ6d/svkk4OaR5bYIJkUOCfMQjJJ3NNBsWq8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz30pupRiiziU4bVLQG+QumDmCVqFt6bfdyQ4v410C4UC9Qk7i3
	cd8X5NS9ZBVI36KS8l2xRqEACH9R4jIos7Ab8ZguENf9/wXdutcy
X-Gm-Gg: ASbGncsFHtTwPgqFPV8BZEy0YeAcIvWgwePwEmxfzzGVkLjMnbgP5xFUUAlbtZH+35j
	IHNF/oIc1PrnShSRDe1rCwwWT6XX4KwdgyWIbHtAvwLH9vn1SVl44P+4N3sSnntfcWtz9UiTF5g
	ea2zjDRsvPdL/G7OAo8lpLEeXzyaWdSRTDiITSY9EPwO+N/03eDUbWAwzuCXJUFgRqJiq3f0VuB
	SLokuz4nTjYL9/f3qVXxbePAwpgc+IpanzNcn5t2h/6aY3lX+GZH9lPeUE+0j6Wi++NN/4oCR2j
	5bK7QiX4pVk3p9KqREhpajuSX4r69xN/1RvAwWGN
X-Google-Smtp-Source: AGHT+IEPpzHRyCtkekhPOaZLwY2OqbUef4IqAFen1PMWIynzEewjeDHUOYVEVgWaguQ5f5cyn8PgZQ==
X-Received: by 2002:a17:90b:5608:b0:2ff:5267:e7da with SMTP id 98e67ed59e1d1-3082362265bmr4491874a91.3.1744382216799;
        Fri, 11 Apr 2025 07:36:56 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df06a14bsm5630754a91.1.2025.04.11.07.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 07:36:56 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 11 Apr 2025 11:36:41 -0300
Subject: [PATCH 1/3] platform/x86: dell-pc: Propagate errors when detecting
 feature support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-dell-faux-v1-1-ea1f1c929b7e@gmail.com>
References: <20250411-dell-faux-v1-0-ea1f1c929b7e@gmail.com>
In-Reply-To: <20250411-dell-faux-v1-0-ea1f1c929b7e@gmail.com>
To: Lyndon Sanche <lsanche@lyndeno.ca>, Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2

The dell-pc module only supports the thermal management Dell SMBIOS
feature, therefore it is pointless to have it loaded if this is not
available.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/dell-pc.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-pc.c b/drivers/platform/x86/dell/dell-pc.c
index 483240bb36e77d2118dfcbd6bf271e12e82e042f..38f198a7330006333b01787a9934b8eb146ce75e 100644
--- a/drivers/platform/x86/dell/dell-pc.c
+++ b/drivers/platform/x86/dell/dell-pc.c
@@ -146,11 +146,6 @@ static int thermal_get_supported_modes(int *supported_bits)
 
 	dell_fill_request(&buffer, 0x0, 0, 0, 0);
 	ret = dell_send_request(&buffer, CLASS_INFO, SELECT_THERMAL_MANAGEMENT);
-	/* Thermal function not supported */
-	if (ret == -ENXIO) {
-		*supported_bits = 0;
-		return 0;
-	}
 	if (ret)
 		return ret;
 	*supported_bits = FIELD_GET(DELL_THERMAL_SUPPORTED, buffer.output[1]);
@@ -255,16 +250,12 @@ static int thermal_init(void)
 	struct device *ppdev;
 	int ret;
 
-	/* If thermal commands are not supported, exit without error */
 	if (!dell_smbios_class_is_supported(CLASS_INFO))
-		return 0;
+		return -ENODEV;
 
-	/* If thermal modes are not supported, exit without error */
 	ret = thermal_get_supported_modes(&supported_modes);
 	if (ret < 0)
 		return ret;
-	if (!supported_modes)
-		return 0;
 
 	platform_device = platform_device_register_simple("dell-pc", PLATFORM_DEVID_NONE, NULL, 0);
 	if (IS_ERR(platform_device))
@@ -297,7 +288,6 @@ static int __init dell_init(void)
 	if (!dmi_check_system(dell_device_table))
 		return -ENODEV;
 
-	/* Do not fail module if thermal modes not supported, just skip */
 	ret = thermal_init();
 	if (ret)
 		goto fail_thermal;

-- 
2.49.0

