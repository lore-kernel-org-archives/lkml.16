Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DDA24290B;
	Mon, 30 Jun 2025 08:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751270519; cv=none; b=UJNis2kxtjn1QnM0mv5gY6KxT5pr1MaDG1yj2RZpkEV2ovrURLpyBrmhU7ys9gPt3pgPw87wDN4zeh2gnH1B7TckYr1UyxUTNFzjBGtggNT7SXwGDzvWmvZ1evLkLJCQYuq7ck3/NaX/Ke23gt4btoFK6Iq9z3tWIrRTHUGpCes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751270519; c=relaxed/simple;
	bh=1/uY3FjgYDtVpBV5UgGBGxzO4C9dj7R2QKPSjyd0w4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ayL19GpXLdKyn4K3MSSSbKy9DlcNhyAIt2E2pntOnp6lmgZN9lWD3g3Wk4u3dXr+BNM2zrcvU9NoldDJFW2sTnDRPzNUBHqK0mTZP62AFOMrt7VjpR0de8IVn1oULG+goG8+eKaUEcItExfAADlGuO2FemopSBXjjXiQMH+YVE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3LD/dPg; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3LD/dPg"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fd0a3cd326so23137246d6.1;
        Mon, 30 Jun 2025 01:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751270517; x=1751875317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Whn+81gfDlilc+limqNRyBz7Xbl+U+qQ54Hz3BONpwk=;
        b=J3LD/dPgZ4Wy4vdef/w+Id5cNvZ3/JDRHDc78hDIj3FC/5oO2lWWZTphb9vK1LRPUm
         xUl/a+EI/ZV/qPZTWjKrDzL7s6VgYRV4C1sDZY/zeHDvm1bUn8PQ4Ojng5ihbEqp0LKW
         xKyGVX81TUBVZ8r1wAIa3CNmbqfRUAB6JVIbIcNfuv498qelVZAw/rJ68Mw9Fwh7eAHs
         HDIfOZfHA+UWEmBJo/b1aWfiAHmeJfQGxfPVgP7Ipjk+XNM6lpqSRIRTcmjrPOtnJ6Oz
         93Ocbxm/4DNbrqvOc1X5Ssdufcj9jFIHxgApbJDDBA26i4eoaJrByU7Z7OSmyQBpOC6d
         lqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751270517; x=1751875317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Whn+81gfDlilc+limqNRyBz7Xbl+U+qQ54Hz3BONpwk=;
        b=lrFI8TwRZp5w8yU+2e6YQe5tpYM4Zg0oT96s1DmdtH2t5u3lxIYjH6oDrjAAjsE0Ju
         +qgxuNLyh5Y31B+iFA+GijC+QR5xMsWFLNe53vH0SX/e7Uq37MHvW9ETc9figC4V6f4/
         8FD959C9GDpm5P56Uq2nUSToca6QJN7SvF2g2lOW0kBPrZXTgFPPx5+vNAN6hJXk5Fd4
         LRqGugGpuwUq5Z4OK0/y64vVVXgHc3F1m+soDJyCNhTcH4nXXCaWdM1t1WbGhOtuux9X
         9YVKJ7e8aTeaH/DjfpUMHnvn25aEb05ovJe/Z6CRJbScZzVyJ4Y0lrqpmNHrASKRdWEX
         OUlg==
X-Forwarded-Encrypted: i=1; AJvYcCVeK9C/PXncMyfyeZ0mXnb/B+MZCGH1YSmVDshvDWXP6xxhaGMWoRQ0T4zC60IaWQ5Yy4yO7oXgp6BG+XY=@vger.kernel.org, AJvYcCXEpiXL0oYz/tehU96441XqbMkuLdoQwDX5ipI/qdtVwB83PrNFoLRIvFg3w+/sX9hP7RJvQmoPj98wRBpUQctb27rI/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyurlHlX75Zdl8IMYjLF3vQ5KDst4u6n9ZDrLX4lEP+eayEd0F+
	LiBg7yRZLQPRAifpgSGGEaR9d/vEcIVkOXZCiu3W9NOIJfyrZqsJEw7z
X-Gm-Gg: ASbGncveDIJx401jZePYoBjopZ0qP2ZUkXUGfn5Q94D12WNR2TWa/Unds8ojTzmBIa3
	x6hZl08BKl9rwSTRcK0YE3PF6F4vnZIjpCB8E/ZnLeVnxXoT2lNheNzSgO1v09LRCj/A0A82svb
	6Mf6aJJDHU6eGYkR+XSuJS6mQPB4WopdHg3M2RYKhz4WP+NttxLWGa2mA/Az8YYTgTHmQ2tOcxT
	Ro2+ReDBmU49b7uymiurutn+hvcqJQv/4QaF582uzhEumodZUBbpqO25ThMgG3WuS92ywXzsY/M
	rGcsaJLrUrODDKPuGbvUhhWXU7veqUScKIiC4w4g3CmYVAXWuNkeelrxNTzqqg==
X-Google-Smtp-Source: AGHT+IHzODiFqjh2agzMecnsqWzAYvk8YwCXgRhF7MhOXYuSwJ7MXqPuK+QBrPXdM3fpz2ViJvBKPA==
X-Received: by 2002:a05:6214:2a8e:b0:6fa:fd8b:54de with SMTP id 6a1803df08f44-70002915ae5mr190685226d6.30.1751270516816;
        Mon, 30 Jun 2025 01:01:56 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772df637sm63677026d6.79.2025.06.30.01.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:01:56 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Mon, 30 Jun 2025 05:01:10 -0300
Subject: [PATCH v4 3/6] platform/x86: firmware_attributes_class: Move
 header to include directory
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-fw-attrs-api-v4-3-1a04952b255f@gmail.com>
References: <20250630-fw-attrs-api-v4-0-1a04952b255f@gmail.com>
In-Reply-To: <20250630-fw-attrs-api-v4-0-1a04952b255f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3715; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=1/uY3FjgYDtVpBV5UgGBGxzO4C9dj7R2QKPSjyd0w4E=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBlJLsk3/ssIsGTOduz+w3WK+fTX7Q5hZ54U+Z95dF/g+
 bdzTs0vOkpZGMS4GGTFFFnaExZ9exSV99bvQOh9mDmsTCBDGLg4BWAiOxcwMmyKk9vFPunz8QZ3
 c/s1UupK4VJyqy82LtC37l2mmsSYYMjwv5bDVUtr37GytKBtu4okisufhRarS2xrn9V4TN0wOqG
 QCQA=
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
index 86d2a8bf4bb9debc81e38c928c5a3eb5a440cc18..4e7938b6f1ad4ab3fa5f5ecc560305a3fca4d57b 100644
--- a/drivers/platform/x86/firmware_attributes_class.c
+++ b/drivers/platform/x86/firmware_attributes_class.c
@@ -11,7 +11,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/string_choices.h>
-#include "firmware_attributes_class.h"
+#include <linux/firmware_attributes_class.h>
 
 #define FWAT_TYPE_NONE				-1
 
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

