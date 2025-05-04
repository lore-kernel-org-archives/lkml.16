Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341C012CD96
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 07:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746343041; cv=none; b=SQSM1dD7zBrH9I83ZQGlzavVREMgy3zFx6phbN+I46URDCLZ7cI8nXEF3brkh/fIn2aAgfOeY1kxzF/roTMzUI0hnoyLev0j5vObmGMRBzUFIcV8/IE0GvT9dr8pZuuJDoxvFV3gzmjJQIjsvgQTftwUT6v+hWiOTbAtN+ROYOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746343041; c=relaxed/simple;
	bh=IfWSj28v/LZzHO8JdbzhzYzwEC6EYaY39ikj7t4t63I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HnN+PFVmK2pSEhxQll+HUoeq5zhfwZ5I4i5LnLDaDBJY5CEykQ4lKgVN7gLzmJ9gUCLbeZK6KkHvw4lmbNyGZ0xFKjGKyZwm1mlZwp0NUGQXvFg1oJwJTtLUVBQZeVeyCL2oHK1GxaxPGVoXkt4SKmTL1aoj/vxKY+BtPmSxbUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJRda/lc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJRda/lc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77FC3C4CEE7;
	Sun,  4 May 2025 07:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746343040;
	bh=IfWSj28v/LZzHO8JdbzhzYzwEC6EYaY39ikj7t4t63I=;
	h=Date:From:To:Cc:Subject:From;
	b=kJRda/lclcBsD9NuAWEzQkgFUiY+V1+vmVhWPLeYdTsTPQg3kF7L9fTufxM766nfa
	 ccQepIGzjuKhQuBqfQ9kCxgCmnVKufASbf6YmdAc2QmTr8L/WxW/ZzYtJPR/JVKRtW
	 V4xgAERmLGzwCXj3zLe3r8klG57Y+5m40fsQdKMriZo7NhOY0r2KCNZtoxqxFBzy8I
	 igt9hz6cNovzKBdmWxjhm6sWDzcr8Ik7oVARAt9WXrbrJctkrVknjG7KL2NozIxotd
	 8w8PDcrlbrr0LL8vTP6o1ivd421EuDlv7M08ClG6MNp5apPGdU9UuC4BRznsxeFmHH
	 mVFv1tvMDR4ug==
Date: Sun, 4 May 2025 09:17:16 +0200
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
Message-ID: <aBcUfPw98HOpq61B@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2025-05-04

   # HEAD: 58f6217e5d0132a9f14e401e62796916aa055c1b perf/x86/intel: KVM: Mask PEBS_ENABLE loaded for guest with vCPU's value.

Misc perf fixes:

 - Require group events for branch counter groups and
   PEBS counter snapshotting groups to be x86 events.

 - Fix the handling of counter-snapshotting of non-precise
   events, where counter values may move backwards a bit,
   temporarily, confusing the code.

 - Restrict perf/KVM PEBS to guest-owned events.

 Thanks,

	Ingo

------------------>
Kan Liang (3):
      perf/x86/intel: Only check the group flag for X86 leader
      perf/x86/intel: Check the X86 leader for pebs_counter_event_group
      perf/x86/intel/ds: Fix counter backwards of non-precise events counters-snapshotting

Sean Christopherson (1):
      perf/x86/intel: KVM: Mask PEBS_ENABLE loaded for guest with vCPU's value.


 arch/x86/events/core.c       |  2 +-
 arch/x86/events/intel/core.c |  2 +-
 arch/x86/events/intel/ds.c   | 21 +++++++++++++++++++--
 arch/x86/events/perf_event.h | 11 +++++++++--
 4 files changed, 30 insertions(+), 6 deletions(-)
