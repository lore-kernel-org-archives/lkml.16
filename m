Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9612973DB;
	Mon, 14 Apr 2025 13:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638998; cv=none; b=VAhMb86RbfHKUQD8ePrzEi1LGS+P3/JqV1yfrR+mVoHg/PSYQE7oK9wVJ0143SkUdpY+aIOq7ksWzIE9i3gyAEPhApCnRqq2jcAJrMn7hNagDl9OtRSiX+XRJHWLUjt42BNShJMorS7OqoI6PUsbKfKWQyNxNY1RblGNGEvH7L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638998; c=relaxed/simple;
	bh=VPEb2K8tDnYjiX8IJGMJSBmSgMFmgydjh+ShSPL9v4o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Dvf36EYAWhd2U5H/DWYY8+7Uj6vrxh9weiGbJ5bXMG4tBfggtLdBAjaZEgLMS2MG4r1R8Hzm/sa0i9t0E39FGciW+XcZQiYBCAGq9Y/9YRPu2q3KpK3TK3jG94niidlmS+xSs+JfDPPg2pegHlSZZnbsfjK7W8KyRNSt3tZEOb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mG10IvCq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mG10IvCq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D40C4CEE2;
	Mon, 14 Apr 2025 13:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744638997;
	bh=VPEb2K8tDnYjiX8IJGMJSBmSgMFmgydjh+ShSPL9v4o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mG10IvCqFdT5Y1P9uGnZ/YRaWdJZo4xuhf5uJmwvYMZdfMhLsvIloBa9KKcqZJP2t
	 Sv/ub4mYZ/gZemsptAs3HhKlYQCy0vWAH2xqhOcZJFWkY6zVpyBRDEoA1g1yRIS+Y7
	 KDtSMErL5EHalwpxYyqvvj8+LnLp0gpVHw6QDSH38FxKMvridvOBAHCwwFOk1MUfHB
	 LNeKDGR2C+mJUfQ141RnjPk0OPQpqU+WLXz33VGZg3ryOloOjYbHTWT/qr3YuDfPrx
	 OaOVp9PYd3HUm2fUprKx124Fu2OzY3F2Rs8R1eYxZ4aV+p55gJbVYgxrgud3brsPJq
	 nu1Ly89V5jnpQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250409104544.878475-1-rf@opensource.cirrus.com>
References: <20250409104544.878475-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs-amp-lib-test: Don't select SND_SOC_CS_AMP_LIB
Message-Id: <174463899647.86688.12448424769294907568.b4-ty@kernel.org>
Date: Mon, 14 Apr 2025 14:56:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 09 Apr 2025 11:45:44 +0100, Richard Fitzgerald wrote:
> Depend on SND_SOC_CS_AMP_LIB instead of selecting it.
> 
> KUNIT_ALL_TESTS should only build tests for components that are
> already being built, it should not cause other stuff to be added
> to the build.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs-amp-lib-test: Don't select SND_SOC_CS_AMP_LIB
      commit: 96014d91cffb335d3b396771524ff2aba3549865

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

