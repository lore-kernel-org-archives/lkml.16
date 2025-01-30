Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017011E7C27
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 14:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738246217; cv=none; b=Kx9oMgjLJYi8wy1V+zZ+hiDzNoRkD4fIm0dr1VkhVPgu27w8+w0GgoDFDdO/WHNqCfYkAkQBRtH7EaHB76ZTZ/DnByoToR8rMbG8x/y5JRbnK4gC2+FNjPZWLrGSGIZ3Jdh/7X2H9pxJLPrHG/AqXgcmLmLNnJoc+i3K2Jfeds4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738246217; c=relaxed/simple;
	bh=gAB9uXM+mzKAnOJm4WDzv7NrurFgJ8yv0HwEZuN0vEM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=uOrmnmwZAAxrlavUOTVPQFLzdpiSEUYA+IAuCCFfFKF7ANMLv21j7ROOkZx1oInqFbGSa9lFnSU9qR9MAwqMsu9U+mQyARk76FViybGZWHolZMsqKa56HKWn59UyZM2yOueFtCAFdA0ycVRaZglfDkf8025dydPYAXtzoLEprok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFgL0D+p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JFgL0D+p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0206C4CEE0;
	Thu, 30 Jan 2025 14:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738246215;
	bh=gAB9uXM+mzKAnOJm4WDzv7NrurFgJ8yv0HwEZuN0vEM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JFgL0D+pIOR7mYWIT8c7JyfpDpVVX1jPS+Qf9Auu7deL2K3kYHffWESrxmQbSy02D
	 g393bUZumPvkXgq80/hlG1GyHr2m9QvntEu9tBH+QWT0PY9rk4Xvf0Q5clRPSMiqTi
	 KnYZjfshz+D+R08PH2Byn7SwbwFLSZJUx94oH6HImEEsQHGDt7bQzo0+RQGYJfm9A/
	 J/leE7FOJ8zvv7jbAqvhz3oOcw6XTASz1+jauF42kXDbS3fjcWFzZM/CVWfw//BpDI
	 icl7h56nvGPEcoTwBU8E6Rpk4dFHITVlKJ+3nRuS6LCI0d1eGDAxefAxWHGoYPLRsj
	 zJR2lIF1RehNw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70F86380AA66;
	Thu, 30 Jan 2025 14:10:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: add a warning when physical memory address overflows
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <173824624099.971083.29484788191658517.git-patchwork-notify@kernel.org>
Date: Thu, 30 Jan 2025 14:10:40 +0000
References: <20240814062625.19794-1-cuiyunhui@bytedance.com>
In-Reply-To: <20240814062625.19794-1-cuiyunhui@bytedance.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: linux-riscv@lists.infradead.org, punit.agrawal@bytedance.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alexghiti@rivosinc.com, chenjiahao16@huawei.com, guoren@kernel.org,
 vishal.moola@gmail.com, stuart.menefy@codasip.com,
 linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 14 Aug 2024 14:26:25 +0800 you wrote:
> The part of physical memory that exceeds the size of the linear mapping
> will be discarded. When the system starts up normally, a warning message
> will be printed to prevent confusion caused by the mismatch between the
> system memory and the actual physical memory.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> 
> [...]

Here is the summary with links:
  - riscv: add a warning when physical memory address overflows
    https://git.kernel.org/riscv/c/101971298be2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


