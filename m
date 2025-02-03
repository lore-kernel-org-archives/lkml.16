Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5B021147A;
	Mon,  3 Feb 2025 18:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607283; cv=none; b=QuqSsQZ8m2y275bAmd+PS7ySigf9f2w5pYe/OCAXV+uIrOIq/6uZ0TUf5uGb2DJoynb77GoBOIHOgtPoUif7wzmsfAeFRsYfl2lJtoCuZVWLIiCvPTJoa2HWLemZct281CU+kx6ouq2sqyCP8b68NAp8BJU+EUJywcKZ5JTck0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607283; c=relaxed/simple;
	bh=6RWNKULCLcyX3qpo9lp6BHXXTfrdV+asCm2vmn5XUs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ndouv763fE9QQ3Uz/yWj5AS07PfHp792BQr4sdl8FDuX/altZjzyIVnPy9ciqfd4+NePnIUktJ4KmM2Jw2HGxUPRiq59TcVPKjKSzozN9C976V0CWrk7fD+cEGWFkPpp3EJEOh2na86mdG0Dk3frEhy2mMhdI9fa0sfi99WLWVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQY0EspV; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQY0EspV"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e5b107c4346so415087276.2;
        Mon, 03 Feb 2025 10:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738607270; x=1739212070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0LaXj60IfZoo+YSUXOLYVoLSI33CAZzHP32NqgEr2w=;
        b=IQY0EspV5+uyGO11lIaUXOUK1F6xEbUuNWCzqvx3N4foK306DRx/iYbf2K9jOHhYGh
         LgtSOHw1Cm28YessWbUivV0C9xyEGtF+ngPer6XfGLOBf5RToaAbU+b78OIqDIO5bXCU
         JE0kh3BdiNjbg3xqMc2Hw6kpvo8JLbjfiW+0083upqwRQY9yqgAafMGZihWf9kNOjN3K
         +oMgHT4lhg5pZF1JK5jCj4u1c/e35j3kK6El0GpnJi1C12EUTCEDNiKEZxcUmbE6WIAJ
         tsG4uKo/hIbCBAFmfRnPXCF3JksrLvMIkEwRysg7Z1emxl0dwDIszyuN9bpIawUXs2fa
         /+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738607270; x=1739212070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0LaXj60IfZoo+YSUXOLYVoLSI33CAZzHP32NqgEr2w=;
        b=LUUZ77Que3+o+PVtfsfAd4biKIgFDaGLE2hpfiv5eYFrMEMpW6JYWLTV0symMTZPnp
         yVF+9DppDoXET0CkrAtwKUFWL2RJHlasNwqBug79dRcalh/TssceanxMo7rqebi1bqLD
         ZiQGStqcBESmwlFVfrc7WFEY2o96xmIrOaqRto6z4ImGv6HYyFbGfgW8Fh915o2wMFR9
         SmH0T84rfeSlJq0VkQPEKvOIpz9qX7KT7r8lhsyDzamJ1iy2S473wQIW/IKiAOhUTxdF
         2KEcNA6fPwVFkJFvlnHCkx6IU8bHkqErLiN6C3gXsA5zJBGjQrpL1XjsLgIz1EM88ZGN
         6uxw==
X-Forwarded-Encrypted: i=1; AJvYcCVea/3vo27NSMkVOPDBlYduJQcrBSpf0Q0HYA3FVEXigLbNjfwCaEXNyxv0wHs3JFO5Lgh2cJGt0QaEKFw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl5+5Y5faDVOHh4f2QyHUs7qeJ1adEqAzAKKOVA+vpa1J7GvNc
	gDCsF2G8Miketr89etblgILbyEJWE3FL6QlbWqw7NIB8RxsHhpHb1IP9tA==
X-Gm-Gg: ASbGncvFmAm+T5ZgTAiX2q+wtRrd8HbqGTJ+fvAsN2kHUk3J15VknG9gUDEdqwdOQi/
	GeMf3EmwYOdRfDXaei4E0GUqa8EPi9pbE6rLbagWQybU+pV0FAk2RUPwYbJ+X3vmSINz3X3Ugby
	+eevPsMTK5KG073pQQrCzuo/dbtSonM6f3NjnU/h96hE0F2t4U/reWG28HVH4nfIyvexDkORTOr
	qXf74a3MJ3rV44fsPutq49VXiknQHjnU0n7AooJgkDO2UGEX2coYLhzWy8/CU6jCVTZ6vOk28LE
	1nIxQ2OGqQLc4v0f80ZlGeY=
X-Google-Smtp-Source: AGHT+IGlt5LBhudCIejKRxRIYNU6Q8RGyjJvzbi3NtxDQACdauyvC2LW5gLq3BsQED6KNBljh+7ACw==
X-Received: by 2002:a05:6902:102a:b0:e57:caaa:fe60 with SMTP id 3f1490d57ef6-e58a4bcb243mr16462541276.30.1738607270122;
        Mon, 03 Feb 2025 10:27:50 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5acb2bc726sm2142239276.30.2025.02.03.10.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 10:27:49 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v8 14/14] platform/x86: alienware-wmi: Update header and module information
Date: Mon,  3 Feb 2025 13:27:13 -0500
Message-ID: <20250203182713.27446-15-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203182713.27446-1-kuurtb@gmail.com>
References: <20250203182713.27446-1-kuurtb@gmail.com>
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

