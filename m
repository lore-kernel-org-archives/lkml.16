Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7E124EA85
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750694428; cv=none; b=h5A7kr3RIQaHIR36x2Orseyl+ztFhxv89ZXXHn4hWk3um4CX6KXUz+dCmbEyI2GvOxAXze4UU2JRQ6PoCmg6QBCr86gP+l3szESIZa2HXu7ANiuqjHwlfht3ZFaao1t3ij2vnnPcxfgYQNVo9M3ZuZue33/r5YfdFliVDNGHEmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750694428; c=relaxed/simple;
	bh=/XfB/j+cPABLGx5W4G9axzM4iG9aT2NRr5DMyD1JrgQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KAhCQohPdKtNeBvpfgu/cX2vSi5O79z/KzJuv/6tIcT4I/kgU6PgY7Kvdp8CNgFUh9RAnfb1muFrQxnZ9d7y6RKXgmIx7sMIpOF4COW+hdtbZuLJIpc/dZAzy05wlbaAa9ytitkcwEa8aRo5zAzyT0GgQ/7iisYP1XNrtMnTEM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Th8Fp3aS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Th8Fp3aS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43558C4CEEA;
	Mon, 23 Jun 2025 16:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750694427;
	bh=/XfB/j+cPABLGx5W4G9axzM4iG9aT2NRr5DMyD1JrgQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Th8Fp3aSp+rD+Xjx69NGZ2eQwj5hmhmUtl68Mdwju8t7fD7yjia6PK5qJIg9Rf/lD
	 v2MuXQq+XCyX/SzQpFFxpHOPh+oxQnZIM9qYnozCBj/M3IHbKJgEwCFZYwGarSeaQ7
	 gxL2uTJHwCjXrfKj05kxJ3S/ZqQRtpAgdCmk20DNgozgmkhK+K9suiYdh+KDL87aEq
	 9rrp1sb1mXHxsXItA/cWyqb/E9urQrQgg78KY9+oQqPIdls1hLjEVzcGpCwKZ4a818
	 nZKPI3TyQHl8fG5TQfZZz9lzUcN56Rphg6yhLvQ8e3ov8xIIoUq2ZH2PdCHRUsewvp
	 2y5xwpsBg/u1Q==
From: Mark Brown <broonie@kernel.org>
To: Yuzuru10 <yuzuru_10@proton.me>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250621180223.14677-1-yuzuru_10@proton.me>
References: <20250621180223.14677-1-yuzuru_10@proton.me>
Subject: Re: [PATCH] ASoC: amd: yc: add quirk for Acer Nitro ANV15-41
 internal mic
Message-Id: <175069442578.140181.10389639011596283594.b4-ty@kernel.org>
Date: Mon, 23 Jun 2025 17:00:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Sat, 21 Jun 2025 18:02:28 +0000, Yuzuru10 wrote:
> This patch adds DMI-based quirk for the Acer Nitro ANV15-41,
> allowing the internal microphone to be detected correctly on
> machines with "RB" as board vendor.
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: add quirk for Acer Nitro ANV15-41 internal mic
      commit: 7186b81807b4a08f8bf834b6bdc72d6ed8ba1587

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

