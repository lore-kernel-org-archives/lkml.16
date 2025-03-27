Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41231D6DB1;
	Thu, 27 Mar 2025 03:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743045853; cv=none; b=Z6KIkkI0kPPgMyNfWdGlPtjjlwBO+kiajaj4QkHTjcFKhjDvS2pxF2HgD0HrcIJmUU9ULMjX4ClZKLZL1P38fYARTYvpqavey5EaA8Gxe4n7Zeo8L6CgNW0Q84F904QWoVuPJP8HLNRH/CKgZVf5Dy7X0MAXFSqlpSZuJ2f/oLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743045853; c=relaxed/simple;
	bh=3gfnIph9uCsIesz2/eZBjY5uUxhC49Y5OAMyxkMwM84=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=oZ+9ll5P8Z+s0VWZf0VXzZgK0Xr6q7aISEDGlx0HWh3pC9XxwcWs3L8NvxzNnUYhhdy6blRG4MpceO37f2Rfa7TIUaSTE6KmZjDQvYx21ctQIELJVppAbNcAb+YMBdYnu+K7Uj0rUUOw4CeW3inl5tUizGCBRDg2IKHnqbiMmuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdE/nR9C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdE/nR9C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C1EC4CEDD;
	Thu, 27 Mar 2025 03:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743045853;
	bh=3gfnIph9uCsIesz2/eZBjY5uUxhC49Y5OAMyxkMwM84=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OdE/nR9CI3klUBzJkvcwzubPo2JqLkWklfyMGrcOkG9z/eP4JW4TCyCOA9/FBkAj4
	 zsdaPtS8fhB2iEUTpM/+dOGlBLCzJwSkCROx/KKDFWYEHIpkwnnwOZwBeABO6Dnths
	 fNL0C/zo4frO8Qfnll4nfuqTjG+P5grE1gNxqkuVbwHkDLxoJNM/uQAB3Df6qdSvbo
	 ZfccBKE/g9tU2H6PvVfWJVUfhbmzYL24YMHR5jzhhdZQw8Mi27QsxqRKlkEkskFZpX
	 89zv6YOYf+TOvtgfPV+/in0Eed5cpTXR7/QtStwK/gi+dHAwcN9vj/N8OJTKmKcT/K
	 Stvx3wIylkpYQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE6EE380AAFD;
	Thu, 27 Mar 2025 03:24:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: migrate to the generic rule for built-in DTB
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174304588926.1549280.13236108388930132139.git-patchwork-notify@kernel.org>
Date: Thu, 27 Mar 2025 03:24:49 +0000
References: <20241222000836.2578171-1-masahiroy@kernel.org>
In-Reply-To: <20241222000836.2578171-1-masahiroy@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 conor.dooley@microchip.com, conor+dt@kernel.org, krzk+dt@kernel.org,
 robh@kernel.org, devicetree@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Alexandre Ghiti <alexghiti@rivosinc.com>:

On Sun, 22 Dec 2024 09:08:25 +0900 you wrote:
> Commit 654102df2ac2 ("kbuild: add generic support for built-in boot
> DTBs") introduced generic support for built-in DTBs.
> 
> Select GENERIC_BUILTIN_DTB when built-in DTB support is enabled.
> 
> To keep consistency across architectures, this commit also renames
> CONFIG_BUILTIN_DTB_SOURCE to CONFIG_BUILTIN_DTB_NAME.
> 
> [...]

Here is the summary with links:
  - riscv: migrate to the generic rule for built-in DTB
    https://git.kernel.org/riscv/c/82e81b89501a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


