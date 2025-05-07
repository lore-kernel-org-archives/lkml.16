Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203951A29A;
	Wed,  7 May 2025 00:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746578950; cv=none; b=Qk/ytKyRPSXYutKHAOWi/L7+eAiy33ZVMBDqDqW6rtuMPsgZrG++tsst8N756XGaWkqJtZPqetCkm6SDqFVIhIk5gOk7OIRMte38VK434ApV7LhyWj0IKFI1o3ozrIqPee/epS51IyHPtUAaxV2U9M1Z6Uh1SLt4RjnFymYHkU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746578950; c=relaxed/simple;
	bh=FqpSSMgskx38eAb8yDypPKR7sukMVAki+mbzc3ILHE4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oJEF6Dea/Ir4HhKhCmWUBoD85wYLML+75yb2dGERIHQq1r7OMbNxr2FDz9qMCM53FACiHOeX48KIvsrB3bB+IpzrTBfpAESrRByQ65gBbzvLZ8+BhTPYNghmLeIeY4Ge01oYpGaAObRo9wbv6JrIsqi/VEjR4Yj/sJT3fhjX2hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TzKoDtMH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TzKoDtMH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCBFC4CEEE;
	Wed,  7 May 2025 00:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746578949;
	bh=FqpSSMgskx38eAb8yDypPKR7sukMVAki+mbzc3ILHE4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TzKoDtMH9f/NysCl0MEQQXbnv2j45sfVJt8KXY7QRXNTCKlNg58mD0ppIsZaOkigz
	 SJtUGSIsJeZ31OLWQrIUAOSCFiLqs17Aq9h056H2G6vtjLVwYJUhICB/Uu01fqivdH
	 90/VH2ecIEDI780sg5s0rNmtMCHFC8/A6l/+bhRX4AorZzwxh7T7ASBeMLOZV2JpvR
	 NjKwufZrIi01RSBgg4iG1iXx6Lc8rPAy8zVfA0Xio8SRr7092pCMfokoVRGJ4617cZ
	 sgghPQhcQqdV4kfsHHfimnqOGrDp6WPT8FU8zldz/XLOTlvHCvPPWcbBjlXWkERdrY
	 /DJiry3+VAJQg==
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: lgirdwood@gmail.com, kernel@pengutronix.de, s.hauer@pengutronix.de, 
 festevam@gmail.com, p.zabel@pengutronix.de, Frank.Li@nxp.com, 
 iuliana.prodan@nxp.com, linux-sound@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 daniel.baluta@gmail.com, Bard Liao <yung-chuan.liao@linux.intel.com>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
In-Reply-To: <20250505114251.57018-1-daniel.baluta@nxp.com>
References: <20250505114251.57018-1-daniel.baluta@nxp.com>
Subject: Re: [PATCH] ASoC: SOF: imx8m: Use reset controller API to control
 the DSP
Message-Id: <174657894590.4155013.6784460979005872545.b4-ty@kernel.org>
Date: Wed, 07 May 2025 09:49:05 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 05 May 2025 14:42:51 +0300, Daniel Baluta wrote:
> DSP on i.MX8MP doesn't have a direct reset line so according to hardware
> design team in order to handle assert/deassert/reset functionality we
> need to use a combination of control bits from two modules. Audio block
> control module for Run/Stall control of the DSP and DAP module in order
> to do software reset.
> 
> In a first step, for i.MX8MP we are switching on using the reset
> controller API to handle the DSP Run/Stall bits i.MX8MP. This comes with
> the advantage of offering a better probe ordering and a more natural way
> of abstracting the Audio block control bits.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: imx8m: Use reset controller API to control the DSP
      commit: a71b261c19a455f7f8e560b4ddfac44d3150ae39

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

