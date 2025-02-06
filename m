Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFA04C8E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 15:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738856942; cv=none; b=HFtGeRHw1PrkL8tD/EizPWmQs3sxxmmfPZChzCecGoBa4GYp3Lffb0kFQRvpQzrh6+j94M+8MFcB56XA11cNbHlHCTQyc9BVoBMOwnyMfooRrPFJ3gFHr1fdpe64ZVyR14bNnS0rGkj1bGLbaVxkL7Pd8tLnVM27pikjcVoxA9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738856942; c=relaxed/simple;
	bh=zOY+ZCzmFJLL0Q8wdwGki3w85BL6fTQODYs1Wl3IQdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f9TOBP7+REH6V+c+AY2mybk71u2bwbfw+GzgqIDV5NQTcndM08eZSZUReysqq8D2t6vvACzEwTsmSSn+Be6hj2xOJWtjG4O284Z9hOhkoDBIfAbSTox46CUltp8z2EXXnskvi3nLCFrGoZOoiY2Z+XK2/wzl7k8lOTGPF80C7tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CG0q0ltk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CG0q0ltk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738856941; x=1770392941;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zOY+ZCzmFJLL0Q8wdwGki3w85BL6fTQODYs1Wl3IQdw=;
  b=CG0q0ltk00PJs1QHjf56mOyy/xXO49YAvIQSPcN+vES3VDKsbWSMH9/k
   iDpz5UnI8y22/8wPWjhBkWDzPvP97iZRxVFNwiN385R1bDo9LYear+6UU
   Y7EU0VfvZPUOfbVQ2JTInBVb/FsT5f/Hqosgbw4HlgKYrKoWbcSfIClCq
   HncxKRzscDSzHh4A7KGDjKb7qXlDipC0BZ9xdpR3CKuqmeZU+56uIap8P
   veiU13QETdpdddFXYv/Y7hSacJKOgwLqyd5n4B+xH0Ummr08Yw0M1cCl9
   IJb0Q1DvwH3Ehau23XZp+N/OYXMZb69W3RHVoiYAdLH8BWosV6I+79kKB
   A==;
X-CSE-ConnectionGUID: FBrBF/qdQySQ5w5byG097g==
X-CSE-MsgGUID: Xwf328HST9S5u+DjwNdalA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38697044"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="38697044"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 07:49:00 -0800
X-CSE-ConnectionGUID: GAlsV9GUQxaWn7G3GmrZsA==
X-CSE-MsgGUID: SLZklxN/T6i82CuUuEWhWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116198640"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 06 Feb 2025 07:48:58 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C6FF3EE; Thu, 06 Feb 2025 17:48:56 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ofir Bitton <obitton@habana.ai>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Oded Gabbay <ogabbay@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] accel/habanalabs: Switch to use %ptTs
Date: Thu,  6 Feb 2025 17:48:55 +0200
Message-ID: <20250206154855.1125731-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use %ptTs instead of open-coded variant to print contents of time64_t type
in human readable form.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/accel/habanalabs/common/device.c | 25 +++---------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 30277ae410d4..b5dad5a54d5a 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -1066,28 +1066,11 @@ static bool is_pci_link_healthy(struct hl_device *hdev)
 	return (device_id == hdev->pdev->device);
 }
 
-static void stringify_time_of_last_heartbeat(struct hl_device *hdev, char *time_str, size_t size,
-						bool is_pq_hb)
-{
-	time64_t seconds = is_pq_hb ? hdev->heartbeat_debug_info.last_pq_heartbeat_ts
-					: hdev->heartbeat_debug_info.last_eq_heartbeat_ts;
-	struct tm tm;
-
-	if (!seconds)
-		return;
-
-	time64_to_tm(seconds, 0, &tm);
-
-	snprintf(time_str, size, "%ld-%02d-%02d %02d:%02d:%02d (UTC)",
-		tm.tm_year + 1900, tm.tm_mon, tm.tm_mday, tm.tm_hour, tm.tm_min, tm.tm_sec);
-}
-
 static bool hl_device_eq_heartbeat_received(struct hl_device *hdev)
 {
 	struct eq_heartbeat_debug_info *heartbeat_debug_info = &hdev->heartbeat_debug_info;
 	u32 cpu_q_id = heartbeat_debug_info->cpu_queue_id, pq_pi_mask = (HL_QUEUE_LENGTH << 1) - 1;
 	struct asic_fixed_properties *prop = &hdev->asic_prop;
-	char pq_time_str[64] = "N/A", eq_time_str[64] = "N/A";
 
 	if (!prop->cpucp_info.eq_health_check_supported)
 		return true;
@@ -1095,17 +1078,15 @@ static bool hl_device_eq_heartbeat_received(struct hl_device *hdev)
 	if (!hdev->eq_heartbeat_received) {
 		dev_err(hdev->dev, "EQ heartbeat event was not received!\n");
 
-		stringify_time_of_last_heartbeat(hdev, pq_time_str, sizeof(pq_time_str), true);
-		stringify_time_of_last_heartbeat(hdev, eq_time_str, sizeof(eq_time_str), false);
 		dev_err(hdev->dev,
-			"EQ: {CI %u, HB counter %u, last HB time: %s}, PQ: {PI: %u, CI: %u (%u), last HB time: %s}\n",
+			"EQ: {CI %u, HB counter %u, last HB time: %ptTs}, PQ: {PI: %u, CI: %u (%u), last HB time: %ptTs}\n",
 			hdev->event_queue.ci,
 			heartbeat_debug_info->heartbeat_event_counter,
-			eq_time_str,
+			hdev->heartbeat_debug_info.last_eq_heartbeat_ts,
 			hdev->kernel_queues[cpu_q_id].pi,
 			atomic_read(&hdev->kernel_queues[cpu_q_id].ci),
 			atomic_read(&hdev->kernel_queues[cpu_q_id].ci) & pq_pi_mask,
-			pq_time_str);
+			hdev->heartbeat_debug_info.last_pq_heartbeat_ts);
 
 		hl_eq_dump(hdev, &hdev->event_queue);
 
-- 
2.43.0.rc1.1336.g36b5255a03ac

