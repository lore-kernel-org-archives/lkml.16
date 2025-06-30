Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BF525F97A
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751283631; cv=none; b=JhOrM68QyyPlkLUmLvcjITfkPHVV4xpdPuzTxa+/BN7vDq4c2pGy3zh4Zb1HTFSSCi+M6qhiiWrViJ1/x+qWXRv9iSjvlTX/h6AcCzQIiEumbAWKENYP51sFWLuFzgFz5372yAnI9nZezHkL/qBqwIul6J9mUZOVC09TjLbIH+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751283631; c=relaxed/simple;
	bh=2Fvt+aO1cI1fwgtC/7qmlUKKCjIelkiItkI+ytF3KiI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tlHapuDMP10nunzWQqjPCxyqgehozWzS7SzYMsT3Gq8yhcsLTzs7p14WBcRuapiGymCZTpyPawofDO2N5qx8NIfgSUfMczcdfOZNnBK/fL7HJr3dLQltIjTImHlrK6oiWGfoABuvVwTmXu30XUD8jtKhjMXEbKxmMLNA8bxwZkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOJXJXPF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YOJXJXPF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584C9C4CEE3;
	Mon, 30 Jun 2025 11:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751283631;
	bh=2Fvt+aO1cI1fwgtC/7qmlUKKCjIelkiItkI+ytF3KiI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YOJXJXPFm7bOGQrT+IUPK12RsODpirsKygH9kpA4UA/2q89Y0KIJpEeR2lR4DuiYc
	 AS/oPG+gAmwQJ8jSJ3sA5e7ZuzSYpPubOl/ejciTy9Ru2j+G78qi7MBIPFb02+tjQu
	 bbjHxKm0XEnTiriwiO1g6NDyt3gNK/dGMB4O3aMRmfVz79nNWNlTg6Qp4pHmrJtM+a
	 SmcJWZnz/l75GqHyhW8u2WXXCCorvin3gDEqWADZagjRGDk0AQAlhUGO/8q/ixlApc
	 Plftto37rxUPeM6nCDwgtYmBd52LJ2kpV7QC5+J+Yq+vpKzzm3aucjJSHt0B3t0pPY
	 LSFqnv8dPwKKg==
From: Mark Brown <broonie@kernel.org>
To: Abdun Nihaal <abdun.nihaal@gmail.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
 tanureal@opensource.cirrus.com, linux-kernel@vger.kernel.org
In-Reply-To: <20250626172823.18725-1-abdun.nihaal@gmail.com>
References: <20250626172823.18725-1-abdun.nihaal@gmail.com>
Subject: Re: [PATCH] regmap: fix potential memory leak of regmap_bus
Message-Id: <175128363009.28771.16646321017336879402.b4-ty@kernel.org>
Date: Mon, 30 Jun 2025 12:40:30 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Thu, 26 Jun 2025 22:58:21 +0530, Abdun Nihaal wrote:
> When __regmap_init() is called from __regmap_init_i2c() and
> __regmap_init_spi() (and their devm versions), the bus argument
> obtained from regmap_get_i2c_bus() and regmap_get_spi_bus(), may be
> allocated using kmemdup() to support quirks. In those cases, the
> bus->free_on_exit field is set to true.
> 
> However, inside __regmap_init(), buf is not freed on any error path.
> This could lead to a memory leak of regmap_bus when __regmap_init()
> fails. Fix that by freeing bus on error path when free_on_exit is set.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/1] regmap: fix potential memory leak of regmap_bus
      commit: c871c199accb39d0f4cb941ad0dccabfc21e9214

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

