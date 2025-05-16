Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815C85661;
	Fri, 16 May 2025 15:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747410524; cv=none; b=SCTV6vIiiDPXYODW+EWvqRcO6JmTNRpq2TJCHvckI/5PR3UJ8B4ERDt1O8Yev73XCfRR3zGziuLqb8UbGUbNbR2M7c/avrAP1zlzf+uEB399B6h6iko+HWfZb5FtMkseySQcPbAaage3CKj1RbxD3knLNhm1yDSATkW+I/56qvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747410524; c=relaxed/simple;
	bh=YwkrdAsWoKSTg4VyvIMwADPTVOl64Ko9498w1w+F5+o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QhY8Yjg7UGtQTcX2wxQzCT10+jjdZH8E8NIt/A7vWMopgKrx94+e7CJ335Sz6ANQJyj6HQZjHTY8BpS+Vq6EPkAV3c9HjhuJ7LL8NR3lvQaI7Smf6hfdMMKwL1oJQ+QNPcbXCcKjWO/BIUe8gpq7oOtzYQzh3WqCHfhTDgK6W+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KY1DIJmd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KY1DIJmd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 513B8C4CEE4;
	Fri, 16 May 2025 15:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747410524;
	bh=YwkrdAsWoKSTg4VyvIMwADPTVOl64Ko9498w1w+F5+o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KY1DIJmdEOjykVGmXpktVEaoBzevy5wMtkqjEZljk71vzm2nLkxE+xKQCVABROLH3
	 J2yWPNtA5bC96cIUKUflcR25hDaxENp8fqasS975RreMjoyKl7fTbF4g2RIn5uXoQF
	 u21mcgYMDYn8WsTnp3KPbPxtZn9ik0hO7nmrS799zCrAwv7ZjLEUCOjQR+fJKyND4Q
	 6obyKZdRJPLXfVgUWFu1RCrGNuHzLwAZrgd87/gqvsd+44OiDcuJqvIPutFW1cBXdY
	 8/+d9sgXWCav4LUg8sbB6JUD8vwBV+OAoee1dzzFEjehxNl3MPObiLZYk740MIsuQj
	 3OiGxhe/DTc/g==
Date: Fri, 16 May 2025 08:48:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jinjian Song <jinjian.song@fibocom.com>
Cc: andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com,
 chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 corbet@lwn.net, danielwinkler@google.com, davem@davemloft.net,
 edumazet@google.com, haijun.liu@mediatek.com, helgaas@kernel.org,
 horms@kernel.org, johannes@sipsolutions.net,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 loic.poulain@linaro.org, m.chetan.kumar@linux.intel.com,
 matthias.bgg@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 ricardo.martinez@linux.intel.com, ryazanov.s.a@gmail.com
Subject: Re: [net v1] net: wwan: t7xx: Fix napi rx poll issue
Message-ID: <20250516084842.26c80cb5@kernel.org>
In-Reply-To: <20250515175251.58b5123f@kernel.org>
References: <20250515031743.246178-1-jinjian.song@fibocom.com>
	<20250515175251.58b5123f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 16 May 2025 15:30:38 +0800 Jinjian Song wrote:
> It seems that a judgment is made every time ccmni_inst[x] is used in the driver,
> and the synchronization on the 2 way might have been done when NAPI triggers
> polling by napi_schedule and when WWAN trigger dellink. 

Synchronization is about ensuring that the condition validating
by the if() remains true for as long as necessary.
You need to wrap the read with READ_ONCE() and write with WRITE_ONCE().
The rest if fine because netdev unregister sync against NAPIs in flight.
