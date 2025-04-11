Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0344E238C23;
	Fri, 11 Apr 2025 11:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370459; cv=none; b=Zeui0j+sgnrgGXeLzp3k233YVc4dxEYAnWbkXSy6bVDUEtyhirw/SqNshmcf7gx6JdY7Vofua4DqvZWhPdXkT3PjmdjNpjYzaffzZTG3ZlA6ru2rJw0kW0VgyE/g1TSkzJVwDXBi9pXBw6399vIFkyndJXtHnFUqZ6uD3K+Eq7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370459; c=relaxed/simple;
	bh=vaESse4EBr2rkIVWnoJKA86Ws56vzNLB/aNS6YY2bnc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fCEnCaYAouaU0D/02+/HNWtqxecKsxr6ZyU/MM+bVvwFgnxBV7TLy5oIb4dlyDk1SahHGF25HuWRUoaP/+FCcRiJCLGRpi+YGNkARvVP+BdMG63r1astmQU6j0/HHGYrp5fyoHwpD1Mjtt4oGGRMhb/ufG0COBnU/6Fa07xcHN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28417106F;
	Fri, 11 Apr 2025 04:20:56 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6587C3F694;
	Fri, 11 Apr 2025 04:20:55 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: (xgene-hwmon) Simplify PCC shared memory region handling
Date: Fri, 11 Apr 2025 12:20:53 +0100
Message-Id: <20250411112053.1148624-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCC driver now handles mapping and unmapping of shared memory
areas as part of pcc_mbox_{request,free}_channel(). Without these before,
this xgene hwmon driver did handling of those mappings like several
other PCC mailbox client drivers.

There were redundant operations, leading to unnecessary code. Maintaining
the consistency across these driver was harder due to scattered handling
of shmem.

Just use the mapped shmem and remove all redundant operations from this
driver.

Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/hwmon/xgene-hwmon.c | 39 ++++---------------------------------
 1 file changed, 4 insertions(+), 35 deletions(-)

Hi,

This is just resend of the same patch that was part of a series [1].
Only core PCC mailbox changes were merged during v6.15 merge window.
So dropping all the maintainer acks and reposting it so that it can
be picked up for v6.16 via maintainers tree.

Regards,
Sudeep

[1] https://lore.kernel.org/all/20250313-pcc_fixes_updates-v3-11-019a4aa74d0f@arm.com/

diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
index 2cdbd5f107a2..11c5d80428cd 100644
--- a/drivers/hwmon/xgene-hwmon.c
+++ b/drivers/hwmon/xgene-hwmon.c
@@ -103,8 +103,6 @@ struct xgene_hwmon_dev {
 	struct device		*hwmon_dev;
 	bool			temp_critical_alarm;
 
-	phys_addr_t		comm_base_addr;
-	void			*pcc_comm_addr;
 	unsigned int		usecs_lat;
 };
 
@@ -125,7 +123,8 @@ static u16 xgene_word_tst_and_clr(u16 *addr, u16 mask)
 
 static int xgene_hwmon_pcc_rd(struct xgene_hwmon_dev *ctx, u32 *msg)
 {
-	struct acpi_pcct_shared_memory *generic_comm_base = ctx->pcc_comm_addr;
+	struct acpi_pcct_shared_memory __iomem *generic_comm_base =
+							ctx->pcc_chan->shmem;
 	u32 *ptr = (void *)(generic_comm_base + 1);
 	int rc, i;
 	u16 val;
@@ -523,7 +522,8 @@ static void xgene_hwmon_rx_cb(struct mbox_client *cl, void *msg)
 static void xgene_hwmon_pcc_rx_cb(struct mbox_client *cl, void *msg)
 {
 	struct xgene_hwmon_dev *ctx = to_xgene_hwmon_dev(cl);
-	struct acpi_pcct_shared_memory *generic_comm_base = ctx->pcc_comm_addr;
+	struct acpi_pcct_shared_memory __iomem *generic_comm_base =
+							ctx->pcc_chan->shmem;
 	struct slimpro_resp_msg amsg;
 
 	/*
@@ -649,7 +649,6 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
 	} else {
 		struct pcc_mbox_chan *pcc_chan;
 		const struct acpi_device_id *acpi_id;
-		int version;
 
 		acpi_id = acpi_match_device(pdev->dev.driver->acpi_match_table,
 					    &pdev->dev);
@@ -658,8 +657,6 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
 			goto out_mbox_free;
 		}
 
-		version = (int)acpi_id->driver_data;
-
 		if (device_property_read_u32(&pdev->dev, "pcc-channel",
 					     &ctx->mbox_idx)) {
 			dev_err(&pdev->dev, "no pcc-channel property\n");
@@ -685,34 +682,6 @@ static int xgene_hwmon_probe(struct platform_device *pdev)
 			goto out;
 		}
 
-		/*
-		 * This is the shared communication region
-		 * for the OS and Platform to communicate over.
-		 */
-		ctx->comm_base_addr = pcc_chan->shmem_base_addr;
-		if (ctx->comm_base_addr) {
-			if (version == XGENE_HWMON_V2)
-				ctx->pcc_comm_addr = (void __force *)devm_ioremap(&pdev->dev,
-								  ctx->comm_base_addr,
-								  pcc_chan->shmem_size);
-			else
-				ctx->pcc_comm_addr = devm_memremap(&pdev->dev,
-								   ctx->comm_base_addr,
-								   pcc_chan->shmem_size,
-								   MEMREMAP_WB);
-		} else {
-			dev_err(&pdev->dev, "Failed to get PCC comm region\n");
-			rc = -ENODEV;
-			goto out;
-		}
-
-		if (IS_ERR_OR_NULL(ctx->pcc_comm_addr)) {
-			dev_err(&pdev->dev,
-				"Failed to ioremap PCC comm region\n");
-			rc = -ENOMEM;
-			goto out;
-		}
-
 		/*
 		 * pcc_chan->latency is just a Nominal value. In reality
 		 * the remote processor could be much slower to reply.
-- 
2.34.1

