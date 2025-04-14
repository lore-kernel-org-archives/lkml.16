Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1C52750E7;
	Mon, 14 Apr 2025 13:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638987; cv=none; b=QDQbWS2x6EUUJG+KL9+NkWCktMVWvLJvLCBMnTFWu3ILoPtw3/Q8A+7Mgr6hC2znQbmQxx+OWg8bG8bLhF+GZCEXHVvxD4Wct9nZwepnMi3+ztatKBu32IQNIMn5YrVeuQ4fcJqZlZlpTAtH6IHaGMdT1k2DrhrovfhcPy3LppU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638987; c=relaxed/simple;
	bh=NFLGYLwfMv4O8oauiY7vmwB/nw7imAlHzVax0tuTb+E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i6Ja071a5w47RglaC/5BFii8HOES/zAxm4s49HG+SgOEsOLx26FAszeGtcmp4PqO/VipZMZ53xt1qxO3wJF4Z6WqbMcwqwNXoa/6bganc4Avjs9dwWzIB4067d9/OoUijTm7RuevxUP/pMDN5GK3Qr/2YLLpSgdvauoRxU7OrzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/0pocpD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/0pocpD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C4BC4CEE2;
	Mon, 14 Apr 2025 13:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744638986;
	bh=NFLGYLwfMv4O8oauiY7vmwB/nw7imAlHzVax0tuTb+E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=f/0pocpDSbkaNH9t2nd0UfGeZ2kaghu7xBWHR8+RAV/ZT/esgLAF5DrxIVl7ml2Sr
	 vzP30Qc8TpuvpR/0hyX2N/+1EGKYtsKhy9I0dF/FXx1QNBwPUjNKeceQFehm+RZ+tj
	 n/MCvgJrKHDuQfmpOfoq28JeTkcCxqGGIEnMwDqMPoUTLk2RnvACi77o40eV0GEGek
	 WaGgqDcr8ZCsbvA7fCPhLtGHyEJ6CSJd+si0BmTDAK0uIOtxmIfbjIX4Xx/4olHACc
	 UkgJiOiV8WZTzb+poBd4KmPe9cjh5cfcVA01v7fQGNs7vDSkkkBe5fAqlz5ioY093k
	 hs/OwjkW6ARlA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Dan Murphy <dmurphy@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-hwmon@vger.kernel.org, 
 Neal Gompa <neal@gompa.dev>
In-Reply-To: <20250227-apple-codec-changes-v3-0-cbb130030acf@gmail.com>
References: <20250227-apple-codec-changes-v3-0-cbb130030acf@gmail.com>
Subject: Re: (subset) [PATCH v3 00/20] ASoC: tas27{64,70}: improve support
 for Apple codec variants
Message-Id: <174463898202.86688.2390703716966922295.b4-ty@kernel.org>
Date: Mon, 14 Apr 2025 14:56:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 27 Feb 2025 22:07:27 +1000, James Calligeros wrote:
> This series introduces a number of changes to the drivers for
> the Texas Instruments TAS2764 and TAS2770 amplifiers in order to
> introduce (and improve in the case of TAS2770) support for the
> variants of these amps found in Apple Silicon Macs.
> 
> Apple's variant of TAS2764 is known as SN012776, and as always with
> Apple is a subtly incompatible variant with a number of quirks. It
> is not publicly available. The TAS2770 variant is known as TAS5770L,
> and does not require incompatible handling.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[07/20] ASoC: tas2764: Reinit cache on part reset
        commit: 592ab3936b096da5deb64d4c906edbeb989174d6

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

