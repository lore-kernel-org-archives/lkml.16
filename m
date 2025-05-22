Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1588280309;
	Thu, 22 May 2025 08:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903531; cv=none; b=hyfF/ee4JzcP/j8e7BnStRzoHLlJm2FTpoT2PALKttu27PyOFPCUrunQQBVhtS4fh4hRY0O4i6kgy4/c3fiZr1vWa5mWwnSTTLUm8giPvpo2FI2+b4S7GYTSscq/MtWyICPDm7ZfixgGnGYlDsV6zICrbPvvEi+NRHRyqlW2MvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903531; c=relaxed/simple;
	bh=SSS6anPKRBCb1IXkLlv4UlzxipEkufFG7dlLhh/Zkd4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mSeA8Ijxg2qk0SBNgqyEYF1d8ZoSE5DZsgXy5Xd7uO6kRcAJYXSvsln8sOH5AUaH8vg5Ok8VhGibNUu2ovPf1BoZCeqyYp0mp9NEP6AUN5UN7t/2ryr4Us0bhY7j/NGAshI5rtWMzn5yE0R4pIOs2S7H8kwpYiO+QZ99Kflef/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+74l36L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+74l36L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65A0C4CEEA;
	Thu, 22 May 2025 08:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747903531;
	bh=SSS6anPKRBCb1IXkLlv4UlzxipEkufFG7dlLhh/Zkd4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=E+74l36L0Vo9GRzIRBWQ+VGZmXsVfOO22TfyX/lRksoefCu8Z9pHn8FqvNwx/3oze
	 B7u4fDqiNt7GAf0g+hKM07ZnJJK1of46mIo9HPCUAl7Fc9n+YYVa39Ykhe+xQwoLFc
	 eF6MdyYQEDi7HbIRWfhc9AATQ8TDeaMF7xbCF0DILvgW+RshkQEmkUFQ6umqJezxJv
	 ZIPCIv2yTDF1WTmKVApwy3GOZFGU5Wi+hqFd4WYV+36bT8FLRnTUCf6PZ2TS44vnk/
	 XVFHNjVsz9Sy1XYWjMPU3EXjcFFKWVEpVuUnnIHrJM1TV25KP6bveRE+tKR465UEce
	 0TFKWiuBP+weQ==
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Stefan Binding <sbinding@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250516152107.210994-1-sbinding@opensource.cirrus.com>
References: <20250516152107.210994-1-sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v1 0/2] ASoC: Add Intel machine driver support for
 CS35L63
Message-Id: <174790352962.11863.8143259383908066219.b4-ty@kernel.org>
Date: Thu, 22 May 2025 09:45:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 16 May 2025 16:20:46 +0100, Stefan Binding wrote:
> This adds support to the Intel machine drivers for CS35L63 codecs using
> soundwire, and also adds match entries for the CDB35L63-CB2 on MTL
> systems.
> 
> Richard Fitzgerald (1):
>   ASoC: Intel: soc-acpi-intel-mtl-match: Add match for CDB35L63-CB2
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: intel: sof_sdw: Add support for CS35L63 into machine driver
      commit: 898cd43bde30744e0b821efdf960781c240d4e6c
[2/2] ASoC: Intel: soc-acpi-intel-mtl-match: Add match for CDB35L63-CB2
      commit: 8c4d2cc1e1cb9b8c9f26af6c5f19e0c7233e6f81

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

