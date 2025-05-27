Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4761E5B7D;
	Tue, 27 May 2025 13:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748352434; cv=none; b=XCTD8UMjDaRFOrThQEpfxppd2KmxrWBSdVUVxG0tiTmg5VnSOyrF9HdHNZBv0npMWZrnn6lkiLLwfJ08B/g0cSmFIy1J/tJR3rUVKozreuS6C+D3mQ6cA+ZGWuBnv6UAHswKyhimYv19Bu7G+YKaamAJ0hVSq8SlyMpFc/TKb1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748352434; c=relaxed/simple;
	bh=WZLaUSVW1zTkLqqEDqdAyL85Ym7U6Tvej/VLIo/XULE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HCfrQTCXQ0IP060Wl9hhMUIcU0hPyLJIGeYGZxIvvw1F5RevUjMzgLjsP25qcTM+JGowKLA9I5j5MZoDckID4vrL0pwFWC7FQjxk7U5MWSuqfs76op8ZHqYtaOOJZOe/FdggtNYV2AgWgDIuCDv+SqMdU99w0drdOK1CUxuG5BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jibTMKC+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jibTMKC+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD576C4CEE9;
	Tue, 27 May 2025 13:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748352433;
	bh=WZLaUSVW1zTkLqqEDqdAyL85Ym7U6Tvej/VLIo/XULE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jibTMKC+BcPbNGo50bFhbpUoxQCvLqK1QmIli930KypQeRZZ6IwuRCslGY2RPz9vL
	 gHvSRYxs/xthFKzTmstlLRCzQV3ULVoqVAqHXC+P7u8VVpG5eGD/3Mho9hnkigKwB3
	 4KSotrfzoCNcSW7k46qtT1gYRNjihROEkVeGccpz7if7v5Q21kM24fsmt0S7EwF6uq
	 7R3G2/6E2yBUwxQT7w1SYoWzacwMX0cUxdSFcn+sbIy4i/znJBcjdbcOupM8dC09g8
	 gE3IXQ2a0q/gPLLjO1FbhT0s4eDDy0AxO+FO/pl+Su6AHVZKIuy+pTeHNEJPjg50Zz
	 hAdLNvoXqm3Jw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 zhangyi@everest-semi.com, Qasim Ijaz <qasdev00@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250526191820.72577-1-qasdev00@gmail.com>
References: <20250526191820.72577-1-qasdev00@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: fix out-of-bounds access on invalid
 clock config
Message-Id: <174835243163.49001.6702458241020988740.b4-ty@kernel.org>
Date: Tue, 27 May 2025 14:27:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 26 May 2025 20:18:20 +0100, Qasim Ijaz wrote:
> get_coeff() returns –EINVAL when no table entry matches.
> The driver then uses that value as an index into coeff_div[],
> causing an OOB access.
> 
> To fix lets abort the hw_params call instead.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: fix out-of-bounds access on invalid clock config
      commit: 16719d48197bbd8cff121b32acec67d954335437

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

