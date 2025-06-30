Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E114225F97C
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751283639; cv=none; b=BrCXyR9FlvQYfeReD2DW0ZK0F9HKImdBvif3cgshbE21V5ipEodIGbtGarJD3d0thu6CjNk6DUdm2KDVKT+kSHHd+3DS1OplNDsfU5l+xhIMXDvBHAsGYFt82XZuZ/EfUjYQB93lwQf68puZWCZo0qQufT16JBAELP1xxEqDKGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751283639; c=relaxed/simple;
	bh=iyPuAvQ/y2ZNs4o4Zoo38yAnK1dyXxtC3j1//PV32B0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=If24J1gP1eeX7ECEfA4y8UMIZjBJ2sMBOXzehLxyq6TjvTloobs641G9ciiduFfEHFSbcNHM1gfG7spHiOB4spTE/PfigsGUcWqjNAkRx5CBkw+rsPeGxv3sMrv12rM7QlIECKF1zky/WXt4ncjbgtaJzDZr+jla0wWrqWah6LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F895nwOL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F895nwOL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C532CC4CEE3;
	Mon, 30 Jun 2025 11:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751283638;
	bh=iyPuAvQ/y2ZNs4o4Zoo38yAnK1dyXxtC3j1//PV32B0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=F895nwOL3ItWE5LPPn9aYiiokKltJkXQHSWxOMHwA05cFzNMwa+Tp2z9H9RvzR0z9
	 xBfcm9V4Th9imB0yUymOr6sY3DK5imE7lquPuMESZ5EOLVjQCiZnPiWpGp0d4JUfdo
	 Mh7W+pvjvVN/a8DMBM9R2577piXwtNSEnV2Zrzo7+wlRXycncGMw9nO70S2WpZxnv6
	 BOV+jBuWV82gmQvxlPmzFOY8+5ngAs+qbfN/bcr33tDClibKFuiZc0Cv9p/V9UXJP4
	 LutPIPlhdaeIvW5bTUXSpo2+MIxP3K9ZjITEbh87pzBHQHxSYUWqeQmWE61E2+1glk
	 mkP9lMYMX780g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, 
 Alessandro Carminati <alessandro.carminati@gmail.com>
In-Reply-To: <20250626083809.314842-1-acarmina@redhat.com>
References: <20250626083809.314842-1-acarmina@redhat.com>
Subject: Re: [PATCH] regulator: core: fix NULL dereference on unbind due to
 stale coupling data
Message-Id: <175128363753.28827.11384672156857795643.b4-ty@kernel.org>
Date: Mon, 30 Jun 2025 12:40:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Thu, 26 Jun 2025 08:38:09 +0000, Alessandro Carminati wrote:
> Failing to reset coupling_desc.n_coupled after freeing coupled_rdevs can
> lead to NULL pointer dereference when regulators are accessed post-unbind.
> 
> This can happen during runtime PM or other regulator operations that rely
> on coupling metadata.
> 
> For example, on ridesx4, unbinding the 'reg-dummy' platform device triggers
> a panic in regulator_lock_recursive() due to stale coupling state.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: core: fix NULL dereference on unbind due to stale coupling data
      commit: ca46946a482238b0cdea459fb82fc837fb36260e

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

