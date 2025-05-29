Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C50C1DA5F
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 18:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748541838; cv=none; b=jc04Xp/zWaAXyOFL7EWObZbhjWNi6OrL5VE8abq8vvdsAb/EC2t4j7btyJ+qPMCYX9mHEXjBQZrJ7iSq0OA9vmyx24r0GqL6iik2ObM9jneMo7+o/RM/EMNAICoCOcH0zbWl7q7f4VtLDd9WM4Z0uKicUHqaDUN3pCqa/BAEG9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748541838; c=relaxed/simple;
	bh=kgg1cP0v+5nivc/Kt+ZHPR36i7/NI21O3QWYAgV2xiA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k4cmVivMkPq2/dqug5cTeLKLINgX1FDshhirLMzldQ0yWHzngQ/riD/nXvHQ+/7lUO185Rcni2inBaNy7PbhQacrCsnu3NJLrT/7SBFOCMR6c6ys3ai+ardRSOPak5ZE/+L6EJSjHUaUocIoT1VgINkEGo2LdVlzq74KZWPFzL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=egpOeBWE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egpOeBWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748541836; x=1780077836;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kgg1cP0v+5nivc/Kt+ZHPR36i7/NI21O3QWYAgV2xiA=;
  b=egpOeBWE4/yN+T3hBNO69gjpyj4pWzbLT55F4iO3AIQiBFzk213XEHr1
   x3+TVkn3ijwjDaCi311rM0Rww5HUDKI9J9ur6BS5rF5s+YQkvdljaD2Me
   nGT5+dYZCnhsR0w3jkT3yv4zWWu19VUP5yxwXDvHGnCiJzjZLVLm5Ru8G
   7ng/rVbPK/wUY207rRxAAnIFHpTuBqNFCxUqDtS9o3asSnS9n5q3THHAt
   udqFl2323SEWkX3l4BAJnfEZ+96QkfKl78xz2wKDRLcMqWgXs+QZUSF/H
   3y9nncJ0by/6tzUguXhWhqOu8e2Kzcp/nDrsEpm0EDZJVIxGY0E9irhKx
   Q==;
X-CSE-ConnectionGUID: Wfk2RtOSSHG6+6CmlTZe1A==
X-CSE-MsgGUID: Kk6TeOn+Q42Tcw4NKi6wrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="53244257"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="53244257"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 11:03:55 -0700
X-CSE-ConnectionGUID: oMxt29yvRzG0SJOZBvn/lw==
X-CSE-MsgGUID: fPojTukNSJypzPb2y6o5Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="147510831"
Received: from viggo.jf.intel.com (HELO ray2.sr71.net) ([10.54.77.144])
  by fmviesa003.fm.intel.com with ESMTP; 29 May 2025 11:03:55 -0700
From: Dave Hansen <dave.hansen@linux.intel.com>
To: torvalds@linux-foundation.org
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [GIT PULL] x86/sgx for 6.16-rc1
Date: Thu, 29 May 2025 11:03:52 -0700
Message-Id: <20250529180352.1935517-1-dave.hansen@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Continuing the trend of a slow dribble of SGX updates, please pull a
couple x86/sgx changes for 6.16-rc1.

The first one is a no-brainer to use the (simple) SHA-256 library.

For the second one, some folks doing testing noticed that SGX systems
under memory pressure were inducing fatal machine checks at pretty
unnerving rates, despite the SGX code having _some_ awareness of
memory poison. Turns out that the SGX reclaim path was not checking
for poison _and_ it always accesses memory to copy it around. Make
sure that poisoned pages are not reclaimed.

--

The following changes since commit b4432656b36e5cc1d50a1f2dc15357543add530e:

  Linux 6.15-rc4 (2025-04-27 15:19:23 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_sgx_for_6.16-rc1

for you to fetch changes up to ed16618c380c32c68c06186d0ccbb0d5e0586e59:

  x86/sgx: Prevent attempts to reclaim poisoned pages (2025-05-15 19:01:45 +0200)

----------------------------------------------------------------
 * Make SGX less likely to induce fatal machine checks
 * Use much more compact SHA-256 library API

----------------------------------------------------------------
Andrew Zaborowski (1):
      x86/sgx: Prevent attempts to reclaim poisoned pages

Eric Biggers (1):
      x86/sgx: Use SHA-256 library API instead of crypto_shash API

 arch/x86/Kconfig                 |  3 +--
 arch/x86/kernel/cpu/sgx/driver.h |  1 -
 arch/x86/kernel/cpu/sgx/ioctl.c  | 30 ++----------------------------
 arch/x86/kernel/cpu/sgx/main.c   |  2 ++
 4 files changed, 5 insertions(+), 31 deletions(-)
