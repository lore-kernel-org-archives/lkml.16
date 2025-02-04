Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E23214804
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 13:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738674554; cv=none; b=sJcS9ynVNeXc6lsfZFPSy4AwvO9XsUM4axnaig3Wqg3OENWQ/GE/Rxw8PgBCKDn081LLQJUOm9ivXc+fpMJlK7dtbkJdg5wAULf/yUgp4l4xsmy/GYYxht81jhm3jT3lso/cxnOL/99KAWKxZSZS88rAhypQP0IWf+Yu6PBdpM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738674554; c=relaxed/simple;
	bh=81yxeQHIqctxrmIw0097ymR1VtG8MmRAEDohct0rFB8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=giJRiav7RQOh26azCsWUo3KbY1zgf723HpCgzBO4pZzfnCp3Ti6IAk7Aefh++ubvFhQSg93Szf5RCBQ+4Yeib40MA2dGxiQTwvVYnwmGmLqxnUAXHGhmUIYQezZpNHYeChJ5IknL5yDCG4+cMESaXD+SHgPypI3W4zRoo0Xo4EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rc0Irqc8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rc0Irqc8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2777DC4CEE4;
	Tue,  4 Feb 2025 13:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738674553;
	bh=81yxeQHIqctxrmIw0097ymR1VtG8MmRAEDohct0rFB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rc0Irqc87feCcYBNiLn1AoCdwoCaFkVPOEzl6pdv9ju8cYFcny1ZdWJ+gPd0qXTCj
	 M40vuICWOYD9mpH6b/IX059uQYb9wHwhgV6w5GHztiX9HFS8k3+2ps/zOM3fB7J1wa
	 vfviLXU6J0fTSH/m8e6Klmkj3wPxX2x6+JuaUVxevmJgxcOKG0sd+6Vl/7Wi+yC1J4
	 jCQScnSeeGBr+SSkTG1u+Jiq92Qfy745TH62QXDuAyi9B+hJ82oZ99mHDohc1mfCyQ
	 hj+DkAuwfkx/E5rpsfdxGnEaay4YE0Aqp33lJ7jVxtlX1ZvOSu3145gLiWTkGzy74r
	 GAhzn7tp17obw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/hwcap: Remove stray references to SF8MMx
Date: Tue,  4 Feb 2025 13:09:03 +0000
Message-Id: <173867209875.3989677.12528563395797509995.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250203-arm64-remove-sf8mmx-v1-1-6f1da3dbff82@kernel.org>
References: <20250203-arm64-remove-sf8mmx-v1-1-6f1da3dbff82@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 03 Feb 2025 20:11:04 +0000, Mark Brown wrote:
> Due to SME currently being disabled when removing the SF8MMx support it
> wasn't noticed that there were some stray references in the hwcap table,
> delete them.
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/hwcap: Remove stray references to SF8MMx
      https://git.kernel.org/arm64/c/21fed7c223e2

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
