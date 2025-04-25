Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B07211A3D;
	Fri, 25 Apr 2025 17:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602824; cv=none; b=HBiRt810InRTVrTYKK7Z+zrSFf5cHyaZe/CbP69zYB89E1T7TshuXO2mgjNoYTluQCy6SM8rebEaVI46J9bUBLCEVR5cGdgrBTTefvKjbSXFxOQpE8G0Ig0k/TBSL+klaft6QWDRHXAcLl1S7K7bv2EVpjcKnt5iIByH4ZJ+R0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602824; c=relaxed/simple;
	bh=dD07SS44wuizxAu68++AhwtRyN/8n2xaSdbZAAQzMHs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MI6cgCw/tDjukPkYTi9FLDPNUjhXYolIq0Fd75aynSGtKT5wDvn6tGSDPZevRE8KiJW3RGj3omEoFd+5xdov/GKloNjYqdzbIhThRtIkyFDJxxDuIuUR6ot4kWtFxwn6ZQG8aOV3fzf3cPcUiE5eb9quStriZ138W1yJpf6tSrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3MlYAir; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3MlYAir"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45786C4CEE4;
	Fri, 25 Apr 2025 17:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745602823;
	bh=dD07SS44wuizxAu68++AhwtRyN/8n2xaSdbZAAQzMHs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S3MlYAirmw8B+RJKBrrLSjIeAhYy/ps8kGvVKpn8bXTO8Q5OlURjy+96mQeDzbwN7
	 xUlb7BLn++DemBOnwTN2cRgYOb5+m3OW2wbXcWKkAEz7Z2+2wNZ8n7k9XlenWXH5xR
	 zbzDOwfDgy6JQxuEn1ChHufj+WN4Tk657pSRj5vO9fcjL4KXl0/gyGk/hLHB77S8Gk
	 eYanJYswu3RlMXPN7KW2P/zUDkbelMbZx7cy3GfuszFL44O8hXXU8ojlW7TpOAtEdi
	 F1kYGAvJuJSoPR1dxJQZpYd6fldSqjYmP2vEkNSdv6JgI5vyBfv8+SoJ6Ut4aD5xhw
	 VoDHHQww4svig==
From: Mark Brown <broonie@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250424133648.86459-2-thorsten.blum@linux.dev>
References: <20250424133648.86459-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH] ASoC: starfive: Use max() to simplify code in
 jh7110_tdm_syncdiv()
Message-Id: <174560282200.225473.340728717437668088.b4-ty@kernel.org>
Date: Fri, 25 Apr 2025 18:40:22 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 24 Apr 2025 15:36:49 +0200, Thorsten Blum wrote:
> Use max() to simplify jh7110_tdm_syncdiv() and improve its readability.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: starfive: Use max() to simplify code in jh7110_tdm_syncdiv()
      commit: 0787a08ae785366b9473905fc8bf23f165a08b8d

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

