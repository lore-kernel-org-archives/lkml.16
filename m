Received: from smtp74.iad3b.emailsrvr.com (smtp74.iad3b.emailsrvr.com [146.20.161.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BCC1A3056
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=146.20.161.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725411; cv=none; b=spK5NHq5eCutFUTD/jg3aTKbijKIR3uvbZNmgI/tClYFkOSFnUzBeKebZNyNYHkNgYofxYjWV6O09CaE79wxFjM9XpzqnkTp+obIfXSmlB9xjyxN+MCjiQ5bxic/ArSfJmx7TauDmz9V9MtekqZX47svQjLZdBo6qDgGGzr7WXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725411; c=relaxed/simple;
	bh=zXEiDMbXJWzmJpxzg6Q9EZNCxOs8o/DNK2ZwdpA3Q9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=io/GgRShELdxKdhR9+g1ZeqxtXWuJZDd7KX8H4wzDkxxDPEW9iKg6pG53eaOM/H8et9nSHbwVb9MZP30LYo4R7LTDCayJKRYX6U1ghUyGYJ7tGZCo1cL80eqYSExSqQ3GmMwrzMigvoht5KwH3t4tY+RO0HsBCYQ0xyMP+cA+PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk; spf=pass smtp.mailfrom=mev.co.uk; dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b=JoCde3ag; arc=none smtp.client-ip=146.20.161.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mev.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mev.co.uk header.i=@mev.co.uk header.b="JoCde3ag"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1744720761;
	bh=zXEiDMbXJWzmJpxzg6Q9EZNCxOs8o/DNK2ZwdpA3Q9M=;
	h=From:To:Subject:Date:From;
	b=JoCde3agYWllkFYvZNab0O/rTh9IryURz6li8O3Am1Qhzhc9LXaGJNGa6iRiAlrA9
	 HkZpZuz6WoA5tL8+vwT+VBfxs4HI0WWJ1crpj/eTq535FP3PTh9RouFWIIwCbBZS4u
	 fBJNeI9GFZ5b2AIzsT34TjoSWjEFklpnu/+7x9Tg=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp10.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 14A29E02A0;
	Tue, 15 Apr 2025 08:39:20 -0400 (EDT)
From: Ian Abbott <abbotti@mev.co.uk>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>
Subject: [PATCH] comedi: jr3_pci: Fix synchronous deletion of timer
Date: Tue, 15 Apr 2025 13:39:01 +0100
Message-ID: <20250415123901.13483-1-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: b8dad06a-32c5-4012-8ac9-26886d1a4a1a-1-1

When `jr3_pci_detach()` is called during device removal, it calls
`timer_delete_sync()` to stop the timer, but the timer expiry function
always reschedules the timer, so the synchronization is ineffective.

Call `timer_shutdown_sync()` instead.  It does not matter that the timer
expiry function pointer is cleared, because the device is being removed.

Fixes: 07b509e6584a5 ("Staging: comedi: add jr3_pci driver")
Signed-off-by: Ian Abbott <abbotti@mev.co.uk>
---
Backports required for stable kernels.
---
 drivers/comedi/drivers/jr3_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/jr3_pci.c b/drivers/comedi/drivers/jr3_pci.c
index cdc842b32bab..75dce1ff2419 100644
--- a/drivers/comedi/drivers/jr3_pci.c
+++ b/drivers/comedi/drivers/jr3_pci.c
@@ -758,7 +758,7 @@ static void jr3_pci_detach(struct comedi_device *dev)
 	struct jr3_pci_dev_private *devpriv = dev->private;
 
 	if (devpriv)
-		timer_delete_sync(&devpriv->timer);
+		timer_shutdown_sync(&devpriv->timer);
 
 	comedi_pci_detach(dev);
 }
-- 
2.47.2

