Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984D91F4722
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 17:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749835429; cv=none; b=fEiDPvsSKejUKyKGkwHhoQJI4WN6fgzaSACse5RNH50Acscwur2DJ6QxX5MALZDE7kHep25/EKC2ZhDpMMwTjcbSC5ysGyc4t3GDIDGY5IdnV3Wl7PoY1U7bljr/X5FnE+1u2XG4a/AjgUITmJQz/kJRqzY1b/66gv/Z/A4Ffmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749835429; c=relaxed/simple;
	bh=HX7rB/hdzAiZrq3LmcTmLMqD0D6Jl/2X1ww3IfEBpKo=;
	h=Message-ID:From:To:Cc:Subject:Date; b=e48N+DCv3MVpDrsa4r5kGB5XMkXjkyDaPasle8pBeCzoLaWLjDmfbTdB0coa0+2B/MGsQmmc3fov2B6XqbKl7HNetGhFU+QdsSzi+zK96WV5vFF1JJID3T3pN0eyP+J7su1EvbAsClcaiaDPnTBJq5vovszL5qnVhVr4cNGf83A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vLFOUddT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vLFOUddT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2EF9C4CEE3;
	Fri, 13 Jun 2025 17:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749835429;
	bh=HX7rB/hdzAiZrq3LmcTmLMqD0D6Jl/2X1ww3IfEBpKo=;
	h=From:To:Cc:Subject:Date:From;
	b=vLFOUddTROn0J41cF9YQLF/4EH8tfV5g/NHuEZ3jdRz1MRAOB6QL5Q21z9ovT4vPC
	 OckRfcJazHsmnuKysV+n2nQhrTTp11DxIBY9R970fG4NbzH46BWZor2j9PsRViQsZZ
	 w0ogAbBK3lelYlyIw53muUyK7a3AA9VkoyBW45LtvTf7kLDuO4jeGHfblGoF9w459m
	 zNvZY11+QGuvw/vzT7aHhGiB5n/wbck5ls+SqzGdZEZdd89NayIakSQtSlDbGlt7XU
	 vI/oxF4mjsf7xkpczwo8LTAYv2C11bboOg5IPiTWUf0vNjNZ7mtPNQdCDn7E3xy1qz
	 WnuwrI2fETYHg==
Message-ID: <ef1d8afdc37fb1279dfe0d367ffafb56.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] regulator fixes for v6.16-rc1
Date: Fri, 13 Jun 2025 18:23:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-fix-v6.16-rc1

for you to fetch changes up to 06118ae36855b7d3d22688298e74a766ccf0cb7a:

  regulator: max20086: Fix refcount leak in max20086_parse_regulators_dt() (2025-06-08 23:29:48 +0100)

----------------------------------------------------------------
regulator: Fix for v6.16

One minor fix for a leak in the DT parsing code in the max20086 driver.

----------------------------------------------------------------
Dan Carpenter (1):
      regulator: max20086: Fix refcount leak in max20086_parse_regulators_dt()

 drivers/regulator/max20086-regulator.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
