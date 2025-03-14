Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id B1CB21DE4D3;
	Fri, 14 Mar 2025 10:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741947412; cv=none; b=lq4cZEXDnlFT7XHapn8+miO6tzgXewJlmekyLN3lTLVjQ0rgkKpN6pT/qV9luOIZHDi2xFnEJzhYPx9i/kXD3U4n6gZcXbxqsvU8KvLDFRebp5A2ex3xBVGhpEr8ziQEkXmKaahFw+Fc4AT1JLQUhGyg7i3E/DViqoYD8/5XAIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741947412; c=relaxed/simple;
	bh=qu9+01MrubQ8jJ4PaiAEj8ZJmo2Troqlc/dltCG/xdA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version; b=qTr/T79AFwU0K/DE3kQR/CGk9SRIhnyQg2zCJlLJQEGaEAAZDpi6TRUasTOWH1wUUEzHg7MBdCdQIBMUGbjKqfzeyDigO6wQ5JkJubANw27xT4Mpq0YHaMVqyakyNncKV9iU2HxGMDS1eFLzukVUq8BLhD8nweEPsgy8Njz3pDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from liqiong-suma.shanghai.nfschina.local (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 0287C606FFD3E;
	Fri, 14 Mar 2025 18:16:44 +0800 (CST)
X-MD-Sfrom: liqiong@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Li Qiong <liqiong@nfschina.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>
Cc: Li Qiong <liqiong@nfschina.com>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] usb: gadget: udc-xilinx: Remove the invalid comment
Date: Fri, 14 Mar 2025 18:16:39 +0800
Message-Id: <20250314101639.424013-2-liqiong@nfschina.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250314101639.424013-1-liqiong@nfschina.com>
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
v2: Split the first patch to two patches.
v3: Add changes from the previous version.

 drivers/usb/gadget/udc/udc-xilinx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index ae2aeb271897..fa94cc065274 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -2178,8 +2178,6 @@ static int xudc_probe(struct platform_device *pdev)
 /**
  * xudc_remove - Releases the resources allocated during the initialization.
  * @pdev: pointer to the platform device structure.
- *
- * Return: 0 always
  */
 static void xudc_remove(struct platform_device *pdev)
 {
-- 
2.30.2

