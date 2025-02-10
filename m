Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C918924BD02;
	Mon, 10 Feb 2025 16:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205695; cv=none; b=YB4FMcmlkQOpiRNoMR+HoM/Gf67Tk3FrFj9qpF+iDoLDn78N/rB5oozk9qKnds/uDUUSoNkTdpyUTVQq0Ov+JnFPtkWLFCVsZxZMiY8OHaCj7A9cMj0FCwmYR7fpgjcztYvv4UjMWoj0g03OsubNE9xpoh3t+b4Qbe6qwIiMRQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205695; c=relaxed/simple;
	bh=eTuNKiG0M30cHVmBsVVivVSm+NX4S5GSjJaRysSD2rw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dD3TZkGb+NZARDQ/A+FyFp0GdIGjE3TlpMAPGgNFet0JJ+7+7Dyz2IIE5o3xIlRKtYIGt4ChyewEqwxfuZsIdmHXfOrGlDNSWG5EcmelJ0RKlNU9rGRyHBbEfOSYD3QEIJpM3vhZfu3bqTIPJZ0qfj1OyvHuPBWzjxxolL8X8AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nop2kMU9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nop2kMU9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43ADEC4CEDF;
	Mon, 10 Feb 2025 16:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739205695;
	bh=eTuNKiG0M30cHVmBsVVivVSm+NX4S5GSjJaRysSD2rw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Nop2kMU9m7eVCKmddRfs18qhGdsgbjMhQW0FgQTIYVTRDtwfGTIP1kRYDUpSXsTkh
	 342mxYrFvaJMsgWA0XjWcxEpn/NUS3VQ0FYbB6GVaKdqrrYZQsTi87L56wHXq2upIz
	 q1c3G/bY96tP4EACrEOcuSBBzwY9+vtCLSXZhoRgg5cxOau1PiJ3UeYfxSxvznAcIE
	 UV3gmVshIZMzT2H7VuA8x4cUeyWUbicmdKQH/rTQjF/JDoTPVrhIAyZF0K/lM2KGYD
	 A5b9YVfyEpQ5UYKx/z8sxY5uo7WivfjRuUCzq0hnKWxmF6tU5ZMYs6rhgHos8vOAcv
	 Nsbcu0x2YEhbw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, sound-open-firmware@alsa-project.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250207-sof-vangogh-fixes-v1-0-67824c1e4c9a@collabora.com>
References: <20250207-sof-vangogh-fixes-v1-0-67824c1e4c9a@collabora.com>
Subject: Re: [PATCH 0/4] Sound fix for Valve Steam Deck OLED on resume from
 suspend
Message-Id: <173920569198.70735.4599491049175796515.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 16:41:31 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Fri, 07 Feb 2025 13:46:01 +0200, Cristian Ciocaltea wrote:
> Stress testing resume from suspend on Valve Steam Deck OLED (Galileo)
> revealed that audio may break and cannot be recovered without performing
> a system reboot.
> 
> This patch series provides a new ACP quirk to address the issue, along
> with a few additional improvements to AMD Vangogh/ACP SOF drivers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: amd: Add post_fw_run_delay ACP quirk
      commit: 91b98d5a6e8067c5226207487681a48f0d651e46
[2/4] ASoC: SOF: amd: Drop unused includes from Vangogh driver
      commit: 2ecbc2e9f3b19e2199e8bc3ba603d299f1985f09
[3/4] ASoC: SOF: amd: Handle IPC replies before FW_BOOT_COMPLETE
      commit: ac84ca815adb4171a4276b1d44096b75f6a150b7
[4/4] ASoC: SOF: amd: Add branch prediction hint in ACP IRQ handler
      commit: ccc8480d90e8cb60f06bd90e227f34784927e19f

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

