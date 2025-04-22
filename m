Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55D028382;
	Tue, 22 Apr 2025 17:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745343898; cv=none; b=KHKasBPNHnJiMChqY9h8AHG+6QPQk0sXS2E/9401gyDEiYr+k1u52DUGDL1ftnWGzr+o6NT8d/Ahmhi2Ca9qMNLDAcw6VeG/EpdX0V1G1T/O7C5OMRdiQj1UFVhDkLjjO2k4/zEO/2mLIg3OeKfcFtcrTW+B2/oR6UeVxJw3uzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745343898; c=relaxed/simple;
	bh=LZPhO1+IZ3hE+Yi8gImePBlBCXriAyy/WZRVCLdD2n0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CF1MHe/4bkwJCrE5cyznbJVumyvsFX6J0vUXSHR0AnNhj9paK/WP6TEfQn7LWaPjq1hotlJmA4UovaYWwliZI58bgGfaHyQKud/i9zYZTs5isjKBXSxrP2yZWFbPhsHBbrfFpsjPBqWZh9iA3GjNvSTJMb9W7z4v5SG1fkn7UhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmJgtTLv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmJgtTLv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B1BC4CEE9;
	Tue, 22 Apr 2025 17:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745343898;
	bh=LZPhO1+IZ3hE+Yi8gImePBlBCXriAyy/WZRVCLdD2n0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=gmJgtTLvIdg2do91CgMUvoi5JX4/nUcsov4skubbMBNF91z0g9Vthe//BXxKYGoEq
	 jGJ3PIK5eMNmjza16Q3xHczIAMA27kDyRmF/ry63fWvexOuQPyGxFUogEPu3EHw1J4
	 jESOS02xyeifbaL5QX4cFxQCKqXkErWRLkNb2XuWeGwUujfqk+2GnRp/m5z2wtwnl1
	 mwSEAJj/Cu1oLAUVYHWj7/o6N20z8DL/bE5MxcUlMuzCDN1jfshLwUgo2/xmf10D+x
	 mAXYNWHLxIGU5zVq5h7clZ2d2LHUUG/H/3RQseu/J8EJJA1ZZdxFkae0Gf9nCY8Vvg
	 H2qq9X3sz0vOg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250418053050.2755249-1-shengjiu.wang@nxp.com>
References: <20250418053050.2755249-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: dt-bindings: fsl,mqs: Document audio graph port
Message-Id: <174534389630.233012.11103900998893012901.b4-ty@kernel.org>
Date: Tue, 22 Apr 2025 18:44:56 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 18 Apr 2025 13:30:50 +0800, Shengjiu Wang wrote:
> This device can be used in conjunction with audio-graph-card to provide
> an endpoint for binding with the other side of the audio link.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: fsl,mqs: Document audio graph port
      commit: 0c9f82446123635cfbb8ceeca074f2dce6a0ccae

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

