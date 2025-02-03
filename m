Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C6420C472
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 19:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738612672; cv=none; b=cVp4kyWtR0dqWM1wKAXcWoEsIEqpC3GS52Y0R1ym7UovmebU7rqmF22UVq/mNQ9FDd0lDR8mUSbmxzrTh6J92SlzBopn+Jh0gtynPYMFKSkDeCwpn0WOMcOOShCVF6yO5F7qruChne/hEKrNt9tXn+C0N4m0YMonlrAL4Eq6KBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738612672; c=relaxed/simple;
	bh=1U+4bW3OdAEZLqi110FQ2TeRPXrfhTqN22R/3BK7pwc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FDYhfxfVeQEbErKNSOPb2fsL/qOTPYmldGIHshAS30k2E2bBZBxruBvXVTI6+URnQO6swT9Fy1TETJGqVqK8mDvgXCoppD8S8r+aGk2cX89D602iCc0z33Ve/POkgHu5WvO0lL3zDbYAOyWcRUrql8kjekj4+Xg2FT2dZGVXDd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTDyX/5U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTDyX/5U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1925CC4CEEA;
	Mon,  3 Feb 2025 19:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738612671;
	bh=1U+4bW3OdAEZLqi110FQ2TeRPXrfhTqN22R/3BK7pwc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BTDyX/5USaZv71ksap4fCQAkegYhe7J4z15CVNvfilhla+JkenM/qRD//UyFqIG66
	 FPlC4AgjiQMvPD8MTVT+SXUW02X0CtviirNybOpkspx8BxANkVfA1gjlLMZ/hHyOZd
	 lPWOV6WDpTiGE3MfspTPVrwv9sHDJxLq1CQYfXID+JZNzDZYAlC3RrBgZWN08XqLeg
	 i3VkSADPFWSS1n5XWb0ACm/Zei6kmErHD2j22kk306pp1gxgZxUFT0VoL16IL98Ort
	 SV058dSTbBqtIv/xqkQUx++oCFg607jLMb86T1t3SE42VpaVI+qtOp3qa97rDTVAFd
	 M3uNaL6QB0UtA==
From: Mark Brown <broonie@kernel.org>
To: michael.hennerich@analog.com, 
 Isaac Scott <isaac.scott@ideasonboard.com>
Cc: lgirdwood@gmail.com, linux-kernel@vger.kernel.org
In-Reply-To: <20250128173143.959600-1-isaac.scott@ideasonboard.com>
References: <20250128173143.959600-1-isaac.scott@ideasonboard.com>
Subject: Re: (subset) [PATCH v2 0/3] regulator: Add device tree support to
 AD5398
Message-Id: <173861267083.674751.11323507108232831225.b4-ty@kernel.org>
Date: Mon, 03 Feb 2025 19:57:50 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 28 Jan 2025 17:31:40 +0000, Isaac Scott wrote:
> The AD5398 is a DAC that can be used to control current flow in circuits
> in a wide variety of applications such as motor control, or in my case,
> LED control. I found when working with the current driver that it did
> not work for my use case. It transpired that it only had support for
> platform_data, and didn't appear to be correctly implemented according
> to the datasheet, which can be found here:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/3] regulator: ad5398: change enable bit name to improve readibility
      commit: 19d022d67d7353f0e6e9ba255435d3de93862ac4
[3/3] regulator: ad5398: Add device tree support
      commit: 5a6a461079decea452fdcae955bccecf92e07e97

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

