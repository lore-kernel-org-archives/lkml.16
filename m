Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F236A43ABC
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 11:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748170959; cv=none; b=IA2nZbVyFmNAc2FCy6ox6EV0O7ZedtQt/k/aZdnSv1mrRiUFQaG1+MXImwlJZrOhwYnONFwydQ4IF/UTWNnQUR53hBvKfy73NYnCuGMQ1MUdgTSmZsnYmdI+3ufXM7MuwU1vlxcEIij0peigjEy0nYU6j1daPyDhlpWwGOnTCk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748170959; c=relaxed/simple;
	bh=O2DADDmI1Uow4aS6YfWYlvohU2l7umqt5nNj5GWvg6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bzOOgJvyDanfOirJ+YD/U443ojwQYuz8dYPUXCvf2G/u0/hXkiEbp6dQS122S5W+Q+VHqml5t4W1ZE0CNXXVwkjkWALj/bkEk4Dl5rCAzq2s5naTO6+j6Eef+Mkphru8X8E4I1SYoGHTk+drWuURx9uZuC/3fHNEovPcnGagciY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpGXBgNg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpGXBgNg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BCD0C4CEEA;
	Sun, 25 May 2025 11:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748170958;
	bh=O2DADDmI1Uow4aS6YfWYlvohU2l7umqt5nNj5GWvg6Q=;
	h=Date:From:To:Cc:Subject:From;
	b=gpGXBgNgGxujnLNOIJE/mcyKajr55XcQZfgiLL8g7CxCWkN3atx4wzf6Dan6UcdBZ
	 NlO1JnEwRsTf/oaTUijjZJbuIe5eCRwCkU+lqGqLAC6JmDPb8221/WPYWHL6Js0BSF
	 mNZ4buRRHSNApN8gR0wmWJgjJWBeZI1quvZZf9pWT7NZyp0Jwms3GzknPMQSd+LZiE
	 aM+pRGxpX8TEry8Xd8jOOieYRi9Hpwt8SKpQq9E9lWzu4ltQQZzWwDiFbKBhWJS+oX
	 /uOsH8rdvLCrWS9gaGHVZ8CcqvphaTSbpU2V0gKjG61m3Uivos0dgBWayuUO/NJlLc
	 kWrpoNQGubElA==
Date: Sun, 25 May 2025 13:02:34 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>
Subject: [GIT PULL] x86/cleanups for v6.16
Message-ID: <aDL4ytA2gUlF2kaB@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest x86/cleanups Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-cleanups-2025-05-25

   # HEAD: f449bf98b7b63702e86155fe5fa3c853c3bf1fda x86/power: hibernate: Fix W=1 build kernel-doc warnings

Misc x86 cleanups: kernel-doc updates and a string API transition patch.

 Thanks,

	Ingo

------------------>
Ruben Wauters (1):
      x86/CPU/AMD: Replace strcpy() with strscpy()

Shivank Garg (2):
      x86/mm/pat: Fix W=1 build kernel-doc warning
      x86/power: hibernate: Fix W=1 build kernel-doc warnings


 arch/x86/kernel/cpu/amd.c  | 2 +-
 arch/x86/mm/pat/memtype.c  | 1 +
 arch/x86/power/hibernate.c | 6 +++++-
 3 files changed, 7 insertions(+), 2 deletions(-)
