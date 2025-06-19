Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE302220F3A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334905; cv=none; b=q07O5whDHbZy1s+RSe4zCxkDQD0oQygsaMV/DKiGmHRkH/rjbJjbDqLZ74azVJO6oUzIM442FyvJ5DKB3QWyiLVG4eZPALkbNezU2zrxofL/o8WMCl7OWHTkSIJnWTGLnCrLJpLTOorLoVHFO4PzQcjENybTX60Qa9t74prtjwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334905; c=relaxed/simple;
	bh=5F3P1kfhpvJxNCeVfDn/5ybrVPWmzKVNAGZPkMTYSKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qD6DEMLhjCL4hKrSuO77WwOCIcCb2iQ54wFDM4DjT7eXzfcVWs7yOdemyRzD85AaDDiXdKf9IN1y/9tmDT30OtT0S6chQPhkXULjdk2g3Jkco1rn+F4LC6Gdt59sBgjHBbMwHdlt/9M6S6+x8hazaRowXebm0zGpQyc8NeJXgy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=g/fHegYA; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="g/fHegYA"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45363645a8eso226465e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1750334900; x=1750939700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NAxRLAejUsHjypjjnrTVOYXan4TT7QUHhYtr7a8fqYw=;
        b=g/fHegYANu8ZmZfs9zUiLJ8MhhxwB3zy+b5JTCXoGo/G0eWNEgFnpqCWiUn0IAaSNH
         6f9e8o2HbZGvGD7AWoTBSOZsfyr6FY2IXm35aGqVFfWubtpzilOI1d0DfduSNoPVAtCQ
         FdoCTCCjAdpCyT5U5JmsG1pm7RrL9TbjOgPjGwYNFuOcRgTkRga+sFh18cSz7eQVE1sq
         2ab1j7qP2zhj4VRESEQ74NNPJssy2lUdGjKnVbBqo0ezd9y0tFA85z7djPJCBL8jIRuG
         ODqTj4px5ioz1Kxm4F8cZTLcbjP3EC9DQb3zt1mh25i3f5SWO/rPsvz3Wgqyfra5RZO5
         DXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750334900; x=1750939700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NAxRLAejUsHjypjjnrTVOYXan4TT7QUHhYtr7a8fqYw=;
        b=LSPMS/Zrljbnw3kOaJOdDvg+BrII/bVlbi9Ha8O1h2/ENiiYh5DLbJ9xYLbR9B19xM
         nb81G3ZXuGqrJe+j89k2lZ0cQUpIyVBz12RLf0c57wzJWDHfsvdoAK7FV99x6EUY8tIY
         LncNtKRxh8KwEbTy/MVVR7Wfq+L9npnlJ+JaNTRXY1RbxzM6I0t2rp6IKQX/hRdQxjkG
         qi99jYxLjsN5RvU8PPaGi33qcGXGm07bJBbVGGJh7Jey7xgx7FmblAax8/2MZ0Wxs8z1
         0rd8Mm+E83oYaIbfY7GKZ2vHGdFyMBJwpn700ZSZm28lEnP+WnjtvkyVj8bRxzHxxAUC
         FxmA==
X-Forwarded-Encrypted: i=1; AJvYcCWcesfIMSPKf4ZBc4iXOmu6iZO/Brz8G8w2zTNzgvfpRsqeRpO6T76Yhq7TXQIq1Bx5SRUt2buexwyBh4A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv3siRiQIgqX45DYKHde3wAI8jmYHddPNoMkSG264LzJUhAr10
	tOnAscaB07BsZSpgvHSfeBifYj7PlpuUlCyY/q5STFUsP0GZBQVqEqdfYYgUPG09WMo=
X-Gm-Gg: ASbGncuO9fsXMWZTjpEis9QHKYpqXXuE/UjDidL7f+O4NDZ0IDfyfBRZX828uzr0RX4
	ZwzHXCh67lP9J4tHNL0Rvxg+OBuvjtHwo1ztdEJDZ0xKRhX5+MtIOJZ0TBH+unAi1O2b5h1D+up
	ga0pN1xwjiSKg3TxW2gj04FZXwNr+TgZrcXPpVJulcDjCm6vL+KebieyZZcsRjk5HD0TpYwUHZS
	0ZoXGxVdKli+DC+VUk6ZX2KegHLcL5oRijGQUzhy2pZRySynuZ5/kgwswTU/NnFfcv7xrupjrvG
	f5hjb/aqEtgfBXcpjX2qTwR9X96d4SE45zOjaad7lv7ZpHS1rhnIF3RGUfbL+tLjb+qb7thhB0L
	ujR7Oc/l++/uQ
X-Google-Smtp-Source: AGHT+IGHvY1nrgiqXrIeN83GM536uQ7g5PaEHQSZe6jlMyRnlGAW4XCRb7LuhCIszof1RGsKeAWgUA==
X-Received: by 2002:a05:600c:4f53:b0:453:5d8d:d1b8 with SMTP id 5b1f17b1804b1-4535d8ddc69mr47412025e9.30.1750334899741;
        Thu, 19 Jun 2025 05:08:19 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:546c:6067:d6b:b4e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a734b5sm19738748f8f.33.2025.06.19.05.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:08:19 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH] usb: ehci: replace scnprintf() with sysfs_emit()
Date: Thu, 19 Jun 2025 14:07:11 +0200
Message-ID: <20250619120711.552662-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per Documentation/filesystems/sysfs.rst, show() methods should only
use sysfs_emit() or sysfs_emit_at() when formatting values to be
returned to userspace.

Convert the uses of scnprintf() in sysfs show() methods to
sysfs_emit() and sysfs_emit_at() for better safety and consistency.

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 drivers/usb/host/ehci-sysfs.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/host/ehci-sysfs.c b/drivers/usb/host/ehci-sysfs.c
index 8f75cb7b197c..3786e81b0ed9 100644
--- a/drivers/usb/host/ehci-sysfs.c
+++ b/drivers/usb/host/ehci-sysfs.c
@@ -12,21 +12,18 @@ static ssize_t companion_show(struct device *dev,
 			      char *buf)
 {
 	struct ehci_hcd		*ehci;
-	int			nports, index, n;
-	int			count = PAGE_SIZE;
-	char			*ptr = buf;
+	int			nports, index;
+	int			len = 0;
 
 	ehci = hcd_to_ehci(dev_get_drvdata(dev));
 	nports = HCS_N_PORTS(ehci->hcs_params);
 
 	for (index = 0; index < nports; ++index) {
 		if (test_bit(index, &ehci->companion_ports)) {
-			n = scnprintf(ptr, count, "%d\n", index + 1);
-			ptr += n;
-			count -= n;
+			len += sysfs_emit_at(buf, len, "%d\n", index + 1);
 		}
 	}
-	return ptr - buf;
+	return len;
 }
 
 /*
@@ -70,11 +67,9 @@ static ssize_t uframe_periodic_max_show(struct device *dev,
 					char *buf)
 {
 	struct ehci_hcd		*ehci;
-	int			n;
 
 	ehci = hcd_to_ehci(dev_get_drvdata(dev));
-	n = scnprintf(buf, PAGE_SIZE, "%d\n", ehci->uframe_periodic_max);
-	return n;
+	return sysfs_emit(buf, "%d\n", ehci->uframe_periodic_max);
 }
 
 
-- 
2.43.0

