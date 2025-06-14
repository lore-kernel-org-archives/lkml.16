Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BECE266582;
	Sat, 14 Jun 2025 11:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749900252; cv=none; b=c7jx8I0eA1GSaynMb8Ymzd4viOufp4uqhU4UhqTI54rcrq3HDJKCtutJ2qcMEbk9W/ITrk2bUWle9fAhFaXEUrWWy8y4H1Ey08qk05V1wz3pZSd851wrk4qrX6OshIPughQjaubiUpiQG1Zrre4gusT7v+Fpt6Kou4ZIVvamfwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749900252; c=relaxed/simple;
	bh=t2DMHkV0F9B9kpfWIWHrHEo7W4x6Ulto76tEYude1I0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oabN8iAU3IBMo6eS+tbnSXTdBMZTgpMi2gWBzvvSKRG3b9AabZcnROyWrU1PzyG+aquz2JTlusUJTWQ+0SppDdvaHjYeqPh2p/tWh8GYKsj5TKoiJe2LpcSw0oy/f4btQFOGrddGxOV4/+LxbewwTQABDWz8XOUi2KiU0E6Gv1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZtqOR2f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZtqOR2f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7523C4CEEB;
	Sat, 14 Jun 2025 11:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749900250;
	bh=t2DMHkV0F9B9kpfWIWHrHEo7W4x6Ulto76tEYude1I0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SZtqOR2fjDDFzmMCawM6tNRqfpEO4xgheQ1t/TbirWKm1TFHiTuRwvktzvBmzJjpG
	 tEThHjj6CH90bL7rK/TxGg/I0b1cXspwtJuWo7OlQEQYszPWDFzNgUjipL/Ze175zl
	 inRVvdKY6smQyWl0+ArStJRQ78+k2zpQ8dQircBBbTQ+WpmiSVH052rugHdbp23joC
	 nFbVmj7g/AHTbl/K3Z61mhKi0/IP8lu7jFjt30cffqCA/OgIhI5uaL3yN4DYkeWlma
	 JopKh7OJQdUU0pzJKpWQ8pMI87bb0ypCdmbK0/Qd2HR4les69HCGjWF2zw674pQoqM
	 cQ4IrQiPeXWjw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Raven Black <ravenblack@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250613-support-hp-victus-microphone-v1-1-bebc4c3a2041@gmail.com>
References: <20250613-support-hp-victus-microphone-v1-1-bebc4c3a2041@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: update quirk data for HP Victus
Message-Id: <174990024946.24315.696599452743431572.b4-ty@kernel.org>
Date: Sat, 14 Jun 2025 12:24:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 13 Jun 2025 07:51:25 -0400, Raven Black wrote:
> Make the internal microphone work on HP Victus laptops.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: update quirk data for HP Victus
      commit: 13b86ea92ebf0fa587fbadfb8a60ca2e9993203f

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

