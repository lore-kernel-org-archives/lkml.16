Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3D21DA614;
	Thu,  6 Feb 2025 20:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738874668; cv=none; b=jjWtl1jusKaUfuxlz1U+3FzcZUyBrc+vUBgk8F6AQ+oFrftwiPNXUnToMQVsaVkmKrtB6mdRXcgckkAMv26qqbHfphTKV+XmmEO3sA58phLNkW7gFXtamzBu2ACqetXYFyEglhz21L0dcN8cGSXmWZVi9E/KxZS6DoqhW6dFhrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738874668; c=relaxed/simple;
	bh=EmRPpvWkvN/dCqNFWHCGCl72za+JSdjoyddIgiMtxrQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ro+x4sa9cXTW0d3eAJMUlVkMY5O5e4LugtJ8CNL1WGtrMASMoACLBkvQ71WaeDUta5gWGr13VEgTrTKjabFMjhRlIlRsJoNi41qwmkFvhVjJBWAtee88dsRkhqOhfQty5G39GD8kgyAkXFRkMIAftujixqfoTDnSGky8mNbDHPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vDUnJ6NQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vDUnJ6NQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5685DC4CEE3;
	Thu,  6 Feb 2025 20:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738874667;
	bh=EmRPpvWkvN/dCqNFWHCGCl72za+JSdjoyddIgiMtxrQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vDUnJ6NQmSMnG0uI4OI1VPuIy3kPPcRi6zMqKMrEx1TGuTC6eiAtbyhS/gue+nerJ
	 mGg+UDBQ5emzAUJwuhMj7gBoeVfqHSg4aeojCZvip3BT7A2seAu+Kd4fcTIWskEToZ
	 JbrsZ59ySpatiQ1dyE1ZwNwFPoEXrblhL+XJSO8YwBI/RTgqNSZ3papauFSepGQz7Z
	 2EeiEc53Qa98WyRIRvFa2wkZNW1uCzd3T8OFxGJ4IKBbLpQ2uo/DnTbjCrDSThEWos
	 qtYAXUtMcC0AFf3Ce3vJhGf1qIa7J9djRN3jF/3FWGD1J/B9RX3pD5UKBCORU13Knj
	 7fikrgrY1qiRA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20250205165310.3466254-1-masahiroy@kernel.org>
References: <20250205165310.3466254-1-masahiroy@kernel.org>
Subject: Re: [PATCH] ASoC: dapm: unexport dapm_mark_endpoints_dirty()
Message-Id: <173887466606.363675.8291806666998136388.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 20:44:26 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 06 Feb 2025 01:53:08 +0900, Masahiro Yamada wrote:
> The symbol provider (sound/soc/soc-dapm.c) and the symbol consumer
> (sound/soc/soc-core.c) belong to the same module, snd-soc-core.ko.
> 
> There is no need to export it.
> 
> I deleted the comment, as other modules cannot use it any more.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dapm: unexport dapm_mark_endpoints_dirty()
      commit: 2466b62268c020606d20b45e007c166399e639ee

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

