Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D76D1E5B7C;
	Thu,  6 Feb 2025 14:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738853498; cv=none; b=UYwkTqLmXWvBo0O1iZAOwltIYiPZIMUZduSzQAOGA5Nmynbqq5tw3aMkj0RmVSOb/MBLyjc8YSwgsvof8aq6kHoEvZaF60C7TMXzqj2R+KCCv3lAB6+eYPMXuQ33HUB++VFBD0aRtBzzpoMll3uZNkGrNVOQRQ6lR3GrlyNrogQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738853498; c=relaxed/simple;
	bh=X+x9iyoHGF6Lvhht2aFT4YH89HuQZZS/7/lffm80aPM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YNUhXzMMxqGoI0+nTRsTUV78nkzn9CyZ3VhOMV+yboPYZ4uWpgidcs4id1fv9MirV51roRUHg/46S8/PMwTO7VoXXxDpOU18D9sEq/OHTRQlEI4P1JoTZ+iSrTGXWwbZp/CEoHWtBH6TNksAcNwQFhhjClRN3NYAir3S4vruizo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQfSr8u9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQfSr8u9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2134C4CEDD;
	Thu,  6 Feb 2025 14:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738853497;
	bh=X+x9iyoHGF6Lvhht2aFT4YH89HuQZZS/7/lffm80aPM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NQfSr8u9zdCrkE0tS70Yun61gY6rHe/MeoAP8jfHK+ydox4grkkxaGL/lniQVTl7e
	 xxUCjrQqQ/6rWtGO38J8pgpANyAhEuMm2xqJ/f5r5kpDuVMBunDtOHgs51wYSD0084
	 QRO4OUfR1uPvIj3gUdKSrVKh+uatqjTwAEW9Aqv+7gjjydLwiAYdv8NY2fa49PoRV3
	 0vaczqmNJuA24iCv6LugNPQUaTbC7xMa7tQanrBbL5Gqua537ATp8Tk7Ki0bQcmi9r
	 Odz/i+a4bCg82xIdcwn75Zu2FlXPSQhdPUPkE+3vN4aqeFQArOzbuajoFNRW9/xo1b
	 KmB4zLCKjg9XQ==
From: Mark Brown <broonie@kernel.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250205164806.414020-1-sbinding@opensource.cirrus.com>
References: <20250205164806.414020-1-sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v1] ASoC: cs35l41: Fallback to using HID for
 system_name if no SUB is available
Message-Id: <173885349645.198179.1975399790365419548.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 14:51:36 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 05 Feb 2025 16:48:04 +0000, Stefan Binding wrote:
> For systems which load firmware on the cs35l41 which use ACPI, the
> _SUB value is used to differentiate firmware and tuning files for the
> individual systems. In the case where a system does not have a _SUB
> defined in ACPI node for cs35l41, there needs to be a fallback to
> allow the files for that system to be differentiated. Since all
> ACPI nodes for cs35l41 should have a HID defined, the HID should be a
> safe option.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l41: Fallback to using HID for system_name if no SUB is available
      commit: 1d44a30ae3f9195cb4eb7d81bb9ced2776232094

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

