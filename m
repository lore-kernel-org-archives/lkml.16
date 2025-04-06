Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971331EEE6
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 17:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743962059; cv=none; b=NZPLjchIvaB2VG/0t5jZdcOtZPSlL6GKZjXkKRuMXoC6lFcjZ7JZ5QI8Vh+sjeYxjYwK6o7H+/IR51qFClqLEcLVKGG1G8QKYXxfVdUQJ/pZ7EsWxKQms1sOjp/1plRLvHK0BN3g9pkZqvRdjY75mqP3q6EjdZn42Lo+bT7tO1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743962059; c=relaxed/simple;
	bh=yulXsnyvCJCOqhlkoXA0fz2j7jv6duVbr9imQK8/nus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d0HDV8+MZVv+opsJfxEMU08xCMvb5piSYWBCZmOX6tE0BSC0X38SXYBlc8G283xpFnhw9fi0e5ISlQN0G4LbeAh8RratdtrrVM3Wc3oqHXswGy1fI7HJ7JnurcxQ1aQQlgLKOeaC5KzW62IBgwt3MogeI4vQOE2mXVj+a+xugXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTp+kGFS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTp+kGFS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0269FC4CEE3;
	Sun,  6 Apr 2025 17:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743962059;
	bh=yulXsnyvCJCOqhlkoXA0fz2j7jv6duVbr9imQK8/nus=;
	h=Date:From:To:Cc:Subject:From;
	b=WTp+kGFSv4lmO8a9h8bnVfLQFQjYX7OTMtGM2NTOSdFy6Wcif2lTPCvzFKEB8igoF
	 Otuunu6ah8Xtje5t83ZTveA1/FL1MKZjwfg/tTZHGdcO8FozOcblHSY449RtI436ID
	 TKrjIfAQSpkC49RO12khyYprLGDk5jYNixNmfe2/yACXD2i+i+G270O7Ql5FtLUXhg
	 Ycmxo00kQzTpF25mOeMgMK16QOljgbqVRqTfmFiVH2pZt/WqLFXwCoJ2wFk+FgF4JF
	 Z611nNjZO0pNCEx3aebReKRiBKlU1V9vXdGLY5b7ZD7zYTGTUwGYVFsNYxbZu27Qu3
	 6yz2GnwhgAmYg==
Date: Sun, 6 Apr 2025 10:54:15 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Andrey Konovalov <andreyknvl@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Peter Collingbourne <pcc@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [GIT PULL] string fixes for v6.15-rc1
Message-ID: <202504061053.F27227CA@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull this pair of string API fixes for v6.15-rc1.

Thanks!

-Kees

The following changes since commit b688f369ae0d5d25865f5441fa62e54c7d5d0de6:

  compiler_types: Introduce __nonstring_array (2025-03-12 13:21:09 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v6.15-rc1-fix1

for you to fetch changes up to 48ac25ef250da7478ea54afbb1aced40c342e78d:

  kasan: Add strscpy() test to trigger tag fault on arm64 (2025-04-03 10:19:26 -0700)

----------------------------------------------------------------
string fixes for v6.15-rc1

- Add wcslen() to support more Clang libcalls (Nathan Chancellor)

- Fix KASAN MTE exceptions during strscpy() (Peter Collingbourne,
  Vincenzo Frascino)

----------------------------------------------------------------
Nathan Chancellor (2):
      include: Move typedefs in nls.h to their own header
      lib/string.c: Add wcslen()

Peter Collingbourne (1):
      string: Add load_unaligned_zeropad() code path to sized_strscpy()

Vincenzo Frascino (1):
      kasan: Add strscpy() test to trigger tag fault on arm64

 include/linux/nls.h       | 19 +------------------
 include/linux/nls_types.h | 26 ++++++++++++++++++++++++++
 include/linux/string.h    |  2 ++
 lib/string.c              | 24 +++++++++++++++++++++---
 mm/kasan/kasan_test_c.c   | 20 ++++++++++++++++++++
 5 files changed, 70 insertions(+), 21 deletions(-)
 create mode 100644 include/linux/nls_types.h

-- 
Kees Cook
