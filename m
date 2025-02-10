Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFDF255E24;
	Mon, 10 Feb 2025 18:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739212094; cv=none; b=chp/V7LRp/MSkg/wSB8kVsPtD9SOc7wF+v2CDF6S4nwCHHitfKuG+zGqzJTSk7kOoZmJcnPPdxlCGIGbGHqYYImkfOEz/xZIG4NiSQGdX+AvlX2sLj+AruDm4usoSRpu/iEbl0cL//NRhU+YQcw4JGHwJVjv2o4EnVJWgn9o2Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739212094; c=relaxed/simple;
	bh=XZl8USZrO1arUASn1GhSVmW9UyheFc7MdCGJClpH2Y8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l/FKiBrzaxb7PneJUJKbSJpNIk+q08doUI2Xi1d/lPDEAw0yW/t3DnqPKurzcdNIHPZ62EYF4Eg8i0Hn/LfdXgZQHh/qfaIUC0YhqVYgFnSjUSB8Hvox8SHWvYCtzKVsBtcBvj4jc13Voi756vWOgAx+yMlmkSTfYuI1E7EOUco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qLPemjEZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qLPemjEZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE23C4CED1;
	Mon, 10 Feb 2025 18:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739212093;
	bh=XZl8USZrO1arUASn1GhSVmW9UyheFc7MdCGJClpH2Y8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qLPemjEZ2boe6wr62Q06l0LCFVr/MWmqYCmAhEvvIQqlWrHC/S4jt+4CehLQCLnjS
	 rG2Uaqr54yBW2w8VxiqikE1c3T9HnaEJr2C+2xqJCjqNJVPpTiAjBAYXdc0pqxRm62
	 gD/1wkFbTHKHf10qF+iBXxmZsnA28chHf4SUjXOP4iv+LQromV2bl56WnokGaSn7YU
	 kf9bYYlLih+ufDR2BR3I+uyPAyCjNhXKCGtYuouWei0MwJ1JYH1azRDLvd4Dgoxj5o
	 FxFpTNj1mOi28o19YroZw+WZpflYrOxvoSKUFbKDCsJLuK9m3TuEuV88h0hP/mNu+1
	 Dv5Ps2LtK80hw==
From: Mark Brown <broonie@kernel.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, kernel test robot <lkp@intel.com>
In-Reply-To: <20250210163256.1722350-1-sbinding@opensource.cirrus.com>
References: <20250210163256.1722350-1-sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v1] ASoC: cs35l41: Fix acpi_device_hid() not found
Message-Id: <173921209231.185908.9967906389532316081.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 18:28:12 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Mon, 10 Feb 2025 16:32:50 +0000, Stefan Binding wrote:
> Function acpi_device_hid() is only defined if CONFIG_ACPI is set.
> Use #ifdef CONFIG_ACPI to ensure that cs35l41 driver only calls this
> function is CONFIG_ACPI is define.
> 
> Fixes: 1d44a30ae3f9 ("ASoC: cs35l41: Fallback to using HID for system_name if no SUB is available")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202502090100.SbXmGFqs-lkp@intel.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l41: Fix acpi_device_hid() not found
      commit: b19181638182d1f5c43757b471c056b6196c8ca3

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

