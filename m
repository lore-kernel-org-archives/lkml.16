Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7FC294A06;
	Fri, 23 May 2025 16:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748017301; cv=none; b=YazUYMiO8jMbS/h1nqDvJiHJvum4ZO0Q8ZZ0mdo49tJWzSLRnqtD9Q4ss0Anvdng53ZeWDHdApLyvbmWvlBJ/ng1GT1qY/F3IVOCxwkoPLJLODSpBocK9wjGf3JOQub+2fC6SRYw+AgzbbMHr5LoDGW/7RMhc3/enRYViLBv+DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748017301; c=relaxed/simple;
	bh=eutAjVroypnbDRz2QE9Rm3mywLZ3UBKPobYxoRL5Dss=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SAHMGsZk0NX7f5jXLWhEdRrLjEscId9zfwfQ1NECrERh10+QiRAp5D9Sy9qH4EAJ1w7JqrlMicV1kd2DE+nVjYU1sWi7Q6GDW7knSkCQzZDzQJzS1ZmWFc5TIrH2Ik2nAvp87Ay1DD5slctkyd2/TYCBwjZf4haxtiTgUSRCBCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJqIWtqJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJqIWtqJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A38CC4CEE9;
	Fri, 23 May 2025 16:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748017300;
	bh=eutAjVroypnbDRz2QE9Rm3mywLZ3UBKPobYxoRL5Dss=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oJqIWtqJiP6jOAhFSJWVjzHZo+Ggb/S3F4of27UjkCf37icNd/+aMFWNL/FTtsF6U
	 OckJqKLNqDWqiiaox5agrE99yW3tilv2VJC7NY77QfQeKGld1MMxZkanh6B5lIg+M7
	 BeQF78NhV2ttJoqVtKK94OlZQaLLgUJIXjJXtuwgVekOWzqdQUvkJO3Imz4u+HkHn5
	 bqEKIV7DnNsCYi7XpaD/Ohpej+Q8nE90UzQApzpb19xLROEbLuugM+Rr74y0VAaEMz
	 bUH38GdcGIqRRkPeWJaoK1naDOhfi3PYSSR2vwKQcyrlz5qvf24OeX7/c+guTK5Qj2
	 ksRq/CY9RR3LQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robin Gong <yibin.gong@nxp.com>, 
 Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20250522192325.1099680-1-martijn.de.gouw@prodrive-technologies.com>
References: <20250522192325.1099680-1-martijn.de.gouw@prodrive-technologies.com>
Subject: Re: [PATCH 1/3] dt-bindings: regulator: add pca9450: Add
 regulator-allowed-modes
Message-Id: <174801729781.578098.16768660592418154140.b4-ty@kernel.org>
Date: Fri, 23 May 2025 17:21:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 22 May 2025 21:23:22 +0200, Martijn de Gouw wrote:
> The PCA9450 has support for forced PWM mode on the buck controllers.
> Add support to control this mode.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/3] dt-bindings: regulator: add pca9450: Add regulator-allowed-modes
      (no commit info)
[2/3] dt-bindings: add bindings for NXP PCA9450 PMIC
      (no commit info)
[3/3] regulator: pca9450: Add support for mode operations
      commit: 2616e5f4fe04eb25eb5cbabc0a3a2a374e14008e

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

