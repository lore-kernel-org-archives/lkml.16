Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92AE155757;
	Mon,  7 Jul 2025 06:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751868158; cv=none; b=HFYJvPCHVmtNn796RV+libaAKpQTml7qOfH8N+jft6t4yyKCp7TG9CtXoyEoGbCMjmR0VD0QrSWSFk/SxCc50pkUk8I6AFO0prygbhJCXsxEUAP5M9ytms3atATGhBSNUgXLK7lBNUprB8Ou7scuY3E9ChKHXgwCMKkPCkxk1SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751868158; c=relaxed/simple;
	bh=YL+ooIAMYR8hRPyLgX+JY65z6/DecaHd9aqpI/iumes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y4FGouBiw4/v7XIlPOsxz/ahn6SfFSVcWSPv3iHlnQ02uH7ug078WSpOTqFuZemNOW4vrcJAnSg28TrXYTNgGO8wfEO/fmQv2KN2XBIL0JHuJZXxKO5JvNZh2/XYHOT6SROrNI26upaUDvPs64AIGb1SqZJZVoUjBAui8ErEqHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from [89.212.21.243] (port=40646 helo=[192.168.69.116])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uYdjt-00DAtb-28;
	Mon, 07 Jul 2025 06:46:00 +0200
Message-ID: <5842ba39-23e0-4dcc-856a-dcd0d30d446e@norik.com>
Date: Mon, 7 Jul 2025 06:45:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: imx93-phycore-som: Add RPMsg overlay
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20250619063954.1730231-1-primoz.fiser@norik.com>
 <20250619063954.1730231-2-primoz.fiser@norik.com> <aGtAqi7JWbF5F-31@dragon>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <aGtAqi7JWbF5F-31@dragon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi Shawn,

On 7. 07. 25 05:36, Shawn Guo wrote:
> On Thu, Jun 19, 2025 at 08:39:51AM +0200, Primoz Fiser wrote:
>> Add an overlay used for remote processor inter-core communication
>> between A55 and M33 cores on the phyCORE-i.MX93 SoM based boards.
>>
>> Overlay adds the required reserved memory regions and enables the
>> mailbox unit and the M33 core for RPMsg (Remote Processor Messaging
>> Framework).
>>
>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
>> ---
>>  arch/arm64/boot/dts/freescale/Makefile        |  4 ++
>>  .../dts/freescale/imx93-phycore-rpmsg.dtso    | 60 +++++++++++++++++++
>>  2 files changed, 64 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso
>>
>> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
>> index 0b473a23d120..08a1de299538 100644
>> --- a/arch/arm64/boot/dts/freescale/Makefile
>> +++ b/arch/arm64/boot/dts/freescale/Makefile
>> @@ -324,6 +324,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
>> +
>> +imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
>> +dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
>> +
>>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
>>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso
>> new file mode 100644
>> index 000000000000..9200113c9ec3
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso
>> @@ -0,0 +1,60 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
>> + * Author: Primoz Fiser <primoz.fiser@norik.com>
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +&{/} {
>> +	reserved-memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +
>> +		vdev0vring0: vdev0vring0@a4000000 {
>> +			reg = <0 0xa4000000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		vdev0vring1: vdev0vring1@a4008000 {
>> +			reg = <0 0xa4008000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		vdev1vring0: vdev1vring0@a4010000 {
>> +			reg = <0 0xa4010000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		vdev1vring1: vdev1vring1@a4018000 {
>> +			reg = <0 0xa4018000 0 0x8000>;
>> +			no-map;
>> +		};
>> +
>> +		rsc_table: rsc-table@2021e000 {
> 
> Can we sort the node in order of unit-address?

Sure. I will move rsc_table to the top in v2.

BR,
Primoz

> 
> Shawn
> 
>> +			reg = <0 0x2021e000 0 0x1000>;
>> +			no-map;
>> +		};
>> +
>> +		vdevbuffer: vdevbuffer@a4020000 {
>> +			compatible = "shared-dma-pool";
>> +			reg = <0 0xa4020000 0 0x100000>;
>> +			no-map;
>> +		};
>> +	};
>> +};
>> +
>> +&cm33 {
>> +	mbox-names = "tx", "rx", "rxdb";
>> +	mboxes = <&mu1 0 1>,
>> +		 <&mu1 1 1>,
>> +		 <&mu1 3 1>;
>> +	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
>> +		 <&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
>> +	status = "okay";
>> +};
>> +
>> +&mu1 {
>> +	status = "okay";
>> +};
>> -- 
>> 2.34.1
>>
> 

-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com
