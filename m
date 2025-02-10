Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AF3223310
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739190703; cv=none; b=IKkaTdo7LkaQ91ter4VKqKcVY8vJ+we2p97x4/YPwBJwKYE9uhShORlmfBNBdLHuokZQBIEqblEKw6UhMc1i7mAv0XHDt39SpRFBPvbxeljhD2r9wHMYuW8joQ1261bUMbSJrZZHQVMm1I0VJEhIa9OnIcaERY5Xr1rxRQ0EfXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739190703; c=relaxed/simple;
	bh=qjSIgdAZ24T7tEVscCy0/dbSoB5tg9cqtETpeWww1Ic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q3VX7W/WA004sWdi6f0rfTsRZI9vZOrIEv5YCO2XyijppHh2mJ2isO35qlMC+JqT8Ii3c4Shwq0S4IJX+x8kBh3LXWHqfZ5m6OuSLL6wLy/bQ8QdqZjXqKQt5ImBRquh+9Ike2oSwBTQLJ/ha1m4m/MmEnjl+p119V1dfG1+rGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lWM1HhKu; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lWM1HhKu"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739190698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kfTXh6DZ400dvZqO6JrvnoYt9O+Ir0fmnFhb2HbjbyY=;
	b=lWM1HhKukHVv/Yuy70oDYAL9q3zDDXyUXyEBAl1QP/wl5WkAQ87bzCol4RWeAZ7aXbNdVY
	KHb38HqgV5TgfD4aZ1LzFmjhMOk1ajOZC4Ek3xbRHnviLqCVj/x5EYsakv/J9QmeaVZuQy
	TrtpYdLCNcUrlWA9WCGhqdFLj1wlUjw=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Mattia Dongili <malattia@linux.it>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sonypi: Use str_on_off() helper in sonypi_display_info()
Date: Mon, 10 Feb 2025 13:31:03 +0100
Message-ID: <20250210123103.112938-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_on_off() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/char/sonypi.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/char/sonypi.c b/drivers/char/sonypi.c
index f887569fd3d0..677bb5ac950a 100644
--- a/drivers/char/sonypi.c
+++ b/drivers/char/sonypi.c
@@ -37,6 +37,7 @@
 #include <linux/kfifo.h>
 #include <linux/platform_device.h>
 #include <linux/gfp.h>
+#include <linux/string_choices.h>
 
 #include <linux/uaccess.h>
 #include <asm/io.h>
@@ -1268,12 +1269,12 @@ static void sonypi_display_info(void)
 	       "compat = %s, mask = 0x%08lx, useinput = %s, acpi = %s\n",
 	       sonypi_device.model,
 	       verbose,
-	       fnkeyinit ? "on" : "off",
-	       camera ? "on" : "off",
-	       compat ? "on" : "off",
+	       str_on_off(fnkeyinit),
+	       str_on_off(camera),
+	       str_on_off(compat),
 	       mask,
-	       useinput ? "on" : "off",
-	       SONYPI_ACPI_ACTIVE ? "on" : "off");
+	       str_on_off(useinput),
+	       str_on_off(SONYPI_ACPI_ACTIVE));
 	printk(KERN_INFO "sonypi: enabled at irq=%d, port1=0x%x, port2=0x%x\n",
 	       sonypi_device.irq,
 	       sonypi_device.ioport1, sonypi_device.ioport2);
-- 
2.48.1

