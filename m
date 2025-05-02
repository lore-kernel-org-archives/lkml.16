Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F66B1E32D5;
	Fri,  2 May 2025 22:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746224497; cv=none; b=IO8LRq/eiyMX3WPvoQLG3imLsT12vHZOpfpF5N2dsdAgFI/6johiFGGk3HFD2s2CRM6KBs2p05+wcFfKr8Npimpzjd8tW6fSh8LuDq5JmVtXNuIp08GSh+OXl5t56pAASJKZKYNbOYkrwARCBgGc70DUNEEf9Hl9SZ7Fy7gmMco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746224497; c=relaxed/simple;
	bh=Wkl/xCbUI7do4AVTMYybZh5OgAcqp0zypayddyCDUA8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=H7XKtHXNgzWOlV7+3jpFYWuKDCGO4hh49RjoW3VyNCcws3HQUAOfd0m2YWstes+8OzBIcRTN5CuvU73QOFThnPqnpnJKO8vjyp9rsBNMKwr4o66nmvqN795mRtwIzDPLkH1qMkYiltjX77QECgqEGf3sKj2geZL/zSiXitplpYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uePdJnZq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uePdJnZq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 341B1C4CEE4;
	Fri,  2 May 2025 22:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746224497;
	bh=Wkl/xCbUI7do4AVTMYybZh5OgAcqp0zypayddyCDUA8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=uePdJnZqFALHxuAlpLfwRmV4/KsfUtSVZ0inrPLOQKQfWgkhvLnfGXF520tJGwvk+
	 o3RefBoOsJv8okJCeGSONP5zPaGRkN+FbwsmxQPjBw59eBUxDjIjVcUG3rg4Jd8uQ+
	 TtuSLZ6RSLTPWyYMuvrnR8rWxFPwe0jXFf18RNhqkwnuaRtfdDhY4lebjCYBDQm6BX
	 rvdamVo4MqvfWtWHTHvLelMLxu3rv+YgFTt1Yw4ZkrKLTpW535gxZ7tDOR+jr5uSTi
	 OLLGc/dNzjaqQdVLmu6i3I4zUVL5FhUcJRrGl3aOwPaAuL8QNTKZYZ0+Yk22x3Wk49
	 PfGPoqKUD8JtA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, linux-sound@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20250421105701.2273588-1-chancel.liu@nxp.com>
References: <20250421105701.2273588-1-chancel.liu@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_rpmsg: Configure CPU DAI for card that
 sits on rpmsg-micfil-channel
Message-Id: <174622449321.4079618.327380910498912102.b4-ty@kernel.org>
Date: Sat, 03 May 2025 07:21:33 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 21 Apr 2025 19:57:00 +0900, Chancel Liu wrote:
> Sound card that sits on rpmsg-micfil-channel has different settings on
> CPU DAI.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_rpmsg: Configure CPU DAI for card that sits on rpmsg-micfil-channel
      commit: 17fa55fe77d8234131ce0728a735da6dea19acd5
[2/2] ASoC: fsl_rpmsg: Allocate a smaller buffer size for capture stream
      commit: 2056d7a7df5d9a08144671afccb6970ccd595b89

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

