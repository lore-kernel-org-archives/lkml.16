Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5599B219302;
	Thu, 29 May 2025 09:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748510656; cv=none; b=XQwz/nGA45sVlaP3Cx17stGqjSxHzmrtdvraFfB/x3AStk2FigLuYR5xvFmH57F6mOjWTri23hVTE48WD8h+8XVXpau75Wut1ugpRB7gchXJ5BHzN+IQiALNNIku8LaR71WgB0mwUzlL+M9W2RfT1XqcCL558VxG0y9uXMMq/Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748510656; c=relaxed/simple;
	bh=W7hTTqaOvyO8FmkOdiiv45viZ1BwMb+Fz3TbI5fFinQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aolDvJODyufT2huyAQThs8omoZXZAwye0D2XPI9Y95QUhptTelxapnV8bxk5Qn7CfRJLh6VwZDBnoDfSjXTYCKysMiVg5hwyDKfObtDczNZOFWr4M3krQmXpFlMcl9QtcFfypPfEuMcuFf4YrM4thEFkgJWyWdM4FxJdrykASr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=nsp/RGkq; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="nsp/RGkq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1748510621;
	bh=ISrC0a/6+K2mYle66iW3Why4wSgYXhacECMLknW32cY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=nsp/RGkqR9CclV9XwDnbNCbX9Nv1Ahfkxn8VaYPeSK5yJjY1h+EhTAF+SwMpn/+Cx
	 uzbGnLdhcc/N/Y7PtjTDvqVURIhy5UJ6fIeNhJq4sx/xmutMsUc6uo6rDWYXpr+NY+
	 jvYgWszbg7Z/UfhNlF7plgEwyapAmni5veRaRxcg=
X-QQ-mid: zesmtpip3t1748510600t3a3ac45f
X-QQ-Originating-IP: 1a/aIDlu3LqepYRSrdH1e1fdSQq2mgu8odTYB4aNhUU=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 May 2025 17:23:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16395633068952680281
EX-QQ-RecipientCnt: 5
From: raoxu <raoxu@uniontech.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangyuli@uniontech.com,
	Xu Rao <raoxu@uniontech.com>
Subject: [PATCH] usb:core:modify comments xhci_hc_driver has HCD_MEMORY just like ehci ohci
Date: Thu, 29 May 2025 17:23:14 +0800
Message-Id: <20250529092314.135457-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz7a-0
X-QQ-XMAILINFO: MCOMvNIqJoOnUgQxEIeCSzqNyQXjE4TJXY3k3ZGc5trUHSxvi5UTRDzI
	1ygOvfHCYg8Fhpszz9KQOPKr4Vv0K8d5kdVBMsN48Ll48+PbC0cSDuXVjA33g4qVVzUt1Cu
	fLRFcUZrxnqMS0sv1bDf7PLTb8qFAtojJrrW9k+lMv75CsxB61/aE2fW0XgiQRxT1b52U12
	hEv/xAY6Z+wCksXBwVnRqGQ0UpGtjWASLjHkr2S4Vh6VmO8cRrAuGp8/FW2YAkbVF4L5uMQ
	P/rdQVIV0LkgbFrVFsTrOJmHtppZQj6cbtc1vuDW7w+ZHjhbEmTbV+4awLPPXlDixBJL6yZ
	fmLJfJsOsFPs6UsfV3Gqj+a0oERURiWFSkn4iK4V26W1We3g9LT6x4+Psidxxrw/dFeRFqy
	8HuTffptOmQbOzzkMryC/d0+iTZY+H+aFFLHcNpWKgsDVQh9G3NdkO8dA4WWNvYur0eQCEL
	mA6bKfiAEDS5pqEu3fygf63vw73d/JQs4T6cp75BFmiXskBkzwICeQxXloX7YiW6ctDKwLI
	bi/tC3xkn4hosBYWGlkwWGQ4qA3V4Xh7o9pss5zkSmCwtuSzVYqqkwlrBWWIMrmta4SwCbj
	1pRt40DhkIjdUKqwNEsicCFFEiZ0zoNhWCSMtAirC7xJZFjWK7z46qWhRpR4O/8DDGTkwEw
	vP7hktLDq2qv5VMNPGrS6x6tsHfgdhvFQD4sCAeOZfBxedyAoQlTNSri7v1I9gF9+wLct8a
	3iZ4oMJ2SVeCTE8lcxXSTD3OPlSaXqUDDJNMYArWt4M94CmlPhh2FGN7ZlIRODNyqcA8yyt
	9RCtFqLgD9X7lgLfeg3jnsjzHrr2FDzKOE+YiPA1MNrxeMI4ufKPme3UUu87/Maznl3BI0n
	0lqhkjgVER5j0Cc3Rl8yVzhqlkV7WlGNFPu3JpuNBVm9Nc2AT/4l/FERYJa+jmvPEBjJuPq
	KGhECh1+CuNhwd5jO03ahlquPZZJM6JWd9J15HwHWDqoBGOboZ+tndaqbmk+GScsPgBxAD4
	9uiSt4pCTC2gMsQmfuz61/1ab8pqnInpYElH37aasJWktrDZxY
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

xhci_hc_driver has HCD_MEMORY attributes,need to modify the comment

Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/usb/core/hcd-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index 42d5e80ed0c2..600ee50ebd2b 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -218,7 +218,7 @@ int usb_hcd_pci_probe(struct pci_dev *dev, const struct hc_driver *driver)
 			driver->flags & (HCD_USB11 | HCD_USB3)) ? 1 : 0;

 	if (driver->flags & HCD_MEMORY) {
-		/* EHCI, OHCI */
+		/* XHCI, EHCI, OHCI */
 		hcd->rsrc_start = pci_resource_start(dev, 0);
 		hcd->rsrc_len = pci_resource_len(dev, 0);
 		if (!devm_request_mem_region(&dev->dev, hcd->rsrc_start,
--
2.43.4


