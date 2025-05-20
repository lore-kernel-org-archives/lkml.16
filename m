Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D86264602;
	Tue, 20 May 2025 09:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732815; cv=none; b=imkiHsbSKpybsH6DOKD6QL5rYkEegx3iYJvTY6wKJ/NDRs58wgitXznMilUs0eVbt1XY9vrS9/zJ9qHjDjZucFRNyk+CbTXHzddbMyg//xg3TSBNBEyM8oLrCLBYj8r+L1WErD8yoPlmWccc9/tw3lGUXrvjvLAdBkgU/H5izLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732815; c=relaxed/simple;
	bh=PVXmFS9xocJhFw8tMe/ApKjvpnBjGHQjSvNu5PMoN/U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dy/kH0eKsT7sz48B2qCEJvzI9e+veiD/8pn0wDnf1amjXEpDTYLLvaHhgaqKL4jiUa16Jvt1o5B+nAGfDdimrjPNsH3aNGW76DB3x51vFdqUqUoJi169Ny08+ZC57R1cfRMlro4tV5LfwpLQs97ZCeiqTyYtjCBTL0DjxTGz/+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MSOdTSpJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MSOdTSpJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1938AC4CEF0;
	Tue, 20 May 2025 09:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747732815;
	bh=PVXmFS9xocJhFw8tMe/ApKjvpnBjGHQjSvNu5PMoN/U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MSOdTSpJ58nW4si3Eh1+RbNUHw79/WOR/TM1Hdt4rlicZt0trbLqEuL5uIK8ZvfeB
	 gMNf3TA2022GGTXDuf+/3Q/afwStNhKaNClIjW8+GOMtvBAG7PRkN1/wRiqPCg/gBJ
	 6oaSFJn7r9MnMF3UlZqCFN+AdLlgXYo/HepGXtsHn8Q2nkiyNjb/svGuxzG/raeUvb
	 xoeqxSTa3mN9lpB/dP7wKV7VD0NN6QZp9wb+Q2R+rZcOCZAYNqIZI4/tQJWfhEAur9
	 lwO95zZPCVCExf0rnl+XM08fcz7YIUR4jknNy5h6vtYzwFm3qO75Rc4KF7S7luVC8v
	 YC+2fc8peMQjQ==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, tiwai@suse.com, devicetree@vger.kernel.org, 
 conor+dt@kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, perex@perex.cz, krzk+dt@kernel.org, 
 Zhang Yi <zhangyi@everest-semi.com>
Cc: amadeuszx.slawinski@linux.intel.com, krzk@kernel.org
In-Reply-To: <20250328080319.53734-1-zhangyi@everest-semi.com>
References: <20250328080319.53734-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH v7 0/2] ASoC: codecs: add support for ES8389
Message-Id: <174773281169.19497.722800588557343368.b4-ty@kernel.org>
Date: Tue, 20 May 2025 10:20:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 28 Mar 2025 16:03:17 +0800, Zhang Yi wrote:
> The driver is for codec ES8389 of everest-semi.
> 
> v7 -> v6:
>           - Modify the order in the Kconfig and Makefile
>           - Remove ES8390 in description of codec driver
>           - Romove unused variable in the codec driver
>           - Modify notation for declaring variables
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: add support for ES8389
      commit: dd4eb861d0521acca1b7e07683a7e90b2e01f66a
[2/2] ASoC: dt-bindings: Add Everest ES8389 audio CODEC
      commit: c8e7d528284a0bb1cd462b994c464bf31d24a0ce

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

