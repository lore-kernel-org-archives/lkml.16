Received: from fr2000.dnsiaas.com (fr2000.dnsiaas.com [151.106.4.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B3318DB20;
	Thu,  3 Apr 2025 09:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=151.106.4.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743673286; cv=none; b=mMUUgsM0JvPLxJzTFv3wdFMq3xODFVKEab3byBQ6y3Rx03psztQcbtRSvZLDHVjcNrnz/dsad2oqix1pJlfrEnOTZHE5gC3W8bPvC9o/NJANLheGp/0GYNMU2Ivjv/zp5GuX9YLjN3rz3ZrLuFiCX2hKO3dOni9ybJTWQbs4Sy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743673286; c=relaxed/simple;
	bh=xm5zdMui2gSYgwEe7Tbt1dCiruX8ryyU2HoHSK2PPgM=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=RXsEXcneM/KN++DIZQlzOFM32p3xopgE+1ku6Rzi3pNPXaNgimAxpL4zVDd7QkGg8HAimbfOWGmiJaMj1eO/n4oYtmNjt7TzU4l43x1CZfJXoFmVdp2XQ8r/ViJ1PIMlpz10oTzqR/CaeOCBC1zgCyaqoH4vy4iUoQrLmRIopJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me; spf=pass smtp.mailfrom=superkali.me; dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b=B0wBVPV+; arc=none smtp.client-ip=151.106.4.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=superkali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b="B0wBVPV+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CZ8+R8XT4dcdN/GHerXPS2K4xGlT84hC1felE/LCgYs=; b=B0wBVPV+hgcSEQc4WDIGgIvPB9
	RBtxye5wu4EsB7p+rWJZgMWtXVa3VYBLb8vW1fE8ApS7/A3hWVAhPVRBvcxFWUJ47Q4SLRwU/fO1V
	V3bFz4rUJJuio0BjsF2q0+f53CRKA4md5KYLKjkxrDRdxpx+irvTxUt/dVxJ+Lw2jq8sZcjn+2pe0
	6mEB2G8SaUmJJu/XycKh/PEKUtACf8eZPzpBjDTGMS/dJWGK1b8mwu8v8QzE4t/FBIrB7Ip/pyz3o
	sVjHWV8vZmYFU353pcU/eAvtof169bhxPva5Cb791sqSI633xv81Miz3GMqQzQG4g2DQskQC/pUnx
	00OwYYjA==;
Received: from [127.0.0.1] (port=56532 helo=fr2000.dnsiaas.com)
	by fr2000.dnsiaas.com with esmtpa (Exim 4.98.1)
	(envelope-from <hello@superkali.me>)
	id 1u0H4a-00000000drV-3EUC;
	Thu, 03 Apr 2025 11:41:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 03 Apr 2025 11:41:14 +0200
From: Daniele Briguglio <hello@superkali.me>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alchark@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniele Briguglio
 <daniele.briguglio@icloud.com>
Subject: Re: [PATCH] rockchip: dts: rk3588: add missing OPP nodes for lower
 frequencies
Reply-To: hello@superkali.me
Mail-Reply-To: hello@superkali.me
In-Reply-To: <2652016.Lt9SDvczpP@diego>
References: <20250403091840.3349637-1-hello@superkali.me>
 <2652016.Lt9SDvczpP@diego>
User-Agent: Roundcube Webmail/1.6.9
Message-ID: <a5bc7892ec9f84793db560b81cdb21bc@superkali.me>
X-Sender: hello@superkali.me
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - fr2000.dnsiaas.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - superkali.me
X-Get-Message-Sender-Via: fr2000.dnsiaas.com: authenticated_id: hello@superkali.me
X-Authenticated-Sender: fr2000.dnsiaas.com: hello@superkali.me
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi Heiko,

Thank you for your feedback. I misunderstood how power savings work in 
CPUs - I incorrectly assumed that simply reducing the frequency would 
save significant energy, even without reducing voltage. I now understand 
why that's not the case.

My main purpose in adding these OPP nodes was to allow the system to 
operate at lower frequencies like 408MHz, 600MHz, and 816MHz, which are 
currently unavailable. I thought this would improve energy efficiency, 
but I see now that keeping the same voltage (675mV) while only lowering 
frequency won't achieve meaningful power savings.

Do you have any guidance on lower voltage values that might be safe and 
stable for these lower frequencies on the RK3588? I've seen some 
overlays that maintain 675mV as the minimum even for lower frequencies, 
but if there are tested lower voltages available, I'd be happy to 
include those in an updated version of the patch.

Thanks,
Daniele

On 03/04/2025 11:24, Heiko Stübner wrote:
> Hi,
> 
> Am Donnerstag, 3. April 2025, 11:18:40 MESZ schrieb Daniele Briguglio:
>> From: Daniele Briguglio <daniele.briguglio@icloud.com>
>> 
>> This Patch adds missing Operating Performance Point (OPP) nodes for 
>> lower
>> frequencies to the RK3588 device tree. These additions improve power
>> management by enabling the CPU clusters to scale down to lower
>> frequencies when under light loads, which should improve energy
>> efficiency and reduce power consumption.
>> 
>> The changes add OPP nodes for 408MHz, 600MHz, 816MHz, and 1008MHz
>> (for cluster1 and cluster2 only, as cluster0 already had 1008MHz)
>> with appropriate voltage settings across all three CPU clusters in
>> the RK3588 SoC.
> 
> the general consensus is that you don't save energy when you're not
> reducing the voltage together with the frequency.
> 
> For example cluster0 @1GHz runs at 675mV already, so reducing just the
> frequency, when you're not allowed to reduce the voltage with it won't
> save energy, just make things slow.
> 
> 
> Heiko
> 
>> Signed-off-by: Daniele Briguglio <hello@superkali.me>
>> ---
>>  arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi | 58 
>> ++++++++++++++++++++
>>  1 file changed, 58 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi 
>> b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
>> index 0f1a77697351..1b018823d5d3 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
>> @@ -5,6 +5,22 @@ cluster0_opp_table: opp-table-cluster0 {
>>  		compatible = "operating-points-v2";
>>  		opp-shared;
>> 
>> +		opp-408000000 {
>> +			opp-hz = /bits/ 64 <408000000>;
>> +			opp-microvolt = <675000 675000 950000>;
>> +			clock-latency-ns = <40000>;
>> +			opp-suspend;
>> +		};
>> +		opp-600000000 {
>> +			opp-hz = /bits/ 64 <600000000>;
>> +			opp-microvolt = <675000 675000 950000>;
>> +			clock-latency-ns = <40000>;
>> +		};
>> +		opp-816000000 {
>> +			opp-hz = /bits/ 64 <816000000>;
>> +			opp-microvolt = <675000 675000 950000>;
>> +			clock-latency-ns = <40000>;
>> +		};
>>  		opp-1008000000 {
>>  			opp-hz = /bits/ 64 <1008000000>;
>>  			opp-microvolt = <675000 675000 950000>;
>> @@ -37,6 +53,27 @@ cluster1_opp_table: opp-table-cluster1 {
>>  		compatible = "operating-points-v2";
>>  		opp-shared;
>> 
>> +		opp-408000000 {
>> +			opp-hz = /bits/ 64 <408000000>;
>> +			opp-microvolt = <675000 675000 1000000>;
>> +			clock-latency-ns = <40000>;
>> +			opp-suspend;
>> +		};
>> +		opp-600000000 {
>> +			opp-hz = /bits/ 64 <600000000>;
>> +			opp-microvolt = <675000 675000 1000000>;
>> +			clock-latency-ns = <40000>;
>> +		};
>> +		opp-816000000 {
>> +			opp-hz = /bits/ 64 <816000000>;
>> +			opp-microvolt = <675000 675000 1000000>;
>> +			clock-latency-ns = <40000>;
>> +		};
>> +		opp-1008000000 {
>> +			opp-hz = /bits/ 64 <1008000000>;
>> +			opp-microvolt = <675000 675000 1000000>;
>> +			clock-latency-ns = <40000>;
>> +		};
>>  		opp-1200000000 {
>>  			opp-hz = /bits/ 64 <1200000000>;
>>  			opp-microvolt = <675000 675000 1000000>;
>> @@ -78,6 +115,27 @@ cluster2_opp_table: opp-table-cluster2 {
>>  		compatible = "operating-points-v2";
>>  		opp-shared;
>> 
>> +		opp-408000000 {
>> +			opp-hz = /bits/ 64 <408000000>;
>> +			opp-microvolt = <675000 675000 1000000>;
>> +			clock-latency-ns = <40000>;
>> +			opp-suspend;
>> +		};
>> +		opp-600000000 {
>> +			opp-hz = /bits/ 64 <600000000>;
>> +			opp-microvolt = <675000 675000 1000000>;
>> +			clock-latency-ns = <40000>;
>> +		};
>> +		opp-816000000 {
>> +			opp-hz = /bits/ 64 <816000000>;
>> +			opp-microvolt = <675000 675000 1000000>;
>> +			clock-latency-ns = <40000>;
>> +		};
>> +		opp-1008000000 {
>> +			opp-hz = /bits/ 64 <1008000000>;
>> +			opp-microvolt = <675000 675000 1000000>;
>> +			clock-latency-ns = <40000>;
>> +		};
>>  		opp-1200000000 {
>>  			opp-hz = /bits/ 64 <1200000000>;
>>  			opp-microvolt = <675000 675000 1000000>;
>> 
