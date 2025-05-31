Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB91DF58
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748703617; cv=none; b=EmYeSWIOw1QZmqWuFlnzpwp1Onkm+0JfMX5MmteNBJPV5heHax8PrQfvHRHkyuAWwi6xKmYpvMu27qftqhFekdP2RHTWZmOYu378aGgLLwa7R7vAJ4sCDcboUA9wQuMSEmZuV3nelbjyFhCxbkWzNIhNkIlBQJ/jbqf2qMUAhjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748703617; c=relaxed/simple;
	bh=AKrD+BrLm9rh9l/fBpVix8SwWqW2uwuCOjjWdXnDErs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=me7fIsm+TPNto5wwLT2rXgpY0NNGBmDjXUNZw+7KCXx3uH0+03PuzeCYwlK2Yu96GarbnHeOnh1mBpo7WmjRceE7eykha46RA80lHQ8QY1n66KnZo4i7yM8m86K56fzwEKCrq+5AsygDOWtvdNMppgQAbsKneIdLp8sx6y4RZvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aVdWJoig; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aVdWJoig"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 115EEC4CEEE;
	Sat, 31 May 2025 15:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748703617;
	bh=AKrD+BrLm9rh9l/fBpVix8SwWqW2uwuCOjjWdXnDErs=;
	h=Date:From:To:Cc:Subject:From;
	b=aVdWJoigiCSX8NDdS3C0ZhC63XNMFjFIXN9Y1GEoD4dwfHrTaVNxCnm6td9VYmi+D
	 pw0hA6fFge/lBUu54HNgeKltiuzmBekUPV2fTEcW232Dd4JAG7RNzuVly0V9Mgeom4
	 xljyeHz0e9UExXmR1FWM2itWWBhgxypeZOEtSeanyEPdMLy53t3elKlQBOofMRMxKf
	 O3VsIT8yb3HU8jzIdibG6pOWPUEFjWHV9M9h2h5dTp55j7EcH2JLY4m1VfJIZqy9BS
	 nvnB3INxYvK+VbvVfXmoXUrCCWCHxbqN2m+26aeWesS7q8sSVelTH7Nz+aG3rJ5Qqv
	 96I/1S8Czsppw==
Date: Sat, 31 May 2025 08:00:14 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>,
	Ingo Saitz <ingo@hannover.ccc.de>, Kees Cook <kees@kernel.org>,
	kernel test robot <oliver.sang@intel.com>,
	Marco Elver <elver@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Subject: [GIT PULL] hardening fixes for v6.16-rc1
Message-ID: <202505310759.3A40AD051@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull this small handful of hardening fixes for v6.16-rc1.

Thanks!

-Kees

The following changes since commit f8b59a0f90a2adfce5a9206ce5589ed0dc19543c:

  Merge tag 'driver-core-6.16-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core (2025-05-29 09:11:39 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v6.16-rc1-fix1

for you to fetch changes up to 7ea1ca94c1278615c55a9f61f63d2286b1b10853:

  randstruct: gcc-plugin: Fix attribute addition (2025-05-31 07:51:14 -0700)

----------------------------------------------------------------
hardening fixes for v6.16-rc1

- randstruct: gcc-plugin: Fix attribute addition with GCC 15

- ubsan: integer-overflow: depend on BROKEN to keep this out of CI

- overflow: Introduce __DEFINE_FLEX for having no initializer

- wifi: iwlwifi: mld: Work around Clang loop unrolling bug

----------------------------------------------------------------
Kees Cook (4):
      wifi: iwlwifi: mld: Work around Clang loop unrolling bug
      ubsan: integer-overflow: depend on BROKEN to keep this out of CI
      overflow: Introduce __DEFINE_FLEX for having no initializer
      randstruct: gcc-plugin: Fix attribute addition

 lib/Kconfig.ubsan                             |  2 ++
 scripts/gcc-plugins/gcc-common.h              | 32 +++++++++++++++++++++++++++
 scripts/gcc-plugins/randomize_layout_plugin.c | 22 +++++++++---------
 include/linux/overflow.h                      | 25 ++++++++++++++++-----
 drivers/net/wireless/intel/iwlwifi/mld/d3.c   |  2 +-
 5 files changed, 65 insertions(+), 18 deletions(-)

-- 
Kees Cook
