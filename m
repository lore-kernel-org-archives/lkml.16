Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A358026AAA5
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 06:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746772756; cv=none; b=YQyPTD5ydRn7RpFL2ZDAhPEmKkudK1nuSOLNKTLDE6ZD56rVarO4ysagX8szseAnh4ZZ6b7+O6JBkN5DmbWEI23d0EH8X1uEMvDvm8MRt+MTZw8669rF583P/YPVI3l6tfn4tpeI53mMyc3XPJRKDyJJVgEMm02sX7uum9+kXj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746772756; c=relaxed/simple;
	bh=toPsAjTHhDkqLjmaul6Wfecw6WhjzpH35h5akmjTlog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u0jrfo3TGynxM7+x0YfZeFXGl20s9HtBH1Wx6wB461pO0Kyshfpwxjcr5/UqEoib51lb9CAosq7iNg7mLQwltK7TpgKaSpIHR6hBBL4JlFPFfG2TnBEV4DY/B5Mkj//nUsgEI2Qi1pGi5tal5TpV0+V3fL96oFLCFYzKBVwYcE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=Y2WLLVxx; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="Y2WLLVxx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1746772748;
 bh=y6AR61P+JIqfzvn1/iMFMvHRsQy3bZwJcBc+BL7GPOw=;
 b=Y2WLLVxxCKGVtP6k/d1eiNj2nFBjUf7kcadW59YkSwTXFx7znXAMk44GQXsdIyo51fakUuClb
 VnLwRUUb9AFmA2qHH/qeDLSV+cLWp6FZnv7FhNX30BXu6MdZ1itqcuwycK2Q+vTM79jFNjpJw9U
 jfUQgBa8UvRUSDTalLRkQcAzbfF9H0KMOU4HSlppAUhIJP9zuKs3RrgM3EtkgAwcM8qDU4CyGNS
 lbRnNiqeReLhd1Zak8LVGGyVyEvdIaj2TvTx8QHKuUw6Q6MAHagX/TCoseo2oOq0z2PJtXMt3Hl
 3F6bYGZxCB7yXORLJ7xkIbatrKGf+WimQtwo4icGlYIw==
X-Forward-Email-ID: 681da3084a62bf69f80b0c1b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <1ddc77da-2355-4c41-b215-533fb23fd0be@kwiboo.se>
Date: Fri, 9 May 2025 08:38:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] arm64: dts: rockchip: Add SDMMC/SDIO controllers
 for RK3528
To: Yao Zi <ziyao@disroot.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250508234829.27111-2-ziyao@disroot.org>
 <20250508234829.27111-3-ziyao@disroot.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250508234829.27111-3-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-05-09 01:48, Yao Zi wrote:
> RK3528 features two SDIO controllers and one SD/MMC controller, describe
> them in devicetree. Since their sample and drive clocks are located in
> the VO and VPU GRFs, corresponding syscons are added to make these
> clocks available.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>

This has not changed since v4, so this is still [1]:

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>

[1] https://lore.kernel.org/r/f0ef6679-7ddf-4deb-98a3-755ac2b61a57@kwiboo.se/

Regards,
Jonas

> ---
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 69 ++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)

[snip]

