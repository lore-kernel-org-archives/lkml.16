Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08771259CA4
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749476429; cv=none; b=GyqGEtf2quJessYGhJOi54oFP38QGd6vwqtFWDO9JMEG10YGV1sXaq8sGr/5vzwXex13z1P3icBn22tycqUKlzpZvyWCW8DVBPzHtiJiGJNoA5ZgzB8ljr9q4UAB02ZGMBLEsQ72eX1CQZM6a/8FdL7d0hFCPypReUnGWqTcMQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749476429; c=relaxed/simple;
	bh=aG8Or/augGCtlQoOopeF+AbVi3vR+yrUd4NFn/Z5mQs=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MWpHjruf29/TbOVZGRYh4/PVWqCUvTp6KXBg3QR/XiVZ4ZgIub23Vd1fdVSiyUFWRWSNY0cKbWVX/WG4p9IL39B2ObO38yD8VLSwlhoCbOeBi9rmadIBeJHjYkwoYXsZFqvqybaTg0rqwZoR6pAO4hZr4lsgewlUkCsIwdQIprM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGjM5S95; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGjM5S95"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9BDFC4CEEB;
	Mon,  9 Jun 2025 13:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749476428;
	bh=aG8Or/augGCtlQoOopeF+AbVi3vR+yrUd4NFn/Z5mQs=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=fGjM5S95T6EcOKWZCnvNU6pD5AAXubjnEn1ZrnO4MFIHonoVWogFpAm9yZqNK8jSh
	 VKYwfOpdwLj8dIQeaaeUOmLMPcWcu7tZ6sj1GxGJKEXnN7lwl+r8ZHNu+o3pmWqjhn
	 Kzq3nwmuGDsgJlWdoTzZJSGBaq9OL2LnPokkfTtRJD2A8JQy4DrzFwM8nRXkTAcd+S
	 LDfqlwLqNKBRNIA00j/Q2bA7Lv4ambkuXGhz6JZUVZICL8CaW71/3iMRnoMBg2gZkc
	 Cpg8Kr8XA/bvvvKXzXYT6MBCc8mLakehNghgxn1oDMHFE3Vj5yscyhJUZT096u5aOP
	 JiEoR4dvQY2MA==
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250528194501.567366-2-krzysztof.kozlowski@linaro.org>
References: <20250528194501.567366-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] regmap: kunit: Constify regmap_range_cfg array
Message-Id: <174947642762.126895.6773181163664093682.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 14:40:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 28 May 2025 21:45:02 +0200, Krzysztof Kozlowski wrote:
> Static 'struct regmap_range_cfg' array is not modified so can be changed
> to const for more safety.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/1] regmap: kunit: Constify regmap_range_cfg array
      commit: c8c4694ede7ed42d8d4db0e8927dea9839a3e248

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

