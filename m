Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E88420C030
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 17:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746810396; cv=none; b=Jpeogg/nyfJBcStNvOQxkInWdLyCnMm+QKKfTRkQWTYoK+5P5aATTAKRWQU9SjLCrowgbHbwhVgJ9Mo+XUDV6FDTEcD1hdSzutjWXnLDVv77CrlVdxLbYLXaSDXVVKvaR7kob0lIzjhIRrj3sVCrXkKsy+fiQlqRVU49Wvl18Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746810396; c=relaxed/simple;
	bh=bLrG4AeCKcaCZecQ3OBE7o5nVNNOZXHqtgg2+3E4HV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rSqAU3g9oJq33SUX+OwhbP4Plru2orI5+Gn//Kjqwh4lWJ8wDsegTPkk9WdOox3t2/at6+CAbj8gn++S39dWFxOMgSz4S9gxw3/uj4JUhHUs4BRQfwuzqpKXCXpFChVqeQrwhY0EXbm+rSruw9A46gfGdE4mf0JOPqOv+y5kakQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M4Z87hja; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M4Z87hja"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B5FC4CEE4;
	Fri,  9 May 2025 17:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746810396;
	bh=bLrG4AeCKcaCZecQ3OBE7o5nVNNOZXHqtgg2+3E4HV0=;
	h=Date:From:To:Cc:Subject:From;
	b=M4Z87hjapxMsxwQN5+tN7SFmT+BSolRWLPpHPkxTCYYqJdJj0YZ8OLr/9hah/T+/T
	 qYmpwEiqTyuMPwXDpOSuSO20hz1aS0LD5R0KCxYvGpIN+3IWPnScjDtft3lrmsZ2+P
	 91Ex18SojWYhgxx9r/g/7FuIngP6XcvyH/Y+48px4wQVPtKhSaoNQQiVStEs8rGelf
	 JLfDRuXB4dExsJm7hjSv/OD3V4uPOnMOa8BaQebqxo18kS8NYLT/YWywBIwX5+kAjM
	 GVIb8lWbl6qkl2uzqYzhSIfSdX64a16KkFNnAQbvhlgFnrBL/ilr6/SWfibVGWruZM
	 bOk7u935yI9ZQ==
Date: Fri, 9 May 2025 18:06:32 +0100
From: Catalin Marinas <cmarinas@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 6.15-rc6
Message-ID: <aB42GJfIypFqk9aC@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull the arm64 fix below. Thanks.

The following changes since commit fee4d171451c1ad9e8aaf65fc0ab7d143a33bd72:

  arm64: errata: Add missing sentinels to Spectre-BHB MIDR arrays (2025-05-01 17:44:18 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to 363cd2b81cfdf706bbfc9ec78db000c9b1ecc552:

  arm64: cpufeature: Move arm64_use_ng_mappings to the .data section to prevent wrong idmap generation (2025-05-06 11:43:44 +0100)

----------------------------------------------------------------
Move the arm64_use_ng_mappings variable from the .bss to the .data
section as it is accessed very early during boot with the MMU off and
before the .bss has been initialised. This can lead to incorrect idmap
page table.

----------------------------------------------------------------
Yeoreum Yun (1):
      arm64: cpufeature: Move arm64_use_ng_mappings to the .data section to prevent wrong idmap generation

 arch/arm64/kernel/cpufeature.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
Catalin
