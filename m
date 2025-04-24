Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F405128F507
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745518302; cv=none; b=PH4JFydBhjk/l1+zRt7FFNbAgoQslgsR0uzakP4EH84A0viA0z7a0uWrXcxw2MyVz3ZlMZubtmif7cSUZLwQ+Mo42yFiyUBZJ3FXRjChCnMxlCByckQqtTGbg5bZWiMaUj4o5bltj70j1YV4TvdhuAE6SDmjYpoCHXhjqszkcWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745518302; c=relaxed/simple;
	bh=OagV3qFz+edYyLalw8lkg9qaDlFciu/aK0naMDFBfFA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RP+hdKojbt+DwNEV9EzRUd96eYbkNm2hXl4HYe5IWbxEOPtgM5bnMPXWn9iVkVDL9bQllGU5EC2juxYW09KG5Ni6fuaOadf+lWtr4KSH0HGDcuzAMb3DTjBq5uhWVTxiPTX5mJdR/AcZRnYHJoTvc3zfP70QsIyumwIdqFJvWBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZbuL2kdv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZbuL2kdv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3704C4CEEC;
	Thu, 24 Apr 2025 18:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745518300;
	bh=OagV3qFz+edYyLalw8lkg9qaDlFciu/aK0naMDFBfFA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZbuL2kdvclaISz9idR11URFESlGMRJO/1+OTrkAEzKoD4VoaUrGbjVXUVNRS03Fao
	 8gG7xZNShYD4KJkGISvi6Tydj/xnTmBhAnvs1Ruhrt+veVt5g5KAw68CbOQpoK1n2Q
	 xGVhQmZdqGb0Wg477DkcTi6cfdQ9ccCVJeweopcjxHDvjN82bxHKko9QafY0S8pmPt
	 EWiPAp9EVlVDCpa8902ZBIO3WzUXV9dhgE9mzq8brMofImbRHhg1HhGI7RGnxNxF9T
	 4gmTNTlpQ+F2zhWqLSiNHuaks1o+88jVZ3+9cz+2Hf00fd6JhcMunhZ7naGa16DmOm
	 rS5moDGsBSOIQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Bo Liu <liubo03@inspur.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20250424010855.2662-1-liubo03@inspur.com>
References: <20250424010855.2662-1-liubo03@inspur.com>
Subject: Re: [PATCH] regulator: pf9453: convert to use maple tree register
 cache
Message-Id: <174551829966.713072.14445683178104760895.b4-ty@kernel.org>
Date: Thu, 24 Apr 2025 19:11:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Wed, 23 Apr 2025 21:08:55 -0400, Bo Liu wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: pf9453: convert to use maple tree register cache
      commit: 5410aa3aa7f7dfcbdfcf94034595765d7e69ead3

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

