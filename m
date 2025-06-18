Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C56280330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750239025; cv=none; b=JCbFq1L20Bf6uS5vhrRzTWRa2+N3XFpEPHYayTNKfBz7DfMNABTdCSaH9pXdz6A/6ypM2sAm5qGdrTmVRWZpJUc/MxrVEeXBaUyrvX6kY8R5iEbB/pAAfBZy3Wejtq+UzQfem9Jm8eO6M7O+buLbQWzN9gPP56Q01zS6nrQgjuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750239025; c=relaxed/simple;
	bh=/MdH+7ST7aOwqAS6gtG4n/fMsoPz47C1sds1az0EVrE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GOjUEsSMOQ/GBw1sKTiOfNJzk87+2bHTpzw4/TfYmPlh/DtLWOkhPOikr2KDvZwV9LOfs8XwVrHYhXOHYhuDj9lObqBdFGH7QFeOKT2XTlQG5JbcsZckfjwOY30viFLQOnMX/NxIiRMDfNUBkadk5tOgBrkTRVHiX3/J7zCOys8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D20114BF;
	Wed, 18 Jun 2025 02:30:03 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8774F3F58B;
	Wed, 18 Jun 2025 02:30:20 -0700 (PDT)
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
Subject: [PATCH v7 6/8] kselftest/arm64/abi: add MTE_STORE_ONLY feature hwcap test
Date: Wed, 18 Jun 2025 10:29:55 +0100
Message-Id: <20250618092957.2069907-7-yeoreum.yun@arm.com>
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

add MTE_STORE_ONLY feature hwcap test.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index e60bfb798ba2..42b59a994bd0 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -1104,6 +1104,12 @@ static const struct hwcap_data {
 		.hwcap_bit = HWCAP3_MTE_FAR,
 		.cpuinfo = "mtefar",
 	},
+	{
+		.name = "MTE_STOREONLY",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_MTE_STORE_ONLY,
+		.cpuinfo = "mtestoreonly",
+	},
 };
 
 typedef void (*sighandler_fn)(int, siginfo_t *, void *);
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

