Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F0824EF99
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743690443; cv=none; b=i2++AWLKn7xUHJJ+tRqZl2eCGd6gPk0E6hcttjazcMMMzB5cI610TTc407w9waJKhYF+tVzTz9cIcoithEaJduI9EMOBsBM7acW43YtYdM2mykatVQZXWBSRRLbk6Vaqi1a86S9vH0bw8ASqqZ1fJY0KZ3s9geV22TQEOd6+SCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743690443; c=relaxed/simple;
	bh=369bwvtiVylIIOkV/f/3osAZWZV4pzU5X5ry2ZDYtJs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gB01JcL1m7kpYekROct61h7VGQfxxJwGu8ZpZZHZ7ehqMtmpngCfR+BqQQtJeKl/U+CyM5PAnpO4NsMmdyLwz698s2MZgr7P8hYRo26yHF6ypcKi2qIcImknF7nWVB6nEHnkqhXOo7Jp6yZdcGjBOdWdR96zEd6NLlkX7mvgwMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DFE315A1;
	Thu,  3 Apr 2025 07:27:24 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9DDB63F59E;
	Thu,  3 Apr 2025 07:27:17 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com,
	huangxiaojia2@huawei.com,
	mark.rutland@arm.com,
	samuel.holland@sifive.com,
	palmer@rivosinc.com,
	charlie@rivosinc.com,
	thiago.bauermann@linaro.org,
	bgray@linux.ibm.com,
	tglx@linutronix.de,
	puranjay@kernel.org,
	david@redhat.com,
	yang@os.amperecomputing.com,
	mbenes@suse.cz,
	joel.granados@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nd@arm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 2/3] prtcl: introduce PR_MTE_STORE_ONLY
Date: Thu,  3 Apr 2025 15:27:06 +0100
Message-Id: <20250403142707.26397-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403142707.26397-1-yeoreum.yun@arm.com>
References: <20250403142707.26397-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PR_MTE_STORE_ONLY is used to restrict the MTE tag check for store
opeartion only.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 include/uapi/linux/prctl.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 15c18ef4eb11..83ac566251d8 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -244,6 +244,8 @@ struct prctl_mm_map {
 # define PR_MTE_TAG_MASK		(0xffffUL << PR_MTE_TAG_SHIFT)
 /* Unused; kept only for source compatibility */
 # define PR_MTE_TCF_SHIFT		1
+/* MTE tag check store only */
+# define PR_MTE_STORE_ONLY		(1UL << 19)
 /* RISC-V pointer masking tag length */
 # define PR_PMLEN_SHIFT			24
 # define PR_PMLEN_MASK			(0x7fUL << PR_PMLEN_SHIFT)
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

