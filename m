Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A39B29E06A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639021; cv=none; b=J7oohQ3JD2hil8wWROl+3JZGXuyXMfIyEcAzF2kNGdZPXvUE71/6E8PsQhA8Ggw0hxsV0qf1hMTD687ZoPFLHe8jcIaFnrKW7Gp2geCormj+x7nmqB7zjMLW5uFlENmdh2ELW02UsusW+Ay8587vhUCqiAq2nM0xdHK+Zz6rpUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639021; c=relaxed/simple;
	bh=XaS6R82cIPlMFm9fA/QjexcICDytRW+NZmmip3AhyE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EjVjfTF8peSVN86Wvd51453ZltyKBC0RkOnaP413t4pTRkendE4pU/139HBzal4flpzpbf0H4JRN91IrfQsFw4fFdoUoFUKhCmnuT+vJcCqcgAp9GhWwQyW8QqmIebD1w7nGfyiGhijjSHwePKA8m8VfQfDmXnqOmEtHgaZOyDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzWGkEZ4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzWGkEZ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0085C4CEE9;
	Mon, 14 Apr 2025 13:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744639021;
	bh=XaS6R82cIPlMFm9fA/QjexcICDytRW+NZmmip3AhyE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kzWGkEZ4gVUsISXOQGGpe6Z3KHMZoBGToobLczG/HxaFIfCQ/IYEnpSUlYiTUx32S
	 OtdVOPwioUbjtQ3WK/ZRksaVCzh9F8OWt6CCw4L4q7QbGbYmPkAErBhNCEnLz0P/Tx
	 MQLIglzwbTg4igMavLKP0+KVorRF7NAlTf9609+cdX0fMsQcpSs5P3d9zLZbcORUKQ
	 JRr4kkD5+lNX6gu5EeSUVuQErTwCNUmn0oxwXawNiE9zYzY3VRa2zmUcTNM8gi8CD3
	 m5bLEHC0mSandCvB8nQXR1lAKlQB4QnktgDBXcoqwgebVwrLA9yhHZcCPHNEOhFi+h
	 IUb/FXU1sS8CQ==
From: Mark Brown <broonie@kernel.org>
To: alexisczezar.torreno@analog.com, lgirdwood@gmail.com, 
 Chen Ni <nichen@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20250414021950.3755819-1-nichen@iscas.ac.cn>
References: <20250414021950.3755819-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] regulator: adp5055: Remove unneeded semicolon
Message-Id: <174463902039.87058.15290353412603301988.b4-ty@kernel.org>
Date: Mon, 14 Apr 2025 14:57:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 14 Apr 2025 10:19:50 +0800, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: adp5055: Remove unneeded semicolon
      commit: 7762fdab23100514e5cb612331c96bd65126ada5

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

