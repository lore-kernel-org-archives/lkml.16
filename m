Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60528274648;
	Tue, 15 Apr 2025 21:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744753811; cv=none; b=udCAHT6y+ZHVJyvPcfEwMtDbgcAm8vEQGgz5l0PkhGB3IGTdS/cXYTOhXxYkUGFcWPzj9brj8Ne5l1yMi9Y6XJeyJcj2mQ7Tj8EkKRuGC/JyX4iZ/dwhDF4BzO7g2kYMIlWXX89n7PFspj+JNl+FfQPzxQoQoX0EX2JoPW0ujTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744753811; c=relaxed/simple;
	bh=kjmJsLGhEPG4vwN9i9+AIrSj3DmyBR619z4HNv/pKGM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lkHOvxen6Vamy0ao6+eagjTcddzLbgMr2une//vljOIPUMqCMg/tpB+igDVzOVexKbn/GhDaNCaIEuPnQH0yx+QNSAKgHfaUDWERa1T8s3WeH0mhnqUhkvo7HQJwmeQusNjJ+pMYdSNyeByU/QGSZE5s8dhC/d/tr3Pq+FuGh68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sM9nrx14; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sM9nrx14"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFD1C4CEE7;
	Tue, 15 Apr 2025 21:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744753809;
	bh=kjmJsLGhEPG4vwN9i9+AIrSj3DmyBR619z4HNv/pKGM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sM9nrx14HPiUaVJSkHqCYVce6uPVBw++yH3avO/T6uC3A8Unui5K4MV+f81vYvG2c
	 HS+JAv2uHZ+tFPX5HvF5P8ULXNYVNCteZyf69IXXhb+u3WZg6P6trTw9L9+cphMUvk
	 IHF17IKFsVLteJlqpXRUOqh223etwO2DJQvX08qdE0r8LUAvtn9RTlefPpJT7V+Gcn
	 pt7E7TJqZhgxnO25OAs2UAZMY1/h8apoSIPjr6hcdkvv6yt4fb9M3xG7PPPbp0y39b
	 4aTRGgfnz3ljVTnVmtkPXoHVc2ZBpsacNUr8MM+qtj2d7fzUca7EgfSmcsolEOVOsE
	 8tJB0IdaX2dEA==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20250415115016.505777-1-rf@opensource.cirrus.com>
References: <20250415115016.505777-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v4 0/2] ASoC: Add codec driver for Cirrus Logic CS48L32
 DSP
Message-Id: <174475380824.1274591.7177149819961610298.b4-ty@kernel.org>
Date: Tue, 15 Apr 2025 22:50:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Tue, 15 Apr 2025 12:50:14 +0100, Richard Fitzgerald wrote:
> formance low-power audio DSP with analog and
> PDM digital inputs and support for low-power always-on voice-trigger
> functionality.
> 
> This series adds the devicetree bindings and the ASoC codec driver.
> 
> Changes in V4:
> - Removed bogus updates to MAINTAINERS that were leftover from an
>   older version of this code that had other files that are now deleted.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: Add Cirrus Logic CS48L32 audio DSP
      commit: ac03495d7359285a007ec4fdc08d3843bb5d6b7e
[2/2] ASoC: cs48l32: Add driver for Cirrus Logic CS48L32 audio DSP
      commit: e2bcbf99d045f6ae3826e39d1ed25978de17cbfe

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

