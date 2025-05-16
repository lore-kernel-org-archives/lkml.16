Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4C31DFE8
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 11:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747395096; cv=none; b=p7ScfJYFq/rwVXKKo7TwNQMNdgwljpUuQtTzojAsYYv9iMov/wjRu/ZbW9RLygyXWIGnJwLoFJGbXMMiBU3wGn+g8IxI5dRgpOOl5yuK7PUoaaJpJc423nrBuiJmdDyAtvkf6HeEDoQqGjSNotUkSnZGizVnOG7ri+S+GpbnHqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747395096; c=relaxed/simple;
	bh=AX9Zhf+rHXrUUhMb/4O0fHgP/QIMo8bPv4mSabcLP/o=;
	h=Message-ID:From:To:Cc:Subject:Date; b=hLT+aC0eYjrOqqCiETp8wKkyim03u8OY6rOG+KIXxkfiAYkmUoz6a/HtS07CttIipvH4GEHe2nQJ/RfFQkehlD3Q9WSUIaIhuZFLKv9W3i05Wg9+1PCsWiOR+FpwYcgq1wyCWbdhn3UD1ixZEYn2cw8sFjIYMR055odqOhe0lLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1uJzHgR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H1uJzHgR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7585CC4CEE4;
	Fri, 16 May 2025 11:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747395095;
	bh=AX9Zhf+rHXrUUhMb/4O0fHgP/QIMo8bPv4mSabcLP/o=;
	h=From:To:Cc:Subject:Date:From;
	b=H1uJzHgRcnr8P5W8HNXhAo79NAjz+E7Q50AB351tGP7yGcV0F0IB/b0Ou0Nct9tY2
	 IvS9W0Z2vsb9ZXBHZaCTiki6BWa38fwfFoHWS86v625OtwQx1Etr/TYUfi+kZLlp5N
	 6a1cUYUJ67sCwqTTQhFGPSPhBIStOGEBUkkdNh4z/4ao/l4S2IImQM7IYsaBMmUHvo
	 9tMxzDnGpN21HBDcFrVt2PCuzyXZJQnWu9Ow+75ChrMcZ1RBHDBlmF2LODNYXwI4yc
	 FZaw+RzBLhnR/yLnlLWKYcHoFDRdgzQrNq+7KCuWz21MDpVqma/4gPRSzqPuWGJQnY
	 SpBBvdNgIRzaQ==
Message-ID: <98e633a52bdb6705c70a4fd96b2334fa.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] regulator fixes for v6.15-rc6
Date: Fri, 16 May 2025 13:31:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:

  Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v6.15-rc6

for you to fetch changes up to 6b0cd72757c69bc2d45da42b41023e288d02e772:

  regulator: max20086: fix invalid memory access (2025-05-14 11:16:52 +0200)

----------------------------------------------------------------
regulator: Fix for v6.15

This fixes an invalid memory access in the MAX20086 driver which could
occur during error handling for failed probe due to a hidden use of
devres in the core DT parsing code.

----------------------------------------------------------------
Cosmin Tanislav (1):
      regulator: max20086: fix invalid memory access

 drivers/regulator/max20086-regulator.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
