Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2890720FAB6;
	Mon,  3 Feb 2025 18:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607263; cv=none; b=qqeAE1NG/G7+/UvrKRNCKgPX+TVzaDJoSdlfZtWupP1Cr9yDcWiOIyosBuyZwWawGo5kPWaD468q/ZSbwy5yVgYZDpDu1g50hy2u/6NwxOWQG8WzKmAl8eG5LXaVwyl6c4Xnc6M3NoOtQqMh/qPH7rvF76no+La0z0ur1uMVS+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607263; c=relaxed/simple;
	bh=Woq4swbnYq3xsWIj3EtplDj2WuXqxSueFP8J8UTTZS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s7GEZfqqI43oY82vUhNsvHkZSY7efHuT4l4ubyeS2XVoxJ65Uyjor5a7WbB4UvBgOMasDMX/U58+gaonwKEw+vIK8Q4cGK+jDPtDHgyeklFVQEeBEKoatVUlzotmar+He+nTGumIbS8dayOqgyMPIuaw7Hm96W3LkrahFYa65bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUlHsli9; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUlHsli9"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e589c258663so4594945276.1;
        Mon, 03 Feb 2025 10:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738607260; x=1739212060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0Qac2DNxaP3+ckGylXZbGeHgHst/csov0aaJCMEn8w=;
        b=JUlHsli9jMxxEkDrHZetieD05gZGwPZaeGoh1DgJ+qhuNgql716txQtTc6eQH347NT
         1bVkTNK6wvIYSjtWkrDEQRlHm3hXY1LaN7Y6idrdmAOyswCrEHhQKBxrT4kcNvp2MjOM
         QDKeOoP10aOPqAQ9ytcgrcGBZ3IJpHjpaeP+rvd9+TV07DJfZj+Ts8KEV/S2O1ktbeHN
         YWbmmAK5o8tmScNcQZ0BQByqqIeTLH+/iZw07LzqIzUnexO3ZORhd4qY4UvogUcQOvQg
         tpu1ifcXAYawysVVK3FE02EdXfYxslf+8hyzFiMqY4Pi7uE/aletYe9BXIwvQ0rSrRgq
         UHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738607260; x=1739212060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0Qac2DNxaP3+ckGylXZbGeHgHst/csov0aaJCMEn8w=;
        b=QcSUsT0mmO9stRHfqSePH12P+dYNAtnniqYLsuGB49UPtvHVwDHFNUXYnHKIubguf1
         EBJptM58O6CmcXmXsCnPwFqC/79LXzYSeOMkLDwCuA5NQnAUNqfMH9ZGqNLKByttAKHO
         i4PLmz/lsnm7Nnh66cSiLC1bMrpzwirLxexKL0X+u1rOe57SgwQS60xPL+wucTrOsQ+c
         uc8cmO61eUCvG4zsR0GzyNOqb7QnI7DrR4qkWtIwDzAR/F0T96Dz8ukB84sZHZ2ACMy1
         CnnSdzgGvw7J48OaAJmIBQ2sbhbrW0mErxZcOnra9fc8fZp4PYi2TjHT3tzR8NUAWtiH
         rZpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq7kyxviu83OcRG20E+xq1FZDG34b5O2WMKLuEy+qlm6ZB5brwHNHEBKRdnkJjXf0qNoWZO43hxPMuE3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF+86Dg2Rg6OwblC2iP2r6zI+HHWwglFCH1OO4bsuasT+Jmnce
	0WEYlkIev/2YDoUSKg3PuaIX5NNsSKG3mbGUnZwfizg9vu9CWffGPVIqUA==
X-Gm-Gg: ASbGncuoHc7X9LfDV3Fv7W5SqY4/xl0kOpG32V0eeENZSskHxEJztqp4rNuOyUjwHXl
	JNTtPEAIjn+yV1mezmY4I8Mvrx0V/r7acx2+74dJQJhrjzAyIE7SVrrOHx5tbIqZBRLqd1xdP5k
	pwOiIVfJU74opQoKPsnG3UPdNKzevfm/1zGqhYAGmFbSoDXeaouWJTNYdb4b1TTARFmIYCL415A
	3J+1eDINMO7vfsvL7XeqzOIP42HReUborEyN/qET3iENhvqNxQmh35NeEHZPC3uRoclj+llbzrz
	XuDjLjL6z7H/QHysrsZX6V4=
X-Google-Smtp-Source: AGHT+IEI7bM36LuBwpYweDpXy37XFwkgcNcIo/5JkIWo12GcAgqcnp4BXmJDrk+beU2qNZ7juXHZDQ==
X-Received: by 2002:a05:6902:2510:b0:e58:3209:bd9d with SMTP id 3f1490d57ef6-e58a4ac5664mr16543561276.17.1738607259802;
        Mon, 03 Feb 2025 10:27:39 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5acb2bc726sm2142239276.30.2025.02.03.10.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 10:27:39 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v8 09/14] platform/x86: Rename alienware-wmi.c
Date: Mon,  3 Feb 2025 13:27:08 -0500
Message-ID: <20250203182713.27446-10-kuurtb@gmail.com>
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

