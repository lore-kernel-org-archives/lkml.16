Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAD52D8378
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 17:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751651069; cv=none; b=ueSdG1jqE5WTMzfJZ911a/JtSV2I12bm8+mwjpA/LmELMtvRISAad4/tau44djVjSlaYCUZW37/m0dtYQdo8PGU3KZEEp1un3jdCLcvNkQl0dOfTWK0/keFRBc+RPswvncEfQ3Z1RxZQ93F4Uwd3O+XkG2+pUjU1Xv/gEwtsIZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751651069; c=relaxed/simple;
	bh=4R+gLFsYL145ym9QlO7Qjg2ysOm0WxwoItLOPYmZBzQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uLrxcWBiKxJlIhkA2usGVYGmMwEyv9QXjDzVUez+xjLamhkJ8f2UEZ4xw2V7XtPflDLWL6/ZYCGBA3C2Bgss2o7e7okS7J9FXK0SnxiVdgEW2cElUOXI88+3AtSTuZnf6r6t9Mk4qBJXGt0tShQAwnU9VZ/pCnmu9AZ8yC2xsTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1ioyuv5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1ioyuv5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E320EC4CEEE;
	Fri,  4 Jul 2025 17:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751651069;
	bh=4R+gLFsYL145ym9QlO7Qjg2ysOm0WxwoItLOPYmZBzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U1ioyuv5OmuhabyJXKnquPYq4l93Owr1Kv7a5gSocD3mSP7JfF42sCu/aJuPGTmjy
	 mTgO1kG6XsDkWLBLhilORY9Fn2+fWE3mNL0nyU+j3C4Sxz7SGX1fkx2ItQda9FUBPV
	 lQ6m1u2Oy2dH7/OHfvRV45UWBido/EFHDnosO+iP0ZNDkbbk2TljlEYUoRTqZQP2w0
	 GPWby8D/ObpQcQITDRunWZAOp7LIk3+OPNh6ypGgKpbTO5o4P/vEAq8QE3YD7Iwb7X
	 IoyTphO04szaYhtGrmcuTfJ6oleabStxSoCTiZljifk/NNNgbU0a1Ebl2nx652+/gN
	 AeqaiTJBGuTPg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	James Morse <james.morse@arm.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: move smp_send_stop() cpu mask off stack
Date: Fri,  4 Jul 2025 18:44:09 +0100
Message-Id: <175164313641.1187522.9351949563130846501.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250620111045.3364827-1-arnd@kernel.org>
References: <20250620111045.3364827-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 20 Jun 2025 13:10:41 +0200, Arnd Bergmann wrote:
> For really large values of CONFIG_NR_CPUS, a CPU mask value should
> not be put on the stack:
> 
> arch/arm64/kernel/smp.c:1188:1: error: the frame size of 8544 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
> 
> This could be achieved using alloc_cpumask_var(), which makes it
> depend on CONFIG_CPUMASK_OFFSTACK, but as this function is already
> serialized and can only run on one CPU, making the variable 'static'
> is easier.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: move smp_send_stop() cpu mask off stack
      https://git.kernel.org/arm64/c/6c66bb655ca3

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
