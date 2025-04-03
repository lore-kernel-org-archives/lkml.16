Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ECF524EF84;
	Thu,  3 Apr 2025 14:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743689748; cv=none; b=KeDdHmh344G1Eqx7z8crSlNJ6L2ycNbWraKLbFvJVb3uZyOZfhIc4FUg2lkkux8Z7Ipv3Syq3LjzJeWXcrjPR4oq7BIp1sfUCnl87qbmKHJIsfln/MM2oBB1T/wSE3jmMN2K3jQ4JQNoYy+gDoNcFje5Zx1NHfedApSLOw2sWWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743689748; c=relaxed/simple;
	bh=Cu6vyjAcsHGGnNxMtIE3kuLzydf3c25qwh03vaA9PuI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aC2htEolY/8HFrb5HzGwhg7DDkZFD6CtJ9zQ4JvSWjAqBIClUGmIkvoHcHIi0DU1VOKb/rxBQMPKQ5jJMjb9tINa1dGxQ4Ca0VM+SV1ZQ9N9Sef/umo6CZ5pharEQWeoN+apAvclsJYBPMMNyvmIehdHqH1LX1F2OggKNLxzRYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58DCB1BF7;
	Thu,  3 Apr 2025 07:15:49 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F35003F59E;
	Thu,  3 Apr 2025 07:15:43 -0700 (PDT)
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
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 2/3] arm64/mm/fault: use original FAR_EL1 value when ARM64_MTE_FAR is supported
Date: Thu,  3 Apr 2025 15:15:34 +0100
Message-Id: <20250403141535.23496-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403141535.23496-1-yeoreum.yun@arm.com>
References: <20250403141535.23496-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the original FAR_EL1 value when an MTE tag check fault occurs,
if ARM64_MTE_FAR is supported.
This allows reports to include not only the logical tag (memory tag)
but also the address tag information.

Applications that require this information should install a signal handler with
the SA_EXPOSE_TAGBITS flag.
While this introduces a minor ABI change,
most applications do not set this flag and therefore will not be affected.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/mm/fault.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index ec0a337891dd..8d10603e574f 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -837,9 +837,12 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
 	/*
 	 * The architecture specifies that bits 63:60 of FAR_EL1 are UNKNOWN
 	 * for tag check faults. Set them to corresponding bits in the untagged
-	 * address.
+	 * address if ARM64_MTE_FAR doesn't support.
+	 * Otherwise, bits 63:60 of FAR_EL1 are KNOWN.
 	 */
-	far = (__untagged_addr(far) & ~MTE_TAG_MASK) | (far & MTE_TAG_MASK);
+	if (!cpus_have_cap(ARM64_MTE_FAR))
+		far = (__untagged_addr(far) & ~MTE_TAG_MASK) | (far & MTE_TAG_MASK);
+
 	do_bad_area(far, esr, regs);
 	return 0;
 }
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

