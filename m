Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9043B21B9F5
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 12:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748868960; cv=none; b=hJRcNp9VADUHLKyQWLq2x1882HacDDlQYuWhVyjpgn29fl0NPBsMb3NkfQsdylz+CxbVuF453koAR7pr01Xyob7N7V6Stw4DcZ3cHgZk+ufthl6yUd0NlZwE4D0u9hx+zVwAF1RQ03QBT4Jo3kOOujM0FgacXZMn0Am+tb5LwWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748868960; c=relaxed/simple;
	bh=1y1k9L6v273vVnANqw0hHe3EnLWOX+Fa7Jbly59n7Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ugim5W8F7FzMDJBdAlXoixAO1Nb8cJD2fXTjEaAS878OHI4oiapQfBFvyq9HN2nL7v35B7/5o7k56llSX82lqQMLlQknult+slnMcQibql5XjYpg/zAaXPqxoLom18pGZqBmfKR7U/BJk8bH8VtLi2K1A4Ch+L7nHCK6nu/zGCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AuTUU2ET; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AuTUU2ET"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F300EC4CEEB;
	Mon,  2 Jun 2025 12:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748868960;
	bh=1y1k9L6v273vVnANqw0hHe3EnLWOX+Fa7Jbly59n7Q8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AuTUU2ETaC4zcMj2e9medq9DpK1kpQ1Z4GptW+VZfh+F0niL2wttEvT2MLo6mUH9Q
	 iGtoKWqYgvlwP4M7vRgYcNy/bF67fKmEGd3PgJnJ3Qaibu2tOZmVKPkFi7v1InnG+i
	 GhvVjUkiwmmDy9oxSFWraVNO2/03Fqx/O5Agz6uudV1u8Swa8LxepWWJFzShmB65z+
	 F7OLADiYqScR7qVbLd/uoL6wlfQZGzMaquoiRNPN5UeqelmD+GzGJTFxysHmv96RMu
	 7KSSKOYguLx5Fv7RmZS4a1rkxSKLwqWi6e5tQMYtSlFLrY4qIase30Aa26UqS8uG7h
	 icbv4+ZA/omhQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uM4hV-000000008bf-0Wcl;
	Mon, 02 Jun 2025 14:55:37 +0200
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
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 12/26] acpi/generic_event_device: add logic to detect if HEST addr is available
Date: Mon,  2 Jun 2025 14:52:30 +0200
Message-ID: <20250602122244.081a1960@imammedo.users.ipa.redhat.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530221810.694ce02e@foz.lan>
References: <20250530221810.694ce02e@foz.lan>
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
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
v10:
- rebased on the top of upstream

 hw/acpi/generic_event_device.c |  2 ++
 hw/arm/virt-acpi-build.c       | 18 ++++++++++++++++--
 hw/core/machine.c              |  2 ++
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index d292f61b4e41..3cf9dab0d01a 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -318,6 +318,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 
 static const Property acpi_ged_properties[] = {
     DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
+    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState,
+                     ghes_state.use_hest_addr, false),
 };
 
 static const VMStateDescription vmstate_memhp_state = {
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index da3ebf403ef9..3126234e657d 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -893,6 +893,10 @@ static const AcpiNotificationSourceId hest_ghes_notify[] = {
     { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
 };
 
+static const AcpiNotificationSourceId hest_ghes_notify_10_0[] = {
+    { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
+};
+
 static
 void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 {
@@ -947,15 +951,25 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 
     if (vms->ras) {
         AcpiGedState *acpi_ged_state;
+        static const AcpiNotificationSourceId *notify;
+        unsigned int notify_sz;
         AcpiGhesState *ags;
 
         acpi_ged_state = ACPI_GED(vms->acpi_dev);
         ags = &acpi_ged_state->ghes_state;
         if (ags) {
             acpi_add_table(table_offsets, tables_blob);
+
+            if (!ags->use_hest_addr) {
+                notify = hest_ghes_notify_10_0;
+                notify_sz = ARRAY_SIZE(hest_ghes_notify_10_0);
+            } else {
+                notify = hest_ghes_notify;
+                notify_sz = ARRAY_SIZE(hest_ghes_notify);
+            }
+
             acpi_build_hest(ags, tables_blob, tables->hardware_errors,
-                            tables->linker, hest_ghes_notify,
-                            ARRAY_SIZE(hest_ghes_notify),
+                            tables->linker, notify, notify_sz,
                             vms->oem_id, vms->oem_table_id);
         }
     }
diff --git a/hw/core/machine.c b/hw/core/machine.c
index c3f3a5020d0b..aa90a83d8c23 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -35,10 +35,12 @@
 #include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-net.h"
 #include "hw/virtio/virtio-iommu.h"
+#include "hw/acpi/generic_event_device.h"
 #include "audio/audio.h"
 
 GlobalProperty hw_compat_10_0[] = {
     { "scsi-hd", "dpofua", "off" },
+    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
 };
 const size_t hw_compat_10_0_len = G_N_ELEMENTS(hw_compat_10_0);
 
-- 
2.49.0

