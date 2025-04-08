Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A9E267393;
	Tue,  8 Apr 2025 09:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104275; cv=none; b=Oa7kxofKb5vGw1aqkJ0/CdvCYw7+xiWNR1Pa5tIJRQndbnf1iCN6E9UtXmQ7+av6m+7olHH0jgZ8SJbKykA3rTdZxknauTm49M0oSogmIFDOP/ovXPl96m7PE6V2WboHk3X/Nt1eSQGiLsKYLKXnHUl40imKPStnwQcKLWfqAUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104275; c=relaxed/simple;
	bh=CGy2xPNTNPMeUYQCJLS8Ysv/1ENW+iVpqG/OJCgJdMc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=N27fOVXKifR+y2tuYwIBFJ6CbouRlv/0hENlTA5bCXfr4jrp2C+gTIWpPBm5CyELq0lA/UDHL/zY0EijP73we+zWVkbjEFpb3MrvL5zmaMmhzGdXsL4Vf9QApBPXDdF8ZZFleaxQFWFRAQxA+sHeb6JY92paHW/IbuQV/H6D44E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S7ISsU9W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S7ISsU9W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0897EC4CEE8;
	Tue,  8 Apr 2025 09:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744104274;
	bh=CGy2xPNTNPMeUYQCJLS8Ysv/1ENW+iVpqG/OJCgJdMc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S7ISsU9WmQA2ICz7i+TuSAw3dDDby7jWtiiPkEghmKx5UJWXqhUyM2osZ6VnNgRFQ
	 YvMTQDjOPBWm7Ck8rLrocWzyk/HXX22MCZgL4zAScjutwa6Sr3JLAwYzw4HzTQvCI+
	 3o5W/W28IEpD8JjNCqvfuyJKEbrT/9PSpOcA1lua+FIWDiCWpOD9jtm0S3RKxPWId9
	 0RpKTbIN5+5b57bF4p8uhiyRKycWl4OGMgMt369B5XGJnNsYCD4gXQePzjHvJbbpgW
	 e9mnU6uEinJFd5nGMGuyb5DDXWOAPpG67uPKp2vBEgKBY5eQP8nzfLQZ3l3U3IOv0r
	 x029FVPeMU3fw==
From: Mark Brown <broonie@kernel.org>
To: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Chen Ni <nichen@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250407063011.2771977-1-nichen@iscas.ac.cn>
References: <20250407063011.2771977-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: tas2781-fmwlib: Remove unnecessary NULL check
 before release_firmware()
Message-Id: <174410427277.1933566.13201223090251190652.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 10:24:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 07 Apr 2025 14:30:11 +0800, Chen Ni wrote:
> release_firmware() checks for NULL pointers internally.
> Remove unneeded NULL check for fmw here.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781-fmwlib: Remove unnecessary NULL check before release_firmware()
      commit: 348679ffe7f30f6eb05013bc485fd295d9f5441c

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

