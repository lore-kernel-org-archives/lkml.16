Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F128D15442A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745008349; cv=none; b=mHIMMFvdGHtv8OmRE1T6L7wDmg3AsKcrgJTRLiPILTwuJPWTSomHvxeqmbcNAuadp7zua3g9jV4uQ0HhJWr1A65gYHDh2kyweYUu6gmb25pKXxJvS/o7VHf8cFAlTjNoz+ZYj1pfZNK+ixiHwIAPW1Hrwko/00YCctyBDHPWS6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745008349; c=relaxed/simple;
	bh=nmhfbdHUxr8c4edcyqBH6hC4F2n0E5rmeiTK6XzLn8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MzosCoPiAH4nsP+qifk3ccwD/afomCMeOxdj6kjgNZUB6g21NVaacmpXCSJpC+Mnci0y/gYxV5THL25RQhw6lljRMYayRXh93iz0315c41ckvV3CWdUflNaAmEu2n7arxQQiFYINSRJ3qhy3cNlZFS5ElS6b2u+LZoAW9v1ToMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7p0G02L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7p0G02L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9549AC4CEE2;
	Fri, 18 Apr 2025 20:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745008348;
	bh=nmhfbdHUxr8c4edcyqBH6hC4F2n0E5rmeiTK6XzLn8A=;
	h=Date:From:To:Cc:Subject:From;
	b=f7p0G02LPIYidrk+ESfa+1e39iJ2imkzASS5ZkElCyNFSjTBQNINmvR7ezh6xDVip
	 UllK5FY3JtwMvwJEmMpthsJDaS1x7A7Vfk38vtamBy36PGZ4HVsmPM9sTtkANEnwoZ
	 /yxZjAqEi3upzBypL30fcdx0k1B2B/YgASpZ/z+gd3mh8RiCqp7QWcFffKwO5/CgLh
	 suEqOoeQKbGMZQsuenmxHkggX52WLBKVZ3kdft4mhqNk41pEIe9AGmiYYpzhmnImUM
	 W1AnqSKyTw1SjtQpmVkKJKA36OIjvc7yW9t72sxhr9kDCSPnqiW8weolN+sw4rfhvf
	 B6FuBt9ZiuSFw==
Date: Fri, 18 Apr 2025 22:32:24 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kan Liang <kan.liang@linux.intel.com>
Subject: [GIT PULL] perf events fixes
Message-ID: <aAK22APMK-OSzROm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest perf/urgent Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2025-04-18

   # HEAD: 7950de14ff5fd8da355d872b887ee8b7b5a1f327 perf/x86/intel: Add Panther Lake support

Miscellaneous fixes and a hardware-enabling change:

 - Fix Intel uncore PMU IIO free running counters on
   SPR, ICX and SNR systems.

 - Fix Intel PEBS buffer overflow handling

 - Fix skid in Intel PEBS sampling of user-space
   general purpose registers

 - Enable Panther Lake PMU support - similar to Lunar Lake.

 Thanks,

	Ingo

------------------>
Dapeng Mi (2):
      perf/x86/intel: Don't clear perf metrics overflow bit unconditionally
      perf/x86/intel: Allow to update user space GPRs from PEBS records

Kan Liang (4):
      perf/x86/intel/uncore: Fix the scale of IIO free running counters on SNR
      perf/x86/intel/uncore: Fix the scale of IIO free running counters on ICX
      perf/x86/intel/uncore: Fix the scale of IIO free running counters on SPR
      perf/x86/intel: Add Panther Lake support


 arch/x86/events/intel/core.c         |  24 ++++++--
 arch/x86/events/intel/ds.c           |   8 ++-
 arch/x86/events/intel/uncore_snbep.c | 107 ++++-------------------------------
 3 files changed, 35 insertions(+), 104 deletions(-)
