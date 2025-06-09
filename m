Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B357921B19D;
	Mon,  9 Jun 2025 16:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749485841; cv=none; b=Z8LamcGgjF1N+L+bvnfbcz234csMqdF9wl+ugoUDdV+HdbOJXZ/HELRjflVPGOLS3bOh7bhdYgjJtlurf0bKabyCtO2x1SjfFVazQrxkep2fQweLTTV5fuwqLNkMKm1j+/KjRJSi87FnxSX+KF1wOrdpcej0OAd32DoWp58uAGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749485841; c=relaxed/simple;
	bh=n9Ait3IABmnTtRgTkIGp+AGKmxwXSE/eVvWWzvDAXVs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OmIxCd5hPVGmjUM2EdMRa51py0nN2CwT8hnrp766wPWKGVTZIaj9JDPk8otn8Yk6AcWSNz7SBJAQFxeqVQNoll57XnFXDiey63swvjHklxHx4Lkr7+P2YNaqUIJp6OU2R2wUf7Kfmo1qR9xpsNQXZCjlmsiJLTnj0ad1ar+FNqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6eWtTO/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6eWtTO/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E07C4CEEB;
	Mon,  9 Jun 2025 16:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749485841;
	bh=n9Ait3IABmnTtRgTkIGp+AGKmxwXSE/eVvWWzvDAXVs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A6eWtTO/ZYN5guMKGuB7Lum0KCQdFqj4/t2gyiYXZUc+5m1JtbZwG1zgAfmH+ylXr
	 JSV2pFjnpHcdy3EyUL7SBSMbb1KJw76ITiKVuJXEQBelrfCy8/vEamX0whx7jR7GNG
	 i6BpEf6dAtZ2imYfTDKXR3YyLZkn+BjdkkqDATucq7FnNCgZ6z2fZNrgsNUbrpQ7JW
	 SL5H4ci6vt5W4UmcV60DQN57i+CkfmDB8xkEPGZ0kIGTtL4WSwnaoBYwnZlgwuBfGJ
	 JR2+nxl+ZiX/asp1AK7dMWilySF3gE0vSzFd1CqqRv6/j6SlC0yAE1omc/u22b9uoF
	 JCMvFDMmrdf2A==
From: Vinod Koul <vkoul@kernel.org>
To: linux-sound@vger.kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, 
 pierre-louis.bossart@linux.dev, bard.liao@intel.com
In-Reply-To: <20250429122337.142551-1-yung-chuan.liao@linux.intel.com>
References: <20250429122337.142551-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: update Intel BPT message length limitation
Message-Id: <174948583955.818152.17551473337996284774.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 21:47:19 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 29 Apr 2025 20:23:37 +0800, Bard Liao wrote:
> The limitation of "must be multiples of 32 bytes" does not fit the
> requirement of current Intel platforms. Update it to meet the
> requirement.
> 
> 

Applied, thanks!

[1/1] soundwire: update Intel BPT message length limitation
      commit: 393350c1691f1cbf3a0436f2a12c2b4347c4e953

Best regards,
-- 
~Vinod


