Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316A018C004;
	Thu,  6 Feb 2025 17:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738863022; cv=none; b=XUAfHke0jGkH4s/HTB0RXcPNUeAzgdyco/+XJJBpxOf+npY1oc8BNiN0lGqXWX1zjAEzq8B4s/zHNi3pf3qa8RtgeGEAWVvZvBtCrjgdlkFyXmdgJNEfgrHUWnut3Sayk5fWU0qGjlmxByL0xXs2kO5bvA2WeFRQzhaO+rwxy9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738863022; c=relaxed/simple;
	bh=kkgp/QLSHAqFZltXCNo4kVE8MPi+CaEsqzyO28Lq6Kk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nHyauk4nGR9BSOuZxjBQLbTekGLxp+A8Vmcios8jBIIR4HcQWU/LaoWua83TLghPVA9ayb9dcoKMklmKSP2iAYRYBAExcXJSgHBv+FJ1E3FFuQaC5cIJgFuoaMWoDNRG4b7eK+IAKHFaoGqw8otHMras5c0LwpVVWt7lOn8kVJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fAuHisgI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fAuHisgI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A199CC4CEDD;
	Thu,  6 Feb 2025 17:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738863022;
	bh=kkgp/QLSHAqFZltXCNo4kVE8MPi+CaEsqzyO28Lq6Kk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fAuHisgIjmqInhK398V3bIuBbrzAYlviaPg2HSojg1+yFjKgCUCWA7+2sPJXmxEI7
	 BKbuFoiRfMmdX78lm5W7dt1j08ArbTf+gQfYKPb3NKg3gaGyxY0vOMjtuIa7N2INLO
	 f5qnnTAq/qg1oaoxr3uQvcT5Bnlo9GLy+YZMsCnQESxMxwPPkpxZP3ARbwr9k8gqAG
	 uB+ZktGNPmxVv+jOKQK/LRr7f1JR9Vp1AmcUjvE8pAY+qRc83lYgD6Gvn/P8W0tqMy
	 dPW5F03xrIz+PpK07J2SiEnjTc06VxR4Z7GptDBs52XZhcfP7gXDxi2IyP3UEFZJic
	 a8BHHtlcr7JmQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com
In-Reply-To: <20250205062444.1694810-1-shengjiu.wang@nxp.com>
References: <20250205062444.1694810-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: dmic: Add DSD big endian format support
Message-Id: <173886302038.325569.2425564372886759009.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 17:30:20 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 05 Feb 2025 14:24:44 +0800, Shengjiu Wang wrote:
> Add DSD big endian format support in this generic dmic driver:
> DSD_U16_BE and DSD_U32_BE.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dmic: Add DSD big endian format support
      commit: 678681828bf4abfd3c31f36390d2097682141d11

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

