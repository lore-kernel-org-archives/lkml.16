Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7C428B7FD
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751295962; cv=none; b=peY4JzsoqdLur18mHwbIw58Ah0GQ+yl7j29i1sc34RZ/JeKMFypRTfLT/uODehclCU7Tv7u+fCuhAn4yoGYYUi8MDNv65odR893d2WMzkSuM+rH2S4WWrE9bxWGZNIVuDIL2oveE00cp41sK5elyt/xRIQqYnUJMzcSzdeXRh9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751295962; c=relaxed/simple;
	bh=u6d8n5rtJ0vsmJechY4Xz6Lnsx1q0Hy1z/DFz+Rny6o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kl8xIWDvxasq/BDvduHzzRUVuwJDqeIKBtFLguCY2I5H9znt3lfWG81EzKQM0Mq7IzrYVYgUVSAdt+MIZMk7TZU0UU+L06WZjPApLZCbKkMRFxe15odf9SgwHHqJ26sK2sGyU/vq7ieoOiQ6tartz3aNxNuMTYmeLKK80UgbPVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uqKMv7ns; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uqKMv7ns"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6362C4CEE3;
	Mon, 30 Jun 2025 15:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751295961;
	bh=u6d8n5rtJ0vsmJechY4Xz6Lnsx1q0Hy1z/DFz+Rny6o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uqKMv7nspM/XbNEyE7sjEDWkgXPz06aMoQmPWEuFHnRZMg4wzvm0bxO3DKTWueSiR
	 3xJn9XBdcowEfNzcRjcWqzwhsnw3EQubjZJiC9h5aat+1y6D6FXrdgLdDUjMBn8hKm
	 /h88hDSl3wJWcAuPdzVWK1ncM/GAU4a4GFYawNoKwCkczzZy/QOnIvt1Bz/5NAI3HK
	 882pOv4Q+R/6JNdehY4S3R5UWbS7pWFNtJ4o0gj6b5z0cFJ01RMqSu4xtGCTychnrR
	 Dv6om3SE/D6c4cI3RVg16su9LXlkpA1vQu6R0wqLQczQdQ33/FMJi2sJ23I3gpCRZv
	 i22TQkvyQiJ9g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jisheng Zhang <jszhang@kernel.org>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20250629094803.776-1-jszhang@kernel.org>
References: <20250629094803.776-1-jszhang@kernel.org>
Subject: Re: [PATCH] regulator: rt5739: Enable REGCACHE_MAPLE
Message-Id: <175129596061.1422008.1055186917296991718.b4-ty@kernel.org>
Date: Mon, 30 Jun 2025 16:06:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Sun, 29 Jun 2025 17:48:03 +0800, Jisheng Zhang wrote:
> Enable regmap cache to reduce i2c transactions and corresponding
> interrupts if regulator is accessed frequently.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: rt5739: Enable REGCACHE_MAPLE
      commit: bd7c7976f9716da4cc961ab8ff4e17811d522602

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

