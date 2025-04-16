Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1700C1E9B04;
	Wed, 16 Apr 2025 20:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744834651; cv=none; b=H9lPkJ0ICRpKDjMoPil5E5mYwT7Ibx77aGdxu4TcC0qoJXHfs4IonO3zyGeQPIWml9uZ7VWg1p0RZw4Mrwce/6r2aD/dGJnQRlDvbJk7g9OrCXVg4vEBwWnrtl2OV8sJTbrvFaytvx6G5VvHxqO7CeOw9H5c05Z4d8Yd16q7O7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744834651; c=relaxed/simple;
	bh=WLGUkrxbpPf97lHOzNgOr1krDQv71bWKrNjJAD5T+iw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MgzBX7a+EYNfzH4K6mlJVBPB3HBQg+KSoerR5q0A+gt4JfCXzS+xra8wuk9VZTJrr2t7ua/gASLAEwTzq3SIrmxdA3xPA0BS7shlMZwrPfWGY3o1s/W6JnmO/dDj+VeUkhrtSSz6uDcanS1yij2R8QO44juT3N6M6HtWf07+1tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vt7nTij/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vt7nTij/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62266C4CEE4;
	Wed, 16 Apr 2025 20:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744834650;
	bh=WLGUkrxbpPf97lHOzNgOr1krDQv71bWKrNjJAD5T+iw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Vt7nTij/FJZictAep8zeigP5xBhlb9L7cPiNPKWZ6UHvltemr1pYOuIeFkkxapwTl
	 JUZo3EXS3wZ0RU21MhBpPMBiCViOg69XcRDxdRytNIteiJcRr/l/MEEEPNlRInP54h
	 3B8typJtrIcRMZF8c7JKNE7+8WJbssxZm3Beycdba1gTfizH0J63tXAbMBCGyO66UC
	 oOfDIacKqPf2FrXP+tr/KZfVxArSkt9Z6RQeOuL1WDfM4sHssodEBkInlRhNIjaybZ
	 Gva7R4vLmVGb8YrHqBpRuY+T82aNA1ET1oypV6eK/g5qNlHajX0BpaMnXZ7QaDCh0s
	 MdZpiAcUc3sGg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250416122422.783215-1-rf@opensource.cirrus.com>
References: <20250416122422.783215-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cs_dsp: Add some sanity-checking to test
 harness
Message-Id: <174483464915.868862.8222881008352182759.b4-ty@kernel.org>
Date: Wed, 16 Apr 2025 21:17:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 16 Apr 2025 13:24:22 +0100, Richard Fitzgerald wrote:
> Add sanity checking to some test harness functions to help catch bugs
> in the test code. This consists of checking the range of some arguments
> and checking that reads from the dummy regmap succeed.
> 
> Most of the harness code already had sanity-checking but there were a
> few places where it was missing or was assumed that the test could be
> trusted to pass valid values.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cs_dsp: Add some sanity-checking to test harness
      commit: 4308487b29f98785ef50dd82fdfca382134b33e7

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

