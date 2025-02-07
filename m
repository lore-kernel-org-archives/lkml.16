Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A782414A4F9;
	Fri,  7 Feb 2025 14:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738937305; cv=none; b=JLrfOEQhBMvsFcp4KpiumjuAQdDTftm1a/fRmU1Ffj+vweVxMYrStD/ZgjdI2Cl5AIqFBrolee4u8eL5tsL7VPjo2uP2c+y17c/1FQwYTHeGJWkVFDP5jViH7HJ2bcyjA5MRW5cB49tlrwbY0FNON9xF7J6ellP81k780/7TdXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738937305; c=relaxed/simple;
	bh=Woq4swbnYq3xsWIj3EtplDj2WuXqxSueFP8J8UTTZS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WbADubfl0iMyHw4XdMrhr1Rtu6v0pIxxjkjITQEk1/WeYAqUYgjnPlmM1FSBkZv74dke0NlC2Om8zqWZab3qF8xVwiB+6nEfti1Ex65gy/eJ+aD32pWhQXqpTk0dQg8yCIa4fdSWq0U4PS2F8GxF20rxYkxwJsJ0y6c+fWKZjOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gD3Slv2x; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gD3Slv2x"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6f99efce804so13524477b3.0;
        Fri, 07 Feb 2025 06:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738937302; x=1739542102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0Qac2DNxaP3+ckGylXZbGeHgHst/csov0aaJCMEn8w=;
        b=gD3Slv2xs4HvYNW34qOEhNS++mByMYpnPP1uFLZTZ/IHnWWL14sPhWewgOh4Exm4Hp
         fwy1/HSKHm25VM9GVMZJHcD5gcsXiKVmJoloZcWDkMFviUiD41Ev1EizqmrbWG7qNtYH
         fjzOr5YIaj1pQB33hwKFK/YoVsr4t+eHVY5npbH7v748nYAAyEQC9DHhVh9ff3Ac15ZI
         nEoZHkd6z9LfBoJoan+DKXIaNplGMj/SMBZHG/VVMtYRyZOD+cma3SfUvce6/NPjTOH5
         sOyykf5TaoWHrSJZ8oikBst0GshRs+5KpurX7BceY4VVJi02jrZNbpixKGqqABOksLwm
         VYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738937302; x=1739542102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0Qac2DNxaP3+ckGylXZbGeHgHst/csov0aaJCMEn8w=;
        b=kcPJhgEeGRsNvIysPHHBs7dP/B5IqJ20w8Qvc7adDAS1GnWBoVlUoKar+GkoBr9gxP
         1zeyRx1VDeSOlkJPYIJuK2i5rf2nEUEJWQGF4vdBNdayYGtdW4hW/LGRt2911gb/MGPr
         Pw8jujhvo6V1tvKjiKrmpaWJoWVjQS0QCGAxPxKyHHy3chPTLxDGZDHQR6jA57vUQ8R3
         4xiYhsrqhsPdqTElnKYq6EcT6FtuuPKMnEqgmW1Masd4zuEx4kNyZ79crJgKgvAgXv26
         66JKHaaefI6IhyVxHK/mooaQl6ATDud41Rf5w4ZsRFV0OUAytTVOUS95HpH7OV4ca6Db
         FYOw==
X-Forwarded-Encrypted: i=1; AJvYcCV2A/TTu2TxUMgIRDy2Ns83R+9fTE6wqLpTwzJTdatUzAq4I79OgCwo24rytlFVQKY7KeSxwJJ9n4RJ+kk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFfu4F/vJSO1UB6uvHFTLoVSVuSb8zFF52igXD6a7GsN5dP9tK
	Y4cAv8AmIZ3NzcnMtPC20lNeUDMWk++hHNkj2cdZiITCEqzvaQjK1alW7w==
X-Gm-Gg: ASbGnctHwv6GTctC28uUBf6XjtxPHpOu0KOAGKS6m3trHTl5ZDvIxPIXbytjeAfXb7q
	Uur2LZzkd10klXVbexh2AvIk188GIn8JWECDzqbiWDuJ5tDS7DIOWzUpYbJHlw4W3A/YAi1omXI
	1yts7nGyzd8+OzqKbswO+18oohisNKIHWiWW7DoHiXvqIChfyXfEaJMg47VEYIkVzrp0B6gfYei
	LJufigXJk8FjdK6FxRed5Dd6w3rELVw+o91JVh4CrDrX0RevHpYDxgH7vMjElltcXqYx4Bf5Po4
	4CtK4CO6RDTD0vVNzIW6lJU=
X-Google-Smtp-Source: AGHT+IHTG5LqJ6Gi1ormcGQVLppxbpSJ4fyzSwZ3VqJRFYn0XAYJIHw4gdPA6TpiLGCvwn2ASEsQFg==
X-Received: by 2002:a05:690c:4908:b0:6f7:5605:c63c with SMTP id 00721157ae682-6f9b29d88e0mr28866257b3.30.1738937301934;
        Fri, 07 Feb 2025 06:08:21 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f9a000f577sm5525607b3.118.2025.02.07.06.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 06:08:21 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v9 09/14] platform/x86: Rename alienware-wmi.c
Date: Fri,  7 Feb 2025 09:07:38 -0500
Message-ID: <20250207140743.16822-10-kuurtb@gmail.com>
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

Rename alienware-wmi to support upcoming split.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/Makefile                               | 1 +
 .../platform/x86/dell/{alienware-wmi.c => alienware-wmi-base.c}  | 0
 2 files changed, 1 insertion(+)
 rename drivers/platform/x86/dell/{alienware-wmi.c => alienware-wmi-base.c} (100%)

diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
index bb3cbd470a46..f8aec8502c2f 100644
--- a/drivers/platform/x86/dell/Makefile
+++ b/drivers/platform/x86/dell/Makefile
@@ -5,6 +5,7 @@
 #
 
 obj-$(CONFIG_ALIENWARE_WMI)		+= alienware-wmi.o
+alienware-wmi-objs			:= alienware-wmi-base.o
 obj-$(CONFIG_DCDBAS)			+= dcdbas.o
 obj-$(CONFIG_DELL_LAPTOP)		+= dell-laptop.o
 obj-$(CONFIG_DELL_RBTN)			+= dell-rbtn.o
diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi-base.c
similarity index 100%
rename from drivers/platform/x86/dell/alienware-wmi.c
rename to drivers/platform/x86/dell/alienware-wmi-base.c
-- 
2.48.1

