Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FF81DED79
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045861; cv=none; b=d13JlQJcCce2kYTFt/yCWn0ySuWP4rDJk78pXphiNy4pQNXUpkC2tBVshZ8xYWD32Ys/yDcnALqcSRdul7yArzg0D9c2czI26oSvVD+ESRNaLsp3Jeu7/MDGH4Cb28ZjQ0EZdNoL9ybDqXogPu1Kd+IQmdajWW2VfV5tskEDFyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045861; c=relaxed/simple;
	bh=wMWHmN2MQVgRzmQkPt5r8hlPOn/v0VaesvBoHxIFvfA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ClSV9r+XEg4LgtSbD1ixUqmXlGK4gMN5no4WA4qWFEM5DLjb2U6GjXYD6OL/6zVqTtDA2aaGqpffIIhkTpE020Jc18ACP4p69rKvHUbmPJUS9mZmjxZG3NI8nMxBiUsSWQizA8YysVTv8J/mHHSjW36J/+nxnL2nBpeTmF0hfSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nO5iE8KJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nO5iE8KJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618A7C4CEE4;
	Thu, 27 Mar 2025 03:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045860;
	bh=wMWHmN2MQVgRzmQkPt5r8hlPOn/v0VaesvBoHxIFvfA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nO5iE8KJ8Xml1kH8rM014XqZ5K9IdLk2Rfd/yqDfPZETcF43acEfPJjFJ20b5RkA5
	 nN18o+cHk/TDTU9msGMKFrcW9Fra/Bwn4T90UVpOlMvZYeBUn0AceaALjwG42KE6bs
	 xskWQa+UkA4MLPOb0CzsQq/VtXX7iz7J9sadb9rBaKDbiklnHIdPIki7BEUV8NsZwc
	 jioUmmZuHP00YpCeYSF32fshXnTueliaAO+RctFpWg9W664jtWG3fhonleWHFGteZR
	 retZbSjnneffz7dQFOHgVtd/ndHsbuwjV8/CnFurP4ZIeQowYesfhfH0H2MySQsqRJ
	 Pyse/AgWEJGjw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB694380AAFD;
	Thu, 27 Mar 2025 03:24:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: Simplify base extension checks and direct boolean
 return
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174304589675.1549280.4837326210822178054.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:56 +0000
References: <20250129203843.1136838-1-yikming2222@gmail.com>
In-Reply-To: <20250129203843.1136838-1-yikming2222@gmail.com>
To: Chin Yik Ming <yikming2222@gmail.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 charlie@rivosinc.com, ajones@ventanamicro.com, samuel.holland@sifive.com,
 cleger@rivosinc.com, andybnac@gmail.com, alexghiti@rivosinc.com,
 peterlin@andestech.com, linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Thu, 30 Jan 2025 04:38:43 +0800 you wrote:
> Reduce three lines checking to single line using a ternary conditional
> expression for getting the base extension word. In addition, the
> test_bit macro function already return a boolean which matches the
> return type of the caller, so directly return the result of the test_bit
> macro function.
> 
> Signed-off-by: Chin Yik Ming <yikming2222@gmail.com>
> 
> [...]

Here is the summary with links:
  - riscv: Simplify base extension checks and direct boolean return
    https://git.kernel.org/riscv/c/7f238b12660e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


