Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890827262F;
	Mon, 23 Jun 2025 17:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750700509; cv=none; b=g1TEfCGuaXSOhh6ZT0vKvKHNKRfsalmsUOOCj7fqu7nBt2JlNPUaF9t+dYhW86DK2gXojvt/ExcCf7zJoOXxSAQP33pgpoX30IFjtpxzws9T2DssSQEe6ObSIR+X49aMz2NCWBnJD82UO4bm6Di2yig8Tc9QAqQTSXD7bn54oPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750700509; c=relaxed/simple;
	bh=xN/A8HvexlN7YR43s6eAIX13svQo3ngl0HP/TpVfgL8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hOYg6jvOxOqN17N2iPpBiKYm+czppZbV7ljCtlhMSaI1ehHUv+jOc1AwOBOarVcRovA4EV4SmIsk+f9GgaFickY66fqaXRlBV3OeXAaq+xHK1JiRJUzfLcyRv1ehIJsw4Xl9FiS8g/C0lPG9RY9PRvlP7rVSpyLWSVqK9Q5MGV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JkLc4AK5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JkLc4AK5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03739C4CEEA;
	Mon, 23 Jun 2025 17:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750700509;
	bh=xN/A8HvexlN7YR43s6eAIX13svQo3ngl0HP/TpVfgL8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JkLc4AK5rsNIaammDjeW4cmKVnVKAoa2c54D5jWoFfJvWgMWEZBsO6E746V/w2EHR
	 uW8gGVkIe10A50Dadg5750SaRxEOw6bc7ZZSalsTsbSvAJr3DKikCBQlyVpLrR3rnB
	 WggFC+r7Tq3wCbGXgAwZ/rLPWsF/J6LW883h+BwV0CfmzrRKjaelkXb/bQW/thljcE
	 Dwgpd1XRh/1ZbR9NCzkB/5SsCPh7yumJTLdtgGVbONVFll5ikzQ7AqmZSv3dEgX+fV
	 sNlURWvQXOQF3iXJ7bvYJCAOzae9+86xObv2DzJH8R1nTj0Uv21APn03y1wf9XHz7D
	 cQfJnitoVHhmg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, kernel@collabora.com
In-Reply-To: <20250623120144.109359-1-angelogioacchino.delregno@collabora.com>
References: <20250623120144.109359-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v1 0/4] regulator: dvfsrc: Add support for MT8196 and
 MT6893
Message-Id: <175070050673.180798.18078248798013183788.b4-ty@kernel.org>
Date: Mon, 23 Jun 2025 18:41:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Mon, 23 Jun 2025 14:01:40 +0200, AngeloGioacchino Del Regno wrote:
> This series adds support for the DVFSRC regulators found on the MediaTek
> MT8196 Chromebook SoC and the (unrelated) MT6893 Dimensity 1200.
> 
> AngeloGioacchino Del Regno (4):
>   dt-bindings: regulator: mediatek-dvfsrc: Add MT6893 support
>   regulator: mtk-dvfsrc: Add support for Dimensity 1200 MT6893
>   dt-bindings: regulator: mediatek-dvfsrc: Add MT8196 support
>   regulator: mtk-dvfsrc: Add support for MediaTek MT8196 DVFSRC
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/4] dt-bindings: regulator: mediatek-dvfsrc: Add MT6893 support
      commit: a6c05c2e6871c94b349703c1ec8584763797fd8e
[2/4] regulator: mtk-dvfsrc: Add support for Dimensity 1200 MT6893
      commit: 7aafbb463be85472dc6db194ab9df45fd497c998
[3/4] dt-bindings: regulator: mediatek-dvfsrc: Add MT8196 support
      commit: ae77b8e8b0326818bd170818b37d055aa57a1569
[4/4] regulator: mtk-dvfsrc: Add support for MediaTek MT8196 DVFSRC
      commit: 024f39fff6d222cedde361f7fe34d9ba4e6afb92

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

