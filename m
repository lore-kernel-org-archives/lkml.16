Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219BC8F5C;
	Sat, 21 Jun 2025 17:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750525787; cv=none; b=cf2nrr5wAVZtVxbKieDr9DRS+HYjZUJmvM1fIS2BYVh0spj+xX+FosSlLSl6l2xnp6mcHb4SkiK95vbbzNHUf2woW4v4o/4k0vPqy9Mt62gd1BiFSQWmPiMtwpWVv/7EAnusjf/y1qo+FoOsOoYNVZdteKUpkSdTck+/e9ZbZ/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750525787; c=relaxed/simple;
	bh=eI3CbwLJiy7jodm4/+yWPC8Tk6NZvpzd0iABkJQ4tcU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JiYkPieYERVGQmwEallvsYFsgps7TOiSjXTPcwATvEXs9X68KwhXAOXooCG/2gvks5fhmuLsN5gEHtTcSTEvuACBUmRc8DWFg+TKamNknCzCmEw/XWFsl6MxXZL3G8Iun52FNLtD1qRV1+C4+q9mc39DkpOY2iGVK3AYpOPouI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzJ3L+NW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzJ3L+NW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D72BC4CEE7;
	Sat, 21 Jun 2025 17:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750525786;
	bh=eI3CbwLJiy7jodm4/+yWPC8Tk6NZvpzd0iABkJQ4tcU=;
	h=From:To:Cc:Subject:Date:From;
	b=BzJ3L+NWeccSnjJEykbDfkBTDcSH9b1LE1aFuHdrSTtwBr6Lwnq7tx/TzOxO1wAYI
	 mQ+7PI3muYXzArYxJkFCKfjVhJ934tLHCdAq4+1cjalp+kESGIWkIO7YnRExxXBo6h
	 0nclQdogtl52jBVgK3znza6JFtFs7Wf1nxbX1RBQ9fW3rhR5mMrfAltYBxALs73sJ0
	 CmqzhDTfL+gwYo4KKyAGz5YSBbxu8N9qvN5n56dz9YPst8vvRlZzDNIMvmLrlINIgN
	 YaIfl7ByPZaTlvnVxKTt2bQ8g0ujpbiYFl7OHUjRzmXsP1szl7hM34KIRtew4mXqje
	 uFjCqnHmfpSig==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>
Subject: [GIT PULL] Apple SoC fixes for v6.16
Date: Sat, 21 Jun 2025 19:09:34 +0200
Message-Id: <20250621170934.63194-1-sven@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd,

Here are three fixes for device tree warnings from our side.
As usual, they've already been in -next for a while.


Thanks,


Sven

-- >8 --

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-fixes-6.16

for you to fetch changes up to 08a0d93c353bd55de8b5fb77b464d89425be0215:

  arm64: dts: apple: Move touchbar mipi {address,size}-cells from dtsi to dts (2025-06-13 14:32:25 +0000)

----------------------------------------------------------------
Apple SoC fixes for 6.16

One devicetree fix for a dtbs_warning that's been present for a while:
- Rename the PCIe BCM4377 node to conform to the devicetree binding
  schema

Two devicetree fixes for W=1 warnings that have been introduced recently:
- Drop {address,size}-cells from SPI NOR which doesn't have any child
  nodes such that these don't make sense
- Move touchbar mipi {address,size}-cells from the dtsi file where the
  node is disabled and has no children to the dts file where it's
  enabled and its children are declared

Signed-off-by: Sven Peter <sven@kernel.org>

----------------------------------------------------------------
Janne Grunau (1):
      arm64: dts: apple: t8103: Fix PCIe BCM4377 nodename

Sven Peter (2):
      arm64: dts: apple: Drop {address,size}-cells from SPI NOR
      arm64: dts: apple: Move touchbar mipi {address,size}-cells from dtsi to dts

 arch/arm64/boot/dts/apple/spi1-nvram.dtsi | 2 --
 arch/arm64/boot/dts/apple/t8103-j293.dts  | 2 ++
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi | 2 +-
 arch/arm64/boot/dts/apple/t8103.dtsi      | 2 --
 arch/arm64/boot/dts/apple/t8112-j493.dts  | 2 ++
 arch/arm64/boot/dts/apple/t8112.dtsi      | 2 --
 6 files changed, 5 insertions(+), 7 deletions(-)
