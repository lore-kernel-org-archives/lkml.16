Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49611227E9F;
	Wed, 30 Apr 2025 22:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746053517; cv=none; b=UMW/oqqVQKQATKrv4UBrohfj7Upbw0EBw8mEK5Pw3pk1gcbeUXspLTf/FmJHCl7IDRDXSXkvunXP+dcLunTyvmr09AUprzcL+RF/ZcYMsEhSF2nnlzi/dN06j01BLKhk9a6yI8nEZvOSBItHQ7pM2ljSRiUz9Ga9VnXbfgD9AA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746053517; c=relaxed/simple;
	bh=NBtv0k8oRQ8U6l29xbUZsVIDfzTUsI+aeFFrJPTPpbs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=r5l11pwXR42nEDM37R3PCVkRV82/8WJjEh8WPProR+o57SUaJK7BTwznOWWiUUl9CwfMC3fOHirXsSoT24wR09eFVnGQgw5bxdIUQV6eZEF/hfsLlGpFzgF47rrA0qWUXyj3VXlcUFUai8FGYRgpDsLLgTucBNgAhykZLmcYFnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R7HM7O2d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R7HM7O2d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9E51C4CEED;
	Wed, 30 Apr 2025 22:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746053515;
	bh=NBtv0k8oRQ8U6l29xbUZsVIDfzTUsI+aeFFrJPTPpbs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=R7HM7O2dETH+Ryo2lI6C4M/fZxMGcf28lvTPbEt1vwNYKJ1pgPUH1V7XkkIbgHKHb
	 E7tFSMXZA6qjX6EwUD5nMJaCD7/OK2whkCGHqCpqpymIiavQC6ZTJirQwWhlVS4o/o
	 4+Gs4zvzPtQWS7+ELoZZsx8oWgv/lKFxJ4sJJ1ANP/HW2qP87P4jXtxjcCQsNWMxKJ
	 vWYO/oAclS/M6SDvw7QPIjAJxr45OQMuiq6zjs7BU7kqYVAtjBA93WcAd10uCheVyn
	 QpwLlbTlvkuoOeB8QZglK/XoUxIuwB4IdzKj+GgjJ2tj3pXmw/1uKxfO7b2BVHoWOh
	 8AVsOWgWr4pjw==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, kernel test robot <lkp@intel.com>
In-Reply-To: <20250428090803.97909-1-rf@opensource.cirrus.com>
References: <20250428090803.97909-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Don't use no_free_ptr() when passing to
 PTR_ERR()
Message-Id: <174605351366.3987837.5374259118304157069.b4-ty@kernel.org>
Date: Thu, 01 May 2025 07:51:53 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 28 Apr 2025 10:08:03 +0100, Richard Fitzgerald wrote:
> It's no longer necessary to no_free_ptr() an auto-freed pointer before
> passing it to PTR_ERR(). This was fixed by commit
> cd7eb8f83fcf ("mm/slab: make __free(kfree) accept error pointers").
> 
> Removing the no_free_ptr() avoids the spurious warning
> "inconsistent IS_ERR and PTR_ERR".
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: Don't use no_free_ptr() when passing to PTR_ERR()
      commit: 94602d84163c127ec2374fba0fcb6587a07785ce

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

