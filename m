Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA55128C876;
	Wed, 11 Jun 2025 18:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749665270; cv=none; b=PDAWPCwYY37xqdSjZ/9kXOdanA2rsWGEsxlEZ8ZUPum1vIv0QL7uK1zBtaNq/aI4WYjwF2nq3YqrUvZRkjzO+MT4t/xYx2IIuqWvvz7iTmY2CGE7ArUStXijzWoMwlg82qJLOEVCFeU8rPT+DZsXNbj11Gm/EUjmMkR7gkSamJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749665270; c=relaxed/simple;
	bh=YVJN70PPzT45Ed+Rn7QD3cSXjFB9D3eO316oNojiBiM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=blfqPO69to2hHkeHJq+QsM1oQQWUvTh6WMLIaiBMrZIcjQ/yflztSeZUtAN9Af39pm2h2VlmStFhKwZZoU3JMhvW7rUnpcxEcnt+CLSzIki+SOe1ZeUfc/9fdVbFFjnO/UUDZagnc33WyvfFFELktHfH7Ku6g1YiO6FYVUDqsJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8566115A1;
	Wed, 11 Jun 2025 11:07:28 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E080A3F673;
	Wed, 11 Jun 2025 11:07:45 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	yury.khrustalev@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	akpm@linux-foundation.org,
	surenb@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v8 3/9] tools/kselftest: add MTE_FAR hwcap test
Date: Wed, 11 Jun 2025 19:07:28 +0100
Message-Id: <20250611180734.63657-4-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611180734.63657-1-yeoreum.yun@arm.com>
References: <20250611180734.63657-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

add MTE_FAR hwcap test on kselftest.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index 35f521e5f41c..e60bfb798ba2 100644
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
+		.cpuinfo = "mtefar",
+	},
 };
 
 typedef void (*sighandler_fn)(int, siginfo_t *, void *);
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

