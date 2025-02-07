Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CC43DABFD;
	Fri,  7 Feb 2025 15:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943231; cv=none; b=IGrJQw6gPWCL/crIvc3DxoHbnDT9EALMz7Y8ubXdC1zAz6X2MJ1/2Gjr4HkuSekuMAiF1BejEfStSde5rfNbVLg55NzaKAwL2/KjaJkm2qHmrTC1+sE5Z5nfxG0/IUkPM2zTo0/CYWhFvPaTapSOPDHuk5DRBLqzhFRvzcZBg1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943231; c=relaxed/simple;
	bh=Woq4swbnYq3xsWIj3EtplDj2WuXqxSueFP8J8UTTZS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HwtFyCncQF5bBdCTb4OGhiu5J+dfeWvTA9gddV4bziI60jGWB0FPr2m9/xnCaOXMCYeRSuJgkIedEdpw6EbF8blKSzyZEXfOiMRUjCVWDeanXbU2LwLpwo836tf8vKmcdpKFOsSXHlVvmuaMf1vpBs8PDCnkcq3G8P2JNQYw3OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aRmtpESJ; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRmtpESJ"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4aff31b77e8so711243137.1;
        Fri, 07 Feb 2025 07:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738943228; x=1739548028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0Qac2DNxaP3+ckGylXZbGeHgHst/csov0aaJCMEn8w=;
        b=aRmtpESJSzdPkU2dcmRbK7xxevebpSNAJ/DtuzexE92IS1AiiQ/YZaYneEAYjbcOFC
         TTG3UiLZ1ThX2kYXFlJ9pP8c6B382xK6HBL9xxxn8tJ775pEMl3jwNzFZJUvpiDuJEtH
         LAdkOh/xC+t5IOPFgrQkGXyHntSxY5u7j3e9kbpERj9JYxSUMCW/kIxia/eZLy1oqmx2
         jIV10gXKrehsMv34udFVQCMShTXFc3eo9AQYm5aLTxjUoqq9UAuK0fsoU7EzAxDoJ8Vw
         hQnCsWRHEpXQgD9pdza/4Wdo/A94mN+N15XqCXCutQ+A5IAiG/wvt2hZ2IhPIDNLSecS
         EALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943228; x=1739548028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0Qac2DNxaP3+ckGylXZbGeHgHst/csov0aaJCMEn8w=;
        b=Iz6YC98d5Ucm7OrZbi9LmsqYFIn4SDWzgc/rHTpYotPqYia3arTbBjOOIq/n4L5Y1W
         jwThEq/ysMzJxmOfyK6J6cq2wI/vYarzdFZFIzVfC7W+QcWUdjvJVYUgM0yErsK2ZzhS
         dlqQa8jxjHKTAsZlAvt16Zy94nD8GGWzT3xEKXpcSfRnsoRcQTcFMPMl3GakDNDQ0HbF
         IoI9OLA5yPSDFXG7UVlCcVWnxIYMVs4PKAWgygFWjIkeDvYo2GWg+q1AjWfdVQHqeebr
         43iDktTsWWZ2ZQMcwFY78Ire0Hnu21I/mC7EIFtTwu6FJq9UAky4v3jaS3HNrxi/HbRB
         DNVA==
X-Forwarded-Encrypted: i=1; AJvYcCV7DyitZ3kTH5HP9nzziJeOA17T02yMmub4G4vSIrrAmWH9IuRiwh0CcYlgS1XUSfcEis0ClAlIhHRSYhI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmPOeqOHA8Lmi4CBmoSCEoQrOSP19Hp8a/hynveTwVNc8yMPAU
	TKOqn9qpqgz14vNWIJqNXLzdmwyZ3FXL3DGcDmegUsUq14h2j3qKmyDxDQ==
X-Gm-Gg: ASbGnctI8hOzzcUKrzkty0tl6uAU7uLNL1zSVMlgeFuNrx1tLUkT8hvLkk+pezLJeM/
	SDBXOLj4ev3bUstUSAvlV6GFpoSLTIvDn9p1ahjUXQbiDcYmnv6G4Yp3ME+XoVZWtqGVH1eV8M0
	Z34+xMJ4/lCk7hDRWX52ClvmiquMfjNoahPEBP8lL6qmh/tYIiu/srsH5w8dqQWyvvUO0tCB95g
	m5VtVca/oYt4vqU4Z0xhALnP5qBxZKGiuS0iUGlB7YbX2OJIbsGK6Dfye/075hluonueFILN4Ff
	iv5xtPO9T0tjBCEE74kJv5g=
X-Google-Smtp-Source: AGHT+IG9M84DUoDjnrMI3ULMO7C3hVpBmr5VBx8cHv2k8DKFj/Vjf53dc9dsFs/qZ7JHr0gDYYqx0A==
X-Received: by 2002:a05:6102:41a4:b0:4b1:3409:5dcd with SMTP id ada2fe7eead31-4ba85f460c3mr2701268137.20.1738943228128;
        Fri, 07 Feb 2025 07:47:08 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ba76cb8e44sm768456137.0.2025.02.07.07.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:47:07 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v10 09/14] platform/x86: Rename alienware-wmi.c
Date: Fri,  7 Feb 2025 10:46:05 -0500
Message-ID: <20250207154610.13675-10-kuurtb@gmail.com>
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

