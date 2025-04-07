Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4965222B8C7;
	Mon,  7 Apr 2025 23:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744069734; cv=none; b=gOHMQ2zsgJDxs/6bIVeQf4hLIippMKiF+ZKBvagDoaHiSSd8EkT7GuJspudOw+1qmUlbfgRgCaq9rcjelUHBI/HP7IgHTW9N1fjtxdTL4gYN+m0g+NntMHyyaWkUNq5v/wYXLWezlHA9L2Ixamm5vDVr1YtB3CtoejZw4yg1hX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744069734; c=relaxed/simple;
	bh=jMMELnblMemF3AYQvGgHeCfvJKpdkDZIw7VpKQqJUUo=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RWi8DWjxhKwntZU8hO5PSSngH3/lDDyVjClmnZgu30se41Fvkdi+NfqPH4G3mSB0jnBl14/utc3zLDAnw2DtKLRnaOtZN4vv9sX1PfPiZ8UgOhGCYh+9aMxbP0QwQLTOod6bSarvHPgVLPWaKGOvgTTByHuHTK4Iu0rG/zcvfdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KE5oLfVu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KE5oLfVu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA287C4CEDD;
	Mon,  7 Apr 2025 23:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744069733;
	bh=jMMELnblMemF3AYQvGgHeCfvJKpdkDZIw7VpKQqJUUo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=KE5oLfVuQ6RdNYzVpQHcwdXdgM4r69W2Wm4Vt9oxwQAevIHsvxLmhJrlV+DcgmSdn
	 ofUuZJtfxVK3Jjr2zTyoat2roKHA0s/oTdkXUcbwhVOb4QrDv49ZVCFiPQGmrVxfEJ
	 PNC3VNAjIFSIbYTZFLEJm3tlZZl0FpyX31IVvgnO4lEUFktNQotsUt6ANEEC39gO/D
	 9S4KdGPdH3MwWRSmX4O/+QvHmyVRLpRniJYdmnaw6jut0MDulwwniwzN+Dl7dWuaa7
	 hzq/IJv6yY3MslMrNzcFFRwd4M/RMN2gnI6nFfXdXZsVv274VJYxL3rxtFPtXSGtUS
	 5Ag1uLZmkNvGg==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250319033504.2898605-1-shengjiu.wang@nxp.com>
References: <20250319033504.2898605-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_asrc_dma: get codec or cpu dai from backend
Message-Id: <174406973149.1344763.148124979192544931.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 00:48:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 19 Mar 2025 11:35:04 +0800, Shengjiu Wang wrote:
> With audio graph card, original cpu dai is changed to codec device in
> backend, so if cpu dai is dummy device in backend, get the codec dai
> device, which is the real hardware device connected.
> 
> The specific case is ASRC->SAI->AMIX->CODEC.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc_dma: get codec or cpu dai from backend
      commit: ef5c23ae9ab380fa756f257411024a9b4518d1b9

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

