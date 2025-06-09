Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD93E259CA4;
	Mon,  9 Jun 2025 13:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749476419; cv=none; b=Kp1J2RmPyfwdRg5QA0uMHZgKHI/9n/7ipsOZSeGiuJXm6wxP16nNx5dGt7bL9n1+5PtvylPiRgYXIOei6WHShnqKYsV134spm26YirMmhhHf2FaSlo+ar1LvuVpq3NOg9LzewZ6qKYHqka9qcLj1z63aJdHcJSa6HpKnU6ip3Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749476419; c=relaxed/simple;
	bh=0TzGiYjBWdHj28TJ9b9/bP0pDAFT/RI/G0zZcNo2UZY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jCiK7fI2RBizFmfMhfgW1d2OPOZAwI1vx6lYGapiyT3eGrXwNml5VFPbVWuVQbMPzoataSmVl2TKQLRG8kqSsZjTPQ26dSdJAROLRaD4wJiZyo+MghqND2kXaPz6oO1aSCt+lTpnbNdBeaGp4HlpmrlRx2n4vkc67OH4aC0cmMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBWHnyet; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBWHnyet"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94C7C4CEEB;
	Mon,  9 Jun 2025 13:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749476419;
	bh=0TzGiYjBWdHj28TJ9b9/bP0pDAFT/RI/G0zZcNo2UZY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cBWHnyetInB5iDpyq8xXZCqzb7Sx+8zILwQciYvw/O7l53nhhmbcAGC82GsS6ZDPh
	 tY08MqzOH9WPf3eN/DW0osymBz2itA3Wc3FIFQkH0pe0Jr2I3LAsw5reRHfpiGyAGk
	 NkG6ZwMmegmTPR78luHKA9408k4pr1MprOtxDtNTVy9rWmmvsKQBiZvj4/HwtJsng8
	 +p1KG1G4RxdDBBidK7ll6oKQTn6apDX6ymDrtFvqLbd5R39BjCI/KCzxJO6Vo2LBZ7
	 69vABdM0VnBa4DvHvH7TH9MX3+7QAhKPMrzWheVB1tdpwvk5ZeM+HxYlFZRX+/iu94
	 +SyDWK9xhNfNw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20250528165755.692264-1-Frank.Li@nxp.com>
References: <20250528165755.692264-1-Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] ASoC: dt-bindings: covert
 mxs-audio-sgtl5000.txt to yaml format
Message-Id: <174947641655.126747.14644137581591164597.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 14:40:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 28 May 2025 12:57:54 -0400, Frank Li wrote:
> Convert mxs-audio-sgtl5000.txt to yaml format.
> 
> Additional changes:
> - Add compatible string:
>     bluegiga,apx4devkit-sgtl5000
>     denx,m28evk-sgtl5000
>     fsl,imx28-mbmx28lc-sgtl500
> - Remove audio-routing from required list.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: covert mxs-audio-sgtl5000.txt to yaml format
      commit: db1a7a6f28b84c5ccd84a800cd4827b5599c95b9

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

