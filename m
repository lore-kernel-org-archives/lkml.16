Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945E729AB17;
	Thu, 15 May 2025 12:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310919; cv=none; b=uODvPKR0FveZdK7xj899EUNo8GNQmfrW/eUXjsueKqL85nPJZheo38RGOKks6hMRboctwoztcv1LgP3i6qPz8jhZC3cKTgDYSbK2MhTF0oEflnCiK9Y3Ait4gCzl+/X60GbsVp3OWXl0ggKzhge+IMy8cNsyotyryHojZLEPVQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310919; c=relaxed/simple;
	bh=vwH6A8u/XvsQS8NXzWznJVbOcm103XlcWNthe38qPsM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UB5gEnhtm73qMNfwa5KeLIPQ3ngAyeB4u+dEd7rgGi51n93NHU8zPUptjOjUU1nSZkkeMe17B/URdBFe2NH+zfJ+2Sb0S79E+R+EB+gxzKewamXcaVs3hp8CoaIKMo9jY+TybD22CPaeeJhrAex60Du6C+nynfGqb/72oh2fFZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n3BNRFDA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n3BNRFDA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F17C4CEE7;
	Thu, 15 May 2025 12:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310919;
	bh=vwH6A8u/XvsQS8NXzWznJVbOcm103XlcWNthe38qPsM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=n3BNRFDASIU6eXTebfkiuIx2X2sjecMN9J2r6lEkMiAB3xlzl7jAK07nd/h34+Rt/
	 z5piqQMFiPnew/WPudHyL9YXxEXtXwxmvIz1TpJife7Y7iI8NU5J1RYy6Q5M2dr4d+
	 QGcwsIkFUWKx7zYTLIS+Q/KysmcQUP00e+MSSu0PJPFQbdevsAgMRnjqDSn34i4xfT
	 9oGKLYF+bH6yoq33ldHE5auRc7EFX8pBnxqM3bZMzK1pIbqU/nQ9h/xbSuncx7H1AA
	 0KfFiOkx8Kimj/AlkXysQwUZDuazzYFptkTKwngIrrEe3Ljx/W1wGwkUM1FC1aSP6G
	 /OqMI+w7+7P7g==
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <cover.1747142267.git.simont@opensource.cirrus.com>
References: <cover.1747142267.git.simont@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] cs35l56: Log tuning unique identifiers during
 firmware load
Message-Id: <174731091732.350483.16049439719916983135.b4-ty@kernel.org>
Date: Thu, 15 May 2025 14:08:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 13 May 2025 13:39:22 +0000, Simon Trimmer wrote:
> These two patches introduce a log message when provisioning the cs35l56
> family of devices that uniquely identifies the firmware tuning.
> 
> Simon Trimmer (2):
>   ASoC: cs35l56: Log tuning unique identifiers during firmware load
>   ALSA: hda: cs35l56: Log tuning unique identifiers during firmware load
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: cs35l56: Log tuning unique identifiers during firmware load
      commit: 823a036f049f5ea4afc55a2bc2e7f80a1acdef4a
[2/2] ALSA: hda: cs35l56: Log tuning unique identifiers during firmware load
      commit: db13e3d58c682e0bfc08410e4961b23f4bdbc2e5

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

