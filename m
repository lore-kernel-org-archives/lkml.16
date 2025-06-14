Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9911DEFE1
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 14:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749909822; cv=none; b=iNXO7TD/xHPbceIEMlYAgvSVdKpRyoShNKIAqWjAnQgXhj3uHcvLM+6eCNLGWgH/WqvQhBSe4sgTfwjf3eQAyrABCLYjLj5K7hfJo3+mRgr5hKZhwsvtAea4X8sIvQXKupjvy5KHe+YSRJlqsLjGz6qBSOcOgJCaJkP/aUwb2Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749909822; c=relaxed/simple;
	bh=1ciXpSXfAcIrYvrm15RgzAAXrJPQV9bgDhj5Mb4BVXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bBzEO8j4CHYoqSY4OXvYvxfhYwAcnsPRxuSKEKXnKPJObQJkwpjTCpCkHYGWpf4t8y+Y2wSFiiUi2rwXFn440nefyI3qy9NWJxIZr43lF30Zn+IHFdqHvVaR8RacOItPVSNyrGLpDBx071ADin/ljkF8XCVPXVElaSfAmlzQcPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=M6oaN/Dv; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="M6oaN/Dv"
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 538EC4DE74;
	Sat, 14 Jun 2025 16:03:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1749909814;
	bh=1ciXpSXfAcIrYvrm15RgzAAXrJPQV9bgDhj5Mb4BVXk=;
	h=Date:From:To:Cc:Subject:From;
	b=M6oaN/DvaghN9IORbo1pK2oFmTaMLBL7EhrblcNuK3hyZ++ObWngPQOWppDbpCvaY
	 uSfDkA3JfGEOZwVSdCHOf/dS74KwupubrhYfwm6c6XpNmKpBzQF0MYkvyft0edPhKs
	 5ywiSO2iAO7bjIHOgD7Z4G9HGmfsHWvZLXFXGCYK7fZH05pPR+SchXhIbQenkQZBZs
	 aom26V4jAiDMOY67lKDlW0jMzDkIxWo3IYdNbiYuJLLpzPFnOl2qhwkFDP9hqlJEJw
	 lDSI42nhj+0m4N+wdQysZxpksHTStgfsRKH9EILtRzs1kVf4cnqQ22qONKZ/i5r48V
	 jUtSL7mz0qfQw==
Date: Sat, 14 Jun 2025 16:03:33 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Subject: [git pull] IOMMU Fix for Linux v6.16-rc1
Message-ID: <aE2BNXtOVC2ss0us@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git tags/iommu-fixes-v6.16-rc1

for you to fetch changes up to f9705d66fa7107fcd619083f7aae2afb0554a593:

  iommu/tegra: Fix incorrect size calculation (2025-06-13 17:02:31 +0200)

----------------------------------------------------------------
IOMMU Fix for Linux v6.16-rc1:

Including:

	- NVidia Tegra: Fix PTE size calculation.

----------------------------------------------------------------
Jason Gunthorpe (1):
      iommu/tegra: Fix incorrect size calculation

 drivers/iommu/tegra-smmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Please pull.

Thanks,

	Joerg
