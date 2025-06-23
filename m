Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1483299955
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750694431; cv=none; b=b+UYEQOE0FDFTMycGuKpbab2wtEW2wR3qqgrFHKQEYlNB/q8IVgcq1sY0//480tjt+82nGIq5GJE0A+Ef3a/U2AkUbhWmTMD0uJHx7buVYcG5JX5uQ+rb94+cpxVTVPlhy883SR/lx9fNz54AX1M41rgqBt1VAz4sCKLoeGRgUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750694431; c=relaxed/simple;
	bh=/aUOJv/viu6L1AUibOr3RuEmcn+q750DtLVDPmszDgc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aiqMb+0J9JxN+eQWtOixslTmrwNI8g7qFMYU+grGqQpaf3j2/IVo22J0W8Lb3HhxliNLhsqLBAuoysJh6km6FqltBLUtyx4qs6aAeWhr5TmdsGJay2gZRKicvk3OGZq0YZGd9PduG2aMdl955PpuugWpB8fhSvHY/Mfn5DiQMUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tx1i6ZV5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tx1i6ZV5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C48EC4CEEF;
	Mon, 23 Jun 2025 16:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750694431;
	bh=/aUOJv/viu6L1AUibOr3RuEmcn+q750DtLVDPmszDgc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tx1i6ZV5zyxqyV9XllQV0BVMS5W1QMs5TL38OHLQdoIMR5uZY8SQt3OHTFrTLwrVS
	 fnk91QOz+5j/WakGql7BRD1Bp+P+MimG7U6hM3oSN/hHfLEbhIWl071CjoDBpNOakh
	 SrLrsaFJMxEEtpaNsRS7mcJUALcus7xm7aoYcj+VGmcd3UofqWcpVNWv3trEHZFi5x
	 3CFy8yXR+tpYduzjzkrnrCQYYL6QoYue+e/wxfxj//8vWOkQg2LK390q8/aYiMrHjU
	 +uME7CsPaP9JyLHxne2WnsgDxMoxKFU+v7mile+TOZkxoygjlLR/L0mEIYoPIQ0/eD
	 bpU8uR/L7SGPQ==
From: Mark Brown <broonie@kernel.org>
To: Yuzuru10 <yuzuru_10@proton.me>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250622225754.20856-1-yuzuru_10@proton.me>
References: <20250622225754.20856-1-yuzuru_10@proton.me>
Subject: Re: [PATCH] ASoC: amd: yc: add quirk for Acer Nitro ANV15-41
 internal mic
Message-Id: <175069443023.140181.7183611735574302998.b4-ty@kernel.org>
Date: Mon, 23 Jun 2025 17:00:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Sun, 22 Jun 2025 22:58:00 +0000, Yuzuru10 wrote:
> This patch adds DMI-based quirk for the Acer Nitro ANV15-41,
> allowing the internal microphone to be detected correctly on
> machines with "RB" as board vendor.
> 
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

