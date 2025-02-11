Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9723D26389C
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 19:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739301229; cv=none; b=odPliElL+Kv9cCyEAojbDVN0nwwolgCCvM6hR56GnQI67HjxJkhQIT6cAcnJoy/johsut0QD1/sb+Ehh+8zD7YCLeUhxEw3k6wusD9z6p7DecMrXoTp5G/kpcEh7/6sWMX53DkcBFbh/e/3bY8aJkgDDFP9arYMLjFKBnfl191I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739301229; c=relaxed/simple;
	bh=NG/2MfDwZWxzMwH0mGLTEUIdCgVU5Hme23hfo8kUz3A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CTRfr265Y+TQtxRY0mQx8UC0WoktKrltFkVsDS/jePw9+wDo7eJf4AnqfhBnrk0y9raQqHTG33IB5MoAfYH/K/AO6SYVjfrwCxo9aemCn3WqI2SbXYmUBVf7ge4RWuTWWVOne8bpNtkfMfFtZZ0vRhEwz2VIi+Q5scSAS8udWUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q5oDbj04; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q5oDbj04"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8F0C4CEDD;
	Tue, 11 Feb 2025 19:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739301229;
	bh=NG/2MfDwZWxzMwH0mGLTEUIdCgVU5Hme23hfo8kUz3A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=q5oDbj04x8lVu6n8uLP/5c++3HJTBXsHDRajDb+djjlAtlnBCBOaFGkDxVUsl6S0O
	 m7TZOPiAtBfkDYuhudjH/xTNqGNcLYLh9GEBaOHRxSAnc00QRfh02J4rs2VEjsC2NR
	 bTutXyVjmmZeLyLTzS/Kx5S+elWaBieOs1M7BLUUOeUa7vAWYuJRj8wqMtDf7ck3J5
	 zVDMouVkTRCmhny+xcEPR8Rkr5hCC2RRJGAV4cR39MfdEj242uUOO4X6f+hqWM7wFl
	 1132klhMMk7M1jpmkwCNLm0cuBJBpdWfXfvsVi/yqRXXmf054uf7rdkFgvV0KoHa1s
	 gDO2yK7O5E6GA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <20250211-regulator-init-data-fixup-v1-1-5ce1c6cff990@baylibre.com>
References: <20250211-regulator-init-data-fixup-v1-1-5ce1c6cff990@baylibre.com>
Subject: Re: [PATCH] regulator: core: let dt properties override driver
 init_data
Message-Id: <173930122805.78581.16583188319428497284.b4-ty@kernel.org>
Date: Tue, 11 Feb 2025 19:13:48 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 11 Feb 2025 16:48:06 +0100, Jerome Brunet wrote:
> This reverts commit cd7a38c40b231350a3cd0fd774f4e6bb68c4b411.
> 
> When submitting the change above, it was thought that the origin of the
> init_data should be a clear choice, from the driver or from DT but not
> both.
> 
> It turns out some devices, such as qcom-msm8974-lge-nexus5-hammerhead,
> relied on the old behaviour to override the init_data provided by the
> driver, making it some kind of default if none is provided by the platform.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: core: let dt properties override driver init_data
      commit: 35e21de48e693af1dcfdbf2dc3d73dcfa3c8f2d9

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

