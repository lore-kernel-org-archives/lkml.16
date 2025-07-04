Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574F21386B4;
	Fri,  4 Jul 2025 18:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751652616; cv=none; b=OvanXbH9rR9p4191Fc+pHapyqiMN5LuRfOGm2vELONKdbm5+VeAES/6u4fzUsf4kjOHOkcE/Pzn5ngVUnKnSw6UI50tYzFRgNTE+uOFs5TU+Hic8GqWW2sAIAn2vRzBZUXoeFsVgJhsTlXnLvg/T7J6NnOkRa8WyDzLcANJYSow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751652616; c=relaxed/simple;
	bh=4mr5LslJozab8lqAEB2zOMbvAHGe4H6kYg5TxrNMFCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NDszW3JOvfBHsvTlS6ZRBJKgMfK9DErJ0a328uX6JUhf2HXakzCgG6SpBX7j0pXJI3ta91PLRiBUarATRLTEXNG2BC1KkCsZjT51eSilwW4EG6HI2GinS9aBGKfy6rnXTTGnY21pyQenepiQnehDxHdQ08LeXIlGnPecQYmVwvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=iadyuOg2; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="iadyuOg2"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 4D8E61FA59;
	Fri,  4 Jul 2025 20:10:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1751652603;
	bh=IaM0NNbZRvViiEdTJlyIueFfujxZh/7+S5Oou/xEwsA=; h=From:To:Subject;
	b=iadyuOg2VBXUiKIe7yS0dzy5UqhoUm1OC3BN8PYKA3+VAYoPghMOqiU+UPqKL7lS8
	 j/4wGPd0TM3xNo65vS18VUamul5aXqseIFimp5M4j5tWCyzAlEcmni64tQL7refLxG
	 l5T5tdmFp+HT65umPjMjDKRQDGy63czJQ3K5k/9UwgDLJklcE4+XOA82bcbL4xXjyY
	 X+OV+h/TUWg91SuaUQeg9oiuQclk5R232SIMlTkSblUAL1cqWsjiB66CECnhDteVu7
	 6i56ss+AIzCdKs86ibYtmyRrPqKCkK18mDFCXoXprmcDfdf0RFviFoCZL/AhHb+usB
	 3JG7wVDgmoD/Q==
Date: Fri, 4 Jul 2025 20:09:58 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Parth Pancholi <parth105105@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Parth Pancholi <parth.pancholi@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: ti: k3-am62p-verdin: fix PWM_3_DSI GPIO
 direction
Message-ID: <20250704180958.GA6379@francesco-nb>
References: <20250703084534.1649594-1-parth105105@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703084534.1649594-1-parth105105@gmail.com>

On Thu, Jul 03, 2025 at 10:45:34AM +0200, Parth Pancholi wrote:
> From: Parth Pancholi <parth.pancholi@toradex.com>
> 
> PWM_3_DSI is used as the HDMI Hot-Plug Detect (HPD) GPIO for the Verdin
> DSI-to-HDMI adapter. After the commit 33bab9d84e52 ("arm64: dts: ti:
> k3-am62p: fix pinctrl settings"), the pin was incorrectly set as output
> without RXACTIVE, breaking HPD detection and display functionality.
> The issue was previously hidden and worked by chance before the mentioned
> pinctrl fix.
> 
> Fix the pinmux configuration to correctly set PWM_3_DSI GPIO as an input.
> 
> Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
> Signed-off-by: Parth Pancholi <parth.pancholi@toradex.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

