Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D30199E8D;
	Wed, 11 Jun 2025 19:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749669162; cv=none; b=C/+IfHS1KttjCexia2GJopxWkAHssGaRoqpSAxZYYSlAeRz5o8ipdI38ZNEHwlaDFEoDh25jfw77vzTT40H7UpCSpHlxBCTYuayS/uPm7fY974H38P7MH6GZXSNW+1sHXPDDYjafPCBbWU2cQMTgIkE3SV520y9vZGPNwidij+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749669162; c=relaxed/simple;
	bh=MnB19TOfh+7ykleBocTv6CizHYIdFED5uoDIM0y6n9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lJTBExV6f2PGdIh4PwpWCPvLDAjzpWrvQZYVCIRjEe3E+1vrmk/8V6GgHmlHPpEoyptMF5McIbeA/2x+V2LmzUt/l0mhxqP36dQlEkl5NWpl5tkNFdJ1Et5fdWyFBc86GsD0nZVPB4YVuCzm2A75/aGNYrQIcE6TrX+441gyZi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqIX/i3f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqIX/i3f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775F2C4CEEA;
	Wed, 11 Jun 2025 19:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749669161;
	bh=MnB19TOfh+7ykleBocTv6CizHYIdFED5uoDIM0y6n9k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XqIX/i3fZR55ETgbwAWPhI0j5uEDBeW4vjrvwLkM2E1Tge9X2zRXHpj0sAFMSHd3J
	 Kkaz0/TEmOasYiFG6a4lG6VJsLZh4glznnYUrsgP7/in94ur0D9faWikDPXyDPOtZK
	 6eLG0cWS1X9i1+v2+HAqVhQ0ihjAqK1UhfCwqqk1WlEAYkrUQ9eDx8f8cdO+KXqGis
	 vghYhn3FjVleOrD4smgdM/CfM/Rjyx8WEMuFquUBQ+S+C+A6UlXlNB6u/lurJ7LUMF
	 xPWVRUpsHPIvTm42xXMaue+X3TKer3G2M+8nbet7moPc/V3VqZ5mSJzSmrmenLVt+9
	 LteSgWdVkHlqQ==
Message-ID: <47bcce06-9c08-40ee-a22a-bc168952b74a@kernel.org>
Date: Wed, 11 Jun 2025 21:12:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: Add Apple SoC GPU
To: fnkl.kernel@gmail.com
Cc: asahi@lists.linux.dev,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neal Gompa <neal@gompa.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Janne Grunau <j@jannau.net>, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
 <20250611-sgx-dt-v1-2-7a11f3885c60@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250611-sgx-dt-v1-2-7a11f3885c60@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11.06.25 19:32, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add device tree entries for GPUs in M-series SoCs
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>   arch/arm64/boot/dts/apple/t6000.dtsi        |  4 ++++
>   arch/arm64/boot/dts/apple/t6001.dtsi        |  4 ++++
>   arch/arm64/boot/dts/apple/t6002.dtsi        |  4 ++++
>   arch/arm64/boot/dts/apple/t600x-common.dtsi | 34 ++++++++++++++++++++++++++++++++++
>   arch/arm64/boot/dts/apple/t600x-die0.dtsi   | 28 ++++++++++++++++++++++++++++
>   arch/arm64/boot/dts/apple/t8103.dtsi        | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   arch/arm64/boot/dts/apple/t8112.dtsi        | 62 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   7 files changed, 198 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t6000.dtsi b/arch/arm64/boot/dts/apple/t6000.dtsi
> index 89c3b211b116e96ee0a5ea0c923c3ab824008307..3b60842045d4c3277e9530a13ef2811774209697 100644
> --- a/arch/arm64/boot/dts/apple/t6000.dtsi
> +++ b/arch/arm64/boot/dts/apple/t6000.dtsi
> @@ -16,3 +16,7 @@ / {
>   };
>   

[....]

>   	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		gpu_globals: globals {
> +			reg = <0x0 0 0 0>;
> +		};
> +
> +		gpu_hw_cal_a: hw-cal-a {
> +			reg = <0x0 0 0 0>;
> +		};
> +
> +		gpu_hw_cal_b: hw-cal-b {
> +			reg = <0x0 0 0 0>;
> +		};
> +
> +		uat_handoff: uat-handoff {
> +			reg = <0x0 0 0 0>;
> +		};
> +
> +		uat_pagetables: uat-pagetables {
> +			reg = <0x0 0 0 0>;
> +		};
> +
> +		uat_ttbs: uat-ttbs {
> +			reg = <0x0 0 0 0>;
> +		};

With W=1 this results in a bunch of new warnings like

arch/arm64/boot/dts/apple/t600x-common.dtsi:391.24-394.5: Warning
(unit_address_vs_reg): /reserved-memory/globals: node has a reg or
ranges property, but no unit name

but I'm not sure it's possible to fix that without making up fake
addresses that then get overwritten here. Would be nice to fix this some
other way but I'm not sure how and so far we don't enforce "no
additional W=1 warnings", so:


Reviewed-by: Sven Peter <sven@kernel.org>



Best,


Sven



