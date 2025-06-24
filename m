Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FBF1EF094;
	Tue, 24 Jun 2025 12:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769707; cv=none; b=pIJET2ejD4y68zHe8kQYJ+bCtEXWPg/k+mT0VUfdqVJV8YuhUz+7ielK1dBTRcMVXPDNura7CGI+CfG/g3v+nIhC8K7eAXaAcV2hGUhKGJEUQHH18gmXc5fHUsXB+Ilq3QXAuCOz6Z/61Ej/k8puokuF25uCz46j4Lyn0aXNoRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769707; c=relaxed/simple;
	bh=IJYkSqmI2lMK8gEM/9IKh/oXnySNxv0ffD9AZxQ1rA8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d9ITlnH5HIm/gWpE9cGyrGEpX+xuixg6ZyVpzoRyno6OqfnSlem4I6qVU77yKpn9KyyXmhKM5RZsFpEjoSMIaxbm6Ejy+o6d4C43gOfC7P1loDbj4jaiPepXffXECo+DqQ28Ro7hNpR6PMI7MCTSpliLJHiLwcmM5wvnRL2J6ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTEzbD/0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTEzbD/0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6369C4CEE3;
	Tue, 24 Jun 2025 12:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750769706;
	bh=IJYkSqmI2lMK8gEM/9IKh/oXnySNxv0ffD9AZxQ1rA8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jTEzbD/0bzea63+HNBffdDghe2VA1xDqGsFrviqJLpRZOfYEujbBWMwk7URaV7+Mp
	 hx+Ab6hSWpkVyxWL4Z7E87bxd+5+Qp2C2xC8Y5g8ErMVnR/lxp3QWrjTHsgO+ig6BP
	 5cGSoxRJbdB8hTCjwj6JPhxANgVqGw2iUNDGRABX6mZaprowdIpnamz4WfhYB1lZ+7
	 a2RirP39euxMe3d/iJinyCNZG4own0H14nE2EGAXpn68vG7UW7FsDNxhd6M1GoTQk0
	 yayQev010U3QaVuagdbTnqAqVBk46dxKXml5Pca1CBK3+TC0f/wQ02/iV6st3KSYVe
	 KegFSWjhbzb7g==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com, 
 venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250623084630.3100279-1-Vijendar.Mukunda@amd.com>
References: <20250623084630.3100279-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH V2] ASoC: amd: ps: fix for soundwire failures during
 hibernation exit sequence
Message-Id: <175076970454.77119.16488039769676863649.b4-ty@kernel.org>
Date: Tue, 24 Jun 2025 13:55:04 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Mon, 23 Jun 2025 14:14:55 +0530, Vijendar Mukunda wrote:
> During the hibernate entry sequence, ACP registers will be reset to
> default values and acp ip will be completely powered off including acp
> SoundWire pads. During resume sequence, if acp SoundWire pad keeper enable
> register is not restored along with pad pulldown control register value,
> then SoundWire manager links won't be powered on correctly results in
> peripheral register access failures and completely audio function is
> broken.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: ps: fix for soundwire failures during hibernation exit sequence
      commit: dc6458ed95e40146699f9c523e34cb13ff127170

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

