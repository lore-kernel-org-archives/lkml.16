Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2B63DAC0A;
	Fri,  7 Feb 2025 15:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943242; cv=none; b=dnrUkPj33njUhHUigQnPSCvUoBQRY8RhgWnbu4103XGBp1Ocqd4g22L/mxTsCx3tIOn8Ic5fNEodMnTY4LgkTuZ8lmiTCPTOEfsJuASzp+efK6IO3EYYzDaIl+PUVfey+8x9rM0HmdwY3xWu3OJ31CE1vzFK1XD2uTWE/EQtO9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943242; c=relaxed/simple;
	bh=6RWNKULCLcyX3qpo9lp6BHXXTfrdV+asCm2vmn5XUs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vAQIezIyAJUvcbJ0HllWDpnpCIJEyw8ZTMz5lmk3ipzFeKPF1+JoIxGUdoxwtalEYMfZQGNF0eCCA3oqguHbubpw/vjB6XgZfA0f97BDmXDb9awWHHkiE2lPIXNFYNjSSzbVjqeuhFl3KcN+RFq50RlGZPxbt+I36LcRjfFPWa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvwHHr18; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvwHHr18"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4b6398d477fso617499137.0;
        Fri, 07 Feb 2025 07:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738943239; x=1739548039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0LaXj60IfZoo+YSUXOLYVoLSI33CAZzHP32NqgEr2w=;
        b=jvwHHr18iIAYsGcF2b/7CFPD3EBF3pWXQKxdrYHiO3WUOpV1SLGOZLz/aLrdNE6M4d
         RaQOKn79nsa1ejeGIDgX/tljfxlHfenxjGn1yKZseCHxDbj+1FLxMzQAbx0dtO/YOLRb
         +dWWftIvWwHisZlJbUM6CTNDwxdrxuSShQoS/RIXcIF6aMkD0Aoto7ci3os5N6bnvBZV
         G6WeNkyNCyTMF/jhA7A/g/UIDath/gCD8B+x7wXuBeUHa2ApE6Doa0tNGvSI7KmDNsVH
         RHcxwEZE14EndATRy1+Ant9VsO8+90PDPX0afeCRWDTmgMRsiZAaw//EmrqeTKk8iRJp
         5oUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943239; x=1739548039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0LaXj60IfZoo+YSUXOLYVoLSI33CAZzHP32NqgEr2w=;
        b=G5+gTX9JDt4PY9TdfxXqHvZN7bRERN8A0TwJ3Mov0dAhRgU2VH5x/HwbWKlY8PnPjb
         c7qKS2rbeu9PETglvpCPT7D1LpZhm+k/HFnjcBKjZ2NpHsHC1+XELl3TlKbx758Zxchw
         kHlWPcF98b2Z5+QKC2XY2Kqh7hgJJ0e84g0xDaCsViivjPSSoTfQcZnkqALnJGA7oaEa
         1+U9ibSkRHqX5O/lNKM8RriiuAI9HtC/ezdot8dyyMRl1FJdppGI7xIKOnrvJS6vrZ7+
         IryTa+4dnAi4sc8YhV1wGi+AhDB4TFg4IJ3VEDH42MpR8e3GdFVOc/0XDOu5AIRJ3EDq
         Cb8w==
X-Forwarded-Encrypted: i=1; AJvYcCUC3kDA1RZFszsMsjqQbFvvbUSf98q0p7LkUbHURIzcpjDjHWevB7K+59KDIIhe2aOJuHSesg3pjWtuLcU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgKeKBtrMxXV+q1ve3CUqbFfrEbCsfIeO0l15+md+EQoFLSBpN
	RKy5XFo53tq+7w9jwNRkBgkjG926IWUFyJEw4RJPsCjTgj/UwJLSODgKIw==
X-Gm-Gg: ASbGncseCJpXBLgr5BiG8EFTsnlLvXGLEp4nvIWBWwL+n44w3pGTVJKCnflwAaA/QmD
	MyXqRGWTWKhT0YMVP+nXvIwFDbDYqkwPVRPVZRqjFFGiBjEFkT23eqo/zHu2+Q3xeD+Trse6vx2
	gWbyDJ3hZeHpyI/XJ6suKHeECUCfaaXJRH3czVPDdg/PWGUqjx+2LqK+joQg7vAVG1SwXQqukK0
	ECaw57baPofpgEoK1qPKmlXDcqjtP/VAr3g6ApgWq+hSpJSO8uhGIT+NMVDQCDgT4oUfLaYd0np
	WrSS4u0vNohoH0TWy5Dh9VM=
X-Google-Smtp-Source: AGHT+IF0ojTLU4Crj5l01g+S1d6l/y8g1K8kJdjeHzMJYvYvgFIHv7FBmpohcnN1XXj9wCbBuStdjg==
X-Received: by 2002:a05:6102:cd3:b0:4b2:5d65:6f0 with SMTP id ada2fe7eead31-4ba85f0a5d5mr2777096137.19.1738943239681;
        Fri, 07 Feb 2025 07:47:19 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ba76cb8e44sm768456137.0.2025.02.07.07.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:47:18 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v10 14/14] platform/x86: alienware-wmi: Update header and module information
Date: Fri,  7 Feb 2025 10:46:10 -0500
Message-ID: <20250207154610.13675-15-kuurtb@gmail.com>
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

Update module header and description. Additionally add myself as a module
author.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-base.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
index 7bad9717183d..64562b92314f 100644
--- a/drivers/platform/x86/dell/alienware-wmi-base.c
+++ b/drivers/platform/x86/dell/alienware-wmi-base.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Alienware AlienFX control
+ * Alienware special feature control
  *
  * Copyright (C) 2014 Dell Inc <Dell.Client.Kernel@dell.com>
+ * Copyright (C) 2025 Kurt Borja <kuurtb@gmail.com>
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -16,6 +17,7 @@
 #include "alienware-wmi.h"
 
 MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
+MODULE_AUTHOR("Kurt Borja <kuurtb@gmail.com>");
 MODULE_DESCRIPTION("Alienware special feature control");
 MODULE_LICENSE("GPL");
 
-- 
2.48.1

