Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848FB1F3BBB
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 05:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747199412; cv=none; b=gAe2oG9mPPuaacK/7weJzMc7AyCKB8r3SH30FjZKHqfZKVMn0csiawyQBYGoXdQJfIW2Lt0O02yUOGKSdrn2ZElQ4VgR3B/d+pPPRSxN9lgqDJV4oI3887EdZ73KVG81IoVTBKdID0Hdk9LcghUqgOSqlvYKrmU8XUI/QsgvdbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747199412; c=relaxed/simple;
	bh=PDa29Sv9SoHZihYYkY9aK12HwQ73g5N7pKfrjrFP0V0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QQJyre2DHQWbuUAdNB5R9mwQZlcZSFf1samAsoyaEzEcXWEwpg5R/WlS+wDYm4Nfzj8wLfWJAMBAZgMGY1pwTfXs8Em1LbUqnWbJ/RLIt7pBPgk2bUATsby2whi75nFeMulT+DSH1xWYMsavNhtN86wmw6Ru4F126RQSOEox/D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/c2Pc4r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/c2Pc4r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69834C4CEED;
	Wed, 14 May 2025 05:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747199412;
	bh=PDa29Sv9SoHZihYYkY9aK12HwQ73g5N7pKfrjrFP0V0=;
	h=From:To:Cc:Subject:Date:From;
	b=g/c2Pc4rVhOHSrmO4q6xV8oxmNNeeQsNkdRk9oxrUgvL28La47hLehOJIxiXY8gFn
	 1zDGS6a+6RwDoSmNORI1/pi8rfQ+E/E+Uw/KFT9XQ4eNeV/zMv1J2jN5XRf0kk50kN
	 VCEIHsy15yeGw6+k/Nnk/XiXM5LqA4zzwE5Qh8ez8QdEkuiY8FD382ZKdboUikAYTb
	 hFZhR5iHT0My+2vOZ0HbQ8KoFpfwOzMLzFKk2L7bIuCgncCm4ZOPxnndUzObKIomQD
	 G8AMqGpHt1r2HPSGuCEa4svpxsYDQmuZJ1lkbdxIxjMuuzMDudkoVkHtTj3SI9OrGz
	 SRw/cX7Wjtq3g==
From: alexs@kernel.org
To: corbet@lwn.net
Cc: linux-kernel@vger.kernel.org,
	Alex Shi <alexs@kernel.org>
Subject: [GIT PULL] Chinese-doc changes for v6.16-rc1
Date: Wed, 14 May 2025 13:09:54 +0800
Message-ID: <20250514050954.56918-1-alexs@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9f488ccd0f567ca66a146bc31e6578cba3b5abee:

  Merge branch 'mauro' into docs-mw (2025-04-09 12:24:51 -0600)

are available in the Git repository at:

  git@gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux.git tags/Chinese-doc-6.16-rc1

for you to fetch changes up to 794056966da84f46679c970133f358733ea6d847:

  MAINTAINERS: Change Yanteng's email address (2025-04-10 16:26:00 +0800)

----------------------------------------------------------------
Chinese translation docs for 6.16-rc1

This is the Chinese translation subtree for 6.16-rc1. It just
includes few changes:
        - MAINTAINERS: Change Yanteng's email address
        - docs/zh_CN: Add how-to of Chinese translation
        - Add networking translation index
        - Docs/zh_CN: Translate msg_zerocopy.rst to Simplified Chinese

Above patches are tested by 'make htmldocs/pdfdocs'

Signed-off-by: Alex Shi <alexs@kernel.org>

----------------------------------------------------------------
Wang Yaxin (2):
      Docs/zh_CN: Translate index.rst to Simplified Chinese
      Docs/zh_CN: Translate msg_zerocopy.rst to Simplified Chinese

Yanteng Si (2):
      docs/zh_CN: Add how-to of Chinese translation
      MAINTAINERS: Change Yanteng's email address

 Documentation/translations/zh_CN/how-to.rst                  | 459 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 Documentation/translations/zh_CN/index.rst                   |  24 ++---
 Documentation/translations/zh_CN/networking/index.rst        | 160 ++++++++++++++++++++++++++++++++++
 Documentation/translations/zh_CN/networking/msg_zerocopy.rst | 223 +++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS                                                  |   2 +-
 5 files changed, 855 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/how-to.rst
 create mode 100644 Documentation/translations/zh_CN/networking/index.rst
 create mode 100644 Documentation/translations/zh_CN/networking/msg_zerocopy.rst

