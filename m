Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E7821B9E5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 19:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744052592; cv=none; b=fzj82N9qFhoIqrmu+q/hkGYBO6QYWyBi5BqKG/zduj765KKR2WcA+GljM+YX/xck7fKR4IUV92iQy/6QufM9Q3je22SYNIkUkK5h7FwYVrd0nM3qtR5zkJthZXAEZYc7tquSxN8pbsoOWwubyxiKhzC1fel1/9+8RBJGdr3gAKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744052592; c=relaxed/simple;
	bh=WxXvcXWBlibBfTQ5FIb9hcxkhzP3ZbBMImGvDJFUsA8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=puQAWdPXJnPOjfEloJkopkxbkxzoyX3GoLix2BbsgtLstx8vx7/MpQeHjL5yV20QSkAkUemldAadX8UhIAxjI0JgmZmVGOgUENq9pIr6pvznK4O/uK7xeNhiTOTzSu721OtNYQy+Vk3SuPju72y2wbAOWCStFE8/XFiEqF1ZidM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RI/0W5HR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RI/0W5HR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDA2C4CEDD;
	Mon,  7 Apr 2025 19:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744052591;
	bh=WxXvcXWBlibBfTQ5FIb9hcxkhzP3ZbBMImGvDJFUsA8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RI/0W5HRY+3O4bE6VkUzffZl1JVXEQQzZilIGW/OhwqKAAhxLbhTJ0m8rv+bFUPSk
	 TPzjZIxATWyNK0u4mbDkFDo6jyzL+cC4qZgIZWoyWVKsKCI68L6jckhA89295vbvAe
	 aj/cLN3/He8sSTDuC8qztRqN+9LZEV73DozaMCT+RjKYYS0GsIJ50adrxIGhhJMZTb
	 Q/A2LWamLMmpPug33XLN+HWP2Co67hAzYBxQcbE3Rw2FMdSjE0c3kQAk47G8kfdJlF
	 YyNjtGnasX2Kok9KZAyanIYqlddE/XdLOA9mBhy5YlV82c2RADGG9+Wh/2lS/TEgr5
	 TGra7Eo9IR/2Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Yang Li <yang.lee@linux.alibaba.com>
Cc: linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
In-Reply-To: <20250407064532.22680-1-yang.lee@linux.alibaba.com>
References: <20250407064532.22680-1-yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next] regulator: pf9453: Improve documentation for
 pf9453_regulator_set_ramp_delay_regmap
Message-Id: <174405259056.819169.10817429856101827771.b4-ty@kernel.org>
Date: Mon, 07 Apr 2025 20:03:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 07 Apr 2025 14:45:32 +0800, Yang Li wrote:
> The function pf9453_regulator_set_ramp_delay_regmap lacked detailed
> parameter descriptions and return value explanations in its documentation.
> This patch improves the documentation by adding specific details about
> the parameters, their usage, and the return values, enhancing clarity for
> developers.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: pf9453: Improve documentation for pf9453_regulator_set_ramp_delay_regmap
      commit: b3d9e96c96b0076a11aa1001d55b3dc189b8cd1c

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

