Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609BC80C02
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 14:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749221144; cv=none; b=V9fmehOQfMCptoX6XDyI01nQAFx/zVVrPJ6GXNMc1tY4aYEeY37khAPnOe3pYD4xWicQr2AyJSUiM3OlXPrBe3Qse4byQLG4E0WASoqsnP23H1H1TOUS9U0yrGYam6JHRuxwwreDlwRIYeIhGfEGSHOvRViTsWWy2VZNEsBTsIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749221144; c=relaxed/simple;
	bh=EzUrF4o3M+u++YM1SlV6GN9apz/wW+3pWpuP8/sA3sE=;
	h=Message-ID:From:To:Cc:Subject:Date; b=OgQQpl4U8D0kYRpQbvRNdNtMB/VvZR4xqYXSbgDU4SPM93gwyvJHqP/LcCAcOjfNXY3F44pMXtF2qj1bMancxpvegCgWKGgda8gngCm7rdm5nk2WLQFScZQYYScG8y/Kbu48nXGQS1Cp7+TsQKBkOvcsK1Zp3GN+OaajAgenmLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UalTHr08; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UalTHr08"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF6DC4CEEB;
	Fri,  6 Jun 2025 14:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749221143;
	bh=EzUrF4o3M+u++YM1SlV6GN9apz/wW+3pWpuP8/sA3sE=;
	h=From:To:Cc:Subject:Date:From;
	b=UalTHr084XZdgxDpF255f4FPjaW8pAftZab2ek/GqrVyWXVAoyY+dc7aFaE0306YZ
	 3+fN1E2wYLIaaBdWp5Y1229shVuZuwc9XBSV0fb2VvmjO/QhP4lwzNpBfe4y0zUN8r
	 dYqO0nr4S+YMyCcqh93tz4TUNJOzcGwBEMz5XU83Hoct003iodSduXhtrrOJCSN1Wb
	 wILSBovT/t2e38xUaq4GLfkndB2ALxerMawdskCeSXH6tpbqnmp2R808ImDTng/hEI
	 kU5ghJoWSxop9Wp1vDdCPnRFLbhUopdM+aJ0/Ih5PAHhe7NjCLVNgizTqxCSYdzAvk
	 eXi5tgn+ZCaiA==
Message-ID: <8d81a11b97b3aa5a588cc136f37bcf25.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] regulator fixes for v6.16-merge-window
Date: Fri, 06 Jun 2025 15:45:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The following changes since commit dcd711021389c4d19b3310cc37f09813659dfee2:

  fix: Correct Samsung 'Electronics' spelling in (2025-05-20 10:34:15 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v6.16-merge-window

for you to fetch changes up to 65271f868cb1dca709ff69e45939bbef8d6d0b70:

  regulator: max14577: Add error check for max14577_read_reg() (2025-05-26 14:01:29 +0100)

----------------------------------------------------------------
regulator: Fix for v6.16

A very minor fix that came in during the merge window, checking for I/O
errors in the MAX14577 driver.

----------------------------------------------------------------
Wentao Liang (1):
      regulator: max14577: Add error check for max14577_read_reg()

 drivers/regulator/max14577-regulator.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
