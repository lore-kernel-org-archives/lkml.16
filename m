Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBDD1E833D;
	Sat,  5 Jul 2025 03:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751686479; cv=none; b=rjaux3KSUntEwupBGgLfY+/2pZmnD4cC5D/yt4LIteMJpv7ukOpJ3yE8o2r5cGNB7hxjGkR7jgw2hKx4aCIjEyK+7IHa+8UEAXdaveAcdbF5J6/OAxIIQyXdiqPOBoBAqGX+nYZkPrheIzNaKl2d2Xj4PODER7lu29tVv2sO9mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751686479; c=relaxed/simple;
	bh=Lnjuh4ZOXocex20M6BS4afXq/dyIN8vU7SmMelSJkHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CMAFxdlGV8wN9epHV6kdAi8MvkHW/ayZNkFkl17Iaj5gjXuuX1+UKCBy785h6x/0HxoOyep+9zEDzQnlWIT+rkydEoQR/RI05ra/MvO6Tj70yZu3cA/Pgdp9vaCLo6g2iPXkfKh/O8XsVbG8QJrH6XzqEABOWavW7vGgkMyJL8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQ8t0il4; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQ8t0il4"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a4bb155edeso18208391cf.2;
        Fri, 04 Jul 2025 20:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751686476; x=1752291276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLvba3Gwh4N2lya1BYovWa27xgWPh27HKdvKaSYmsw8=;
        b=mQ8t0il4zE/4weoL90nDeq/a+oU3iel+Lv1RRIPe09gOIZ0yfNyJj75/+1Ohe7s0wk
         xGR8ldQad0m/tozu+Cmf7xXVAtgnvlkrDzn1uimWiBaQmZ7SXgx0O824HyDxBKU/N6I/
         zZ7N1aRxi6TkXxtT2sWbwi7myWhY8w2TMuKRw0QEZApwhsVgh8KCe1FZ+7YG1OD70jwm
         Qbm3JfHg1jG7Jx1zZfboqNq48aDJuG/CrJ1JrPc24FlkAmbwfema9AVttWQXr7ee5alZ
         Npb7Rx8d4+3wnDEhhmpi9nB6H/19W7MDIWvgSVaun0i1SuX05c7efDR6dopcTQvb3f/w
         g24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751686476; x=1752291276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLvba3Gwh4N2lya1BYovWa27xgWPh27HKdvKaSYmsw8=;
        b=iGTaegX6tFLL+NSVdP6KbfmL+2VaL6anFAyXtwmI7tXaEWy2jxfY/qTqodp4MxySFV
         pS0qXGA0/HlaKM3Xmcp4PkHGNK/Fxyhbz8OhJxdkwALv1r+a7jctntZt8hmejX8LvqSq
         vtmxh4cfpwZ+4CPu4MHvMBMkMTFajLMkvBgempskkSy7SA9xO70BJKWjvI7JtEA7kK2p
         28MDOjh5UuW1I3x+IkSKa1BoSXrImOIMIu0dNMP3JYprj9kH+AKDKFELJYs7GCHBttzU
         1lUdReg8u8ZVJjD7nnztWBRbLYvpL18u1kjjxkbBiCXwth4zObX8SS1777OdDvYVuUQ9
         WrcA==
X-Forwarded-Encrypted: i=1; AJvYcCVE0r5Y2789FnQonG/LRkpwF7SJL5/Q+ik8FIU/ERVyUdKGtZmbrVyLpp2ywnxNxDrzY/TFrrc9YrYaUkk=@vger.kernel.org, AJvYcCXrBdJM3yfod1iS0oQeteMDv4oYiQOqubn5vOHnC4eB+OD8+UhV5jHUb3ughvZbHPeZU659Q7f5e41o1fH6mDHLBRI/bw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+T6F8eNqg7+i0iKkwoOJIepOUCW8JDuZiPoJNOAOG6hS/Ljdg
	QUGe8r9sJD9KlmBtPhuiSQjw7GU/gJBkevaG03EyAdvprS0a4Xm7LaIB
X-Gm-Gg: ASbGncsgwvlTKLf/ZfnMtWV5Vth57LNskjvxBZz0L6sh76fwZxleTZIBOZTNL8HYu2H
	0OIVOTA3qBtAtsyFD4RUuI6zVR1IUglue25FwHt3fX4MzvqlDWsRGsbogc04q0Z+DuP4Tg1HhBN
	27Oz/GuwdCqe01HHqktGNDFVI/TIejBJJQXjb78VFKQjr59FQtaqfuN+wHW2YS+drChogmebVuS
	MSvYsQsdgCVT5KFt0nmGfZz/lZf1VSW6YIGrWxx9zZ3CLDd+JJPxdB7wp2nVzLHRwTZZjI9KkEd
	Qn/1TsGoQjDVftCtyDHtLl4Mb5c8ulj5OPJEsLTwGnKyNTYFcJDSgrHkjfV/ng==
X-Google-Smtp-Source: AGHT+IHk1qMpuzmGpA4370ZbLNoCBLBkXTm55CYQc/CYM45R83p/YAe6MYxYOJckt+XeB1Favbq0Tw==
X-Received: by 2002:ac8:59cd:0:b0:4a5:a96d:604c with SMTP id d75a77b69052e-4a9a69724d4mr19201241cf.39.1751686476268;
        Fri, 04 Jul 2025 20:34:36 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9949e4a48sm25850281cf.13.2025.07.04.20.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 20:34:36 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 05 Jul 2025 00:33:58 -0300
Subject: [PATCH v5 3/6] platform/x86: firmware_attributes_class: Move
 header to include directory
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-fw-attrs-api-v5-3-60b6d51d93eb@gmail.com>
References: <20250705-fw-attrs-api-v5-0-60b6d51d93eb@gmail.com>
In-Reply-To: <20250705-fw-attrs-api-v5-0-60b6d51d93eb@gmail.com>
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
 h=from:subject:message-id; bh=Lnjuh4ZOXocex20M6BS4afXq/dyIN8vU7SmMelSJkHQ=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBkZc212fDPJtby9qFSuNLaiISpNdt2iRyc/JK1VYjEXN
 IzdUG/XUcrCIMbFICumyNKesOjbo6i8t34HQu/DzGFlAhnCwMUpABMxYGP4K7n13Nn4ydd/sph/
 3F7LkPJxkqT6v4wX+6ZbBDudcenVEmL4KxsU6bGmYGFN2HY5/4yeZ23leqY2D1SNMz9u5P69oyG
 DHQA=
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
index 96473b3b1a2a87cf21a6e2a9a14d72ae322c94ae..25a0f424ea9f691570f399e1771da4fc9ff12397 100644
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

