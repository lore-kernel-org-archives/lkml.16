Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE3F182B4;
	Mon,  3 Feb 2025 22:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738620374; cv=none; b=UUTGVKLT6s+OPxl6X01QwSLzWFErzhCxlxAOB4Vm9rMcocq5fHzNa51Rl3YM5TJJrbfmqYgiuUtn9wIYnWDJQQDZKRwqnZu+FTEtIryGXhaWV39U0OHdFy3xIU2vr6Rue+dBjdZkk+xSWF9xLKCCOIeJmj0LppICT35e5PAMpYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738620374; c=relaxed/simple;
	bh=yzyPuuX2I9mlAd8wRAXfCiQT5z1CNGqnwskd/rkgtMo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mkhtAe+RQAyGpjE1D6S/pA5EBzZ66YygzwwmtsXOJkvpC341c2Dk06g3eqlOMkKnQ4mSSynhYGQprws/Q7FXogvwlUfU84oaiCUD9UZoojq+jDjscf/1+ovrub9aKUrW8PLO5Q5Fp8B+NB5D4ywWya0pW4ITUOsrCuYbPBt0sQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DPdXEuIw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DPdXEuIw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF91C4CED2;
	Mon,  3 Feb 2025 22:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738620372;
	bh=yzyPuuX2I9mlAd8wRAXfCiQT5z1CNGqnwskd/rkgtMo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DPdXEuIw9QSyalNNyNjvv0XnpXXT0IqYas4P/nhGlrVRWsP4nTb8KYoNaYGYSxUsl
	 TeL7MI6sihNDnf2Az3fWZOkz28xm/43DHoKN/1xukR5ZkJ1QYiOGo9UodinK8o9Q4m
	 mHgWYffCmXMrWCzQyxGA4qBgvsA6XA+r+Zsny+GIfc8HqrgIVjTJn5eifr0L66cOmJ
	 dIG0GjgKiFTV7dwqSU+U93IwBfmT9VmtAfw9b6rfQCGPEw2WyzxXxKS5h4Shq5EKFp
	 1BMIih6q+UVPnT/QekmCcjKzgjVwixFXRmZ9WQurhZKSMuEWd4oJhUa8DVATYeVRBs
	 M0XTJmnfkqffg==
Date: Mon, 3 Feb 2025 14:06:10 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v8 0/3] Add support for Nuvoton MA35D1 GMAC
Message-ID: <20250203140610.4a0bbad4@kernel.org>
In-Reply-To: <20250203054200.21977-1-a0987203069@gmail.com>
References: <20250203054200.21977-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  3 Feb 2025 13:41:57 +0800 Joey Lu wrote:
> This patch series is submitted to add GMAC support for Nuvoton MA35D1
> SoC platform. This work involves implementing a GMAC driver glue layer
> based on Synopsys DWMAC driver framework to leverage MA35D1's dual GMAC
> interface capabilities.

The tree is open when we say that it's open, you posted this 9 hours
before the announcement:

https://lore.kernel.org/all/20250203065423.03f4cec4@kernel.org/

Sorry but keeping this in the queue would be unfair to people who
follow the rules.
-- 
pw-bot: defer
