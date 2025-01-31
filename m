Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E431EF092
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738345390; cv=none; b=Vmu48/A2ppxwB/Cv1XCFNm06pMKvFac2VX0yWAXCOKBAuSwELIiKfL6qG8r5jXPHjFyVBj1urHWfi5bystYLT3/ei4QdbNMqNR4B/+Wyy9LYLKO6QtOqq4PRLI7cXDXLw9ihmQBhLC0GnUdsXlcRoA2xCoA6Okpd/gdffh3dn8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738345390; c=relaxed/simple;
	bh=tu4BeykCl5tgl22Fm0xr0J7ZYFLcc0Ka3FDOBXSQxNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e4FSmOigu6AOFdWWruEUuPiKgD7bEpDKsipcoCYw3vNOG3hf955CcKA08WQWBNyEA5FZ9P8sNPkQfqrsRfrZLa/8rXOb4L9BqWciscA98fx/rXU0dZ5P7NFkynw8h2qFvFXbBNBooWwPvyLpOTzUPgvDmVzOUYln8gFdBGC47PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvFp0obq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvFp0obq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06BBC4CEE6;
	Fri, 31 Jan 2025 17:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738345389;
	bh=tu4BeykCl5tgl22Fm0xr0J7ZYFLcc0Ka3FDOBXSQxNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HvFp0obqAMNUofw3fRxBy1PPA4eITQ3ToL5izb+6GRsaHpH5HxqfzPTYqeYKKP6QX
	 q27KMfCUi95NdXnoETjwLhhoqreLa4RN29Q+yCRDE63M7clVlrZ6h3O/Mf/1xPtBfy
	 ZM0so6ZXt7F/esKpeyxQFMcGPq1YfkyznwQN88JC5J7DDdyghj1DkvTLoVJX61GnYq
	 fQHWxIx3IUbzfQMqG08hjOPSCn9ipSaF/1Pt6l4w0mUuNVo39NL/GZ7Pq9htloF7uO
	 1KFA0W/tmXusnsDJ7ro5lGw4j6p3WkorTKgIy9g1WikYCrn25kPZP8SxjHYmxpMONe
	 ooxUAdm14B/kw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tdv2p-00000006gh2-0eyb;
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
Subject: [PATCH v3 06/14] acpi/ghes: only set hw_error_le or hest_addr_le
Date: Fri, 31 Jan 2025 18:42:47 +0100
Message-ID: <7fbe05cb97c50addb61920c68e1aa5027a64610c.1738345063.git.mchehab+huawei@kernel.org>
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

The hw_error_le pointer is used for legacy support (virt-9.2).
Starting from virt-10.0, HEST table is accessed via hest_addr_le.

Remove fw_cfg logic for legacy support if virt is 10.0 or upper.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index a91dcd777433..ba8b1a3a13dc 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -232,8 +232,8 @@ ghes_gen_err_data_uncorrectable_recoverable(GArray *block,
  * Initialize "etc/hardware_errors" and "etc/hardware_errors_addr" fw_cfg blobs.
  * See docs/specs/acpi_hest_ghes.rst for blobs format.
  */
-static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
-                                   int num_sources)
+static void build_ghes_error_table(AcpiGhesState *ags, GArray *hardware_errors,
+                                   BIOSLinker *linker, int num_sources)
 {
     int i, error_status_block_offset;
 
@@ -278,13 +278,15 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
                                        i * ACPI_GHES_MAX_RAW_DATA_LENGTH);
     }
 
-    /*
-     * tell firmware to write hardware_errors GPA into
-     * hardware_errors_addr fw_cfg, once the former has been initialized.
-     */
-    bios_linker_loader_write_pointer(linker, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, 0,
-                                     sizeof(uint64_t),
-                                     ACPI_HW_ERROR_FW_CFG_FILE, 0);
+    if (!ags->use_hest_addr) {
+        /*
+         * Tell firmware to write hardware_errors GPA into
+         * hardware_errors_addr fw_cfg, once the former has been initialized.
+         */
+        bios_linker_loader_write_pointer(linker, ACPI_HW_ERROR_ADDR_FW_CFG_FILE,
+                                         0, sizeof(uint64_t),
+                                         ACPI_HW_ERROR_FW_CFG_FILE, 0);
+    }
 }
 
 /* Build Generic Hardware Error Source version 2 (GHESv2) */
@@ -373,7 +375,7 @@ void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
 
     hest_offset = table_data->len;
 
-    build_ghes_error_table(hardware_errors, linker, num_sources);
+    build_ghes_error_table(ags, hardware_errors, linker, num_sources);
 
     acpi_table_begin(&table, table_data);
 
@@ -404,13 +406,13 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     fw_cfg_add_file(s, ACPI_HW_ERROR_FW_CFG_FILE, hardware_error->data,
                     hardware_error->len);
 
-    /* Create a read-write fw_cfg file for Address */
-    fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
-        NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
-
     if (ags->use_hest_addr) {
         fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
             NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
+    } else {
+        /* Create a read-write fw_cfg file for Address */
+        fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
+            NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
     }
 
     ags->present = true;
-- 
2.48.1

