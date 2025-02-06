Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E473D1DD525;
	Thu,  6 Feb 2025 20:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738874670; cv=none; b=Nc3P0A/ftsgAQHJ3V35Q6xf+gPUl2wiNnl4mg/GKnFPAkiWhuanqhdbndfa6A+UIao+inPpVCEWAJNBHrjoCfuvh2MBMLYAwcAq9yWLwI503yEkQUPMEEAkX1Eikav9HiYTqjJY1/0yjN78zSvoH0cagdoNFSJs12e/yaX0d74M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738874670; c=relaxed/simple;
	bh=9/BjKNQob0i051RM/NhQMZ81uuXQpF8V4Svk75CNUxE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YPEGnv8zJmAQ1b4YqDmksKl5NjFJ2q6REX3cHIQi6t7bqSEW4vQ18gJGwWvIqD6XaSJdyO3zgoimkMeUUU5TCo4zL0kR4p4uGvxLXgPHIxd1eV47bzDmF2v8mpq3ufFINOzyAFKa9AEYmpIlH+g823QQxVtX01yNsJCKadc1jv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V92vmPtV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V92vmPtV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5B5C4CEE0;
	Thu,  6 Feb 2025 20:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738874669;
	bh=9/BjKNQob0i051RM/NhQMZ81uuXQpF8V4Svk75CNUxE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=V92vmPtVRFQDUNgC/2CB3B5aNiqQ/uwZ+2HiTCPPKGhdD/Gka+ugVTzH6ApFL7tKi
	 FMygLKo+/lDxVRzNq73b28yqoWtdtQqVfh83kKGzWHFIITc3O0+V1ruziz0TuHPvNe
	 Mne1f+t572YR8wY4j26aJxOafNJR6r4Hdm9q+vUt/TjrjjVj82lQmeH9L6Cd52h7z0
	 ywKRBBSoElKgfa8P6hb/h6su+5vCshSpycLdA9jEvmW9pyzgn0e4YWWTBYTgTJp+pf
	 DCDkCiFjnajSQKPxpSRzIFAuhAsCdg/yYdraWknlc8hHgUFWrzW2LE3OBWqcWCnhwt
	 aSQCXLvtoW9qQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, 
 Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20250205165337.3466336-1-masahiroy@kernel.org>
References: <20250205165337.3466336-1-masahiroy@kernel.org>
Subject: Re: [PATCH] ASoC: dapm: unexport snd_soc_dapm_update_dai()
Message-Id: <173887466782.363675.10680624737445148918.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 20:44:27 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 06 Feb 2025 01:53:34 +0900, Masahiro Yamada wrote:
> The symbol provider (sound/soc/soc-dapm.c) and the symbol consumer
> (sound/soc/soc-pcm.c) belong to the same module, snd-soc-core.ko.
> 
> There is no need to export it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dapm: unexport snd_soc_dapm_update_dai()
      commit: 3f78762d17701f0435ad958b2821dc3243ff34b3

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

