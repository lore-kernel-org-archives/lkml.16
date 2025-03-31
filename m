Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0E12AE8D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 13:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743426635; cv=none; b=iV4zY8hQHZ3rt0DJ+EMT9vALaP09nypSf99l8wOgxLpqpl4YSm73pWbSrWABAtT0BPFyqQ9CshlkFQGcUaiSEZTAUmYceVBH9skeCAPCLdUdHaocFMMB6s6QhMiwZYC8aqTPxTm/Ux6Gt8Mo04O/MphTovQP1E8FT2sEPH7GoWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743426635; c=relaxed/simple;
	bh=y4hsUAeleINJKAjsEfMjkQCX6DhcCmEJQSIaQ7uyQmY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cRAlc0ZZzKPkftqXk/UaV7TIuVdorKApT+AfxXWZv+pFFF/fiKSeO+l9tpgVl2Hw//Na4EajpIFdUtuY4ZjzLAtKs0MMFxJhG6MDQWdZTNtIRk0raWpyqAtzAsMUSHGeZq6RtuMjpALOq94Fb7Pm03O107Yoi3nkP8LYWZVkZ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3ayn5hv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3ayn5hv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09B4C4CEE5;
	Mon, 31 Mar 2025 13:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743426635;
	bh=y4hsUAeleINJKAjsEfMjkQCX6DhcCmEJQSIaQ7uyQmY=;
	h=Date:From:To:Cc:Subject:From;
	b=o3ayn5hv4E6H3Vvx5/lUWwHoYHA5b3OUQiFmWmq5Lg7FunMCvjj1vJUNcab4mON/q
	 q5Dy6HvPJNoNm0RCJk51+hZO6gueYgQxXaDx/V48WSBqyaKISb53K+iitHVQVWMeTG
	 ImlpU5OKgZfoL/p/2Z8a/fBneAEXPWNgPDwF5SOCI7l3Xp4fbwB/xRoZaAGh22i7EM
	 9orsb/E75fmei2Cn/9G8HqkLhlVaNk7iMuzteQJFJa42mzm6ng5Nlr2rSuVkRtWAjK
	 k0TaMglOY0by66puSb7Yy2qfpbLx7QNm8VbEbspAHwLSfEglPECydRJB+9mRDP3vAa
	 UGCPW1/pleJWA==
Date: Mon, 31 Mar 2025 14:10:30 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jason Wessel <jason.wessel@windriver.com>, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Nir Lichtman <nir@lichtman.org>
Subject: [GIT PULL] kgdb changes for v6.15
Message-ID: <Z-qURoU3mrfusdBv@aspen.lan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 80e54e84911a923c40d7bee33a34c1b4be148d7a:

  Linux 6.14-rc6 (2025-03-09 13:45:25 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/danielt/linux.git/ tags/kgdb-6.15-rc1

for you to fetch changes up to afdbe49276accb87a0c7414e75864c78289ece2f:

  kdb: Remove optional size arguments from strscpy() calls (2025-03-28 21:28:28 +0000)

----------------------------------------------------------------
kgdb patches for 6.15

Two clean ups this cycle. The larger of which is the removal of a private
allocator within kdb and replacing it with regular memory allocation. The
other adopts the simplified version of strscpy() in a couple of places in
kdb.

Signed-off-by: Daniel Thompson (RISCstar) <danielt@kernel.org>

----------------------------------------------------------------
Nir Lichtman (1):
      kdb: remove usage of static environment buffer

Thorsten Blum (1):
      kdb: Remove optional size arguments from strscpy() calls

 include/linux/kdb.h         |  2 +-
 kernel/debug/kdb/kdb_io.c   |  4 ++--
 kernel/debug/kdb/kdb_main.c | 48 ++++++++-------------------------------------
 3 files changed, 11 insertions(+), 43 deletions(-)
