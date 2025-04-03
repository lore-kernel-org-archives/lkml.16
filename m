Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94AA1252904;
	Thu,  3 Apr 2025 17:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743701291; cv=none; b=YggzuDb4Ypt/1mZlfXjMRmCXDOAH5esk9+8lTb8vtrXmQHU1BsYzRN4/N8OlgCbzBZo+dt0by1w4Hd59lRhd36AKrnOe+HllbMFzoH0tpDmWWwx7jw6VAIqzqZBxLufu3VakzCnpwJmXQqOMRTrzpoEvyx+NR2Jt2Xz8gNF29F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743701291; c=relaxed/simple;
	bh=jIPIh1lHsQOSYgLXZXX44bKUpbbsQ11pt9hXUjNS918=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nMBKFJRp5cAp0yCHvSbnX/rcTmZqwEYPwvG23HP2ROOm5Kbl+DoIwdKNp71jHvKcZJdNqrBHXRg70uHpfI2Wvehfc++qsLT1bfvhXcglM6hCUPU0dAxqAGtb6Q2lVNzbGZoi+xaqN9b5Coo6+V2A1ZQcM/qXhUlRkk7MM87OSec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDB5C1C01;
	Thu,  3 Apr 2025 10:28:11 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 510793F63F;
	Thu,  3 Apr 2025 10:28:06 -0700 (PDT)
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
Subject: [PATCH v2 2/3] arm64/mm/fault: use original FAR_EL1 value when ARM64_MTE_FAR is supported
Date: Thu,  3 Apr 2025 18:27:57 +0100
Message-Id: <20250403172758.67106-3-yeoreum.yun@arm.com>
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
index ec0a337891dd..f21d972f99b1 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -837,9 +837,12 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
 	/*
 	 * The architecture specifies that bits 63:60 of FAR_EL1 are UNKNOWN
 	 * for tag check faults. Set them to corresponding bits in the untagged
-	 * address.
+	 * address if ARM64_MTE_FAR isn't supported.
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

