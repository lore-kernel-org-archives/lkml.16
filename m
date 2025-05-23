Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52E41F4165;
	Fri, 23 May 2025 17:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748022332; cv=none; b=iGL7wCNTwEkYTCoIRRm+UJm3FokpH3ayGnr3RZl5WHqbPwhSkTvDlIn5TFuM5msuLVDr9T/Gu5wvorfssnnvSZwWTo56tZfVtXgPqWZNUnKXYPAZOfsCPoaibsa+5E41Xu9aT1B4QTV1HqT/iTY+O41ibtTopfmnboTPhqk+Zbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748022332; c=relaxed/simple;
	bh=Q+pVy9VN5G4mHqq4thDKtZgwMSFkUEGc/BFX+XL7hKg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uMEKxfghiVduwa2whazkHhjaSayf3jqSUDngHuJAnwVylKwEdZ0HCZRitE3m1NoIRnTMADaaPy3XepPMBaUagnsaj3aZchFe15cAQLE1cRVno0igNTktk+jKl5iPOol4fajzD9dnwlv9k4UwRXBaFkTxjb1+5HtgngRKF2Tm4h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uN/u3zlH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uN/u3zlH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 810D0C4CEE9;
	Fri, 23 May 2025 17:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748022332;
	bh=Q+pVy9VN5G4mHqq4thDKtZgwMSFkUEGc/BFX+XL7hKg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uN/u3zlHN302bSpReVbi28j4kEtGlncXxVrkOcYDyPFBWQBvlz8K6Dv7q9AvrFZfl
	 1lyCZkNVSkLFLeLSAYsUAwW9x0gZ9G9/Fis3pB4JBeFgKj7oDURyCI9X4hdSq8CZQP
	 yPdwKHs0F00Qk4lHoviXh3+zR5ufeWtHFAkGPX3JMQy4bLkUdXa2257TfGjEMrUkG+
	 BOV6kx5jc/8XP3GC5nU0ONiJLecgCXw4/nl+s52d3c98ODfME7KYz/q86Wz21cIgnN
	 rS84Mbo9nSPFH48NqBD6FIzvRVuDdKao7gEpdBbc4MU4c33OeIt5q+N+oJopyZdAL0
	 EbYBNrnwy6iCg==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, tiwai@suse.com, devicetree@vger.kernel.org, 
 conor+dt@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, perex@perex.cz, krzk+dt@kernel.org, 
 Zhang Yi <zhangyi@everest-semi.com>
Cc: amadeuszx.slawinski@linux.intel.com, krzk@kernel.org
In-Reply-To: <20250523025502.23214-1-zhangyi@everest-semi.com>
References: <20250523025502.23214-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH v3 0/2] ASoC: codecs: add support for ES8375
Message-Id: <174802232881.580585.23933896595053519.b4-ty@kernel.org>
Date: Fri, 23 May 2025 18:45:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 23 May 2025 10:55:00 +0800, Zhang Yi wrote:
> The driver is for codec ES8375 of everest-semi.
> 
> v3 -> v2:
>           - Modify some control-names
>           - Delete obsolete terminology
>           - Modify tags of v2
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: Add Everest ES8375 audio CODEC
      commit: f70d0f893b945aa42576853212645f4d889332b4
[2/2] ASoC: codecs: add support for ES8375
      commit: 43a38a0ff8c63ee156d997cd13063c63cd55d812

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

