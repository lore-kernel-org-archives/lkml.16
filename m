Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92B42BCF72
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750844048; cv=none; b=t1q/mhskPI4/oc2dmh8N4IkZkHdvDewnelELdJ7Luq4BmSz/oHCiRWALllAsIFVievu5u7C39eXmiV1ixydpCMuTfiMahSp4MOSFHnbWZyZEcd45Rwfcb09zQg8XwxMAqCMAv1nq4JjAcVzEJEE7xjzzXJ86NXSkwL3wA/WCUKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750844048; c=relaxed/simple;
	bh=khNkfOsR7Llox6I112lqSvaS2QdOn2MM5KZ08Ea+Wgk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To:Cc:Content-Type:
	 References; b=TfAHV0d/b7FDl85JMb0d6wpnDOh7NEJgbP9u8MjENiq40Cf8/p0D3bnvvWZCsNu8kJyvb/7XUURV8bv/b6fT41pMAHdy5/tFoyYdSnJ0YC1AlBkxqASjC1EHJOq/FaPv5QQWOoFCG2fNYntrNdv73k0vBVqg7HHw41u6mGjxdmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=X24D4Uid; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="X24D4Uid"
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250625093356epoutp04e179742061d7062fd5fe7e2223f503d2~MP1--upar1333413334epoutp042
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:33:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250625093356epoutp04e179742061d7062fd5fe7e2223f503d2~MP1--upar1333413334epoutp042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750844036;
	bh=CBC9RrUsb8ZR2LuYyo/8tdiochVtCnPVT6I0z3/0w9w=;
	h=From:Date:Subject:To:Cc:References:From;
	b=X24D4UidyqsXvF5h62ivkZwJ1g/Pcuce28g+FFNq4XFP464SWDlVKn86pMoPbP0SC
	 aqEAXabVO2WLzxhK7nIUffPC0nkxv3GR4f4CWGpbzKn3Dl0NnbAGwJluUDsqwhlkX7
	 53Aor0q6uCclT+GZtwplfbm6aY+cBIlTow1pAsOc=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPS id
	20250625093355epcas1p2faae8a26c68cb02ea04d4c88e02b1581~MP1_vdX511190011900epcas1p2r;
	Wed, 25 Jun 2025 09:33:55 +0000 (GMT)
Received: from epcas1p3.samsung.com (unknown [182.195.36.223]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bRxTZ72sVz6B9m5; Wed, 25 Jun
	2025 09:33:54 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250625093354epcas1p1c9817df6e1d1599e8b4eb16c5715a6fd~MP19wiIYq0667706677epcas1p1z;
	Wed, 25 Jun 2025 09:33:54 +0000 (GMT)
Received: from U20PB1-1082.tn.corp.samsungelectronics.net (unknown
	[10.91.135.33]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250625093354epsmtip292d16f2bc0d2b23d1119c49d914b7fca~MP19s5avp0986709867epsmtip2P;
	Wed, 25 Jun 2025 09:33:54 +0000 (GMT)
From: "Peter GJ. Park" <gyujoon.park@samsung.com>
Date: Wed, 25 Jun 2025 18:33:48 +0900
Subject: [PATCH] net: usb: usbnet: fix use-after-free in race on workqueue
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-usbnet-uaf-fix-v1-1-421eb05ae6ea@samsung.com>
X-B4-Tracking: v=1; b=H4sIAHvCW2gC/x2MQQqAIBAAvyJ7bsEEw/pKdNBaay8WmhFEf2/pO
	AMzDxTKTAUG9UCmiwvvSaBtFMybTyshL8JgtLG6MxZrCYlOrD5i5Bt7H5xdqA1ujiDRkUn0Pxy
	n9/0AVpR/pGAAAAA=
X-Change-ID: 20250625-usbnet-uaf-fix-9ab85de1b8cf
To: Oliver Neukum <oneukum@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, "Peter GJ. Park" <gyujoon.park@samsung.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750844034; l=1198;
	i=gyujoon.park@samsung.com; s=20250625; h=from:subject:message-id;
	bh=khNkfOsR7Llox6I112lqSvaS2QdOn2MM5KZ08Ea+Wgk=;
	b=22L8HpUpqznMwZsnG30qdugykmy8QNtjp4q/oY1GDx+mA56yNFHaSpYKNkVvWLtg0rBLHTvaO
	oWVD9VL9XGaBs2WVE1Qhy78AL7auR/61t/1pqZuFb2dBU4WhFNyRCgy
X-Developer-Key: i=gyujoon.park@samsung.com; a=ed25519;
	pk=EdSwPjEiPaVzw7VRIRalIsT9igO06CZZXNJzE0/whs0=
X-CMS-MailID: 20250625093354epcas1p1c9817df6e1d1599e8b4eb16c5715a6fd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250625093354epcas1p1c9817df6e1d1599e8b4eb16c5715a6fd
References: <CGME20250625093354epcas1p1c9817df6e1d1599e8b4eb16c5715a6fd@epcas1p1.samsung.com>

When usbnet_disconnect() queued while usbnet_probe() processing,
it results to free_netdev before kevent gets to run on workqueue,
thus workqueue does assign_work() with referencing freeed memory address.

For graceful disconnect and to prevent use-after-free of netdev pointer,
the fix adds canceling work and timer those are placed by usbnet_probe()

Signed-off-by: Peter GJ. Park <gyujoon.park@samsung.com>
---
 drivers/net/usb/usbnet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index c04e715a4c2ade3bc5587b0df71643a25cf88c55..3c5d9ba7fa6660273137c80106746103f84f5a37 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -1660,6 +1660,9 @@ void usbnet_disconnect (struct usb_interface *intf)
 	usb_free_urb(dev->interrupt);
 	kfree(dev->padding_pkt);
 
+	timer_delete_sync(&dev->delay);
+	tasklet_kill(&dev->bh);
+	cancel_work_sync(&dev->kevent);
 	free_netdev(net);
 }
 EXPORT_SYMBOL_GPL(usbnet_disconnect);

---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250625-usbnet-uaf-fix-9ab85de1b8cf

Best regards,
-- 
Peter GJ. Park <gyujoon.park@samsung.com>

