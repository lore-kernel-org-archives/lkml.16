Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5281F1316
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738345390; cv=none; b=OdIyesuo5fJugAaHG9pqH6+FOcc2rPltH2xYU/FRuNRCyLUK65frWc7l2aB5mik7y1USfuKaqmjA/0jzSTkAYLlxSQ9N7mGjsN2hgAmdef4tFVplqhRELd//tXqTZ99gIMyLfIPKLArKCKCF0qg0C1JzaorziDOSIr3/kLHV184=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738345390; c=relaxed/simple;
	bh=ynH8ansBrhLKxawN2oQ7B/QkR6iKd6ExjA8Azv9arTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SK8o+a/HNpmwSmYpECk/jnd2/Tsuhe3/2oQ+Y7gTEpiigaEitdZ+NWXUbZXE3o/lcbvTxp7nmxxNYaKZ+sqj7BGR80Rxh9lEwFyzkof/lX7XvRhTh215OvtMZSI92H7kvsLQfivIuugWcSPiNJgnH0jMxizcrS0rIIrBEt227Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WfdD9Cqe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WfdD9Cqe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45A2C4AF0D;
	Fri, 31 Jan 2025 17:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738345389;
	bh=ynH8ansBrhLKxawN2oQ7B/QkR6iKd6ExjA8Azv9arTs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WfdD9CqeBnsnKy0bbzJxJyI83VRAHzImt7XMiWIHnAgdV/8GtCCMd27drHSX+hsJp
	 kiV0DBhOvbqkcFp08KwUR4D975hF5HRU2heSAZlw84V2rD8QcW8u/WKTNq5dcp5dkI
	 Gef/hxFBOPvBPxjo98fCIEMsCkPwZ6XMgVQLp0HByxqj4Aamqv47czcCZbNedgJkKM
	 fRfxXJmZRLRD/iPAUs1OY1b+MPbZUzwvOsAAHCdLLl+GUG5q+DwY05I1E479s55U3t
	 Ew9B443ktcqEYxo2R05vm+o847WjHHmA34WFEibxGwFeuikjEoWp89iSFYIY71Urd6
	 XHzjhuZ6XgNng==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tdv2p-00000006ggy-0Xz9;
	Fri, 31 Jan 2025 18:43:07 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/14] acpi/generic_event_device: add logic to detect if HEST addr is available
Date: Fri, 31 Jan 2025 18:42:46 +0100
Message-ID: <0fb474d83bcb4464cf8b23822044688bdc3fd945.1738345063.git.mchehab+huawei@kernel.org>
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

Create a new property (x-has-hest-addr) and use it to detect if
the GHES table offsets can be calculated from the HEST address
(qemu 10.0 and upper) or via the legacy way via an offset obtained
from the hardware_errors firmware file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/generic_event_device.c |  1 +
 hw/acpi/ghes.c                 | 17 ++++++-----------
 hw/arm/virt-acpi-build.c       | 32 ++++++++++++++++++++++++++++----
 hw/core/machine.c              |  2 ++
 include/hw/acpi/ghes.h         |  3 ++-
 5 files changed, 39 insertions(+), 16 deletions(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 5346cae573b7..14d8513a5440 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -318,6 +318,7 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 
 static const Property acpi_ged_properties[] = {
     DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
+    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState, ghes_state.use_hest_addr, false),
 };
 
 static const VMStateDescription vmstate_memhp_state = {
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 8f284fd191a6..a91dcd777433 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -359,7 +359,8 @@ static void build_ghes_v2_entry(GArray *table_data,
 }
 
 /* Build Hardware Error Source Table */
-void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
+void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
+                     GArray *hardware_errors,
                      BIOSLinker *linker,
                      const AcpiNotificationSourceId *notif_source,
                      int num_sources,
@@ -369,14 +370,6 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
                         .oem_id = oem_id, .oem_table_id = oem_table_id };
     uint32_t hest_offset;
     int i;
-    AcpiGedState *acpi_ged_state;
-    AcpiGhesState *ags = NULL;
-
-    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
-                                                       NULL));
-    if (acpi_ged_state) {
-        ags = &acpi_ged_state->ghes_state;
-    }
 
     hest_offset = table_data->len;
 
@@ -415,8 +408,10 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
         NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
 
-    fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
-        NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
+    if (ags->use_hest_addr) {
+        fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
+            NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
+    }
 
     ags->present = true;
 }
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3d411787fc37..9de51105a513 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -897,6 +897,10 @@ static const AcpiNotificationSourceId hest_ghes_notify[] = {
     { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
 };
 
+static const AcpiNotificationSourceId hest_ghes_notify_9_2[] = {
+    { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
+};
+
 static
 void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 {
@@ -950,10 +954,30 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     build_dbg2(tables_blob, tables->linker, vms);
 
     if (vms->ras) {
-        acpi_add_table(table_offsets, tables_blob);
-        acpi_build_hest(tables_blob, tables->hardware_errors, tables->linker,
-                        hest_ghes_notify, ARRAY_SIZE(hest_ghes_notify),
-                        vms->oem_id, vms->oem_table_id);
+        static const AcpiNotificationSourceId *notify;
+        AcpiGedState *acpi_ged_state;
+        unsigned int notify_sz;
+        AcpiGhesState *ags;
+
+        acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
+                                                       NULL));
+        if (acpi_ged_state) {
+            ags = &acpi_ged_state->ghes_state;
+
+            acpi_add_table(table_offsets, tables_blob);
+
+            if (!ags->use_hest_addr) {
+                notify = hest_ghes_notify_9_2;
+                notify_sz = ARRAY_SIZE(hest_ghes_notify_9_2);
+            } else {
+                notify = hest_ghes_notify;
+                notify_sz = ARRAY_SIZE(hest_ghes_notify);
+            }
+
+            acpi_build_hest(ags, tables_blob, tables->hardware_errors,
+                            tables->linker, notify, notify_sz,
+                            vms->oem_id, vms->oem_table_id);
+        }
     }
 
     if (ms->numa_state->num_nodes > 0) {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index c23b39949649..0d0cde481954 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -34,10 +34,12 @@
 #include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-net.h"
 #include "hw/virtio/virtio-iommu.h"
+#include "hw/acpi/generic_event_device.h"
 #include "audio/audio.h"
 
 GlobalProperty hw_compat_9_2[] = {
     {"arm-cpu", "backcompat-pauth-default-use-qarma5", "true"},
+    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
 };
 const size_t hw_compat_9_2_len = G_N_ELEMENTS(hw_compat_9_2);
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 6c2e57af0456..bfc8fd851648 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -76,7 +76,8 @@ typedef struct AcpiNotificationSourceId {
     enum AcpiGhesNotifyType notify;
 } AcpiNotificationSourceId;
 
-void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
+void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
+                     GArray *hardware_errors,
                      BIOSLinker *linker,
                      const AcpiNotificationSourceId * const notif_source,
                      int num_sources,
-- 
2.48.1

