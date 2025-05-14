Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D9C27F18C
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222676; cv=none; b=SQ74sOWLqeW60yXtE7XIQW6/bcuFlmt7B8a3XVq4mSbAlqR2uzWpycGmjk5GDvJXWa9iMtLwxBpq9+WIIyyzoxTviVak+S2IQx18pWvwCWkCPXgxnVm9s4O4RYgX2d20ru7iIQuHKRYVumkQ5gZ+MFvTkmlhhdaLfHYkeMcYVS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222676; c=relaxed/simple;
	bh=hdiLO6XCduc9SOuTx7CxPdZUESw/8/50kqGgWmBu+q8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TqnDJXCTy0xgbHeZcZUpzyF/spnXziT7OSh3tw9Ph15Bc8Zl49jBFf7NDCEjWi+UMMTnx6wgeLZ4EMKAer9xxIqoqheqAk9qFAsgZ3NkiVv0JqTHcmlrWuuFhebA6xf9KUDEmxaMEWVub3yY2BKR+4R2pUHWqG5VL8C4YINfzTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k69PjzF+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k69PjzF+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B502C4CEE9;
	Wed, 14 May 2025 11:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222676;
	bh=hdiLO6XCduc9SOuTx7CxPdZUESw/8/50kqGgWmBu+q8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=k69PjzF+kAbdk6afuQXuAj01ZMRsc38cQ+ZfXyBKqetQTRZB2YQoBQtcr5ruU+WWE
	 uct8t8FB1Wz/frWcrCWmCskQkmTvBn7gjD6yDzHdfn4Vnn/o5luD9NZCc33yZK3W8f
	 mJ5I4/GHW6im7xnAFlM90EI+7ZGru35r3dliJ+QMicYIvWV/Iv8mM3AtNXZ2r2z0OY
	 98ZRuwTlHw44wGsvKP/LCL0+2q8r7r2e79TghTuywC+tUo+XGfCQyR2QKbw7ROKikB
	 s+7B/jF1I4J72fhMJDpdXhZXXZPima42JWzw3z3OMalU5puO803TqCdGLmbE3XLwPG
	 8vrXVfUAtT46g==
From: Vinod Koul <vkoul@kernel.org>
To: linux-phy@lists.infradead.org, Adam Ford <aford173@gmail.com>
Cc: dominique.martinet@atmark-techno.com, frieder.schrempf@kontron.de, 
 u.kleine-koenig@baylibre.com, aford@beaonembedded.com, 
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20250504204043.418924-1-aford173@gmail.com>
References: <20250504204043.418924-1-aford173@gmail.com>
Subject: Re: [PATCH 1/3] phy: freescale: fsl-samsung-hdmi: Rename
 phy_clk_round_rate
Message-Id: <174722267396.85510.14284912080020190459.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sun, 04 May 2025 15:40:40 -0500, Adam Ford wrote:
> phy_clk_round_rate sounds like a generic helper function.  In
> reality, it is unique to the phy-fsl-samsung-hdmi. Rename
> phy_clk_round_rate to fsl_samsung_hdmi_phy_clk_round_rate.
> No functional change intended.
> 
> 

Applied, thanks!

[1/3] phy: freescale: fsl-samsung-hdmi: Rename phy_clk_round_rate
      commit: be79213b4f9ab6e5abf870b97f8a1cab5bf049b3
[2/3] phy: freescale: fsl-samsung-hdmi: Refactor finding PHY settings
      commit: 41db4623346777be6ce694338b5adc570c4b671d
[3/3] phy: freescale: fsl-samsung-hdmi: Improve LUT search for best clock
      commit: 46a87260fc4f719f58e07a53cc1b70a38d98da37

Best regards,
-- 
~Vinod


