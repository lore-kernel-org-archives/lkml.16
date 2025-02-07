Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D5B23F28E;
	Fri,  7 Feb 2025 15:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738942781; cv=none; b=hQFXBiC3D5+dpY73tQGQZJJPynMtQRmPo3ES4M2PnsZZgoSDoBMh7PnVd+Mbg1Hww3SLxWmbCZSciShhanddWtefzsN9iG1q8Hjf5HCGcGYzBmkSMcbvZ9tV0DPpCWcvr91HfOG/IyMhF+kD8viyCa0B5ZyQ8L4ejuXsoF/D/lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738942781; c=relaxed/simple;
	bh=t4uASqSznZ8tq16GmePFTS52RmjOiqzJK2YMsqAmkfk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LOtY3mO3AIXqLGN4wCOkgaC0mFcBR4Qp3oDcb0zLrDo+4MBZdzVbnd3zEzhypbI3VWXj9afvsj1RGpCR3/1vgH7fd7MUolzXxYjaddCUHKZOJIUNidrEq5wieofk0n7RcZKai4P0P8WJwnGF4lQWcZcFqcSmA9SKOiLXOSDtCIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/45OCr9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/45OCr9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06E36C4CED1;
	Fri,  7 Feb 2025 15:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738942780;
	bh=t4uASqSznZ8tq16GmePFTS52RmjOiqzJK2YMsqAmkfk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=k/45OCr9XJlWgmYK7lJW8wZlmlC8nXfiuYn+lN2FhpGlSB/4HQP9Z+CseuvVV8GF3
	 Br/lqmQZ7OngTQwaK/SQpRs0MKAJO2UraLkjUm7o9E7URcCGizlnAM9jklle4Nv8P7
	 2uhS65Czcoxdh7tz/Tkqex2cpW/SSBLPsTc6xBpWnPKag2fImzfoAACm5v7qg1q5FW
	 JXiqd+H/lTfxnikxPrz+n6+d8Q+S2NzEg6n367+JP73fPKwIgfXhfOsiFMomkMuq3T
	 c29p0fQmEhR+T+XTjnDHasI1izFLnr5WorNz9CIzME+w7X/H/PI8z+wWGZQDWa6LkF
	 F2KaOUjPcAgTQ==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Kevin Lu <kevin-lu@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20250206192537.1133763-1-andriy.shevchenko@linux.intel.com>
References: <20250206192537.1133763-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] ASoC: tas2781: Switch to use %ptTsr
Message-Id: <173894277874.54486.13898875284759460779.b4-ty@kernel.org>
Date: Fri, 07 Feb 2025 15:39:38 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 06 Feb 2025 21:25:15 +0200, Andy Shevchenko wrote:
> Use %ptTsr instead of open-coded variant to print contents of time64_t type
> in human readable form.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: Switch to use %ptTsr
      commit: cb161c333927142818d6bf22a4da2b023fb2b8c9

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

