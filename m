Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5601A23C8C7
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 15:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747064480; cv=none; b=aC9s2w5SudyrBdhWxLv0R6b/QH0ERYO77iew3XwDOkpjzE30hcuDmjLUNQf0WZ7+ZZSRHaHZ6za093DVXqfyVgTKZTScfO8x6V49BhEQ407EwccP8Nxl/0C3Jx+SXBtSJIxwHp9MIPoL3CtDQq8h42oiQnGvU01GX3vr0C/5Du8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747064480; c=relaxed/simple;
	bh=N0MpQhH8phT9k7dCAlzbL7nHVhr5PZhCzdU1h1D3z9E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sk7Kod1r4NznzSt/ejYIkSMhWN/NThaY6e499UfUYn/5w3TFwpWsCgq4HLAUx0I2kxP/ahgQuQejw6x20nCLlAuuh33gpfZdSJcSnM3FIN9qzXnD1OpAY7UW/ejOh8JgfyunEzqTmkkU6Ad7vUuAUTMoLzl8buJUC89DIYXwNWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 770A0150C;
	Mon, 12 May 2025 08:41:07 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0CD8D3F63F;
	Mon, 12 May 2025 08:41:16 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 0/5] coresight: Fix device registration and unregistration
Date: Mon, 12 May 2025 16:41:03 +0100
Message-Id: <20250512154108.23920-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is to fix device registration and unregistration.

The first patch addresses the resource is not released properly for a
failure case during a device registration.

The second patch is to use mutex to protect unregistration flow.

The last three patches are for refactoring.  Patch 03 explicitly uses
the parent device handler.  Patch 04 separates the success and failure
flows for code readable and easier maintenance.  Patch 05 improves the
error handling by invoking specific functions for resource cleanup.


Leo Yan (5):
  coresight: Correct sink ID map allocation failure handling
  coresight: Protect unregistration with mutex
  coresight: Explicitly use the parent device handler
  coresight: Separate failure and success flows
  coresight: Refine error handling for device registration

 drivers/hwtracing/coresight/coresight-core.c | 67 +++++++++++---------
 1 file changed, 37 insertions(+), 30 deletions(-)

-- 
2.34.1

