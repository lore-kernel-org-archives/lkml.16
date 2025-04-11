Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81D02980A4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744361087; cv=none; b=A2/LvfVVX5b86LmCp/I/ywQiSHWe/LClu1X+syo3N58EoJpOtYWtIddzOn/u1Wvr6CS0ZOzSSNGazJkJQKN5wSEmjVNRsOgpg+TkQcmzAhW10FT3r1f19nbLi/4aeWJSFxPs5l5JYq9kULyjFu748Bs8ZtmmetqA9EgLlVY6S90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744361087; c=relaxed/simple;
	bh=lHO6aNOn5EwTvO2wFlp/SwAPagQH5zCdbSrrXnM1y3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kr07xx7QCnrG0+qEcSR3RFrui5I4TffMIk+majlDBTNYQsk4wOtE9FVGgRozSy6251E+SUkxIJlArWkCUTvh0D3fvofpQx0xqKWV/4AE6DIXpQUZhV2eA68KTIEYO929M048yYtIWL3GeKVlFm3ZucZFp85JGc61c83q1JmuPGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CTWa7HoJ; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CTWa7HoJ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744361081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Xcey4MLmxG1qv2MDXN4YFYZKnSncQZSjL+M9HUoeNcU=;
	b=CTWa7HoJpG3999H2QBJIg6wcyQBwbHXqSHSX7e8mXQ4cEyyghaOLgfhO2IqRzjz0BChWj7
	hQUuXx1dgozYD00/uhXIfdgeNuyV4/nz1pvkGfUAjcDPQJoJuS+UIRdTAE7SK9iy3oA5M4
	hcJ9XXxgw3oZb/xwUy16cOzo8NQIRto=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] pcmcia: Use str_off_on() and str_yes_no() helpers
Date: Fri, 11 Apr 2025 10:44:29 +0200
Message-ID: <20250411084434.7178-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_off_on() and str_yes_no()
helper functions.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/pcmcia/socket_sysfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pcmcia/socket_sysfs.c b/drivers/pcmcia/socket_sysfs.c
index c7a906664c36..4eadd0485066 100644
--- a/drivers/pcmcia/socket_sysfs.c
+++ b/drivers/pcmcia/socket_sysfs.c
@@ -10,6 +10,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include <linux/major.h>
 #include <linux/errno.h>
 #include <linux/mm.h>
@@ -98,7 +99,7 @@ static ssize_t pccard_show_card_pm_state(struct device *dev,
 					 char *buf)
 {
 	struct pcmcia_socket *s = to_socket(dev);
-	return sysfs_emit(buf, "%s\n", s->state & SOCKET_SUSPEND ? "off" : "on");
+	return sysfs_emit(buf, "%s\n", str_off_on(s->state & SOCKET_SUSPEND));
 }
 
 static ssize_t pccard_store_card_pm_state(struct device *dev,
@@ -177,7 +178,7 @@ static ssize_t pccard_show_resource(struct device *dev,
 				    struct device_attribute *attr, char *buf)
 {
 	struct pcmcia_socket *s = to_socket(dev);
-	return sysfs_emit(buf, "%s\n", s->resource_setup_done ? "yes" : "no");
+	return sysfs_emit(buf, "%s\n", str_yes_no(s->resource_setup_done));
 }
 
 static ssize_t pccard_store_resource(struct device *dev,
-- 
2.49.0

