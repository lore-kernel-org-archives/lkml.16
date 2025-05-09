Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F7326C380
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 06:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746772761; cv=none; b=vAGuo9cg+7ATTBw1q8+pDEwgYUrn+qj7sbUjhCqA1bvN7wwp+Jd5pLTKDK5MODylWycrBltrpwhF/+r5nJ3gj/reZZiNxV+/EJ6gRsbKNpatetXpt5GrHAXDLcb2+HbPL0ChFQg3FfpbnMx7wVzDt3vJGKnP4YcV8RpsE3nkneQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746772761; c=relaxed/simple;
	bh=+3Cx4Rb8aolns0GsK5RoTi+ZhoenOsry2wQ5+MveQS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZiOCCifz7+LpGWWMnwez0LCfKPI8/zJHlapQSTB52xJYUvsm9rLQVbaDm9h6ok0QUMFa4Pd6pccSTM7k0mjz3kLvJfLXv2a7a4+UaWljgDQ9o+BzCg0AhkUDTtz7/dybM79l4i7c5mPtLX1lhHA3+oojTW402wj1/6EyndHW0h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=HRPH0sdR; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="HRPH0sdR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1746772757;
 bh=RGGUWsD6mE/MPYlXlrelAUBFwk7Si62HhFTya0QjVbo=;
 b=HRPH0sdRWcqEoqOzbCIdHeWVcCrGprThINHV1cWThucwfABNZOhteQKZCrMMmOOr8g903NHhM
 D/pFpcfdVG69AhyRpXRcusHYuILPQTEGNUjxeAyz5XFCVCCoHB4kXrspp5gHVzhA7yBs0udeNxW
 kwPDyICSqF3nude6txsIobps5GXnY0+F4y1HtrL1Lc3vJGNSCfS//TDqrLIM83Neo0WkqC8G9fI
 iq9EnKzCRlRg/MxBTsnAKOag/5nZVHq0UTjWJZ0ibBLJTpUNi+Kyjmh2xV25gd5MtkeEiGdq0D2
 r+tD8dihqaLOPrbpHkFwBBdkPnve422PuYbQjF04weuw==
X-Forward-Email-ID: 681da3124a62bf69f80b0c57
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <77c35f99-eb71-4d64-a2e1-e9cf9f6ffa4f@kwiboo.se>
Date: Fri, 9 May 2025 08:39:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: rockchip: Enable SD-card interface on
 Radxa E20C
To: Yao Zi <ziyao@disroot.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250508234829.27111-2-ziyao@disroot.org>
 <20250508234829.27111-4-ziyao@disroot.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250508234829.27111-4-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-05-09 01:48, Yao Zi wrote:
> SD-card is available on Radxa E20C board.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>

This has not changed since v4, so this is still [1]:

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>

[1] https://lore.kernel.org/r/f19f11f7-c020-44a3-84fa-eb9ca48ed11f@kwiboo.se/

Regards,
Jonas

> ---
>  .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)

[snip]

