Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993252D0C9E;
	Wed,  2 Jul 2025 15:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468718; cv=none; b=e0Vqk9GyrXG7tzYZ/XHHik4Rue67pj2nYwxTX++kkzn8d+bmneL6mADl/Jd/NYzsOW1GIqFQiBomRbAhG7j+n97zP41pao4tshpFGXD/Hjsg4zo+uC4hZU954bGdOoYZx0+CwzpKCT8o1bipuW2u4JLbWw7Ze3zolPXyCsOWNdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468718; c=relaxed/simple;
	bh=tq0Rh/QY6ica1HYtb2UzsNAcD3Lbr2WEa4FFEzsm9ws=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=die1Ms2T7Aup0858CAMrxId+TLXKvYIYFE40qTBY2Hj8ZxF46WvnYY76HhrSrAuK9OHgRcMwkynHSAxHRo/TGCbN0zIoB9E3fYqSBoE/eVLv3BxQS3k1WOB0WzBfdxSUPDWMiRxRfbd0SBsCEtpIH1v072XrsV4u8AT1LPc3WJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OOc1tZvi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OOc1tZvi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C8EAC4CEED;
	Wed,  2 Jul 2025 15:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751468717;
	bh=tq0Rh/QY6ica1HYtb2UzsNAcD3Lbr2WEa4FFEzsm9ws=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OOc1tZvirUtPfVZhDgVqnM03d03DsfKwNQyxeCA8MHeTH2zBg0ugon+5Du9DBmzQG
	 whEsUaRbpxIfBx/WkWEB8Vmjb3v43D68X2qcc6ZlcAi5QarvrHANNDom/pijp0CXhq
	 UHZ5atv3qEx4uu+GXe6mruqPdU1FmZrRv1sgM+pPoq0t1R52F/FBTBu4K+BesQGbpF
	 3bpi+upgpXmyyPWK/3qnufP6G4mWXxUeVxgsXbOPbqyWpqlEky/r9Z3uBYXkgvmab6
	 Z16j1ZXb6yKF2fptDE8/VfSKQa4DJXKC8DEZf6D7ldhxKcUikKm7ZtY4fpBlZzRojD
	 HIRgyrS9jAFWw==
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, yung-chuan.liao@linux.intel.com
In-Reply-To: <20250702112235.377479-1-simont@opensource.cirrus.com>
References: <20250702112235.377479-1-simont@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: Add quirks for Lenovo P1 and P16
Message-Id: <175146871598.208290.6934550893206477494.b4-ty@kernel.org>
Date: Wed, 02 Jul 2025 16:05:15 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Wed, 02 Jul 2025 11:22:35 +0000, Simon Trimmer wrote:
> These Lenovo Laptops have the DMICs connected to the host instead of the
> CS42L43 and so need the SOC_SDW_CODEC_MIC quirk.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: sof_sdw: Add quirks for Lenovo P1 and P16
      commit: f7690d058170dbc1520b0bfbc3d9daf046b59326

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

