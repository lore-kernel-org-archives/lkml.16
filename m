Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D687081F
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 21:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738359541; cv=none; b=bC9UOMOvDemei3yZ6THNlilnWbkUGMD/mtwZ/Prh2zdXa18hkOGZL29fqQjyRFmk1Jt1SHrdtI3kmLiY4bosSKDphY7+DFUH8MduFfJQyVQhW4BTtqrz0p6mGT2uOpla6AjZ619/o3OishhtxyLHmM4Fia6xiV7BHDOToo0MTOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738359541; c=relaxed/simple;
	bh=0NVTgVUL2OmFRXsnrNqud03+GHXt0ed4+9DLShDgWuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kLjmicvrTTqGFK3FdsGk/L2DA2a4t/KTxwj1hg749UmmdSI8Nih/3M+c9HqsiZsvgDitFaCsR4LbmtyGVYnnOWfw1n7r0QM9BtJWqGUhqDQP8Emffd5NehA9vCulUij0kLAlRLW12Sj6pl2S6iBoHofKaOkpwVLk8YLj6yKqn/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNS6RCuC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNS6RCuC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9DAC4CED1;
	Fri, 31 Jan 2025 21:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738359541;
	bh=0NVTgVUL2OmFRXsnrNqud03+GHXt0ed4+9DLShDgWuQ=;
	h=Date:From:To:Cc:Subject:From;
	b=oNS6RCuC55+T9l9iKLXpYRRQO74iLe1QTs7mfcOpwOFwNm3cC6kB9Wiijt3kcX80H
	 w4Xrb1IDzAI2pVmlddHmJZr37Tj5IJDg2nKI4qDYU2liGLgoaG1bNFFGBmLML+o5PC
	 UfMcuxoqlmF9srVpnNiYcsaO+3ModxnMqshbg8y57znFBYiVIT7w3qNI1csa+vvJoe
	 GkjEpckTslI6PQSjzWz4YDdpc9lWVtKcn8n2bdXrzVKczHsEOo9R5rtF0MSwaTbvI0
	 aW2f5fc18gNBOO6tLc4rHZDJqvHaT4EX6jMWj43oq2QLY1NBNGxU+BJcFO9Nrc26m0
	 oZmHWfeGj1rTQ==
Date: Fri, 31 Jan 2025 13:38:58 -0800
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Jakub Jelinek <jakub@redhat.com>,
	Kees Cook <kees@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [GIT PULL] hardening updates for v6.14-rc1 (fix1)
Message-ID: <202501311331.B5B6D45@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull this hardening fix for v6.14-rc1. This is a fix for the soon
to be released GCC 15 which has regressed its initialization of unions
when performing explicit initialization (i.e. a general problem, not
specifically a hardening problem; we're just carrying the fix). Details
in the final patch, Acked by Masahiro, with updated selftests to validate
the fix.

Thanks!

-Kees

The following changes since commit a9a5e0bdc5a77a7c662ad4be0ad661f0b0d5e99d:

  hardening: Document INIT_STACK_ALL_PATTERN behavior with GCC (2025-01-08 14:17:33 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v6.14-rc1-fix1

for you to fetch changes up to dce4aab8441d285b9a78b33753e0bf583c1320ee:

  kbuild: Use -fzero-init-padding-bits=all (2025-01-30 08:48:34 -0800)

----------------------------------------------------------------
hardening updates for v6.14-rc1-fix1

- Fix regression in GCC 15's initialization of union members

----------------------------------------------------------------
Kees Cook (3):
      stackinit: Add old-style zero-init syntax to struct tests
      stackinit: Add union initialization to selftests
      kbuild: Use -fzero-init-padding-bits=all

 lib/stackinit_kunit.c      | 106 +++++++++++++++++++++++++++++++++++++++++++++
 scripts/Makefile.extrawarn |   3 ++
 2 files changed, 109 insertions(+)

-- 
Kees Cook
