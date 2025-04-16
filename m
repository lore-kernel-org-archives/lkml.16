Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B45E224227;
	Wed, 16 Apr 2025 18:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744829680; cv=none; b=KWrK2wlbceJW4L7k12xuhLgCsCfXWuGwlX8iaBIXl4uC0jtTtBUVSZDGeVd6+NgytgRBoAxhIdyY5JL+xMebEBJnnyOpgEHw73U9JgsjrsLObCM/Whu+DdOSLInFASIGnnZq93RZXxGiPRwnl1qQyPbLwqaL0Wk3hRJRpJsFbMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744829680; c=relaxed/simple;
	bh=xni/UIFwrUe9Y19o+gZ/eMRivYlOScEne4PQfxNvlyQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=T5gg9JQLLb3MQbmFgOCURL4X0h26eKmDuSoMZiRNFIVBaRUh7aKTLJuPBU9ZjN0PCMsyPUIvmlCy7GfPUVPwfcmVKgGA0uOtPHMN2gEDaC+S9QsArLQLtGHTOYjWkqstIjOsARhXWd2MM5DGfcnF/atzfkJ9sEjRbqXjeOrUW3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rQoUPfdV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rQoUPfdV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733A7C4CEE4;
	Wed, 16 Apr 2025 18:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744829680;
	bh=xni/UIFwrUe9Y19o+gZ/eMRivYlOScEne4PQfxNvlyQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rQoUPfdV8hfrtYef8/CK1sbMD8jmhfqlApmVr4rcczz1brQaWLBTb0UKXOr3UHPAF
	 EOu0sryReti2zzxA5KwyymRzZUyYVQr4wC+VoN4wWMYqsm+18d4tWPXsK2zKKgaVsz
	 8N5wY32ZjxdSATJwe30a2+3YKxLYyo/SMeiyEjQ6D4aokSMH36te31bt2aoROGwSjb
	 tnISNRLPlZHUNZ+OuWHgEaQvwRJXi26F+tYfQ3rntWIqH6+SQ4EHcAMUv7QwBfMrA0
	 noL+nY9NsxARN/3dsXMmNObOcbgBLV704TyNCWB2vKZcPrwf6Ve14s2aHjIldF5vRZ
	 UqyuqgGhR2iBQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 ckeepax@opensource.cirrus.com, andriy.shevchenko@linux.intel.com, 
 heiko@sntech.de, shengjiu.wang@nxp.com, Chen Ni <nichen@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250416041023.546311-1-nichen@iscas.ac.cn>
References: <20250416041023.546311-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: ak4458: Remove useless return variable
Message-Id: <174482967822.823707.3884563966780253563.b4-ty@kernel.org>
Date: Wed, 16 Apr 2025 19:54:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 16 Apr 2025 12:10:23 +0800, Chen Ni wrote:
> Remove unnecessary return variable and compress the return logic.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ak4458: Remove useless return variable
      commit: 65bd426bace60540c5b6710890800abb1accc5ce

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

