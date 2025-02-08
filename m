Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FA0243977
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 20:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739046527; cv=none; b=A7CqsGxq7Qs4x4CKnfpQNEuS7QzBVFgsUe9PRdEu2FXrGeOIp5n2ZbGhd2gmn71dmN7Ym9HrvCQCGmol5rnW8EGOr2m43eNYk1px9TFPO0oZ+NBUloSaHvIWU8EbiZL76M0ERP1cv1p8WIBWslxa1+F1Tsp7kTjoeMNHPSsUG+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739046527; c=relaxed/simple;
	bh=2xpDTCKelFt76SOeRsVikHZbcCIA3kfZnU+fYY8nsDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DJhTlCRIeHXTtPZJyi6wZsdPuuksLedEwVKeYavn05kplEuIfN/m0DFtd1g0t2HNHYndGqetNT1c52Brb7TSPy9jIZR4XV0LlVrc8n2Eg/VDt+Isra/1tWIQUUVA18fH5Yj/G/x+tKTwgL4O7aePKjQS92phzF9qoGeOGJFaLkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BX5osu7g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BX5osu7g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7505FC4CED6;
	Sat,  8 Feb 2025 20:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739046526;
	bh=2xpDTCKelFt76SOeRsVikHZbcCIA3kfZnU+fYY8nsDE=;
	h=Date:From:To:Cc:Subject:From;
	b=BX5osu7gz/og7a2+ve6aGM36yJB0onSfbPwYts8CY0lf+EbrbZAVsQGxWivU4Kl+s
	 yjTWtxzYEaSx3K+J4WQYkmKqB44R8bR07yYyM3AUzE6S5Iup6ZXdQAmid8Vn/oG5Gu
	 jqmOf3XL2udxpeyXvwB20zHLzFXdN3A7+YTllUNV8eenikS6uVTNMz08ff/4ndgWqZ
	 jHwMf9mKDEIG8GVV0lKfDlMMZCcfcFj67+NJBPFIgiyH49RDs/g83otroTkcc0hnQB
	 rLSiJz4h+UpFz2/jQtyo7FvW50oLVtQtxXMFJzAjXJ1+V6PedGrIz37/GwJEj1o3r3
	 47qpvsy7d+qTw==
Date: Sat, 8 Feb 2025 12:28:46 -0800
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kees Cook <kees@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [GIT PULL] execve fix for v6.14-rc2
Message-ID: <202502081228.796ABA4@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull this execve fix for v6.14-rc2. This is an alpha-specific
fix, but since it touched ELF I was asked to carry it.

Thanks!

-Kees

The following changes since commit 55cf2f4b945f6a6416cc2524ba740b83cc9af25a:

  binfmt_flat: Fix integer overflow bug on 32 bit systems (2025-01-10 08:49:05 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/execve-v6.14-rc2

for you to fetch changes up to b029628be267cba3c7684ec684749fe3e4372398:

  alpha/elf: Fix misc/setarch test of util-linux by removing 32bit support (2025-02-06 07:35:38 -0800)

----------------------------------------------------------------
execve fix for v6.14-rc2

- alpha/elf: Fix misc/setarch test of util-linux by removing 32bit support
  (Eric W. Biederman)

----------------------------------------------------------------
Eric W. Biederman (1):
      alpha/elf: Fix misc/setarch test of util-linux by removing 32bit support

 arch/alpha/include/asm/elf.h       |  6 +-----
 arch/alpha/include/asm/pgtable.h   |  2 +-
 arch/alpha/include/asm/processor.h |  8 ++------
 arch/alpha/kernel/osf_sys.c        | 11 ++---------
 4 files changed, 6 insertions(+), 21 deletions(-)

-- 
Kees Cook
