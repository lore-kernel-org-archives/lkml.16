Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09EF199E9D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750166512; cv=none; b=rwqebLAZZdFBLudhLh6JjVUvMcm49M/QXBhlnXgZQoPikYIo/41qhUemLV+sOUcrTJYCVMxlnjWNv6X0Mo9RAkwvITJEAnFJgBjBQ+2Pw7nF48i9VCnNrwO7HIVkmHKzkybK8SLk2AyXQfVzVyhVMahJ1KYhZe5E5BvDsuWie3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750166512; c=relaxed/simple;
	bh=sgl0GKMwAeIqs5yYaPUt4LUfXQa5X03avynVE0AwmiQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TPO9wVNV19hza5blaIFoT5cH/B2Wmx+Fb0439XjJ5nCIv4c2YHDmXt1vxCJyFpiR0ao8xVhlumGY+AutkwDto3fSFo/PNtRRtpo91DgzLur+ZeFTTId5nXOyItxzZSOr/O1ZgrIc7bCTDWysNNg8r6x27VmV++g0kqZG/92Ru/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S7mT+vHb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S7mT+vHb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BCB5C4CEE3;
	Tue, 17 Jun 2025 13:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750166511;
	bh=sgl0GKMwAeIqs5yYaPUt4LUfXQa5X03avynVE0AwmiQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S7mT+vHbm4YIHwgHaSgK6Lha9QEynDdrKn46XfPesxwRAsNcPgkHHGezKHRC3yzVy
	 2mBvOmNY0i/F55/1y9lPGTEzjZvtbdPekkAV7hup5EBacmuW8Z5/4JK/MM/ti4Jefn
	 715KPZ9wOM8n0RzdF/+ETehL00F9SHLBphmT86qNkvEP2gugxoZZzIPTEBsIwp8III
	 p+FmFNtHyHyZiYAq8AID/dkHPitsWl7PnoKbFwLvARIh2R+OrxfrPlsEnbWLVzkop5
	 JyHYPggyQYArdu9iUVq/f1u6Lp9QIpg6hSFSXPuhUMb40JBDOxs4psqr9I9O2O6YH8
	 GlS4xEBhZyTxA==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20250616154018.430004-1-marek.vasut+renesas@mailbox.org>
References: <20250616154018.430004-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH] regulator: rpi-panel-v2: Add shutdown hook
Message-Id: <175016651017.38761.10081771279531049568.b4-ty@kernel.org>
Date: Tue, 17 Jun 2025 14:21:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-08c49

On Mon, 16 Jun 2025 17:40:07 +0200, Marek Vasut wrote:
> Add shutdown hook so that the panel gets powered off with the system.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: rpi-panel-v2: Add shutdown hook
      commit: 3e1c01d06e1f52f78fe00ef26a9cf80dbb0a3115

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

