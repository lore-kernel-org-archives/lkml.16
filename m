Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA9718FDD2;
	Mon, 16 Jun 2025 07:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750060115; cv=none; b=JY50neUjM2nMmWWCeAL/BY0OquClWRrZuGvylpxfUtPWi7si1/JW3ivduA8c20cVVpXJX5vquXItD2h/Yd9D/hOl+orem8MsIbsQZWvhlu+CctJVUzozzIAaJUP6PLrn27Vw/KtLZ9yLRrwUxNpxjzrIuo0+7ypxikoW5BFYAos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750060115; c=relaxed/simple;
	bh=gcW7ZhojFDRnb7CjmSy4Y2Jh/XxIrpKyzi5TmlhgjS0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WRxgfttZElAT3awYEPLW2eswqMY9ULMykoijM49rk6SX75lpk6ug/Wi3JKhahBG6JDoozRWsBYvXqUr0TxsHdvU7q9fm1HHv/fQZUoM149bh9mG0TXopewYAQlnexkPj8M2EofL6+7QIxQJSV71fhIHGmPiIu5W88E3IDo8++jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=RB9+UGxW; arc=none smtp.client-ip=185.125.188.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="RB9+UGxW"
Received: from canonical.com (118-163-61-247.hinet-ip.hinet.net [118.163.61.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 89D8A3FC24;
	Mon, 16 Jun 2025 07:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1750060104;
	bh=0sMODnku3hXVLi3524sm5kQNYzvUnfCHr4KSrFoxIN8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=RB9+UGxWZP5tQcDQWyqaMnAoo+/svHQTHqgA9n3jwfjIJ+HxD1XQeRZjhtWNfjbj4
	 QjQgkDlCGLemhSrPjAYloybFCxy0VCpoIpQWG1wPh6tOwATsbnl7ligrBlNJ3n0Z0G
	 hgPkUSRYmViwaDcGSnTbZOuOCiXocv8Q6Oheq+ucaJJUxs6CeTQHN0SAMgbeIs1XR4
	 i1ZNXelA/BKAiaDvk/RgGoeJGiPPtW/gWq93+eAfTRLU0ub/OPFVS+b7A1Txl9Ma7f
	 LjEEjpJmHCRaUPyNXbjlZad8ZhlIlE3wdKCtzjK7yq4lnRBQtHWi6Upr1/Ebygzu2O
	 mLrlplHQ4K02Q==
From: Ivan Hu <ivan.hu@canonical.com>
To: hdegoede@redhat.com,
	jesse.huang@portwell.com.tw,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ivan.hu@canonical.com
Subject: [PATCH v2] platform/x86: portwell-ec: Move watchdog device under correct platform hierarchy
Date: Mon, 16 Jun 2025 15:48:19 +0800
Message-Id: <20250616074819.63547-1-ivan.hu@canonical.com>
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

Fixes: 835796753310 ("platform/x86: portwell-ec: Add GPIO and WDT driver for Portwell EC")
Signed-off-by: Ivan Hu <ivan.hu@canonical.com>

---
v2: add Fixes tag
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

