Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B3F134CB;
	Thu,  3 Jul 2025 17:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751562626; cv=none; b=rdFyZyt/H1nj5Z6qb7mamzpi7oWYRJX+JeCDTfL2C8kqcldYtUJP+uE3YmMJ/UkBbRiS3beS1SA/jGjX8K8KM4pG70jeXqJTdvX7mOJw+aOvsFBtdT+/khixVPAFn/wDZM72pvCXefH3pkgAAb/lLzyvBMCsl37+7jXWQd25mTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751562626; c=relaxed/simple;
	bh=VzRWG1gX60kVXwn8HbbH6pQonisMtxboaYRca9cHhgc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MXibHsrszr0V80ZEkhEpQHeIGlUbpVmsEgR5XH1CE72NWEr5ANqvi4tvI3fHgPQs/VSXeQCriRzJ/QvwjDoQ5eq7D3nut9r7HX1wspOnoH9M7vdzRXAv4WHqUylYgVvjWxMuBLuCCdj/vd3R6AzW8fEbqwsIj93eZRUXCQs4ipw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RO/8MIbP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RO/8MIbP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F128C4CEE3;
	Thu,  3 Jul 2025 17:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751562626;
	bh=VzRWG1gX60kVXwn8HbbH6pQonisMtxboaYRca9cHhgc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RO/8MIbPy3uXKdUQ+wwZj3kIw2kPyWD3p3n6MJkyO6YLMcVEJQmXhMOhOEFuoi+Sn
	 swCXulD8tJo32sk/ayqdN8w7fsVdhjTHCmfpRWyq8ql3/PXV7T/YC10CAQdJ8ABFHu
	 XM5ezIyIVC7FpS5vQ8nJoTjSs9v645SUn0m7eWn76ksGo5wdRTYPvsMo5eWu11WY80
	 UXy6tm8zniSNRFV4NzibkINq2xnjzmVOJGEUAZexxOKmhposHolYgGcdYgP3N8neBY
	 n+hKuMuDEbjXRU4ldcbZ7pH+9ghjDqkvEYc5zETbQyX7811OkJbmUyM0R5x6Ac/6zB
	 R2YbSfwOtSo3Q==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250703102521.54204-1-rf@opensource.cirrus.com>
References: <20250703102521.54204-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: probe() should fail if the device ID is
 not recognized
Message-Id: <175156262505.651944.17565796776876506134.b4-ty@kernel.org>
Date: Thu, 03 Jul 2025 18:10:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Thu, 03 Jul 2025 11:25:21 +0100, Richard Fitzgerald wrote:
> Return an error from driver probe if the DEVID read from the chip is not
> one supported by this driver.
> 
> In cs35l56_hw_init() there is a check for valid DEVID, but the invalid
> case was returning the value of ret. At this point in the code ret == 0
> so the caller would think that cs35l56_hw_init() was successful.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: probe() should fail if the device ID is not recognized
      commit: 3b3312f28ee2d9c386602f8521e419cfc69f4823

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

