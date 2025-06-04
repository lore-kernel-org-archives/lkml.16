Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF75F320F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 18:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749063297; cv=none; b=Klcp6HS8rszhz37OaSQCqmWxQ+EAmNpIp5OafZTAtcb4pwjTuqv+wpNCDpwmXVpCY6IxA0b1VtoUqzToCvXsyG4DM+NBUcu9LFfdf07Qi/KDjdAjXIJR3mctnmTAq6ny10ugnz6zc4L4cmtkog/EJ3RXLXOoOhGz92DwUnejrw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749063297; c=relaxed/simple;
	bh=ulrMt2J3mWVFWJI6mwV5q4GOYMWQW089wjWIyDr66f0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oKOhRmVEuyGIzF2fIhS+C/UjgS1xRDypH6dPI1vvoenh5EHJM0pHzdCaWA4SUkoArmiFApHEPvld88V9ITzHs42ImlzAymOdsZvnehTTNOXIKiPDLH9TYnDrlORhe5IecLlBKZ4Y+8C312Trbt1eqfqTB9/etpoqgputPgGDrSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rAigJKNk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rAigJKNk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851E2C4CEE4;
	Wed,  4 Jun 2025 18:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749063297;
	bh=ulrMt2J3mWVFWJI6mwV5q4GOYMWQW089wjWIyDr66f0=;
	h=Date:From:To:Cc:Subject:From;
	b=rAigJKNkO5CLYkrGK7xZHxBDZzH8PZIDT2aR3hZjyVUDG52H4eHF3r5AJ8D/wn1vB
	 bIDjUdQWH7qpRdejOB91P88W6WEb5BwCQRPE3nXhk0VslRye9MPSLQOvCUtjRj2KZS
	 aBz5Oes0YrPqRTAWmH57P1P/+M/XNYlBUUDovQ4y7WMGrRX85PM+tyGvUldV5d3Ios
	 pPX7zJ/5xaBaNdC7/34JzB0riny7yWw33GgI68KJWx0PvVur+39oIA6E9DQeyIFTQT
	 1miwV9vnUQYZ0Kl0j7RHPeZ3Bxag3LFnP5+jgudFN2f+PfPEh6dSdMaZ7z16n2bVuF
	 Snx/6c00J2MzA==
Date: Wed, 4 Jun 2025 08:54:56 -1000
From: Tejun Heo <tj@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, David Vernet <void@manifault.com>,
	Andrea Righi <arighi@nvidia.com>,
	Changwoo Min <changwoo@igalia.com>
Subject: [GIT PULL] sched_ext: Fixes for v6.16-rc1
Message-ID: <aECWgEYwOhciTIuk@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0f70f5b08a47a3bc1a252e5f451a137cde7c98ce:

  Merge tag 'pull-automount' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs (2025-05-30 15:38:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git/ tags/sched_ext-for-6.16-rc1-fixes

for you to fetch changes up to 9960be72a54cf0e4d47abdd4cacd1278835a3bb4:

  sched_ext: idle: Skip cross-node search with !CONFIG_NUMA (2025-06-03 08:22:27 -1000)

----------------------------------------------------------------
sched_ext: Fixes for v6.16-rc1

Two fixes in the built-in idle selection helpers.

- Fix prev_cpu handling to guarantee that idle selection never returns a CPU
  that's not allowed.

- Skip cross-node search when !NUMA which could lead to infinite looping due
  to a bug in NUMA iterator.

----------------------------------------------------------------
Andrea Righi (2):
      sched_ext: idle: Properly handle invalid prev_cpu during idle selection
      sched_ext: idle: Skip cross-node search with !CONFIG_NUMA

 kernel/sched/ext_idle.c | 37 +++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

-- 
tejun
