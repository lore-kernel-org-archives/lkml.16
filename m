Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF3C204684
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743516598; cv=none; b=hXFydkhIBwW/JZo2gKiHYU6LCbsqBxdUrn0MWWWiHl6fjg3Vmm2jbxiUYYrte/1IYhDb7XptF1NS3kJ+8wS9dI2/pYhAuGzALxI2uu93NkIvEvNgSf8JIe9F9h17LjAtFZGUW4SeBMEaTJGliYs8cIvbPft2jGDdLYv7G3kwee4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743516598; c=relaxed/simple;
	bh=t4ERt79E1MKZVCOHESPXrWSpOLzU2ctlJAkZUDmfa28=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=lxRWMP6MW+EfS5Kc0BVVoEWhahHgfuuCUqgT/qGp3MRgVye91UOjpqWJGA6jrLL+M+maSbb6xnvBElNhioFoeVXGFKDSa6UDy0OpCR5v52ulF4JSgidjh2PAcpd6qm5GAHfh+l7kWV880VJkqFzPXkFPnTz2TwcA1MWlNcLu06s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hqDS994r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hqDS994r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E85C4CEE4;
	Tue,  1 Apr 2025 14:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743516598;
	bh=t4ERt79E1MKZVCOHESPXrWSpOLzU2ctlJAkZUDmfa28=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hqDS994r9kCSuabYQox5+Z2L/OVBL82B1F+BkcOOzXa0tGwnEyZWyYOyBks0mSbs1
	 DBBlxOyRfW3OnRQ8qwxcH8jn5qTvIGYOsOApcEf0V8pY0wV9yWDq0piT+i9AYtP71I
	 PZJIPWiHaqCdrI2p7keBnxpxEk4Lete3whbtS5L43CalXmwJImHF8oj8+pqg4iKH2G
	 NIZ4cIq4PLbZT62viCxmg2kKJWTO2PAZRhMt3ERiTFM15sT9oXcTEVZv+16ORcyCTy
	 FFP/yrGVgaLY94ZfQtuFAwwZuekBK/ar6jg6nxmuLN3ioniYXeNh8tF8d977jQyvD8
	 O/IuWwqW9sIFQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34926380AA7A;
	Tue,  1 Apr 2025 14:10:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH FOR-NEXT] riscv: Add norvc after .option arch in runtime
 const
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <174351663474.777137.11029884560691390580.git-patchwork-notify@kernel.org>
Date: Tue, 01 Apr 2025 14:10:34 +0000
References: <20250331-fix_runtime_const_norvc-v1-1-89bc62687ab8@rivosinc.com>
In-Reply-To: <20250331-fix_runtime_const_norvc-v1-1-89bc62687ab8@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 klarasmodin@gmail.com, linux-kernel@vger.kernel.org

Hello:

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Mon, 31 Mar 2025 11:45:24 -0700 you wrote:
> .option arch clobbers .option norvc. Prevent gas from emitting
> compressed instructions in the runtime const alternative blocks by
> setting .option norvc after .option arch. This issue starts appearing on
> gcc 15, which adds zca to the march.
> 
> Reported by: Klara Modin <klarasmodin@gmail.com>
> 
> [...]

Here is the summary with links:
  - [FOR-NEXT] riscv: Add norvc after .option arch in runtime const
    https://git.kernel.org/riscv/c/95c18b7ccdd1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


