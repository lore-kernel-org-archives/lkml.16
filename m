Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFD523C8B3
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943465; cv=none; b=sj3GzoLLG9+/g9tblCZLQJ60IL9cVMm7JW7b3UnxO0/6j77FP4epKWx5jo0jNxEJZLvK+6yPgOTvFIKKCNXPgVIDN0D3ylRDrRqXGVntXXSlMi1s9m+9ccqslI/OZTXsHp5R6QbAn9AlFZ5sJfKRx7Q9k/M0VGcevFmaBzX61Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943465; c=relaxed/simple;
	bh=59IsnJr4sgJCISyPm+g4+TqpK1Gp2/NGoZSfEA16aPg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=blzy4JJU0BL6Zo7ZG2NTdnhXGsawGSgsAKIsg20jDLNnGhxdQQGzYMIqrRI1zx2YQ2iR6E5xtvBabb8Bv5zQd+7imSa6GnrzBjjB7bVjP4W/QsERlcsrq+NL+D3llHztEflnS2j2WusKS+cU4I6581tQ774dw/Xgaioy7UJCJvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tNmwLVZG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tNmwLVZG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07E7EC4CED1;
	Fri,  7 Feb 2025 15:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738943465;
	bh=59IsnJr4sgJCISyPm+g4+TqpK1Gp2/NGoZSfEA16aPg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tNmwLVZGHUZPiDLQBDa3BHQnUBP3WimmIFemeccQkwH8aVlOpkw/8gVE18qE6aD+a
	 cgeWpBFWVQR4Vw/GBplDqJgOkYet2XgQVjZqBA7dl1eHm7T+8Y4kp6ea7eWFE6RHar
	 7rR322L4vKEd93MpkpD4ToaM8Hy6bKY17Lj8vqktILRF9Ujy9C2TN8q3cyAO9L4qNH
	 Gtx5acnRCnJjT3By53w8rcqkda7w8S9/FCKngVCSRbjWFSEzTnqPJjDgWzsnieLo3l
	 utV2E4h6j83+TepoWDw9tW7ZdPBP2855jjp6Y6J3/4YbKRk/ZLGM0VzEdUpvEndv8X
	 8SegC1lvDdRxg==
From: Mark Brown <broonie@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>, 
 linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
In-Reply-To: <20250206191644.1132869-1-andriy.shevchenko@linux.intel.com>
References: <20250206191644.1132869-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 1/1] regmap: irq: Use one way of setting all bits in
 the register
Message-Id: <173894346374.58107.5264743305623121653.b4-ty@kernel.org>
Date: Fri, 07 Feb 2025 15:51:03 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 06 Feb 2025 21:16:30 +0200, Andy Shevchenko wrote:
> Currently there are two ways of how we represent all bits set, i.e.
> UINT_MAX and GENMASK(31, 0). Use the former as the single way of
> doing that, which is crystal clear on how we fill the unsigned int
> value.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/1] regmap: irq: Use one way of setting all bits in the register
      commit: 153dbf4adad0082d030c30d20541df2b1af52db6

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

