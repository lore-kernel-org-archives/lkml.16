Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA282222CB;
	Thu, 15 May 2025 07:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747295000; cv=none; b=uHbB1b5yC3SOvi6wE/mOsekPPRIcAHIzcnOOyKZhQ1D6du4ZmpquRSnJ+10xj70wi6WTQG1BRL1sF/WUYEloGQkwCtdwmADvUdaxzQw7mq1bU8JNQGAwfCDGU0AwW98c4uAaYOrcuTt+5iDyC/14/U1zsX2Jt92WzNgPNJdfN/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747295000; c=relaxed/simple;
	bh=h1lP/XXLGAF1oDoLpaZY+0OrHUGsOnllqHLKbDeAURg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=egNDjJKporwJbHDCtArrXb/EcYTfJ2dkjgaOdOT0tP+PkryzsLd4N9Ff/in2LBN5C5ddgz53yBTT5jqlPuHzw8KY/Jq1Ju5graxGVJFxIuF+l47HTO+OEN/rP9JIWWQK3YctXCJH3bBZihfEXoJ8GJE4UX8Z//xT2fUeqB+/cb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+Jk8h+d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+Jk8h+d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F06C4CEE7;
	Thu, 15 May 2025 07:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747294997;
	bh=h1lP/XXLGAF1oDoLpaZY+0OrHUGsOnllqHLKbDeAURg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K+Jk8h+dtlENycXrCf9xiGgBIODRP64nCCyfmd5mwwfFiuecBzNt+8y17DbOE/Xgd
	 WFXCvPM75xcNZQ0kk7VgG2G4G5SFydPF305XY7Z4Ox8eUI7gvz4o8JPsuRdz8iyzy/
	 HfjxbEchRRi1LpfvbNkjZguOlrlGf+bYUzR69nbCal7J2DV5h+SqEZDN15n2iFy0PF
	 NQ5v2LSL0DAO1d8yw2Bzh8wyUMnllANDiMc+IQ4WwVhkvzcKYctr9suI2rKjCnXhGz
	 2P3Pa3QDBNrDFkgpnuiSfo9Htlo8zTHTmiN3BWLsN1Rt8smb1LhsGrhW8+6RpDc+4K
	 ef6n8aMEtKYvA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen Zhong <chen.zhong@mediatek.com>, 
 Fabien Parent <fabien.parent@linaro.org>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250514-mt6357-regulator-fixed-compatibles-removal-bindings-v1-1-2421e9cc6cc7@collabora.com>
References: <20250514-mt6357-regulator-fixed-compatibles-removal-bindings-v1-1-2421e9cc6cc7@collabora.com>
Subject: Re: [PATCH] regulator: dt-bindings: mt6357: Drop fixed compatible
 requirement
Message-Id: <174729499095.280025.830867783307923858.b4-ty@kernel.org>
Date: Thu, 15 May 2025 09:43:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 14 May 2025 08:36:06 -0400, Nícolas F. R. A. Prado wrote:
> Some of the regulators on the MT6357 PMIC currently reference the
> fixed-regulator dt-binding, which enforces the presence of a
> regulator-fixed compatible. However since all regulators on the MT6357
> PMIC are handled by a single mt6357-regulator driver, probed through
> MFD, the compatibles don't serve any purpose. In fact they cause
> failures in the DT kselftest since they aren't probed by the fixed
> regulator driver as would be expected. Furthermore this is the only
> dt-binding in this family like this: mt6359-regulator and
> mt6358-regulator don't require those compatibles.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: dt-bindings: mt6357: Drop fixed compatible requirement
      commit: 9cfdd7752ba5f8cc9b8191e8c9aeeec246241fa4

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

