Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66362CA5A;
	Mon,  9 Jun 2025 15:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483601; cv=none; b=cQzzZAUaKcD7JWxyNfLL1ubq2BcR3pnvz7P+pVd+LGP9DJVuCdF5PvBAMAWvClShCpmegMVpseaEq++BZGWFVG7DI+NAuL3MqY0Uh3p0DGw7FuI9MhfEDZ462XGdA8QQmp7HjaeTnid9ZK5kdIJVp4GWtuV139AWMCAFA5H+GkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483601; c=relaxed/simple;
	bh=79i4R9SAD/alYf7WTzRlygyu10EANW52xvy2M/Do+QY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DizJUtAilF553o4vYi7+ZDmi+roeo0g+yrukiSLQP35GhsJqaqkVWNla6f6Yy2I/+Ap92y1vX/RCZlArBzHXYONA2oD7nPreygWRziNMuCvjrmGCjkFU0xRynorlX1uEou5blDQf/2pFLV4GRfkhrU+SUaDXadU5XYiM0iu1gjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jkd8Z7hy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jkd8Z7hy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77850C4CEEF;
	Mon,  9 Jun 2025 15:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749483600;
	bh=79i4R9SAD/alYf7WTzRlygyu10EANW52xvy2M/Do+QY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jkd8Z7hy9VcKFGVF/k3GMiuZNhA8hpfqrTKYXXW9Je8G7+feslv2lSkbwsZS8sFn5
	 QHkWbADZUD9XV/luyZa1vbkWCt1YTgW7akHYZKWDy1u9qBHveFledA9n37B2QONLhc
	 ZktHqXIL8WQg79ILLwbsqsTpd6QbQQChORr4D2Z059wold8li4fSPKbQ43s6UTBLk5
	 upjF0NTuViNfBiXpLY8YpDs6hSLQJduk5+MecH8Rn1R99xoBKCITYInJG2v8E0UW5V
	 wy4Iuom04TDjcvXLP3bV1uWBwQmfeOkoAp2zASX1+v/QVpagpQSE8hmgbp72YIZWE5
	 LwbWi+g1AK2wg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com, 
 Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com, 
 mario.limonciello@amd.com, yung-chuan.liao@linux.intel.com, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20250609121251.639080-1-venkataprasad.potturu@amd.com>
References: <20250609121251.639080-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: Fix pointer assignments for
 snd_soc_acpi_mach structures
Message-Id: <174948359821.187608.7932953931685705829.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 16:39:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 09 Jun 2025 17:42:32 +0530, Venkata Prasad Potturu wrote:
> This patch modifies the assignment of machine structure pointers in the
> acp_pci_probe function. Previously, the machine pointers were assigned
> using the address-of operator (&), which caused incompatibility issues
> in type assignments.
> 
> Additionally, the declarations of the machine arrays in amd.h have been
> updated to reflect that they are indeed arrays (`[]`). The code is
> further cleaned up by declaring the codec structures in
> amd-acpi-mach.c as static, reflecting their intended usage.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Fix pointer assignments for snd_soc_acpi_mach structures
      commit: 0779c0ad2a7cc0ae1865860c9bc8732613cc56b1

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

