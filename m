Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF671581EE
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322713; cv=none; b=HNRUKs3BQlH2AieG59OakUlrVm6n/4kVzjp3CnikJS42x9qNFWTE0IrtSn5mQIFN7CzG23qdyAn8+UGjWsshFLp/rgybGcg2aoP04FUaQwSSDmBt++6kNMjR1B3h9bN+Dit+QEjfmLNmhjGsE9uceNzTNdeDu/YPSP76OjkoWiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322713; c=relaxed/simple;
	bh=8PoYp80YnxCA99g/OmQlLeeIzCDfYeP4snzLnAUmwtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=UU25oB3unTSS2/959iUdrssVOP1oDm7kL66P3zJuuhkkPat6wrTgKM6ZlRpvF09mpAg4eFXxYukiqyup9ZDRvYMxJS8RD3NV9vIIKBGF6REYjCL11oAM29g/Mzz4yhLaIJpN9+30UzVGE9FKSYG9qxUmOS922EO5dcqHNxVJq20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E16F2FEC;
	Fri, 31 Jan 2025 03:25:36 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCCBD3F63F;
	Fri, 31 Jan 2025 03:25:10 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:05 +0000
Subject: [PATCH v2 05/18] firmware: arm_ffa: Fix big-endian support in
 __ffa_partition_info_regs_get()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-5-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2970; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=8PoYp80YnxCA99g/OmQlLeeIzCDfYeP4snzLnAUmwtk=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMPF3AwbZPpDnrAK4QCNPF48Pwgb7Ddgyfwj
 ery7HTg8GCJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzDwAKCRAAQbq8MX7i
 mEKpEACGGMhs9IiGXnsVEw18BL1U9sImXyJ7pzdVolX7K9YpyZ7q9B1YoVpSDXyn5qftYgdFuec
 4q+Kt0bPJlMO2fEonRfhu6lKwdAd0hl4BF8UNqIr4QQpClxQcJh1TfoY2sf5Fv0LwokK11ZEcgJ
 juvhpxT6poK21pRWBkpc8hPGipeyQilieDRrzQf90xVap1HNgBsTZiO8FVdTrNgHN5J/eCqILld
 LRaa1uGOBAt7syDbwa8h3Gxbez2hwwuMF5pw0Cra2qF41ZO+KHl/xs5P6YMGb4g1/RkVHIn7Rl7
 WpEjks7Em6DZUGo7RWf4cUHxlSqXOzAwTc9wCZWRDCM+MBvREwVVR8Sf4bwGB0MoVAIQgN3aBur
 1PVOHiOuWJCjMfutp2J0N0wgVLqOXAEmD9Fxzwa/SfcBPRG1fXb21smqFHQnW/mtXmx5Uvq36Mq
 8VeTCvc1sHpnecLYX1GC68TWTmmU3SocYBPNVFotiJQPyQxbXmaCpt1Pz1S1prSmPuKr+c7VekG
 DfkzijcHeOTaobE2KmWcSqrHSX/hcg7FPo1Iygf97OPJQQSHsNPzXJIL73Y9Rd6yJqDlEAhb4SP
 zdc+vcMU1O/GQwtT+uluZK4LshUHQlMPWWuPbw6Xn24rZGHqQL2ViR4NdzZJZ4yxqUpfMuNl/s/
 L0YTBxzAZWQc9MQ==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

Currently the FF-A driver doesn't support big-endian correctly. It is
hard to regularly test the setup due to lack of test infrastructure and
tools.

In order to support full stack, we need to take small steps in getting
the support for big-endian kernel added slowly. This change fixes the
support in __ffa_partition_info_regs_get() so that the response from the
firmware are converted correctly as required. With this change, we can
enumerate all the FF-A devices correctly in the big-endian kernel if the
FFA_PARTITION_INFO_REGS_GET is supported.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index bc6ffd25ad2e2fea0fe3610cf896718dbed8f0ad..87e106c728b89f3ce7c11219cf7cad9cc166dda2 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -307,14 +307,24 @@ __ffa_partition_info_get(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 #define CURRENT_INDEX(x)	((u16)(FIELD_GET(CURRENT_INDEX_MASK, (x))))
 #define UUID_INFO_TAG(x)	((u16)(FIELD_GET(UUID_INFO_TAG_MASK, (x))))
 #define PARTITION_INFO_SZ(x)	((u16)(FIELD_GET(PARTITION_INFO_SZ_MASK, (x))))
+#define PART_INFO_ID_MASK	GENMASK(15, 0)
+#define PART_INFO_EXEC_CXT_MASK	GENMASK(31, 16)
+#define PART_INFO_PROPS_MASK	GENMASK(63, 32)
+#define PART_INFO_ID(x)		((u16)(FIELD_GET(PART_INFO_ID_MASK, (x))))
+#define PART_INFO_EXEC_CXT(x)	((u16)(FIELD_GET(PART_INFO_EXEC_CXT_MASK, (x))))
+#define PART_INFO_PROPERTIES(x)	((u32)(FIELD_GET(PART_INFO_PROPS_MASK, (x))))
 static int
 __ffa_partition_info_get_regs(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 			      struct ffa_partition_info *buffer, int num_parts)
 {
 	u16 buf_sz, start_idx, cur_idx, count = 0, prev_idx = 0, tag = 0;
+	struct ffa_partition_info *buf = buffer;
 	ffa_value_t partition_info;
 
 	do {
+		__le64 *regs;
+		int idx;
+
 		start_idx = prev_idx ? prev_idx + 1 : 0;
 
 		invoke_ffa_fn((ffa_value_t){
@@ -338,8 +348,25 @@ __ffa_partition_info_get_regs(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 		if (buf_sz > sizeof(*buffer))
 			buf_sz = sizeof(*buffer);
 
-		memcpy(buffer + prev_idx * buf_sz, &partition_info.a3,
-		       (cur_idx - start_idx + 1) * buf_sz);
+		regs = (void *)&partition_info.a3;
+		for (idx = 0; idx < cur_idx - start_idx + 1; idx++, buf++) {
+			union {
+				uuid_t uuid;
+				u64 regs[2];
+			} uuid_regs = {
+				.regs = {
+					le64_to_cpu(*(regs + 1)),
+					le64_to_cpu(*(regs + 2)),
+					}
+			};
+			u64 val = *(u64 *)regs;
+
+			buf->id = PART_INFO_ID(val);
+			buf->exec_ctxt = PART_INFO_EXEC_CXT(val);
+			buf->properties = PART_INFO_PROPERTIES(val);
+			uuid_copy(&buf->uuid, &uuid_regs.uuid);
+			regs += 3;
+		}
 		prev_idx = cur_idx;
 
 	} while (cur_idx < (count - 1));

-- 
2.34.1

