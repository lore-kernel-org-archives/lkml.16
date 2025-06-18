Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2235628541B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750239011; cv=none; b=lDhhlNNwwXKyIxujx4IbEky216A6v4dB+Oi+/GmXYRKT8b+j9YHdb4RZrJ5I+VrQuyPrP4OKQodWpT1tCvmShdIxvjrKEHtiJkhRQZgDsufMKeyHaRoEaOA1jSGfTJphHKdzLrtzgksaSIgwz59ip8jZWOSWtITAOwG8osUqJ8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750239011; c=relaxed/simple;
	bh=qWDgYU9GjYEy2tejugw8ZczCVa9XsBOTxffWoLLYfZk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nh+7UBGifNXc/iR/7BqIdnzAYLBVmmcv4NaRAaYoGx1wwtOYA6USjpCogJnzbTqkDHfEtkxD9vkbUPW2Dx6iD5khfTVjbZqKK1huHIhL/tpeTqTLbJRymh+9q6ouD/6xoieDwsoQIrU/nQ9Juf9XvhZrilwTWlRoZHAEINlqzyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E57441D13;
	Wed, 18 Jun 2025 02:29:48 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3B2513F58B;
	Wed, 18 Jun 2025 02:30:06 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	hardevsinh.palaniya@siliconsignals.io,
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
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v7 2/8] prctl: introduce PR_MTE_STORE_ONLY
Date: Wed, 18 Jun 2025 10:29:51 +0100
Message-Id: <20250618092957.2069907-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618092957.2069907-1-yeoreum.yun@arm.com>
References: <20250618092957.2069907-1-yeoreum.yun@arm.com>
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
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 include/uapi/linux/prctl.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 43dec6eed559..f6fb137c407f 100644
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

