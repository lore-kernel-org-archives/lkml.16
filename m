Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F652F8C4D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 17:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751651080; cv=none; b=nD/5ID55zBykzVHuq+NoTwJXttN/Dq/FZmCZALF4PASa59wUA9rovuoTaQjOO7qHWEudNQ/GjtHlHz5OzRjJtk9VQ+EFhfy9looLcpmo+aRMYC4M9j0kGLUgFHH1dgJcf5TrztqC4svDTGSW4Oh4RrYy8DnuRCXGcS3+/vaYNS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751651080; c=relaxed/simple;
	bh=0Of2DAv59lR6dZHDz2GpwsJOOrpi64d81pjQPe/a6Qw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WQICVucw7ib6PZ9mLgvSGd1NfwQjw3cD7Jh/SFu9McEedTNvivV4sNk1YmzbtN6d7XHIB/5dQpJzZ/hHsFkgB8i2p7iDO8IbQmbtgCPDYaxTLN694rQjkHIfb8H3LbNF/Hkk1fCCaEX5DZKnkRhmGNne3OuuB5OqzMxM7bKz2h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dciBDgju; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dciBDgju"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023E5C4CEEF;
	Fri,  4 Jul 2025 17:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751651080;
	bh=0Of2DAv59lR6dZHDz2GpwsJOOrpi64d81pjQPe/a6Qw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dciBDgjupR1Gqcs3h9dxuBq0PJMSbW6ATGfmhtk+IyTcKojt1lZUzOP1OI8t1nZxD
	 J+Rxp+Cb5Wq8cMH4/R8KnlGCfkM034c1cgD5ERhOB4y/GBz1Yqnspumz4ppTfLeM1s
	 B1+kATCtwVP+0R4fzUyGazPDwQRLCz9eh2GrmP7DkQhyxvXQvpmbvFfN/NGrPo2NWE
	 En4b79nWgCdMw8qChSteMreR17AuE86IrWtDuIVsqQ/EPgUpm9wlwznAqId4q5QLHt
	 MvodnK8v/COgCARmcBKfIJzahIn6zOTV3Q3YTQHmB5YjzmyBfT7nVAp2jl7INlQnUw
	 Np8znltyXdA2Q==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>
Subject: Re: [PATCH 0/2] Improve POE handling for uaccess
Date: Fri,  4 Jul 2025 18:44:14 +0100
Message-Id: <175164363953.1189181.15632215061604413984.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619160042.2499290-1-kevin.brodsky@arm.com>
References: <20250619160042.2499290-1-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 19 Jun 2025 17:00:40 +0100, Kevin Brodsky wrote:
> This short series attempts to approach POE (Overlay) faults consistently
> w.r.t. uaccess. We currently assume that spurious Overlay faults are
> handled by retrying the access [1], but this isn't the case.
> 
> Patch 1 ensures that spurious Overlay faults are indeed ignored. This
> being done, it typically isn't worth using an ISB when writing to
> POR_EL0. Patch 2 removes the remaining ISB in the signal handling code.
> 
> [...]

Applied first patch to arm64 (for-next/fixes), thanks!

[1/2] arm64: poe: Handle spurious Overlay faults
      https://git.kernel.org/arm64/c/22f3a4f60859

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
