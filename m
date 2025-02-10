Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEEA255E53;
	Mon, 10 Feb 2025 17:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208194; cv=none; b=htp15rD7avtjoohBlQOtHAB3Uu4MmCy+bcwheAgewcso7NIuKcZOBP55c3UqQkoY8TpD/AjNo+ZKB8N7yKW8+aafY5FIJaS8BxsOFSMyBIc2CggJsP21ifvho1l3S2C/TUhe9okyu1e2MbB7q5YR4bMFMaDPneVGxALnRdo0l0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208194; c=relaxed/simple;
	bh=wVskpJ8GHQzPO2wg2ePTDW5/ZwDeHg2jB+/gb6+BpJs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FEOMFIxWMT0smbHXnf3jYQrzpKrwg1UIIUWgjh+gIHPJpj+jQqMBhjNg/Cu+6WcjyCE8xZCOk52joB8Pgr6q/j4D8VIYHwNOUiFiKUg6UMmckacQiLhtfEhZGFZ0b3TWQXK0rZsj10mbpFnG1fboGoLbksdt79Hur9VZR68u1PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EQKiK0t5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EQKiK0t5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F754C4CEE5;
	Mon, 10 Feb 2025 17:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739208194;
	bh=wVskpJ8GHQzPO2wg2ePTDW5/ZwDeHg2jB+/gb6+BpJs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EQKiK0t5UbtvtBWBKTSoMANLWs/NJPa0/PZwgY1e6FYyhOkYuu16PxK49Jqa7Ks/e
	 baC6Bwfvu0RGasTA4LjcqJqMhFtv7QMqbpuw1c1Bku3P3+IV/WK2QQ540A7o1C47G9
	 NW9As2A3NzOk+yAkdtm808nNTqGJHSXQWInqgNuxMqU9r6n++eQ714DocxiiFlxlBF
	 +bu0g53n3qCcGaCwkTkgEkSy6b+aMJDyVd1LJNBqPe26p8/JCakNZJXpuZN8Ti6jnv
	 ghshZDAPfIkHtGsC0mT86wX8P4i1oEzt3Qx5Kqur4VjzDtF69bWSvE0nEq/LllNMF/
	 Fnk8FsmtoH+vw==
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250210132128.7734-1-johan+linaro@kernel.org>
References: <20250210132128.7734-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] ASoC: codecs: wcd93xx-sdw: fix of_property_read_bool()
 warnings
Message-Id: <173920819281.83245.14686967088075283953.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 17:23:12 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 10 Feb 2025 14:21:28 +0100, Johan Hovold wrote:
> Using of_property_read_bool() for non-boolean properties has been
> deprecated in favour of of_property_present() and since commit
> c141ecc3cecd ("of: Warn when of_property_read_bool() is used on
> non-boolean properties") this also generates a warning:
> 
> 	OF: /soc@0/soundwire@3330000/wcd9380-tx@0,3: Read of boolean property 'qcom,tx-port-mapping' with a value.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd93xx-sdw: fix of_property_read_bool() warnings
      commit: c5528214c7c0a753c908a7b353309ba665985fb4

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

