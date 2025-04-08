Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E478427E1B6;
	Tue,  8 Apr 2025 12:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116543; cv=none; b=fi41mJRaoH6fZmFMOqRs9TPjM7O8bqCn+Wo+yucCs+0TJ50RiHmRMQlqGJs2e0NVup9W7+EehgkR5aOLDXuwI4IZxluHXORJ6krJ0bItBqkBdDNkJJ2Plxp0y3GoABjZCIrqhh2lnWOuyXxnFNwITvmefQz8d2pNZiJ7nAKzAIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116543; c=relaxed/simple;
	bh=LqMi7yTcpzHfovVjCbZnS6Eo20XGaYhxccE3dOrGFm8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Gz2OcdElgT32IwRXMoNqgj2SGQe/TdkzKgOMM8f7r89pyDbfmD9Z4OtuhZmkf4QFHEWoLsHydKZ3aZCBxfhtp5ngrXXghHp5fYvTZM7sQhGpJDqcq6ufqgzgHmfSX5pB4/PUwD5QUpxAQVkDazjlwH+zBP5neoWmjzuE2ctm+o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TjT6ldQd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TjT6ldQd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE103C4CEEB;
	Tue,  8 Apr 2025 12:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744116542;
	bh=LqMi7yTcpzHfovVjCbZnS6Eo20XGaYhxccE3dOrGFm8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=TjT6ldQd3B223SWb0Uev7oL+NZ1tTFWhF42OuGLtRqK8URO72kdIJWHys0DHQsMvr
	 ZyekufT0bV90o56LXzOytcrAA00uwP3AbFJO816JZm1HqnbbtQK1k3wYRDnniBRd3v
	 Qr5ggqQIajSvMnTHOGBpOK96RLLRon2DhhB+pJXMG6hX7r+ftIRuaEeQT3ZqGLcMpb
	 739kTSC5JpaZOAhP0vgad4dKoaafpy6IWNfkyIDhnMK29mfTtMAuR3oUj3MxB3sBBO
	 vT4WHpRTnALmNYL5dcgeZUOtGpZ5d6GtADjLfl7JmVSUHPQp7O4oX4dBOOoo9xJmlp
	 7CiauRaT6nULQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20250328085744.1893434-1-shengjiu.wang@nxp.com>
References: <20250328085744.1893434-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/4] ASoC: fsl_sai: add several improvements
Message-Id: <174411654045.2091760.1822661747375320582.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 13:49:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 28 Mar 2025 16:57:40 +0800, Shengjiu Wang wrote:
> Add several improvements for the sai interface.
> 1.allow to set mclk rate with zero clk_id for master mode
> 2.add xlate_tdm_slot_mask() callback to avoid channel constrain
> 3.separate 'is_dsp_mode' for tx and rx
> 4.separate set_tdm_slot() for tx and rx
> 
> Shengjiu Wang (4):
>   ASoC: fsl_sai: allow to set mclk rate with zero clk_id
>   ASoC: fsl_sai: add xlate_tdm_slot_mask() callback
>   ASoC: fsl_sai: separate 'is_dsp_mode' for tx and rx
>   ASoC: fsl_sai: separate set_tdm_slot() for tx and rx
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: fsl_sai: allow to set mclk rate with zero clk_id
      commit: 78b3bcfd5697f486946f559f56dbf78c30e22f27
[2/4] ASoC: fsl_sai: add xlate_tdm_slot_mask() callback
      commit: 4fe9d03b48cce3edb679ce1f404f19d242537a66
[3/4] ASoC: fsl_sai: separate 'is_dsp_mode' for tx and rx
      commit: e4b543d51ef1e723bde12d160121b7358a005b4f
[4/4] ASoC: fsl_sai: separate set_tdm_slot() for tx and rx
      commit: 1d9119794c10023ebd7c901aa9aa2c74eb833177

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

