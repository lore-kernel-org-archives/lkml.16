Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com [203.205.221.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026E628F5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321799; cv=none; b=bUzTeOxKNivQT8eoPlCl/osxA/YnUu3nrFgi/JdNYu9PIk1Yg/lSxvsqzQtkNTREeSyrdeZ6+OFblmwn14ZZQmrREHYYUsH1VD/sjsBRfCB+wJPi9QqEaw73GKxdvv2d5ie3E3sutCYlMl3+tL2hp755tQqVzcj4vZIHE9bdfIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321799; c=relaxed/simple;
	bh=fh6Nszv1BvSWHtSmmPlNnETg8EzVK0+qzlbf/8KX71U=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=OQXw7MNHAXKcgCLDnE2wdoPX+BrhRN6c8MLpQ4hEsIkqAehMU52mz2k/3A1JDarau+9uA5afGugtPsaORtH3jaOjxOGdTATMfbpBU/sKFPZuIh2EP1/RU4AxS4F10hpA+qSiT75OWzQiIOazTb3TNxHmbYsT+PuYOo/i4zaNlhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=JdYcO4fz; arc=none smtp.client-ip=203.205.221.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="JdYcO4fz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1745321485;
	bh=e3ONj9DxlwmlOM6ClKZHrQDzeItquWjfJMyEdq14BHs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JdYcO4fzMKDLDoHO0q+DzJYJ5nTz0ZHX0JabGqP/oaGLx1UBoQO6oiVAYx3AlEvXZ
	 jIjoxLOzp4k1faJXx0adjsvyqoShF4cRiD6okwYR70TH3XcwzzTE1ADc8Oq35+U21E
	 1kXkLeHrMcdbEniNT4urcclEk19tSPzKrMNFGW8g=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id 7D785239; Tue, 22 Apr 2025 19:31:23 +0800
X-QQ-mid: xmsmtpt1745321483toza199dr
Message-ID: <tencent_29AE601199DC77543B902D5EA227CB730E08@qq.com>
X-QQ-XMAILINFO: OEA2l6/AmyO4eOImuXSvsoYgfXsFpk+l/pUFkN+qnw/CMsIHGxmC9zo4ial4cv
	 9emh0+iKTTz6OEbtDB9Lci/ZbcDaqIrDbAYspIo5qNhYBAbPN9eFlWe5nS1UDB3gvB6bmp4KgbQV
	 DUgrez3KQ/uWVBcUzujNH3WyPcTTp+vzcG5T3uBXVkjetXp59uPSM9L8yz6xZS4kSWVsNpflawO9
	 VcKuBvATmWbsVJUKBbZeBJ+PAQZvwwaBPvt5lk4z7vo/pd2u82KePItAqVGj0nUVyLwqYGAm1POE
	 m/eq+5a89yNRs4yohl0l+KDMVlNSLCboQq8287S7+5VJed3j3hzrev0BUERaYB9HrZiF+hFFmVR1
	 x8DvqPQjSpVCUPIRsVQ1bYXHKBxj4kKSVjtN/0J9P1oY/IGKFIbe8gDgefGGf9VSqNbey0lpxTnJ
	 jSlxMbFiDL6+t24Xu2l+wL9TU5gkNCzXY+ymrjtSZ978tqjJzfPGvF9kCC1lK7WBkR0P1r4YTiur
	 7uhQJoXUOMkDmSrP1aMZvWq2GnN2ajBrF2OIa81mPnr6AEF/UHodGucku+oRiRg8xn27eUJcfc+Q
	 jRFE5tBU9udkxEjysAtTE/b7ZoFf5A+2Hk9j/byeTs28pCVSxZlpn+xINJS+yj9l+6JWUxLMPMrk
	 LLT+GfjlHRR/Rd1YD3juFjAF1moXT4sCeW6+4bPWTQyF5vGc4lGyUdv+JgU1drT22xynD8X1E7Cv
	 YRRhkHUFaDZ6wD8mxXPn44lNngKpyps22t8b7xMhK8gSXOx6APDtOf1q4+7R29ok+ksMxfLOKHL+
	 /SKs7ZFiiJ62Zz3S/jIfbQKYXFKVdQCqZVkvEU5w4jkI/t7IDYLL0LBv8jr+yjDW+jCOt9CeJ446
	 MOGFdjGsGU3gmJio8WFZ7QSx8ZV4/rWF2khZ/Mj2wihdIPftwRAZc9ky3783clwmTlfCOdTX6O/T
	 TRAhFFbrdHW7lheA/4uO4mrzmfv6Q8WoaWN0Cw5uyCF1R+asvhcQKbmxMRzL7IF3ksP2a4rf5rik
	 fpHEbeNeB4L5KdzpbXeth04v6HYAoFE5+BomNj3A==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: xiaopeitux@foxmail.com
To: xiaopeitux@foxmail.com
Cc: andriy.shevchenko@linux.intel.com,
	john.g.garry@oracle.com,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	xiaopei01@kylinos.cn,
	xuwei5@hisilicon.com
Subject: [PATCH 1/3 V2] bus: hisi_lpc: remove unused head file in hisi_lpc.c
Date: Tue, 22 Apr 2025 19:31:22 +0800
X-OQ-MSGID: <8c954c6c1193e02342b92deb7a0865ce055bbe16.1745320689.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745320689.git.xiaopei01@kylinos.cn>
References: <cover.1745320689.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

linux/console.h,linux/pci.h,linux/slab.h
are not used, removes it.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
changes in v2: fix build error in i386
---
 drivers/bus/hisi_lpc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/bus/hisi_lpc.c b/drivers/bus/hisi_lpc.c
index 53dd1573e323..f0ef9680ad66 100644
--- a/drivers/bus/hisi_lpc.c
+++ b/drivers/bus/hisi_lpc.c
@@ -7,17 +7,14 @@
  */
 
 #include <linux/acpi.h>
-#include <linux/console.h>
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/logic_pio.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/serial_8250.h>
-#include <linux/slab.h>
 
 #define DRV_NAME "hisi-lpc"
 
-- 
2.25.1

