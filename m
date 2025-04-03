Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEE46253325;
	Thu,  3 Apr 2025 17:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743701294; cv=none; b=R12VA9vMxbd/lzit3wJaaiUWtBY3VOuLly8FSD1e74WUtCleLF90I4MuyTrM4mu+J5gP+7KJk2dQMQWfvtwPvSBzpN4IF6fV0+Nglvcyctk2oJwiEboOy8uM4bn6trJmSBC7Qi+1AZhQKyxgoWwdhaZTdEeVop7/P8h15gqNumA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743701294; c=relaxed/simple;
	bh=hN+y3QBy+q08YTbzo2h8nnqf74NveFeQ628u2dLSsWo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pGo2eQaFwQpCv0rfjLLsuPl8udmarllMuDndPSBuOQnC3rwBQHhle/ZB7992cCrHEdUPBRFk9oIwUME/IgDtIvqQVOEJln2CcVjlo3wtJslA5FPhaWqI7CFpIGxo8BjzjEXLOnlRNjRQYmCELL10cS9p0x4kciqxRVV29PCrEfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 143C8106F;
	Thu,  3 Apr 2025 10:28:15 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7C9CB3F63F;
	Thu,  3 Apr 2025 10:28:09 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	yury.khrustalev@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	shameerali.kolothum.thodi@huawei.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	huangxiaojia2@huawei.com,
	akpm@linux-foundation.org,
	surenb@google.com,
	robin.murphy@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	nd@arm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v2 3/3] tools/kselftest: add MTE_FAR hwcap test
Date: Thu,  3 Apr 2025 18:27:58 +0100
Message-Id: <20250403172758.67106-4-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403172758.67106-1-yeoreum.yun@arm.com>
References: <20250403172758.67106-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

add MTE_FAR hwcap test on kselftest.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index 35f521e5f41c..a539eeb0bfc0 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -1098,6 +1098,12 @@ static const struct hwcap_data {
 		.sigill_fn = hbc_sigill,
 		.sigill_reliable = true,
 	},
+	{
+		.name = "MTE_FAR",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_MTE_FAR,
+		.cpuinfo = "mte_far",
+	},
 };
 
 typedef void (*sighandler_fn)(int, siginfo_t *, void *);
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

