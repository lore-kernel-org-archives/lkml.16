Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F79A232367;
	Tue, 17 Jun 2025 12:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163548; cv=none; b=D1NsDSls4xbltd6ssv92BAq2fdVtfLxAJJXBc50m71gUOV9uRsNXE6RVFVYtS1kT5BsDTKh9r/e9d/fEH5UBBza8lCkAOOtLkc5OJx6M4SzBmn6BococKsY9AxrqjpI0h1g0nMLg06b7ZWsUrU56mN3Oa2X6bhQZXj0gbblUH2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163548; c=relaxed/simple;
	bh=O110FrdcInpzBMuMy6Lt2c3gYwH5SZpoT2eQ/FzXveQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Fo1w/kcUzoHDUd+g4KpGRf9ooqKowsuVUzMCNG5CnxUBHZz7J5fxakHusff7MNdsbToHFMX3R3BaxMVyuvF9CwgXnLr+PWwIZpksrJWO+QDqwyXyhXlS7pL9wzkmEWdsGjT5gSqFZHOgJ+8cMRGmhweeBcIPhSuONE4CFZfGV04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=BOalRmC/; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="BOalRmC/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750163546; x=1781699546;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=O110FrdcInpzBMuMy6Lt2c3gYwH5SZpoT2eQ/FzXveQ=;
  b=BOalRmC/U303TGHapbj1CpCn2mNbNMt8gBfWkrlau/1SETqytPI8CuXc
   oLqzSCUTQyjVgUYJ84X8sc2q3UQvgm8t+VjtIFGtG1ZEyCCGci+MX+nTH
   lgDQmj2B+HUMuLd9/6omzbwl0uLkZxKEghQUXRp0Ur1CGRDSpNmspxMDP
   LGfXIiCcikz1+j1Ds2gn8WcHnIy8Vq8YN0WXBqogjCYfBJDpMas8OEDQG
   qDkNvL2XopQgQNQ7J2nzA7PgEq9oyl8+Waw3PuS9CqZp5aC0z51V80ten
   qaOxa5fqoIxh8FCNJfT0KEhEFYP/G2AxSpN19ErDeKPcYCut6X28+t3ju
   g==;
X-CSE-ConnectionGUID: ko567VBqSpWsKe4i2Dg+zQ==
X-CSE-MsgGUID: EObWo+FlRVO7IFxEzXwz2Q==
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="210375829"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Jun 2025 05:32:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Jun 2025 05:31:40 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 17 Jun 2025 05:31:38 -0700
Message-ID: <cb110632-435f-4126-bd4b-5b914004fdc0@microchip.com>
Date: Tue, 17 Jun 2025 14:31:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: microchip: sama7d65: Add cache
 configuration for cpu node
To: Mihai Sain <mihai.sain@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250617104703.45395-1-mihai.sain@microchip.com>
 <20250617104703.45395-2-mihai.sain@microchip.com>
Content-Language: en-US, fr
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20250617104703.45395-2-mihai.sain@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Mihai,

On 17/06/2025 at 12:47, Mihai Sain wrote:
> Describe the cache memories according with datasheet chapter 15.2:
> - L1 cache configuration with 32KB for both data and instruction cache.
> - L2 cache configuration with 256KB unified cache.
> 
> Before this patch:
> [    0.161955] cacheinfo: Unable to detect cache hierarchy for CPU 0
> 
> After this patch:
> [root@sama7d65eb ~]$ ll -h /sys/bus/cpu/devices/cpu0/of_node/l1-cache
> -r--r--r-- 1 root root 4 Jun 17 11:39 cache-level
> -r--r--r-- 1 root root 0 Jun 17 11:39 cache-unified

Nope.

> -r--r--r-- 1 root root 6 Jun 17 11:39 compatible
> -r--r--r-- 1 root root 4 Jun 17 11:39 d-cache-size
> -r--r--r-- 1 root root 4 Jun 17 11:39 i-cache-size
> -r--r--r-- 1 root root 9 Jun 17 11:39 name
> -r--r--r-- 1 root root 4 Jun 17 11:39 next-level-cache
> -r--r--r-- 1 root root 4 Jun 17 11:39 phandle
> 
> [root@sama7d65eb ~]$ ll -h /sys/bus/cpu/devices/cpu0/of_node/l2-cache
> -r--r--r-- 1 root root 4 Jun 17 11:39 cache-level
> -r--r--r-- 1 root root 4 Jun 17 11:39 cache-size
> -r--r--r-- 1 root root 0 Jun 17 11:39 cache-unified
> -r--r--r-- 1 root root 6 Jun 17 11:39 compatible
> -r--r--r-- 1 root root 9 Jun 17 11:39 name
> -r--r--r-- 1 root root 4 Jun 17 11:39 phandle
> 
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
> ---
>   arch/arm/boot/dts/microchip/sama7d65.dtsi | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> index d08d773b1cc5..951d7af3ad1c 100644
> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -32,6 +32,23 @@ cpu0: cpu@0 {
>   			device_type = "cpu";
>   			clocks = <&pmc PMC_TYPE_CORE PMC_CPUPLL>;
>   			clock-names = "cpu";
> +			next-level-cache = <&L1>;
> +
> +			L1: l1-cache {
> +				compatible = "cache";
> +				cache-level = <1>;
> +				d-cache-size = <32768>;
> +				i-cache-size = <32768>;
> +				cache-unified;

I don't think unified applied to L1 cache for C-A7.

Regards,
   Nicolas

> +				next-level-cache = <&L2>;
> +			};
> +
> +			L2: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +				cache-size = <262144>;
> +				cache-unified;
> +			};
>   		};
>   	};
>   

