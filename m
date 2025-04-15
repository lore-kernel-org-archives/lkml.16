Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16FC241682;
	Tue, 15 Apr 2025 21:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744753803; cv=none; b=V/ysiMSPY+UhxQXlOlpzw4FJfJBjGuQVv8pLiHUZwd1YUZxaZ3wt9ZPn2zVdi+0qTct+my9vp3iBNPQMToQPzQ6vlUagM9llir2ZkmwpL2WhFJXKonT5HeMSMeNGzKH2/KFeDuuwh7xpPspb9s/m6A2PdQyUUSb2+R8kaQgxhj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744753803; c=relaxed/simple;
	bh=rnLKnKJ37AYMItioe33j29TXhHxMtqTKAClrMafDmBQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jXyVKPjuV4oZ6gLWywcVhelgWrm9/aTNOQuW6Ezt88McbauvVDrLq/9M9NKK45whrpSUyocg02kwoPS1aeXCZlyxi9dRPPSpvYzT7rKSFJoFDlCIPiZ1G8boyVIu+Bj9exCnvvmM2nu7c2yPHVfqUo4W/NOocNaDuiKUzdyVlao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UvITnljo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvITnljo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA908C4CEE7;
	Tue, 15 Apr 2025 21:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744753803;
	bh=rnLKnKJ37AYMItioe33j29TXhHxMtqTKAClrMafDmBQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UvITnljohZpowWJlrOoTmM6KT0ZIoHOoQh7bgFcSPx15gRUJUY/xcR1vRb/bQStoY
	 GHaBLgXzKTQmYFzNZlun4+FRnnFZMVfFlSZusa/Sq0F6WVZ45KfSt3FzIjB+xRcn8m
	 qhSx+6myJaIofyUgF38iRF6I0cZtJbdKvAp1YlFm7ReCOgnC49Dz59pGmIc58PjNGg
	 PQXj8+/Is2c+JDZNYVT7PRHDU86jC5vA8W9xSymUQnD3mZ9v1WNpe7mJUxJznEAcOL
	 pRzjmGj28e2x+voxrCQ5Ldt5CTh99IDW5MwMwHxtfjH2D+ir8chyGuNnAcQxw2q+FO
	 h9lemMnnHtONg==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20250410094212.1155529-1-rf@opensource.cirrus.com>
References: <20250410094212.1155529-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH v2 0/2] ASoC: Add codec driver for Cirrus Logic CS48L32
 DSP
Message-Id: <174475380165.1274591.2603826977531435653.b4-ty@kernel.org>
Date: Tue, 15 Apr 2025 22:50:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 10 Apr 2025 10:42:10 +0100, Richard Fitzgerald wrote:
> The CS48L32 is a high-performance low-power audio DSP with analog and
> PDM digital inputs and support for low-power always-on voice-trigger
> functionality.
> 
> This series adds the devicetree bindings and the ASoC codec driver.
> 
> Changes since V1:
> - Remove bogus use of 'i' local variable in dev_dbg() statement in
>   cs48l32_init_inputs()
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

