Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6562FCE0A;
	Fri,  4 Jul 2025 15:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751644640; cv=none; b=N+IoHoNsmo35p/CAN9uqafGN6pBx5UHiMGHmSPUR1n4GKe+vPv/xWK16D88dDaai8uoCTip6oEf1TM9XXUIKW6ilbBfZlJG1jZJmOc1GjwUCcala5VRQBnyPhV4QDjHmwhZduhNwUfdPMYOZkIecCCpnDPugK2+7tIfBbl33JFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751644640; c=relaxed/simple;
	bh=8AiV8GZ8dXSm8Gr4E1ix6z5OY/73wpxxP/YoaU2wWsg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eLpCGUDUej7rUch/uho+BbXrOkGWo+Nas4lDu+nrOhYszO0plsGOpNc8I2xX4/mS138R43jbz5RAzdV3U+VVRPVo6Q5XVzf9B35zrDUlncx3K6SwDA7yZJI9ycDbpNP4YViGFLF/yvzH8tUBgGz7O6miQmM9psRoF0MDiR4pniU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vCYB0L4e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vCYB0L4e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C95C4CEE3;
	Fri,  4 Jul 2025 15:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751644638;
	bh=8AiV8GZ8dXSm8Gr4E1ix6z5OY/73wpxxP/YoaU2wWsg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vCYB0L4ef5CtdNA76NK99aEBeqswiQI3Fr8kzqCEAdZLZOggQCVZGyBB3vmBB34NW
	 4qx1EkPEHv6V7bWrQfJ+aqgwHsY/fnSnxF8nKrGisZxTP4gRiX8qqnaZsk8FUxdXQN
	 KQ3vjX7XtRXJNKbsN9f1rwng5MYzR/4x7emG6fhHMjULEPUNnXSbo0lERflm5YZnx9
	 CAiaBXdUJVF8u9cShVm7CLKV+lfl8o2EHovC3hToDsycP1AFRFGwI/CmDzFNUIcaF/
	 VjEztecmEpBU7W27v7ueEfwcRUxjjdkA52FJljwFQHHl0GDnzC1aGn00SOBd+/6dN0
	 Yk5M9sG81tcbg==
From: Mark Brown <broonie@kernel.org>
To: Cheng-Yi Chiang <cychiang@chromium.org>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Benson Leung <bleung@chromium.org>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250703183523.2075276-1-robh@kernel.org>
References: <20250703183523.2075276-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: Use of_reserved_mem_region_to_resource() for
 "memory-region"
Message-Id: <175164463151.103413.17242498440518772923.b4-ty@kernel.org>
Date: Fri, 04 Jul 2025 16:57:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Thu, 03 Jul 2025 13:35:21 -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Use of_reserved_mem_region_to_resource() for "memory-region"
      commit: bc163baef57002c08b3afe64cdd2f55f55a765eb

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

