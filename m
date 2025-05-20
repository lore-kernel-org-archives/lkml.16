Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9A325D1E4
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723316; cv=none; b=hUto+Rp/hGsS8Hvn1RN+g0sb+nnLXVCRawFSe6deytYZI+JwEPR+f9COT3mAHF1alDPPWdBRhBIvT5DHNJqSOuK7vL09cBCUvmYEzf9tb+VSf3jb7tiQLRy5BIOJO1WyJmMxstItl66yUQEJYYrThsy6Z/xJxnbmzBCcjCrPXUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723316; c=relaxed/simple;
	bh=En1XCw7CQ7wHukGUv83xjyaNgB5I0qGNc6E86W7ACQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kDh1chutmsykG1kdbVpL63hD7mIfJuo0QGzh9H/NmYkZgiYVg/PUTHQUU2Qw8/WrMvMvWvxCtkQCu09gZ/FeZjwRC7gbMj7jQ+B3DmY0rWaacgQ1zoCgbZ72NWv7czJqqycd8Nil3wvT+7brKxMNc9MvXfH2Vl2bB7IFkxJqH/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhQ/3mX3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhQ/3mX3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7B2C4CEEB;
	Tue, 20 May 2025 06:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747723315;
	bh=En1XCw7CQ7wHukGUv83xjyaNgB5I0qGNc6E86W7ACQ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JhQ/3mX39gQRRCB8e9RZjy2wmpoP8JBF0aqjWqvk8/IMfTc0iuindKwimCv28Kngv
	 8CQUgzplO8HqaUoLOFblWR7CnMrU1NiYdW/amXrIXlZ0urTRrdTpJMlfaPJkVb6fPX
	 UixYSD1fp1k8xUpVO+5cTtqAMWeM7omCa3euhRSFvV83E7cbovRhJtphb0TmvF6i+6
	 XnRJvS1iXKgTAc8F6lqqf4XwyGxcYGmLNSdG1jM9VUqi0iy2YCT9W524akRRUfWnqp
	 jsqZ8OdQs7qmUNZqKvH0+6nJgu7uGWmmbcEdz+GOBkb7eziEAStKyPQomXdNxyxpmc
	 j0pG5CASZ8X6g==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHGfh-00000005qtU-3d26;
	Tue, 20 May 2025 08:41:53 +0200
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
Subject: [PATCH v9 08/20] acpi/ghes: Use HEST table offsets when preparing GHES records
Date: Tue, 20 May 2025 08:41:27 +0200
Message-ID: <a5fee6d37b5f7a01fa94de8b7e7219a72d991d9d.1747722973.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747722973.git.mchehab+huawei@kernel.org>
References: <cover.1747722973.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

There are two pointers that are needed during error injection:

1. The start address of the CPER block to be stored;
2. The address of the read ack.

It is preferable to calculate them from the HEST table.  This allows
checking the source ID, the size of the table and the type of the
HEST error block structures.

Yet, keep the old code, as this is needed for migration purposes
from older QEMU versions.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes.c         | 100 +++++++++++++++++++++++++++++++++++++++++
 include/hw/acpi/ghes.h |   2 +-
 2 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index cbc96c1909f0..668ca72587c7 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -41,6 +41,12 @@
 /* Address offset in Generic Address Structure(GAS) */
 #define GAS_ADDR_OFFSET 4
 
+/*
+ * ACPI spec 1.0b
+ * 5.2.3 System Description Table Header
+ */
+#define ACPI_DESC_HEADER_OFFSET     36
+
 /*
  * The total size of Generic Error Data Entry
  * ACPI 6.1/6.2: 18.3.2.7.1 Generic Error Data,
@@ -61,6 +67,30 @@
  */
 #define ACPI_GHES_GESB_SIZE                 20
 
+/*
+ * See the memory layout map at docs/specs/acpi_hest_ghes.rst.
+ */
+
+/*
+ * ACPI 6.1: 18.3.2.8 Generic Hardware Error Source version 2
+ * Table 18-344 Generic Hardware Error Source version 2 (GHESv2) Structure
+ */
+#define HEST_GHES_V2_ENTRY_SIZE  92
+
+/*
+ * ACPI 6.1: 18.3.2.8 Generic Hardware Error Source version 2
+ * Table 18-344 Generic Hardware Error Source version 2 (GHESv2) Structure
+ * Read Ack Register
+ */
+#define GHES_READ_ACK_ADDR_OFF          64
+
+/*
+ * ACPI 6.1: 18.3.2.7: Generic Hardware Error Source
+ * Table 18-341 Generic Hardware Error Source Structure
+ * Error Status Address
+ */
+#define GHES_ERR_STATUS_ADDR_OFF  20
+
 /*
  * Values for error_severity field
  */
@@ -408,6 +438,73 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
     *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
 }
 
+static void get_ghes_source_offsets(uint16_t source_id,
+                                    uint64_t hest_addr,
+                                    uint64_t *cper_addr,
+                                    uint64_t *read_ack_start_addr,
+                                    Error **errp)
+{
+    uint64_t hest_err_block_addr, hest_read_ack_addr;
+    uint64_t err_source_entry, error_block_addr;
+    uint32_t num_sources, i;
+
+    hest_addr += ACPI_DESC_HEADER_OFFSET;
+
+    cpu_physical_memory_read(hest_addr, &num_sources,
+                             sizeof(num_sources));
+    num_sources = le32_to_cpu(num_sources);
+
+    err_source_entry = hest_addr + sizeof(num_sources);
+
+    /*
+     * Currently, HEST Error source navigates only for GHESv2 tables
+     */
+    for (i = 0; i < num_sources; i++) {
+        uint64_t addr = err_source_entry;
+        uint16_t type, src_id;
+
+        cpu_physical_memory_read(addr, &type, sizeof(type));
+        type = le16_to_cpu(type);
+
+        /* For now, we only know the size of GHESv2 table */
+        if (type != ACPI_GHES_SOURCE_GENERIC_ERROR_V2) {
+            error_setg(errp, "HEST: type %d not supported.", type);
+            return;
+        }
+
+        /* Compare CPER source ID at the GHESv2 structure */
+        addr += sizeof(type);
+        cpu_physical_memory_read(addr, &src_id, sizeof(src_id));
+        if (le16_to_cpu(src_id) == source_id) {
+            break;
+        }
+
+        err_source_entry += HEST_GHES_V2_ENTRY_SIZE;
+    }
+    if (i == num_sources) {
+        error_setg(errp, "HEST: Source %d not found.", source_id);
+        return;
+    }
+
+    /* Navigate through table address pointers */
+    hest_err_block_addr = err_source_entry + GHES_ERR_STATUS_ADDR_OFF +
+                          GAS_ADDR_OFFSET;
+
+    cpu_physical_memory_read(hest_err_block_addr, &error_block_addr,
+                             sizeof(error_block_addr));
+    error_block_addr = le64_to_cpu(error_block_addr);
+
+    cpu_physical_memory_read(error_block_addr, cper_addr,
+                             sizeof(*cper_addr));
+    *cper_addr = le64_to_cpu(*cper_addr);
+
+    hest_read_ack_addr = err_source_entry + GHES_READ_ACK_ADDR_OFF +
+                         GAS_ADDR_OFFSET;
+    cpu_physical_memory_read(hest_read_ack_addr, read_ack_start_addr,
+                             sizeof(*read_ack_start_addr));
+    *read_ack_start_addr = le64_to_cpu(*read_ack_start_addr);
+}
+
 void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
@@ -423,6 +520,9 @@ void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
     if (!ags->use_hest_addr) {
         get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
                              &cper_addr, &read_ack_register_addr);
+    } else {
+        get_ghes_source_offsets(source_id, le64_to_cpu(ags->hest_addr_le),
+                                &cper_addr, &read_ack_register_addr, errp);
     }
 
     cpu_physical_memory_read(read_ack_register_addr,
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index ea9baab764e2..5265102ba51f 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -78,7 +78,7 @@ enum {
 typedef struct AcpiGhesState {
     uint64_t hest_addr_le;
     uint64_t hw_error_le;
-    bool use_hest_addr;         /* Currently, always false */
+    bool use_hest_addr; /* True if HEST address is present */
 } AcpiGhesState;
 
 void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
-- 
2.49.0

