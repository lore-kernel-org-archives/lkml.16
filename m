Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F213F252906
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 17:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743702446; cv=none; b=SK61I99gVu/XMBSbdk+hoTBbU/lprsHi1p693wn2NusUCSUwV//a/jVJdztc44wuGigfWiTHE/8n9WeGUK8lPrTA871R1uLJmfj8sYd0RXlqgHUO/iU4zKsB7V2HZ3NXemlrgXTuca29z7A/FFRyj+DAKZtPU2O+0jUS525cvkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743702446; c=relaxed/simple;
	bh=L0zaOj5o13xR5jbFWehlI7DGmTMxzyZwV/9ij8UcDas=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rlgBr7xWdA8jD5BpxaJgdkejTP1Etw8f7V+3MHyGCWx2BCO6TIcJ1SVZ3DhWaBXwwFsw7/Ada3A0EKDX9DL4MIX4VH3s0zlGGINrKD+eWctoVyZkFunBWmjhW0Q2J+bri8AWV79qG+3t1DtJ51M6JUiAO9KSAtbpE6XDgs7g/bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D923F15A1;
	Thu,  3 Apr 2025 10:47:26 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 813793F63F;
	Thu,  3 Apr 2025 10:47:20 -0700 (PDT)
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
Subject: [PATCH v2 4/4] tools/kselftest: add MTE_STORE_ONLY feature hwcap test
Date: Thu,  3 Apr 2025 18:47:01 +0100
Message-Id: <20250403174701.74312-5-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250403174701.74312-1-yeoreum.yun@arm.com>
References: <20250403174701.74312-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

add MTE_STORE_ONLY feature hwcap test.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index a539eeb0bfc0..32385f67498e 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -1104,6 +1104,12 @@ static const struct hwcap_data {
 		.hwcap_bit = HWCAP3_MTE_FAR,
 		.cpuinfo = "mte_far",
 	},
+	{
+		.name = "MTE_STOREONLY",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_MTE_STORE_ONLY,
+		.cpuinfo = "mte_store_only",
+	},
 };
 
 typedef void (*sighandler_fn)(int, siginfo_t *, void *);
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

