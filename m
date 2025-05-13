Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000E02BF3F0
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154091; cv=none; b=fsJrq2eOIMfR/vHcksNUatllqqa1JdZ/sfHwFm+kt6J0d++RT7PT2L6zU+ptErD4gjEjyVwO20md4U5CapG/o1s2rsnMf+LeiN0W3gx0fANlf/JIwk4rdlx1UmmkZpZd4zRZWinR4Yt/YzVUKhdQsAag7pXRoFYKed8Udor3C0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154091; c=relaxed/simple;
	bh=g6uAgBmdRVJ/MmwO0dYNS5uypb5EK9FZJwFt76vIoQc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PVp0QgvRVRFwCbpqwibikfcEaKHVcJfn/qkvocoEjIGNmZq7SqONHXzVyUFHQ5kdXbxWM6eLd6l2rGKSqAXkXrcOkkwH/NGulbPf5SbXCymYQMICg5eBZSlsKf6Ov6+HdRpyE2GxBwIDTop4Yu249XI1ZoZl5MoC8XSV7r+ER2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A8xAZAx9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8xAZAx9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09464C4CEED;
	Tue, 13 May 2025 16:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747154090;
	bh=g6uAgBmdRVJ/MmwO0dYNS5uypb5EK9FZJwFt76vIoQc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A8xAZAx9JKl8AvNozmvyqowTBtujipU9DMjfnPjdd9rFMcOsMQNpR/du/X6dIl3Uz
	 MZ9yB/n6jEvjBh+iMXbkVIi9yV0OlxzJwmMQkWW/Ust5PU3be6YDok8mQTRMeA9WX4
	 QcEVkUKsnERfqti1xirG/YleYzlXVnJDDBnW+a3/pY6yQxoeQvFzzJ9I4WYjSc9WCJ
	 kBAEo5WwOR3gDn/3zyo0eElh32X/dENgY7GL1I9T+yQWRSlXpKkAcDWro+H7j+vtp+
	 yJVSXdNduMKMzbleIKgVHma95KYwuciSjE3nzANkGEPqZxTTFuHh2JWtv5ZzsMLOBu
	 xXwQB8D1ajO2w==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Nishanth Menon <nm@ti.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <20250512185739.2907466-1-nm@ti.com>
References: <20250512185739.2907466-1-nm@ti.com>
Subject: Re: [PATCH] ASoC: tlv320aic3x: Use dev_err_probe
Message-Id: <174715408662.98239.15738351990112374855.b4-ty@kernel.org>
Date: Tue, 13 May 2025 18:34:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 12 May 2025 13:57:39 -0500, Nishanth Menon wrote:
> During probe the regulator supply drivers may not yet be available.
> Use dev_err_probe to provide just the pertinent log.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320aic3x: Use dev_err_probe
      commit: 85f8c2d56caf56aa3379bbc5f1a19fef9aabd23e

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

