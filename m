Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379302641F8;
	Sun, 11 May 2025 20:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746996302; cv=none; b=DfEMmwmPbZUuXUQ1Be7SrbiZu8G/TMQvAuQfJbnQasyUb+LwyIf+cX+bNqAZX8Kn07uQWrixb5PKRqGzG+pHPl/7bXA51sG63Llf4/8liGH1cEG5jxWB7Q17m7DItNe0GS0JCGnMPBfERKXcyT4uB87oznQGqYCqjpi6y9R03Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746996302; c=relaxed/simple;
	bh=XEG6Ru/scCkzDTSQfXsnO7HPtZzCYk3A2FZ1sw1GjsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t5aG7Q6N1oQpJ8gyCsjERyW50rbY0HYVCoPEyYp1DQ2oSScS3MO96nBPzeEkRljMulFmXA2G1DQVDuOnKDemvr9xPnFiYF0XRym7v9yaUJ89WsRlRwvQSjwfmd6/gbrge5sTUekILCQo1Y39+7zvr3WkQeqg5xK99Kh0EyIphuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=UF7LM+wW; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="UF7LM+wW"
Received: from localhost.localdomain (x5996a826.customers.hiper-net.dk [89.150.168.38])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 6079F2E0A4F9;
	Sun, 11 May 2025 23:44:57 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1746996299;
	bh=Z+4RxwDbg216aG3i/WsnN12fdFv3dUON+3NDpYGhgB0=; h=From:To:Subject;
	b=UF7LM+wW6HIgq0dvPKRC3Jlq17x2YOtmp9D42db0KRMQfRTK7v96+KjJ+lhiV8gF4
	 oOUKPpqk9Q/7uSEP1CEB/UEcRGOMkz7H2mLTf1XhD185yWDgEVPhNKH58A51ibxJuL
	 uA06iO2MzQitEJlYN2Cd+ody3Z2E/xQ7tqyuM6MM=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 89.150.168.38) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org
Cc: Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Kurt Borja <kuurtb@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v1 09/10] platform/x86: msi-wmi-platform: Update header text
Date: Sun, 11 May 2025 22:44:26 +0200
Message-ID: <20250511204427.327558-10-lkml@antheas.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511204427.327558-1-lkml@antheas.dev>
References: <20250511204427.327558-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174699629921.28113.4240116989424490780@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

Update copyright information in the header and specify
that this driver also applies to handhelds.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/msi-wmi-platform.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
index eaf0eb25e349b..7dafe17d4d6be 100644
--- a/drivers/platform/x86/msi-wmi-platform.c
+++ b/drivers/platform/x86/msi-wmi-platform.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Linux driver for WMI platform features on MSI notebooks.
+ * Linux driver for WMI platform features on MSI notebooks and handhelds.
  *
- * Copyright (C) 2024 Armin Wolf <W_Armin@gmx.de>
+ * Copyright (C) 2024-2025 Armin Wolf <W_Armin@gmx.de>
+ * Copyright (C) 2025 Antheas Kapenekakis <lkml@antheas.dev>
  */
 
 #define pr_format(fmt) KBUILD_MODNAME ": " fmt
-- 
2.49.0

