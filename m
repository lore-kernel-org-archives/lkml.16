Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A140D389433
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 23:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486759; cv=none; b=IP3gs75WG0x7g5C0qauXIgSydy9K1muC2ZNd3Uu3JhMX/TpDTj/F2AzkHvoj9QHag/BgIAGURfrY1CZfc3QmzDUzSW90rz2shSFi2tCbR9wCOPneo+AONMOvIdd0ZPOmmAa6xFvRHupjMNE/akbQzjr0isjzHl7iHs/h6j4uymg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486759; c=relaxed/simple;
	bh=lz2pThmn6jDvLYZjSPfyW+a4aysWXG3+csCcjZG7tNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SuNPsvEv+Gj9GuKd8HA0JEVZlZMocNdenXnzCtL2GAi8tEp7128AkELG39ynagmhuxQaVC8nm3zZCm8PAm/YFyvwjcRMLst01tgep4PVVmZwDJTlcuEdhq50QGnYKkyfPmqjBujCWBVdReiTva9OYpT2zOIaF1mzw5hLN5LzEFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=b9uGeWfK; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="b9uGeWfK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1746486756;
 bh=l4rp0/SxPnRxOKd8Baxv0WdngnSWxD3d0vtqD/ab/C8=;
 b=b9uGeWfKjnsZ9AMtNmp37ot38v55DrMSsyrRybIymDGhTBdWhRYC84kEs/ekrVVuwvHLr6m3G
 5anUcRKLdVDMd9Ueuo7a9w54TkpskOwjU75c6nkh+qs63fB9KOYv3u4xX4cGOtpHYVlIWNA6ppe
 v9BcA0wRRBcGC4yMgUDT/eY+i4IZ41IfRKjIZxthM9XCK0A+GphHIVE4f2YAwd9S42uYLocQcM3
 q9YjkTCZvqt9BO2GRC3gmH8E4VdLFtuLD0bxgDDc/yVGKshln9c1xm+VwxVL0YHyPQ5XRulu1/0
 uEvWsMx5ocn7fpRZEKMf/adX1unJXLseYx09XcpvifTQ==
X-Forward-Email-ID: 681945da46c37f8647c22e2a
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <4e00a764-23df-4bd9-85d3-f32cb153a9b6@kwiboo.se>
Date: Tue, 6 May 2025 01:12:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: rockchip: Add pwm nodes for RK3528
To: Chukun Pan <amadeus@jmu.edu.cn>, Heiko Stuebner <heiko@sntech.de>
Cc: Yao Zi <ziyao@disroot.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250401120020.976343-1-amadeus@jmu.edu.cn>
 <20250401120020.976343-2-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250401120020.976343-2-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-04-01 14:00, Chukun Pan wrote:
> Add pwm nodes for RK3528. The PWM core on RK3528 is the same as
> RK3328, but the driver does not support interrupts yet.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

pwm0-pwm2 has been verified working on my rk3528 boards and remaining
seem to be correct, I have also dropped my prior attempt of looking into
multi-channel handling as mentioned in v2, so this is:

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>

Regards,
Jonas

> ---
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 80 ++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index 35704d0be37a..47d4f63f11d3 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -465,6 +465,86 @@ uart7: serial@ffa28000 {
>  			status = "disabled";
>  		};
>  
> +		pwm0: pwm@ffa90000 {
> +			compatible = "rockchip,rk3528-pwm",
> +				     "rockchip,rk3328-pwm";
> +			reg = <0x0 0xffa90000 0x0 0x10>;
> +			clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
> +			clock-names = "pwm", "pclk";
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm1: pwm@ffa90010 {
> +			compatible = "rockchip,rk3528-pwm",
> +				     "rockchip,rk3328-pwm";
> +			reg = <0x0 0xffa90010 0x0 0x10>;
> +			clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
> +			clock-names = "pwm", "pclk";
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm2: pwm@ffa90020 {
> +			compatible = "rockchip,rk3528-pwm",
> +				     "rockchip,rk3328-pwm";
> +			reg = <0x0 0xffa90020 0x0 0x10>;
> +			clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
> +			clock-names = "pwm", "pclk";
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm3: pwm@ffa90030 {
> +			compatible = "rockchip,rk3528-pwm",
> +				     "rockchip,rk3328-pwm";
> +			reg = <0x0 0xffa90030 0x0 0x10>;
> +			clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
> +			clock-names = "pwm", "pclk";
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm4: pwm@ffa98000 {
> +			compatible = "rockchip,rk3528-pwm",
> +				     "rockchip,rk3328-pwm";
> +			reg = <0x0 0xffa98000 0x0 0x10>;
> +			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
> +			clock-names = "pwm", "pclk";
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm5: pwm@ffa98010 {
> +			compatible = "rockchip,rk3528-pwm",
> +				     "rockchip,rk3328-pwm";
> +			reg = <0x0 0xffa98010 0x0 0x10>;
> +			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
> +			clock-names = "pwm", "pclk";
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm6: pwm@ffa98020 {
> +			compatible = "rockchip,rk3528-pwm",
> +				     "rockchip,rk3328-pwm";
> +			reg = <0x0 0xffa98020 0x0 0x10>;
> +			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
> +			clock-names = "pwm", "pclk";
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
> +		pwm7: pwm@ffa98030 {
> +			compatible = "rockchip,rk3528-pwm",
> +				     "rockchip,rk3328-pwm";
> +			reg = <0x0 0xffa98030 0x0 0x10>;
> +			clocks = <&cru CLK_PWM1>, <&cru PCLK_PWM1>;
> +			clock-names = "pwm", "pclk";
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
>  		saradc: adc@ffae0000 {
>  			compatible = "rockchip,rk3528-saradc";
>  			reg = <0x0 0xffae0000 0x0 0x10000>;

