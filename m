Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA24B1CAA89
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322718; cv=none; b=rlxYbTfhR/MpaZJKBJJSQ6FMslSLfx5Kr49v56j5wGojr96dXnz26vGTFCmnjca+kkCFFAicMVzLpdQkntOCJMkId9om1OoU8Nk3GPgXn8wQu7+uoUkKNDAnqKacbPgBc88n/d/f/r+6MLiBdT+57l6hs8f2DmAZrvz/ZoY+z5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322718; c=relaxed/simple;
	bh=Zj2TkPNqsSsa5DJ2pfRSYerk4zU4yhZyjFL52P7Ncog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=rJuQGqR04fgjspVgAGhwPsj0Oy3b68DoVW1ttUwABC3PLZC03aKjLiIHHZSJ0ok16BI5aJXCYe1y8zPe2IrnnUmCYOGNnIAs2wRLLmfqNkCRjnPmwbNqIup4Cj56uCQ3vKTYSP4ShH7RUuJLx8c792qzyHTQaOz6CUDRcnBX0HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BAA3FEC;
	Fri, 31 Jan 2025 03:25:42 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB23D3F63F;
	Fri, 31 Jan 2025 03:25:15 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:10 +0000
Subject: [PATCH v2 10/18] firmware: arm_ffa: Add support for passing UUID
 in FFA_MSG_SEND2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-10-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2268; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=Zj2TkPNqsSsa5DJ2pfRSYerk4zU4yhZyjFL52P7Ncog=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMQKXoFWtleYV0WN6Euu77keN8tM7DdVu/7Z
 ISUrF9h052JAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzEAAKCRAAQbq8MX7i
 mH7zD/4387ZIYz9YjJT4e7WGpbXh/Y3Pz6EFuvhCwZTbqZH5JYwGEgbu6SZnugGnjd0L20Rnlo/
 ZcWxfYWHy6j8m3urj1cczv6nw7yagMVL8YUGC34f9ZDC8u77kvwgUw4UQDOgo4H1yxxJFDlhDwD
 b/3dvPCzKaxwb9tyOtsgKEdxMbD3EJ4d9Rhma9Kqko9BZk2RyhNG6ewzp7VdOxv4fGWA2RwjbFE
 4LOnWyhpvjwUjLdT+96HsTJvXUprCmmPOZM3SMyLF1amYKG0KupF3W44MTbP62o4Ukox2taRues
 x8CFbUNR3nav/3Ozr7PCO7rEDplTS1bwyQtwdEgWUM32i+EaHft0SvNu8AYdwJD9R4KA7yquGfM
 fRf/uUiEnHdc3Xeex2ONaWaGdeR7YBW/c6NKXpbH4ElW0x0625y29/2c+I0PNMIQdaeJN0YXpeP
 n5iZsCfxh8IBHe7OEWTi9fcB1ALsw+Qn6mcd3Xs4IY0AUhxPKD+g/oWPFjrhPbuZtqu5W0nCv0N
 7oTlM61I2LJPeUtxqN0mlWlDU2AfNqVqZHDUvX1we6RxwfPq4C7DATD0a/BMQrR7OUR/u+lNh/Q
 6jBuDpGLzlYsCmS/fqu95HWmfqypzg47lwH4zkOdaew3hnt7CMNY76u5Ta343jRWJ4u1ZaA0G6+
 ARJiK7NSKFaNNNg==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

FF-A v1.2 introduces UUID field in partition message header used in
FFA_MSG_SEND2 to enable partitions/endpoints exposing multiple UUIDs.

Add the support for passing UUID in FFA_MSG_SEND2.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 7 ++++---
 include/linux/arm_ffa.h           | 1 +
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 1df1c28978a5e70c31d5136e43033635c515e261..cbe0fe5f22bd8c60f3070f5e45d8722e3c9c23c8 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -484,9 +484,9 @@ static int ffa_msg_send_direct_req(u16 src_id, u16 dst_id, bool mode_32bit,
 	return -EINVAL;
 }
 
-static int ffa_msg_send2(u16 src_id, u16 dst_id, void *buf, size_t sz)
+static int ffa_msg_send2(struct ffa_device *dev, u16 src_id, void *buf, size_t sz)
 {
-	u32 src_dst_ids = PACK_TARGET_INFO(src_id, dst_id);
+	u32 src_dst_ids = PACK_TARGET_INFO(src_id, dev->vm_id);
 	struct ffa_indirect_msg_hdr *msg;
 	ffa_value_t ret;
 	int retval = 0;
@@ -502,6 +502,7 @@ static int ffa_msg_send2(u16 src_id, u16 dst_id, void *buf, size_t sz)
 	msg->offset = sizeof(*msg);
 	msg->send_recv_id = src_dst_ids;
 	msg->size = sz;
+	uuid_copy(&msg->uuid, &dev->uuid);
 	memcpy((u8 *)msg + msg->offset, buf, sz);
 
 	/* flags = 0, sender VMID = 0 works for both physical/virtual NS */
@@ -1054,7 +1055,7 @@ static int ffa_sync_send_receive(struct ffa_device *dev,
 
 static int ffa_indirect_msg_send(struct ffa_device *dev, void *buf, size_t sz)
 {
-	return ffa_msg_send2(drv_info->vm_id, dev->vm_id, buf, sz);
+	return ffa_msg_send2(dev, drv_info->vm_id, buf, sz);
 }
 
 static int ffa_sync_send_receive2(struct ffa_device *dev,
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index 761ea8fe3bb6080c893a5eb365358b62d6a4f3ff..bd78deeff284e2f46d42cfc7af218f4a0f3d1478 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -282,6 +282,7 @@ struct ffa_indirect_msg_hdr {
 	u32 offset;
 	u32 send_recv_id;
 	u32 size;
+	uuid_t uuid;
 };
 
 /* For use with FFA_MSG_SEND_DIRECT_{REQ,RESP}2 which pass data via registers */

-- 
2.34.1

