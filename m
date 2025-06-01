Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1742DCC01
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 16:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748795646; cv=none; b=N0od/PGeozchGENy75UszX+LwUKqICO3+4NWq0k7k8FwPe3fcMrtiY8quD/QnLGQ4M1BwsJPDazcMnzY0m5ARri9PsWq1nNcjvZZN0W2jVckbf/FeIB17lx9ZKobkQTXBPArOsNdD5l6roKJ/8xeeDzCkI03ZNEWpxcmR0iMaes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748795646; c=relaxed/simple;
	bh=hdWGCtLwk6uedecaOzHPDgt+Sx3o/v0XIWx/02rg8RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i0fAURjc0hwlRWljXDSuheKRzE9mmSMUXtGZYrVSL9vtqS7gV8EiBY6IP7hyZT6hTlHZs8wiZKPj2Wve16gzFn+J92He6yK5dw1Ujh9YqDY7oLf014woc5Ze2e5G1t/g4CUXIqgOMtmvipyLKjncMB0OrW1fp9hE6wkOasaUuDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RV/26xYv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RV/26xYv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6999FC4CEE7;
	Sun,  1 Jun 2025 16:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748795645;
	bh=hdWGCtLwk6uedecaOzHPDgt+Sx3o/v0XIWx/02rg8RQ=;
	h=Date:From:To:Cc:Subject:From;
	b=RV/26xYvQKlom6iHe4/9gNchwRoVZbvPXMrJIQIuNVwmnSS/UM3VNU9BllavJ8ZVM
	 Ko3MathEhPC4+j5R5I8nVUOoHQISzQ0l/hdk7Pa9bdSC9/tV9GMDchOI6heUqvpP2N
	 4J7e3gSqjCC4ELJULosLCsI16ucFFriv0JaQFT3Ppu4fMqHu2+uKmNc+zBLPmun9QE
	 Jufwq3dkYHd1+4azKOZkxx/A4rXWFKazcTwyjmz/qAYLxSpI7Cgqe/bw9n1Yfsh66H
	 iY5mks/+4mKjLvpRrA0QuY/YB3w1KYLtpoaSmgQVQ0xDDCGeMbii2WYxh388uWDuwE
	 XpCFVB5FJBx9A==
Date: Sun, 1 Jun 2025 09:34:02 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>,
	Ingo Saitz <ingo@hannover.ccc.de>, Kees Cook <kees@kernel.org>,
	kernel test robot <oliver.sang@intel.com>,
	Marco Elver <elver@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Subject: [GIT PULL] hardening fixes for v6.16-rc1 (take 2)
Message-ID: <202506010901.522039FEAC@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull these hardening fixes for v6.16-rc1 (take 2). This is based on
my original rc1 PR, rather than on the horribly mangled version of your tree.

Once merged with your tree, allmodconfig builds cleanly. Unmerged, this
current tree of mine doesn't build allmodconfig cleanly, as it doesn't
have the fix from d4ad53adfe21 ("drm/ttm: Remove the struct ttm_backup
abstraction"), which is in your tree now. (Avoiding this warning was
one of my motivations for the attempted merge-gone-wrong seen in take 1.)

Thanks and sorry for the horrible confusion and waste of everyone's time
that was take 1 of this PR!

-Kees

The following changes since commit f0cd6012c40da99b45f8f63052b97ec89d5f307b:

  Revert "hardening: Disable GCC randstruct for COMPILE_TEST" (2025-05-08 09:42:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v6.16-rc1-fix1-take2

for you to fetch changes up to f39f18f3c3531aa802b58a20d39d96e82eb96c14:

  randstruct: gcc-plugin: Fix attribute addition (2025-06-01 08:41:11 -0700)

----------------------------------------------------------------
hardening fixes for v6.16-rc1 (take 2)

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
