Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD979284B33
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749555453; cv=none; b=V5MWbx8SWHOyoOE7w6juaop1EMA6O/8jYxD+QcO1b+WULLxIZGoNzIdez/02AfiRBnqpy3U81Myl9BTdnkDprXfsLZZauy6TgoG5etsb1ea3cSqiRX7ruhXZ8mq00wbteXXo2us18cpuFOiUCqR8nyVZfoQVcthBa2hc/wPnXDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749555453; c=relaxed/simple;
	bh=zbKBIpi614axTF8gG3DZNRk85mGzG8B+vodl/vwGUTg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=nJErugNlG24aUkjqGtP5F+gLrWKWikb+j71uJNs8OCYtBlV8canLvb0SPBTK//qRnr87Z5l+xuTUNcbxg7EK8NZUWTnDQsFmbXWO6BZuIK7PpzFNEKttn96zvKrGgS+LiPDxPdnLmvvNJUKwji+c4cP7mCg696f2f9YnNneyToQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=OVivzmZl; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OVivzmZl"
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250610113727epoutp044e2da6c5603333b4c8ee54cc6677cc59~Hq2kG3HdR2897828978epoutp04C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:37:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250610113727epoutp044e2da6c5603333b4c8ee54cc6677cc59~Hq2kG3HdR2897828978epoutp04C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749555447;
	bh=eeZmSry5I4+tQJiwtHt5qgVNOFM45MDKRAaXJGLpn+s=;
	h=From:To:Cc:Subject:Date:References:From;
	b=OVivzmZl1CfHfsIGZGiOKcB/jPXb9BfbP83JgfHlBV0YgiXVJlV9RMng3AzcK/QAN
	 +LzyFDDW8ooNvNM4zK86NNBAxDsKnXtQvn1628Ecvp7Ruq9mR2XxlNZyY5wiLS4G0M
	 BIhrLoW4Y3oycDSh24ej/WcZ9vrO444blpU1uGaw=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPS id
	20250610113727epcas1p37b794cd64a16f866e9da1c215c77d4a1~Hq2j2JVs70786307863epcas1p3W;
	Tue, 10 Jun 2025 11:37:27 +0000 (GMT)
Received: from epcas1p2.samsung.com (unknown [182.195.36.227]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bGmx31DTFz2SSKf; Tue, 10 Jun
	2025 11:37:27 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
	20250610113726epcas1p449116bfeef2a102c90e9519a632eb0b9~Hq2il7NRZ1580715807epcas1p4a;
	Tue, 10 Jun 2025 11:37:26 +0000 (GMT)
Received: from yjjuny-lee03.tn.corp.samsungelectronics.net (unknown
	[10.252.68.99]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250610113726epsmtip2adf1ba6dc5692599365a9365704554dc~Hq2ig7OKZ0485804858epsmtip2B;
	Tue, 10 Jun 2025 11:37:26 +0000 (GMT)
From: Youngjun Lee <yjjuny.lee@samsung.com>
To: laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Youngjun Lee
	<yjjuny.lee@samsung.com>
Subject: [PATCH] usb: uvc: Fix 1-byte out-of-bounds read in
 uvc_parse_format()
Date: Tue, 10 Jun 2025 20:37:22 +0900
Message-ID: <20250610113722.36820-1-yjjuny.lee@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250610113726epcas1p449116bfeef2a102c90e9519a632eb0b9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250610113726epcas1p449116bfeef2a102c90e9519a632eb0b9
References: <CGME20250610113726epcas1p449116bfeef2a102c90e9519a632eb0b9@epcas1p4.samsung.com>

The buffer length check before calling uvc_parse_format() only ensured
that the buffer has at least 3 bytes (buflen > 2), buf the function
accesses buffer[3], requiring at least 4 bytes.

This can lead to an out-of-bounds read if the buffer has exactly 3 bytes.

Fix it by checking that the buffer has at least 4 bytes before passing it
to uvc_parse_format().

Signed-off-by: Youngjun Lee <yjjuny.lee@samsung.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index da24a655ab68..60367d9e1c05 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -729,7 +729,7 @@ static int uvc_parse_streaming(struct uvc_device *dev,
 	streaming->nformats = 0;
 
 	/* Parse the format descriptors. */
-	while (buflen > 2 && buffer[1] == USB_DT_CS_INTERFACE) {
+	while (buflen > 3 && buffer[1] == USB_DT_CS_INTERFACE) {
 		switch (buffer[2]) {
 		case UVC_VS_FORMAT_UNCOMPRESSED:
 		case UVC_VS_FORMAT_MJPEG:
-- 
2.43.0

