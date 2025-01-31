Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D331EC011
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738345390; cv=none; b=B717S5MMlxWXdb0JuA12cjCQHJM2ciMPcGEW6EVaQVg7MSw0BZL0SIvlFImUoGb8XfG2PMyKZ/CkX5J7iufGCYqRv9AoxbWVW7XpPCBdRoYrpimuIZUAH6kbl4DpIyfEf0xIGNc66fNuygyUaDmn02g0CwUnty47kVF+wE21zX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738345390; c=relaxed/simple;
	bh=KouCoSf4mWghkLKK/X/OLNqtXx7bPryJTJFiRxmO5ak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SUkThcl3SGYKgm7fldr4OW+B4HMYhATscnSpFwjFv2K8XU6rGMGNmsB5dK6F0APR0AVgaGqsDNQysJWH30YfTPTAezYT+cIBLJZ8gzopyp9pFybWtDKU6BZiT/JJszgk7WELykJFwbhCGLgqBQhKgrYiklIGQUmDjj/FrBzlByw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWJTo5Kw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWJTo5Kw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CDC1C4CEDF;
	Fri, 31 Jan 2025 17:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738345389;
	bh=KouCoSf4mWghkLKK/X/OLNqtXx7bPryJTJFiRxmO5ak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aWJTo5KwJAE32CQmmI0AJNKYYBZ2K/rQAezzsrgF3VfUY/hxpbmcvys3T+LhaHtuk
	 Cd6rB4iAqIx16ps1U2k66YeDd444tUdPfyBCZJTzoQqhotCTxqhQTeArwEfvNpqfUB
	 szzwHpcIIkmxOkU3FdO8NlpIVV+VJ2AM3khH0XzsbPZ/mWyB9y85N1rUNG9Ns3kzj1
	 N232tx8cu8LdZu3wAwcIN4s/CoWs+dNsFYgyie9u/iLHM4ylrO2ZzRgSTYHyZgAOVV
	 Z1qnSkreFKRc9xLDxM2EFl4s6ooHGS6Rm39njFtWnHvMlXsHWJpOL68W0XmWP7/qbW
	 NXgaclXcmVDJA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tdv2p-00000006ggm-0Bae;
	Fri, 31 Jan 2025 18:43:07 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/14] acpi/ghes: add a firmware file with HEST address
Date: Fri, 31 Jan 2025 18:42:43 +0100
Message-ID: <5082df62da57450674413f13c20e937330676a0a.1738345063.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738345063.git.mchehab+huawei@kernel.org>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Store HEST table address at GPA, placing its the start of the table at
hest_addr_le variable.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c         | 16 ++++++++++++++++
 include/hw/acpi/ghes.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 4cabb177ad47..27478f2d5674 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -30,6 +30,7 @@
 
 #define ACPI_HW_ERROR_FW_CFG_FILE           "etc/hardware_errors"
 #define ACPI_HW_ERROR_ADDR_FW_CFG_FILE      "etc/hardware_errors_addr"
+#define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
 
 /* The max size in bytes for one error block */
 #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
@@ -349,8 +350,11 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
 {
     AcpiTable table = { .sig = "HEST", .rev = 1,
                         .oem_id = oem_id, .oem_table_id = oem_table_id };
+    uint32_t hest_offset;
     int i;
 
+    hest_offset = table_data->len;
+
     build_ghes_error_table(hardware_errors, linker, num_sources);
 
     acpi_table_begin(&table, table_data);
@@ -362,6 +366,15 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
     }
 
     acpi_table_end(linker, &table);
+
+    /*
+     * Tell firmware to write into GPA the address of HEST via fw_cfg,
+     * once initialized.
+     */
+    bios_linker_loader_write_pointer(linker,
+                                     ACPI_HEST_ADDR_FW_CFG_FILE, 0,
+                                     sizeof(uint64_t),
+                                     ACPI_BUILD_TABLE_FILE, hest_offset);
 }
 
 void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
@@ -375,6 +388,9 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
         NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
 
+    fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
+        NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
+
     ags->present = true;
 }
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 9f0120d0d596..237721fec0a2 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -58,6 +58,7 @@ enum AcpiGhesNotifyType {
 };
 
 typedef struct AcpiGhesState {
+    uint64_t hest_addr_le;
     uint64_t hw_error_le;
     bool present; /* True if GHES is present at all on this board */
 } AcpiGhesState;
-- 
2.48.1

