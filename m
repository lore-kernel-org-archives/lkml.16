Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8AE284B51
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744355668; cv=none; b=nVyHE0B+3wAswboce0LMZEFvJceIcgf6NFJUjDMdWOh6CPXoiOjL+LsqoLgfJI/iyzKZ3zX97dIwuzrvMdikI6WXiMH/XWWWZSfBeJWQZpihYn+F7Q4a6JajMUGduSbQZGNYvH7GTFxmSe1oBxRGuBMZU3RTsIsMSCuFsQmypkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744355668; c=relaxed/simple;
	bh=hbP4JhICYtCfQ1uRJ5JdPTO6bbJmUwgl4nprRy6NJZ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UK5jpRukXeUmtTuR201QoLBF6pKTRRUkNbTbnU2yRVXSefGDxmZ8/RXeURLm+z+HkbAsUj9GayQjAYJpEYuvayMInYdGP6jDmDk4/SFRC0o2RxYgYGatGWvNchVXbyUs+uW59ix4KLqYHR3RrnD6YjoFsgwiWHRsXB15ASiE8UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsMLgiUM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsMLgiUM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D8AC4CEE7;
	Fri, 11 Apr 2025 07:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744355667;
	bh=hbP4JhICYtCfQ1uRJ5JdPTO6bbJmUwgl4nprRy6NJZ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jsMLgiUMk8eZvQe4/lkjALYIjNOaa/4vrdRO163bCkyet5ry3DLG+4Gw6lFoiNRQT
	 f8p6oLUlI5DmDTyZ3XmzVnbR0wyCYNSWxtiuPRsgeZ8BZ7P3bk0Ap/OJ8MDZPLsab0
	 1IYHMioiK9Gy6Gx1xuhYWyr/rB/suMJ4xIw58gNZNadjpoHu6dUohhhyrpFheQ3kZb
	 gD3gV5kWVzlJQoRBb5SnkXF9IFyuJf1hE39/cJ3taIJLCbL8Vrfg8x/FxMXu2D/UT6
	 Ayw/10JRZgUg9XYIaqFYMP1jO7jrAhN3ufSs90ndrSVTjbSXq30mojeEA4LY+55WdZ
	 0bq5eacT+HN3A==
From: Mark Brown <broonie@kernel.org>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
In-Reply-To: <20250410141006.866813-1-arnd@kernel.org>
References: <20250410141006.866813-1-arnd@kernel.org>
Subject: Re: [PATCH] regulator: adp5055: remove duplicate device table
Message-Id: <174435566656.1327810.10089089113461356151.b4-ty@kernel.org>
Date: Fri, 11 Apr 2025 08:14:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 10 Apr 2025 16:09:58 +0200, Arnd Bergmann wrote:
> When building with -Wunused-const-variable, gcc points out an
> device table that is not referenced anywhere:
> 
> drivers/regulator/adp5055-regulator.c:346:34: error: unused variable 'adp5055_dt_ids' [-Werror,-Wunused-const-variable]
>   346 | static const struct of_device_id adp5055_dt_ids[] = {
>       |                                  ^~~~~~~~~~~~~~
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: adp5055: remove duplicate device table
      commit: 28cce24d6596a3d8a34689031f2a8a5ac918cde5

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

