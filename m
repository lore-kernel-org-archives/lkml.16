Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F0622259C;
	Mon,  9 Jun 2025 21:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749502854; cv=none; b=c0NV6S602nx+GUVXEZNSkls5XTkZx7FEIfAgjUtvEyMl/MBknIYIAqgVjZ4syjPKZPFoVKHYdkaEttLzRTqLJWeUHQyT/aTdLfy3YQdiyPRMiF5Gp8v5h1DLPH5z0lU08zp2079NC8PHgbL3AONfNHJzjvlcKCkg/3dEErvAHmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749502854; c=relaxed/simple;
	bh=onXfm+HG8EeIacsf9JPvIQnWVREodwC8+l7WQ/tZOlY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O8w86epaPbbNFLIEHU+sdzugy9aI337iiNJM5U7Qh7ezg9HTaBcKDtptk5izMwQyOMLZlDegCdtW5xE6y8cPOM5L/SxU01i6HQyeDjLKwgc7zmYrQ+5K3tPQyUQX8IRi4kJIyuXN0iE1KHU9Y1rIhH1GEzCRlrEucAD4Z7EOCfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9QA/gu0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9QA/gu0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57120C4CEEB;
	Mon,  9 Jun 2025 21:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749502854;
	bh=onXfm+HG8EeIacsf9JPvIQnWVREodwC8+l7WQ/tZOlY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=P9QA/gu0FG0+X+fmbsDzXIaBuw+zTT3NYhPaqqYLmhODf2akCMrf/6WCj1wEpc9wV
	 kNyCbtLCX2Bf+Y+wuFP6JBbsFXX9Teyf0f5p4Wmjq7MsCM1FY8fy4hfPTf/MGfz6tC
	 RbqA8B8y31xio/hBOi651/cho+rtnqwBhVjx/L8+DL18m3Dzt6Xq89RxqZ6zIvkRTg
	 SWWVhZ0igQ9q7wZmkYpEYrjVlqAWBaj+Nj0oGQQ3M9BN5Md4ErYGdn5RzRqP4dukvL
	 ur6XJlxRilSXTMBmKaq4UotpKP5x85iObLlXyGYsnZNVWzdkIsBkmYt/5cMNGHHVFR
	 c5Tk9MXWLBnPw==
From: Mark Brown <broonie@kernel.org>
To: nicolas.frattaroli@collabora.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, heiko@sntech.de, linux-rockchip@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <cover.1749201126.git.xiaopei01@kylinos.cn>
References: <cover.1749201126.git.xiaopei01@kylinos.cn>
Subject: Re: [PATCH v2 0/2] Cleanup in rockchip_sai.c
Message-Id: <174950285209.277844.16538402979333131018.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 22:00:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 06 Jun 2025 17:18:20 +0800, Pei Xiao wrote:
> 1.Simplify the condition logic in
> 2.Use helper function devm_clk_get_enabled()
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASOC: rockchip: fix capture stream handling in rockchip_sai_xfer_stop
      commit: 5dc302d00807b8916992dd25a7a22b78d07dcd03
[2/2] ASOC: rockchip: Use helper function devm_clk_get_enabled()
      commit: 03b778d1994827ea5cc971dbdfbb457bbb7bfa5d

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

