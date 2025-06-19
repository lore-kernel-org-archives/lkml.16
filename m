Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D251E7C32
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 16:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750348895; cv=none; b=A1glkOtwraImdEt4rzbLmxY8QP9EpXqvhFiVugxGflkrsMhPcBeXW3r/NpeBMpU2tnf2IyWw48fVRoCdM88NoyRp0NeoXOQgQCUTVRYZS+32auaLqISMic0wLh0vIFnzpFst/DYXGW4+pDVZ5HhW7iD6R7oJ/zgqlfztdJJsQqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750348895; c=relaxed/simple;
	bh=rx45QH0iRei07Fniv/H9HO3HlRDHtCVONgmLzkkkiJI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uvOQu4/2J7gsyBYg1QczIdkZ+wvV9B2tclJTFCrPhjvQaeeBklANI3AuoJ0EbQBWmqm2fCbzs+CMex15x4Sqm31/MgdozVGTxbCnuI8KfusqQYeYjTCHYQibTLqOQPEeIeIlccXfpX4Bu5A8zgPlK7qwWjV2wlMW8EimjPwAeOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F883113E;
	Thu, 19 Jun 2025 09:01:12 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0185B3F66E;
	Thu, 19 Jun 2025 09:01:30 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 0/2] Improve POE handling for uaccess
Date: Thu, 19 Jun 2025 17:00:40 +0100
Message-ID: <20250619160042.2499290-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This short series attempts to approach POE (Overlay) faults consistently
w.r.t. uaccess. We currently assume that spurious Overlay faults are
handled by retrying the access [1], but this isn't the case.

Patch 1 ensures that spurious Overlay faults are indeed ignored. This
being done, it typically isn't worth using an ISB when writing to
POR_EL0. Patch 2 removes the remaining ISB in the signal handling code.

Patch 1 changes the fault handling logic to rely solely on POR_EL0 and
VMA metadata to determine if a pkey fault occurred, instead of the
Overlay bit in ESR_EL1. The rationale is detailed in that patch; it
is worth noting that powerpc made a similar change but for a different
reason [2].

[1] https://lore.kernel.org/linux-arm-kernel/ZtYNGBrcE-j35fpw@arm.com/
[2] https://lore.kernel.org/all/20200505071729.54912-3-aneesh.kumar@linux.ibm.com/
---
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Will Deacon <will@kernel.org>
---

Kevin Brodsky (2):
  arm64: poe: Handle spurious Overlay faults
  arm64: signal: Remove ISB when resetting POR_EL0

 arch/arm64/kernel/process.c |  5 +++++
 arch/arm64/kernel/signal.c  |  7 +++++--
 arch/arm64/mm/fault.c       | 30 +++++++++++++++++++++---------
 3 files changed, 31 insertions(+), 11 deletions(-)


base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
-- 
2.47.0

