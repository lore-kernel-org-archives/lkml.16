Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FC5266EF8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 20:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745958495; cv=none; b=eTl4ODzNWhRKyQR+KLZ3DdOZZRJhSY2l4l1cRU4osAFT95+9I6LE00hPej+tABChGlMCIr8k4kkV/BE7oz+uBXJPRG+UHd/ilZRJBpk7IihGMrSNP8gKErAeS/GTdhP/xs6l3jB64vjsqMuWGl+TGbcMr4f8jx2Bz/oOe29v698=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745958495; c=relaxed/simple;
	bh=9FRjNM4uCLNjjY3QIHD4J298olP3+FXybe72CiKG8cA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UjsOcJKa9fxBNzJLwTXpX9j/POFQKlh3fF0ZtLo12PUeioWqh2ZNJUSonjaicTo2RfmWo5mrHXTRtIzH7z8UaS0kZw9vZEUvAsr7wT0jzp8/8C+CMuhHT6cQnHPyONZKUH1HXMI2W7rW906tY2Dd60h+20odF1cNeFku6zzHyGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=umBlrp14; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="umBlrp14"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73ACDC4CEEB;
	Tue, 29 Apr 2025 20:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745958495;
	bh=9FRjNM4uCLNjjY3QIHD4J298olP3+FXybe72CiKG8cA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=umBlrp14BgM85CcnRGvHfx5YjGLKhW0YiuigLlEVhBlL2UdMCpUN4xwfupHw2mHGn
	 jBCCiGT31dPcHduZyWSxYfJSCEE5jznhY8tMGv7R2vLPvAZIlh+hOx99I8sGfOvmpa
	 jK/NSSl7A9/WlblsB0JEUKtj9r5WRTV7a4/MDWdNxjwKG3QKtiJOya4RtYTJJA+Ync
	 0Tc0FdZZDDILbBBwlepw5aBVqILFtc3eYvt/eh1akBg75C446+IJIyt5cieTETX52Z
	 oj0tpus+I+0PB84InZPIbnd8OAccYCDox7p71DSs/SHTEWgOv3AlvZsSg1zqa783HX
	 RJVJxc462Uisg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	maz@kernel.org,
	Breno Leitao <leitao@debian.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] arm64: vdso: Use __arch_counter_get_cntvct()
Date: Tue, 29 Apr 2025 21:27:49 +0100
Message-Id: <174593151898.435692.885709123307410375.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250407-arm-vdso-v1-1-7012de25b195@debian.org>
References: <20250407-arm-vdso-v1-1-7012de25b195@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 07 Apr 2025 04:33:25 -0700, Breno Leitao wrote:
> While reading how `cntvct_el0` was read in the kernel, I found that
> __arch_get_hw_counter() is doing something very similar to what
> __arch_counter_get_cntvct() is already doing.
> 
> Use the existing __arch_counter_get_cntvct() function instead of
> duplicating similar inline assembly code in __arch_get_hw_counter().
> 
> [...]

Applied to arm64 (for-next/vdso), thanks!

[1/1] arm64: vdso: Use __arch_counter_get_cntvct()
      https://git.kernel.org/arm64/c/00b39d150986

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
