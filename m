Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B962E49A1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 18:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751481270; cv=none; b=rM2rLMdq/akkoev3DcHrR/U6KwOJYypWfDFtTjE051G8a+nhyh49v1LgTvrizWNK3bhn2boEvQo4WFZ8bo2gSwagdiNx838aWXT7A6zq9S3XLFF3wsntA1j6ffghRnFmPkmwledEbH67Qa6MWken/3bwtGGw8iBoNINaE9B19/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751481270; c=relaxed/simple;
	bh=W+1LKnSzPts7vUVLYIOJmX/od03SFD7CFqT99zKu9gI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CQER/QLyTDRAQmZlYrG8Y5BzOnbfMmE8u2P+ocl8wqqfG8PDp/xpxu+QNjN9a80B/AUUNRPxP7LdGw8dvk/6nddRYEUgcoxz0+VH2m6h1Z8lSJcc2fyZI9uWGdkPbXi/ufFMVjy+SFjvzXLzCbAlsaSSx1IDAnVThjdNUuEL97E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3510C4CEE7;
	Wed,  2 Jul 2025 18:34:25 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: pcc@google.com,
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
	joel.granados@kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/8] support FEAT_MTE_STORE_ONLY feature
Date: Wed,  2 Jul 2025 19:34:23 +0100
Message-Id: <175148125054.2930777.8008346134199454923.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618092957.2069907-1-yeoreum.yun@arm.com>
References: <20250618092957.2069907-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 18 Jun 2025 10:29:49 +0100, Yeoreum Yun wrote:
> ARMv8.5 based processors introduce the Memory Tagging Extension (MTE) feature.
> MTE is built on top of the ARMv8.0 virtual address tagging TBI
> (Top Byte Ignore) feature and allows software to access a 4-bit
> allocation tag for each 16-byte granule in the physical address space.
> A logical tag is derived from bits 59-56 of the virtual
> address used for the memory access. A CPU with MTE enabled will compare
> the logical tag against the allocation tag and potentially raise an
> tag check fault on mismatch, subject to system registers configuration.
> 
> [...]

Applied to arm64 (for-next/feat_mte_store_only), thanks!

[1/8] arm64/cpufeature: add MTE_STORE_ONLY feature
      https://git.kernel.org/arm64/c/33e943a22853
[2/8] prctl: introduce PR_MTE_STORE_ONLY
      https://git.kernel.org/arm64/c/b1fabef37bd5
[3/8] arm64/kernel: support store-only mte tag check
      https://git.kernel.org/arm64/c/4d51ff5bba00
[4/8] arm64/hwcaps: add MTE_STORE_ONLY hwcaps
      https://git.kernel.org/arm64/c/f620372209bf
[5/8] arm64/kvm: expose MTE_STORE_ONLY feature to guest
      https://git.kernel.org/arm64/c/7502bdb43aa2
[6/8] kselftest/arm64/abi: add MTE_STORE_ONLY feature hwcap test
      https://git.kernel.org/arm64/c/964a07426eb8
[7/8] kselftest/arm64/mte: preparation for mte store only test
      https://git.kernel.org/arm64/c/391ca7c81b85
[8/8] kselftest/arm64/mte: add MTE_STORE_ONLY testcases
      https://git.kernel.org/arm64/c/1f488fb91378

-- 
Catalin

