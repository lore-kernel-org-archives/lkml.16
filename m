Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7E217548;
	Wed,  4 Jun 2025 18:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749062305; cv=pass; b=gHK0ih45D3diTiRjnI5vsvJVJAcr6u9cRSSdNQOETv/7iXZ87f7bCsbEXh6OeuGfXlcXzY7nyXbd0i8FDEYyQPffgAP4BcIz286BehgnvA36+vXaYdM3pAiJ7k+ve30X1hpsmQWrXTqmi7jKZF8T8A7BJnw0JrqkfQ6B0MTbBBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749062305; c=relaxed/simple;
	bh=0E7gJuunXtlZQrr+exe7Vou5iv/2kdQNcOYMNM2bCik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nxho2hL6PS1hUNz0l7TmmhZENvNuG2jMPmQ5zo3Apcciq1Nk6kJ4Tv/h4thjMe48di1bMgvdsLzjnZzxTy8VgWi0tvLncuoxSWDqopV7LuL8iAv9BFFlcIJsyLw1JJP2bm0c4AaITB7pifNG7azm4wK7jllHpp8Sulkh8j7gWIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=lFCXOENq; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="lFCXOENq"
ARC-Seal: i=1; a=rsa-sha256; t=1749062290; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XpxOfDMkMTehlhbi+CGReSWqqUMLkmJnUczaQxUGlmri2hdiu3/hj2DnzxJAbaMW7Gj2P9oRvLjx1biYSoxpV0WcPjNQZHTZJdSodzQboRPeyBb1iq4+y7IDIA/jC9RV4TlFhJXLFFcofKaBRw1xu0Zgk+o/AC2HzvhqW5fjdaU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749062290; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GgYGEkJt3VCybdxa1+YIDFMAdYlcqDVQpOv3hqdiLPM=; 
	b=iHBThtcll7E39v7NeNOx45NsPxRMeGolvpLc9IdPQP5E0PCtiEEO17hMMFlxvfWuc60U81RpSmcUTt/6kyKTT758/EE0x0AQx46u3k7Qi0vaMUmdB6FImW1Fu8R8SIDVayVlOi7bKLU7y92ugGUhEvkQyGj0zbUjqpK0HgT4Cv8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749062290;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=GgYGEkJt3VCybdxa1+YIDFMAdYlcqDVQpOv3hqdiLPM=;
	b=lFCXOENqlwkxoQjE2Q9bGDzFbMvHdKtwOBOlg53icWk8zBnj6ibTxwrIaTbZsrxq
	RVBFVughZgUbhFNYqNfjHr/fVrIN+Ib+q/tmu8mBHQpb+BHBiY52Un7xwOmnzII7oIz
	1NABwjHc+h3GFQdT+itsOmMDXN/5/Src+i54Sg+Y=
Received: by mx.zohomail.com with SMTPS id 1749062288242553.3001727608961;
	Wed, 4 Jun 2025 11:38:08 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexey Charkov <alchark@gmail.com>
Subject:
 Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
Date: Wed, 04 Jun 2025 20:38:03 +0200
Message-ID: <6656934.DvuYhMxLoT@workhorse>
In-Reply-To: <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com>
References:
 <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Tuesday, 3 June 2025 19:01:13 Central European Summer Time Alexey Charkov wrote:
> List both CPU supply regulators which drive the little and big CPU
> clusters, respectively, so that cpufreq can pick them up.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> index b09e789c75c47fec7cf7e9810ab0dcca32d9404a..d9c129be55a0d997e04e6d677cdc98fb50353418 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> @@ -207,6 +207,22 @@ vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
>  	};
>  };
>  
> +&cpu_b0 {
> +	cpu-supply = <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b1 {
> +	cpu-supply = <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b2 {
> +	cpu-supply = <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b3 {
> +	cpu-supply = <&vdd_cpu_big_s0>;
> +};
> +
>  &combphy0_ps {
>  	status = "okay";
>  };
> @@ -215,6 +231,18 @@ &cpu_l0 {
>  	cpu-supply = <&vdd_cpu_lit_s0>;
>  };
>  
> +&cpu_l1 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l2 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l3 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
>  &gmac0 {
>  	phy-mode = "rgmii-id";
>  	clock_in_out = "output";
> 
> 

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

> so that cpufreq can pick them up.

Fwiw, even without this patch they're picked up by cpufreq-dt for me:

    user@trixie:~$ sudo cpupower frequency-info 
      analyzing CPU 5:
      driver: cpufreq-dt
      CPUs which run at the same hardware frequency: 4 5 6 7
      CPUs which need to have their frequency coordinated by software: 4 5 6 7
      maximum transition latency: 40.0 us
      hardware limits: 408 MHz - 2.30 GHz
      available frequency steps:  408 MHz, 600 MHz, 816 MHz, 1.01 GHz, 1.20 GHz, 1.42 GHz, 1.61 GHz, 1.80 GHz, 2.02 GHz, 2.21 GHz, 2.30 GHz
      available cpufreq governors: ondemand userspace performance schedutil
      current policy: frequency should be within 408 MHz and 2.30 GHz.
                      The governor "schedutil" may decide which speed to use
                      within this range.
      current CPU frequency: 1.61 GHz (asserted by call to hardware)
    user@trixie:~$ uname -a
    Linux trixie 6.15.0-11173-g546b1c9e93c2 #2 SMP PREEMPT Wed Jun  4 20:32:52 CEST 2025 aarch64 GNU/Linux

this is more correct though of course.

Kind regards,
Nicolas Frattaroli


