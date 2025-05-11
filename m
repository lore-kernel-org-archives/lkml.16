Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F8C1519A1
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 11:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746961533; cv=none; b=mWWwpvTUC57TEQASLV6rEfzq1fXch7kjM2znuie/e2tH2i4I425ESJK7hi/N52smMS4i4UefUnoUhgt8Ae3fvv+4d8Q/9iXiqyH/LhIQiTcR7snMgSCPXhoT99JYHguxjQ00rh7H7E8WdoNG3hpNHtUy7xmEhh46WwlgiocW7kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746961533; c=relaxed/simple;
	bh=xq+n9vwg1N73d5ZcbwD1g8da9s05uBFuLTMRhrTWpNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QovYe2EzeRFUd1GChAOc8mTcJkS5x0s8gqqZiKbBNaDoYQSlw6d4dISegZm1AJ19GGxWGvUV7HZicB/+kz5rgJogw1kxJpkjSD0UTbeWime6duIXMHjMFvzpfnxA/qv9evUrUqV0EpVPopSbkBcgmtoZpdf4OhGAw1+koGXXWJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=j8lCMGvk; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="j8lCMGvk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1746961520;
 bh=ek6GBAYJeDRPIZjH28p/Q9SJdCsotpdSU7d2WoGn9tU=;
 b=j8lCMGvkLDo4UDDy3pN4fW0I5M5t+jHwJZXK2GSfa+vwNMXRnqag2u49fUKq4go0u2LNkcALa
 Zt4GvRa//f7aNI5CLulXQtkzzCVlnvnjMgPLt7L0I0XsIhgVR2AWM4otIBthIjXX3hRjQ5A3mgV
 d6YsTbmyL56kwbiLf1HwYQF1LuVFBuCNN9wcWxSi/ynHEMqAtgznampb6w3pCMQ3eZsFWMvVPhE
 hGcnkmIik+E7HmMZbbmGPrnwJPNJw8E1G9zejygsZH/6y1jtAas7e8TAPOVZE45lAYndP2IFW5P
 HpUPGangGs1VeDwnERvYN1VsEmeHE3AJksFYF4xweRBQ==
X-Forward-Email-ID: 682084688a98caeef2469b46
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <4a4c0295-d8f1-4d8a-92e4-34a69b42c728@kwiboo.se>
Date: Sun, 11 May 2025 13:05:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: move rk3528 i2c+uart aliases to
 board files
To: Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250510220106.2108414-1-heiko@sntech.de>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250510220106.2108414-1-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Heiko,

On 2025-05-11 00:01, Heiko Stuebner wrote:
> Even though they will be the same for all boards, i2c and uart aliases
> are supposed to live in the individual board files, to not create
> aliases for disabled nodes.

This sounds like something tooling should be able to handle, e.g. U-Boot
use fdtgrep to filter out nodes (and aliases) for the FDT used by early
boot phases.

Maybe DTC just need a feature to remove aliases to disabled nodes?

Also how should overlays handle aliases? Are all overlays suppose to add
aliases for the add-on devices they may enable?

And how should we handle boards with e.g. a 40-pin header where pins
could be muxed to multiple functions. Is it the overlays responsibility
to remove and replace aliases? E.g. if pins can mux between i2c1 and
uart3, and i2c1 was enabled by default.

Regards,
Jonas

> 
> So move the newly added aliases for rk3528 over to the Radxa E20C board,
> which is the only rk3528 board right now.
> 
> Fixes: d3a05f490d04 ("arm64: dts: rockchip: Add I2C controllers for RK3528")
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  .../boot/dts/rockchip/rk3528-radxa-e20c.dts      |  2 ++
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi         | 16 ----------------
>  2 files changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> index 506d54337ece..9f6ccd9dd1f7 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> @@ -18,8 +18,10 @@ / {
>  
>  	aliases {
>  		ethernet0 = &gmac1;
> +		i2c1 = &i2c1;
>  		mmc0 = &sdhci;
>  		mmc1 = &sdmmc;
> +		serial0 = &uart0;
>  	};
>  
>  	chosen {
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index cd8ef389ccf3..b2724c969a76 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -24,22 +24,6 @@ aliases {
>  		gpio2 = &gpio2;
>  		gpio3 = &gpio3;
>  		gpio4 = &gpio4;
> -		i2c0 = &i2c0;
> -		i2c1 = &i2c1;
> -		i2c2 = &i2c2;
> -		i2c3 = &i2c3;
> -		i2c4 = &i2c4;
> -		i2c5 = &i2c5;
> -		i2c6 = &i2c6;
> -		i2c7 = &i2c7;
> -		serial0 = &uart0;
> -		serial1 = &uart1;
> -		serial2 = &uart2;
> -		serial3 = &uart3;
> -		serial4 = &uart4;
> -		serial5 = &uart5;
> -		serial6 = &uart6;
> -		serial7 = &uart7;
>  	};
>  
>  	cpus {

