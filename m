Received: from smtp-fw-80008.amazon.com (smtp-fw-80008.amazon.com [99.78.197.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E449C7262B
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 05:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748324050; cv=none; b=TWlCz9qCmKJ3ujTGj+2yNcCthsknNYJ4T/FlXTwjG0fehnJgXSewoztAgtvT9X3JQwMzGblAIA1zoPajMf34vPHzoJHiUufWKLAd0ecCdyWuXb6k9zEsYr3LBZcknzgKbcfj02uEe1ODJpPrghqN+t0jWmGslZmAo2GbyxU+q8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748324050; c=relaxed/simple;
	bh=1z8F0tyR2ZJO5Q8COtboN2FHi++CwnlSXjeyhVEH64c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AGiOc1SvpRcNP24MGwY3Y1YTzYbe5DrmARz2nU6ty3OjsLzT00gcWmPaj3cNPszPSJRIzdCVcnAvErUen9M6VK+aqxyOr3KzU/h7cNCUqyr0i3UuNG+SXSzbcuwWJpikZEPvT6Lka1nzftJ0MbaaiKCNA44L3aSsSXm41N7PRxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=jE8znB1L; arc=none smtp.client-ip=99.78.197.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="jE8znB1L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1748324048; x=1779860048;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ALxDuEAyW1TOFrVEjE9IHU32KXQUelXY5rhzuYLQcJk=;
  b=jE8znB1LADOjW6upWqgPuTPywgqpZcZ9NyX9CtvZf5omHQJflZ/d6QUI
   c0sh2nS/26YV1jLHWuUWn0SoZRe5QldVDCYTwKz/E6Elo5tLUguA9I+is
   lDNLrqtpfUNGaimG8kEtKlZJ0RhnhVYr4PlyT5ksF63M9cW9Taa0m6LNx
   ETEPFr2XxwNB/jVSfbhyTn+Z3fAqTK1w89/fghdRFNHccAQseMGyqsPkf
   o++zBsspMvH8U80Qvp5W9cvU0Q6ZKw/ksg3wjJdsORRpwYCd0VcnAEFTW
   rO9GEmXrqFdLqfHt2CB4aqNmvvwa88BCI6K3JBtQXp5llSXKXsLtqNz+J
   w==;
X-IronPort-AV: E=Sophos;i="6.15,317,1739836800"; 
   d="scan'208";a="201098552"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80008.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 05:34:06 +0000
Received: from EX19MTAEUA002.ant.amazon.com [10.0.17.79:37491]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.2.235:2525] with esmtp (Farcaster)
 id 011752ab-0fe0-4d3a-8ad1-abd3a41eaac8; Tue, 27 May 2025 05:34:05 +0000 (UTC)
X-Farcaster-Flow-ID: 011752ab-0fe0-4d3a-8ad1-abd3a41eaac8
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Tue, 27 May 2025 05:34:05 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D018EUA004.ant.amazon.com (10.252.50.85) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14; Tue, 27 May 2025
 05:34:02 +0000
From: Eliav Farber <farbere@amazon.com>
To: <giometti@enneenne.com>, <gregkh@linuxfoundation.org>,
	<mschmidt@redhat.com>, <calvin@wbinvd.org>, <u.kleine-koenig@pengutronix.de>,
	<tglx@linutronix.de>, <farbere@amazon.com>, <linux-kernel@vger.kernel.org>
CC: <jonnyc@amazon.com>
Subject: [PATCH] pps: clients: gpio: fix interrupt handling order in remove path
Date: Tue, 27 May 2025 05:33:55 +0000
Message-ID: <20250527053355.37185-1-farbere@amazon.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D044UWA001.ant.amazon.com (10.13.139.100) To
 EX19D018EUA004.ant.amazon.com (10.252.50.85)

The interrupt handler in pps_gpio_probe() is registered after calling
pps_register_source() using devm_request_irq(). However, in the
corresponding remove function, pps_unregister_source() is called before
the IRQ is freed, since devm-managed resources are released after the
remove function completes.

This creates a potential race condition where an interrupt may occur
after the PPS source is unregistered but before the handler is removed,
possibly leading to a kernel panic.

To prevent this, switch from devm-managed IRQ registration to manual
management by using request_irq() and calling free_irq() explicitly in
the remove path before unregistering the PPS source. This ensures the
interrupt handler is safely removed before deactivating the PPS source.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 drivers/pps/clients/pps-gpio.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pps/clients/pps-gpio.c b/drivers/pps/clients/pps-gpio.c
index 374ceefd6f2a..2866636b0554 100644
--- a/drivers/pps/clients/pps-gpio.c
+++ b/drivers/pps/clients/pps-gpio.c
@@ -210,8 +210,8 @@ static int pps_gpio_probe(struct platform_device *pdev)
 	}
 
 	/* register IRQ interrupt handler */
-	ret = devm_request_irq(dev, data->irq, pps_gpio_irq_handler,
-			get_irqf_trigger_flags(data), data->info.name, data);
+	ret = request_irq(data->irq, pps_gpio_irq_handler,
+			  get_irqf_trigger_flags(data), data->info.name, data);
 	if (ret) {
 		pps_unregister_source(data->pps);
 		dev_err(dev, "failed to acquire IRQ %d\n", data->irq);
@@ -228,6 +228,7 @@ static void pps_gpio_remove(struct platform_device *pdev)
 {
 	struct pps_gpio_device_data *data = platform_get_drvdata(pdev);
 
+	free_irq(data->irq, data);
 	pps_unregister_source(data->pps);
 	timer_delete_sync(&data->echo_timer);
 	/* reset echo pin in any case */
-- 
2.47.1

