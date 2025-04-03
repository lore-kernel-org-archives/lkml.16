Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8153C0B;
	Thu,  3 Apr 2025 10:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743674837; cv=none; b=T6zMzr9oA9u0kA0j/I8BpPjVoZjGjlQkdh9qQxi5ScRmfVPDg7U+BiiTG9jhgqRhL6SwKyGS/6o2Pe59cjS0ZbdNZa4M1WARwLOJ8kjXOTlvLjl+9hHe4Him9dRozPv49fPklLCNB5Akxr4Lr8+hbxBp37fOyhfBfObMlykMg/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743674837; c=relaxed/simple;
	bh=OS5FKh45U5tp0iIFw7ligx8FGhQpdSr6OwlsPH/aWFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WbX+eMyi6rWv2+PEeU96y/MgDEeuoNwzC2ZTMf4u27xIr+un1+4TKOnVgl/rlBqiaz4rq4eKwfI4NU2xeB++3TevN81/s1qYtAYNhq3RRAw/kEPJAxsX/Ma+Uond57FAxTIXeLkBVveM/4csQmMbOQB9tmn+HMJNXSBhi9zzdPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=EZumTnmM; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="EZumTnmM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=aH+MeY5wxEAwtijunPYNL+y+DpNd6dDfxP3oQyKVdZI=; b=EZumTnmMfnXjC+fIRGTIzUUpdC
	xmA4sKsK5GMhS8YKEute0EoJCcEazqvF7+am554iZXBLJ5qRjirO9rlLnKFgZmDv1UQ8J9kiTi0lq
	RdJgNNi1Djy1QT7PmMZb0aT/DV6ghoVgilR/3/l4NvUdtlqjuni8ugwvCcVO+Q5SIkn1b6H1xlvYu
	Xi0ca1YIjr3S23xDcgfJwcOYOYxi3Cq4dOiPLluvMr8Xf9RWfhcV13FdtJ41RYYUk/wn/86gUm1Mf
	RpTxxLLBEOo0tyPHYV8hO1cG3KIhbVs/p3JjiDagwc3N7ViaKg5AS9xNMI/CmVsP8UuyjQV0dEEbF
	Q298q3TQ==;
Received: from i53875bf8.versanet.de ([83.135.91.248] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u0GoE-0003Ky-Fc; Thu, 03 Apr 2025 11:24:26 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: devicetree@vger.kernel.org, Daniele Briguglio <hello@superkali.me>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 alchark@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Daniele Briguglio <daniele.briguglio@icloud.com>,
 Daniele Briguglio <hello@superkali.me>
Subject:
 Re: [PATCH] rockchip: dts: rk3588: add missing OPP nodes for lower
 frequencies
Date: Thu, 03 Apr 2025 11:24:25 +0200
Message-ID: <2652016.Lt9SDvczpP@diego>
In-Reply-To: <20250403091840.3349637-1-hello@superkali.me>
References: <20250403091840.3349637-1-hello@superkali.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi,

Am Donnerstag, 3. April 2025, 11:18:40 MESZ schrieb Daniele Briguglio:
> From: Daniele Briguglio <daniele.briguglio@icloud.com>
> 
> This Patch adds missing Operating Performance Point (OPP) nodes for lower
> frequencies to the RK3588 device tree. These additions improve power
> management by enabling the CPU clusters to scale down to lower
> frequencies when under light loads, which should improve energy
> efficiency and reduce power consumption.
> 
> The changes add OPP nodes for 408MHz, 600MHz, 816MHz, and 1008MHz
> (for cluster1 and cluster2 only, as cluster0 already had 1008MHz)
> with appropriate voltage settings across all three CPU clusters in
> the RK3588 SoC.

the general consensus is that you don't save energy when you're not
reducing the voltage together with the frequency.

For example cluster0 @1GHz runs at 675mV already, so reducing just the
frequency, when you're not allowed to reduce the voltage with it won't
save energy, just make things slow.


Heiko

> Signed-off-by: Daniele Briguglio <hello@superkali.me>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi | 58 ++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
> index 0f1a77697351..1b018823d5d3 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
> @@ -5,6 +5,22 @@ cluster0_opp_table: opp-table-cluster0 {
>  		compatible = "operating-points-v2";
>  		opp-shared;
>  
> +		opp-408000000 {
> +			opp-hz = /bits/ 64 <408000000>;
> +			opp-microvolt = <675000 675000 950000>;
> +			clock-latency-ns = <40000>;
> +			opp-suspend;
> +		};
> +		opp-600000000 {
> +			opp-hz = /bits/ 64 <600000000>;
> +			opp-microvolt = <675000 675000 950000>;
> +			clock-latency-ns = <40000>;
> +		};
> +		opp-816000000 {
> +			opp-hz = /bits/ 64 <816000000>;
> +			opp-microvolt = <675000 675000 950000>;
> +			clock-latency-ns = <40000>;
> +		};
>  		opp-1008000000 {
>  			opp-hz = /bits/ 64 <1008000000>;
>  			opp-microvolt = <675000 675000 950000>;
> @@ -37,6 +53,27 @@ cluster1_opp_table: opp-table-cluster1 {
>  		compatible = "operating-points-v2";
>  		opp-shared;
>  
> +		opp-408000000 {
> +			opp-hz = /bits/ 64 <408000000>;
> +			opp-microvolt = <675000 675000 1000000>;
> +			clock-latency-ns = <40000>;
> +			opp-suspend;
> +		};
> +		opp-600000000 {
> +			opp-hz = /bits/ 64 <600000000>;
> +			opp-microvolt = <675000 675000 1000000>;
> +			clock-latency-ns = <40000>;
> +		};
> +		opp-816000000 {
> +			opp-hz = /bits/ 64 <816000000>;
> +			opp-microvolt = <675000 675000 1000000>;
> +			clock-latency-ns = <40000>;
> +		};
> +		opp-1008000000 {
> +			opp-hz = /bits/ 64 <1008000000>;
> +			opp-microvolt = <675000 675000 1000000>;
> +			clock-latency-ns = <40000>;
> +		};
>  		opp-1200000000 {
>  			opp-hz = /bits/ 64 <1200000000>;
>  			opp-microvolt = <675000 675000 1000000>;
> @@ -78,6 +115,27 @@ cluster2_opp_table: opp-table-cluster2 {
>  		compatible = "operating-points-v2";
>  		opp-shared;
>  
> +		opp-408000000 {
> +			opp-hz = /bits/ 64 <408000000>;
> +			opp-microvolt = <675000 675000 1000000>;
> +			clock-latency-ns = <40000>;
> +			opp-suspend;
> +		};
> +		opp-600000000 {
> +			opp-hz = /bits/ 64 <600000000>;
> +			opp-microvolt = <675000 675000 1000000>;
> +			clock-latency-ns = <40000>;
> +		};
> +		opp-816000000 {
> +			opp-hz = /bits/ 64 <816000000>;
> +			opp-microvolt = <675000 675000 1000000>;
> +			clock-latency-ns = <40000>;
> +		};
> +		opp-1008000000 {
> +			opp-hz = /bits/ 64 <1008000000>;
> +			opp-microvolt = <675000 675000 1000000>;
> +			clock-latency-ns = <40000>;
> +		};
>  		opp-1200000000 {
>  			opp-hz = /bits/ 64 <1200000000>;
>  			opp-microvolt = <675000 675000 1000000>;
> 




