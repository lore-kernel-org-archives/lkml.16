Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1745826B2D1;
	Thu,  1 May 2025 06:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746081489; cv=none; b=HtnCfPL5TtK6YDymI9bi189KluKIzWH+/DaPBOScHX9Ic0dF6+HTeMWOg8mmNaYKNZhULqdCVSN43EXXC39tMUC68BKNykGcm3gs1uiFAvB28SCjKYO1GXN2tRsrBPXjICjTFOwBrxufoN12YO6xluVQzNajTBunFzL0xAVMlnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746081489; c=relaxed/simple;
	bh=BxYHRgqo6sF5s2lWJReP5r3jXnxwGusOpZHnYswQvP0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E5hIc9qtnDJSAnOw0oFL8eogV1OzYCkQwX54aGFqCkhr6UD2RZvQgRqddpxiH1zw50Ym/ubvrN6qkH1y2IlFAVaxvHrq6Oa2UZKI6t6S5fSmljSRXMnMyQoYpvXJBslqu+d1yvDwfjdxbGBloR0PgY8hKCeeoPOjk4SYXVcUqRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pmq/aucx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pmq/aucx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 070A8C4CEEE;
	Thu,  1 May 2025 06:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746081488;
	bh=BxYHRgqo6sF5s2lWJReP5r3jXnxwGusOpZHnYswQvP0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Pmq/aucxBfWOa71NLT9xf9s0UQoi0AxefSMtUlbPbepiM67E5qV4bXSjM8+I3iLxr
	 D8GpRhYPzplHt6NYi8EW/P6E4714ZPCE3WJz/uSZB9FXt1FUfxsO+5cgEnNJMtAPxD
	 lt7uPIBEK6pRgQ1yxzSYcrcI9SwpzhnM68BC9BcfYJtdUDaDEq08qDtnr7/jZ9x7Ie
	 6IaD+zio5D7N8/btVOuWykLZkaZGGEIs8wfrXrGK+p5hhe6ISpG8Xinxio2Xqmwsl3
	 EdtdD5VBvfYojINjggKkVIM8ddn7Kr4TOUY7qUyUdjFAVG5axFLWddI1kYIbq5ZGPo
	 KK8c8lrg/GKqA==
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>, 
 Stefan Binding <sbinding@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250430103134.24579-1-sbinding@opensource.cirrus.com>
References: <20250430103134.24579-1-sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v1 0/2] ASoC: intel/sdw_utils: Add volume limits to
 CS35L56 and CS42L43 speakers
Message-Id: <174608148648.4032397.4518824895651750245.b4-ty@kernel.org>
Date: Thu, 01 May 2025 15:38:06 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 30 Apr 2025 11:31:18 +0100, Stefan Binding wrote:
> Both CS35L56 and CS42L43 have maximum volumes above 0dB.
> However, for many use cases, this can cause distorted audio, depending
> various factors, such as other signal-processing elements in the chain,
> for example if the audio passes through a gain control before reaching
> the amp or the signal path has been tuned for a particular maximum
> gain in the amp.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: intel/sdw_utils: Add volume limit to cs42l43 speakers
      commit: 02b44a2b2bdcee03cbb92484d31e9ca1b91b2a38
[2/2] ASoC: intel/sdw_utils: Add volume limit to cs35l56 speakers
      commit: d5463e531c128ff1b141fdba2e13345cd50028a4

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

