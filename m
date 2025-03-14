Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 7391014900B;
	Fri, 14 Mar 2025 07:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741936183; cv=none; b=OrZFGi+f23RcbBCk0SFO5tiJJCffCKrVtu4RDoaTs+j6x+p0zNx9KZEUrYgaphpv6Il6EUD0SaPnrVNhq/UKlB5tQstq1KuMQsirc0rwk1PthJtup0bL9JVCnzdpvkojWRSVzFp+BsV74pXWRjs2Sosfg/MWTFAlwofraVeW/x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741936183; c=relaxed/simple;
	bh=5tIgY+fOrIQ6fiEkuy1fCF82z8dA2pESaus1YHeKH9o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RsCik2M4TLt2E9G9BGcpJVGoK0aXjD5m6D8uMRVAyU9T+1/ZaWA/wq3XZPEhk5RrDu307YXrtguHIJ6qvB0gk7fjZOfeeo9KcdWt3cSuuH+hxn0aoPn82zk873LoJKmqEsmCOn5Q/gAAS52YE26nUj52QjL3FL03IvYwULGlVlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from liqiong-suma.shanghai.nfschina.local (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 90FF36068096E;
	Fri, 14 Mar 2025 15:09:30 +0800 (CST)
X-MD-Sfrom: liqiong@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Li Qiong <liqiong@nfschina.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>
Cc: Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Li Qiong <liqiong@nfschina.com>
Subject: [PATCH] usb: remove the invalid comments
Date: Fri, 14 Mar 2025 15:09:21 +0800
Message-Id: <20250314070921.355986-1-liqiong@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These function don't return value, remove the invalid comments.

Signed-off-by: Li Qiong <liqiong@nfschina.com>
---
 drivers/usb/cdns3/cdns3-plat.c      | 2 --
 drivers/usb/gadget/udc/udc-xilinx.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat.c
index 59ec505e198a..735df88774e4 100644
--- a/drivers/usb/cdns3/cdns3-plat.c
+++ b/drivers/usb/cdns3/cdns3-plat.c
@@ -179,8 +179,6 @@ static int cdns3_plat_probe(struct platform_device *pdev)
 /**
  * cdns3_plat_remove() - unbind drd driver and clean up
  * @pdev: Pointer to Linux platform device
- *
- * Returns 0 on success otherwise negative errno
  */
 static void cdns3_plat_remove(struct platform_device *pdev)
 {
diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index ae2aeb271897..fa94cc065274 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -2178,8 +2178,6 @@ static int xudc_probe(struct platform_device *pdev)
 /**
  * xudc_remove - Releases the resources allocated during the initialization.
  * @pdev: pointer to the platform device structure.
- *
- * Return: 0 always
  */
 static void xudc_remove(struct platform_device *pdev)
 {
-- 
2.30.2

