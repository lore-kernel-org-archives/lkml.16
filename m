Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAB929614B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559277; cv=none; b=QXjAOxIOFS8THlVSAOyIgQ4UC5pe66L4Q2JVUISiLa9r5PMQl7CXa1v6unq1e/WurN626lJ/GPEU0tWt6xliqyYge2HysugjI5nI5c8+rUzZxzwkQsxiP4AB74M00E8X9JXzhVnuEu6Z6smqywwH2myY0aTMOw7dCyNfuFelHZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559277; c=relaxed/simple;
	bh=PYVfr4MzdRcAc8GZZqfTO+4NnznKF5DM0Ha6GQ9ktrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=sg4aGEKNQfw+CyB/HRtL39osu0fLhUyxUkW5iXZbH6Gcvm1pzoDKlOI4oMai2Mbl7u1lXqqWi3nFLE41ju4jWYxxwQrlNeNVKdNuuWxNmMF1yz2OKPNKqtd7APCipW8IFbsb6p4vWrHiTZTogC7vuWp/2iO2BqH/znX9Cks6RzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=fs6738ML; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="fs6738ML"
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250610124113epoutp0451536c51a5d5b46fbee0218e3590caf6~HruOxtb1E1278512785epoutp04a
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:41:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250610124113epoutp0451536c51a5d5b46fbee0218e3590caf6~HruOxtb1E1278512785epoutp04a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749559273;
	bh=XzsliogzO86/Q79QWe6n/Aszt7NA4JFz1tCGiPbDBOk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=fs6738ML+jnhn2LfL3TKt5YcgEUHNnaJwEcrbUl0+GdfrW2UHMpT72UQ1txXCKbfQ
	 DBA1OGL+LjkdyLw28Csh3zZRpv6IV1iZTH1zLw4h0fzh3HZuhpxd3D8RyxYwyksvDI
	 YCPyB4ctTdmwJapEHq6qg0ccv9UhjT7uBFF8XhDE=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTPS id
	20250610124112epcas1p4422da5fdf6b42ce37823fb943165b9e0~HruOanzKQ1127311273epcas1p4j;
	Tue, 10 Jun 2025 12:41:12 +0000 (GMT)
Received: from epcas1p1.samsung.com (unknown [182.195.36.225]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bGpLc3MWyz6B9m5; Tue, 10 Jun
	2025 12:41:12 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250610124111epcas1p18fe9fd8ab47a424c2143d4e2912a8179~HruNnfD5e1086510865epcas1p1j;
	Tue, 10 Jun 2025 12:41:11 +0000 (GMT)
Received: from yjjuny-lee03.tn.corp.samsungelectronics.net (unknown
	[10.252.68.99]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250610124111epsmtip2034aa8240d6ff98f4180a63af5a47327~HruNisgcU1062110621epsmtip23;
	Tue, 10 Jun 2025 12:41:11 +0000 (GMT)
From: Youngjun Lee <yjjuny.lee@samsung.com>
To: ribalda@chromium.org
Cc: laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Youngjun Lee <yjjuny.lee@samsung.com>
Subject: [PATCH] usb: uvc: Fix 1-byte out-of-bounds read in
 uvc_parse_format()
Date: Tue, 10 Jun 2025 21:41:07 +0900
Message-ID: <20250610124107.37360-1-yjjuny.lee@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250610124111epcas1p18fe9fd8ab47a424c2143d4e2912a8179
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250610124111epcas1p18fe9fd8ab47a424c2143d4e2912a8179
References: <CGME20250610124111epcas1p18fe9fd8ab47a424c2143d4e2912a8179@epcas1p1.samsung.com>

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

