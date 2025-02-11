Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com [95.215.58.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E6C524F
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280307; cv=none; b=sAv5WKayN0t+H8+5tW6IGmlhucrawNjweKUbGJw5hMsogVWbTEGOIUjtQ+eCPW+qfNdTtLupzEqSksmP/qX3XG42nQBm6oowi3kqYnamHddT99zTWD9h4oHxFIfDKzaxs310+7BFEsb6ETYwASqbOUliFHaT2pkvL6KIUjCb54k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280307; c=relaxed/simple;
	bh=B8wkw5NBYDdXh61EgmT5rNJrsvuznKPUytfCP6b4P5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bm9ooIs6wjtCN1zXXZ9X/3EtG+XWsv1/A49NN+0+cjAhMojY7W3+L18uTktufO0VTb+AXnp6UEY1SJ53kgR2AkdJpZr8+3S8wlHvn+UMYrKY5TJdgaomkBnMWdTo9Kk4AwsXWVw2kZ67UtpyleotAbeYqta8V7FPDJHf7LTp4/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=T8meb7Yz; arc=none smtp.client-ip=95.215.58.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="T8meb7Yz"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739280303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OtUKk2pWGFWhHDLwcNQAdT2a+MsSBr0a0yXECt48nYw=;
	b=T8meb7YzxdkWJTYq+B4KCr3yXxQttYCkLFQFRDucQgO4cyaEjQRdQqA9DGHX6mNIg3hv1w
	9PekbONLzm8Yov2H/s5TaqnKorchwQe0PLLmjO0DOncQZVsEr9oWkY32Nr1eYjzXwa5BSi
	OP9wPlehNEFjoHzuNvJY+IkfGmQGP9k=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] driver core: location: Use str_yes_no() helper function
Date: Tue, 11 Feb 2025 14:24:09 +0100
Message-ID: <20250211132409.700073-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_yes_no() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/base/physical_location.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/base/physical_location.c b/drivers/base/physical_location.c
index 5db06e825c94..a5539e294d4d 100644
--- a/drivers/base/physical_location.c
+++ b/drivers/base/physical_location.c
@@ -7,6 +7,7 @@
 
 #include <linux/acpi.h>
 #include <linux/sysfs.h>
+#include <linux/string_choices.h>
 
 #include "physical_location.h"
 
@@ -116,7 +117,7 @@ static ssize_t dock_show(struct device *dev, struct device_attribute *attr,
 	char *buf)
 {
 	return sysfs_emit(buf, "%s\n",
-		dev->physical_location->dock ? "yes" : "no");
+		str_yes_no(dev->physical_location->dock));
 }
 static DEVICE_ATTR_RO(dock);
 
@@ -124,7 +125,7 @@ static ssize_t lid_show(struct device *dev, struct device_attribute *attr,
 	char *buf)
 {
 	return sysfs_emit(buf, "%s\n",
-		dev->physical_location->lid ? "yes" : "no");
+		str_yes_no(dev->physical_location->lid));
 }
 static DEVICE_ATTR_RO(lid);
 
-- 
2.48.1

