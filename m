Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4153F243946
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 20:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739047423; cv=none; b=MQ7Klkr5lSZ4nDSF7RDoFwEQ+CH3X3et3KLZNFH/Q3ofLWfFepyOs0WOe0FoRyGo+sFEPGyspMtXF5DTx8Aaz3DN/xIXIcyBy1tvMYI5ExTnBldBrnbIH6vUXRp+NOhs/EInRnz3F1YVcjK1OryuzZocjDnq8bP8mJ5eCT0n1UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739047423; c=relaxed/simple;
	bh=Bc+6Fve0mUYHITCqTH4+7/8ed5cUzObaIsDYTPw2Nys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e4deHRuwv0HslvKgRs7ZERmX/acjfeVKLw0d022TrfZ1VIdhhQoFGpDfAEnXdeBpT2wmnFmIEV8Rb4facJo17Cj6el+UWu6orpvGBU1Z17AR88KCynxk2JCF361BVwVcC9v6DvC4w+91D/wguqQ/gXvBdjUXISW/GcezEfS75dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UT5VEkut; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UT5VEkut"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98467C4CED6;
	Sat,  8 Feb 2025 20:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739047422;
	bh=Bc+6Fve0mUYHITCqTH4+7/8ed5cUzObaIsDYTPw2Nys=;
	h=Date:From:To:Cc:Subject:From;
	b=UT5VEkut7jUEloGw59sbN5Z6J/jDGmBvgeLNR6VDjI/iGRkt190u8KjP3wn3zSDW3
	 YlBg9ueQReHjGoWJwkXZq+vf9bf7CMaGSXATIsZL+oEl1Ta1d88ED1s0xtDb2K0mIe
	 i2MQx24AomSd6JVE/Bb23MkzjZ4lgbGE2TbY+Svk2WQ0sk7S5tHfSrM8ZG8Qppy0wZ
	 ik+pBnqUKmdDyT1e+54esrvkC+j+zM0DKphApL6aAIlRKhp7nx/BUo1HbXdoc1h5Up
	 Yhsp8qXb/zZfzjVoTJhdvEJ8Br+/HLtCay53LBEC+TIoHft9Mfb60jUOTImxWEFVGY
	 r/Apm8805N2oQ==
Date: Sat, 8 Feb 2025 12:43:42 -0800
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kees Cook <kees@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	kernel test robot <lkp@intel.com>, Miguel Ojeda <ojeda@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>
Subject: [GIT PULL] hardening fixes for v6.14-rc2
Message-ID: <202502081241.8997DC3@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull these hardening fixes for v6.14-rc2. Addresses a KUnit stack
initialization regression that got tickled on m68k, and solves a Clang
(v14 and earlier) bug found by 0day.

Thanks!

-Kees

The following changes since commit dce4aab8441d285b9a78b33753e0bf583c1320ee:

  kbuild: Use -fzero-init-padding-bits=all (2025-01-30 08:48:34 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v6.14-rc2

for you to fetch changes up to 6270f4deba3fbd77d1717fb8634f1fc612ff69e2:

  string.h: Use ARRAY_SIZE() for memtostr*()/strtomem*() (2025-02-06 18:48:04 -0800)

----------------------------------------------------------------
hardening fixes for v6.14-rc2

- Fix stackinit KUnit regression on m68k

- Use ARRAY_SIZE() for memtostr*()/strtomem*()

----------------------------------------------------------------
Geert Uytterhoeven (1):
      stackinit: Fix comment for test_small_end

Kees Cook (4):
      stackinit: Keep selftest union size small on m68k
      compiler.h: Move C string helpers into C-only kernel section
      compiler.h: Introduce __must_be_byte_array()
      string.h: Use ARRAY_SIZE() for memtostr*()/strtomem*()

 include/linux/compiler.h | 32 +++++++++++++++++++-------------
 include/linux/string.h   | 12 ++++++++----
 lib/stackinit_kunit.c    |  6 ++++--
 3 files changed, 31 insertions(+), 19 deletions(-)

-- 
Kees Cook
