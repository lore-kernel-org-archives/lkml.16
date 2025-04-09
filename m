Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAB921CC6D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 23:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744241245; cv=none; b=dB0kBE5jTAH+yaWnJM9dl9Y5ObJAlcfeNgvEknqUQxSdLbyOzc29TPtsbxA5qEHoW10TveqB8gezS7TuIUTMA85w8UtSsD3B6KGDxoj47ZDDj6bLuvn545e9lg5bwt0zMZLmRbSa1KyCXFkx8AsgZH9dNpimncY/BcWarpM+gPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744241245; c=relaxed/simple;
	bh=5WVtJCMpscI6cJXPKN1gOAX8twd3aHtPVCQBzWo3hVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fwE60nqx9BJJzY7i75ISOf5aRsxZLsZCrlXFdnf/l33tZ2X40kbpr5RInSgyqVizdjmdU0camIXeQFdLKFZ6hAu9ZWJz5/rhXKauVeTvySV5NOuirIgJSRL0sTRvsPv6i4SJjHGXL2JfX9tlkc/UHEUSOT0GLejMSmvoUMbbrr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBKspulJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBKspulJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744241243; x=1775777243;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5WVtJCMpscI6cJXPKN1gOAX8twd3aHtPVCQBzWo3hVk=;
  b=KBKspulJDEWbd8gEuIUUkAvUE1e3x5KxcfuMdU9UqJ1z9qnKH/F/j3VP
   oLtAw1LkhN1UWx7J90T2SFHubUn6Z4vOu1JxuNeGtvOW8WhsHnmDbQ9WW
   nlDkQ7efrSarApfb+aqRtXBjX/phOJU35Wxn6BHxwOo575fIvQQKneE/m
   s9uox1Z4DPciKXO3qr5B3dx3pnUOqWveIw3KMm/eAQAUPdBDfcM0V/4kE
   bEhwvxQ6hczavgFeX0RGPOxkIB/byYeE/xuAgbEEBrzThNYE8/gGlkuSa
   TrC7rxeOZwYgA0rtaSxXnm3/NtdRAJy82v9d2y2bMPhJhHXhLOCgvZDD3
   w==;
X-CSE-ConnectionGUID: ikOXAL38RVmmZvREQiovOQ==
X-CSE-MsgGUID: 4tSkIOyyTk6UuwCDXbsGjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="68224062"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="68224062"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 16:27:23 -0700
X-CSE-ConnectionGUID: 6cYTpMZOTFOcyQaTiaGSDQ==
X-CSE-MsgGUID: UleZtVfsTGqIdHmfw8GBWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="133593092"
Received: from cbae1-mobl.amr.corp.intel.com (HELO cbae1-mobl.intel.com) ([10.124.161.191])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 16:27:22 -0700
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
Subject: [PATCH v3 4/6] x86/microcode/intel: Implement staging handler
Date: Wed,  9 Apr 2025 16:27:11 -0700
Message-ID: <20250409232713.4536-5-chang.seok.bae@intel.com>
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

Previously, per-package staging invocations and their associated state
data were established. The next step is to implement the actual staging
handler according to the specified protocol. Below are key aspects to
note:

  (a)  Each staging process must begin by resetting the staging hardware.

  (b)  The staging hardware processes up to a page-sized chunk of the
       microcode image per iteration, requiring software to submit data
       incrementally.

  (c)  Once a data chunk is processed, the hardware responds with an
       offset in the image for the next chunk.

  (d)  The offset may indicate completion or request retransmission of an
       already transferred chunk. As long as the total transferred data
       remains within the predefined limit (twice the image size),
       retransmissions should be acceptable.

With that, incorporate these code sequences to the staging handler:

  1.  Initialization: Map the MMIO space via ioremap(). Reset the staging
      hardware and initialize software state, ensuring a fresh staging
      process aligned with (a).

  2.  Processing Loop: Introduce a loop iterating over data chunk,
      following (b), with proper termination conditions established from
      (d) -- stop staging when the hardware signals completion, or if the
      total transmitted data exceeds the predefined limit.

  3.  Loop Body: Finally, compose the loop body with two steps --
      transmitting a data chunk and retrieving the next offset from the
      hardware response, aligning with (b) and (c).

Since data transmission and mailbox format handling require additional
details, they are implemented separately in next changes.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
V2 -> V3:
* Rework code to eliminate global variables (Dave)
* Remove redundant variable resets (Chao)

V1 -> V2:
* Re-write the changelog for clarity (Dave).
* Move staging handling code into intel.c (Boris).
* Add extensive comments to clarify staging logic and hardware
  interactions, along with function renaming (Dave).
---
 arch/x86/kernel/cpu/microcode/intel.c | 120 +++++++++++++++++++++++++-
 1 file changed, 116 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index d8ea172d90e2..12910b8f9f8a 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -20,6 +20,8 @@
 #include <linux/cpu.h>
 #include <linux/uio.h>
 #include <linux/mm.h>
+#include <linux/delay.h>
+#include <linux/io.h>
 
 #include <asm/cpu_device_id.h>
 #include <asm/processor.h>
@@ -33,6 +35,29 @@ static const char ucode_path[] = "kernel/x86/microcode/GenuineIntel.bin";
 
 #define UCODE_BSP_LOADED	((struct microcode_intel *)0x1UL)
 
+/* Defines for the microcode staging mailbox interface */
+
+#define MBOX_REG_NUM		4
+#define MBOX_REG_SIZE		sizeof(u32)
+
+#define MBOX_CONTROL_OFFSET	0x0
+#define MBOX_STATUS_OFFSET	0x4
+
+#define MASK_MBOX_CTRL_ABORT	BIT(0)
+
+/*
+ * Each microcode image is divided into chunks, each at most
+ * MBOX_XACTION_SIZE in size. A 10-chunk image would typically require
+ * 10 transactions. However, the hardware managing the mailbox has
+ * limited resources and may not cache the entire image, potentially
+ * requesting the same chunk multiple times.
+ *
+ * To accommodate this behavior, allow up to twice the expected number of
+ * transactions (i.e., a 10-chunk image can take up to 20 attempts).
+ */
+#define MBOX_XACTION_SIZE	PAGE_SIZE
+#define MBOX_XACTION_MAX(imgsz)	((imgsz) * 2)
+
 /* Current microcode patch used in early patching on the APs. */
 static struct microcode_intel *ucode_patch_va __read_mostly;
 static struct microcode_intel *ucode_patch_late __read_mostly;
@@ -321,13 +346,100 @@ static __init struct microcode_intel *scan_microcode(void *data, size_t size,
 }
 
 /*
- * Handle the staging process using the mailbox MMIO interface.
- * Return the result state.
+ * Prepare for a new microcode transfer by resetting hardware and
+ * configuring microcode image info.
+ */
+static void init_stage(struct staging_state *ss)
+{
+	ss->ucode_ptr = ucode_patch_late;
+	ss->ucode_len = get_totalsize(&ucode_patch_late->hdr);
+
+	/*
+	 * Abort any ongoing process, effectively resetting the device.
+	 * Unlike regular mailbox data processing requests, this
+	 * operation does not require a status check.
+	 */
+	writel(MASK_MBOX_CTRL_ABORT, ss->mmio_base + MBOX_CONTROL_OFFSET);
+}
+
+/*
+ * Check if the staging process has completed. The hardware signals
+ * completion by setting a unique end offset.
+ */
+static inline bool is_stage_complete(unsigned int offset)
+{
+	return offset == UINT_MAX;
+}
+
+/*
+ * Determine if the next data chunk can be sent. Each chunk is typically
+ * one page unless the remaining data is smaller. If the total
+ * transmitted data exceeds the defined limit, a timeout occurs.
+ */
+static bool can_send_next_chunk(struct staging_state *ss)
+{
+	WARN_ON_ONCE(ss->ucode_len < ss->offset);
+	ss->chunk_size = min(MBOX_XACTION_SIZE, ss->ucode_len - ss->offset);
+
+	if (ss->bytes_sent + ss->chunk_size > MBOX_XACTION_MAX(ss->ucode_len)) {
+		ss->state = UCODE_TIMEOUT;
+		return false;
+	}
+	return true;
+}
+
+/*
+ * Transmit a chunk of the microcode image to the hardware.
+ * Return true if the chunk is processed successfully.
+ */
+static bool send_data_chunk(struct staging_state *ss)
+{
+	pr_debug_once("Staging mailbox loading code needs to be implemented.\n");
+	ss->state = UCODE_ERROR;
+	return false;
+}
+
+/*
+ * Retrieve the next offset from the hardware response.
+ * Return true if the response is valid, false otherwise.
+ */
+static bool fetch_next_offset(struct staging_state *ss)
+{
+	pr_debug_once("Staging mailbox response handling code needs to be implemented.\n\n");
+	ss->state = UCODE_ERROR;
+	return false;
+}
+
+/*
+ * Handle the staging process using the mailbox MMIO interface. The
+ * microcode image is transferred in chunks until completion. Return the
+ * result state.
  */
 static enum ucode_state do_stage(u64 mmio_pa)
 {
-	pr_debug_once("Staging implementation is pending.\n");
-	return UCODE_ERROR;
+	struct staging_state ss = {};
+
+	ss.mmio_base = ioremap(mmio_pa, MBOX_REG_NUM * MBOX_REG_SIZE);
+	if (WARN_ON_ONCE(!ss.mmio_base))
+		return UCODE_ERROR;
+
+	init_stage(&ss);
+
+	/* Perform the staging process while within the retry limit */
+	while (!is_stage_complete(ss.offset) && can_send_next_chunk(&ss)) {
+		/* Send a chunk of microcode each time: */
+		if (!send_data_chunk(&ss))
+			break;
+		/*
+		 * Then, ask the hardware which piece of the image it
+		 * needs next. The same piece may be sent more than once.
+		 */
+		if (!fetch_next_offset(&ss))
+			break;
+	}
+
+	iounmap(ss.mmio_base);
+	return ss.state;
 }
 
 static void stage_microcode(void)
-- 
2.45.2

