Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFF527510F;
	Thu,  8 May 2025 14:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715142; cv=none; b=kKC74CtPR1eW636zn5XfVNw62Woz5uHeJzS2bUSj19hu9wFMF6+IQ80NvndDiLHMX+LKdNht0f54Hi6CTMBdKjguLLRTqp35S4731j32sIfGBgFKklFjgvByQ+avH+NMpBynLByP4p3cfWSMUlTcEc0oeOUZdabs6Jm+o7fF9Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715142; c=relaxed/simple;
	bh=PzzI3I14PiyWPXZh+l4DtbAgHiPoWtQFR/ogfgbK28U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=thPI8+Hj0+bSDyY9xWfnMiQzV7FvzwOx5qUUSYvVcoA0ibkuyvt5YlUnAzvUP2GdZUXYReS3dnR/vr9AL236ie+rikLI9aWqtvyE5luOp20xnlQh6xLOPc2mH5f3iWVHWc3NV+zR/vqfGHllCyBVlMkgVKc0Bweqh2DHhCGr5qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Np/3PiOt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Np/3PiOt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA768C4CEE7;
	Thu,  8 May 2025 14:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746715141;
	bh=PzzI3I14PiyWPXZh+l4DtbAgHiPoWtQFR/ogfgbK28U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Np/3PiOtH7WRUC7ghcr+8mxSxM87tlsPb8xswco289hDTNBw2renrGaHzVYoqTX7f
	 cKQYrtmmY/4h9e+IcwomvP2n2K1B2mBYhjRXIg/uwe2cahUXtSt/0CTqLgsIeJPtjp
	 zRgP4CZFbLm4wT+wsDXuFB1ABPF5hF6g7jEFCWpN4YC2llGQh7C7xOreY7+tW9agcu
	 nupmg89aPURBlTH/X6XV8BQQ8ebRlSn7NhUasK7LmpHfCwxYpBAOq3SUPyZdNh+MnF
	 p/DzRuTYzYF+kZu6OLkzgd6zsK1wqRgNnffrzBfj6mOYth4e3NQzF1vjOMJbWATequ
	 wwqh3+2+APSFA==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250507140907.255562-1-colin.i.king@gmail.com>
References: <20250507140907.255562-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] ASoC: rt712-sdca: remove redundant else path of
 if statement
Message-Id: <174671514005.7345.2238491722713316258.b4-ty@kernel.org>
Date: Thu, 08 May 2025 23:39:00 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 07 May 2025 15:09:07 +0100, Colin Ian King wrote:
> There is an if/else check where the else part is executed if
> adc_vol_flag is true, this else path checks if adc_vol_flag
> is true (which is a redundant second check) and the if path is
> always taken. Remove the redundant check and remove the else
> path since that can never occur.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt712-sdca: remove redundant else path of if statement
      commit: 8147e75bd5f0977f6d389f6cdb4f10956cc3d88f

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

