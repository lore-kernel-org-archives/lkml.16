Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6C6267B04
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 20:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745958487; cv=none; b=O5V2t6uo299Bw6uUvnL4pkwn2Xyd82tHjdpCGuRPn1mPtfG3Wc9dOOeKvYUnz0yCNlteEaaVtWMXApwUXYTKvDkHv0yyz2992vtT3uSFPCT4Qmy877DGQX7ewFKMFQCtPQqn336Ke2YqPr+ZHxaXgWvKhBqA+fVc23DdTqxr3JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745958487; c=relaxed/simple;
	bh=q5qnGWin/gWeyke8MwKqAHQ6UyRcIimhz3Mx7LaAL8k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T/KkcRtwEYxXbO01kt/tfgiPK3PxGyUnc7BWdwNk/ASJCVktCGT2CLnoQnxLV1y/yx+gQnfinlcyWTLwAM54QgiDVyxOvWc7bmsBXyZZNJckRU3k5q5m7sOqCAsIIYBKNCZTjyiQb26NXwYsZD8nQc9lA1GRhKXL/I4VQTmqjxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfRQnp0d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfRQnp0d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA7FC4CEEA;
	Tue, 29 Apr 2025 20:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745958487;
	bh=q5qnGWin/gWeyke8MwKqAHQ6UyRcIimhz3Mx7LaAL8k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cfRQnp0d/aFuC6pYINtv3BmNH59De0BoqRJP1lna4Yf88BVRO/UDm/Ndf8CqO84IR
	 9n9f7Fc0JuzJ8brIHC6jI4dFE1d9dxurYesJNRjn/Vp2PSdhpmWE30YipQQJymPKV0
	 AyQxBV+vWUq+ATWL8faysa06Lr8PhO6A30XNndaygrMZdjxJPTwxxRcK5H5bG7+REn
	 Oq/R0yW7IIU+8+MToQHTShEPdTQHtwdORqV6u4uP+txoj/Apo7dREagtHISob2LKRi
	 DUpf4tSI3zrKUmf2s6PfiAxs4SvHCQaRd0DbqA736sQwbvhgSCvJiopWQ1Ykk2FHPZ
	 Gqe5ophSDqGvg==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	Dev Jain <dev.jain@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	gshan@redhat.com,
	rppt@kernel.org,
	steven.price@arm.com,
	suzuki.poulose@arm.com,
	tianyaxiong@kylinos.cn,
	ardb@kernel.org,
	david@redhat.com,
	ryan.roberts@arm.com,
	urezki@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: pageattr: Explicitly bail out when changing permissions for vmalloc_huge mappings
Date: Tue, 29 Apr 2025 21:27:45 +0100
Message-Id: <174594039520.474971.2876521667626295214.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250403052844.61818-1-dev.jain@arm.com>
References: <20250403052844.61818-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 03 Apr 2025 10:58:44 +0530, Dev Jain wrote:
> arm64 uses apply_to_page_range to change permissions for kernel vmalloc mappings,
> which does not support changing permissions for block mappings. This function
> will change permissions until it encounters a block mapping, and will bail
> out with a warning. Since there are no reports of this triggering, it
> implies that there are currently no cases of code doing a vmalloc_huge()
> followed by partial permission change. But this is a footgun waiting to
> go off, so let's detect it early and avoid the possibility of permissions
> in an intermediate state. So,  explicitly disallow changing permissions
> for VM_ALLOW_HUGE_VMAP mappings.
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/1] arm64: pageattr: Explicitly bail out when changing permissions for vmalloc_huge mappings
      https://git.kernel.org/arm64/c/fcf8dda8cc48

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
