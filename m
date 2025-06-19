Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6D1231A37;
	Thu, 19 Jun 2025 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335627; cv=none; b=pcjpx1FQrHuwnPvx8dhMR1YtKOrB4Gb/298Wk2B7ZxtzenqEfyCLD2Em9tBWhPrauo5BImDazmNfLrEjSdm+A9v1V+X4+q9MVAXK4DCqF/WQla7wCuSYdJZkX7jJDqOW1ZUmduYgg5KOh4ac6a+eU/+3JfHexKlmdhZvkYqA15c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335627; c=relaxed/simple;
	bh=NrULrQCGWhTjm0RiyC0yWmVThZOQ14NRWGtdjTK+Ozg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uLyA6VlPJVIE7B8n/rb23VuYjQupk1ukm0Skn9EmK9dQVKCze6VB3DG77sBPe5yAz7Z5nSbpP/xuRyzrDqhvmalln4mk1ZlqhX2sUWilftlnBaSFexXu9KTOnV8f16i5REVpBxtGgEDL81WOx0TKSgB4/+v6yAq0S4Xt2rSbKhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAD9D12FC;
	Thu, 19 Jun 2025 05:20:04 -0700 (PDT)
Received: from oss-apollo7005.oss.cambridge.arm.com (oss-apollo7005.oss.lab.cambridge.arm.com [10.7.15.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3F103F66E;
	Thu, 19 Jun 2025 05:20:23 -0700 (PDT)
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	luke.parkin@arm.com,
	philip.radford@arm.com
Subject: [PATCH 1/4] firmware: arm_scmi: Add debug decrement counter
Date: Thu, 19 Jun 2025 12:20:01 +0000
Message-Id: <20250619122004.3705976-2-philip.radford@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250619122004.3705976-1-philip.radford@arm.com>
References: <20250619122004.3705976-1-philip.radford@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create scmi_dec_count function to decrease any of the Arm SCMI
debug counters

Signed-off-by: Philip Radford <philip.radford@arm.com>
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

