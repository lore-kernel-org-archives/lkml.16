Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BF81F942D;
	Fri,  7 Feb 2025 14:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738937313; cv=none; b=Fxk5XbZ/k1ZMx5Z2/ufZXpjRC9IG4e4psiDpawXbzaV96xGav4q/TdE97E038OkWoZdxviEtO4gOB9/sQj4uuR8r4MbKu6NYx+Csc1VD5SYxFWr2f8KQ6qk5xbiyuHfseDLgi0PCMdfQR0PaClxvpm9mfDz9XB4sd7j0CzfLZek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738937313; c=relaxed/simple;
	bh=6RWNKULCLcyX3qpo9lp6BHXXTfrdV+asCm2vmn5XUs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cGUgH29WA8Hb4Yayu0E718p/zJoxOT6bNHU4I1xOVduHQ4ZyxdC0Smcu4JnS5ddyLlxlwEDpUN4dhwNGN1u6ymOK8jjqFBLvHJ3mgPilVvW/xLgb9pnNoLnqiZ7AW7CCAp5ql3SmWDEKWUfVidjAPFSdSF08KdN+FwuMG45vFMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMCYMhtT; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMCYMhtT"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6f8c58229f1so18889017b3.0;
        Fri, 07 Feb 2025 06:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738937310; x=1739542110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0LaXj60IfZoo+YSUXOLYVoLSI33CAZzHP32NqgEr2w=;
        b=PMCYMhtTK2xHf99QKqh2OUpIEwbChCNT0f3qPmrThS3nlUPWF0e3bpDv4sD1Orr+Ly
         mI9s/+fz+xwRGu2Ny1plf+anPS3y8qKQOqVWsknL4aJJ1GNfsaodo49h5iVTtpqDi3iN
         uGq2IvB9b7ttgco/uhvNFKHUECS0x7YNC3GftcOrBXQ6MrTmeBXUgRxe6yCqWdVHWjUn
         CsJehUhn+Ib+nWHpzcWDWCCEv6erhx2vs0K5ZWfkHPNWFTtuu5nCO0DvdDww5wKniUEX
         w9GitHvUMF8Yc9ddNUm0hjjuHOftQ1/s08q1zfzc7FY60h/G5/Fa57+UiaIYoJi7F1Il
         /IQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738937310; x=1739542110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0LaXj60IfZoo+YSUXOLYVoLSI33CAZzHP32NqgEr2w=;
        b=wH+adXF4zk+1JZS7nv+BYg/CoHXCRBqpuCbwBWx8gQ4W4Ca8MuQnYa2iNobiZwTm+5
         K0gVVEuwxdMe+Ulkbzs8xRGzKT7Zt0607IoaUL3oYGGMDFpUw5VFGTZrjQ4HNkKmXAjR
         Y9HYCNPTMJDDkCDspnx/OLYaEQaaTVLAzvuEKpV59mA/usrtrXE0W/4CgmBZ31Edh6YS
         WS1RVDVputSTB286zKoocDUdj/RsEXeDgpnnadrZXw2xh18QBuchhBE+YFgfjC/kppf9
         iwurb4P6nk1uGnO6SFGS9o4NN6FquPuWrkiuBP3f/bOg7+zDRylhzDLJFrTNdnEuMSz7
         jAMg==
X-Forwarded-Encrypted: i=1; AJvYcCWd0Zl1riHBnIJ9m/qp50fkF3vc8RJEh1lkigc4YTHHxDoi8+Q1EhQ7nm1Qs8of1CyI3y9JI0Qy80ODRMo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3BXbtYVY44XvPEBWdtiC4ksJ7OzWRWokqZzd445lrZS2LNfZc
	EaMnvt994HTa981kyJjEUR9Ph6riXp49xiNBIcP/aXTNjtSp91Z+lSNffA==
X-Gm-Gg: ASbGncvqMspzjLjiZJMPoOW9r4S+sDhmliOJPMQPieQdlxjsHK/GqHqsm9Zu9D9tcpL
	sshUf24oCFXmmafFsvs5izlh2FK/OkcY3uyguvU3IplDl4s50ovNlcO3ptM+S5xQvZS1B7DecAE
	/9JRXeqzN6KiaV3mLhmEEzIgaGCKDcRbzOBKPssAqtf1J2qkXl0g0H/qVR19M2Aviz6DSYALmB4
	35laLJaOAV/7rSghIn6Yx420pMdmN6zBzpJlDhZSOlQWdod0924zZsDMuBnEvIYOlt9Chzmhi72
	5D08GaQ+Q7b5020mwfJqFM8=
X-Google-Smtp-Source: AGHT+IFqYSkDT5NPOt3lNuVM8zUo7/RGZZYj9S65i0BkR6vq2Jtm/NqPOMB1f4KjBlt/6UC/sjsChw==
X-Received: by 2002:a05:690c:c1e:b0:6f9:4b81:3dc7 with SMTP id 00721157ae682-6f9b3820127mr22843567b3.1.1738937310323;
        Fri, 07 Feb 2025 06:08:30 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f9a000f577sm5525607b3.118.2025.02.07.06.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 06:08:30 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v9 14/14] platform/x86: alienware-wmi: Update header and module information
Date: Fri,  7 Feb 2025 09:07:43 -0500
Message-ID: <20250207140743.16822-15-kuurtb@gmail.com>
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

