Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7374F230268
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668666; cv=none; b=ucPN5Z6v01tanQzynDxg14A9Rvx9+l2QjYVtJqFyD7B/rCt5Lm/GW4wH3iSrZUe9jeg+NKHZd94QnHCwkJqPap3peKgxlAW74xyx+zA5tS+hVs49OGWNSVFUDosZOKBnXo6xQtxCYbA4M+aM49F2Lk1emfoCwEEh0DYcExtiwdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668666; c=relaxed/simple;
	bh=xhkPViskx4aR3bvHEndACfngha3VrIpBD7rQs5QtKv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WzC1GsplJM0udIER4KODAZkIzz9eopMQ7O29g9b6hE4Rjo3tEWOfQsklxjyACmxCJA5kpo70YpmmeMGkfNqPgQuoTHd4UHZG88twZPDKC55PfenXnHDDsvDAtny/qRHKAMltOw1YX9YbbkWQmcWj5gSuqVn6nbnyCF/Gm4t7uHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VE3sMBGf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VE3sMBGf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFA12C4CEED;
	Mon, 23 Jun 2025 08:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750668666;
	bh=xhkPViskx4aR3bvHEndACfngha3VrIpBD7rQs5QtKv4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VE3sMBGf75KASic2zpj2HlCS6hDDa/UoCUKkk6Tnyq/N/5FU0f5JXKmbo7kKMDiYj
	 rf21WqfMg8BvtaH4dI4yWopGtFcEu5a8yEnuUYcL/RAqcMZ6HSYzrZd3HUPk1xwNtc
	 Ar/HGXfC9cWDGCBGVFFh7zs1ZfJTskrLBWIHEv75LKZECARKXeKPnq5A/CCuGIIzf1
	 sORepI2b8WQVhpYMtwfBKDY9MaTPnZ2d5KGrZkiU0zbLoOse2E/ZKtXrhdTmVq9iC8
	 RKo4DCAKU3BBSDlmaQ1/pT/8OtDVEhW8Z3hEo4mr/oieN+jdxj4PGJk570Dbq8zrVo
	 psfZwhfcefojA==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] mei: vsc: Use vsc_tp_remove() as shutdown handler
Date: Mon, 23 Jun 2025 10:50:46 +0200
Message-ID: <20250623085052.12347-5-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623085052.12347-1-hansg@kernel.org>
References: <20250623085052.12347-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removing the vsc_tp_reset() call from vsc_tp_shutdown() it is now
identical to vsc_tp_remove().

Use vsc_tp_remove() as shutdown handler and remove vsc_tp_shutdown().

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/misc/mei/vsc-tp.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/misc/mei/vsc-tp.c b/drivers/misc/mei/vsc-tp.c
index 4a262e2117e4..f5438a600430 100644
--- a/drivers/misc/mei/vsc-tp.c
+++ b/drivers/misc/mei/vsc-tp.c
@@ -528,6 +528,7 @@ static int vsc_tp_probe(struct spi_device *spi)
 	return ret;
 }
 
+/* Note this is also used for shutdown */
 static void vsc_tp_remove(struct spi_device *spi)
 {
 	struct vsc_tp *tp = spi_get_drvdata(spi);
@@ -539,17 +540,6 @@ static void vsc_tp_remove(struct spi_device *spi)
 	free_irq(spi->irq, tp);
 }
 
-static void vsc_tp_shutdown(struct spi_device *spi)
-{
-	struct vsc_tp *tp = spi_get_drvdata(spi);
-
-	platform_device_unregister(tp->pdev);
-
-	mutex_destroy(&tp->mutex);
-
-	free_irq(spi->irq, tp);
-}
-
 static const struct acpi_device_id vsc_tp_acpi_ids[] = {
 	{ "INTC1009" }, /* Raptor Lake */
 	{ "INTC1058" }, /* Tiger Lake */
@@ -562,7 +552,7 @@ MODULE_DEVICE_TABLE(acpi, vsc_tp_acpi_ids);
 static struct spi_driver vsc_tp_driver = {
 	.probe = vsc_tp_probe,
 	.remove = vsc_tp_remove,
-	.shutdown = vsc_tp_shutdown,
+	.shutdown = vsc_tp_remove,
 	.driver = {
 		.name = "vsc-tp",
 		.acpi_match_table = vsc_tp_acpi_ids,
-- 
2.49.0

