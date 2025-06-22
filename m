Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8783C440C;
	Sun, 22 Jun 2025 00:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750550695; cv=none; b=cj49lSevcA4QlTkGrAUmKMqghIOy+4110Jti4FAe0iRq2TUyt4SxLCF4SygrpxI+wDlKYXPEPedsS7q6R520zbjZbIUBtRDmxeNxX5/VrW/gKbLfGOfV+m6aE6K1UfHHHpqqyVaRvmF2VPbNMdUwTXMvGvH6RteNOkQMMeA1Ryw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750550695; c=relaxed/simple;
	bh=Ev03nOhI3O2zIAdD5KACHNvxiZ5BFbf2hfuWHFiGuiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r7S+EMvyAE3yKlIWQxgKxHRY9Q4+Z6So++MKqwuBCBsee6Fk3aLoHZeLeFE/bhEDw+XTepA8u5s9BizDq04Fa16Q4602mZWDK/s75dMSene7kSKHNI0mmudBkFd7cp2+06alaXpne/x0hElEn+UlAnzUlsh0nUdT+hLG7BidplE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcf4RjI6; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcf4RjI6"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-74931666cbcso237907b3a.0;
        Sat, 21 Jun 2025 17:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750550693; x=1751155493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VNBPXOMqa8ce2SYEi86h/8XHU3XHNw6oTVxgDCvCUP4=;
        b=gcf4RjI6YdRTt+Q31aNlu0qoMxdrlKO3cPXNW445L1htWr5+BIY4cnRBX9dsZBO2J0
         g1LDLzOn1G3pyV2e3vu37xrYT3Fumot8D/wDq9NtGjQweONiYW9N5+oZf//OADhafg4p
         zrNmld8Lzwd8Qty3WQ208eW69J31w8nGGL2eBZJw0gTAG76+7Cp8pBpp7NGCFqAN8cOy
         aiFjswESZWVuF4xG3LQrVQQHPvfV80IKk4Lg1kYTItFzFZO+21xI7MNpWuSCVPEzkfPR
         3hUwPfQq+uOJ80mAc33Cj2umqD7XJxEmX8eBe6dRFl71KVq5nO4USYFRHtLRcVJfAZ2H
         XNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750550693; x=1751155493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VNBPXOMqa8ce2SYEi86h/8XHU3XHNw6oTVxgDCvCUP4=;
        b=cBgtUVGxHjaSqNuXdLxi+gcvXVVNu0DkvM3/PPC2QQxQkcq8d8hRjJezaXcefe6Nk4
         R3Ki8/REDDPrkWWpDiXlXYD79ZvrvmdLXAWu8rsAO5dUHbGlpfR2kDd3XR8oq10SoqFl
         T2pzDMMAGix4kPZmIK/UA9VGJ0qKS4fk4i80jehrzY5H4A/HJt/vwvJn9JqVs5PMt5V/
         LY3QuYw3jx+lmhTmQleb+LZ5UdyJFvNcF7l84Vf26UduLYAoK2CtSC4y+1CbtI6W0q4g
         xkmaUv2GOCm4JTPLbWkwQroNMSn/lr/SBn1yJ+SyK47QKXoQhKKjBFLMPIC3z4YH+dEV
         g3cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGh4gY31fNjtIDda+O4VEBbj0w0yJ12LUAKZ7b6LbmxKjbTc4pTVQIp1ybk091EdQdIdTRYwcEleqFByjQ7eP7N1KMcw==@vger.kernel.org, AJvYcCWl/nHc5Q+BH9dZUolosOGmskpXMzUstvLZtVtIEsTVF7t5kmz8tO500FBJd+v/Us1hZndSfVX0ivWgx6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGTXnGgrFN2CAUsUWe0/uOIH+hCMIgeLVEdnYfCowBLGQhuc0L
	p+v7SUueJel7qBbg9v5HCJh8IfkmHzpjhDOA+mlBpheEQcFdWzvazKmb
X-Gm-Gg: ASbGnctFJJdjaeM+E3QNlcPr1e0wHpTGLPuCtnwDXcqpU4ujN9naZE+FGk62bMwCVxp
	tst1mBA7Yj6WNG9ckIubYBVpS317Mk/2Xp+rhur1PZsKxEc9AS4PRtC9T+WrxqhWYSaefGCqnNP
	RGPKuv/cZ+N1C3qSeYHchkDJ4f/JKbtoYf3VXI9a6R58PRkXZkCD0bQpThs87PxidmfFjbtuvKe
	c9ZVCy3eXoeZUZXSnZ9BA8le8zw/0FzhtYSmNRtWLgp/tbwPgSXy6Srs1aNg7LowQwabTYfKCEa
	DXPDiX/rJ9foiL8TireU4uwAHlMG+pHR6C92yKbkOB2+7iAWgNHFlc+tcTbpGd7Y2Z8o7cJX
X-Google-Smtp-Source: AGHT+IFJOGMm2y8GVS3lSZpLGC+FD/F10k4v807BpJ8hbi7UXhavxt73T36watBtWBYbP82zIJCphg==
X-Received: by 2002:a05:6a00:3e17:b0:748:ff39:a0ed with SMTP id d2e1a72fcca58-7490d6a2b0bmr10596406b3a.20.1750550692695;
        Sat, 21 Jun 2025 17:04:52 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a626326sm4941424b3a.75.2025.06.21.17.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 17:04:52 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 21 Jun 2025 21:04:06 -0300
Subject: [PATCH v3 3/6] platform/x86: firmware_attributes_class: Move
 header to include directory
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-fw-attrs-api-v3-3-3dd55e463396@gmail.com>
References: <20250621-fw-attrs-api-v3-0-3dd55e463396@gmail.com>
In-Reply-To: <20250621-fw-attrs-api-v3-0-3dd55e463396@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Joshua Grisham <josh@joshuagrisham.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Antheas Kapenekakis <lkml@antheas.dev>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Prasanth Ksr <prasanth.ksr@dell.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dell.Client.Kernel@dell.com, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3771; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=Ev03nOhI3O2zIAdD5KACHNvxiZ5BFbf2hfuWHFiGuiY=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBnhHlNZeAMv5sYmppydnW+VEG7Mp1031ciBwcq5Kswm6
 vv/+taOUhYGMS4GWTFFlvaERd8eReW99TsQeh9mDisTyBAGLk4BmEhKKyPDuYc+TWI9Di/15rOZ
 Mqzutktclb5np31CpM/jEw2XdgozM/xP6jCUP6lV7rN1m//azYZHXkzR3pNz5ekUV86d/wwCjx/
 mBAA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Move firmware_attributes_class.h to include/linux/ to avoid hardcoding
paths inside drivers/platform/x86/.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c                  | 2 +-
 drivers/platform/x86/firmware_attributes_class.c                    | 2 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c                        | 2 +-
 drivers/platform/x86/lenovo/think-lmi.c                             | 2 +-
 drivers/platform/x86/samsung-galaxybook.c                           | 2 +-
 {drivers/platform/x86 => include/linux}/firmware_attributes_class.h | 0
 6 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index d00389b860e4ea0655c740c78bc3751f323b6370..3aec09987ab145508ed05b02e61a6d94edf79484 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -12,8 +12,8 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/wmi.h>
+#include <linux/firmware_attributes_class.h>
 #include "dell-wmi-sysman.h"
-#include "../../firmware_attributes_class.h"
 
 #define MAX_TYPES  4
 #include <linux/nls.h>
diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
index 034f9254240b048f58c97c18062db03f771f8139..af39ed9ad2836147c98b4bb0b89e70e96ee34b71 100644
--- a/drivers/platform/x86/firmware_attributes_class.c
+++ b/drivers/platform/x86/firmware_attributes_class.c
@@ -10,7 +10,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/string_choices.h>
-#include "firmware_attributes_class.h"
+#include <linux/firmware_attributes_class.h>
 
 #define to_fwat_bool_data(_c) \
 	container_of_const(_c, struct fwat_bool_data, group)
diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 13237890fc92002e7e730b1c235ddf068a6737cd..2df31af8a3b4ac88710af1fae2d5dabbb3185f1d 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -12,7 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/wmi.h>
 #include "bioscfg.h"
-#include "../../firmware_attributes_class.h"
+#include <linux/firmware_attributes_class.h>
 #include <linux/nls.h>
 #include <linux/errno.h>
 
diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
index 34a47269e3d34d2eda6b71af73892656cd2bf67d..f61a6287eb0ebe9ac4c0c9445c3b54c12b276691 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -20,7 +20,7 @@
 #include <linux/types.h>
 #include <linux/dmi.h>
 #include <linux/wmi.h>
-#include "../firmware_attributes_class.h"
+#include <linux/firmware_attributes_class.h>
 #include "think-lmi.h"
 
 static bool debug_support;
diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
index 5878a351993eb05a4c5c2c75b4915d972ce9becc..9a5a7b956a9f6a2738470e83ce93f4cccf4bf3b4 100644
--- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -28,7 +28,7 @@
 #include <linux/uuid.h>
 #include <linux/workqueue.h>
 #include <acpi/battery.h>
-#include "firmware_attributes_class.h"
+#include <linux/firmware_attributes_class.h>
 
 #define DRIVER_NAME "samsung-galaxybook"
 
diff --git a/drivers/platform/x86/firmware_attributes_class.h b/include/linux/firmware_attributes_class.h
similarity index 100%
rename from drivers/platform/x86/firmware_attributes_class.h
rename to include/linux/firmware_attributes_class.h

-- 
2.50.0

