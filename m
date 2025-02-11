Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AEB262D16;
	Tue, 11 Feb 2025 19:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739301222; cv=none; b=QqzksZJisu/gEBjvdECwdFz3Ovv5tlwglh9I1rj8fN3sSCsG0XB7JfBGno39zQ7mzbcJL9RdojC/uLFVrfbEhBH40yQ2kjZsXgGEGEv6jU7tSl/CteVcJsomqPFccNAgqL0hNFvSf3bGS/bYAwMeOr5oO0YzpBP8Tud4JasNVXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739301222; c=relaxed/simple;
	bh=3PDDp8ifF0Apm4orO4R4ylNAPPuO7AKr/wvsrkvct7s=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=k1hCCY2KPpYlrtOUa++eNTGFzuasZEStqYO/IeXRBkZ5EBCYDPq5roOHQ0hPwaVsNz7Au4AsvfsQU+Hex+dCtVWF57tIizBS07Hv+q1m9L9HCsG8lnIM8HHoC4m97EEHhAhX03uWH+5e4SpmpRYOWcsDdDiBrFqLYDB90hzUb2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MR8LWm71; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MR8LWm71"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F98C4CEDD;
	Tue, 11 Feb 2025 19:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739301222;
	bh=3PDDp8ifF0Apm4orO4R4ylNAPPuO7AKr/wvsrkvct7s=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=MR8LWm71t9vDzVO/YFenVtUNd6F0lpCdtNjfEHb6TZKRtWbkgLeNTmqiks1HTGrBy
	 P+bYORp3p//w0V2nWItrdTvWAzK1X+U/ThL2dRyOGyhyrX8Dv5nuOEJ0ktaxndg5bm
	 uy66EmMHQmmHMOA4V6TrDtHJ4GGXqXChVGMRYlOto9epIN+lpWWp9YejXOLsPfpxOM
	 NYeGxxZhZc1D6J8urQSkDMGgVXB2ucLcH3AuRtDkUS/G7im3elrQ007XxVmtsZumNH
	 HBGGAjfVDtg/zbggyh4OMJY41rtr4Bi5XH3iT5GPKJxPv0NBrC3cBjE30HOuNP155B
	 h2c6Sjgr1csQQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250206030306.2618620-1-shengjiu.wang@nxp.com>
References: <20250206030306.2618620-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: Add decimation filter bypass mode
 support
Message-Id: <173930121994.78288.4188692766936165316.b4-ty@kernel.org>
Date: Tue, 11 Feb 2025 19:13:39 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 06 Feb 2025 11:03:06 +0800, Shengjiu Wang wrote:
> When decimation filter bypass mode is enabled, PDM data can be
> written into FIFO directly without any processing.
> 
> The interface of this mode is DSD big endian format, when
> user needs this format, then this mode is enabled.
> 
> This mode is only for the i.MX943 platform currently.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_micfil: Add decimation filter bypass mode support
      commit: 21aa330fec31bb530a4ef6c9555fb157d0711112

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

