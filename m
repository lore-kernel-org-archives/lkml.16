Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA8022258C;
	Thu,  3 Jul 2025 15:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555916; cv=none; b=pRupAHQrVmqDPeq3V2KEu2FBA465Sc9QyRGTGLo4E1kcg+AWI5EhleSh9ya7AVfcGh/noSLLktBjcAGG+mLLzFesar6/Vuv48hVJgHwQzbdGnPhOVGBesq63cXr63GxX4sll25xucavu9x8C05IaL8EtcD/QXU5/4tOXqtDNskw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555916; c=relaxed/simple;
	bh=P70pfd9tdtQjkw7oXculwEXnekh/fTPgtpELUc1VrL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A2bS/ber7cgVj+KHV2aOd12A+BDvpiOF8V2e9ahwJ831xBIwDXE24TUYgPFlyg58l+CQsXJpKZPz1ipKyAupL4RkYoctQXr5SvtGdAa3QMRJegWJSBU+Df0wPhbRBIm/Bh6hdvzkU5sLMj4T24lTRGTC36J36KHxTNNzgYi6dNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6725734206E;
	Thu, 03 Jul 2025 15:18:34 +0000 (UTC)
Date: Thu, 3 Jul 2025 15:18:23 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Immutable tag between SpacemiT's reset and clock trees
 for v6.17
Message-ID: <20250703151823-GYA312602@gentoo>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Philipp,

Please pull the following change into the reset tree. This
allows you to apply the patch 5 of the SpacemiT reset driver [1].

Thanks,
Yixun Lan

Link: https://lore.kernel.org/r/20250702113709.291748-6-elder@riscstar.com [1]

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://github.com/spacemit-com/linux tags/spacemit-reset-binding-for-6.17-1

for you to fetch changes up to 25a59e813cd2ca728047f657d64f9b29480be393:

  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets (2025-07-03 22:16:08 +0800)

----------------------------------------------------------------
RISC-V SpacemiT Binding for 6.17

- Reset DT Binding for K1 SoC

----------------------------------------------------------------
Alex Elder (1):
      dt-bindings: soc: spacemit: define spacemit,k1-ccu resets

 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |  27 +++-
 include/dt-bindings/clock/spacemit,k1-syscon.h     | 141 +++++++++++++++++++++
 2 files changed, 162 insertions(+), 6 deletions(-)

