Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D47379C0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743444738; cv=none; b=XSD4QizNZnKI20QDDZIJ4lElhEstG3Cw9U5JUM5MxL4SQAqxatnsdeZJEYWl5JwqOEIJgc2/tB5s1NSA+MAGbYI8muD5Xz+x9zqZ4XVUqcmbC+/4oTZ4nNeernhAj/3dklkpblanoOMWMQNjK0zHUuaVdC7419ldKRa+b86UFEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743444738; c=relaxed/simple;
	bh=g+TYeeNiOVXdgynmQBjMf+YyjTrRivf8P0WQ+P9OzNc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DPQj6rDW0EMxgoV2wdtbJz5RII0Hg0E8h+NniBG8S+Za9+RzLF3YG831DfUQGBIy/jf0WQg64WXUH3BBOUQ5jlxA2qNlMZ0e05sCrKQ7X+K911pbb9/kuaPwyLgxd8bByFQVUwVUrl3Pm/C0NVYtIvkJA+vZQTXgGl1ZSZAHFIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYUDOyBf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYUDOyBf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98ABDC4CEE3;
	Mon, 31 Mar 2025 18:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743444737;
	bh=g+TYeeNiOVXdgynmQBjMf+YyjTrRivf8P0WQ+P9OzNc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eYUDOyBfw3jut2BuMi4+AWZ96I12D9P8Iwzpaaw6kj6FeWvAXcu8dDUBDB1DPbRxm
	 ekWXEQb96a4MFaZxSyOmUw5K+0pjMML567f74gPGvEMlBrF9myduxT+O6mpLBrGLDQ
	 6lYwwpAJfIBKXTCHuAlR5bfpOWy+QuqktznMAj6zkybL1pR1V1PC9wC6Mb+QcU0g0B
	 rCzKZKnCPixiIKJ3Sxb+k4jcyE7y8f3vBbCrvu2gVd5r3HqOyBZag4D0ztPTeGollE
	 axaFDlz2c6iwFb894+QdLvH8UePznJRchrUZKIfYkDG6Tc0Ev3DoXzVOwMOvP4aW04
	 fkAhpKMUvJOtw==
From: Mark Brown <broonie@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
 Witold Sadowski <wsadowski@marvell.com>, Ingo Molnar <mingo@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, kernel test robot <lkp@intel.com>
In-Reply-To: <h6bef6wof6zpjfp3jbhrkigqsnykdfy6j4qmmvb6gsabhianhj@k57a7hwpa3bj>
References: <008546505c6c5973a1c119a41b74e665a3e29b71.1743178029.git.jpoimboe@kernel.org>
 <gs2ooxfkblnee6cc5yfcxh7nu4wvoqnuv4lrllkhccxgcac2jg@7snmwd73jkhs>
 <4f589f15-7531-46cf-9ed9-0e4c6afdcda3@sirena.org.uk>
 <h6bef6wof6zpjfp3jbhrkigqsnykdfy6j4qmmvb6gsabhianhj@k57a7hwpa3bj>
Subject: Re: [PATCH v3] spi: cadence: Fix out-of-bounds array access in
 cdns_mrvl_xspi_setup_clock()
Message-Id: <174344473636.164633.1724471826311364083.b4-ty@kernel.org>
Date: Mon, 31 Mar 2025 19:12:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 31 Mar 2025 08:33:32 -0700, Josh Poimboeuf wrote:
> If requested_clk > 128, cdns_mrvl_xspi_setup_clock() iterates over the
> entire cdns_mrvl_xspi_clk_div_list array without breaking out early,
> causing 'i' to go beyond the array bounds.
> 
> Fix that by stopping the loop when it gets to the last entry, clamping
> the clock to the minimum 6.25 MHz.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: cadence: Fix out-of-bounds array access in cdns_mrvl_xspi_setup_clock()
      commit: 7ba0847fa1c22e7801cebfe5f7b75aee4fae317e

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

