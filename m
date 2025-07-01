Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CC2273818
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371156; cv=none; b=WMGEJnueu3mbC6ibLBLAaXFUhu9QnhFYOzIF+RsQH5YyqB9gUNhPG57+6L3loCfSUH1IBZLw8oiG+mKlRxC61UUVYFEotl6k1CyqdmVaraeTf5Iq0kJMDsgao3X+h7v+3W4xyDEurNpUaM4FsRq7NDtP90pJQaJtu2+QhUV/Y/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371156; c=relaxed/simple;
	bh=HfTVNI7rdK6Io5T9ZQlrNOYvYrXJshBjnn1l46ol3vg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NqW5nlHV4vU83XJCdl8rb+LMvGjGJG138zBxMIZGusK3bgrZfyzFpMwftGLrN6fduHFnc3ZXdakIayeUu3bhv7lMAnSctas0S35Ol3BHp1l5C9G2qmxohxzzF4nvPTKW+rSlZQyRIphVkOuJZMqsdhZDoB4r3RUhVx6Fk9Nf+Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Bx1F1hgT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Bx1F1hgT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3EAEC4CEEB;
	Tue,  1 Jul 2025 11:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751371156;
	bh=HfTVNI7rdK6Io5T9ZQlrNOYvYrXJshBjnn1l46ol3vg=;
	h=From:To:Cc:Subject:Date:From;
	b=Bx1F1hgTlvjV83AMgNoV1CmBFPwpqumOFXIGYAfl1QZ4vaz/xTqLzhyGtg8jssiYL
	 xqdECaLTYhmF/hlNpzGD9Q5LJ59ufpfGUJGRXKli1yPW2pUgSmHNplPHXuJ8dAt66A
	 +SFo2VWqx7qEEGm5OJ44yWFeX0eE2Gpfuz2PlDIw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Eddie James <eajames@linux.ibm.com>,
	Ninad Palsule <ninad@linux.ibm.com>,
	linux-fsi@lists.ozlabs.org
Subject: [PATCH] fsi: make cdx_bus_type constant
Date: Tue,  1 Jul 2025 13:59:12 +0200
Message-ID: <2025070111-magma-scheme-313d@gregkh>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1448; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=HfTVNI7rdK6Io5T9ZQlrNOYvYrXJshBjnn1l46ol3vg=; b=owGbwMvMwCRo6H6F97bub03G02pJDBnJZydEcU3Y/LHrNr9f+cI3FjM7bjzTtswPZBTUFY93s 04JyXTuiGVhEGRikBVTZPmyjefo/opDil6Gtqdh5rAygQxh4OIUgIlozGdY0CW001Fg8sG2y6Xy P/meZPCknZCfwjDfYdWqM4Ymmcs7GSUqFnOe957052sTAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

Now that the driver core can properly handle constant struct bus_type,
move the fsi_bus_type variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

Cc: Eddie James <eajames@linux.ibm.com>
Cc: Ninad Palsule <ninad@linux.ibm.com>
Cc: linux-fsi@lists.ozlabs.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/fsi/fsi-core.c | 2 +-
 include/linux/fsi.h    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 50e8736039fe..ee39d1699387 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -1404,7 +1404,7 @@ void fsi_driver_unregister(struct fsi_driver *fsi_drv)
 }
 EXPORT_SYMBOL_GPL(fsi_driver_unregister);
 
-struct bus_type fsi_bus_type = {
+const struct bus_type fsi_bus_type = {
 	.name		= "fsi",
 	.match		= fsi_bus_match,
 };
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index 8c5eef808788..adea1b432f2d 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -68,7 +68,7 @@ extern int fsi_slave_read(struct fsi_slave *slave, uint32_t addr,
 extern int fsi_slave_write(struct fsi_slave *slave, uint32_t addr,
 		const void *val, size_t size);
 
-extern struct bus_type fsi_bus_type;
+extern const struct bus_type fsi_bus_type;
 extern const struct device_type fsi_cdev_type;
 
 enum fsi_dev_type {
-- 
2.50.0

