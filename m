Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8150E1DE2D7;
	Mon,  9 Jun 2025 16:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749485824; cv=none; b=p3Y6W8h9xxZtpCaoR99JVv6J7FbixOF4VoWz0jG9rLx3UMZYnlmXwZMOvtK5DsZKydfFglvBPUXNxazXPnBKnHGJISMXR1S4uv2JtxKSP/xOKaKyX5jGbwp7iH6lml9FBgvwO4TKQaLBULzlos47waSYUI+8X9wSOWH5w0B92ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749485824; c=relaxed/simple;
	bh=dXwjfSoGEdwX4UjzL1tnbGhb6idWIO1BMgB70KIqTP8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gDNyOrYKQ/ApLtCo6zdkzKzq4YRRnVH7hMI1X+3NlQCLBYAOIt5R02X61LXaafmq7SImp0qxpfsWzmnNj/ruEdtLN0M1P6WE+St3whD1tpLwhZEKM7Jj/WzoW/CfFR54KNQrQ+8vMKQin91vmoCkNzvfwy/1xcfx1zl1cSmyfSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+qP+bIM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+qP+bIM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A60C1C4CEEB;
	Mon,  9 Jun 2025 16:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749485824;
	bh=dXwjfSoGEdwX4UjzL1tnbGhb6idWIO1BMgB70KIqTP8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=T+qP+bIMLxcb/FDR1I7JEL6scUyj0/qm7d8Fd5TUZVefPTFRipfZ8ZYDWOrJjCT9v
	 E4ysL8GeFrIACjHCbcGzLUcIvFxDc2U/O/y4WXDZQVEdDet7YcTlRpQWWQUZK2ueUc
	 uOY99UvOq6HnjS4hLUv+IBTXUd/8pmWWs4psyP0D+WlpvHtjV+f0LOQn7TLWuxRx8q
	 MelKjSxBkIwJ8OMaa7BfNLCchoOJbfHVhSFqhCiXEfBx7s20lBLRQxVX67nGJhUhuI
	 yNyybvYqaFgRZHz7qfSXbu17QQ9DFj0AMn6IB8Cm6jIX2Fy2y6KAhcA+3JzMrychjV
	 DCP3uWgJtPKsA==
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 sanyog.r.kale@intel.com, Basavaraj.Hiregoudar@amd.com, 
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250530054447.1645807-1-Vijendar.Mukunda@amd.com>
References: <20250530054447.1645807-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 0/3] soundwire: amd: fixes and improvements
Message-Id: <174948582129.818066.6657082052541545420.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 21:47:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 30 May 2025 11:13:38 +0530, Vijendar Mukunda wrote:
> This patch series consists of fixes and improvements for
> AMD Soundwire stack.
> 
> Vijendar Mukunda (3):
>   soundwire: amd: fix for handling slave alerts after link is down
>   soundwire: amd: serialize amd manager resume sequence during
>     pm_prepare
>   soundwire: amd: cancel pending slave status handling workqueue during
>     remove sequence
> 
> [...]

Applied, thanks!

[1/3] soundwire: amd: fix for handling slave alerts after link is down
      commit: 86a4371b76976158be875dc654ceee35c574b27b
[2/3] soundwire: amd: serialize amd manager resume sequence during pm_prepare
      (no commit info)
[3/3] soundwire: amd: cancel pending slave status handling workqueue during remove sequence
      (no commit info)

Best regards,
-- 
~Vinod


