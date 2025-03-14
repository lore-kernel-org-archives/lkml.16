Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 53CDC8635C;
	Fri, 14 Mar 2025 08:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741939391; cv=none; b=J/SOjP7JuMG5eekVG5597zDaARia8VgIS+aZ3EkJbMrYxYzaFGfMSCXH0oe/9vYBoub7UNRVXENPbyUWnf6OQNHUE3y08nacu46YxsEf+Zmo5Adh23UR4YwxfkYOFd6Zx/9gyi1/nwAMcnv5htPC56fg1Gtm1/WdPTeMjXqvLJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741939391; c=relaxed/simple;
	bh=F2UoxoW8uLGVziszo09aBcV1hxI0sreut0MB/8QvQSk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version; b=YCRx8PkdxXIEfKuFzqsfqx8XFCS7fsIWHSsIgFuhynToY+zqXM0E7EkYYWSbXKC1s9ci7FQMLiRZZy1vGzSuc4kdmS0LFG+6s4uRzLl2LsPhurK6QRH7OcUSt3FiEhplf2iYRssKSfNmlopGNQh1c3i1xN3v4VlWsmCGE3fgmwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from liqiong-suma.shanghai.nfschina.local (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id E7625606A5D5D;
	Fri, 14 Mar 2025 16:03:04 +0800 (CST)
X-MD-Sfrom: liqiong@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Li Qiong <liqiong@nfschina.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>
Cc: Li Qiong <liqiong@nfschina.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] usb: cdns3: Remove the invalid comment
Date: Fri, 14 Mar 2025 16:02:48 +0800
Message-Id: <20250314080249.469307-1-liqiong@nfschina.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250314070921.355986-1-liqiong@nfschina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function don't return value, remove the invalid comment.

Signed-off-by: Li Qiong <liqiong@nfschina.com>
---
 drivers/usb/cdns3/cdns3-plat.c | 2 --
 1 file changed, 2 deletions(-)

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
-- 
2.30.2

