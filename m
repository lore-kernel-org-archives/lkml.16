Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FD1201267;
	Mon,  3 Feb 2025 06:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563812; cv=none; b=fKX/hyFZJZPknZ1XQe66kCRYZVvEQ3VuwKFbqzl34DlwE2TkdPhNBvsrTAwt++HCZi64811GTC6F57K8fv49VETQcWx2CIh/P1dw1GXuCWvMvxHMhCJTXx2/ujDhkr3dV0Nn/Xu1OxWoimt04TEfTISli5Fki0l2yszYpCxfv8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563812; c=relaxed/simple;
	bh=RrCDjR4152pN3u+Y+wutMmEveLQyADtxiFlBdM1B2JM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eKC9ZCIu++AZNMg9bion+FRrXpGaLcD1KYE4PeqtSCcx2MYWXU+q3pSX0G7G17fps2LNqXe1b6NWmvQtgzWYVr1PzuPC9lC4TJR7gRMbchA2XDv9BPs4YyTn+u70HadLVBlBlrOFw7YQHWowbkRJfJCecyua0vdl1LxjHSoL8HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qi+Nqdw5; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qi+Nqdw5"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-51640f7bbd3so1313975e0c.2;
        Sun, 02 Feb 2025 22:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738563809; x=1739168609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEXfgKDF/1rU7YBLnOtQPO5qw+zI8YIs9m4T65cNiKc=;
        b=Qi+Nqdw5vi+Om2ZvtvxCBjgT57TX1fdlXkgTwUT5xTUyMWBLkNPCJytWBpIx8YAIj2
         pMA2c6FG0n9uUCb8EvkN++jxbzLRQImQ19+gshXTUiMhfLS/VTrfs+oWfBgIV2mnik2h
         ajIYg1DDooGfOEGHJlP1qJ+G9y3MTN+xWJrmNs5X8muytWsCChTXumgJh5zEUsqchiOt
         DbhLm6g24hPj1ISkJo70L5UehxRWQ/5oZycosUhaKhxQ8m+TZZu7jQgFB8yHQ8yUja/j
         pffFN601zKq8YT3y22Yk8QJWsyoKTVcjX0f71kcXkT54cxnDIelFMK6GYEJ1LjK7whgF
         /ijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738563809; x=1739168609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IEXfgKDF/1rU7YBLnOtQPO5qw+zI8YIs9m4T65cNiKc=;
        b=upqRwVK0Y9Qy3MHt7MzCp/QUC6NfCA0/ati/t8ITtovxoPIetbPx+mAGESFrrP2gaQ
         OsLJB6SI/WRqg5SrCs3bZ9IQWR1Zy9yAA6i8hM7x6OGrzZc3is66Xo4HYha+bRlUoH2u
         2KzA/et2XP+UdViopVH26U+0lXKSUaJPyBHmqictM7BWUYwodseYd5ZPmQJM/I5WYWIr
         xPviU4bzxgQfceK3ZNLKgzFhrcNfBPutFOl0fg481RYqTOxYAFkm5xU4+/ZisAijidlJ
         RoLkzFpEi0sMsQEzhPbEWS0iO23Pd+EMKYMsrUoBXEdVgbwKjqMug/9Lc9psv8D6dEQv
         gPrg==
X-Forwarded-Encrypted: i=1; AJvYcCV479B6ms0UsBt8aO7sFuM+nvDZMX9wJjLwyx4mSXh3/Qq0vLVSBzWw+OMQr2qveLE/OyLvLNsEfb0unew=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUZcL4/QWFjy83zbF3Q6vKBZyql2p6whxkBKQwr4i6fpjbl7Uq
	Vu27ss46Wx9vtvzSxkHN5KzXBjA/JwnQvoK6Nkb8/jU3XUza3RO/RE/bgg==
X-Gm-Gg: ASbGncvWYaDs2+qHE9Ehpbz3UWZL1sml7JtS9UdJMzgBtcV62fUjZ6+XUImChNjzJbQ
	O7YHqNBXPJ8rmLP+qwEmDSFEScRI7slFU8hXMAlqCyNzssjqkFrZ+aJfGG/RFqjnwIHfQLncuXZ
	MhfbkpwEqgxZwLiDM3qXmJpS0UUw3mNuSG+nv0OIfV8HbRmsjXDa5xTL4nZAg7sSqS9bN0pRSCj
	5vBeNMDU6TmCIH8/li3/q5FLD430SxUdveJea42KQgcj1xEwY6+hVhb/YObhTs0sq1OLepLFTLP
	Kk3YFh+YYWPA146/DYsaGIU=
X-Google-Smtp-Source: AGHT+IFHLc8WU4cheGdF+PBgec4JiEJV8mvWg0RHa89zu0Aqqg/fmUheeM8EC2cHPCz3eR58UzYCVA==
X-Received: by 2002:a05:6122:658c:b0:51b:b750:8303 with SMTP id 71dfb90a1353d-51e9e46170bmr15347712e0c.11.1738563809634;
        Sun, 02 Feb 2025 22:23:29 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1d64c20sm1138789e0c.32.2025.02.02.22.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 22:23:28 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v7 14/14] platform/x86: alienware-wmi: Update header and module information
Date: Mon,  3 Feb 2025 01:20:55 -0500
Message-ID: <20250203062055.2915-15-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203062055.2915-1-kuurtb@gmail.com>
References: <20250203062055.2915-1-kuurtb@gmail.com>
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
index 034e1181e703..56965bdcf478 100644
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

