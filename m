Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44791D6DC5;
	Thu, 29 May 2025 15:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748531224; cv=none; b=YsZ2shjWApRUi8AH8prS0pqT3dCONvTV/ekAGbZmX0s4Z+98PwUG5wve5XKj4n9+Lrg24NOS6Pb2szN8zadge6pE+k81PyTCCDcVlIEfxP9iB68wG0zd5K1eMf1pS+8VoaM7d0N4f9CNXygZhzXQzp4+qq/aXgT6wiVh7vi/79k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748531224; c=relaxed/simple;
	bh=B17gSMTmJonwWf7TxbUU/sxBJV9FHi9eQtKqckCJ7T0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s36HxhaNAI+y4K5fljYTO28B5nuEdhtG7FFvwlfMELXcokDYg59KlnhgpEjpqPoXNwGeluPPf9DjI+nsLaS8bTbcpHsLP/KAJPSfk1G5qz+JdTTLGGAyfKyiHoBOAaokNn9++QTY5ZwYAL5XXnhE5dWtuz3Ux5G3+F9s0cducjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G6UXntf/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G6UXntf/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C83C4CEEB;
	Thu, 29 May 2025 15:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748531224;
	bh=B17gSMTmJonwWf7TxbUU/sxBJV9FHi9eQtKqckCJ7T0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G6UXntf/RHsHo+g2VtIX3F8n7xVnHbnYKT/eCtlBXnjccZryjUvBpG5ABWWvCpfe+
	 spayWeuRnLZeQGT8WuJU2ZACGUF/A8gvX5skpRLm5LjQc+la11Zz8CCD8HrapqJj4W
	 mA7PuHFU9B+2vlIXdYkNQSoS39Qfk5SLUb5RBsFbztTdB1U1fdChS7eRDcRz9VTZb8
	 /3Z9UAlhchQatLm0sk63Eg+USmjX8Yzo18Pjc6jalVrtBGDAxJkQhT/F9sRtPf0NQt
	 XaRdpftOmvjXEpaJhPJoYx9Fl/ZBMLieLAnVIQuPuDOQDOPus3YUJm4vbhM+o5BOwD
	 CoHZMyL69ivlw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, meowmeowbeanz <meowmeowbeanz@gmx.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mario.limonciello@amd.com, alsa-devel@alsa-project.org
In-Reply-To: <20250528-yoga-7-16arp8-microphone-fix-v1-1-bfeed2ecd0c2@gmx.com>
References: <20250528-yoga-7-16arp8-microphone-fix-v1-1-bfeed2ecd0c2@gmx.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add support for Lenovo Yoga 7 16ARP8
Message-Id: <174853122256.49405.5926862101216384777.b4-ty@kernel.org>
Date: Thu, 29 May 2025 16:07:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 28 May 2025 10:56:58 -0700, meowmeowbeanz wrote:
> Add DMI quirk entry for Lenovo Yoga 7 16ARP8 (83BS) to enable
> digital microphone support via ACP driver.
> 
> Fixes microphone detection on this specific model which was
> previously falling back to non-functional generic audio paths.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add support for Lenovo Yoga 7 16ARP8
      commit: df7996076b1e1ba8a0690542d0e40f703f2f9eb7

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

