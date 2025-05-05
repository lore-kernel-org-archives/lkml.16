Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C9C2BD5B4;
	Mon,  5 May 2025 22:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485203; cv=none; b=od9/JRjxZte4oCU7DlIQZ/z7a5r4qYnOHBIsWuuLNcxKplsGboWoUYrR3KaZqd05WWnjBOEZtnhT6MGho/0lho+Gg9jBRWHE2hkCxWhNk7SqVC65tPdA3VZuKYzGPbtSItQlVUtNsrQENYt1J2AlZ00ri1gP/VREubmgt0pwQfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485203; c=relaxed/simple;
	bh=C8BUscfLIIEUfvzsO14+qAva3/lpPpQTzT0cD2qt8sc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bDuMpfBmNiCmf7MDN8mLj5u/UUuvsxDT+260C6uMfuNgqyphukIwNHm1D336rJ4ogax4kO/uUF/xWlHQqXIHyWE6KsT/0wF+kLQjkkM0XKk0X2OXU3Lmpc2gbMmq/7UKSKiFtQ3GuNdgbstzPMF67VEZU9wAcXmyKENSnu+v+MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4oxRSGS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4oxRSGS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36161C4CEEE;
	Mon,  5 May 2025 22:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485201;
	bh=C8BUscfLIIEUfvzsO14+qAva3/lpPpQTzT0cD2qt8sc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a4oxRSGSlExtFAtplZWiA+qIDsvJOMZi8sLWjVYd05dpqAuINhxc1xH3A9IEvmXX/
	 Bz9vJ22KduqkULFLZwQHrgoLR8HtIfZmdxyT9FX5ja5MfB7JFEqAhYR50AAOv3/8dg
	 0mhikYnCbomldcIMgwlYLP1x3ON2xR1Hq+pEczHrGvoDCOAdt8oRXpkmv3badwJrek
	 3df1R/1rrRJfOZatJOeLE4XlSQWttRk8vi/OXFNMK+U7unnFYixOXp8TNJwg4pz1QC
	 jP7AJVaA3STliPfLtFhlmdiT5Jum6tJTDL/vGEZbYe5P1BuCzi5TYjr+LAgWJ8PZCB
	 WgBOLCfGBs/ZQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: Mario.Limonciello@amd.com, venkataprasad.potturu@amd.com, 
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 sound-open-firmware@alsa-project.org, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20250502154445.3008598-1-Vijendar.Mukunda@amd.com>
References: <20250502154445.3008598-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 0/9] ASoC: SOF: amd: add soundwire IO support for
 ACP7.0 & ACP7.1 platforms
Message-Id: <174648519686.4113425.12105826328467218171.b4-ty@kernel.org>
Date: Tue, 06 May 2025 07:46:36 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 02 May 2025 21:12:39 +0530, Vijendar Mukunda wrote:
> This patch series contains
> - ACP sof stack improvements
> - Add support for ACP7.1 platform.
> - Soundwire IO support for ACP7.0 & ACP7.1 platforms
> 
> Link: https://github.com/thesofproject/linux/pull/5392
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: SOF: amd: remove else condition in resume sequence
      commit: e46da64f333ede33adc3a1903821a73ed6c018a6
[2/9] ASoC: SOF: amd: add missing acp descriptor field
      commit: 7c2bad7b95db5b4b978853cd4dd042ae3ec83e63
[3/9] ASoC: SOF: amd: add ACP7.1 platform support
      commit: 451bd0e7b91c83f817b741557c9be0f133d3836d
[4/9] ASoC: SOF: amd: update soundwire specific acp descriptor fields
      commit: 8cc69ecbf195aaf90e8bd5f364ed10ec0bdecb5f
[5/9] ASoC: SOF: amd: enable ACP_PME_EN register for ACP7.0 & ACP7.1 platforms
      commit: cc489cced17b2e32170ee87a3b64aaa3c7c6fddb
[6/9] ASoC: SOF: amd: refactor acp reset sequence
      commit: 169c5e444bb9cd4ae770f54157a04fdd8569508a
[7/9] ASoC: SOF: amd: enable soundwire host wake irq mask
      commit: a536f3c51edb63900b3340978d38da3aabc1fb2f
[8/9] ASoC: SOF: amd: add soundwire wake irq handling
      commit: 1f41bf67bfe3721a4d4d36695302801cf70b5a70
[9/9] ASoC: SOF: amd: add build support for soundwire
      commit: e68074c63fded9468c513f65734ffb4c80dc2a6d

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

