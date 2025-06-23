Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE646136988
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750676735; cv=none; b=J6a5KUI1LpINoqjmawT4t32x3koZzt0+iMVoswsyrpCJMyBZG8E7fkRuQXzgQnZZ96HqgR/e+pCS7V9l1rk6wO7eq/VkQr4wrAHEOlvoYiBTxyXjjc6VYBe4buM/mPa0bCex+r7yU+uWLTTpoKYDYeT6M4E9i2yyB+oJjlwnXuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750676735; c=relaxed/simple;
	bh=EqAn1S8ICismiSpJRfNkogHnjk51Ya4jj/7wEO5nZQo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To:Cc:Content-Type:
	 References; b=eB9ajRcez7+4NGpcdcdVO4aYlNPM+KjQK3WRyYsfd1i5VEE4tJ2u+4SWIYPToxR7RHiAtUIOI1qGXFiSdry6j/jhHJXgRSbcvdQFcSHeYBLmATR5P6FpBtNLHMgxykMrY8kfZcF8jU6yYpl90UNo0SuvVZMtb6OOlK7ldgYFhG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=CX4DWLpN; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="CX4DWLpN"
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250623110530epoutp011fe41b54eaf68ccd6f8c3b47c2ac8325~LpzYRTTTl0788507885epoutp01e
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:05:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250623110530epoutp011fe41b54eaf68ccd6f8c3b47c2ac8325~LpzYRTTTl0788507885epoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750676730;
	bh=KSeF0Q+TKVzy/nr2gAN3D9o/5DZHdxmYALybj60/DBs=;
	h=From:Date:Subject:To:Cc:References:From;
	b=CX4DWLpNaFG3WqPxz6vKdFKWA4RrXoIvuqkE6Vkie3JrckuXX/fgwinjL0Lo5CwkQ
	 bMv3rlHc471jmy1AHeR9GoGZKGLzxneX1UzvVTedzZIBcyA+aszPhDzM8kN1BqE1bA
	 470HDwMOAPAXdRxKhugUCkjKtmmWjHhWn5slqraw=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTPS id
	20250623110528epcas1p46b8c57c32d8bafbeccde0387e79590bb~LpzWhZDDs0320103201epcas1p4N;
	Mon, 23 Jun 2025 11:05:28 +0000 (GMT)
Received: from epcas1p2.samsung.com (unknown [182.195.36.226]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bQlc84Cxdz6B9mB; Mon, 23 Jun
	2025 11:05:28 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
	20250623110528epcas1p3900a802d75f41ab81d30a527808bc094~LpzVvi5Aw0181901819epcas1p3n;
	Mon, 23 Jun 2025 11:05:28 +0000 (GMT)
Received: from yjjuny-lee03.tn.corp.samsungelectronics.net (unknown
	[10.252.68.99]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250623110528epsmtip1d2f7fa3df6f571b1e47a9a9810c5125d~LpzVtuR4S1628416284epsmtip1e;
	Mon, 23 Jun 2025 11:05:28 +0000 (GMT)
From: Youngjun Lee <yjjuny.lee@samsung.com>
Date: Mon, 23 Jun 2025 20:05:25 +0900
Subject: [PATCH] ALSA: usb-audio: Fix out-of-bounds read in
 snd_usb_get_audioformat_uac3()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-uac3-oob-fix-v1-1-527303eaf40a@samsung.com>
X-B4-Tracking: v=1; b=H4sIAPQ0WWgC/x2MQQqAIBAAvyJ7bsGUUvpKdFDbai8aShFIf086z
	sBMhUKZqcAkKmS6uXCKDfpOQDhc3Al5bQxKqkGOSuPlgsaUPG78oLFkV03eDs5AS85MTf+7eXn
	fD7Q0oJdeAAAA
X-Change-ID: 20250623-uac3-oob-fix-78e8d3eb85a7
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,  Youngjun Lee
	<yjjuny.lee@samsung.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750676728; l=1333;
	i=yjjuny.lee@samsung.com; s=20250623; h=from:subject:message-id;
	bh=EqAn1S8ICismiSpJRfNkogHnjk51Ya4jj/7wEO5nZQo=;
	b=yBTCooNoon4Q2fyXQ1rkm86y3fbrA0yhAuUpqD47XlF2DTREuXegp8CN9MhPEK8Bk/GOFJ6nO
	PUTYPPBSFrACwDCWn828zLWqfX3nC0j6vxPJ9M+Q6u3Y1EAvHOauZNz
X-Developer-Key: i=yjjuny.lee@samsung.com; a=ed25519;
	pk=zXuiCEc9HjNw5Eg00AfBfl2IiC9qWfUHQ8JH+qADsps=
X-CMS-MailID: 20250623110528epcas1p3900a802d75f41ab81d30a527808bc094
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250623110528epcas1p3900a802d75f41ab81d30a527808bc094
References: <CGME20250623110528epcas1p3900a802d75f41ab81d30a527808bc094@epcas1p3.samsung.com>

In snd_usb_get_audioformat_uac3(), the length value returned from
snd_usb_ctl_msg() is used directly for memory allocation without
validation. This length is controlled by the USB device.

The allocated buffer is cast to a uac3_cluster_header_descriptor
and its fields are accessed without verifying that the buffer
is large enough. If the device returns a smaller than expected
length, this leads to an out-of-bounds read.

Add a length check to ensure the buffer is large enough for
uac3_cluster_header_descriptor.

Signed-off-by: Youngjun Lee <yjjuny.lee@samsung.com>
---
 sound/usb/stream.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index c1ea8844a46fc420ee703b8640580cef851ef4b7..aa91d63749f2ca34e906d1e1366ca9f095ac01ae 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -987,6 +987,8 @@ snd_usb_get_audioformat_uac3(struct snd_usb_audio *chip,
 	 * and request Cluster Descriptor
 	 */
 	wLength = le16_to_cpu(hc_header.wLength);
+	if (wLength < sizeof(cluster))
+		return NULL;
 	cluster = kzalloc(wLength, GFP_KERNEL);
 	if (!cluster)
 		return ERR_PTR(-ENOMEM);

---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250623-uac3-oob-fix-78e8d3eb85a7

Best regards,
-- 
Youngjun Lee <yjjuny.lee@samsung.com>

