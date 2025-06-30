Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842242036EC;
	Mon, 30 Jun 2025 10:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751280965; cv=none; b=BcFiCLiAwNA2+xlu3HbFewEd3oQ9bqM61fPjyoVnBZX7cUawQC7qpNaBipKGeDbU9JhH7d0AuTcV7guP9YkyMm/7a+iv9LnBU+F8VkLnXC4rC8Jk1AOG+KUavmg3q8NCrME+aAnV6efWQzfb85SXkoUu+oGgKRtjvDx2gyqWEXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751280965; c=relaxed/simple;
	bh=m1e2jP99pIwoQ8AWABazqche6407sbJa8/waUENtyX0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eD5kE0F8ZmxMf/7w02SfG6iIGQnu5z1CY1xxJwIf6TbzD2hStKfjXg5fm3f4uGaKJ//3Gi2KvZsVRgtD3rxHZRoPVBPeKu1pqkA9hCJqsor93cy6L5j9jqkxyRw3NEAWVVUdWgfGqhq/tobOpSZG0FcfHAQl1HYVBmcy32oWR+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12D581F60;
	Mon, 30 Jun 2025 03:55:47 -0700 (PDT)
Received: from oss-apollo7005.oss.cambridge.arm.com (oss-apollo7005.oss.lab.cambridge.arm.com [10.7.15.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E5C23F6A8;
	Mon, 30 Jun 2025 03:56:01 -0700 (PDT)
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	luke.parkin@arm.com,
	philip.radford@arm.com
Subject: [PATCH v2 1/3] firmware: arm_scmi: Add debug decrement counter
Date: Mon, 30 Jun 2025 10:55:41 +0000
Message-Id: <20250630105544.531723-2-philip.radford@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250630105544.531723-1-philip.radford@arm.com>
References: <20250630105544.531723-1-philip.radford@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create scmi_dec_count function to decrease any of the Arm SCMI
debug counters. There is already an scmi_inc_count function
but no decrement function.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Philip Radford <philip.radford@arm.com>
---
V1->V2
- Amended commit message
---
 drivers/firmware/arm_scmi/common.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index dab758c5fdea..c6495c4a0e8a 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -314,6 +314,12 @@ static inline void scmi_inc_count(atomic_t *arr, int stat)
 		atomic_inc(&arr[stat]);
 }
 
+static inline void scmi_dec_count(atomic_t *arr, int stat)
+{
+	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_COUNTERS))
+		atomic_dec(&arr[stat]);
+}
+
 enum scmi_bad_msg {
 	MSG_UNEXPECTED = -1,
 	MSG_INVALID = -2,
-- 
2.25.1

