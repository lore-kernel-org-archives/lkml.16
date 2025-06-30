Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B600625EFBB;
	Mon, 30 Jun 2025 11:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751283621; cv=none; b=MVXWZWPYMfMYPMnDL/fyOZhCmrBtJY1QFSwCCWnKcIN9czSAGzr47itXkGNsOch+oz5NTrC1ZBFhb0DXH1wr7LnL9RbWKGcmyWU9oghXt4PGWLHpRKrCrRC2+gp3JDhN4KqhMvitDwcMKWN9099EIcTip2QMJe5H+1AN8aAX9Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751283621; c=relaxed/simple;
	bh=bQbVSfUXa8FwdDpMgxm9+FwRT0/4tpCPWYLfLYdQIQQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QNC5b8Q7u3kScFa+aseDfRGpLibpF5wC7bkcOysb+CexuNXR135y8V4uEjSuR5Yt0ju2vf2BpmX3ShASOfIgPXZc13uEY74jqoxOsq3w5zFcwRwYYP2DMEi6B0qm6IW2wtrKYO79K3NJEH/5/SAEZoJDGTg8eQTCmISBmmXgdCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IWN50wCh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IWN50wCh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A15C4CEE3;
	Mon, 30 Jun 2025 11:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751283621;
	bh=bQbVSfUXa8FwdDpMgxm9+FwRT0/4tpCPWYLfLYdQIQQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=IWN50wChPSxNS3GwdOeqKV91XefthwsnuLmgj0/G5cdOpvzsJcNgs4eieqJWjMicp
	 QP1b+lE85HqQLBhISlJG5uk6h5gWn1UKiytVkvJesvWB567u3BPTtLzERGNWvy2QNx
	 F8eTUupCY90chKvhPmIkmDGIhP/QsZ4SP7B//Jhh/6aZyEjlGuHfm4PtZEo+xlAqyr
	 KTDxe9g8HEva3l7DGaD1qA0DT2AE1bMiYPPm9DqLM2wbEegA2NM5Vzb7FuhKvQVP/2
	 UYWoDNMq/WQ+3rNdg96MMHEO09YF/vi1rO43vl+xCFGrX8DsTYu4fk+NH9U1jkelj1
	 vBsJYS9FlofbQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250625020504.2728161-1-shengjiu.wang@nxp.com>
References: <20250625020504.2728161-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: use internal measured ratio for
 non-ideal ratio mode
Message-Id: <175128361929.28563.16933348008978781242.b4-ty@kernel.org>
Date: Mon, 30 Jun 2025 12:40:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Wed, 25 Jun 2025 10:05:04 +0800, Shengjiu Wang wrote:
> When USRC=0, there is underrun issue for the non-ideal ratio mode;
> according to the reference mannual, the internal measured ratio can be
> used with USRC=1 and IDRC=0.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc: use internal measured ratio for non-ideal ratio mode
      commit: cbe876121633dadb2b0ce52711985328638e9aab

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

