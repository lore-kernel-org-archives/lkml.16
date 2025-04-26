Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6947817E4
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 08:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745656524; cv=none; b=mqIWwPJmBKr+ehMQok3Hze/XM8zJqwuX6ZP+gGLBTdm7yslTz4isClqdYCqq6tUZOLDjQcghu6lAwW1iyx6PTMIVKMFYNdm9bYAulPK6uV8gEv7bpm9BAG8q26V3r7O0TaVHQp8HhDMQW1H9EjblaB2Iu0MdhSY1fkYq8NnMPKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745656524; c=relaxed/simple;
	bh=377LGz3CWCtgUSJU42DXe+e7l15YKia4DizN0pV8Wic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pnGN/pbdJPCZndJwMm0TI4i9eurqamf+XDHfbgUKlPtPL+A36cLMRmsUlM2wpXIn1JuUUmM5q+eZj5Dyqf4DpehqqROPB6jGKIkQXixD4p2p+dEjFk3sAbCiv9I/RwUHG5FaguuUJ2fFhPhjgu4At8I4O0uPWKKWquBJpwV40zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZ9x3nLi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZ9x3nLi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC00C4CEEB;
	Sat, 26 Apr 2025 08:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745656523;
	bh=377LGz3CWCtgUSJU42DXe+e7l15YKia4DizN0pV8Wic=;
	h=Date:From:To:Cc:Subject:From;
	b=IZ9x3nLipYumhueCOfSRrntNzI7TG6wZ16qwHxX7IdQ8BgRyyyMNJcneE/zTq14qW
	 VjV655eZHI8LHTDSI6yvEw6QlCY5UMT056dTHtoxDjidGIHayHOatu1cFFYxr8aQsb
	 aYz+mWhfeJ30Qb3lE79HOYWoev/9sIqqKBIXOiIu/TsXxMYi9AZ1abzwk3N6QjMIbB
	 leoEkv3oLzb5SNdm15VLm97w3EftBL8ebuTCRSrhCkCpACAfXsykUrF5cpn1jJR1oH
	 5+vtFBrAluyvqKEWik+ccbebXppzTbNBDcBFI3fJnsfIbyXiO+czxnh+KFqjHMcggB
	 hJdSayIZVIFFA==
Date: Sat, 26 Apr 2025 10:35:19 +0200
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
Message-ID: <aAyaxzfTUuhDbFhH@gmail.com>
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

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf-urgent-2025-04-26

   # HEAD: 1a97fea9db9e9b9c4839d4232dde9f505ff5b4cc perf/x86: Fix non-sampling (counting) events on certain x86 platforms

Misc perf events fixes:

 - Use POLLERR for events in error state, instead of
   the ambiguous POLLHUP error value

 - Fix non-sampling (counting) events on certain x86 platforms

 Thanks,

	Ingo

------------------>
Luo Gengkun (1):
      perf/x86: Fix non-sampling (counting) events on certain x86 platforms

Namhyung Kim (1):
      perf/core: Change to POLLERR for pinned events with error


 arch/x86/events/core.c | 2 +-
 kernel/events/core.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
