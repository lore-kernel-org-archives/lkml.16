Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2060.outbound.protection.outlook.com [40.107.105.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0895D225783;
	Thu,  6 Feb 2025 12:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738846470; cv=fail; b=t1e/z5NfksRc1RNPvooqwTEIZoM6ZaG/o18QTrmmQ75/p8upgcznS/xAVYBiBh5YVWqta01DeXD4AH5biIfGqEPhEKYCuu7Tha+noxO88WxwKXpqfEHwszQzLt8z119NcrsEa/eSKvgQWCWtHGNYqnJrdTDM/aD75z8Ylod64HU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738846470; c=relaxed/simple;
	bh=iBGhyvPARQ8Sjf+8eeMh0puuvjkYBKiFiqTc8jNlkag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bnO6oBzITep1YrDMDnKtvADsii5Vl8SQEYgoWgcWo4cMYERGr6PU2Swc8kfjaKibD53W2bl1mCwmGLeRiE+YKYbHoVJFJgydJiv3hugFYVC3IrtT2TuHP0aMmKQM9HMBCCk5AFxGAVp8NejOuuZtUFzGLzGGgllwFeq44jHC03o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QBi/Y3n+; arc=fail smtp.client-ip=40.107.105.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QBi/Y3n+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTY6QMA0Vf/QBAMsP7AfT3A95JbAk2dO1x8NnASXRqIS06a/3bXU+bdcIzwhMR4XR0ro7cdI0YaL0nE8vJqNUXSQ7ScJhgPCE+MPli534W8+t+GpY5+eMMlXXUg7YuD0Fc7F5rKsr7S6BeQ1QqsnCVWPyVqkwyz+XntpBj6XvSLsXDLLK6+9yy4ygpT9liqX7jlkArGShi6V82JMPx30Doye4rLZ2OuFiluVRhC8s12VCKQRxP7OCWUMOSKfhlZbw/o88eYWAH4aEbvFXPG/SI9v6KuKdpOoeeHlgvpNYSeosZs6UL/gMjlADUE4LWj1SOI9Nn5OqBleDC0Hfco1uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2ib1faam+f7cL/KKrdJp3kp3jswlHeZsXEuo7diKao=;
 b=WVaebzqChWbN+vk6nznd4aYn3vGN5nPMr6bGbYsCbG19ZOcWJlioEo3i8VTTHpho42p0PLwDrIi+U9PWmtIJVzdr8vYZh1xbeKN+gkCy7rlvc0esYuNZmYs9IoYdNhRWRq2WDIukAd4fTQ3zWaFsDBJh5MouKRV3ig9GQfwKBM9fiugBybbMEhpBrOvTT4ghWEfbASP/KQO0JkZT84/NAJmrAPQXaIrJytONiOU+pbZq/LrpcYHrR4WDhFi0/hfE8dYVUJTyW8JkmZU0f/liU3J1AiWqg2+Wx534ngUYIcEpljUXP6PWJmdNsCmprkDnY8JFHpp7TJn45SftFY4vyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2ib1faam+f7cL/KKrdJp3kp3jswlHeZsXEuo7diKao=;
 b=QBi/Y3n+KPgFSasngFRxnU+bQmWsX7a62ZTHWgjAzv7Qma+LR2h4Yv99FNfPCmJ1q7azSJyfR/sb+fubX/Q+9LDDNKQA31jWVo2xtOtkzH+C93NPMhLjAepuqze1oQJ1twwU+MmZSTz25lVhWkVVZ1+wDCX+CHm8v1qhKqBOEDLwFZHY2sSHfuuKLQCdXtNMvAZjs7jbycYYzYfEzsBaRuCENHH0sNSFZoJDRcbqZA2KhRcMLnvhRqekI4asEeR7F6m2thXuD5uYXAQZRrIYTKrIshIEVR5XbEA7A6pwSyZ+ESD7rVij/qYPgHO9SrozroXIFjBFMA0SRS15mxy7zQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB6807.eurprd04.prod.outlook.com (2603:10a6:20b:104::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 12:54:20 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 12:54:20 +0000
Date: Thu, 6 Feb 2025 22:00:57 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Abel Vesa <abelvesa@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH NOT APPLY v2 4/4] clk: scmi: Support spread spectrum
Message-ID: <20250206140057.GA27490@localhost.localdomain>
References: <20250205-clk-ssc-v2-0-fa73083caa92@nxp.com>
 <20250205-clk-ssc-v2-4-fa73083caa92@nxp.com>
 <Z6SqeNsAqbZM8nr1@pluto>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6SqeNsAqbZM8nr1@pluto>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2P153CA0030.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::17)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM7PR04MB6807:EE_
X-MS-Office365-Filtering-Correlation-Id: 9228b11e-cd1c-4627-7ff1-08dd46ad5f75
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tVrHTHxo07vA3kVp9arXSy0Nn3IcXEQoQtRqFLwu+bKPBfa/yZ4WtDsBn6Ct?=
 =?us-ascii?Q?RvLNSPdDLFsC+Px8xGyzbxVvsTyv6kQPr4w2jKRdLf13v1hxTcEovPtm1ypA?=
 =?us-ascii?Q?2mFgsG4ffzY+uRXsjR5+pSqIz3ZOrWvg+OcKrfi39o2HxJ9sK97vm74T+2OQ?=
 =?us-ascii?Q?VNt1z8fOKy8Eoi+hOpxkp6KFLa4N37qYj0Q9QbP45puhI2g+/pxIl+nLL78P?=
 =?us-ascii?Q?wd8In7BccdlnrHND4dm9da+eHvQcaoNSkykvwSc5B0U41k3D7s2zNLV0AYMP?=
 =?us-ascii?Q?BC+FntH24XZ9rG8OgRKs/bxLTsReAzVcfXs7FkeXbnVg5Buab1/YvP5t0b7V?=
 =?us-ascii?Q?S866d5ZfQoG4Vub86ipCbeZrKdlotvHfkAaKdPT22Imf2qY8mcrrMNLS7j1u?=
 =?us-ascii?Q?HR3R6OfzpLscRUcw8bhUaAoEMtAj45+HVAd9vn/ESwQcnemqg2mr/tz2ZefV?=
 =?us-ascii?Q?DBxqI1Fe/wQ6AtSBY8J6Hu7vcGdKbfPI8qVjgZTtKhJLoW2+yI6cuP3P4UR7?=
 =?us-ascii?Q?DrH/2lHDZzGhnBjpiKjKq0WqmYaz22G3NNwJ/rhuargtJA5omqqnfxp7e89Z?=
 =?us-ascii?Q?VBbMUQktPNnnr453JIIKKUeP00a90/5kKA01xbKDw5kWXilqzfZ2Zd6HIeZ+?=
 =?us-ascii?Q?eWbTdGAAKEgr8RDMCAsj66NbdZQttZs+OF8kulhTgSyRuoZY3e/o02YUy4t/?=
 =?us-ascii?Q?LietQakTarNTAgq1JWNxeIBHKFbeEEU5IA7vHYTPoZgT5qnSSEgF4YEP9ERE?=
 =?us-ascii?Q?y/raPahlCIWDKzsp1UPCUlzB1Gy3bCA4spT6mse1HhIOiLQMJMa4u5/IxO5K?=
 =?us-ascii?Q?ZZ4HtGQIah9j/VWrw1CG96FFphkZQcViQF8kkwSB4dcjHRC6OgfnHOa/IHd3?=
 =?us-ascii?Q?RcG0PRQpHTTiIpMwSM0q7q4vXRxFwGuwJYTKcw3OowxrBnv0TBh/FNqxsxzn?=
 =?us-ascii?Q?HBmQnE6e8Ce7Xg579DC52ya53vHLciyEoMYpRVrIw2uztMdmyICYIH8Fej8u?=
 =?us-ascii?Q?7aAuIVHSgqHo0yK5WVjuvNR/2GCiNqbthSWMAYA3aXs8L0OhXuuU5SXFyj4f?=
 =?us-ascii?Q?NZeisDvLHpsPZ0kDzFwURC1GdhyRpip+Oou68eynrcTrbkdQ5IKTw8aOY7NI?=
 =?us-ascii?Q?NOA0MUIk3i9HyUxmldR5CfPBMIUVjKc/JnxFp3ZOZkZDWZRBpk0okxNKYZ2o?=
 =?us-ascii?Q?7uSTOpRPqIw2H9j3YWRqoqZDpb9FOvKNCfhde9wO/2FW3odRNsuntO0HaCH7?=
 =?us-ascii?Q?2C6cYtQd1aY6XJ5rNUwkxIcNhi+WOhLfDFSjSSqt1JWAD5x03Tuhql967+zY?=
 =?us-ascii?Q?UaDftolY+4K2LbyAOnx49D+YHF3zS5LdC6oSRHIcsN+wLcu8lJGvQEMAR3HI?=
 =?us-ascii?Q?lH5GXHuge6gs6XW6xjjw2lYfa5OA39AcaMM6n0xD20aRKkZHJf6E3pwQCdCd?=
 =?us-ascii?Q?pW10Az++7ShBsAb3i2MJ8VtFAlfL+lqF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kJ6v8j5e06KDsyk3vhOoPb42FTFKbpqsf2cD6N2uzRR1fmnzmVxODmCIhlEY?=
 =?us-ascii?Q?+CJnNqHPgswoP0UuEiuIgD1csp6xeJeUqKPbeYsVEl7zfOU5EXr3UEQmwi6l?=
 =?us-ascii?Q?QKNMwnk1miPmAAaoUpXxBZqVtAe4ymI7MnAKJ8J702tGnqzrvCeASswt0EIR?=
 =?us-ascii?Q?VMODk6bZ1F061lAeQwlz5w89sXJyR16u8Y6f9pURMiAwCoHfAqCcdW+N6Scq?=
 =?us-ascii?Q?/2LciSUjwqFEK+bfqRUGnc9cYYLwbQT04O5zDkOXU7gkWmdvChTvT0SxqiyN?=
 =?us-ascii?Q?Zc7lTeynKSxws3Es8ABjV+nmMRkOAFHtTSOvqvWR/VY/fcEa3G2bJlUtugWS?=
 =?us-ascii?Q?3letLR1c9oRCQCwNzdggTFuOSuHiWcwT4muJ8a6i4Zsv+4ln/xw7Sv5GuXw8?=
 =?us-ascii?Q?h7UnLgPBVdBN0XUNFMjJehnXemD7PTugdKLg5zs1PAU7nSeF1KhlgM1y3/cc?=
 =?us-ascii?Q?jaofipgVuppZGIwGmp9YZsM1HdbKpgQvkca0D1V7C/b4nnnh0xS0cOztWE3A?=
 =?us-ascii?Q?/jZViGirlaphVaHeqAHFLcjuIwVav5wRIzBfGCvHVbGGpuITaj6luHmPm2C3?=
 =?us-ascii?Q?gyIN8+Ruet4eqaPnNJmCi6N2Jt6JvrRWeCduggPYZLuc4A8IS7ekAtTruKB9?=
 =?us-ascii?Q?c8nxzXXVQ1tDBLweCncd8X6icsuP1TdFJVj2488paFiUQ1KGkUzkXqIyAIF+?=
 =?us-ascii?Q?gKlZrZyMMFq3opND4Je0Wu6CEMJEuhGAPtSRiT25rRblyjqr0Ed6Md4OQCHY?=
 =?us-ascii?Q?imjc50Xfez6xkLSvBu+6oNovffAD+3UBClR4MUq0R3YmxnrjxmFsChLiFxRk?=
 =?us-ascii?Q?FVFFUWpkxjPbAd1flaOZ63npvVqLBNb/oP7RnnQFJLIRpPwQhChmft/Z+ua2?=
 =?us-ascii?Q?qgQunn4lPYIxlj0MH9jNJdh2VC33xsLsXzxsLw4+RVAoAli/JY6XLqWe7pn3?=
 =?us-ascii?Q?0qLurbwhqthffii1i3tu5pJWiiQTVTrdckr9PHxR7VNCsjFCG/QddqjSdHa+?=
 =?us-ascii?Q?F32iC0Tc3Tt+5FnOljVGWHrKxowtjKadHPM3VJK0gd3lLVyrbRJ0DjxCE3jK?=
 =?us-ascii?Q?Xl72wy3RRTS4E5+Zq83xTvpm2srhM9j52Z93HBzdr1AIn6iBesVd++H5Oz5f?=
 =?us-ascii?Q?YZ81vGcwfPl1/lo4oMdOHB+q5g444ixGYBLVPL8Ms/vlAssC4NcQCjRq5L0M?=
 =?us-ascii?Q?f94MTNn/Y/SfV3lBlBJMav476eshXmMytnYMH+lCxd0SFGa3mCZCMQGlGTQz?=
 =?us-ascii?Q?rh4IhodCeZDAQCdlXjB9E9hdBmc47qzNg91nI/FrpCag1eQ7Rd027mFV+PuX?=
 =?us-ascii?Q?jPhCOOXItxAqvsFVag7FVzoQ0PFhXvE9qjMIDO6loMXeq1hAxFB5agofJp4Y?=
 =?us-ascii?Q?n79jxHly3WgzhGa6+E0OcPWO+S2z8Sq+0OsKYkJTbTZfqaL9ilHTkPw1SPZA?=
 =?us-ascii?Q?JOMBG8weYvvekRKsZgQxBZhdQNxDI62Ccr4yhsKqnrOcZnlTr2b8SHutzIuw?=
 =?us-ascii?Q?hSWqNPeefXySxFsePx79WsSjAiOIoimROrxiWbmA/7fbgtEyhGwqdNt5YazG?=
 =?us-ascii?Q?jz4esWsyvY2LR2snXn+UZ3TVRu4svIZ8PJ7+Kus/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9228b11e-cd1c-4627-7ff1-08dd46ad5f75
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 12:54:20.4020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0YDF851xZqdc1lqVmDAHuI6F7Wg75EFI/oryiDnnOYr/myNdbfDEVzoiljj63Bqipjka3/fbEdvg/uT7DlD4EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6807

On Thu, Feb 06, 2025 at 12:26:32PM +0000, Cristian Marussi wrote:
>On Wed, Feb 05, 2025 at 05:49:54PM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> Support Spread Spectrum with adding scmi_clk_set_spread_spectrum
>> 
>
>Hi,
>
>I forwarded ATG with our latest exchange on the possibility of using a
>standard OEM type instead of Vendor one if it is general enough....
>
>...waiting for their feedback on this before reviewing further...BUT
>just one comment down below
>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  drivers/clk/clk-scmi.c        | 47 +++++++++++++++++++++++++++++++++++++++++--
>>  include/linux/scmi_protocol.h |  6 ++++++
>>  2 files changed, 51 insertions(+), 2 deletions(-)
>> 
>>  		feats_key |= BIT(SCMI_CLK_PARENT_CTRL_SUPPORTED);
>>  
>> -	if (ci->extended_config)
>> -		feats_key |= BIT(SCMI_CLK_DUTY_CYCLE_SUPPORTED);
>> +	if (ci->extended_config) {
>> +		if (of_machine_compatible_match(scmi_clk_imxlist))
>
>... please NOT this also here if we use a standard OEM type :D..if it
>won't be a vendor thing anymore, you should query with CONFIG_GET, OR we
>should think also about adding some way in the spec to query the support
>for extended configs like we do for other clock features...

I see, and I marked the title as NOT APPLY. CONFIG_GET would be heavy
for each clock. The clock attributes is better to send back what OEM type
is supported, not just a single OEM extension flag.

I posted out v2 mainly for "assigned-clock-sscs" changes, and not block
i.MX8M family spread spectrum patchset.
Also I hope patch [1,2] could got R-b or A-b from Maintainers. Then in NXP
downstream, I could pick patch [1,2] and do downstream implementation
for patch 4.

Thanks,
Peng.
>
>Thanks,
>Cristian
