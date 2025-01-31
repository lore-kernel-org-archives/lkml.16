Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BF07081F
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 21:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738359817; cv=none; b=LngCsgrqeZOPHYOqsYCO56LkdPGgi9pVJMWtiT623q4nyHf+rgReNAEVz2tYeLGplzAtAIOjFoTL+a+Dyd4akSRNV7xkNOFgj/d2s1ddEaRa490ERK3UHno7oaEwFYv6xcte4uFCZdNVCMzAxTvS0z6Qhh3NjYFtXGgYyhfmTrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738359817; c=relaxed/simple;
	bh=0mZmOZH9PEjqhTmE8Mf+Rqmock6Rby+NhKtz0Nvro+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pgIxQe0HMlewleKo5ycwsCtuWWoYF1hCGhDkLSihGYIPcYTz0PkAj+pRo6TO5oOIbSj5nD6vw0dZeYZ35xUvH4OVXVXTf/6mCHBGWbu3w215kW90r8MJTEbe1Edmb90Jtst5ZnqlmKBwRFIZeYYmNp64386+iy5DdXHB2aVWa4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GzoVo47h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GzoVo47h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89669C4CEE1;
	Fri, 31 Jan 2025 21:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738359816;
	bh=0mZmOZH9PEjqhTmE8Mf+Rqmock6Rby+NhKtz0Nvro+k=;
	h=Date:From:To:Cc:Subject:From;
	b=GzoVo47hOL/ITVLaY2a4EtBSjlI5Ucur7Pu8I0Aly/vJirNKSnCg+2kHmh3RusqMb
	 ItYFtm1xsTrurxs22pdefY66J7eENPOjdvhVcZLkQvZCL/DbiPX8g+UaMyL3bTEcry
	 T9OVDPaQaAw3OeNOmhcCeMWugHQ5kdkjwS9fMpGZbqPiQFkXw/adJNf7WXbnv8rS3Q
	 MtptWnnjYOBQV+/UJO/pfw1hQfB+PIvIY/ugKZCJSULz0kGeKu8r3rbLm1nLpG4i0I
	 enQBy6SjuUmZZHwlFJgUhQmBvZy2NAV+wrl/r5/WVZQC9lONfU1FY7dCQO3oSyqh3y
	 8cj9lDc5p4t1Q==
Date: Fri, 31 Jan 2025 13:43:33 -0800
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Jeff Xu <jeffxu@chromium.org>, Kees Cook <kees@kernel.org>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Serge Hallyn <serge@hallyn.com>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [GIT PULL] AT_EXECVE_CHECK update for v6.14-rc1 (fix1)
Message-ID: <202501311342.42FE3BDF9@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull this AT_EXECVE_CHECK fix for v6.14-rc1. Fixes the
AT_EXECVE_CHECK selftests which didn't run on old versions of glibc.

Thanks!

-Kees

The following changes since commit 95b3cdafd7cb74414070893445a9b731793f7b55:

  ima: instantiate the bprm_creds_for_exec() hook (2024-12-18 17:00:29 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/AT_EXECVE_CHECK-v6.14-rc1-fix1

for you to fetch changes up to 38567b972a22706e9a1a52b2c4bc9ea4b5ed00ed:

  selftests: Handle old glibc without execveat(2) (2025-01-27 11:37:18 -0800)

----------------------------------------------------------------
AT_EXECVE_CHECK update for v6.14-rc1 (fix1)

- selftests: Handle old glibc without execveat(2) (Mickaël Salaün)

----------------------------------------------------------------
Mickaël Salaün (1):
      selftests: Handle old glibc without execveat(2)

 samples/check-exec/inc.c                   | 11 +++++++++--
 tools/testing/selftests/exec/check-exec.c  | 11 +++++++++--
 tools/testing/selftests/landlock/fs_test.c | 10 ++++++++--
 3 files changed, 26 insertions(+), 6 deletions(-)

-- 
Kees Cook
