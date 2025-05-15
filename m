Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D82A2797BB
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747294535; cv=none; b=GFmzWzHv1WrOLxyB0U/8W9WVFmmGCJkJRVt5Bd9mgRQIrbejZRkExSiGcD5u3+7XMr7W0s/MYufnjFnBx5PhPte07wmUVICxTKwJmFUFsjf3Uj7it+WJPNciu0O2KNjXbCeiQ64AZJUpuzA0ImO1OdOnyk7yVYNx9iAQt1jojKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747294535; c=relaxed/simple;
	bh=Ds8KGfm5bbLD5tihgkQnqH94C+3aiFQ2p6EGCGRpO/U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IzjxH5mVmipO1WjPxw9yZPr4aEVBEDaS4/jVXiDuu8xeGC8Xl9SI8J69Jd89E9DzLPMicxCYVbqzr2G+DbWSH0sRqij2N2izZxxN9JrfqZEM9O62cNVRtWbapmOcQizI6W+vDwSE3oyYbe4E8bwjBQj9YguFvNHQJejGCclYQLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RhU3abXE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RhU3abXE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2193EC4CEE9;
	Thu, 15 May 2025 07:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747294535;
	bh=Ds8KGfm5bbLD5tihgkQnqH94C+3aiFQ2p6EGCGRpO/U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RhU3abXEJqZQfZVN5c/rlOhasBm5QA/7p6gsdiOQnYObvr2LuZLfIpgaTzJimbMgK
	 UHHZ2eoEW4xO88G1I9lhl7Kqphw/9DGtKAj+30t9ewKupqyw7m+dJn91uMimX3fDSJ
	 EwaoXVXAlQy78kV3A0GFWUVfkVPg6UmISEd+M9sRqs5l+RsKj6hY0QP+KGiDp5VjOQ
	 YguuuOHyJ/mK8n9q3aOuz441NZfEsGCw54sRGuq9Jl8dqs/qcioaxwvLXrN6kPtllV
	 0rWiZfya5N6RNXzzgenxpNugAXytoL295oLkkSAqT9puaiJ1RSfjvvEsjpP66o+Gr7
	 6u4inAJHl3mJA==
From: Mark Brown <broonie@kernel.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Watson Chow <watson.chow@avnet.com>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250508064947.2567255-1-demonsingur@gmail.com>
References: <20250508064947.2567255-1-demonsingur@gmail.com>
Subject: Re: [PATCH] regulator: max20086: fix invalid memory access
Message-Id: <174729453162.272608.16147377004794102016.b4-ty@kernel.org>
Date: Thu, 15 May 2025 09:35:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 08 May 2025 09:49:43 +0300, Cosmin Tanislav wrote:
> max20086_parse_regulators_dt() calls of_regulator_match() using an
> array of struct of_regulator_match allocated on the stack for the
> matches argument.
> 
> of_regulator_match() calls devm_of_regulator_put_matches(), which calls
> devres_alloc() to allocate a struct devm_of_regulator_matches which will
> be de-allocated using devm_of_regulator_put_matches().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: max20086: fix invalid memory access
      commit: 6b0cd72757c69bc2d45da42b41023e288d02e772

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

