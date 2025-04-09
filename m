Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCB5221F0F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 23:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744241247; cv=none; b=cN5Gh9l/X7PXN5bQxikMLvTbUpG8ypofVRmFj1Vx96lYEEYIlZWzO4hGXiRmQnOWbaxQCaVkeE595GRWzhFyWoIIFEvMZU6eh0/Ze1XG1Kee7L6dsMAVA1o2zg5xCbO7KV5nzRpFZvYNEI9qhsgwvnY0kbBshlsz/bgZX6ZRnFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744241247; c=relaxed/simple;
	bh=8CzCJRsIQK3GhjyZmsaCHu1Ru1zM8GuhvPh9UJsFEiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P3YGyLdaNB6iZyCo5Ht8qXjL7k5GtNTJewqfoLZM3rEIcwO6yjQ4bwDRzp7s3K6Ytwj44wZDK9llc7f6R4pzZ8jQ4ZvObHBTT1X/FQTR2fz+cHy5KfeNeg+2N6z/s/DhwL9P7RRV6NrQkgsepalLAfgG5Y4yLG9QPeEPPA4BrSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bH+4xSjL; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bH+4xSjL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744241245; x=1775777245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8CzCJRsIQK3GhjyZmsaCHu1Ru1zM8GuhvPh9UJsFEiM=;
  b=bH+4xSjLUDZZMSHDvO9Q51ctyRzgM5cI52YfTeHrGpD7bVh/XsBC26lE
   UUCbS8KQzBAtCeotm6jGfWP1o1VelapP5TggYxWk+UnZctjJk6eA3vpZp
   X9UCIwOWfcZ1SqZQgzoXUh4d4jbLdpNNFYFJpSmhqKBer2X3ngfUQJ5N0
   CAOtbG1ON9BSRuQrrg28Babuq96OIdHZYGdTlTBeL6LdirNyqVyflPk+R
   sR9v5cbEcLRYyNdRdRyjrLnhH3iv3xjGe89N7IhM4YftktfYsCufuZTft
   tWhJMdDrSYjFdUpMzYTOVbfu6RsYyXtJuH/VgSv6lxPYzEutb7tZLn7KY
   A==;
X-CSE-ConnectionGUID: +EFnbqc7TP2BviJW5Co1Bg==
X-CSE-MsgGUID: /unm7dM8RaSRqYSUhVciiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="68224068"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="68224068"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 16:27:25 -0700
X-CSE-ConnectionGUID: nIruEU8cQUKGQWdem1XhoA==
X-CSE-MsgGUID: ewH/G9BHRealYQVupwYwyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="133593100"
Received: from cbae1-mobl.amr.corp.intel.com (HELO cbae1-mobl.intel.com) ([10.124.161.191])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 16:27:24 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	colinmitchell@google.com,
	chao.gao@intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH v3 5/6] x86/microcode/intel: Support mailbox transfer
Date: Wed,  9 Apr 2025 16:27:12 -0700
Message-ID: <20250409232713.4536-6-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409232713.4536-1-chang.seok.bae@intel.com>
References: <20250320234104.8288-1-chang.seok.bae@intel.com>
 <20250409232713.4536-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, the functions for sending microcode data and retrieving the
next offset were placeholders, as they required handling the specific
mailbox format. Implement them as following:

== Mailbox Format ==

The staging mailbox consists of two primary sections: 'header' and
'data'. While the microcode must be transferred following this format,
the actual data transfer mechanism involves reading and writing to
specific MMIO registers.

== Mailbox Data Registers ==

Unlike conventional interfaces that allocate MMIO space for each data
chunk, the staging interface features a "narrow" interface, using only
two dword-sized registers for read and write operations.

For example, if writing 2 dwords of data to a device. Typically, the
device would expose 2 dwords of "wide" MMIO space. To send the data to
the device:

	writel(buf[0], io_addr + 0);
	writel(buf[1], io_addr + 1);

But, this interface is a bit different. Instead of having a "wide"
interface where there is separate MMIO space for each word in a
transaction, it has a "narrow" interface where several words are written
to the same spot in MMIO space:

	writel(buf[0], io_addr);
	writel(buf[1], io_addr);

The same goes for the read side.

== Implementation Summary ==

Given that, introduce two layers of helper functions at first:

  * Low-level helpers for reading and writing to data registers directly.
  * Wrapper functions for handling mailbox header and data sections.

Using them, implement send_data_chunk() and fetch_next_offset()
functions. Add explicit error and timeout handling routine in
wait_for_transaction(), finishing up the transfer.

Note: The kernel has support for similar mailboxes. But none of them are
compatible with this one. Trying to share code resulted in a bloated
mess, so this code is standalone.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
V2 -> V3:
* Update code to reflect the removal of a global variable (Dave).

V1 -> V2:
* Add lots of code comments and edit the changelog (Dave).
* Encapsulate register read/write operations for processing header and
  data sections.
---
 arch/x86/kernel/cpu/microcode/intel.c | 150 ++++++++++++++++++++++++--
 1 file changed, 144 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index 12910b8f9f8a..542b3abad8e3 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -22,6 +22,7 @@
 #include <linux/mm.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/pci_ids.h>
 
 #include <asm/cpu_device_id.h>
 #include <asm/processor.h>
@@ -42,8 +43,30 @@ static const char ucode_path[] = "kernel/x86/microcode/GenuineIntel.bin";
 
 #define MBOX_CONTROL_OFFSET	0x0
 #define MBOX_STATUS_OFFSET	0x4
+#define MBOX_WRDATA_OFFSET	0x8
+#define MBOX_RDDATA_OFFSET	0xc
 
 #define MASK_MBOX_CTRL_ABORT	BIT(0)
+#define MASK_MBOX_CTRL_GO	BIT(31)
+
+#define MASK_MBOX_STATUS_ERROR	BIT(2)
+#define MASK_MBOX_STATUS_READY	BIT(31)
+
+#define MASK_MBOX_RESP_SUCCESS	BIT(0)
+#define MASK_MBOX_RESP_PROGRESS	BIT(1)
+#define MASK_MBOX_RESP_ERROR	BIT(2)
+
+#define MBOX_CMD_LOAD		0x3
+#define MBOX_OBJ_STAGING	0xb
+#define DWORD_ALIGN(size)	((size) / sizeof(u32))
+#define MBOX_HEADER(mbox_size)	(PCI_VENDOR_ID_INTEL | \
+				 (MBOX_OBJ_STAGING << 16) | \
+				 ((u64)DWORD_ALIGN(mbox_size) << 32))
+
+/* The size of each mailbox header */
+#define MBOX_HEADER_SIZE	sizeof(u64)
+/* The size of staging hardware response */
+#define MBOX_RESPONSE_SIZE	sizeof(u64)
 
 /*
  * Each microcode image is divided into chunks, each at most
@@ -57,6 +80,7 @@ static const char ucode_path[] = "kernel/x86/microcode/GenuineIntel.bin";
  */
 #define MBOX_XACTION_SIZE	PAGE_SIZE
 #define MBOX_XACTION_MAX(imgsz)	((imgsz) * 2)
+#define MBOX_XACTION_TIMEOUT_MS	(10 * MSEC_PER_SEC)
 
 /* Current microcode patch used in early patching on the APs. */
 static struct microcode_intel *ucode_patch_va __read_mostly;
@@ -345,6 +369,49 @@ static __init struct microcode_intel *scan_microcode(void *data, size_t size,
 	return size ? NULL : patch;
 }
 
+static inline u32 read_mbox_dword(void __iomem *mmio_base)
+{
+	u32 dword = readl(mmio_base + MBOX_RDDATA_OFFSET);
+
+	/* Acknowledge read completion to the staging hardware */
+	writel(0, mmio_base + MBOX_RDDATA_OFFSET);
+	return dword;
+}
+
+static inline void write_mbox_dword(void __iomem *mmio_base, u32 dword)
+{
+	writel(dword, mmio_base + MBOX_WRDATA_OFFSET);
+}
+
+static inline u64 read_mbox_header(void __iomem *mmio_base)
+{
+	u32 high, low;
+
+	low  = read_mbox_dword(mmio_base);
+	high = read_mbox_dword(mmio_base);
+
+	return ((u64)high << 32) | low;
+}
+
+static inline void write_mbox_header(void __iomem *mmio_base, u64 value)
+{
+	write_mbox_dword(mmio_base, value);
+	write_mbox_dword(mmio_base, value >> 32);
+}
+
+static void write_mbox_data(void __iomem *mmio_base, u32 *chunk, unsigned int chunk_size)
+{
+	int i;
+
+	/*
+	 * The MMIO space is mapped as Uncached (UC). Each write arrives
+	 * at the device as an individual transaction in program order.
+	 * The device can then resemble the sequence accordingly.
+	 */
+	for (i = 0; i < DWORD_ALIGN(chunk_size); i++)
+		write_mbox_dword(mmio_base, chunk[i]);
+}
+
 /*
  * Prepare for a new microcode transfer by resetting hardware and
  * configuring microcode image info.
@@ -388,15 +455,71 @@ static bool can_send_next_chunk(struct staging_state *ss)
 	return true;
 }
 
+/*
+ * Wait for the hardware to complete a transaction.
+ * Return true on success, false on failure.
+ */
+static bool wait_for_transaction(struct staging_state *ss)
+{
+	u32 timeout, status;
+
+	/* Allow time for hardware to complete the operation: */
+	for (timeout = 0; timeout < MBOX_XACTION_TIMEOUT_MS; timeout++) {
+		msleep(1);
+
+		status = readl(ss->mmio_base + MBOX_STATUS_OFFSET);
+		/* Break out early if the hardware is ready: */
+		if (status & MASK_MBOX_STATUS_READY)
+			break;
+	}
+
+	status = readl(ss->mmio_base + MBOX_STATUS_OFFSET);
+
+	/* Check for explicit error response */
+	if (status & MASK_MBOX_STATUS_ERROR) {
+		ss->state = UCODE_ERROR;
+		return false;
+	}
+
+	/*
+	 * Hardware is neither responded to the action nor
+	 * signaled any error. Treat the case as timeout.
+	 */
+	if (!(status & MASK_MBOX_STATUS_READY)) {
+		ss->state = UCODE_TIMEOUT;
+		return false;
+	}
+
+	ss->state = UCODE_OK;
+	return true;
+}
+
 /*
  * Transmit a chunk of the microcode image to the hardware.
  * Return true if the chunk is processed successfully.
  */
 static bool send_data_chunk(struct staging_state *ss)
 {
-	pr_debug_once("Staging mailbox loading code needs to be implemented.\n");
-	ss->state = UCODE_ERROR;
-	return false;
+	u16 mbox_size = MBOX_HEADER_SIZE * 2 + ss->chunk_size;
+	u32 *chunk = ss->ucode_ptr + ss->offset;
+
+	/*
+	 * Write 'request' mailbox object in the following order:
+	 * - Mailbox header includes total size
+	 * - Command header specifies the load operation
+	 * - Data section contains a microcode chunk
+	 */
+	write_mbox_header(ss->mmio_base, MBOX_HEADER(mbox_size));
+	write_mbox_header(ss->mmio_base, MBOX_CMD_LOAD);
+	write_mbox_data(ss->mmio_base, chunk, ss->chunk_size);
+	ss->bytes_sent += ss->chunk_size;
+
+	/*
+	 * Notify the hardware that the mailbox is ready for processing.
+	 * The staging hardware will process the request asynchronously.
+	 */
+	writel(MASK_MBOX_CTRL_GO, ss->mmio_base + MBOX_CONTROL_OFFSET);
+	return wait_for_transaction(ss);
 }
 
 /*
@@ -405,9 +528,24 @@ static bool send_data_chunk(struct staging_state *ss)
  */
 static bool fetch_next_offset(struct staging_state *ss)
 {
-	pr_debug_once("Staging mailbox response handling code needs to be implemented.\n\n");
-	ss->state = UCODE_ERROR;
-	return false;
+	const u16 mbox_size = MBOX_HEADER_SIZE + MBOX_RESPONSE_SIZE;
+
+	/* All responses begin with the same header value: */
+	WARN_ON_ONCE(read_mbox_header(ss->mmio_base) != MBOX_HEADER(mbox_size));
+
+	/*
+	 * The 'response' mailbox contains two dword data:
+	 * - First has next offset in microcode image
+	 * - Second delivers status flag
+	 */
+	ss->offset = read_mbox_dword(ss->mmio_base);
+	if (read_mbox_dword(ss->mmio_base) & MASK_MBOX_RESP_ERROR) {
+		ss->state = UCODE_ERROR;
+		return false;
+	}
+
+	ss->state = UCODE_OK;
+	return true;
 }
 
 /*
-- 
2.45.2

