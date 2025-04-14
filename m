Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF33729B79E;
	Mon, 14 Apr 2025 13:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639014; cv=none; b=OsN9fi421Uv1Y02XX3s1+hv/K/4xIuLzGr3O/44MW6gFIFjFBIEfVLCovMWbtVTD/IPOJ2sZpAXq15sXGkJLppH82cIMf7bvF+DfzVrx3A5HCm7ggWwhmkGQyQ5rcVDq5r3e5RFW2lXDePn+OWzf7tk4Vdu1krulvrF1akx+cFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639014; c=relaxed/simple;
	bh=ESCuQapauQmjDSGxrvdMiWpiZpAHRAJUwS3o5TN6AVY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RRbMtvYUDxaBDq/iZOPb8G6YVXZNTKHNZ7iOUwjc73smenBOEG95rl/HVCwBnyFl94aBRT0ikF36Yee3Yi21+PyM6NjFaGcZLMBkkSvSlpK3PfTLNNk1zhwy7iiZu4Xtvq0VPwSsKtPbKWgR4gTRhL0qH+TLgP3e4MPC28SlCz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jf11uyuw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jf11uyuw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB01C4CEE2;
	Mon, 14 Apr 2025 13:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744639012;
	bh=ESCuQapauQmjDSGxrvdMiWpiZpAHRAJUwS3o5TN6AVY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jf11uyuwRiOn7OWxfW/FwmJbtmCrgx/l83Yo46x674XqBJTyKdt1//0T7iACWhMwC
	 3gUe3I9cqTTiar1eVQttJp+r+Hx/18y06jqra+n1jqNyD67c72xH8EyJnqTAWmi8J/
	 fGosgy0I2+4jIpBlWrpf/EIKgcjm5Lr1O3tE6mDYlcZStLxC+Gf7Wa5yoFxb0ffTE+
	 ulW3T9ZcLpHxEBBlzX3h9R3Qh0syXzAyB3vlMZKnm0WF9/cFAoQV3hIORxiH+8FMQ5
	 LzeFDWRqY4cJKKjm2iM6X8N11TidFRh+C5OklUx15JL2r2wjOkCPEk+nQPQ851zjQy
	 WEJK3LnzMYwlQ==
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
In-Reply-To: <20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com>
References: <20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com>
Subject: Re: [PATCH v5 0/8] ASoC: tas27{64,70}: improve support for Apple
 codec variants
Message-Id: <174463900790.86688.4041479471029106682.b4-ty@kernel.org>
Date: Mon, 14 Apr 2025 14:56:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Sun, 06 Apr 2025 09:15:04 +1000, James Calligeros wrote:
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

[1/8] ASoC: tas2770: Power cycle amp on ISENSE/VSENSE change
      commit: f529c91be8a34ac12e7599bf87c65b6f4a2c9f5c
[2/8] ASoC: tas2770: Support setting the PDM TX slot
      commit: 7699892ad3cf3a9afc8c63886344f6e2b73166e2
[3/8] ASoC: tas2764: Reinit cache on part reset
      commit: 592ab3936b096da5deb64d4c906edbeb989174d6
[4/8] ASoC: tas2764: Enable main IRQs
      commit: dd50f0e38563f15819059c923bf142200453e003
[5/8] ASoC: tas2764: Raise regmap range maximum
      commit: f0aff451f399d09aaf2a23c4e2ef2077b9857ca5
[6/8] ASoC: tas2764: Apply Apple quirks
      commit: f33b01e0947d81c514bc8ff31ad28cae7ff6d91f
[7/8] ASoC: tas2770: expose die temp to hwmon
      commit: ff73e2780169a43617cc339686f5bd3d74fa8652
[8/8] ASoC: tas2764: expose die temp to hwmon
      commit: 186dfc85f9a824e3f8383322747ca75e988486e9

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

