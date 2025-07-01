Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B9C7A13A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371624; cv=none; b=JtgDC4kk5HTReOjkxmMO/t1z4yhKvQyvG9aQUN7jqKGKgRGVhNIjO12JAxupgxue7HpzQUWgF3wvHzi8dwrxtSVk0udMwsj8jnYFyeTTx2ozqEtTrRelzKhKvbpgc1ZpSxKCgAVqU4cxX2w3bUu90qsEW2vZI6dOSRJuteHUYC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371624; c=relaxed/simple;
	bh=ICNYBUg1q5VfjCk6Ft1uwiaUAxE63kanKo0ZyWYry7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Plo2Jc7WGLSGTiaJWv4mOHqoFFDVlCQgztHPninKsivK6FDQSM9M7q0Xx0LMr1vsmEi/051bYpKnHNPK9m9sjB3qrGgt4y2dSYjO7gJkxWNaWdM6MJXpBKyozmVH6GgXAUoTAbMXr6qy0FN00ABRSVcuynH9MdSDtUXaTurCuAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DpsiB4lw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DpsiB4lw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC111C4CEEB;
	Tue,  1 Jul 2025 12:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751371624;
	bh=ICNYBUg1q5VfjCk6Ft1uwiaUAxE63kanKo0ZyWYry7E=;
	h=From:To:Cc:Subject:Date:From;
	b=DpsiB4lw6haiZyQYHb9DdLtdcWrbnBTwtaGhznGUdH6/V1g4tumzbSEdZ16JJcqrc
	 3czGG08q2jylMclwOM4MYeBdHQPTmTZKggHbxOBxFht9n7Or8FTF0ORG5qf0UNx1er
	 IKrSqDPZcFZjuIlPoN8x+q1O0vnqRI+0o5Ag1ogQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Eddie James <eajames@linux.ibm.com>,
	Ninad Palsule <ninad@linux.ibm.com>,
	linux-fsi@lists.ozlabs.org
Subject: [PATCH v2] fsi: make fsi_bus_type constant
Date: Tue,  1 Jul 2025 14:07:01 +0200
Message-ID: <2025070100-overblown-busily-a04b@gregkh>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1489; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=ICNYBUg1q5VfjCk6Ft1uwiaUAxE63kanKo0ZyWYry7E=; b=owGbwMvMwCRo6H6F97bub03G02pJDBnJ51OktdeYXOGJkhaJf6ly69u1WcFe6Svl509udr3RW nQoWPJuRywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAEykuYBhriDvXavgh9tdZpTm /XR2iJRpbZnhy7Bg4rms2qzX6/rdb++xE3oo3GAk2B4IAA==
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
v2: fix up subject line to be correct

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

