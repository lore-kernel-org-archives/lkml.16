Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB23263F30
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 20:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745958484; cv=none; b=HDgd6USQ2Bc4JZuYIALPyFoplLlWQ14lq1VlcQzTQjAAevB2haD5oUZVPnlLU+fOZs2R1/+lO1GxxkWzROlaWbwQiFgDErNmTqBwJH3wZBW9OSu6SknJLkmfxHbv8GiZA8ccMp6N93iJgyxnEv18FqO+AzBBwaXbELmL5m/hC3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745958484; c=relaxed/simple;
	bh=MQH9dAaTaIg0ur9/5v4Mb+xBkI4AfjNQQm26Qr4pKTU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TxnBPLpSVmcJLi23n2M9xIwsQi1B9P/HoveNX4q+ybBGsRWYy2CIXzN7uL4pHorlLRewrts4NNkdxJgoJ8HfCHOMTXGsI6WrblLHTYFKwHHUiK4MkTx6xVhK2KM4VNprmmabQ1T+vMomT5zF4/FWfO9gSyzP8/asXT0XIhPEZv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcewA3nQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcewA3nQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70EE6C4CEE3;
	Tue, 29 Apr 2025 20:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745958483;
	bh=MQH9dAaTaIg0ur9/5v4Mb+xBkI4AfjNQQm26Qr4pKTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DcewA3nQGO44qEhUyevWkkgOdZVEYyYhO1BiKNX5pw1i3V5LHIhomBcwitEj22tOv
	 MjjzT2mvHqVNcrXKbOZIZBFil/KBxEDxiS7+oGh9mfect+tA4VeJ6IWqhGVg1f7rcQ
	 KP3c953dfFRxJF7uLa9LIiKyYv0TNhTe4bY0lMHS/3fRc31EOquDOQuJHOznIa0Syd
	 qSEjOAAfpuOEbICz91QTUYXsD1mcSKfIx9xzLc/How3KxqyJL6yWC7jZx7lGZTdzVr
	 wFpfC+9DkBkuCcQFWrTsmdxdqELQmzG08qcr9K6hk9ztSEW5m+iLgh813OygCFut+H
	 8ARjgUeWnyZ0w==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Bartosz Szczepanek <bsz@amazon.de>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	nh-open-source@amazon.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Extend pr_crit message on invalid FDT
Date: Tue, 29 Apr 2025 21:27:44 +0100
Message-Id: <174594023826.474412.9245389283026480521.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250423084851.26449-1-bsz@amazon.de>
References: <20250423084851.26449-1-bsz@amazon.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 23 Apr 2025 08:48:51 +0000, Bartosz Szczepanek wrote:
> Log size in addition to physical and virtual addresses. It has potential
> to be helpful when DTB exceeds the 2 MB limit.
> 
> Initialize size to 0 to print out sane value if fixmap_remap_fdt fails
> without setting the size.
> 
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: Extend pr_crit message on invalid FDT
      https://git.kernel.org/arm64/c/83a39eccdf2f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
