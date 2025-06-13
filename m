Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BAC26B774;
	Fri, 13 Jun 2025 08:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749803184; cv=none; b=hV8FdKC7fpH5vB66os8OPH6Rk2kwda9v1YhG4+gt6dTP9K9GW3aVnYAnNjo5UD+3K7AQ6Z7F0ApYJeTc90006q7H2QGg9unUiLXPTj8azuK3kWwY9fDh0MZueYV4v5QyHHDnN5DQbT7M0zVEuVQlUdXUy12aPQ5KcrQAo7EZIqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749803184; c=relaxed/simple;
	bh=ZHfesctzgFNOrFtmn+aXJup7a3ssdaH492fgBMdVnlE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cUm/l+kv7OHvBdP3GafzqZOMsJtXn9ks739GSP200HRops+tNRW7cuPJkZtDEW81xlpSrk0m3tdBqjSow3AGxDF87C1Qkq+oZecc3NGzRHZ2uTYu4F1aF0ZpfrbnMScRDvhabRYC7+NVYIeoQI0NkQ6dCVKD6Df4y9Qo30fLfUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=LZl7Ozvt; arc=none smtp.client-ip=185.125.188.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="LZl7Ozvt"
Received: from canonical.com (1.general.ivanhu.uk.vpn [10.172.194.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 82D5B3FAEC;
	Fri, 13 Jun 2025 08:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1749803179;
	bh=d/pzoPC2lfC8W0PA9XL09cFHVO8DAv+BBjkHc2wSDhc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=LZl7Ozvt/b76Wn+QIB3OyfFzxAMUfZMhBrXfE4ekP0mcbBe0FRXvHK2JveQx5hVnY
	 yLKgTcYcIn1ute17pUv86lWuCO9tdfEaiMXVviuqIKDlxKTC1TiaeHzPvqp/B+ndoF
	 laaduu36+eTERwJ/9WS8Su6+Wqxl9VFlqpSjrrxmxJnyMeYeP/HDBQOLJRe4zpZKBr
	 dzItl6+sCYwu3Gao78Ca+q5k/P/3gfK60LPHR/XXCn6AtvHEFRS5maal/6F78/+9yj
	 mkpxjW29HpVRltSkiPtKhkbsLtVkbJWAVONeVJF5TpLjwkQJCR/1wiImiSr90rHpM4
	 OFBoAdbE6IiQg==
From: Ivan Hu <ivan.hu@canonical.com>
To: hdegoede@redhat.com,
	jesse.huang@portwell.com.tw,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ivan.hu@canonical.com
Subject: [PATCH] platform/x86: portwell-ec: Move watchdog device under correct platform hierarchy
Date: Fri, 13 Jun 2025 16:26:14 +0800
Message-Id: <20250613082614.28929-1-ivan.hu@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without explicitly setting a parent for the watchdog device, the device is
registered with a NULL parent. This causes device_add() (called internally
by devm_watchdog_register_device()) to register the device under
/sys/devices/virtual, since no parent is provided. The result is:

DEVPATH=/devices/virtual/watchdog/watchdog0

To fix this, assign &pdev->dev as the parent of the watchdog device before
calling devm_watchdog_register_device(). This ensures the device is
associated with the Portwell EC platform device and placed correctly in
sysfs as:

DEVPATH=/devices/platform/portwell-ec/watchdog/watchdog0

This aligns the device hierarchy with expectations and avoids misplacement
under the virtual class.

Signed-off-by: Ivan Hu <ivan.hu@canonical.com>
---
 drivers/platform/x86/portwell-ec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
index 8b788822237b..3e019c51913e 100644
--- a/drivers/platform/x86/portwell-ec.c
+++ b/drivers/platform/x86/portwell-ec.c
@@ -236,6 +236,7 @@ static int pwec_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ec_wdt_dev.parent = &pdev->dev;
 	ret = devm_watchdog_register_device(&pdev->dev, &ec_wdt_dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to register Portwell EC Watchdog\n");
-- 
2.34.1

