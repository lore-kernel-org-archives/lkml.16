Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2CA2701C8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 22:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751408136; cv=none; b=sVnstq4EG/yeOsVdWNR9H9LmzFxvscCuBvSFGupdWSJlYdBruQSTB3mZpClPmmWU2GNbnxZdvIF0BxgCK+Djc/80i6E1vTO+uRKF2uf4VmbptC8KjwESQHy4x+22XrnA6R/sVqJBIfsqXwCYgh702j9q9AoaDIyWAgGcbs4wmWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751408136; c=relaxed/simple;
	bh=C9a0il84uYW5ht1bXX+I3Q0LXw2YR4MlHOgHjsE/xUw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gTCdRTiouXXa8QJWtkH64s6F2+7hYZZTaUBytyjxrbcQepuk9fKlUCAiWJR7vFXwDrTmU33NsLHrCsqkVmB9Ofo43DZbELD9GNevjsrcMT0nNjoOUn9Bad9+Z6qHa16PPykvhQbUz7xNf3qVjriRUORTm9aQ3uBbSehzT7+dK3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igx4LrXr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igx4LrXr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F50C4CEEE;
	Tue,  1 Jul 2025 22:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751408136;
	bh=C9a0il84uYW5ht1bXX+I3Q0LXw2YR4MlHOgHjsE/xUw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=igx4LrXrFktDsRiZhk/fP7YXXI+b1Ps63hv8rQA6El5aL7LmOjxtuZAPHoqAOHyku
	 ZNAq5S5kRrIyiDGeEOhBeRd12wR/ccsXDd14cLB/5fezttUacpo3XzYKZZPfIkmAps
	 mp0tN0iy4mTsHO582UyegvBdu1XxcAGphMVAXb87CjLoWP08C5/Dtud9WHdBGptBQ5
	 I+ZVoFGUSIE61QvPW75NYAHNKyio4nf7YIVlE1k0gxYw4ubuZFpThF8paUddVoof8D
	 coFBNrcPctRenARfGX7C9fr6EuB8yejaeCrxET9oiNzBXc4QP2L0feRGF4tnQKp/CH
	 N0J2dlrO4wteA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jisheng Zhang <jszhang@kernel.org>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20250629095918.912-1-jszhang@kernel.org>
References: <20250629095918.912-1-jszhang@kernel.org>
Subject: Re: [PATCH] regulator: mp886x: Fix ID table driver_data
Message-Id: <175140813516.710029.16472663103165745401.b4-ty@kernel.org>
Date: Tue, 01 Jul 2025 23:15:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Sun, 29 Jun 2025 17:59:18 +0800, Jisheng Zhang wrote:
> Currently, the driver_data of the i2c ID table is wrong, so it won't
> work if any mp886x user makes use of the ID table. Fortunately, there's
> no such user in upstream source code, we can fix the issue by using
> different ID table entry for mp8867 and mp8869.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: mp886x: Fix ID table driver_data
      commit: 6729c134ccc0d37d865c342e466b90df29081f1a

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

