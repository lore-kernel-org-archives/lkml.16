Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0FD295DAE
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558937; cv=none; b=FTyPkESeLSldIrMF4gCtqKY3R6SnZAzPdld1OSdLlJruTaLZexgpfoYHFSVeHwoKMmdXz4kq9dow4oW470nuoLepYjUxpjAvv0iuqNYz1Arxt7jBRklH5E/jr5iabOKcYwOZszVimnVVLur8/6qUdopZc00bhALTmfQMAlEJ6x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558937; c=relaxed/simple;
	bh=PYVfr4MzdRcAc8GZZqfTO+4NnznKF5DM0Ha6GQ9ktrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=LTC3L2drQuv4bnf/JJ3dCCrmHNIUZV1eogLj5Qh8CxO01JaM/Uer7+fvvXcWRx8VFfm033lwt3ekhyq/pRf8iY+5qej6r+czUMBONo9AYZyjK0pJ8y9JH+0VipMSRJeg9nrupEX7Z9P0p3AG/etRKtDFWPiSe+upFQE9ZegY3k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=qutaXPGd; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qutaXPGd"
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250610123533epoutp040103177d44688a74147ae8b11034e874~HrpSmp9Y-1280212802epoutp04n
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:35:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250610123533epoutp040103177d44688a74147ae8b11034e874~HrpSmp9Y-1280212802epoutp04n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749558933;
	bh=XzsliogzO86/Q79QWe6n/Aszt7NA4JFz1tCGiPbDBOk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=qutaXPGdEHqt/GgmGj/NiCrs6ycjXHH3yTzImA5qHwYpq03q2s2fPNPsxMSzVqN+1
	 ZPVVkP9TQ6SVuWKaFkcHfvYWG1dzJSq+1dYmFoZcGSMTY+F+fdgbKW9ThSjv91YyTy
	 iz4QD4sj7RQbwNkdt37euhxJ0CNyTiuQWBjPB+50=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPS id
	20250610123533epcas1p38e8c00cb62be58b704f0dd07a719af9a~HrpSNuU9T1866818668epcas1p3F;
	Tue, 10 Jun 2025 12:35:33 +0000 (GMT)
Received: from epcas1p4.samsung.com (unknown [182.195.36.227]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bGpD46smCz2SSKb; Tue, 10 Jun
	2025 12:35:32 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250610123532epcas1p24565e694897b17a36ad04752b7dd8678~HrpRU5_y70203502035epcas1p2d;
	Tue, 10 Jun 2025 12:35:32 +0000 (GMT)
Received: from yjjuny-lee03.tn.corp.samsungelectronics.net (unknown
	[10.252.68.99]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250610123532epsmtip17249719ac46a1ab5f28e8a496739d0ba~HrpRP3Jll0052400524epsmtip1V;
	Tue, 10 Jun 2025 12:35:32 +0000 (GMT)
From: Youngjun Lee <yjjuny.lee@samsung.com>
To: ribalda@chromium.org
Cc: laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Youngjun Lee <yjjuny.lee@samsung.com>
Subject: [PATCH 2/2] usb: uvc: Fix 1-byte out-of-bounds read in
 uvc_parse_format()
Date: Tue, 10 Jun 2025 21:35:26 +0900
Message-ID: <20250610123526.37316-1-yjjuny.lee@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250610123532epcas1p24565e694897b17a36ad04752b7dd8678
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250610123532epcas1p24565e694897b17a36ad04752b7dd8678
References: <CGME20250610123532epcas1p24565e694897b17a36ad04752b7dd8678@epcas1p2.samsung.com>

The buffer length check before calling uvc_parse_format() only ensured
that the buffer has at least 3 bytes (buflen > 2), buf the function
accesses buffer[3], requiring at least 4 bytes.

This can lead to an out-of-bounds read if the buffer has exactly 3 bytes.

Fix it by checking that the buffer has at least 4 bytes in
uvc_parse_format().

Signed-off-by: Youngjun Lee <yjjuny.lee@samsung.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index da24a655ab68..1100469a83a2 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -344,6 +344,9 @@ static int uvc_parse_format(struct uvc_device *dev,
 	u8 ftype;
 	int ret;
 
+	if (buflen < 4)
+		return -EINVAL;
+
 	format->type = buffer[2];
 	format->index = buffer[3];
 	format->frames = frames;
-- 
2.43.0

