Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB3D149C4A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751377172; cv=none; b=o0o24gJLOinTrcjtYpPzvP1Vv0p1S2Ps3B1qT7friORQeAgUBB3zKRVDBrkkT+MDyE6bCIkOMmnb9wpjBPONrQn54eUNEnBbsLEtjEDHfRkf8EgRTi97A998Bv+v0XdWv99vKliYZhuZ3IDemeVMCfe1zs8OkP85xIjAAws741s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751377172; c=relaxed/simple;
	bh=gCLPDoeMAawAbDOlyhAIROREA605+VgIZeORwZL6XmA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H+gPu9mrZYD3YxKyp0skpbwrivuoBHhBEkP1bVmYotIVaFPn1cLHK1ZC8K0l0k3l4e6H8G92HLpnIYJ0su15//tVju9enlFwX4/71PxDEAzIHEM8XBtbQm7vaJVVzMoYdEU1y2ljBf4984Hn0Xx6wNaYuWJDZTAj+O/T4iAplM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oWAYeS0l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oWAYeS0l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8834C4CEEB;
	Tue,  1 Jul 2025 13:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751377171;
	bh=gCLPDoeMAawAbDOlyhAIROREA605+VgIZeORwZL6XmA=;
	h=Date:From:To:Cc:Subject:From;
	b=oWAYeS0l14UbCC3Nh6xNujug9gqCs+Fz2mUe7i3EnDe0Gc9bqxMimevWP9xHnPsas
	 13OH6jBxPZ5cQwI/yWYqmTuyV9nFTSuDTNxXoh+mR5x3DU5Hcr228wo7RVdCx8vf7R
	 xUXuiwfW3rF7BfYlBgbpunEDiVwOqoGDNUk7jiMBYyHniBPO5+3ds/KvBLHha41DJk
	 KuTeNBnd8lyqllU22Uf5eAapGA3T7p8p1asWAfdSxynLb+qiWV6iEA8PrzhGekn0Tk
	 ZOuk0eC3NHrtu4OrU9QKqu5/JEaCOzDirGoJe7hrSIop42xOnz5KuoFRomo7jY1LFe
	 MJgd4FClnkzjg==
Date: Tue, 1 Jul 2025 14:39:28 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] MFD fixes for v6.16
Message-ID: <20250701133928.GP10134@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Good afternoon Linus,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/mfd-fixes-6.16

for you to fetch changes up to d9d79e4f7dc935fea96dbf3de524404c08d08b03:

  mfd: Fix building without CONFIG_OF (2025-06-19 11:05:30 +0100)

----------------------------------------------------------------
MFD Fixes for v6.16

- Fix some -Werror=unused-variable build errors

----------------------------------------------------------------
Arnd Bergmann (1):
      mfd: Fix building without CONFIG_OF

 drivers/mfd/88pm860x-core.c | 3 +--
 drivers/mfd/max8925-core.c  | 6 +++---
 drivers/mfd/twl4030-irq.c   | 3 +--
 3 files changed, 5 insertions(+), 7 deletions(-)

-- 
Lee Jones [李琼斯]
