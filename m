Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4401DF744
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743114430; cv=none; b=ZfRGTBbbrIessNfWTO4JOBPJJCBN9NzNmQa2BXcIX05rDyO7NpDpArWk3Mu+9HZeiv5MigvdrUtRm4wylsQYZYOko1/CxqUE0dQJfifudi0qLbivaabQh3qGkxv4tuiP5Zk5gIDHKR1+GcUHx9mG33LEoZajdJs6ZOeb61TaWww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743114430; c=relaxed/simple;
	bh=zwboQbPzcGQb7MZnral1JgcBdeQHDsP/MVzRoHaqmPc=;
	h=Message-ID:From:To:Cc:Subject:Date; b=WrgQwxnc5+KouwbBLWyiwj+opv7qtlm2AgG6ToaG4ITIe3aO7y0qNMH+/wWQ7gf/aPysVIUoiDdJNDNfW+c9vEYxJN09DByJOz68/Nxq5J9rLYY+t1Xsz0wcJbRjNz4hkQB3dKyW50C5G72qw8/xudPwZey/3k+5vlEGCs/xnE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amB06PKt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amB06PKt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FA5C4CEDD;
	Thu, 27 Mar 2025 22:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743114428;
	bh=zwboQbPzcGQb7MZnral1JgcBdeQHDsP/MVzRoHaqmPc=;
	h=From:To:Cc:Subject:Date:From;
	b=amB06PKttAZYOVT7ilD+A8qqfYn8fPlCbHDB8VzdpdUJmhDtBzY+eyUq2sLz0wfmK
	 2KDMrGM6iALEjJmrbBA4tBnEtzGSW+HXru1xQGpwyQMLOnHFToI/fTQf9wv0eBekeA
	 sVXX1LiDjsS9jvcYiO5VhDisz+q4wGadqwgtkgEIQTYpuI8QCzS72LppKTBkuF3kwv
	 I+Cu8Thq0VslKpvLWlSv+q0UNRV6ZePTNoQQfTc9VvZDtwGHyhFMzGNqU2saxvwOlP
	 pfsmPapJROBj+eIObmXEb3HHKdnmnFLuWihfMK+stK+uFMrcHXiyXAhhxS8I8AGfXe
	 yZEmz31nqmKag==
Message-ID: <1873795367bda5d10ff64d1efa0625fa.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] regmap updates for v6.15
Date: Thu, 27 Mar 2025 22:26:53 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-v6.15

for you to fetch changes up to 153dbf4adad0082d030c30d20541df2b1af52db6:

  regmap: irq: Use one way of setting all bits in the register (2025-02-06 20:46:09 +0000)

----------------------------------------------------------------
regmap: Updates for v6.15

Only a couple of small patches this release, one refactoring struct
regmap to pack it more efficiently and another which makes our way of
setting all bits consistent in the regmap-irq code.

----------------------------------------------------------------
Andy Shevchenko (1):
      regmap: irq: Use one way of setting all bits in the register

Christophe JAILLET (1):
      regmap: Reorder 'struct regmap'

 drivers/base/regmap/internal.h   | 12 ++++++------
 drivers/base/regmap/regmap-irq.c |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
