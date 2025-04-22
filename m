Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8874218CBE1;
	Tue, 22 Apr 2025 13:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745327574; cv=none; b=eVVb3oGXy3dM48KQFF24lXl+AzY+TguYWKZrj3UKEEnibpLCSkr2l6StOFSIHto4XVyWjUPY/zAWIM7QwjWJ4gRH/bzCr5UqF9ooUWlhNxgmLL1/2wDhrWTjgp6cuG4WC1Xh50asrSJWgUHnpDYrqL9Vn9U9+zA18ZQydrW72jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745327574; c=relaxed/simple;
	bh=4Hpol0KPoAON6t7t4ETx9AOFg1k/eK0uRWPS0I3Bwfg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aqnvqrjhaNj6TJSf+RjM3UjkO3pTp9FluSqeREVmrZa6WLf1idWG5vnejNoEzSWDk4i1nD34oVSEh5hMmw07+Bq0orsjjoGlQRIlAJG9Z7Y9Ivf+3R8o8uJMPT5GrAxJ8IDjIpWkAFhyg2GNKHvwjb05mlYt/tmIH54xqojpZTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EYvIgNyR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EYvIgNyR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E54BC4CEE9;
	Tue, 22 Apr 2025 13:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745327574;
	bh=4Hpol0KPoAON6t7t4ETx9AOFg1k/eK0uRWPS0I3Bwfg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EYvIgNyRCcY/Lfb8TnAFSSlCl/Z8FJj26sDCgysKHF/8tIIBAyjAfp6jpECFMNGrZ
	 AhM57+lBcoOc2CRHlw8xcfw2lyZAxfLi0okc2WawkFnXW4IdwdQp4xfo0dimlSRwpu
	 QPv/hqEgM41XR2PD6ZHz3VoscsLkCeVlb8wocIHy/ZfG4hgGvzuJUuLiYBD4NbZmPk
	 lMj1Zd8WBrSecsAT1fxqt4zpf5K1q0gW73xDBAE7PP8Vbgua6dw8M/tTP02K7EaPCB
	 /oYHyGJcP3SMKF5VmyoOiyLGB03nyt7k/Gq/flsKapl2ZKq7Or6WIEWUOCeYAMY6Ay
	 oPqhT1ijDxDSg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250418-wm8998-v1-1-21c4bead9cd8@apitzsch.eu>
References: <20250418-wm8998-v1-1-21c4bead9cd8@apitzsch.eu>
Subject: Re: [PATCH] ASoC: wm8998: Add Kconfig prompt
Message-Id: <174532757224.44137.10845321242524410903.b4-ty@kernel.org>
Date: Tue, 22 Apr 2025 14:12:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 18 Apr 2025 22:22:04 +0200, André Apitzsch wrote:
> Add tristate prompt to allow codec selection.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8998: Add Kconfig prompt
      commit: 9ef24511d29f0300fc7e9d4a5ea38d78e9eef73e

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

